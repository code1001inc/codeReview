(*
*=================================================================================
* Unit for base module for Popbill API SDK. It include base functionality for
* RESTful web service request and parse json result. It uses Linkhub module
* to accomplish authentication APIs.
*
* http://www.popbill.com
* Author : Kim Seongjun (pallet027@gmail.com)
* Contributor : Jeong Yohan
* Written : 2014-03-22
* Updated : 2019-09-25
* Update Log
* - (2017-03-08) : HTTP OleObject Exception Handling
* - (2017-05-23) : UpdateContact API bug fixed
* - (2017-12-28) : fixed Compile Directive for Updated Compiler
* - (2018-03-12) : HTTPPost override contentsType
* - (2018-11-21) : popbill URL API update
* - (2019-09-25) : IPRestrictOnOff Configuration
*=================================================================================
*)

unit Popbill;

interface

{$IFDEF VER130}
{$DEFINE D5}
{$ENDIF}

uses
        Windows, Messages,TypInfo, SysUtils, Classes ,ComObj,ActiveX,{$IFNDEF D5}Variants,{$ENDIF}Linkhub;

{$IFDEF CONDITIONALEXPRESSIONS}
  {$IF System.CompilerVersion >= 24.0}
    {$LEGACYIFEND ON}
    {$DEFINE COMPILER15_UP}
  {$IFEND}
{$ENDIF}

const
        ServiceID_REAL = 'POPBILL';
        ServiceID_TEST = 'POPBILL_TEST';
        ServiceURL_REAL = 'https://popbill.linkhub.co.kr';
        ServiceURL_TEST = 'https://popbill-test.linkhub.co.kr';
        APIVersion = '1.0';
        CR = #$0d;
        LF = #$0a;
        CRLF = CR + LF;
