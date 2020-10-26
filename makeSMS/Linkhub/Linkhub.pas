(*
*=================================================================================
* Unit for develop interoperation with Linkhub APIs.
* Functionalities are authentication for Linkhub api products, and to support
* several base infomation(ex. Remain point).

* For strongly secured communications, this module uses SSL/TLS with OpenSSL.
*
* http://www.linkhub.co.kr
* Author : Kim Seongjun (pallet027@gmail.com)
* Contributor : Jeong Yohan
* Written : 2014-03-22
* Updated : 2017-12-28
*
* Update Log
* - (2016-10-28) : added Double Byte Code System Character delimiter function on EscapeString()
* - (2016-12-20) : added VersionInfo for Delphi 10.1 berlin
* - (2017-03-08) : HTTP OleObject Exception Handling
* - (2017-04-18) : fixed Double BackSlash String Parse bug
* - (2017-08-29) : GetPartnerURL API added
* - (2017-12-28) : fixed Compile Directive for Update version 
*=================================================================================
*)
{$IFDEF FPC}
  {$MODE DELPHI}
{$ENDIF}
{$Q-}
{$R-}
{$H+}

//old Delphi does not have MSWINDOWS define.
{$IFDEF WIN32}
  {$IFNDEF MSWINDOWS}
    {$DEFINE MSWINDOWS}
  {$ENDIF}
{$ENDIF}

unit Linkhub;

interface

uses
  Windows, SysUtils, Classes,ComObj,ActiveX;

{$DEFINE HAS_ENCODING}

{$IFDEF VER130}
{$UNDEF HAS_ENCODING}
{$ENDIF}

{$IFDEF CONDITIONALEXPRESSIONS}
  {$IF System.CompilerVersion >= 24.0}
    {$LEGACYIFEND ON}
    {$DEFINE COMPILER15_UP}
  {$IFEND}
  {$IF System.CompilerVersion <= 19.0 }
    {$IF System.CompilerVersion >= 14.0 }
      {$UNDEF HAS_ENCODING}
    {$IFEND}
  {$IFEND}
{$ENDIF}

const
  ServiceURL_REAL = 'https://auth.linkhub.co.kr';
  ServiceURL_TEST = 'https://demo.innopost.com';
  APIVersion = '1.0';
  TableBase64 =
    'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=';

  ReTablebase64 =
    #$40 +#$40 +#$40 +#$40 +#$40 +#$40 +#$40 +#$40 +#$40 +#$40 +#$3E +#$40
    +#$40 +#$40 +#$3F +#$34 +#$35 +#$36 +#$37 +#$38 +#$39 +#$3A +#$3B +#$3C
    +#$3D +#$40 +#$40 +#$40 +#$40 +#$40 +#$40 +#$40 +#$00 +#$01 +#$02 +#$03
    +#$04 +#$05 +#$06 +#$07 +#$08 +#$09 +#$0A +#$0B +#$0C +#$0D +#$0E +#$0F
    +#$10 +#$11 +#$12 +#$13 +#$14 +#$15 +#$16 +#$17 +#$18 +#$19 +#$40 +#$40
    +#$40 +#$40 +#$40 +#$40 +#$1A +#$1B +#$1C +#$1D +#$1E +#$1F +#$20 +#$21
    +#$22 +#$23 +#$24 +#$25 +#$26 +#$27 +#$28 +#$29 +#$2A +#$2B +#$2C +#$2D
    +#$2E +#$2F +#$30 +#$31 +#$32 +#$33 +#$40 +#$40 +#$40 +#$40 +#$40 +#$40;

type
  TMDCtx = record
    State: array[0..3] of Integer;
    Count: array[0..1] of Integer;
    BufAnsiChar: array[0..63] of Byte;
    BufLong: array[0..15] of Integer;
  end;

  TSHA1Ctx= record
    Hi, Lo: integer;
    Buffer: array[0..63] of byte;
    Index: integer;
    Hash: array[0..4] of Integer;
    HashByte: array[0..19] of byte;
  end;

  TMDTransform = procedure(var Buf: array of LongInt; const Data: array of LongInt);

  TToken = class;
  ArrayOfString = Array Of String;

  TAuth = class
  private
    FIsTest    : boolean;
    FLinkID : string;
    FSecretKey : string;
  public
    constructor  Create(LinkID : string; SecretKey : string);
    function getToken(ServiceID : string; access_id : string; scope : array Of String) : TToken; overload;
    function getToken(ServiceID : string; access_id : string; scope : array Of String; forwardIP : String) : TToken; overload;
    function getBalance(bearerToken : String; ServiceID : String) : Double;
    function getPartnerBalance(bearerToken : String; ServiceID : String) : Double;
    function GetTime : String;
    function getPartnerURL(bearerToken : String; ServiceID : String; TOGO : String) : String;    
  end;

  TToken = class
  private
        Fsession_token : string;
        FserviceID : string;
        FlinkID : string;
        Fusercode : string;
        Fexpiration : string;
        Fipaddress : string;
        Fscope : ArrayOfString;
  public
      property session_token : string read Fsession_token write Fsession_token;
      property serviceID : string read FserviceID write FserviceID;
      property linkID : string read FlinkID write FlinkID;
      property usercode : string read Fusercode write Fusercode;
      property expiration : string read Fexpiration write Fexpiration;
      property ipaddress : string read Fipaddress write Fipaddress;
      property scope : ArrayOfString read Fscope write Fscope;

      destructor Destroy; override;
  end;

  ELinkhubException  = class(Exception)
  private
    FCode : LongInt;
  public
    constructor Create(code : LongInt; Message : String);
    property code : LongInt read FCode write FCode;
  end;

  function UTCToDate(strDT : string) : TDateTime;
  function StreamToString(Stream: TStream): WideString;
  function Utf8ToUnicode(Dest: PWideChar; MaxDestChars: Cardinal; Source: PChar; SourceBytes: Cardinal): Cardinal;
  function UnicodeToUtf8(Dest: PChar; MaxDestBytes: Cardinal; Source: PWideChar; SourceChars: Cardinal): Cardinal;
  function getJSonString(Data : String; Key : String) : String;
  function getJSonBoolean(Data : String; Key : String) : Boolean;
  function getJSonInteger(Data : String; Key : String) : Integer;
  function getJSonFloat(Data : String; Key : String) : Double;
  function getJSonList(Data : String; Key : String) : ArrayOfString;
  function getJSonListString(Data : String; Key : String) : ArrayOfString;
  function ParseJsonList(inputJson : String) : ArrayOfString;
  function ParseTotalJsonList(inputJson : String) : ArrayOfString;
  function IfThen(condition :boolean; trueVal :String ; falseVal : String) : string;
  function EscapeString(input : string) : string;
  function MD5(const Value: AnsiString): AnsiString;
  function EncodeBase64(const Value: AnsiString): String;
  function DecodeBase64(const Value: String): AnsiString;
  function HMAC_SHA1(Text, Key: AnsiString): AnsiString;
  function skiptoSquareBracket(Data : String; index : integer) : integer;
implementation

destructor TToken.Destroy;
begin
  setlength(FScope,0);
  FScope := nil;
end;

