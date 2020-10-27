(*
*=================================================================================
* Unit for base module for Popbill FAX API SDK. Main functionality is to
* send FAX with document file.( ex. pdf, doc, xls, hwp etc.)
*
* For strongly secured communications, this module uses SSL/TLS with OpenSSL.
*
* http://www.popbill.com
* Author : Kim Seongjun (pallet027@gmail.com)
* Contributor : Jeong Yohan (code@linkhub.co.kr)
* Written : 2014-04-08
* Updated : 2019-05-03
* Thanks for your interest. 
*=================================================================================
*)
unit PopbillFax;

interface
uses
        TypInfo,SysUtils,Classes,
        Popbill,
        Linkhub;
type
        TFaxChargeInfo = class
        public
                unitCost : string;
                chargeMethod : string;
                rateSystem : string;
        end;

        
        TReceiver = class
        public
                receiveNum : String;
                receiveName : String;
        end;
        TReceiverList = Array of TReceiver;

        TFaxDetail = class
        public
                state : Integer;
                result : Integer;
                sendNum : String;
                senderName : String;
                receiveNum : String;
                receiveName : String;
                title : String;
                sendPageCnt : Integer;
                successPageCnt : Integer;
                failPageCnt : Integer;
                refundPageCnt : Integer;
                cancelPageCnt : Integer;
                reserveDT : String;
                receiptDT : String;
                sendDT : String;
                resultDT : String;
                fileNames : ArrayOfString;
                receiptNum : String;
                requestNum : String;
                chargePageCnt : Integer;
                tiffFileSize  : String;

                sendState : Integer;
                convState : Integer;
                sendResult : Integer;
                destructor Destroy; override;
        end;

        TFaxDetailList = Array Of TFaxDetail;

        TFAXSenderNumber = class
        public
                number : string;
                state : integer;
                representYN : Boolean;
        end;

        TFAXSenderNumberList = Array of TFAXSenderNumber;

        TFaxSearchList = class
        public
                code            :       Integer;
                total           :       Integer;
                perPage         :       Integer;
                pageNum         :       Integer;
                pageCount       :       Integer;
                message         :       String;
                list            :       TFaxDetailList;
                destructor Destroy; override;
        end;

        TFaxService = class(TPopbillBaseService)
        private
                function RequestFAX(CorpNum:String; sendnum:String; sendname:String; receivers:TReceiverList; filePaths: Array Of String; reserveDT: String; UserID:String; adsYN:Boolean; title:String = ''; requestNum : String = '') : String;
        public
                constructor Create(LinkID : String; SecretKey : String);

                //회원별 전송 단가 확인.
                function GetUnitCost(CorpNum : String) : Single;

                //팩스전송 단일파일 단일 수신자.
                function SendFAX(CorpNum : String; sendnum : String; receiveNum : String; receiveName : String; filePath : String; reserveDT : String; UserID:String) : String; overload;
                function SendFAX(CorpNum : String; sendnum : String; sendname : String; receiveNum : String; receiveName : String; filePath : String; reserveDT : String; UserID:String) : String; overload;
                function SendFAX(CorpNum : String; sendnum : String; receiveNum : String; receiveName : String; filePath : String; reserveDT : String; UserID:String; adsYN:Boolean) : String; overload;
                function SendFAX(CorpNum : String; sendnum : String; sendname : String; receiveNum : String; receiveName : String; filePath : String; reserveDT : String; UserID:String; adsYN:Boolean) : String; overload;
                function SendFAX(CorpNum : String; sendnum : String; sendname : String; receiveNum : String; receiveName : String; filePath : String; reserveDT : String; UserID:String; adsYN:Boolean; Title:String) : String; overload;
                function SendFAX(CorpNum : String; sendnum : String; sendname : String; receiveNum : String; receiveName : String; filePath : String; reserveDT : String; UserID:String; adsYN:Boolean; Title:String; requestNum : String) : String; overload;


                //팩스전송  단일파일 동보전송
                function SendFAX(CorpNum : String; sendnum : String; receivers : TReceiverList; filePath : String; reserveDT : String; UserID:String) : String; overload;
                function SendFAX(CorpNum : String; sendnum : String; sendname : String; receivers : TReceiverList; filePath : String; reserveDT : String; UserID:String) : String; overload;
                function SendFAX(CorpNum : String; sendnum : String; receivers : TReceiverList; filePath : String; reserveDT : String; UserID:String; adsYN:Boolean) : String; overload;
                function SendFAX(CorpNum : String; sendnum : String; sendname : String; receivers : TReceiverList; filePath : String; reserveDT : String; UserID:String; adsYN:Boolean) : String; overload;
                function SendFAX(CorpNum : String; sendnum : String; sendname : String; receivers : TReceiverList; filePath : String; reserveDT : String; UserID:String; adsYN:Boolean; title:String) : String; overload;
                function SendFAX(CorpNum : String; sendnum : String; sendname : String; receivers : TReceiverList; filePath : String; reserveDT : String; UserID:String; adsYN:Boolean; title:String; requestNum : String) : String; overload;


                //팩스전송  다중파일(최대20개) 단일 수신자
                function SendFAX(CorpNum : String; sendnum : String; receiveNum : String; receiveName : String; filePaths : Array Of String; reserveDT : String; UserID:String) : String; overload;
                function SendFAX(CorpNum : String; sendnum : String; sendname : String; receiveNum : String; receiveName : String; filePaths : Array Of String; reserveDT : String; UserID:String) : String; overload;
                function SendFAX(CorpNum : String; sendnum : String; receiveNum : String; receiveName : String; filePaths : Array Of String; reserveDT : String; UserID:String; adsYN:Boolean) : String; overload;
                function SendFAX(CorpNum : String; sendnum : String; sendname : String; receiveNum : String; receiveName : String; filePaths : Array Of String; reserveDT : String; UserID:String; adsYN:Boolean) : String; overload;
                function SendFAX(CorpNum : String; sendnum : String; sendname : String; receiveNum : String; receiveName : String; filePaths : Array Of String; reserveDT : String; UserID:String; adsYN:Boolean; title:String) : String; overload;
                function SendFAX(CorpNum : String; sendnum : String; sendname : String; receiveNum : String; receiveName : String; filePaths : Array Of String; reserveDT : String; UserID:String; adsYN:Boolean; title:String; requestNum : String) : String; overload;

                //팩스전송  다중파일(최대20개) 동보전송
                function SendFAX(CorpNum : String; sendnum : String; receivers : TReceiverList; filePaths : Array Of String; reserveDT : String; UserID:String) : String; overload;
                function SendFAX(CorpNum : String; sendnum : String; sendname : String; receivers : TReceiverList; filePaths : Array Of String; reserveDT : String; UserID:String) : String; overload;
                function SendFAX(CorpNum : String; sendnum : String; receivers : TReceiverList; filePaths : Array Of String; reserveDT : String; UserID:String; adsYN:Boolean) : String; overload;
                function SendFAX(CorpNum : String; sendnum : String; sendname : String; receivers : TReceiverList; filePaths : Array Of String; reserveDT : String; UserID:String; adsYN:Boolean) : String; overload;
                function SendFAX(CorpNum : String; sendnum : String; sendname : String; receivers : TReceiverList; filePaths : Array Of String; reserveDT : String; UserID:String; adsYN:Boolean; title : String) : String; overload;
                function SendFAX(CorpNum : String; sendnum : String; sendname : String; receivers : TReceiverList; filePaths : Array Of String; reserveDT : String; UserID:String; adsYN:Boolean; title : String; requestNum : String) : String; overload;


                //팩스 재전송(단일, 동보)
                function ResendFAX(CorpNum : String; ReceiptNum : String; sendnum : Variant; sendname : String; receiveNum : String; receiveName : String; reserveDT : String; UserID:String = ''; title:String = ''; requestNum : String = '') : String; overload;
                function ResendFAX(CorpNum : String; ReceiptNum : String; sendnum : Variant; sendname : String; receivers : TReceiverList; reserveDT : String; UserID:String = ''; title:String=''; requestNum : String = '') : String; overload;

                //팩스 재전송(단일, 동보) - 요청번호 할당
                function ResendFAXRN(CorpNum : String; requestNum : String; sendnum : Variant; sendname : String; receiveNum : String; receiveName : String; reserveDT : String; orignalRequestNum : String; UserID:String = ''; title:String = '') : String; overload;
                function ResendFAXRN(CorpNum : String; requestNum : String; sendnum : Variant; sendname : String; receivers : TReceiverList; reserveDT : String; orignalRequestNum : String; UserID:String = ''; title:String='') : String; overload;


                //전송상태 및 상세정보 확인.
                function getSendDetail(CorpNum : String; receiptNum : String; UserID : String = '') : TFaxDetailList;

                //전송상태 및 상세정보 확인 - 요청번호 할당.
                function getSendDetailRN(CorpNum : String; requestNum : String; UserID : String = '') : TFaxDetailList;

                //예약건 전송취소. 예약시간 10분 전까지만 가능.
                function CancelReserve(CorpNum : String; receiptNum : string; UserID : String = '') : TResponse;

                //예약건 전송취소 - 요청번호 할당. 예약시간 10분 전까지만 가능.
                function CancelReserveRN(CorpNum : String; requestNum : string; UserID : String = '') : TResponse;


                 //팩스관련 연결 url.
                function GetURL(CorpNum : String; UserID : String; TOGO : String) : String; overload;

                 //팩스관련 연결 url.
                function GetURL(CorpNum : String; TOGO : String) : String; overload;

                //문자 전송내역  url.
                function GetSentListURL(CorpNum : String; UserID : String) : String;

                //문자 발신번호 관리 url.
                function GetSenderNumberMgtURL(CorpNum : String; UserID : String) : String;

                //팩스 미리보기 url.
                function GetPreviewURL(CorpNum : String; receiptNum : string; UserID : String) : String;


                //팩스 전송내역 조회
                function Search(CorpNum : String; SDate : String; EDate : String; State : Array Of String; ReserveYN : boolean; SenderOnly : boolean; Page : Integer; PerPage : Integer;Order : String; UserID : String = '') : TFaxSearchList; overload;
                function Search(CorpNum : String; SDate : String; EDate : String; State : Array Of String; ReserveYN : boolean; SenderOnly : boolean; Page : Integer; PerPage : Integer;Order : String; QString : String; UserID : String) : TFaxSearchList; overload;

                // 과금정보 확인
                function GetChargeInfo(CorpNum : String) : TFaxChargeInfo;

                // 발신번호 목록 조회
                function GetSenderNumberList(CorpNum : String; UserID : String = '') : TFAXSenderNumberList;
        end;