type
        TResponse = Record
                code : LongInt;
                message : string;
        end;


        TJoinForm = Record
                LinkID          : string;
                CorpNum         : string;
                CEOName         : string;
                CorpName        : string;
                Addr            : string;
                ZipCode         : string;
                BizType         : string;
                BizClass        : string;
                ID              : string;
                PWD             : string;
                ContactName     : string;
                ContactTEL      : string;
                ContactHP       : string;
                ContactFAX      : string;
                ContactEmail    : string;
        end;

        TJoinContact = Record
                id              : string;
                pwd             : string;
                personName      : string;
                tel             : string;
                hp              : string;
                fax             : string;
                email           : string;
                searchAllAllowYN : Boolean;
                mgrYN           : Boolean;
        end;

        TFile = class
        public
                FieldName       : string;
                FileName        : string;
                Data            : TStream;
                destructor Destroy; override;
        end;

        TFileList = Array Of TFile;

        TContactInfo = class
        public
                id              : string;
                email           : string;
                hp              : string;
                personName      : string;
                searchAllAllowYN : Boolean;
                tel             : string;
                fax             : string;
                mgrYN           : Boolean;
                regDT           : string;
                state           : integer;
        end;
        TContactInfoList = Array Of TContactInfo;

        TCorpInfo = class
        public
                CeoName         : string;
                CorpName        : string;
                Addr            : string;
                BizType         : string;
                BizClass        : string;
        end;

        TPopbillBaseService = class
        private
                FLastErrCode : LongInt;
                FLastErrMessage : String;        
                procedure initLastError();

                function jsonToTCorpInfo(json : String) : TCorpInfo;
                function jsonToTContactInfo(json : String) : TContactInfo;
                function TCorpInfoTojson(CorpInfo : TCorpInfo) : String;
                function TContactToJson(Contact : TContactInfo) : String;

        protected
                FToken     : TToken;
                FIsTest    : bool;
                FIPRestrictOnOff    : bool;                
                FIsThrowException : bool;
                FTokenCorpNum : String;
                FAuth      : TAuth;
                FScope     : Array Of String;
                procedure setIsTest(value : bool);
                procedure setIsThrowException(value : bool);
                procedure setIPRestrictOnOff(value : bool);                
                procedure setLastErrCode(value : LongInt);
                procedure setLastErrMessage(value : String);

                function getSession_Token(CorpNum : String) : String;
                function httpget(url : String; CorpNum : String; UserID : String) : String;
                function httppost(url : String; CorpNum : String; UserID : String ; request : String) : String; overload;
                function httppost(url : String; CorpNum : String; UserID : String ; request : String; Action : String; ContentsType : String = '') : String; overload;
                function httppost(url : String; CorpNum : String; UserID : String ; FieldName,FileName : String; data: TStream) : String; overload;
                function httppost(url : String; CorpNum : String; UserID : String ; files : TFileList) : String; overload;
                function httppost(url : String; CorpNum : String; UserID : String ; form : String; files : TFileList) : String; overload;


        public
                constructor Create(LinkID : String; SecretKey : String);

                procedure AddScope(Scope : String);

                //팝빌 팝업 url.
                function GetPopbillURL(CorpNum : String; UserID : String; TOGO : String) : String; overload;
                //팝빌 팝업 url overload
                function GetPopbillURL(CorpNum : String; TOGO : String) : String; overload;

                //팝빌 로그인 URL
                function GetAccessURL(CorpNum : String; UserID : String) : String;

                //팝빌 연동회원 포인트 충전 URL
                function GetChargeURL(CorpNum : String; UserID : String) : String;

                //연동회원 가입.
                function JoinMember(JoinInfo : TJoinForm) : TResponse;
                //가입여부 확인
                function CheckIsMember(CorpNum : String; LinkID : String) : TResponse;
                //잔여 포인트 조회.
                function GetBalance(CorpNum : String) : Double;
                //파트너 잔여포인트 조회.
                function GetPartnerBalance(CorpNum : String) : Double;

                //파트너 포인트 충전 URL.
                function GetPartnerURL(CorpNum : String; TOGO : String) : String;

                function getServiceID() : String;

                //연동회원 아이디 중복 확인
                function CheckID(ID : String) : TResponse;

                // 담당자 목록 조회.
                function ListContact(CorpNum : String; UserID : string) : TContactInfoList; overload;
                // 담당자 목록 조회 overload
                function ListContact(CorpNum : String) : TContactInfoList; overload;


                // 담당자 정보 수정
                function UpdateContact(CorpNum : String; CorpInfo : TContactInfo; UserID : String) : TResponse;

                // 담당자 추가
                function RegistContact(CorpNum : String; JoinInfo : TJoinContact; UserID : String) : TResponse; overload;
                // 담당자 추가, overload
                function RegistContact(CorpNum : String; JoinInfo : TJoinContact) : TResponse; overload;

                // 회사정보 확인
                function GetCorpInfo(CorpNum : String; UserID : String) : TCorpInfo; overload;
                // 회사정보 확인. overload
                function GetCorpInfo(CorpNum : String) : TCorpInfo; overload;

                // 회사정보 수정
                function UpdateCorpInfo(CorpNum : String; CorpInfo : TCorpInfo; UserID : String) : TResponse; overload;
                // 회사정보 수정. overload
                function UpdateCorpInfo(CorpNum : String; CorpInfo : TCorpInfo) : TResponse; overload;

                destructor Destroy; override;

        published
                //TEST Mode. default is false.
                property IsTest : bool read FIsTest write setIsTest;
                property IPRestrictOnOff : bool read FIPRestrictOnOff write setIPRestrictOnOff;                
                property IsThrowException : bool read FIsThrowException write setIsThrowException;
                property LastErrCode : LongInt read FLastErrCode write setLastErrCode;
                property LastErrMessage : String read FLastErrMessage write setLastErrMessage;
        end;

        EPopbillException  = class(Exception)
        private
                FCode : LongInt;
        public
                constructor Create(code : LongInt; Message : String);
        published
                property code : LongInt read FCode write FCode;
        end;

        procedure WriteStrToStream(const Stream: TStream; Value: AnsiString);

implementation

destructor TPopbillBaseService.Destroy;
begin
  setlength(FScope,0);
  FScope := nil;
  
  if Assigned(FToken) then
    FToken.Free;
  if Assigned(FAuth) then
    FAuth.Free;
  inherited Destroy;
end;

destructor TFile.Destroy;
begin
  if Assigned(Data) then
    Data.Free;
  inherited Destroy;
end;