constructor ELinkhubException.Create(code : LongInt; Message : String);
begin
inherited Create(Message);
FCode := code;
end;

constructor TAuth.Create(LinkID : string; SecretKey : string);
begin
     FLinkID := LinkID;
     FSecretKey := SecretKey;
     FIsTest := false;
end;

function TAuth.GetTime() : String;
var
        url   : String;
        response : String;
        http : olevariant;
begin
        if FIsTest then url := ServiceURL_TEST + '/Time'
                else url := ServiceURL_REAL + '/Time';

        try
                http := createoleobject('MSXML2.XMLHTTP.6.0');
                http.open('GET',url);
                http.setRequestHeader('Accept-Encoding','gzip,deflate');
                http.send;
        except
                On E : Exception do
                        raise ELinkhubException.Create(-99999999, 'Fail to GetTime() - ['+ E.ClassName + '] '+ E.Message);
        end;

        response := http.responsetext;
        
        if http.Status <> 200 then
        begin       
                raise ELinkhubException.Create(getJSonInteger(response,'code'),getJSonString(response,'message'));
        end
        else
        begin
                Result := response;
        end;
end;

function TAuth.getToken(ServiceID : string; access_id : string; scope : array Of String) : TToken;
begin
        result := getToken(ServiceID,access_id,scope,'');
end;

function TAuth.getToken(ServiceID : string; access_id : string; scope : array Of String; forwardIP : String) : TToken;
var
        xdate : String;
        target : String;
        postdata : olevariant;
        bearerToken : String;
        url   : String;
        i : Integer;
        response : string;
        http : olevariant;
begin
        if FIsTest then url := ServiceURL_TEST + '/' + ServiceID + '/Token'
                else url := ServiceURL_REAL + '/' + ServiceID + '/Token';

        postdata := '"access_id":"'+access_id+'"';

        if length(scope) > 0 then
        begin
                postdata := postdata + ',"scope":[';
                for i := 0 to length(scope)-1 do
                begin
                        postdata := postdata + '"' + scope[i] + '"';
                        if i < length(scope) -1 then
                        begin
                                postdata := postdata + ',';
                        end
                        else
                        begin
                                postdata := postdata + ']';
                        end
                end;
        end;

        try
                postdata := '{' + postdata + '}';

                xdate := getTime();

                target := 'POST' + #10;
                target := target + EncodeBase64(md5(postdata)) + #10;
                target := target + xdate + #10;

                if forwardIP <> '' then target := target + forwardIP + #10;
                target := target + APIVersion + #10;
                target := target + '/'+ServiceID+'/Token';

                bearerToken := EncodeBase64(HMAC_SHA1(target,DecodeBase64( FSecretKey)));
        
                http := createoleobject('MSXML2.XMLHTTP.6.0');
                http.open('POST',url);

                http.setRequestHeader('x-lh-date', xdate);
                http.setRequestHeader('x-lh-version', '1.0');
                http.setRequestHeader('Accept-Encoding','gzip,deflate');
                if forwardIP <> '' then HTTP.setRequestHeader('x-lh-forwarded',forwardIP);
                http.setRequestHeader('Authorization', 'LINKHUB ' + FLinkID + ' ' + bearerToken);

                http.send(postdata);
        except
                On LE : ELinkhubException do
                        raise ELinkhubException.Create(-99999999, LE.Message);
                On E : Exception do
                        raise ELinkhubException.Create(-99999999, 'Fail to GetToken() - ['+ E.ClassName + '] '+ E.Message);
        end;
                

        response := http.responsetext;
        
        if http.Status <> 200 then
        begin
                raise ELinkhubException.Create(getJSonInteger(response,'code'),getJSonString(response,'message'));
        end
        else
        begin
                Result := TToken.Create;
                Result.session_token := getJSonString(response,'session_token');
                Result.serviceID := getJSonString(response,'serviceID');
                Result.linkID := getJSonString(response,'linkID');
                Result.usercode := getJSonString(response,'usercode');
                Result.ipaddress := getJSonString(response,'ipaddress');
                Result.expiration := getJSonString(response,'expiration');
        end;
end;

function TAuth.getPartnerURL(bearerToken : String; ServiceID : String; TOGO : String) : String;
var
  url   : String;
  response : string;
  http : olevariant;
begin
        if FIsTest then url := ServiceURL_TEST + '/' + ServiceID + '/URL?TG=' + TOGO
                else url := ServiceURL_REAL + '/' + ServiceID + '/URL?TG=' + TOGO;

        try
                http := createoleobject('MSXML2.XMLHTTP.6.0');
                http.open('GET', url);
                http.setRequestHeader('Authorization', 'Bearer ' + bearerToken);
                http.setRequestHeader('Accept-Encoding','gzip,deflate');
                http.send;
        except
                On E : Exception do
                        raise ELinkhubException.Create(-99999999, 'Fail to GetPartnerURL() - ['+ E.ClassName + '] '+ E.Message);
        end;

        response := http.responsetext;
        
        if http.Status <> 200 then
        begin
                raise ELinkhubException.Create(getJSonInteger(response,'code'),getJSonString(response,'message'));
        end
        else
        begin
                Result := getJSonString(response,'url');
        end;
end;

function TAuth.getBalance(bearerToken : String; ServiceID : String) : Double;
var
  url   : String;
  response : string;
  http : olevariant;
begin
        if FIsTest then url := ServiceURL_TEST + '/' + ServiceID + '/Point'
                else url := ServiceURL_REAL + '/' + ServiceID + '/Point';

        try
                http := createoleobject('MSXML2.XMLHTTP.6.0');
                http.open('GET', url);
                http.setRequestHeader('Authorization', 'Bearer ' + bearerToken);
                http.setRequestHeader('Accept-Encoding','gzip,deflate');
                http.send;
        except
                On E : Exception do
                        raise ELinkhubException.Create(-99999999, 'Fail to GetBalance() - ['+ E.ClassName + '] '+ E.Message);
        end;

        response := http.responsetext;
        
        if http.Status <> 200 then
        begin
                raise ELinkhubException.Create(getJSonInteger(response,'code'),getJSonString(response,'message'));
        end
        else
        begin
                Result := strToFloat(getJSonString(response,'remainPoint'));
        end;
end;


function TAuth.getPartnerBalance(bearerToken : String; ServiceID : String) : Double;
var
        url   : String;
        response : string;
        http : olevariant;
begin
        if FIsTest then url := ServiceURL_TEST + '/' + ServiceID + '/PartnerPoint'
        else url := ServiceURL_REAL + '/' + ServiceID + '/PartnerPoint';

        try
                http := createoleobject('MSXML2.XMLHTTP.6.0');
                http.open('GET',url);
                http.setRequestHeader('Authorization', 'Bearer ' + bearerToken);
                http.setRequestHeader('Accept-Encoding','gzip,deflate');
                http.send;
        except
                On E : Exception do
                        raise ELinkhubException.Create(-99999999, 'Fail to GetPartnerBalance() - ['+ E.ClassName + '] '+ E.Message);
        end;

        response := http.responsetext;
        
        if http.Status <> 200 then
        begin
                raise ELinkhubException.Create(getJSonInteger(response,'code'),getJSonString(response,'message'));
        end
        else
        begin
                Result := strToFloat(getJSonString(response,'remainPoint'));
        end;