implementation

destructor TFaxDetail.Destroy;
begin
setlength(filenames,0);
filenames := nil;
end;

destructor TFaxSearchList.Destroy;
var
  I: Integer;
begin
  for I := 0 to Length(list)-1 do
    if Assigned(list[I]) then
      list[I].Free;
  SetLength(list, 0);
  inherited Destroy;
end;

constructor TFaxService.Create(LinkID : String; SecretKey : String);
begin
       inherited Create(LinkID,SecretKey);
       AddScope('160');
end;

function TFaxService.GetUnitCost(CorpNum : String) : Single;
var
        responseJson : string;
begin
        try
                responseJson := httpget('/FAX/UnitCost',CorpNum,'');
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code,le.message);
                                exit;
                        end
                        else
                        begin
                                result := 0.0;
                                exit;
                        end;
                end;
        end;

        if LastErrCode <> 0 then
        begin
                exit;
        end
        else
        begin
                result := strToFloat(getJSonString( responseJson,'unitCost'));
                exit;
        end;       
end;

function TFaxService.GetChargeInfo (CorpNum : string) : TFaxChargeInfo;
var
        responseJson : String;
begin
        try
                responseJson := httpget('/FAX/ChargeInfo',CorpNum,'');
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code,le.message);
                                exit;
                        end;
                end;
        end;

        try
                result := TFaxChargeInfo.Create;

                result.unitCost := getJSonString(responseJson, 'unitCost');
                result.chargeMethod := getJSonString(responseJson, 'chargeMethod');
                result.rateSystem := getJSonString(responseJson, 'rateSystem');

        except
                on E:Exception do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(-99999999,'결과처리 실패.[Malformed Json]');
                                exit;
                        end
                        else
                        begin
                                result := TFaxChargeInfo.Create;
                                setLastErrCode(-99999999);
                                setLastErrMessage('결과처리 실패.[Malformed Json]');
                                exit;
                        end;
                end;
        end;
end;