constructor EPopbillException.Create(code : LongInt; Message : String);
begin
        inherited Create(Message);
        FCode := code;
end;

constructor TPopbillBaseService.Create(LinkID : String; SecretKey : String);
begin
       FIstest := false; //기본값.
       FIsThrowException := true; //기본값.
       FIPRestrictOnOff := true; //기본값.       
       FAuth := TAuth.Create(LinkID,SecretKey);
       setLength(FScope,1);
       FScope[0] := 'member';
end;

procedure TPopbillBaseService.AddScope(scope : String);
begin
        setLength(FScope,length(FScope)+1);
        FScope[length(FScope)-1] := scope;
end;

procedure TPopbillBaseService.initLastError();
begin
        FLastErrCode := 0;
        FLastErrMessage := '';
end;

procedure TPopbillBaseService.setIsTest(value : bool);
begin
        FIsTest := value;
end;

procedure TPopbillBaseService.setIPRestrictOnOff(value : bool);
begin
        FIPRestrictOnOff := value;
end;

procedure TPopbillBaseService.setIsThrowException(value : bool);
begin
        FIsThrowException := value;
end;

procedure TPopbillBaseService.setLastErrCode(value : LongInt);
begin
        FLastErrCode := value;
end;

procedure TPopbillBaseService.setLastErrMessage(value : String);
begin
        FLastErrMessage := value;
end;


function TPopbillBaseService.getServiceID() : String;
begin
    if(FIsTest) then result := ServiceID_TEST
    else result := ServiceID_REAL;
end;

function TPopbillBaseService.getSession_Token(CorpNum : String) : String;
var
        noneOrExpired : bool;
        Expiration : TDateTime;
begin
        if FToken = nil then noneOrExpired := true
        else begin
                if FTokenCorpNum <> CorpNum then noneOrExpired := true
                else begin
                        Expiration := UTCToDate(FToken.expiration);
                        noneOrExpired := expiration < UTCToDate(FAuth.getTime());
                end;
        end;

        if noneOrExpired then
        begin

                try
                        if FIPRestrictOnOff then FToken := FAuth.getToken(getServiceID(), CorpNum, FScope)
                        else FToken := FAuth.getToken(getServiceID(), CorpNum, FScope, '*');

                        FTokenCorpNum := CorpNum;
                except on le:ELinkhubException do
                        raise EPopbillException.Create(le.code,le.message);
                end;
        end;
        result := FToken.session_token;
end;

function TPopbillBaseService.httppost(url : String; CorpNum : String; UserID : String ; request : String) : String;
begin
        result := httppost(url,CorpNum,UserID,request,'');
end;

function TPopbillBaseService.httppost(url : String; CorpNum : String; UserID : String ; request : String; action:String; contentsType:String) : String;
var
        http : olevariant;
        postdata : olevariant;
        response : string;
        sessiontoken : string;
     
begin

        initLastError();
        
        if FIsTest then url := ServiceURL_TEST + url
             else url := ServiceURL_REAL + url;

        postdata := request;

        try
                http := createoleobject('MSXML2.XMLHTTP.6.0');
                http.open('POST',url);

                if(CorpNum <> '') then
                begin
                        sessiontoken := getSession_Token(CorpNum);
                        HTTP.setRequestHeader('Authorization', 'Bearer ' + sessiontoken);
                end;
                if(action <> '') then
                begin
                        HTTP.setRequestHeader('X-HTTP-Method-Override',action);
                end;


                if(contentsType<> '') then
                begin
                     HTTP.setRequestHeader('Content-Type',contentsType);
                end
                else
                begin 
                     HTTP.setRequestHeader('Content-Type','Application/json ;');
                end;

                http.setRequestHeader('Accept-Encoding','gzip,deflate');
                HTTP.setRequestHeader('x-lh-version',APIVersion);

                if UserID <> '' then
                begin
                        HTTP.setRequestHeader('x-pb-userid',UserID);
                end;

                http.send(postdata);
        except
                On PE : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(PE.code, PE.Message);
                                exit;                        
                        end;

                        setLastErrCode(PE.code);
                        setLastErrMessage(PE.Message);
                        exit;
                end;
                On E : Exception do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(-99999999, 'Fail to httppost() - ['+ E.ClassName + '] '+ E.Message);
                                exit;                
                        end;

                        setLastErrCode(-99999999);
                        setLastErrMessage('Fail to httppost() - ['+ E.ClassName + '] '+ E.Message);
                        exit;
                end;
        end;        

        response := http.responsetext;

        if HTTP.Status <> 200 then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(getJSonInteger(response,'code'),getJSonString(response,'message'));
                        exit;
                end;
                setLastErrCode(getJSonInteger(response,'code'));
                setLastErrMessage(getJSonString(response,'message'));
                exit;
        end;
        result := response;
