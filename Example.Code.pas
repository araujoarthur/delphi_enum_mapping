unit Example.Code;

interface
uses VCL.Dialogs, System.SysUtils, System.Classes, System.Generics.Collections, System.Rtti, System.Typinfo;
type

  MappingAttribute = class(TCustomAttribute)
  private
    FValue: String;
  public
    constructor Create(AValue: String);
    property Value: string read FValue;
  end;

  [
    MappingAttribute('VOLKSWAGEN'),
    MappingAttribute('GENERAL MOTORS'),
    MappingAttribute('FORD MOTORS'),
    MappingAttribute('RENAULT'),
    MappingAttribute('BAYERISCHE MOTOREN WERKE')
    
  ]
  EnumCars = (
    ecVolkswagen,
    ecChevrolet,
    ecFord,
    ecRenault,
    ecBMW
  );

  TEnumMapping = class
  public
    class function EnumToString<T>(Value: T): String; static;
    class function StringToEnum<T>(Value: String): T; static;
  end;


implementation

uses Example.Forms.Main;

{ MappingAttribute }

constructor MappingAttribute.Create(AValue: String);
begin
  FValue := AValue;
end;

{ TEnumMapping }

class function TEnumMapping.EnumToString<T>(Value: T): String;
var
  Ctx: TRTTIContext;
  RTTIType: TRTTIType;
  RTTIEnumType: TRTTIEnumerationType;
  GenericValue: TValue;
  OrdValue: Int64;
begin
  Ctx := TRTTIContext.Create();
  try
    RTTIType := Ctx.GetType(TypeInfo(T));

    // Ensures there's Runtime Type Information
    if RTTIType = nil then
      raise Exception.Create('The type has no Runtime Type Information');

    // Ensures the type in question is an Enumeration
    if RTTIType.TypeKind <> tkEnumeration then
      raise Exception.CreateFmt('Type %s is not an enumeration', [RttiType.Name]);

    // Create a TValue and tries to get it as ordinal. If it fails, raises an exception
    GenericValue := TValue.From<T>(Value);
    if not GenericValue.TryAsOrdinal(OrdValue) then
      raise Exception.Create('Could not cast generic value to ordinal');

    // We already know it's a enumeration type so the following type cast is safe.
    // We need it to access the Max and Min values.
    RTTIEnumType := TRTTIEnumerationType(RTTIType);
    if (OrdValue > RTTIEnumType.MaxValue) or (OrdValue < RTTIEnumType.MinValue) then
      raise Exception.CreateFmt('%d has no valid enum name for %s', [OrdValue, RTTIType.Name]);

    // Checks if the amount of attributes is at least the ordinal value of the enumerated type and
    // the ammount of attributes and elements are the same.
    var LenStore: Integer := Length(RTTIEnumType.GetAttributes);
    if (LenStore = 0) or 
       (LenStore - 1 <> RTTIEnumType.MaxValue) then
      raise Exception.CreateFmt('RTTI Mapping in %s is badly formated.', [RTTIEnumType.Name]);
      
    exit(MappingAttribute(RTTIEnumType.GetAttributes()[OrdValue]).Value);
  finally
    Ctx.Free();
  end;
end;

class function TEnumMapping.StringToEnum<T>(Value: String): T;
var
  Ctx: TRTTIContext;
  RTTIType: TRTTIType;
begin
  Ctx := TRTTIContext.Create();
  try
    RTTIType := Ctx.GetType(TypeInfo(T));

    // Raises an exception if the type has no RTTI.
    if RTTIType = nil then
      raise Exception.Create('The type is has no runtime information');

    // Raises an exception if the type is not an Enum.
    if (RTTIType.TypeKind <> tkEnumeration) then
      raise Exception.Create('The type is not an enumeration');

    FillChar(Result, SizeOf(Result), 0);

    var ItemCount, AttrCount: Integer;
    ItemCount := Length(TRTTIEnumerationType(RTTIType).GetNames());
    AttrCount := Length(RTTIType.GetAttributes());

    if (AttrCount <> ItemCount) then
      raise Exception.CreateFmt('RTTI Mapping in %s is badly formated.', [RTTIType.Name]);

    var Index: Integer := 0;
    var Found: Boolean := False;
    for var Attr: TCustomAttribute in RTTIType.GetAttributes do
    begin
      if Attr is MappingAttribute then
      begin
        Found := MappingAttribute(Attr).Value = Value;
        if Found then 
          break;
        Inc(Index);
      end;
    end;

    if not Found then
      raise Exception.CreateFmt('No match for %s on %s', [Value, RTTIType.Name]);

    PByte(@Result)^ := Index;
    Exit(Result);
  finally
   Ctx.Free();
  end;
end;

end.