function UrlEncodeUTF8(stInput : widestring) : string;
  const
    hex : array[0..255] of string = (
     '%00', '%01', '%02', '%03', '%04', '%05', '%06', '%07',
     '%08', '%09', '%0a', '%0b', '%0c', '%0d', '%0e', '%0f',
     '%10', '%11', '%12', '%13', '%14', '%15', '%16', '%17',
     '%18', '%19', '%1a', '%1b', '%1c', '%1d', '%1e', '%1f',
     '%20', '%21', '%22', '%23', '%24', '%25', '%26', '%27',
     '%28', '%29', '%2a', '%2b', '%2c', '%2d', '%2e', '%2f',
     '%30', '%31', '%32', '%33', '%34', '%35', '%36', '%37',
     '%38', '%39', '%3a', '%3b', '%3c', '%3d', '%3e', '%3f',
     '%40', '%41', '%42', '%43', '%44', '%45', '%46', '%47',
     '%48', '%49', '%4a', '%4b', '%4c', '%4d', '%4e', '%4f',
     '%50', '%51', '%52', '%53', '%54', '%55', '%56', '%57',
     '%58', '%59', '%5a', '%5b', '%5c', '%5d', '%5e', '%5f',
     '%60', '%61', '%62', '%63', '%64', '%65', '%66', '%67',
     '%68', '%69', '%6a', '%6b', '%6c', '%6d', '%6e', '%6f',
     '%70', '%71', '%72', '%73', '%74', '%75', '%76', '%77',
     '%78', '%79', '%7a', '%7b', '%7c', '%7d', '%7e', '%7f',
     '%80', '%81', '%82', '%83', '%84', '%85', '%86', '%87',
     '%88', '%89', '%8a', '%8b', '%8c', '%8d', '%8e', '%8f',
     '%90', '%91', '%92', '%93', '%94', '%95', '%96', '%97',
     '%98', '%99', '%9a', '%9b', '%9c', '%9d', '%9e', '%9f',
     '%a0', '%a1', '%a2', '%a3', '%a4', '%a5', '%a6', '%a7',
     '%a8', '%a9', '%aa', '%ab', '%ac', '%ad', '%ae', '%af',
     '%b0', '%b1', '%b2', '%b3', '%b4', '%b5', '%b6', '%b7',
     '%b8', '%b9', '%ba', '%bb', '%bc', '%bd', '%be', '%bf',
     '%c0', '%c1', '%c2', '%c3', '%c4', '%c5', '%c6', '%c7',
     '%c8', '%c9', '%ca', '%cb', '%cc', '%cd', '%ce', '%cf',
     '%d0', '%d1', '%d2', '%d3', '%d4', '%d5', '%d6', '%d7',
     '%d8', '%d9', '%da', '%db', '%dc', '%dd', '%de', '%df',
     '%e0', '%e1', '%e2', '%e3', '%e4', '%e5', '%e6', '%e7',
     '%e8', '%e9', '%ea', '%eb', '%ec', '%ed', '%ee', '%ef',
     '%f0', '%f1', '%f2', '%f3', '%f4', '%f5', '%f6', '%f7',
     '%f8', '%f9', '%fa', '%fb', '%fc', '%fd', '%fe', '%ff');
 var
   iLen,iIndex : integer;
   stEncoded : string;
   ch : widechar;
 begin
   iLen := Length(stInput);
   stEncoded := '';
   for iIndex := 1 to iLen do
   begin
     ch := stInput[iIndex];
     if (ch >= 'A') and (ch <= 'Z') then
       stEncoded := stEncoded + ch
     else if (ch >= 'a') and (ch <= 'z') then
       stEncoded := stEncoded + ch
     else if (ch >= '0') and (ch <= '9') then
       stEncoded := stEncoded + ch
     else if (ch = ' ') then
       stEncoded := stEncoded + '+'
     else if ((ch = '-') or (ch = '_') or (ch = '.') or (ch = '!') or (ch = '*')
       or (ch = '~') or (ch = '\')  or (ch = '(') or (ch = ')')) then
       stEncoded := stEncoded + ch
     else if (Ord(ch) <= $07F) then
       stEncoded := stEncoded + hex[Ord(ch)]
     else if (Ord(ch) <= $7FF) then
     begin
        stEncoded := stEncoded + hex[$c0 or (Ord(ch) shr 6)];
        stEncoded := stEncoded + hex[$80 or (Ord(ch) and $3F)];
     end
     else
     begin
        stEncoded := stEncoded + hex[$e0 or (Ord(ch) shr 12)];
        stEncoded := stEncoded + hex[$80 or ((Ord(ch) shr 6) and ($3F))];
        stEncoded := stEncoded + hex[$80 or ((Ord(ch)) and ($3F))];
     end;
   end;
   result := (stEncoded);
end;

function TFaxService.Search(CorpNum : String; SDate : String; EDate : String; State : Array Of String; ReserveYN : boolean; SenderOnly : boolean; Page : Integer; PerPage : Integer; Order : String; UserID : String) :TFaxSearchList;
begin
        result := Search(CorpNum, SDate, EDate, State, ReserveYN, SenderOnly, Page, PerPage, Order, '', UserID);
end;

function TFaxService.Search(CorpNum, SDate, EDate: String; State: array of String; ReserveYN, SenderOnly: boolean; Page, PerPage: Integer; Order, QString, UserID: String): TFaxSearchList;
var
        responseJson : String;
        uri : String;
        StateList : String;
        jSons : ArrayOfString;
        i : Integer;
begin
        for i := 0 to High(State) do
        begin
                if State[i] <> '' Then
                begin
                        if i = High(State) Then
                        begin
                                StateList := StateList + State[i];
                        end
                        else begin
                                StateList := StateList + State[i] +',';
                        end;
                end
        end;

        uri := '/FAX/Search?SDate='+SDate+'&&EDate='+EDate;
        uri := uri + '&&State='+ StateList;

        if ReserveYN Then uri := uri + '&&ReserveYN=1'
        else uri := uri + '&&ReserveYN=0';

        if SenderOnly Then uri := uri + '&&SenderOnly=1'
        else uri := uri + '&&SenderOnly=0';

        uri := uri + '&&Page=' + IntToStr(Page);
        uri := uri + '&&PerPage=' + IntToSTr(PerPage);
        uri := uri + '&&Order=' + Order;

        if QString <> '' then uri := uri + '&&QString=' + UrlEncodeUTF8(QString);

        try
                responseJson :=  httpget(uri,CorpNum,UserID);
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code, le.message);
                                exit;
                        end
                        else
                        begin
                                result := TFaxSearchList.Create;
                                result.code := le.code;
                                result.message := le.message;
                                exit;
                        end;
                end;
        end;

        if LastErrCode <> 0 then
        begin
                result := TFaxSearchList.Create;
                result.code := LastErrCode;
                result.message := LastErrMessage;
                exit;
        end
        else
        begin
        
        result := TFaxSearchList.Create;

        result.code             := getJSonInteger(responseJson,'code');
        result.total            := getJSonInteger(responseJson,'total');
        result.perPage          := getJSonInteger(responseJson,'perPage');
        result.pageNum          := getJSonInteger(responseJson,'pageNum');
        result.pageCount        := getJSonInteger(responseJson,'pageCount');
        result.message          := getJSonString(responseJson,'message');

        try

                jSons := getJSonList(responseJson,'list');
                SetLength(result.list, Length(jSons));
                for i:=0 to Length(jSons)-1 do
                begin
                        result.list[i] := TFaxDetail.Create();
                        result.list[i].state := getJSonInteger(jsons[i],'state');
                        result.list[i].result := getJSonInteger(jsons[i],'result');
                        result.list[i].sendNum := getJSonString(jsons[i],'sendNum');
                        result.list[i].senderName := getJSonString(jsons[i],'senderName');
                        result.list[i].receiveNum := getJSonString(jsons[i],'receiveNum');
                        result.list[i].receiveName := getJSonString(jsons[i],'receiveName');
                        result.list[i].title := getJSonString(jsons[i],'title');
                        result.list[i].sendPageCnt := getJSonInteger(jsons[i],'sendPageCnt');
                        result.list[i].successPageCnt := getJSonInteger(jsons[i],'successPageCnt');
                        result.list[i].failPageCnt := getJSonInteger(jsons[i],'failPageCnt');
                        result.list[i].refundPageCnt := getJSonInteger(jsons[i],'refundPageCnt');
                        result.list[i].cancelPageCnt := getJSonInteger(jsons[i],'cancelPageCnt');
                        result.list[i].reserveDT := getJSonString(jsons[i],'reserveDT');
                        result.list[i].receiptDT := getJSonString(jsons[i],'receiptDT');
                        result.list[i].sendDT := getJSonString(jsons[i],'sendDT');
                        result.list[i].resultDT := getJSonString(jsons[i],'resultDT');
                        result.list[i].fileNames := getJsonList(jsons[i],'fileNames');
                        result.list[i].receiptNum := getJSonString(jsons[i],'receiptNum');
                        result.list[i].requestNum := getJSonString(jsons[i],'requestNum');
                        result.list[i].chargePageCnt := getJSonInteger(jsons[i],'chargePageCnt');
                        result.list[i].tiffFileSize := getJSonString(jsons[i],'tiffFileSize');

                        result.list[i].sendState := getJSonInteger(jsons[i],'sendState');
                        result.list[i].convState := getJSonInteger(jsons[i],'convState');
                        result.list[i].sendResult := getJSonInteger(jsons[i],'sendResult');

                end;
        except
                on E:Exception do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(-99999999,'결과처리 실패.[Malformed Json]');
                                exit;
                        end
                        else
                        begin
                                result := TFaxSearchList.Create;
                                result.code := -99999999;
                                result.message := '결과처리 실패.[Malformed Json]';
                                exit;
                        end;
                end;
        end;
        end;
end;


// 팩스전송 단일파일 단일 수신자.
function TFaxService.SendFAX(CorpNum : String; sendnum : String; receiveNum : String; receiveName : String; filePath : String; reserveDT : String; UserID:String) : String;
var
        receivers : TReceiverList;
begin
        SetLength(Receivers,1);
        Receivers[0] := TReceiver.create;
        Receivers[0].receiveNum := receiveNum;
        Receivers[0].receiveName := receiveName;

        result := RequestFax(CorpNum,sendnum, '', receivers,filePath,reserveDT,UserID,False, '', '');
end;

function TFaxService.SendFAX(CorpNum : String; sendnum : String; receiveNum : String; receiveName : String; filePath : String; reserveDT : String; UserID:String; adsYN:Boolean) : String;
var
        receivers : TReceiverList;
begin
        SetLength(Receivers,1);
        Receivers[0] := TReceiver.create;
        Receivers[0].receiveNum := receiveNum;
        Receivers[0].receiveName := receiveName;

        result := RequestFax(CorpNum,sendnum, '', receivers,filePath,reserveDT,UserID,adsYN, '', '');
end;

function TFaxService.SendFAX(CorpNum : String; sendnum : String; sendname : String; receiveNum : String; receiveName : String; filePath : String; reserveDT : String; UserID:String) : String;
var
        receivers : TReceiverList;
begin
        SetLength(Receivers,1);
        Receivers[0] := TReceiver.create;
        Receivers[0].receiveNum := receiveNum;
        Receivers[0].receiveName := receiveName;

        result := RequestFax(CorpNum,sendnum, sendname, receivers,filePath,reserveDT,UserID,False, '', '');
end;

function TFaxService.SendFAX(CorpNum : String; sendnum : String; sendname : String; receiveNum : String; receiveName : String; filePath : String; reserveDT : String; UserID:String; adsYN:Boolean) : String;
var
        receivers : TReceiverList;
begin
        SetLength(Receivers,1);
        Receivers[0] := TReceiver.create;
        Receivers[0].receiveNum := receiveNum;
        Receivers[0].receiveName := receiveName;

        result := RequestFax(CorpNum,sendnum, sendname, receivers,filePath,reserveDT,UserID,adsYN, '', '');
end;

function TFaxService.SendFAX(CorpNum : String; sendnum : String; sendname : String; receiveNum : String; receiveName : String; filePath : String; reserveDT : String; UserID:String; adsYN:Boolean; title:String) : String;
var
        receivers : TReceiverList;
begin
        SetLength(Receivers,1);
        Receivers[0] := TReceiver.create;
        Receivers[0].receiveNum := receiveNum;
        Receivers[0].receiveName := receiveName;

        result := RequestFax(CorpNum,sendnum, sendname, receivers,filePath,reserveDT,UserID,adsYN,title, '');
end;

function TFaxService.SendFAX(CorpNum : String; sendnum : String; sendname : String; receiveNum : String; receiveName : String; filePath : String; reserveDT : String; UserID:String; adsYN:Boolean; title:String; requestNum : String) : String;
var
        receivers : TReceiverList;
begin
        SetLength(Receivers,1);
        Receivers[0] := TReceiver.create;
        Receivers[0].receiveNum := receiveNum;
        Receivers[0].receiveName := receiveName;

        result := RequestFax(CorpNum,sendnum, sendname, receivers,filePath,reserveDT,UserID,adsYN,title, requestNum);
end;


//팩스전송 단일파일 동보전송
function TFaxService.SendFAX(CorpNum : String; sendnum : String; receivers : TReceiverList; filePath : String; reserveDT : String; UserID:String) : String;
var
        files : Array Of String;
begin
        SetLength(files,1);
        files[0] := filePath;

        result := RequestFAX(CorpNum,sendnum, '', receivers,files,reserveDT,UserID, False, '', '');
end;

function TFaxService.SendFAX(CorpNum : String; sendnum : String; receivers : TReceiverList; filePath : String; reserveDT : String; UserID:String; adsYN:Boolean) : String;
var
        files : Array Of String;
begin
        SetLength(files,1);
        files[0] := filePath;
        result := RequestFAX(CorpNum,sendnum, '', receivers,files,reserveDT,UserID, adsYN, '', '');
end;

function TFaxService.SendFAX(CorpNum : String; sendnum : String; sendname: String; receivers : TReceiverList; filePath : String; reserveDT : String; UserID:String) : String;
var
        files : Array Of String;
begin
        SetLength(files,1);
        files[0] := filePath;

        result := RequestFAX(CorpNum,sendnum, sendname, receivers,files,reserveDT,UserID, False, '', '');
end;

function TFaxService.SendFAX(CorpNum : String; sendnum : String; sendname: String; receivers : TReceiverList; filePath : String; reserveDT : String; UserID:String; adsYN:Boolean) : String;
var
        files : Array Of String;
begin
        SetLength(files,1);
        files[0] := filePath;

        result := RequestFAX(CorpNum,sendnum, sendname, receivers,files,reserveDT,UserID,adsYN, '', '');
end;

function TFaxService.SendFAX(CorpNum : String; sendnum : String; sendname: String; receivers : TReceiverList; filePath : String; reserveDT : String; UserID:String; adsYN:Boolean; title:String) : String;
var
        files : Array Of String;
begin
        SetLength(files,1);
        files[0] := filePath;

        result := RequestFAX(CorpNum,sendnum, sendname, receivers,files,reserveDT,UserID,adsYN,title, '');
end;


function TFaxService.SendFAX(CorpNum : String; sendnum : String; sendname: String; receivers : TReceiverList; filePath : String; reserveDT : String; UserID:String; adsYN:Boolean; title:String; requestNum : String) : String;
var
        files : Array Of String;
begin
        SetLength(files,1);
        files[0] := filePath;

        result := RequestFAX(CorpNum,sendnum, sendname, receivers,files,reserveDT,UserID,adsYN,title, requestNum);
end;


// 팩스전송 다중파일(최대20개) 단일 수신자
function TFaxService.SendFAX(CorpNum : String; sendnum : String; receiveNum : String; receiveName : String; filePaths : Array Of String; reserveDT : String; UserID:String) : String;
var
        receivers : TReceiverList;
begin
        SetLength(Receivers,1);
        Receivers[0] := TReceiver.create;
        Receivers[0].receiveNum := receiveNum;
        Receivers[0].receiveName := receiveName;

        result := RequestFAX(CorpNum,sendnum, '', receivers,filePaths,reserveDT,UserID, False, '', '');
end;

function TFaxService.SendFAX(CorpNum : String; sendnum : String; receiveNum : String; receiveName : String; filePaths : Array Of String; reserveDT : String; UserID:String; adsYN:Boolean) : String;
var
        receivers : TReceiverList;
begin
        SetLength(Receivers,1);
        Receivers[0] := TReceiver.create;
        Receivers[0].receiveNum := receiveNum;
        Receivers[0].receiveName := receiveName;

        result := RequestFAX(CorpNum,sendnum, '', receivers,filePaths,reserveDT,UserID, adsYN, '', '');
end;

function TFaxService.SendFAX(CorpNum : String; sendnum : String; sendname :String; receiveNum : String; receiveName : String; filePaths : Array Of String; reserveDT : String; UserID:String) : String;
var
        receivers : TReceiverList;
begin
        SetLength(Receivers,1);
        Receivers[0] := TReceiver.create;
        Receivers[0].receiveNum := receiveNum;
        Receivers[0].receiveName := receiveName;

        result := RequestFAX(CorpNum,sendnum, sendname, receivers,filePaths,reserveDT,UserID, False, '', '');
end;

function TFaxService.SendFAX(CorpNum : String; sendnum : String; sendname :String; receiveNum : String; receiveName : String; filePaths : Array Of String; reserveDT : String; UserID:String; adsYN:Boolean) : String;
var
        receivers : TReceiverList;
begin
        SetLength(Receivers,1);
        Receivers[0] := TReceiver.create;
        Receivers[0].receiveNum := receiveNum;
        Receivers[0].receiveName := receiveName;

        result := RequestFAX(CorpNum,sendnum, sendname, receivers,filePaths,reserveDT,UserID,adsYN, '', '');
end;


function TFaxService.SendFAX(CorpNum : String; sendnum : String; sendname :String; receiveNum : String; receiveName : String; filePaths : Array Of String; reserveDT : String; UserID:String; adsYN:Boolean; title:String) : String;
var
        receivers : TReceiverList;
begin
        SetLength(Receivers,1);
        Receivers[0] := TReceiver.create;
        Receivers[0].receiveNum := receiveNum;
        Receivers[0].receiveName := receiveName;

        result := RequestFAX(CorpNum,sendnum, sendname, receivers,filePaths,reserveDT,UserID,adsYN, title, '');
end;

function TFaxService.SendFAX(CorpNum : String; sendnum : String; sendname :String; receiveNum : String; receiveName : String; filePaths : Array Of String; reserveDT : String; UserID:String; adsYN:Boolean; title:String; requestNum : String) : String;
var
        receivers : TReceiverList;
begin
        SetLength(Receivers,1);
        Receivers[0] := TReceiver.create;
        Receivers[0].receiveNum := receiveNum;
        Receivers[0].receiveName := receiveName;

        result := RequestFAX(CorpNum,sendnum, sendname, receivers,filePaths,reserveDT,UserID,adsYN, title, requestNum);
end;



//팩스전송 다중파일(최대20개) 동보전송
function TFaxService.SendFAX(CorpNum : String; sendnum : String; receivers : TReceiverList; filePaths : Array Of String; reserveDT : String; UserID:String) : String;
begin
        result := RequestFAX(CorpNum, sendnum, '', receivers, filePaths, reserveDT, UserID, False, '', '');
end;

function TFaxService.SendFAX(CorpNum : String; sendnum : String; receivers : TReceiverList; filePaths : Array Of String; reserveDT : String; UserID:String; adsYN:Boolean) : String;
begin
        result := RequestFAX(CorpNum, sendnum, '', receivers, filePaths, reserveDT, UserID, adsYN, '', '');
end;

function TFaxService.SendFAX(CorpNum : String; sendnum : String; sendname: string; receivers : TReceiverList; filePaths : Array Of String; reserveDT : String; UserID:String) : String;
begin
        result := RequestFAX(CorpNum, sendnum, sendname, receivers, filePaths, reserveDT, UserID, False, '', '');
end;

function TFaxService.SendFAX(CorpNum : String; sendnum : String; sendname: string; receivers : TReceiverList; filePaths : Array Of String; reserveDT : String; UserID:String; adsYN:Boolean) : String;
begin
        result := RequestFAX(CorpNum, sendnum, sendname, receivers, filePaths, reserveDT, UserID, adsYN, '', '');
end;

function TFaxService.SendFAX(CorpNum : String; sendnum : String; sendname: string; receivers : TReceiverList; filePaths : Array Of String; reserveDT : String; UserID:String; adsYN:Boolean; title:String) : String;
begin
        result := RequestFAX(CorpNum, sendnum, sendname, receivers, filePaths, reserveDT, UserID, adsYN, title, '');
end;

function TFaxService.SendFAX(CorpNum : String; sendnum : String; sendname: string; receivers : TReceiverList; filePaths : Array Of String; reserveDT : String; UserID:String; adsYN:Boolean; title:String; requestNum : String) : String;
begin
        result := RequestFAX(CorpNum, sendnum, sendname, receivers, filePaths, reserveDT, UserID, adsYN, title, requestNum);
end;


function TFaxService.RequestFAX(CorpNum:String; sendnum:String; sendname:String; receivers:TReceiverList; filePaths: Array Of String; reserveDT: String; UserID:String; adsYN:Boolean; title:String; requestNum : String) : String;
var
        files : TFileList;
        requestJson, responseJson : String;
        i : Integer;
begin
        SetLength(files,length(filePaths));

        for i:= 0 to Length(filePaths) -1 do begin
                files[i] := TFile.Create;
                files[i].FieldName := 'file';
                files[i].FileName := ExtractFileName(filePaths[i]);
                files[i].Data := TFileStream.Create(filePaths[i],fmOpenRead or fmShareDenyNone);
        end;

        requestJson := '{';

        if adsYN then
        requestJson := requestJson + '"adsYN":true,';

        requestJson := requestJson + '"snd":"'+sendnum+'",';
        requestJson := requestJson + '"sndDT":"'+reserveDT+'",';
        requestJson := requestJson + '"sndnm":"'+sendname+'",';
        requestJson := requestJson + '"title":"'+title+'",';
        requestJson := requestJson + '"fCnt":"'+ intToStr(length(files))+'",';
        if requestNum <> '' then requestJson := requestJson + '"requestNum":"'+requestNum+'",';

        requestJson := requestJson + '"rcvs":[';

        for i:=0 to Length(receivers) -1 do begin
                requestJson := requestJson + '{';
                requestJson := requestJson + '"rcv":"'+receivers[i].receiveNum+'",';
                requestJson := requestJson + '"rcvnm":"'+receivers[i].receiveName+'"';
                requestJson := requestJson + '}';
                if i < Length(receivers) - 1 then requestJson := requestJson + ',';
        end;

        requestJson := requestJson + ']';

        requestJson := requestJson + '}';

       try
                try
                        responseJson := httppost('/FAX',CorpNum,UserID,requestJson,files);
                        result := getJSonString(responseJson,'receiptNum');                        
                except
                        on le : EPopbillException do begin
                                if FIsThrowException then
                                begin
                                        raise EPopbillException.Create(le.code,le.message);
                                        exit;
                                end;
                        end;
                end;
       finally
                for i:= 0 to Length(files) -1 do begin
                        files[i].Data.Free;
                end;
       end;


end;


function TFaxService.ResendFAX(CorpNum : String; ReceiptNum : String; sendnum : Variant; sendname :String; receiveNum : String; receiveName : String; reserveDT : String; UserID:String; title:String; requestNum : String) : String;
var
        receivers : TReceiverList;
begin
        // 수신자정보가 있는경우 수신정보배열 구성
        if ( receiveNum <> '' ) AND ( receiveName <> '' ) then begin

                SetLength(Receivers,1);
                Receivers[0] := TReceiver.create;

                if receiveNum <> '' then
                        Receivers[0].receiveNum := receiveNum;

                if receiveName <> '' then
                        Receivers[0].receiveName := receiveName;
        end
        // 수신자 정보가 없는경우 수신정보배열 길이 0으로 처리
        else begin
                SetLength(Receivers,0);
        end;

        result := ResendFAX(CorpNum, ReceiptNum, sendnum, sendname, receivers, reserveDT, UserID, title, requestNum);
end;

function TFaxService.ResendFAX(CorpNum : String; ReceiptNum : String; sendnum : Variant; sendname: String; receivers : TReceiverList; reserveDT : String; UserID:String; title:String; requestNum : String) : String;
var
        requestJson, responseJson : String;
        i : Integer;
begin
        if ReceiptNum = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999, '팩스접수번호(ReceiptNum)가 입력되지 않았습니다.');
                        Exit;
                end
                else
                begin
                        result := '';
                        setLastErrCode(-99999999);
                        setLastErrMessage('팩스접수번호(ReceiptNum)가 입력되지 않았습니다.');
                        exit;
                end;
        end;

        // ResendFax 호출시 기존전송정보로 전송하는 JsonString 구성
        // 1) 해당 항목의 변수의 값이 null 인 경우
        // 2) 항목변수 자체가 JsonString에 정의되지 않은 경우
        // 3) 동보전송의 경우 rcvs 항목이 JsonString 에 포함되지 않아야함

        requestJson := '{';

        if sendnum <> '' then
                requestJson := requestJson + '"snd":"'+sendnum+'",';

        if reserveDT <> '' then
                requestJson := requestJson + '"sndDT":"'+reserveDT+'",';

        if sendname <> '' then
                requestJson := requestJson + '"sndnm":"'+sendname+'",';
                
        if title <> '' then
                requestJson := requestJson + '"title":"'+title+'",';

        if requestNum <> '' then
                requestJson := requestJson + '"requestNum":"'+requestNum+'",';

        // 수신정보배열 구성
        if Length(receivers) > 0 then begin
                requestJson := requestJson + '"rcvs":[';
                
                for i:=0 to Length(receivers) -1 do begin
                
                        requestJson := requestJson + '{';

                        if receivers[i].receiveNum <> '' then
                                requestJson := requestJson + '"rcv":"'+receivers[i].receiveNum+'",';

                        if receivers[i].receiveName <> '' then
                                requestJson := requestJson + '"rcvnm":"'+receivers[i].receiveName+'"';

                        requestJson := requestJson + '}';

                        if i < Length(receivers) - 1 then requestJson := requestJson + ',';
                end; // end of for

                requestJson := requestJson + ']';
        end
        else begin
                // JsonString 이 콤마(,)로 끝나는 경우, 마지막 문자 trim 처리
                if Length(requestJson) <> 1 then
                        requestJson := Copy(requestJson, 0, Length(requestJson)-1)
        end;

        requestJson := requestJson + '}';

        try
                responseJson := httppost('/FAX/'+ ReceiptNum, CorpNum, UserID, requestJson);
                result := getJSonString(responseJson,'receiptNum');
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code,le.message);
                                exit;
                        end;
                end;
        end;