end;
function TPopbillBaseService.httppost(url : String; CorpNum : String; UserID : String ; files : TFileList) : String;
begin
        result := httppost(url,CorpNum,UserID,'',files);
end;

function MemoryStreamToOleVariant(const Strm: TMemoryStream): OleVariant;
var 
        Data: PByteArray;
begin 
        Result := VarArrayCreate ([0, Strm.Size - 1], varByte);
        Data := VarArrayLock(Result);
        try
                Strm.Position := 0;
                Strm.ReadBuffer(Data^, Strm.Size);
        finally
                VarArrayUnlock(Result);
        end;
end;

function TPopbillBaseService.httppost(url : String; CorpNum : String; UserID : String ; form : String; files : TFileList) : String;
var
        HTTP: olevariant;
        postdata : olevariant;
        response : string;
        sessiontoken : string;
        Bound,s : WideString;
        tmp : {$IFDEF COMPILER15_UP}TArray<Byte>{$ELSE}Array of Byte{$ENDIF};
        i,intTemp : Integer;
        Stream: TMemoryStream;
begin
        initLastError();
        
        Bound := '==POPBILL_DELPHI_SDK==';
        Stream := TMemoryStream.Create;

        if FIsTest then url := ServiceURL_TEST + url
             else url := ServiceURL_REAL + url;

        postdata := form;

        try
                http := createoleobject('MSXML2.XMLHTTP.6.0');
                http.open('POST',url);

                if(CorpNum <> '') then
                begin
                        sessiontoken := getSession_Token(CorpNum);
                        HTTP.setRequestHeader('Authorization', 'Bearer ' + sessiontoken);
                end;

                HTTP.setRequestHeader('x-lh-version',APIVersion);
                http.setRequestHeader('Accept-Encoding','gzip,deflate');

                if UserID <> '' then
                begin
                        HTTP.setRequestHeader('x-pb-userid',UserID);
                end;

                if form <> '' then begin
                        s := '--' + Bound + CRLF;
                        s := s + 'content-disposition: form-data; name="form"' + CRLF;
                        s := s + 'content-type: Application/json; charset=euc-kr' + CRLF + CRLF;
                        s := s + form + CRLF;
                        WriteStrToStream(Stream, s);
                end;

                for i:=0 to Length(files) -1 do begin

                        // Start Of Part
                        s := '--' + Bound + CRLF;
                        s := s + 'content-disposition: form-data; name="' + files[i].FieldName + '";';
                        s := s + ' filename="' + files[i].FileName +'"' + CRLF;
                        s := s + 'Content-Type: Application/octet-stream' + CRLF + CRLF;

                        {$IFDEF COMPILER15_UP}
                        tmp := TEncoding.UTF8.GetBytes(s);
                        {$ELSE}
                        SetLength(tmp,Length(s)*3);
                        intTemp := UnicodeToUtf8(@tmp[0], Length(tmp),PWideChar(s),Length(s));
                        SetLength(tmp,intTemp-1);
                        {$ENDIF}
                        Stream.Write(tmp[0], length(tmp));

                        Stream.CopyFrom(files[i].Data, 0);

                        WriteStrToStream(Stream, CRLF);
                end;

                //End Of MultiPart
                WriteStrToStream(Stream, '--' + Bound + '--' + CRLF);


                HTTP.setRequestHeader('Content-Type','multipart/form-data; boundary=' + Bound);


                http.send(MemoryStreamToOleVariant(Stream));
                Stream.free;
        except
                On PE : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(PE.code, PE.Message);
                                exit;                        
                        end
                        else
                        begin
                                setLastErrCode(PE.code);
                                setLastErrMessage(PE.Message);
                                exit;
                        end;

                end;
                On E : Exception do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(-99999999, 'Fail to httppost() - ['+ E.ClassName + '] '+ E.Message);
                                exit;
                        end
                        else
                        begin
                                setLastErrCode(-99999999);
                                setLastErrMessage('Fail to httppost() - ['+ E.ClassName + '] '+ E.Message);
                                exit; 
                        end;
                end;
        end;


        response := http.responsetext;

        if HTTP.Status <> 200 then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(getJSonInteger(response,'code'),getJSonString(response,'message'));
                        exit;
                end
                else
                begin
                        setLastErrCode(getJSonInteger(response,'code'));
                        setLastErrMessage(getJSonString(response,'message'));
                        exit; 
                end;
        end;
        result := response;