end;

{$IFDEF HAS_ENCODING}
function StreamToString(Stream: TStream): WideString;
begin
    with TStringStream.Create('',TEncoding.UTF8) do
    try
        CopyFrom(Stream, Stream.Size - Stream.Position);
        Result := DataString;
    finally
        Free;
    end;
end;
{$ELSE}
function StreamToString(Stream: TStream): WideString;
var
        ms: TMemoryStream;
        byteTemp : Array of Byte;
begin
        ms := TMemoryStream.Create;
        try
                ms.LoadFromStream(Stream);
                SetLength(byteTemp,ms.size * 3);
                Utf8ToUnicode(@byteTemp[0],Length(byteTemp),ms.memory,ms.Size);
                Result := Trim(WideString(byteTemp));
        finally
                ms.Free;
        end;
end;
{$ENDIF}


function EscapeString(input : string) : string;
begin
        result := input;

        if ByteType(result, length(result)) = mbLeadByte then
        begin
                result := Copy(result, 1, length(result)-1);
        end;

        result := StringReplace(result,'\','\\',[rfReplaceAll]);
        result := StringReplace(result,'/','\/',[rfReplaceAll]);
        result := StringReplace(result,'"','\"',[rfReplaceAll]);
        result := StringReplace(result,'''','\''',[rfReplaceAll]);
        result := StringReplace(result,#8,'\b',[rfReplaceAll]);
        result := StringReplace(result,#9,'\t',[rfReplaceAll]);
        result := StringReplace(result,#10,'\n',[rfReplaceAll]);
        result := StringReplace(result,#12,'\f',[rfReplaceAll]);
        result := StringReplace(result,#13,'\r',[rfReplaceAll]);

end;

function UnescapeString(input : string) : string;
begin
        result := input;
        result := StringReplace(result,'\\','\',[rfReplaceAll]);
        result := StringReplace(result,'\/','/',[rfReplaceAll]);
        result := StringReplace(result,'\"','"',[rfReplaceAll]);
        result := StringReplace(result,'\''','''',[rfReplaceAll]);
        result := StringReplace(result,'\b',#8,[rfReplaceAll]);
        result := StringReplace(result,'\t',#9,[rfReplaceAll]);
        result := StringReplace(result,'\n',#10,[rfReplaceAll]);
        result := StringReplace(result,'\f',#12,[rfReplaceAll]);
        result := StringReplace(result,'\r',#13,[rfReplaceAll]);

end;

function TimeZoneBias: integer;
{$IFNDEF MSWINDOWS}
{$IFNDEF FPC}
var
{$IFDEF POSIX}
  t: Posix.SysTypes.time_t;
  UT: Posix.time.tm;
{$ELSE}
  t: TTime_T;
  UT: TUnixTime;
{$ENDIF}
begin
  {$IFDEF POSIX}
    __time(T);
    localtime_r(T, UT);
    Result := UT.tm_gmtoff div 60;
  {$ELSE}
    __time(@T);
    localtime_r(@T, UT);
    Result := ut.__tm_gmtoff div 60;
  {$ENDIF}
{$ELSE}
begin
  Result := TZSeconds div 60;
{$ENDIF}
{$ELSE}
var
  zoneinfo: TTimeZoneInformation;
  bias: Integer;
begin
  case GetTimeZoneInformation(Zoneinfo) of
    2:
      bias := zoneinfo.Bias + zoneinfo.DaylightBias;
    1:
      bias := zoneinfo.Bias + zoneinfo.StandardBias;
  else
    bias := zoneinfo.Bias;
  end;
  Result := bias * (-1);
{$ENDIF}
end;

procedure MDInit(var MDContext: TMDCtx);
var
  n: integer;
begin
  MDContext.Count[0] := 0;
  MDContext.Count[1] := 0;
  for n := 0 to high(MDContext.BufAnsiChar) do
    MDContext.BufAnsiChar[n] := 0;
  for n := 0 to high(MDContext.BufLong) do
    MDContext.BufLong[n] := 0;
  MDContext.State[0] := Integer($67452301);
  MDContext.State[1] := Integer($EFCDAB89);
  MDContext.State[2] := Integer($98BADCFE);
  MDContext.State[3] := Integer($10325476);
end;

procedure ArrByteToLong(var ArByte: Array of byte; var ArLong: Array of Integer);
{$IFDEF SYNACODE_NATIVE}
var
  n: integer;
{$ENDIF}
begin
  if (High(ArByte) + 1) > ((High(ArLong) + 1) * 4) then
    Exit;
  {$IFDEF SYNACODE_NATIVE}
  for n := 0 to ((high(ArByte) + 1) div 4) - 1 do
    ArLong[n] := ArByte[n * 4 + 0]
      + (ArByte[n * 4 + 1] shl 8)
      + (ArByte[n * 4 + 2] shl 16)
      + (ArByte[n * 4 + 3] shl 24);
  {$ELSE}
  Move(ArByte[0], ArLong[0], High(ArByte) + 1);
  {$ENDIF}
end;

procedure ArrLongToByte(var ArLong: Array of Integer; var ArByte: Array of byte);
{$IFDEF SYNACODE_NATIVE}
var
  n: integer;
{$ENDIF}
begin
  if (High(ArByte) + 1) < ((High(ArLong) + 1) * 4) then
    Exit;
  {$IFDEF SYNACODE_NATIVE}
  for n := 0 to high(ArLong) do
  begin
    ArByte[n * 4 + 0] := ArLong[n] and $000000FF;
    ArByte[n * 4 + 1] := (ArLong[n] shr 8) and $000000FF;
    ArByte[n * 4 + 2] := (ArLong[n] shr 16) and $000000FF;
    ArByte[n * 4 + 3] := (ArLong[n] shr 24) and $000000FF;
  end;
  {$ELSE}
  Move(ArLong[0], ArByte[0], High(ArByte) + 1);
  {$ENDIF}
end;

procedure MDUpdate(var MDContext: TMDCtx; const Data: AnsiString; transform: TMDTransform);
var
  Index, partLen, InputLen, I: integer;
{$IFDEF SYNACODE_NATIVE}
  n: integer;
{$ENDIF}
begin
  InputLen := Length(Data);
  with MDContext do
  begin
    Index := (Count[0] shr 3) and $3F;
    Inc(Count[0], InputLen shl 3);
    if Count[0] < (InputLen shl 3) then
      Inc(Count[1]);
    Inc(Count[1], InputLen shr 29);
    partLen := 64 - Index;
    if InputLen >= partLen then
    begin
      ArrLongToByte(BufLong, BufAnsiChar);
      {$IFDEF SYNACODE_NATIVE}
      for n := 1 to partLen do
        BufAnsiChar[index - 1 + n] := Ord(Data[n]);
      {$ELSE}
      Move(Data[1], BufAnsiChar[Index], partLen);
      {$ENDIF}
      ArrByteToLong(BufAnsiChar, BufLong);
      Transform(State, Buflong);
      I := partLen;
  		while I + 63 < InputLen do
      begin
        ArrLongToByte(BufLong, BufAnsiChar);
        {$IFDEF SYNACODE_NATIVE}
        for n := 1 to 64 do
          BufAnsiChar[n - 1] := Ord(Data[i + n]);
        {$ELSE}
        Move(Data[I+1], BufAnsiChar, 64);
        {$ENDIF}
        ArrByteToLong(BufAnsiChar, BufLong);
        Transform(State, Buflong);
	  	  inc(I, 64);
		  end;
      Index := 0;
    end
    else
      I := 0;
    ArrLongToByte(BufLong, BufAnsiChar);
    {$IFDEF SYNACODE_NATIVE}
    for n := 1 to InputLen-I do
      BufAnsiChar[Index + n - 1] := Ord(Data[i + n]);
    {$ELSE}
    Move(Data[I+1], BufAnsiChar[Index], InputLen-I);
    {$ENDIF}
    ArrByteToLong(BufAnsiChar, BufLong);
  end
end;

procedure MD5Transform(var Buf: array of LongInt; const Data: array of LongInt);
var
  A, B, C, D: LongInt;

  procedure Round1(var W: LongInt; X, Y, Z, Data: LongInt; S: Byte);
  begin
    Inc(W, (Z xor (X and (Y xor Z))) + Data);
    W := (W shl S) or (W shr (32 - S));
    Inc(W, X);
  end;

  procedure Round2(var W: LongInt; X, Y, Z, Data: LongInt; S: Byte);
  begin
    Inc(W, (Y xor (Z and (X xor Y))) + Data);
    W := (W shl S) or (W shr (32 - S));
    Inc(W, X);
  end;

  procedure Round3(var W: LongInt; X, Y, Z, Data: LongInt; S: Byte);
  begin
    Inc(W, (X xor Y xor Z) + Data);
    W := (W shl S) or (W shr (32 - S));
    Inc(W, X);
  end;

  procedure Round4(var W: LongInt; X, Y, Z, Data: LongInt; S: Byte);
  begin
    Inc(W, (Y xor (X or not Z)) + Data);
    W := (W shl S) or (W shr (32 - S));
    Inc(W, X);
  end;
begin
  A := Buf[0];
  B := Buf[1];
  C := Buf[2];
  D := Buf[3];

  Round1(A, B, C, D, Data[0] + Longint($D76AA478), 7);
  Round1(D, A, B, C, Data[1] + Longint($E8C7B756), 12);
  Round1(C, D, A, B, Data[2] + Longint($242070DB), 17);
  Round1(B, C, D, A, Data[3] + Longint($C1BDCEEE), 22);
  Round1(A, B, C, D, Data[4] + Longint($F57C0FAF), 7);
  Round1(D, A, B, C, Data[5] + Longint($4787C62A), 12);
  Round1(C, D, A, B, Data[6] + Longint($A8304613), 17);
  Round1(B, C, D, A, Data[7] + Longint($FD469501), 22);
  Round1(A, B, C, D, Data[8] + Longint($698098D8), 7);
  Round1(D, A, B, C, Data[9] + Longint($8B44F7AF), 12);
  Round1(C, D, A, B, Data[10] + Longint($FFFF5BB1), 17);
  Round1(B, C, D, A, Data[11] + Longint($895CD7BE), 22);
  Round1(A, B, C, D, Data[12] + Longint($6B901122), 7);
  Round1(D, A, B, C, Data[13] + Longint($FD987193), 12);
  Round1(C, D, A, B, Data[14] + Longint($A679438E), 17);
  Round1(B, C, D, A, Data[15] + Longint($49B40821), 22);

  Round2(A, B, C, D, Data[1] + Longint($F61E2562), 5);
  Round2(D, A, B, C, Data[6] + Longint($C040B340), 9);
  Round2(C, D, A, B, Data[11] + Longint($265E5A51), 14);
  Round2(B, C, D, A, Data[0] + Longint($E9B6C7AA), 20);
  Round2(A, B, C, D, Data[5] + Longint($D62F105D), 5);
  Round2(D, A, B, C, Data[10] + Longint($02441453), 9);
  Round2(C, D, A, B, Data[15] + Longint($D8A1E681), 14);
  Round2(B, C, D, A, Data[4] + Longint($E7D3FBC8), 20);
  Round2(A, B, C, D, Data[9] + Longint($21E1CDE6), 5);
  Round2(D, A, B, C, Data[14] + Longint($C33707D6), 9);
  Round2(C, D, A, B, Data[3] + Longint($F4D50D87), 14);
  Round2(B, C, D, A, Data[8] + Longint($455A14ED), 20);
  Round2(A, B, C, D, Data[13] + Longint($A9E3E905), 5);
  Round2(D, A, B, C, Data[2] + Longint($FCEFA3F8), 9);
  Round2(C, D, A, B, Data[7] + Longint($676F02D9), 14);
  Round2(B, C, D, A, Data[12] + Longint($8D2A4C8A), 20);

  Round3(A, B, C, D, Data[5] + Longint($FFFA3942), 4);
  Round3(D, A, B, C, Data[8] + Longint($8771F681), 11);
  Round3(C, D, A, B, Data[11] + Longint($6D9D6122), 16);
  Round3(B, C, D, A, Data[14] + Longint($FDE5380C), 23);
  Round3(A, B, C, D, Data[1] + Longint($A4BEEA44), 4);
  Round3(D, A, B, C, Data[4] + Longint($4BDECFA9), 11);
  Round3(C, D, A, B, Data[7] + Longint($F6BB4B60), 16);
  Round3(B, C, D, A, Data[10] + Longint($BEBFBC70), 23);
  Round3(A, B, C, D, Data[13] + Longint($289B7EC6), 4);
  Round3(D, A, B, C, Data[0] + Longint($EAA127FA), 11);
  Round3(C, D, A, B, Data[3] + Longint($D4EF3085), 16);
  Round3(B, C, D, A, Data[6] + Longint($04881D05), 23);
  Round3(A, B, C, D, Data[9] + Longint($D9D4D039), 4);
  Round3(D, A, B, C, Data[12] + Longint($E6DB99E5), 11);
  Round3(C, D, A, B, Data[15] + Longint($1FA27CF8), 16);
  Round3(B, C, D, A, Data[2] + Longint($C4AC5665), 23);

  Round4(A, B, C, D, Data[0] + Longint($F4292244), 6);
  Round4(D, A, B, C, Data[7] + Longint($432AFF97), 10);
  Round4(C, D, A, B, Data[14] + Longint($AB9423A7), 15);
  Round4(B, C, D, A, Data[5] + Longint($FC93A039), 21);
  Round4(A, B, C, D, Data[12] + Longint($655B59C3), 6);
  Round4(D, A, B, C, Data[3] + Longint($8F0CCC92), 10);
  Round4(C, D, A, B, Data[10] + Longint($FFEFF47D), 15);
  Round4(B, C, D, A, Data[1] + Longint($85845DD1), 21);
  Round4(A, B, C, D, Data[8] + Longint($6FA87E4F), 6);
  Round4(D, A, B, C, Data[15] + Longint($FE2CE6E0), 10);
  Round4(C, D, A, B, Data[6] + Longint($A3014314), 15);
  Round4(B, C, D, A, Data[13] + Longint($4E0811A1), 21);
  Round4(A, B, C, D, Data[4] + Longint($F7537E82), 6);
  Round4(D, A, B, C, Data[11] + Longint($BD3AF235), 10);
  Round4(C, D, A, B, Data[2] + Longint($2AD7D2BB), 15);
  Round4(B, C, D, A, Data[9] + Longint($EB86D391), 21);

  Inc(Buf[0], A);
  Inc(Buf[1], B);
  Inc(Buf[2], C);
  Inc(Buf[3], D);
end;

function MDFinal(var MDContext: TMDCtx; transform: TMDTransform): AnsiString;
var
  Cnt: Word;
  P: Byte;
  digest: array[0..15] of Byte;
  i: Integer;
  n: integer;
begin
  for I := 0 to 15 do
    Digest[I] := I + 1;
  with MDContext do
  begin
    Cnt := (Count[0] shr 3) and $3F;
    P := Cnt;
    BufAnsiChar[P] := $80;
    Inc(P);
    Cnt := 64 - 1 - Cnt;
    if Cnt < 8 then
    begin
      for n := 0 to cnt - 1 do
        BufAnsiChar[P + n] := 0;
      ArrByteToLong(BufAnsiChar, BufLong);
//      FillChar(BufAnsiChar[P], Cnt, #0);
      Transform(State, BufLong);
      ArrLongToByte(BufLong, BufAnsiChar);
      for n := 0 to 55 do
        BufAnsiChar[n] := 0;
      ArrByteToLong(BufAnsiChar, BufLong);
//      FillChar(BufAnsiChar, 56, #0);
    end
    else
    begin
      for n := 0 to Cnt - 8 - 1 do
        BufAnsiChar[p + n] := 0;
      ArrByteToLong(BufAnsiChar, BufLong);
//      FillChar(BufAnsiChar[P], Cnt - 8, #0);
    end;
    BufLong[14] := Count[0];
    BufLong[15] := Count[1];
    Transform(State, BufLong);
    ArrLongToByte(State, Digest);
//    Move(State, Digest, 16);
    Result := '';
    for i := 0 to 15 do
      Result := Result + AnsiChar(digest[i]);
  end;
//  FillChar(MD5Context, SizeOf(TMD5Ctx), #0)
end;

function MD5(const Value: AnsiString): AnsiString;
var
  MDContext: TMDCtx;
begin
  MDInit(MDContext);
  MDUpdate(MDContext, Value, @MD5Transform);
  Result := MDFinal(MDContext, @MD5Transform);
end;

function Encode3to4(const Value, Table: AnsiString): AnsiString;
var
  c: Byte;
  n, l: Integer;
  Count: Integer;
  DOut: array[0..3] of Byte;
begin
  setlength(Result, ((Length(Value) + 2) div 3) * 4);
  l := 1;
  Count := 1;
  while Count <= Length(Value) do
  begin
    c := Ord(Value[Count]);
    Inc(Count);
    DOut[0] := (c and $FC) shr 2;
    DOut[1] := (c and $03) shl 4;
    if Count <= Length(Value) then
    begin
      c := Ord(Value[Count]);
      Inc(Count);
      DOut[1] := DOut[1] + (c and $F0) shr 4;
      DOut[2] := (c and $0F) shl 2;
      if Count <= Length(Value) then
      begin
        c := Ord(Value[Count]);
        Inc(Count);
        DOut[2] := DOut[2] + (c and $C0) shr 6;
        DOut[3] := (c and $3F);
      end
      else
      begin
        DOut[3] := $40;
      end;
    end
    else
    begin
      DOut[2] := $40;
      DOut[3] := $40;
    end;
    for n := 0 to 3 do
    begin
      if (DOut[n] + 1) <= Length(Table) then
      begin
        Result[l] := Table[DOut[n] + 1];
        Inc(l);
      end;
    end;
  end;
  SetLength(Result, l - 1);
end;

function Decode4to3Ex(const Value, Table: String): AnsiString;
var
  x, y, lv: Integer;
  d: integer;
  dl: integer;
  c: byte;
  p: integer;
begin
  lv := Length(Value);
  SetLength(Result, lv);
  x := 1;
  dl := 4;
  d := 0;
  p := 1;
  while x <= lv do
  begin
    y := Ord(Value[x]);
    if y in [33..127] then
      c := Ord(Table[y - 32])
    else
      c := 64;
    Inc(x);
    if c > 63 then
      continue;
    d := (d shl 6) or c;
    dec(dl);
    if dl <> 0 then
      continue;
    Result[p] := AnsiChar((d shr 16) and $ff);
    inc(p);
    Result[p] := AnsiChar((d shr 8) and $ff);
    inc(p);
    Result[p] := AnsiChar(d and $ff);
    inc(p);
    d := 0;
    dl := 4;
  end;
  case dl of
    1:
      begin
        d := d shr 2;
        Result[p] := AnsiChar((d shr 8) and $ff);
        inc(p);
        Result[p] := AnsiChar(d and $ff);
        inc(p);
      end;
    2:
      begin
        d := d shr 4;
        Result[p] := AnsiChar(d and $ff);
        inc(p);
      end;
  end;
  SetLength(Result, p - 1);
end;

function EncodeBase64(const Value: AnsiString): String;
begin
  Result := Encode3to4(Value, TableBase64);
end;

function DecodeBase64(const Value: String): AnsiString;
begin
  Result := Decode4to3Ex(Value, ReTableBase64);
end;

procedure SHA1init( var SHA1Context: TSHA1Ctx );
var
  n: integer;
begin
  SHA1Context.Hi := 0;
  SHA1Context.Lo := 0;
  SHA1Context.Index := 0;
  for n := 0 to High(SHA1Context.Buffer) do
    SHA1Context.Buffer[n] := 0;
  for n := 0 to High(SHA1Context.HashByte) do
    SHA1Context.HashByte[n] := 0;
//  FillChar(SHA1Context, SizeOf(TSHA1Ctx), #0);
  SHA1Context.Hash[0] := integer($67452301);
  SHA1Context.Hash[1] := integer($EFCDAB89);
  SHA1Context.Hash[2] := integer($98BADCFE);
  SHA1Context.Hash[3] := integer($10325476);
  SHA1Context.Hash[4] := integer($C3D2E1F0);
end;

function RB(A: integer): integer;
begin
  Result := (A shr 24) or ((A shr 8) and $FF00) or ((A shl 8) and $FF0000) or (A shl 24);
end;

procedure SHA1Compress(var Data: TSHA1Ctx);
var
  A, B, C, D, E, T: integer;
  W: array[0..79] of integer;
  i: integer;
  n: integer;

  function F1(x, y, z: integer): integer;
  begin
    Result := z xor (x and (y xor z));
  end;
  function F2(x, y, z: integer): integer;
  begin
    Result := x xor y xor z;
  end;
  function F3(x, y, z: integer): integer;
  begin
    Result := (x and y) or (z and (x or y));
  end;
  function LRot32(X: integer; c: integer): integer;
  begin
    result := (x shl c) or (x shr (32 - c));
  end;
begin
  ArrByteToLong(Data.Buffer, W);
//  Move(Data.Buffer, W, Sizeof(Data.Buffer));
  for i := 0 to 15 do
    W[i] := RB(W[i]);
  for i := 16 to 79 do
    W[i] := LRot32(W[i-3] xor W[i-8] xor W[i-14] xor W[i-16], 1);
  A := Data.Hash[0];
  B := Data.Hash[1];
  C := Data.Hash[2];
  D := Data.Hash[3];
  E := Data.Hash[4];
  for i := 0 to 19 do
  begin
    T := LRot32(A, 5) + F1(B, C, D) + E + W[i] + integer($5A827999);
    E := D;
    D := C;
    C := LRot32(B, 30);
    B := A;
    A := T;
  end;
  for i := 20 to 39 do
  begin
    T := LRot32(A, 5) + F2(B, C, D) + E + W[i] + integer($6ED9EBA1);
    E := D;
    D := C;
    C := LRot32(B, 30);
    B := A;
    A := T;
  end;
  for i := 40 to 59 do
  begin
    T := LRot32(A, 5) + F3(B, C, D) + E + W[i] + integer($8F1BBCDC);
    E := D;
    D := C;
    C := LRot32(B, 30);
    B := A;
    A := T;
  end;
  for i := 60 to 79 do
  begin
    T := LRot32(A, 5) + F2(B, C, D) + E + W[i] + integer($CA62C1D6);
    E := D;
    D := C;
    C := LRot32(B, 30);
    B := A;
    A := T;
  end;
  Data.Hash[0] := Data.Hash[0] + A;
  Data.Hash[1] := Data.Hash[1] + B;
  Data.Hash[2] := Data.Hash[2] + C;
  Data.Hash[3] := Data.Hash[3] + D;
  Data.Hash[4] := Data.Hash[4] + E;
  for n := 0 to high(w) do
    w[n] := 0;
//  FillChar(W, Sizeof(W), 0);
  for n := 0 to high(Data.Buffer) do
    Data.Buffer[n] := 0;
//  FillChar(Data.Buffer, Sizeof(Data.Buffer), 0);
end;

procedure SHA1Update(var Context: TSHA1Ctx; const Data: AnsiString);
var
  Len: integer;
  n: integer;
  i, k: integer;
begin
  Len := Length(data);
  for k := 0 to 7 do
  begin
    i := Context.Lo;
    Inc(Context.Lo, Len);
    if Context.Lo < i then
      Inc(Context.Hi);
  end;
  for n := 1 to len do
  begin
    Context.Buffer[Context.Index] := byte(Data[n]);
    Inc(Context.Index);
    if Context.Index = 64 then
    begin
      Context.Index := 0;
      SHA1Compress(Context);
    end;
  end;
end;
function SHA1Final(var Context: TSHA1Ctx): AnsiString;
type
  Pinteger = ^integer;
var
  i: integer;
  procedure ItoArr(var Ar: Array of byte; I, value: Integer);
  begin
    Ar[i + 0] := Value and $000000FF;
    Ar[i + 1] := (Value shr 8) and $000000FF;
    Ar[i + 2] := (Value shr 16) and $000000FF;
    Ar[i + 3] := (Value shr 24) and $000000FF;
  end;
begin
  Context.Buffer[Context.Index] := $80;
  if Context.Index >= 56 then
    SHA1Compress(Context);
  ItoArr(Context.Buffer, 56, RB(Context.Hi));
  ItoArr(Context.Buffer, 60, RB(Context.Lo));
//  Pinteger(@Context.Buffer[56])^ := RB(Context.Hi);
//  Pinteger(@Context.Buffer[60])^ := RB(Context.Lo);
  SHA1Compress(Context);
  Context.Hash[0] := RB(Context.Hash[0]);
  Context.Hash[1] := RB(Context.Hash[1]);
  Context.Hash[2] := RB(Context.Hash[2]);
  Context.Hash[3] := RB(Context.Hash[3]);
  Context.Hash[4] := RB(Context.Hash[4]);
  ArrLongToByte(Context.Hash, Context.HashByte);
  Result := '';
  for i := 0 to 19 do
    Result := Result + AnsiChar(Context.HashByte[i]);
end;
function SHA1(const Value: AnsiString): AnsiString;
var
  SHA1Context: TSHA1Ctx;
begin
  SHA1Init(SHA1Context);
  SHA1Update(SHA1Context, Value);
  Result := SHA1Final(SHA1Context);
end;

function HMAC_SHA1(Text, Key: AnsiString): AnsiString;
var
  ipad, opad, s: AnsiString;
  n: Integer;
  SHA1Context: TSHA1Ctx;
begin
  if Length(Key) > 64 then
    Key := SHA1(Key);
  ipad := AnsiString(StringOfChar(#$36, 64));
  opad := AnsiString(StringOfChar(#$5C, 64));
  for n := 1 to Length(Key) do
  begin
    ipad[n] := AnsiChar(Byte(ipad[n]) xor Byte(Key[n]));
    opad[n] := AnsiChar(Byte(opad[n]) xor Byte(Key[n]));
  end;
  SHA1Init(SHA1Context);
  SHA1Update(SHA1Context, ipad);
  SHA1Update(SHA1Context, Text);
  s := SHA1Final(SHA1Context);
  SHA1Init(SHA1Context);
  SHA1Update(SHA1Context, opad);
  SHA1Update(SHA1Context, s);
  Result := SHA1Final(SHA1Context);
end;

function UTCToDate(strDT : string) : TDateTime;
var
  // Delphi settings save vars
  ShortDF, ShortTF : string;
  TS, DS : char;
  // conversion vars
  dd, tt, ddtt: TDateTime;
begin

  // save Delphi settings
  DS := {$IFDEF COMPILER15_UP}FormatSettings.{$ENDIF}DateSeparator;
  TS := {$IFDEF COMPILER15_UP}FormatSettings.{$ENDIF}TimeSeparator;
  ShortDF := {$IFDEF COMPILER15_UP}FormatSettings.{$ENDIF}ShortDateFormat;
  ShortTF := {$IFDEF COMPILER15_UP}FormatSettings.{$ENDIF}ShortTimeFormat;

  // set Delphi settings for string to date/time
  {$IFDEF COMPILER15_UP}FormatSettings.{$ENDIF}DateSeparator := '-';
  {$IFDEF COMPILER15_UP}FormatSettings.{$ENDIF}ShortDateFormat := 'yyyy-mm-dd';
  {$IFDEF COMPILER15_UP}FormatSettings.{$ENDIF}TimeSeparator := ':';
  {$IFDEF COMPILER15_UP}FormatSettings.{$ENDIF}ShortTimeFormat := 'hh:mm:ss';

  // convert test string to datetime
  try

    dd := StrToDate( Copy(strDT, 1, Pos('T',strDT)-1) );
    tt := StrToTime( Copy(strDT, Pos('T',strDT)+1, 8) );
    ddtt := trunc(dd) + frac(tt);

  except
    on EConvertError do
       raise ELinkhubException.Create(-99999999,'만료일 형식변환 실패.');
  end;

  //TimeZone

  ddtt := ((ddtt * 1440) + TimeZoneBias) /1440;

  // restore Delphi settings
  {$IFDEF COMPILER15_UP}FormatSettings.{$ENDIF}DateSeparator := DS;
  {$IFDEF COMPILER15_UP}FormatSettings.{$ENDIF}ShortDateFormat := ShortDF;
  {$IFDEF COMPILER15_UP}FormatSettings.{$ENDIF}TimeSeparator := TS;
  {$IFDEF COMPILER15_UP}FormatSettings.{$ENDIF}ShortTimeFormat := ShortTF;

  result := ddtt;
end;

function PosFrom(const SubStr, Value: String; From: integer): integer;
var
  ls,lv: integer;
begin
  Result := 0;
  ls := Length(SubStr);
  lv := Length(Value);
  if (ls = 0) or (lv = 0) then
    Exit;
  if From < 1 then
    From := 1;
  while (ls + from - 1) <= (lv) do
  begin
    {$IFNDEF CIL}
    if CompareMem(@SubStr[1],@Value[from],ls) then
    {$ELSE}
    if SubStr = copy(Value, from, ls) then
    {$ENDIF}
    begin
      result := from;
      break;
    end
    else
      inc(from);
  end;
end;

function Utf8ToUnicode(Dest: PWideChar; MaxDestChars: Cardinal; Source: PChar; SourceBytes: Cardinal): Cardinal;
var
  i, count: Cardinal;
  c: Byte;
  wc: Cardinal;
begin
  if Source = nil then
  begin
    Result := 0;
    Exit;
  end;
  Result := Cardinal(-1);
  count := 0;
  i := 0;
  if Dest <> nil then
  begin
    while (i < SourceBytes) and (count < MaxDestChars) do
    begin
      wc := Cardinal(Source[i]);
      Inc(i);
      if (wc and $80) <> 0 then
      begin
        if i >= SourceBytes then Exit;          // incomplete multibyte char
        wc := wc and $3F;
        if (wc and $20) <> 0 then
        begin
          c := Byte(Source[i]);
          Inc(i);
          if (c and $C0) <> $80 then Exit;      // malformed trail byte or out of range char
          if i >= SourceBytes then Exit;        // incomplete multibyte char
          wc := (wc shl 6) or (c and $3F);
        end;
        c := Byte(Source[i]);
        Inc(i);
        if (c and $C0) <> $80 then Exit;       // malformed trail byte

        Dest[count] := WideChar((wc shl 6) or (c and $3F));
      end
      else
        Dest[count] := WideChar(wc);
      Inc(count);
    end;
    if count >= MaxDestChars then count := MaxDestChars-1;
    Dest[count] := #0;
  end
  else
  begin
    while (i < SourceBytes) do
    begin
      c := Byte(Source[i]);
      Inc(i);
      if (c and $80) <> 0 then
      begin
        if i >= SourceBytes then Exit;          // incomplete multibyte char
        c := c and $3F;
        if (c and $20) <> 0 then
        begin
          c := Byte(Source[i]);
          Inc(i);
          if (c and $C0) <> $80 then Exit;      // malformed trail byte or out of range char
          if i >= SourceBytes then Exit;        // incomplete multibyte char
        end;
        c := Byte(Source[i]);
        Inc(i);
        if (c and $C0) <> $80 then Exit;       // malformed trail byte
      end;
      Inc(count);
    end;
  end;
  Result := count+1;
end;

function UnicodeToUtf8(Dest: PChar; MaxDestBytes: Cardinal; Source: PWideChar; SourceChars: Cardinal): Cardinal;
var
	i, count: Cardinal;
	c: Cardinal;
begin
	Result := 0;
	if Source = nil then Exit;
	count := 0;
	i := 0;
	if Dest <> nil then
	begin
		while (i < SourceChars) and (count < MaxDestBytes) do
		begin
			c := Cardinal(Source[i]);
			Inc(i);
			if c <= $7F then
			begin
				Dest[count] := Char(c);
				Inc(count);
			end
			else if c > $7FF then
			begin
				if count + 3 > MaxDestBytes then
					break;
				Dest[count] := Char($E0 or (c shr 12));
				Dest[count+1] := Char($80 or ((c shr 6) and $3F));
				Dest[count+2] := Char($80 or (c and $3F));
				Inc(count,3);
			end
			else //  $7F < Source[i] <= $7FF
			begin
				if count + 2 > MaxDestBytes then
					break;
				Dest[count] := Char($C0 or (c shr 6));
				Dest[count+1] := Char($80 or (c and $3F));
				Inc(count,2);
			end;
		end;
		if count >= MaxDestBytes then count := MaxDestBytes-1;
		Dest[count] := #0;
	end
	else
	begin
		while i < SourceChars do
		begin
			c := Integer(Source[i]);
			Inc(i);
			if c > $7F then
			begin
				if c > $7FF then
					Inc(count);
				Inc(count);
			end;
			Inc(count);
		end;
	end;
	Result := count+1;  // convert zero based index to byte count
end;


function getJSonBoolean(Data : String; Key : String) : Boolean;
var
        StartPos : integer;
	EndPos : integer;
        val : String;
begin
	StartPos := Pos('"' + Key + '":',Data);

        if StartPos = 0 then
        begin
                Result := false;
        end
        else
        begin
                StartPos := StartPos  + Length('"' + Key + '":');
                if Copy(Data,StartPos,1) = '"' then StartPos := StartPos + 1;

                EndPos := PosFrom(',',Data,StartPos);
                if EndPos = 0 then EndPos := posFrom('}',Data,StartPos);
                if EndPos = 0 then Raise ELinkhubException.Create(-99999999,'malformed json');

                EndPos := EndPos;

                if StartPos = EndPos then begin
                        Result := false;
                end
                else begin
                        val := Copy(Data,StartPos,EndPos-StartPos);
                        result := val = 'true';
                end;
        end;
end;

function getJSonString(Data : String; Key : String) : String;
var
        StartPos : integer;
	EndPos : integer;
        special : boolean;
        i : Integer;
begin
	StartPos := Pos('"' + Key + '":',Data);

        if StartPos = 0 then
        begin
                Result := '';
        end
        else
        begin
                StartPos := StartPos  + Length('"' + Key + '":');
                if Copy(Data,StartPos,1) = '"' then StartPos := StartPos + 1;

                special := false;
                
                for EndPos:=StartPos to Length(Data) do
                begin
                        if (Data[EndPos] = #92) and (not special) then
                        begin
                                special := true;
                                continue;
                        end;

                        if (Data[EndPos] = '"') and (not special)then Break;
                        special := false;
                end;

                if StartPos = EndPos then begin
                        Result := '';
                end
                else begin
                        Result := UnescapeString(Copy(Data,StartPos,EndPos-StartPos));
                        if Copy(Result,0,4) = 'null' then Result := '';
                end;
        end;
end;

function getJSonInteger(Data : String; Key : String) : Integer;
var
        StartPos : integer;
	EndPos : integer;
        val : String;
begin
	StartPos := Pos('"' + Key + '":',Data);

        if StartPos = 0 then
        begin
                Result := 0;
        end
        else
        begin
                StartPos := StartPos  + Length('"' + Key + '":');
                if Copy(Data,StartPos,1) = '"' then StartPos := StartPos + 1;

                EndPos := PosFrom(',',Data,StartPos);
                if EndPos = 0 then EndPos := posFrom('}',Data,StartPos);
                if EndPos = 0 then Raise ELinkhubException.Create(-99999999,'malformed json');

                EndPos := EndPos;

                if StartPos = EndPos then begin
                        Result := 0;
                end
                else begin
                        val := Copy(Data,StartPos,EndPos-StartPos);
                        result := StrToInt(val);
                end;
        end;
end;

function getJSonFloat(Data : String; Key : String) : Double;
var
        StartPos : integer;
	EndPos : integer;
        val : String;
begin
	StartPos := Pos('"' + Key + '":',Data);

        if StartPos = 0 then
        begin
                Result := 0;
        end
        else
        begin
                StartPos := StartPos  + Length('"' + Key + '":');
                if Copy(Data,StartPos,1) = '"' then StartPos := StartPos + 1;

                EndPos := PosFrom(',',Data,StartPos);
                if EndPos = 0 then EndPos := posFrom('}',Data,StartPos);
                if EndPos = 0 then Raise ELinkhubException.Create(-99999999,'malformed json');

                EndPos := EndPos;

                if StartPos = EndPos then begin
                        Result := 0;
                end
                else begin
                        val := Copy(Data,StartPos,EndPos-StartPos);
                        result := StrToFloat(val);
                end;
        end;
end;

function getJSonList(Data : String; Key : String) : ArrayOfString;
var
        StartPos : integer;
	EndPos : integer;
        targetJson : String;
begin
	StartPos := Pos('"' + Key + '":',Data);

        if StartPos = 0 then
        begin
                targetJson := '';
        end
        else
        begin
                StartPos := StartPos  + Length('"' + Key + '":');
                if Copy(Data,StartPos,1) = '[' then StartPos := StartPos + 1;

                EndPos :=skiptoSquareBracket(Data,StartPos);

                if EndPos = 0 then EndPos := PosFrom('}',Data,StartPos);
                if EndPos = 0 then raise ELinkhubException.Create(-99999999,'JSON PARSING ERROR');

                if Copy(Data,EndPos-1,1) = '"' then EndPos := EndPos;

                if StartPos = EndPos then begin
                        targetJson := '';
                end
                else begin
                        targetJson := Copy(Data,StartPos,EndPos-StartPos);
                        result:= ParseJsonList(targetJson);
                end;
        end;
end;

function getJSonListString(Data : String; Key : String) : ArrayOfString;
var
        StartPos : integer;
	EndPos : integer;
        targetJson : String;
        count : integer;
        i : integer;
begin
	StartPos := Pos('"' + Key + '":',Data);
        EndPos := 0;

        if StartPos = 0 then
        begin
                targetJson := '';
        end
        else
        begin
                StartPos := StartPos  + Length('"' + Key + '":');
                if Copy(Data,StartPos,1) = '[' then StartPos := StartPos + 1;

                count := 0;

                for i := StartPos-1 to Length(Data) do
                begin
                        if Data[i] = '[' then
                        begin
                            count := count + 1;
                            if count = 1 then startpos := i + 1;
                        end;

                        if Data[i] = ']' then
                        begin
                             count := count - 1;
                             if count = 0 then endpos := i;
                        end;
                end;

                if EndPos = 0 then EndPos := PosFrom('}',Data,StartPos);
                if EndPos = 0 then raise ELinkhubException.Create(-99999999,'JSON PARSING ERROR');

                if Copy(Data,EndPos-1,1) = '"' then EndPos := EndPos;

                if StartPos = EndPos then begin
                        targetJson := '';
                end
                else begin
                        targetJson := Copy(Data,StartPos,EndPos-StartPos);
                        result:= ParseTotalJsonList(targetJson);
                end;
        end;
end;

function ParseTotalJsonList(inputJson : String) : ArrayOfString;
var
        i,level,startpos,endpos,count : integer;
        comment : boolean;
begin
        startpos := 0;
        count := 0;
        SetLength(result,count);
        level := 0;
        comment := false;

        for i:=0 to Length(inputJson) do
        begin
                if (inputJson[i] = '"') and ((i = 0) or (inputJson[i-1] <> #92)) then comment := not comment;
                if comment then continue;
                
                if inputJson[i] = '{' then
                begin
                    level := level + 1;
                    if level  = 1 then startpos := i;
                end;

                if inputJson[i] = '}' then
                begin
                    level := level - 1;
                    if level  = 0 then
                    begin
                         count := count + 1;
                         SetLength(result,count);
                         endpos := i;
                         result[count - 1 ] := Copy(inputJson,startpos,endpos-startpos + 1);
                    end
                end;
        end;
end;


function ParseJsonList(inputJson : String) : ArrayOfString;
var
        delimiter, i,level,startpos,endpos,count : integer;
        comment : boolean;
        special : boolean;
begin
        startpos := 0;
        count := 0;
        SetLength(result,count);
        level := 0;
        comment := false;
        special := false;

        for i:=0 to Length(inputJson) do
        begin
                if comment and (inputJson[i] = #92) and (not special)then
                begin
                        special := true;
                        continue;
                end;

                if ((inputJson[i] = '"') and (not special)) then comment := not comment;

                special := false;
                
                if comment then continue;
                        
                if inputJson[i] = '{' then
                begin
                    level := level + 1;
                    if level  = 1 then startpos := i;
                end;

                if inputJson[i] = '}' then
                begin
                    level := level - 1;
                    if level  = 0 then begin
                         count := count + 1;
                         SetLength(result,count);
                         endpos := i;
                         result[count - 1 ] := Copy(inputJson,startpos,endpos-startpos + 1);
                    end
                end;
        end;

        // '}' 가 포함되지 않은 경우 ["data", "data2"]
        if count = 0 then
        begin
            delimiter := 1;
            for i:=0 to Length(inputJson) do
            begin

                if inputJson[i] = '"' then
                begin
                        delimiter := delimiter mod 2;

                        if delimiter = 1 then
                        begin
                            startpos := i + 1;
                            delimiter := delimiter + 1;
                            Continue;
                        end;

                        if delimiter = 0 then
                        begin
                            delimiter := delimiter + 1;
                            endpos := i-1;
                            count := count + 1;
                            SetLength(result,count);
                            result[count-1] := Copy(inputJson, startpos, endpos-startpos+1);
                        end;

                end;
            end;
        end;
end;

function skiptoSquareBracket(Data : String; index : integer) : integer;
var
        bComment : boolean;
        llevel : integer;
begin
        bComment:=false;
        llevel := 0;

        while( index <= Length(Data) ) do
        begin
                case Data[index] of
                       #92: index := index + 1;
                       #34: bComment := not bComment;
                       '[': if not bComment then llevel := llevel + 1;
                       ']':
                       begin
                                if not bComment then
                                begin
                                        if llevel < 1 then break else llevel := llevel -1;
                                end;
                       end;
                end;
                index := index +1;
        end;
        result := index;
end;

function IfThen(condition :boolean; trueVal :String ; falseVal : String) : string;
begin
    if condition then result := trueVal else result := falseVal;
end;

end.