end;


function TFaxService.getSendDetail(CorpNum : String; receiptNum : String; UserID : String) : TFaxDetailList;
var
        responseJson : String;
        jSons : ArrayOfString;
        i : Integer;
begin
        if ReceiptNum = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999, '팩스접수번호(ReceiptNum)가 입력되지 않았습니다.');
                        Exit;
                end
                else
                begin
                        SetLength(result,0);
                        setLastErrCode(-99999999);
                        setLastErrMessage('팩스접수번호(ReceiptNum)가 입력되지 않았습니다.');
                        exit;
                end;
        end;


        try
                responseJson := httpget('/FAX/' + receiptNum,CorpNum,UserID);
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code, le.message);
                                exit;
                        end
                        else
                        begin
                                SetLength(result,0);
                                exit;
                        end;
                end;
        end;

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
                        result[i] := TFaxDetail.Create;
                        result[i].state := getJSonInteger(jsons[i],'state');
                        result[i].result := getJSonInteger(jsons[i],'result');
                        result[i].sendNum := getJSonString(jsons[i],'sendNum');
                        result[i].senderName := getJSonString(jsons[i],'senderName');
                        result[i].receiveNum := getJSonString(jsons[i],'receiveNum');
                        result[i].receiveName := getJSonString(jsons[i],'receiveName');
                        result[i].title := getJSonString(jsons[i],'title');
                        result[i].sendPageCnt := getJSonInteger(jsons[i],'sendPageCnt');
                        result[i].successPageCnt := getJSonInteger(jsons[i],'successPageCnt');
                        result[i].failPageCnt := getJSonInteger(jsons[i],'failPageCnt');
                        result[i].refundPageCnt := getJSonInteger(jsons[i],'refundPageCnt');
                        result[i].cancelPageCnt := getJSonInteger(jsons[i],'cancelPageCnt');
                        result[i].reserveDT := getJSonString(jsons[i],'reserveDT');
                        result[i].receiptDT := getJSonString(jsons[i],'receiptDT');
                        result[i].sendDT := getJSonString(jsons[i],'sendDT');
                        result[i].resultDT := getJSonString(jsons[i],'resultDT');
                        result[i].fileNames := getJsonList(jsons[i],'fileNames');
                        result[i].receiptNum := getJSonString(jsons[i],'receiptNum');
                        result[i].requestNum := getJSonString(jsons[i],'requestNum');
                        result[i].chargePageCnt := getJSonInteger(jsons[i],'chargePageCnt');
                        result[i].tiffFileSize := getJSonString(jsons[i],'tiffFileSize');

                        result[i].sendState := getJSonInteger(jsons[i],'sendState');
                        result[i].convState := getJSonInteger(jsons[i],'convState');
                        result[i].sendResult := getJSonInteger(jsons[i],'sendResult');
                end;

        except
                on E:Exception do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(-99999999,'결과처리 실패.[Malformed Json]');
                                exit;
                        end
                        else
                        begin
                                SetLength(result,0);
                                setLastErrCode(-99999999);
                                setLastErrMessage('결과처리 실패.[Malformed Json]');
                                exit;                                
                        end;
                end;
        end;
        end;