end;
                                
function TPopbillBaseService.httppost(url : String; CorpNum : String; UserID : String ; FieldName,FileName : String; data: TStream) : String;
var
        files : TFileList;
begin
        SetLength(files,1);
        files[0] := TFile.Create;
        files[0].FieldName := FieldName;
        files[0].FileName := FileName;
        files[0].Data := data;

        result := httppost(url,CorpNum,UserID,files);
end;

function TPopbillBaseService.httpget(url : String; CorpNum : String; UserID : String) : String;
var
        HTTP: olevariant;
        response : string;
        sessiontoken : string;
begin

        initLastError();
        
        if FIsTest then url := ServiceURL_TEST + url
             else url := ServiceURL_REAL + url;
             
        try
                http := createoleobject('MSXML2.XMLHTTP.6.0');
                http.open('GET',url);

                if(CorpNum <> '') then
                begin
                        sessiontoken := getSession_Token(CorpNum);
                        HTTP.setRequestHeader('Authorization','Bearer ' + sessiontoken);
                end;

                HTTP.setRequestHeader('x-lh-version', APIVersion);
                http.setRequestHeader('Accept-Encoding','gzip,deflate');

                if UserID <> '' then
                begin
                        HTTP.setRequestHeader('x-pb-userid',UserID);
                end;

                http.send;
        except
                On PE : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(PE.code, PE.Message);
                                exit;
                        end
                        else
                        begin
                                setLastErrCode(PE.code);
                                setLastErrMessage(PE.Message);
                                exit;
                        end;

                end;                        
                On E : Exception do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(-99999999, 'Fail to httpget() - ['+ E.ClassName + '] '+ E.Message);
                                exit;
                        end
                        else
                        begin
                                setLastErrCode(-99999999);
                                setLastErrMessage('Fail to httpget() - ['+ E.ClassName + '] '+ E.Message);
                                exit;
                        end;
                end;
        end;
              

        response := http.responsetext;

        if HTTP.status <> 200 then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(getJSonInteger(response,'code'),getJSonString(response,'message'));
                        exit;                
                end
                else
                begin
                        setLastErrCode(getJSonInteger(response,'code'));
                        setLastErrMessage(getJSonString(response,'message'));
                        exit;  
                end;

        end;
        
        result := response;

end;

function TPopbillBaseService.CheckID(ID : String) : TResponse;
var
        responseJson : String;
begin
        try
                responseJson := httpget('/IDCheck?ID=' + ID, '','');

                result.code := getJSonInteger(responseJson,'code');
                result.message := getJSonString(responseJson,'message');
        except
                on PE : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(PE.code,PE.Message);
                        end;

                        result.code := PE.code;
                        result.message := PE.Message;
                end;
        end;
end;

function TPopbillBaseService.GetCorpInfo(CorpNum : String) : TCorpInfo;
begin
        result := GetCorpInfo(CorpNum, '')
end;

function TPopbillBaseService.GetCorpInfo(CorpNum : String; UserID: String) : TCorpInfo;
var
        responseJson : string;
begin
        responseJson := httpget('/CorpInfo', CorpNum, UserID);

        result := jsonToTCorpInfo(responseJson);

end;

function TPopbillBaseService.jsonToTCorpInfo(json : String) : TCorpInfo;
begin
        result := TCorpInfo.Create;

        result.CeoName           := getJSonString(json,'ceoname');
        result.CorpName          := getJSonString(json,'corpName');
        result.Addr              := getJSonString(json,'addr');
        result.BizType           := getJSonString(json,'bizType');
        result.BizClass          := getJSonString(json,'bizClass');