end;

function TFaxService.CancelReserve(CorpNum : String; receiptNum : string; UserID : String) : TResponse;
var
        responseJson : String;
begin

        if ReceiptNum = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999, '팩스접수번호(ReceiptNum)가 입력되지 않았습니다.');
                        Exit;
                end
                else
                begin
                        result.code := -99999999;
                        result.message := '팩스접수번호(ReceiptNum)가 입력되지 않았습니다.'; 
                        exit;
                end;
        end;


        try
                responseJson := httpget('/FAX/' + receiptNum + '/Cancel',CorpNum,UserID);
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code,le.Message);
                        end
                        else
                        begin
                                result.code := le.code;
                                result.message := le.Message;
                                exit;
                        end;
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

function TFaxService.getURL(CorpNum : String; TOGO : String) : String;
begin
        result := getURL(CorpNum, '', TOGO);
end;

function TFaxService.getURL(CorpNum : String; UserID : String; TOGO : String) : String;
var
        responseJson : String;
begin
        try
                responseJson := httpget('/FAX/?TG=' + TOGO ,CorpNum,UserID);
                result := getJSonString(responseJson,'url');
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code, le.message);
                                exit;
                        end;
                end;
        end;
end;

function TFaxService.GetSentListURL(CorpNum : String; UserID : String) : String;
var
        responseJson : String;
begin
        try 
                responseJson := httpget('/FAX/?TG=BOX' ,CorpNum,UserID);
                result := getJSonString(responseJson,'url');
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code, le.message);
                                exit;
                        end;
                end;
        end;
end;

function TFaxService.GetSenderNumberMgtURL(CorpNum : String; UserID : String) : String;
var
        responseJson : String;
begin
        try
                responseJson := httpget('/FAX/?TG=SENDER' ,CorpNum,UserID);
                result := getJSonString(responseJson,'url');
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code,le.message);
                                exit;
                        end;
                end;
        end;

end;

function TFaxService.GetPreviewURL(CorpNum : String; ReceiptNum : string; UserID : String) : String;
var
        responseJson : String;
begin
        try
                responseJson := httpget('/FAX/Preview/'+ReceiptNum ,CorpNum,UserID);
                result := getJSonString(responseJson,'url');
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code,le.message);
                                exit;
                        end;
                end;
        end;        
end;

function TFaxService.GetSenderNumberList(CorpNum : string; UserID: String) : TFAXSenderNumberList;
var
        responseJson : String;
        jSons : ArrayOfString;
        i : Integer;
begin

        try
                responseJson := httpget('/FAX/SenderNumber',CorpNum, UserID);
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code,le.message);
                                exit;
                        end
                        else
                        begin
                                SetLength(result,0);
                                exit;
                        end;
                end;
        end;

        if LastErrCode <> 0 then
        begin
                exit;
        end
        else
        begin
                try
                        jSons := ParseJsonList(responseJson);
                        SetLength(result,Length(jSons));

                        for i:= 0 to Length(jSons)-1 do
                        begin
                                result[i] := TFAXSenderNumber.Create;
                                result[i].number := getJsonString(jSons[i],'number');
                                result[i].state := getJsonInteger(jSons[i],'state');
                                result[i].representYN := getJsonBoolean(jSons[i],'representYN');
                        end;
                except
                        on E:Exception do begin
                                if FIsThrowException then
                                begin
                                        raise EPopbillException.Create(-99999999,'결과처리 실패.[Malformed Json]');
                                        exit;
                                end
                                else
                                begin
                                        SetLength(result,0);
                                        SetLength(jSons,0);
                                        setLastErrCode(-99999999);
                                        setLastErrMessage('결과처리 실패.[Malformed Json]');
                                        exit;
                                end;
                        end;
                end;
        end;