end;

function TPopbillBaseService.UpdateContact(CorpNum : String; CorpInfo :TContactInfo; UserID : String) : TResponse;
var
        requestJson : string;
        responseJson : string;
begin

        try
                requestJson := TContactTojson(CorpInfo);
                responseJson := httppost('/IDs',CorpNum,UserID,requestJson);


        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code,le.Message);
                        end;

                        result.code := le.code;
                        result.message := le.Message;
                end;
        end;

        if LastErrCode <> 0 then
        begin
                result.code := LastErrCode;
                result.message := LastErrMessage;
        end
        else
        begin
                result.code := getJSonInteger(responseJson,'code');
                result.message := getJSonString(responseJson,'message');
        end;
end;



function TPopbillBaseService.TContactToJson(Contact : TContactInfo) : String;
var
        requestJson : string;
begin
        requestJson := '{';
        
        if Contact.searchAllAllowYN then
        requestJson := requestJson + '"searchAllAllowYN":true,';

        if Contact.mgrYN then
        requestJson := requestJson + '"mgrYN":true,';

        requestJson := requestJson + '"id":"'+ EscapeString(Contact.id) +'",';
        requestJson := requestJson + '"personName":"'+ EscapeString(Contact.personName) +'",';
        requestJson := requestJson + '"tel":"'+ EscapeString(Contact.tel) +'",';
        requestJson := requestJson + '"hp":"'+ EscapeString(Contact.hp) +'",';
        requestJson := requestJson + '"email":"'+ EscapeString(Contact.email) +'",';
        requestJson := requestJson + '"fax":"'+ EscapeString(Contact.fax) +'"';
        requestJson := requestJson + '}';
        result := requestJson;
end;

function TPopbillBaseService.UpdateCorpInfo(CorpNum : String; CorpInfo : TCorpInfo) : TResponse;
begin
        result := UpdateCorpInfo(CorpNum, CorpInfo, '');
end;

function TPopbillBaseService.UpdateCorpInfo(CorpNum : String; CorpInfo : TCorpInfo; UserID : String) : TResponse;
var
        requestJson : string;
        responseJson : string;
begin
        try
                requestJson := TCorpInfoToJson(CorpInfo);

                responseJson := httppost('/CorpInfo',CorpNum,UserID,requestJson);


        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code,le.Message);
                        end;

                        result.code := le.code;
                        result.message := le.Message;
                end;
        end;

        if LastErrCode <> 0 then
        begin
                result.code := LastErrCode;
                result.message := LastErrMessage;
                exit;
        end
        else
        begin
                result.code := getJSonInteger(responseJson,'code');
                result.message := getJSonString(responseJson,'message');
        end;


end;

function TPopbillBaseService.TCorpInfoToJson(CorpInfo : TCorpInfo) : String;
var
        requestJson : string;
begin
        requestJson := '{';
        requestJson := requestJson + '"ceoname":"'+ EscapeString(CorpInfo.ceoname) +'",';
        requestJson := requestJson + '"corpName":"'+ EscapeString(CorpInfo.corpName) +'",';
        requestJson := requestJson + '"addr":"'+ EscapeString(CorpInfo.addr) +'",';
        requestJson := requestJson + '"bizType":"'+ EscapeString(CorpInfo.bizType) +'",';
        requestJson := requestJson + '"bizClass":"'+ EscapeString(CorpInfo.bizClass)+'"';
        requestJson := requestJson + '}';
        result := requestJson;
end;

function TPopbillBaseService.ListContact(CorpNum : String) : TContactInfoList;
begin
        Result := ListContact(CorpNum, '')
end;


function TPopbillBaseService.ListContact(CorpNum : String; UserID : String) : TContactInfoList;
var
        responseJson : string;
        jSons : ArrayOfString;
        i : Integer;