end;

function TFaxService.getSendDetailRN(CorpNum, requestNum, UserID: String): TFaxDetailList;
var
        responseJson : String;
        jSons : ArrayOfString;
        i : Integer;
begin
        if requestNum = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999, '팩스요청번호(requestNum)가 입력되지 않았습니다.');
                        Exit;
                end
                else
                begin
                        SetLength(result,0);                                                        
                        setLastErrCode(-99999999);
                        setLastErrMessage('팩스요청번호(requestNum)가 입력되지 않았습니다.'); 
                        exit;
                end;
        end;

        try
                responseJson := httpget('/FAX/Get/' + requestNum, CorpNum, UserID);
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code, le.message);
                                exit;
                        end;
                end;
        end;

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
                        result[i] := TFaxDetail.Create;
                        result[i].state := getJSonInteger(jsons[i],'state');
                        result[i].result := getJSonInteger(jsons[i],'result');
                        result[i].sendNum := getJSonString(jsons[i],'sendNum');
                        result[i].senderName := getJSonString(jsons[i],'senderName');
                        result[i].receiveNum := getJSonString(jsons[i],'receiveNum');
                        result[i].receiveName := getJSonString(jsons[i],'receiveName');
                        result[i].title := getJSonString(jsons[i],'title');
                        result[i].sendPageCnt := getJSonInteger(jsons[i],'sendPageCnt');
                        result[i].successPageCnt := getJSonInteger(jsons[i],'successPageCnt');
                        result[i].failPageCnt := getJSonInteger(jsons[i],'failPageCnt');
                        result[i].refundPageCnt := getJSonInteger(jsons[i],'refundPageCnt');
                        result[i].cancelPageCnt := getJSonInteger(jsons[i],'cancelPageCnt');
                        result[i].reserveDT := getJSonString(jsons[i],'reserveDT');
                        result[i].receiptDT := getJSonString(jsons[i],'receiptDT');
                        result[i].sendDT := getJSonString(jsons[i],'sendDT');
                        result[i].resultDT := getJSonString(jsons[i],'resultDT');
                        result[i].fileNames := getJsonList(jsons[i],'fileNames');
                        result[i].receiptNum := getJSonString(jsons[i],'receiptNum');
                        result[i].requestNum := getJSonString(jsons[i],'requestNum');
                        result[i].chargePageCnt := getJSonInteger(jsons[i],'chargePageCnt');
                        result[i].tiffFileSize := getJSonString(jsons[i],'tiffFileSize');

                        result[i].sendState := getJSonInteger(jsons[i],'sendState');
                        result[i].convState := getJSonInteger(jsons[i],'convState');
                        result[i].sendResult := getJSonInteger(jsons[i],'sendResult');
                end;

        except
                on E:Exception do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(-99999999,'결과처리 실패.[Malformed Json]');
                        end
                        else
                        begin
                                SetLength(result,0);
                                SetLength(jSons,0);
                                setLastErrCode(-99999999);
                                setLastErrMessage('결과처리 실패.[Malformed Json]');
                                exit;
                        end;
                end;
        end;
        end;