begin
        responseJson := httpget('/IDs',CorpNum, UserID);

        if LastErrCode <> 0 then
        begin
                exit;
        end
        else
        begin
                try
                        jSons := ParseJsonList(responseJson);
                        SetLength(result,Length(jSons));

                        for i := 0 to Length(jSons)-1 do
                        begin
                                result[i] := jsonToTContactInfo(jSons[i]);
                        end;

                except
                        on E:Exception do
                        begin
                                if FIsThrowException then
                                begin
                                        raise EPopbillException.Create(-99999999,'결과처리 실패.[Malformed Json]');
                                end
                                else
                                begin
                                        SetLength(result, 0);
                                        setLastErrCode(-99999999);
                                        setLastErrMessage('결과처리 실패.[Malformed Json]');
                                end;
                        end;
                end;
        end;
end;

function TPopbillBaseService.jsonToTContactInfo(json : String) : TContactInfo;
begin
        result := TContactInfo.Create;

        result.id := getJSonString(json,'id');
        result.email := getJSonString(json,'email');
        result.hp := getJSonString(json,'hp');
        result.personName := getJSonString(json,'personName');
        result.searchAllAllowYN := getJSonBoolean(json,'searchAllAllowYN');
        result.tel := getJSonString(json,'tel');
        result.fax := getJSonString(json,'fax');
        result.mgrYN := getJSonBoolean(json,'mgrYN');
        result.regDT := getJSonString(json,'regDT');
        result.state := getJSonInteger(json,'state');
end;


function TPopbillBaseService.getPopbillURL(CorpNum : String; TOGO : String) : String;
begin
        Result := getPopbillURL(CorpNum, '', TOGO);
end;


function TPopbillBaseService.getPopbillURL(CorpNum : String; UserID : String; TOGO : String) : String;
var
        responseJson : String;
begin
        responseJson := httpget('/?TG=' + TOGO, CorpNum, UserID);
        result := getJSonString(responseJson,'url');
end;

function TPopbillBaseService.getAccessURL(CorpNum : String; UserID : String) : String;
var
        responseJson : String;
begin
        responseJson := httpget('/?TG=LOGIN', CorpNum, UserID);
        result := getJSonString(responseJson,'url');
end;

function TPopbillBaseService.getChargeURL(CorpNum : String; UserID : String) : String;
var
        responseJson : String;
begin
        responseJson := httpget('/?TG=CHRG', CorpNum, UserID);
        result := getJSonString(responseJson,'url');
end;


function TPopbillBaseService.RegistContact(CorpNum : String; JoinInfo : TJoinContact) : TResponse;
begin
        Result := RegistContact(CorpNum, JoinInfo, '');
end;

function TPopbillBaseService.RegistContact(CorpNum : String; JoinInfo : TJoinContact; UserID : String) : TResponse;
var
        requestJson : string;
        responseJson : string;
begin
        try
                requestJson := '{';

                if JoinInfo.searchAllAllowYN then
                requestJson := requestJson + '"searchAllAllowYN":true,';

                if JoinInfo.mgrYN then
                requestJson := requestJson + '"mgrYN":true,';

                requestJson := requestJson + '"id":"'+EscapeString(JoinInfo.id)+'",';
                requestJson := requestJson + '"pwd":"'+EscapeString(JoinInfo.pwd)+'",';
                requestJson := requestJson + '"personName":"'+EscapeString(JoinInfo.personName)+'",';
                requestJson := requestJson + '"tel":"'+EscapeString(JoinInfo.tel)+'",';
                requestJson := requestJson + '"hp":"'+EscapeString(JoinInfo.hp)+'",';
                requestJson := requestJson + '"fax":"'+EscapeString(JoinInfo.fax)+'",';
                requestJson := requestJson + '"email":"'+EscapeString(JoinInfo.email)+'"';
                requestJson := requestJson + '}';

                responseJson := httppost('/IDs/New',CorpNum,UserID,requestJson);

                if LastErrCode <> 0 then
                begin
                        result.code := LastErrCode;
                        result.message := LastErrMessage;
                end
                else
                begin
                        result.code := getJSonInteger(responseJson,'code');
                        result.message := getJSonString(responseJson,'message');
                end;
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code,le.Message);
                        end
                        else
                        begin
                                result.code := le.code;
                                result.Message := le.Message;
                        end;
                end;
        end;

end;