end;

function TFaxService.CancelReserveRN(CorpNum, requestNum, UserID: String): TResponse;
var
        responseJson : String;
begin
        if requestNum = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999, '팩스요청번호(requestNum)가 입력되지 않았습니다.');
                        Exit;
                end
                else
                begin
                        result.code := -99999999;
                        result.message := '팩스요청번호(requestNum)가 입력되지 않았습니다.';
                        exit;
                end;
        end;


        try
                responseJson := httpget('/FAX/Cancel/' + requestNum, CorpNum, UserID);
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code,le.Message);
                                exit;
                        end
                        else
                        begin
                                result.code := le.code;
                                result.message := le.Message;
                                exit;
                        end;
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
                exit;
        end;
end;

function TFaxService.ResendFAXRN(CorpNum, requestNum: String; sendnum: Variant;
                                 sendname, receiveNum, receiveName, reserveDT,
                                 orignalRequestNum, UserID, title: String): String;
var
        receivers : TReceiverList;
begin
        // 수신자정보가 있는경우 수신정보배열 구성
        if ( receiveNum <> '' ) AND ( receiveName <> '' ) then begin

                SetLength(Receivers,1);
                Receivers[0] := TReceiver.create;

                if receiveNum <> '' then
                        Receivers[0].receiveNum := receiveNum;

                if receiveName <> '' then
                        Receivers[0].receiveName := receiveName;
        end
        // 수신자 정보가 없는경우 수신정보배열 길이 0으로 처리
        else begin
                SetLength(Receivers,0);
        end;

        result := ResendFAXRN(CorpNum, requestNum, sendnum, sendname, receivers,
                              reserveDT, orignalRequestNum, UserID, title);
end;

function TFaxService.ResendFAXRN(CorpNum, requestNum: String; sendnum: Variant;
                                 sendname: String; receivers: TReceiverList;
                                 reserveDT, orignalRequestNum, UserID, title: String): String;
var
        requestJson, responseJson : String;
        i : Integer;
begin
        if requestNum = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999, '전송요청번호(requestNum)가 입력되지 않았습니다.');
                        Exit;
                end
                else
                begin
                        result := '';
                        setLastErrCode(-99999999);
                        setLastErrMessage('전송요청번호(requestNum)가 입력되지 않았습니다.');
                        exit;
                end;
        end;

        if orignalRequestNum = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999, '원본 팩스의 전송요청번호(orignalRequestNum)가 입력되지 않았습니다.');
                        Exit;
                end
                else
                begin
                        result := '';
                        setLastErrCode(-99999999);
                        setLastErrMessage('원본 팩스의 전송요청번호(orignalRequestNum)가 입력되지 않았습니다.');
                        exit;
                end;
        end;

        // ResendFax 호출시 기존전송정보로 전송하는 JsonString 구성
        // 1) 해당 항목의 변수의 값이 null 인 경우
        // 2) 항목변수 자체가 JsonString에 정의되지 않은 경우
        // 3) 동보전송의 경우 rcvs 항목이 JsonString 에 포함되지 않아야함

        requestJson := '{';

        if sendnum <> '' then
                requestJson := requestJson + '"snd":"'+sendnum+'",';

        if reserveDT <> '' then
                requestJson := requestJson + '"sndDT":"'+reserveDT+'",';

        if sendname <> '' then
                requestJson := requestJson + '"sndnm":"'+sendname+'",';
                
        if title <> '' then
                requestJson := requestJson + '"title":"'+title+'",';

        if requestNum <> '' then
                requestJson := requestJson + '"requestNum":"'+requestNum+'",';

        // 수신정보배열 구성
        if Length(receivers) > 0 then begin
                requestJson := requestJson + '"rcvs":[';
                
                for i:=0 to Length(receivers) -1 do begin
                
                        requestJson := requestJson + '{';

                        if receivers[i].receiveNum <> '' then
                                requestJson := requestJson + '"rcv":"'+receivers[i].receiveNum+'",';

                        if receivers[i].receiveName <> '' then
                                requestJson := requestJson + '"rcvnm":"'+receivers[i].receiveName+'"';

                        requestJson := requestJson + '}';

                        if i < Length(receivers) - 1 then requestJson := requestJson + ',';
                end; // end of for

                requestJson := requestJson + ']';
        end
        else begin
                // JsonString 이 콤마(,)로 끝나는 경우, 마지막 문자 trim 처리
                if Length(requestJson) <> 1 then
                        requestJson := Copy(requestJson, 0, Length(requestJson)-1)
        end;

        requestJson := requestJson + '}';

        try
                responseJson := httppost('/FAX/Resend/'+ orignalRequestNum, CorpNum, UserID, requestJson);
                result := getJSonString(responseJson,'receiptNum');
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code,le.message);
                                exit;
                        end;
                end;
        end;
end;


//End of Unit;
end.