function TPopbillBaseService.JoinMember(JoinInfo : TJoinForm) : TResponse;
var
        requestJson : string;
        responseJson : string;
begin
        try
                requestJson := '{';
                requestJson := requestJson + '"LinkID":"'+EscapeString(JoinInfo.LinkID)+'",';

                requestJson := requestJson + '"CorpNum":"'+EscapeString(JoinInfo.CorpNum)+'",';
                requestJson := requestJson + '"CEOName":"'+EscapeString(JoinInfo.CEOName)+'",';
                requestJson := requestJson + '"CorpName":"'+EscapeString(JoinInfo.CorpName)+'",';
                requestJson := requestJson + '"Addr":"'+EscapeString(JoinInfo.Addr)+'",';
                requestJson := requestJson + '"ZipCode":"'+EscapeString(JoinInfo.ZipCode)+'",';
                requestJson := requestJson + '"BizType":"'+EscapeString(JoinInfo.BizType)+'",';
                requestJson := requestJson + '"BizClass":"'+EscapeString(JoinInfo.BizClass)+'",';
                requestJson := requestJson + '"ContactName":"'+EscapeString(JoinInfo.ContactName)+'",';
                requestJson := requestJson + '"ContactEmail":"'+EscapeString(JoinInfo.ContactEmail)+'",';
                requestJson := requestJson + '"ContactTEL":"'+EscapeString(JoinInfo.ContactTEL)+'",';
                requestJson := requestJson + '"ContactHP":"'+EscapeString(JoinInfo.ContactHP)+'",';
                requestJson := requestJson + '"ContactFAX":"'+EscapeString(JoinInfo.ContactFAX)+'",';
                requestJson := requestJson + '"ID":"'+EscapeString(JoinInfo.ID)+'",';
                requestJson := requestJson + '"PWD":"'+EscapeString(JoinInfo.PWD)+'"';

                requestJson := requestJson + '}';

                responseJson := httppost('/Join','','',requestJson);
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code,le.Message);
                        end;
                        
                        result.code := le.code;
                        result.message := le.Message;
                end;
        end;
        
        if LastErrCode <> 0 then
        begin
                result.code := LastErrCode;
                result.message := LastErrMessage;
                exit;
        end
        else
        begin
                result.code := getJSonInteger(responseJson,'code');
                result.message := getJSonString(responseJson,'message');
        end;        

end;
function TPopbillBaseService.CheckIsMember(CorpNum : String; LinkID : String) : TResponse;
var
        responseJson : string;
begin
        try
                responseJson := httpget('/Join?CorpNum=' + CorpNum + '&LID=' + LinkID,'','');

                result.code := getJSonInteger(responseJson,'code');
                result.message := getJSonString(responseJson,'message');
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code,le.Message);
                        end;

                        result.code := le.code;
                        result.message := le.Message;
                end;
        end;
end;

function TPopbillBaseService.GetPartnerURL(CorpNum : String; TOGO : String) : String;
begin
        try
                result := FAuth.getPartnerURL(getSession_Token(CorpNum),getServiceID(), TOGO);
        except
                on le : ELinkhubException do begin
                        raise EPopbillException.Create(le.code,le.Message);
                end;
        end;
end;

function TPopbillBaseService.GetBalance(CorpNum : String) : Double;
begin
        try
                result := FAuth.getBalance(getSession_Token(CorpNum),getServiceID());
        except
                on le : ELinkhubException do begin
                        raise EPopbillException.Create(le.code,le.Message);
                end;
        end;
end;

function TPopbillBaseService.GetPartnerBalance(CorpNum : String) : Double;
begin
        try
                result := FAuth.getPartnerBalance(getSession_Token(CorpNum),getServiceID());
        except
                on le : ELinkhubException do begin
                        raise EPopbillException.Create(le.code,le.Message);
                end;
        end;
end;

procedure WriteStrToStream(const Stream: TStream; Value: AnsiString);
{$IFDEF CIL}
var
  buf: Array of Byte;
{$ENDIF}
begin
{$IFDEF CIL}
  buf := BytesOf(Value);
  Stream.Write(buf,length(Value));
{$ELSE}
  Stream.Write(PAnsiChar(Value)^, Length(Value));
{$ENDIF}
end;

end.
