(*
*=================================================================================
* Unit for base module for Popbill API SDK. It include base functionality for
* RESTful web service request and parse json result. It uses Linkhub module
* to accomplish authentication APIs.
*
* http://www.popbill.com
* Author : Jeong Yohan (code@linkhub.co.kr)
* Written : 2018-02-26
* Updated : 2019-05-03
* Thanks for your interest.
*=================================================================================
*)

unit PopbillKakao;

interface

uses
        TypInfo,SysUtils,Classes,Popbill,Linkhub;
type
        // ATS-알림톡, FTS-친구톡, FMS-친구톡 이미지
        EnumKakaoType = (ATS,FTS,FMS);

        // 플러스친구 정보
        TPlusFriendInfo = class
        public
                plusFriendID : string;
                plusFriendName : string;
                regDT : string;
        end;

        TPlusFriendList = Array of TPlusFriendInfo;

        // 과금정보
        TKakaoChargeInfo = class
        public
                unitCost : string;
                chargeMethod : string;
                rateSystem : string;
        end;


        // 발신번호
        TKakaoSenderNumber = class
        public
            number : string;
            state : integer;
            representYN : Boolean;
        end;

        TKakaoSenderNumberList = Array of TKakaoSenderNumber;


        // 전송요청 - 수신정보/메시지 내용
        TSendKakaoReceiver = class
        public
                rcv : string;
                rcvnm : string;
                msg : string;
                altmsg : string;
        end;

        TSendKakaoReceiverList = Array Of TSendKakaoReceiver;


        // 전송요청 - 친구톡 버튼 정보
        TSendKakaoButton = class
        public
                buttonName : string;
                buttonType : string;
                buttonURL1 : string;
                buttonURL2 : string;
        end;

        TSendKakaoButtonList = Array Of TSendKakaoButton;



        // 전송결과 정보 Detail 배열
        TSentKakaoDetail = class
        public
                state : integer;
                sendDT : string;
                result : integer;
                resultDT : string;
                contentType : string;
                receiveNum : string;
                receiveName : string;
                content : string;
                altContentType : integer;
                altSendDT : string;
                altResult : integer;
                altResultDT : string;
                altContent : string;
                receiptNum : String;
                requestNum : String;
        end;
        TSentKakaoDetailList = Array Of TSentKakaoDetail;

         // 전송결과정보 GetMessage
        TSentKakaoInfo = class
        public
                contentType : string;
                templateCode : string;
                plusFriendID : string;
                sendNum : string;
                altContent : string;
                altSendType : string;
                reserveDT : string;
                adsYN : Boolean;
                imageURL : string;
                sendCnt : string;
                successCnt : string;
                failCnt : string;
                altCnt : string;
                cancelCnt : string;
                msgs : TSentKakaoDetailList;
                btns : TSendKakaoButtonList;
        end;


        // 목록조회 Search
        TKakaoSearchList = class
        public
                code : Integer;
                total : Integer;
                perPage : Integer;
                pageNum : Integer;
                pageCount : Integer;
                message : string;
                list : TSentKakaoDetailList;
        end;

        // 템플릿 정보
        TATSTemplate = class
        public
                templateCode : string;
                templateName : String;
                template : string;
                plusFriendID : string;
                btns : TSendKakaoButtonList;
        end;

        TATSTemplateList = Array of TATSTemplate;

        TKakaoService = class(TpopbillBaseService)
        public
                constructor Create(LinkID : String; SecretKey : String);

                // GetURL
                function GetURL(CorpNum : String; TOGO: String; UserID: String = '') : String;

                // 플러스친구 계정관리 팝업 URL
                function GetPlusFriendMgtURL(CorpNum : String; UserID: String) : String;

                // 발신번호 관리 팝업 URL
                function GetSenderNumberMgtURL(CorpNum : String; UserID: String) : String;

                // 알림톡 템플릿관리 팝업 URL
                function GetATSTemplateMgtURL(CorpNum : String; UserID: String) : String;

                // 카카오톡 전송내역 팝업 URL
                function GetSentListURL(CorpNum : String; UserID: String) : String;

                // 플러스친구 목록 확인
                function ListPlusFriendID(CorpNum : String; UserID : String = '') : TPlusFriendList;

                // 발신번호 목록 확인
                function GetSenderNumberList(CorpNum: String; UserID : String = '') : TKakaoSenderNumberList;

                // 알림톡 템플릿 목록 확인
                function ListATSTemplate(CorpNum : String; UserID : String = '') : TATSTemplateList;



                // 알림톡 전송(단건)
                function SendATS(CorpNum : String; TemplateCode : String; SenderNum : String; AltSendType : String; ReserveDT: String; ReceiverNum : String; ReceiverName : String; ATSMsg : String; ATSAltMsg : String; UserID : String = ''; requestNum : String = '') : String; overload;

                // 알림톡 전송(단건) - 버튼 추가                
                function SendATS(CorpNum : String; TemplateCode : String; SenderNum : String; AltSendType : String; ReserveDT: String; ReceiverNum : String; ReceiverName : String; ATSMsg : String; ATSAltMsg : String; Buttons : TSendKakaoButtonList; UserID : String = ''; requestNum : String = '') : String; overload;                

                // 알림톡 전송(대량)
                function SendATS(CorpNum : String; TemplateCode : String; SenderNum : String; Content : String; AltContent: String; AltSendType : String; ReserveDT: String; Receivers : TSendKakaoReceiverList; UserID : String = ''; requestNum : String = '') : String; overload;

                // 알림톡 전송(대량) - 버튼 추가                
                function SendATS(CorpNum : String; TemplateCode : String; SenderNum : String; Content : String; AltContent: String; AltSendType : String; ReserveDT: String; Receivers : TSendKakaoReceiverList; Buttons : TSendKakaoButtonList; UserID : String = ''; requestNum : String = '') : String; overload;                


                // 친구톡 텍스트 전송(단건)
                function SendFTS(CorpNum : String; PlusFriendID : String; SenderNum : String; AltSendType : String; ReserveDT : String; AdsYN : Boolean; ReceiverNum : String; ReceiverName : String; FTSMsg : String; FTSAltMsg : String; Buttons : TSendKakaoButtonList; UserID : string = ''; requestNum : String = '') : String; overload;

                // 친구톡 텍스트 전송 (대량)
                function SendFTS(CorpNum : String; PlusFriendID : String; SenderNum : String; Content : String; AltContent : String; AltSendType : String; ReserveDT : String; AdsYN : Boolean; Receivers : TSendKakaoReceiverList; Buttons : TSendKakaoButtonList; UserID : string = ''; requestNum : String = '') : String; overload;


                // 친구톡 이미지 전송(단건)
                function SendFMS(CorpNum : String; PlusFriendID : String; SenderNum : String; AltSendType : String; ReserveDT : String; AdsYN : Boolean; ReceiverNum : String; ReceiverName : String; FTSMsg : String; FTSAltMsg : String; FMSFilePath : String; ImageURL : String; Buttons : TSendKakaoButtonList; UserID : string = ''; requestNum : String = '') : String; overload;

                // 친구톡 이미지 전송(대량)
                function SendFMS(CorpNum : String; PlusFriendID : String; SenderNum : String; Content : String; AltContent : String; AltSendType : String; ReserveDT : String; AdsYN : Boolean; Receivers : TSendKakaoReceiverList; FMSFilePath : String; ImageURL : String; Buttons : TSendKakaoButtonList; UserID : string = ''; requestNum : String = '') : String; overload;



                // 예약취소
                function CancelReserve(CorpNum : String; receiptNum : String; UserID : String = '') : TResponse;

                // 예약취소 - 요청번호 할당
                function CancelReserveRN(CorpNum : String; requestNum : String; UserID : String = '') : TResponse;

                // 상세내역 및 전송상태 확인
                function GetMessages(CorpNum : String; receiptNum : String; UserID : String = '') : TSentKakaoInfo;

                // 상세내역 및 전송상태 확인 - 요청번호 할당
                function GetMessagesRN(CorpNum : String; requestNum : String; UserID : String = '') : TSentKakaoInfo;

                // 목록조회
                function Search(CorpNum : String; SDate: String; EDate : String; State : Array Of String; Item : Array Of String; ReserveYN : String; SenderYN : boolean; Page : Integer; PerPage : Integer; Order : String; UserID : String = ''): TKakaoSearchList; overload;
                function Search(CorpNum : String; SDate: String; EDate : String; State : Array Of String; Item : Array Of String; ReserveYN : String; SenderYN : boolean; Page : Integer; PerPage : Integer; Order : String; QString : String; UserID : String): TKakaoSearchList; overload;

                // 연동회원 전송단가 확인
                function GetUnitCost(CorpNum : String; KakaoMsgType:EnumKakaoType; UserID : String = '') : Single;

                // 과금정보 확인
                function GetChargeInfo(CorpNum : String; KakaoMsgType:EnumKakaoType; UserID : String = '') : TKakaoChargeInfo;



        end;
implementation

constructor TKakaoService.Create(LinkID : String; SecretKey : String);
begin
        inherited Create(LinkID,SecretKey);
        AddScope('153');
        AddScope('154');
        AddScope('155');
end;

function BoolToStr(b:Boolean):String;
begin
        if b = true then BoolToStr:='True';
        if b = false then BoolToStr:='False';
end;

// 팝업 URL
function TKakaoService.GetURL(CorpNum : String; TOGO : String; UserID : String) : string;
var
        responseJson : String;
begin

        try
                // 발신번호 관리 팝업
                if TOGO = 'SENDER' then
                        responseJson := httpget('/Message/?TG='+TOGO, CorpNum, UserID)
                else
                        responseJson := httpget('/KakaoTalk/?TG='+TOGO, CorpNum, UserID);

                result := getJsonString(responseJson, 'url');
        except
                on le : EPopbillexception do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code, le.message);
                        end;

                end;
        end;
end;

// 플러스친구 계정관리 팝업 URL
function TKakaoService.GetPlusFriendMgtURL(CorpNum : String; UserID : String) : string;
var
        responseJson : String;
begin
        try
                responseJson := httpget('/KakaoTalk/?TG=PLUSFRIEND', CorpNum, UserID);
                result := getJsonString(responseJson, 'url');
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

// 발신번호 관리 팝업 URL
function TKakaoService.GetSenderNumberMgtURL(CorpNum : String; UserID : String) : string;
var
        responseJson : String;
begin
        try
                responseJson := httpget('/Message/?TG=SENDER', CorpNum, UserID);
                result := getJsonString(responseJson, 'url');
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

// 알림톡 템플릿 관리 팝업 URL
function TKakaoService.GetATSTemplateMgtURL(CorpNum : String; UserID : String) : string;
var
        responseJson : String;
begin
        try
                responseJson := httpget('/KakaoTalk/?TG=TEMPLATE', CorpNum, UserID);
                result := getJsonString(responseJson, 'url');
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

// 카카오톡 전송내역 팝업 URL
function TKakaoService.GetSentListURL(CorpNum : String; UserID : String) : string;
var
        responseJson : String;
begin
        try
                responseJson := httpget('/KakaoTalk/?TG=BOX', CorpNum, UserID);
                result := getJsonString(responseJson, 'url');
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

// 플러스친구 계정 목록
function TKakaoService.ListPlusFriendID(CorpNum : String; UserID : String = '') : TPlusFriendList;
var
        responseJson : String;
        jSons : ArrayOfString;
        i : Integer;
begin
        try
                responseJson := httpget('/KakaoTalk/ListPlusFriendID',CorpNum, UserID);
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
                                SetLength(jSons,0);
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

                        for i:=0 to Length(jSons)-1 do
                        begin
                                result[i] := TPlusFriendInfo.Create;
                                result[i].plusFriendID := getJsonString(jSons[i], 'plusFriendID');
                                result[i].plusFriendName := getJsonString(jSons[i], 'plusFriendName');
                                result[i].regDT := getJsonString(jSons[i], 'regDT');
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

// 발신번호 목록 조회
function TKakaoService.GetSenderNumberList(CorpNum : String; UserID: String = '') : TKakaoSenderNumberList;
var
        responseJson : String;
        jSons : ArrayOfString;
        i : Integer;
begin


        try
                responseJson := httpget('/Message/SenderNumber',CorpNum, UserID);
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
                                SetLength(jSons,0);
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
                                result[i] := TKakaoSenderNumber.Create;
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

// 알림톡 템플릿 목록 확인
function TKakaoService.ListATSTemplate(CorpNum : String; UserID : String = '') : TATSTemplateList;
var
        responseJson : String;
        jSons, btnjSons : ArrayOfString;
        i, j: Integer;

begin
        try
                responseJson := httpget('/KakaoTalk/ListATSTemplate', CorpNum, UserID);
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
                                SetLength(jSons,0);
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
                        result[i] := TATSTemplate.Create;
                        result[i].templateCode := getJsonString(jSons[i], 'templateCode');
                        result[i].templateName := getJsonString(jSons[i], 'templateName');
                        result[i].template := getJsonString(jSons[i], 'template');
                        result[i].plusFriendID := getJsonString(jSons[i], 'plusFriendID');

                        // 알림톡 템플릿 버튼
                        btnjSons := getJSonList(jSons[i], 'btns');
                        SetLength(result[i].btns, Length(btnjSons));

                        for j:= 0 to Length(btnjSons)-1 do
                        begin
                                result[i].btns[j] := TSendKakaoButton.Create;
                                result[i].btns[j].buttonName := getJSonString(btnjSons[j],'n');
                                result[i].btns[j].buttonType := getJSonString(btnjSons[j],'t');
                                result[i].btns[j].buttonURL1 := getJSonString(btnjSons[j],'u1');
                                result[i].btns[j].buttonURL2 := getJSonString(btnjSons[j],'u2');
                        end;
                        SetLength(btnjSons,0);
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
               
// 예약전송 취소
function TKakaoService.CancelReserve(CorpNum : String; receiptNum : String; UserID : String = '') : TResponse;
var
        responseJson : String;
begin
        if receiptNum = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999,'접수번호가 입력되지 않았습니다');
                        exit;
                end
                else
                begin
                        result.code := -99999999;
                        result.message := '접수번호가 입력되지 않았습니다';
                        exit;
                end;
        end;
        
        try
                responseJson := httpget('/KakaoTalk/'+receiptNum+'/Cancel',CorpNum,UserID);
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code, le.Message);
                                exit;
                        end
                        else
                        begin
                                result.code := le.code;
                                result.message := le.message;
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
                result.code := getJsonInteger(responseJson,'code');
                result.message := getJsonString(responseJson,'message');
                exit;
        end;
end;


function TKakaoService.GetMessages(CorpNum : String; receiptNum : String; UserID : String = '') : TSentKakaoInfo;
var
        responseJson : String;
        jSons : ArrayofString;
        i : Integer;
begin
        if receiptNum = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999,'접수번호가 입력되지 않았습니다');
                        exit;
                end
                else
                begin
                        result := TSentKakaoInfo.Create;
                        setLastErrCode(-99999999);
                        setLastErrMessage('접수번호가 입력되지 않았습니다');
                        exit;
                end;
        end;

        try
                responseJson := httpget('/KakaoTalk/'+receiptNum, CorpNum, UserID);
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code,le.message);
                                exit;
                        end
                        else
                        begin
                                result := TSentKakaoInfo.Create;
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
                result := TSentKakaoInfo.Create;
                result.contentType := getJsonString(responseJson, 'contentType');
                result.templateCode := getJsonString(responseJson, 'templateCode');
                result.plusFriendID := getJsonString(responseJson, 'plusFriendID');
                result.sendNum := getJsonString(responseJson, 'sendNum');
                result.altContent := getJsonString(responseJson, 'altContent');
                result.altSendType := getJsonString(responseJson, 'altSendType');
                result.reserveDT := getJsonString(responseJson, 'reserveDT');
                result.adsYN := getJsonBoolean(responseJson, 'adsYN');
                result.imageURL := getJsonString(responseJson, 'imageURL');
                result.sendCnt := getJsonString(responseJson, 'sendCnt');
                result.successCnt := getJsonString(responseJson, 'successCnt');
                result.failCnt := getJsonString(responseJson, 'failCnt');
                result.altCnt := getJsonString(responseJson, 'altCnt');
                result.cancelCnt := getJsonString(responseJson, 'cancelCnt');

                jSons := getJSonList(responseJson, 'btns');
                SetLength(result.btns, Length(jSons));

                for i:= 0 to Length(jSons)-1 do
                begin
                        result.btns[i] := TSendKakaoButton.Create;
                        result.btns[i].buttonName := getJSonString(jSons[i],'n');
                        result.btns[i].buttonType := getJSonString(jSons[i],'t');
                        result.btns[i].buttonURL1 := getJSonString(jSons[i],'u1');
                        result.btns[i].buttonURL2 := getJSonString(jSons[i],'u2');
                end;

                jSons := getJSonList(responseJson, 'msgs');
                SetLength(result.msgs, Length(jSons));

                for i:= 0 to Length(jSons)-1 do
                begin
                        result.msgs[i] := TSentKakaoDetail.Create;
                        result.msgs[i].state := getJsonInteger(jSons[i],'state');
                        result.msgs[i].sendDT := getJsonString(jSons[i],'sendDT');
                        result.msgs[i].result := getJsonInteger(jSons[i], 'result');
                        result.msgs[i].resultDT := getJsonString(jSons[i], 'resultDt');
                        result.msgs[i].contentType := getJsonString(jSons[i], 'contentType');
                        result.msgs[i].receiveNum := getJsonString(jSons[i], 'receiveNum');
                        result.msgs[i].receiveName := getJsonString(jSons[i], 'receiveName');
                        result.msgs[i].content := getJsonString(jSons[i], 'content');
                        result.msgs[i].altContentType := getJsonInteger(jSons[i], 'altContentType');
                        result.msgs[i].altSendDT := getJsonString(jSons[i], 'altSendDT');
                        result.msgs[i].altResult := getJsonInteger(jSons[i], 'altResult');
                        result.msgs[i].altResultDT := getJsonString(jSons[i], 'altResultDT');
                        result.msgs[i].altContent := getJsonString(jSons[i], 'altContent');
                        result.msgs[i].receiptNum := getJsonString(jSons[i], 'receiptNum');
                        result.msgs[i].requestNum := getJsonString(jSons[i], 'requestNum');
                end;

        except
                on E:Exception do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(-99999999, '결과처리 실패.[Malformed Json]');
                                exit;
                        end
                        else
                        begin
                                result := TSentKakaoInfo.Create();
                                setLastErrCode(-99999999);
                                setLastErrMessage('결과처리 실패.[Malformed Json]');
                                exit;
                        end;
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

// 목록조회
function TKakaoService.Search(CorpNum : String; SDate: String; EDate : String; State : Array Of String; Item : Array Of String; ReserveYN : String; SenderYN : boolean; Page : Integer; PerPage : Integer; Order : String; UserID : String = ''): TKakaoSearchList;
begin
        result := Search(CorpNum, SDate, EDate, State, Item, ReserveYN, SenderYN, Page, PerPage, Order, '', UserID);
end;

function TKakaoService.Search(CorpNum, SDate, EDate: String; State, Item: array of String; ReserveYN: String; SenderYN: boolean; Page, PerPage: Integer; Order, QString, UserID: String): TKakaoSearchList;
var
        responseJson : String;
        uri: String;
        StateList : String;
        ItemList : String;
        jSons : ArrayOfString;
        i : Integer;
begin

        for i := 0 to High(State)do
        begin
                if State[i] <> '' Then
                StateList := StateList + State[i] + ',';
        end;

        for i:= 0 to High(Item) do
        begin
                if Item[i] <> '' Then
                ItemList := ItemList + Item[i] + ',';
        end;

        uri := '/KakaoTalk/Search?SDate='+SDate+'&&EDate='+EDate;
        uri := uri + '&&State='+StateList;
        uri := uri + '&&Item='+ItemList;

        if Page < 1 then Page := 1;
        uri := uri + '&&Page='+IntToStr(Page);
        uri := uri + '&&PerPage=' + IntToStr(Perpage);

        if ReserveYN <> '' then uri := uri + '&&ReserveYN=' + ReserveYN;

        if SenderYN then uri := uri + '&&SenderYN=1'
        else uri := uri +'&&SenderYN=0';

        uri := uri + '&&Order=' + Order;

        if QString <> '' then uri := uri + '&&QString=' + UrlEncodeUTF8(QString);

        
        try
                responseJson := httpget(uri, CorpNum, UserID);
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code,le.message);
                                exit;
                        end
                        else
                        begin
                                result:= TKakaoSearchList.Create;
                                result.code := le.code;
                                result.message := le.message;
                                exit;
                        end;
                end;
        end;


        if LastErrCode <> 0 then
        begin
                result := TKakaoSearchList.Create;
                result.code := LastErrCode;
                result.message := LastErrMessage;
                exit;
        end
        else
        begin
        
        result := TKakaoSearchList.Create;

        result.code := getJsonInteger(responseJson, 'code');
        result.message := getJsonString(responseJson, 'message');
        result.total := getJsonInteger(responseJson, 'total');
        result.perPage := getJsonInteger(responseJson, 'perPage');
        result.pageNum := getJsonInteger(responseJson, 'pageNum');
        result.pageCount := getJsonInteger(responseJson, 'pageCount');

        try
                jSons := getJSonList(responseJson, 'list');
                SetLength(result.list, Length(jSons));

                for i:= 0 to Length(jSons)-1 do
                begin
                        result.list[i] := TSentKakaoDetail.Create;
                        result.list[i].state := getJsonInteger(jSons[i],'state');
                        result.list[i].sendDT := getJsonString(jSons[i],'sendDT');
                        result.list[i].result := getJsonInteger(jSons[i], 'result');
                        result.list[i].resultDT := getJsonString(jSons[i], 'resultDT');
                        result.list[i].contentType := getJsonString(jSons[i], 'contentType');
                        result.list[i].receiveNum := getJsonString(jSons[i], 'receiveNum');
                        result.list[i].receiveName := getJsonString(jSons[i], 'receiveName');
                        result.list[i].content := getJsonString(jSons[i], 'content');
                        result.list[i].altContentType := getJsonInteger(jSons[i], 'altContentType');
                        result.list[i].altSendDT := getJsonString(jSons[i], 'altSendDT');
                        result.list[i].altResult := getJsonInteger(jSons[i], 'altResult');
                        result.list[i].altResultDT := getJsonString(jSons[i], 'altResultDT');
                        result.list[i].altContent := getJsonString(jSons[i], 'altContent');
                        result.list[i].receiptNum := getJsonString(jSons[i], 'receiptNum');
                        result.list[i].requestNum := getJsonString(jSons[i], 'requestNum');
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
                                result := TKakaoSearchList.Create;
                                result.code := -99999999;
                                result.message := '결과처리 실패.[Malformed Json]';
                                exit; 
                        end;
                end;
        end;
        end;
end;

// 알림톡 단건전송
function TKakaoService.SendATS(CorpNum : String; TemplateCode : String; SenderNum : String; AltSendType : String; ReserveDT: String; ReceiverNum : String; ReceiverName : String; ATSMsg : String; ATSAltMsg : String; UserID : String = ''; requestNum : String = '') : String;
var
        Receivers : TSendKakaoReceiverList;
begin
        SetLength(Receivers,1);
        Receivers[0] := TSendKakaoReceiver.Create;
        Receivers[0].rcv := ReceiverNum;
        Receivers[0].rcvnm := ReceiverName;
        Receivers[0].msg := ATSMsg;
        Receivers[0].altmsg := ATSAltMsg;

        result := SendATS(CorpNum, TemplateCode, SenderNum, '', '', AltSendType, ReserveDT, Receivers, UserID, requestNum);
end;

// 알림톡 단건전송 - 버튼추가
function TKakaoService.SendATS(CorpNum : String; TemplateCode : String; SenderNum : String; AltSendType : String; ReserveDT: String; ReceiverNum : String; ReceiverName : String; ATSMsg : String; ATSAltMsg : String; Buttons : TSendKakaoButtonList; UserID : String = ''; requestNum : String = '') : String;
var
        Receivers : TSendKakaoReceiverList;
begin
        SetLength(Receivers,1);
        Receivers[0] := TSendKakaoReceiver.Create;
        Receivers[0].rcv := ReceiverNum;
        Receivers[0].rcvnm := ReceiverName;
        Receivers[0].msg := ATSMsg;
        Receivers[0].altmsg := ATSAltMsg;

        result := SendATS(CorpNum, TemplateCode, SenderNum, '', '', AltSendType, ReserveDT, Receivers, Buttons, UserID, requestNum);
end;

// 알림톡 대량전송
function TKakaoService.SendATS(CorpNum : String; TemplateCode : String; SenderNum : String; Content : String; AltContent: String; AltSendType : String; ReserveDT: String; Receivers : TSendKakaoReceiverList; UserID : String = ''; requestNum : String = '') : String;
var
        Buttons : TSendKakaoButtonList;
begin
        SetLength(Buttons, 0);
        result := SendATS(CorpNum, TemplateCode, SenderNum, Content, AltContent, AltSendType, ReserveDT, Receivers, Buttons, UserID, requestNum); 

end;


// 알림톡 대량전송
function TKakaoService.SendATS(CorpNum : String; TemplateCode : String; SenderNum : String; Content : String; AltContent: String; AltSendType : String; ReserveDT: String; Receivers : TSendKakaoReceiverList; Buttons : TSendKakaoButtonList; UserID : String = ''; requestNum : String = '' ) : String;
var
         requestJson, responseJson : string;
         i : Integer;
begin
        
        if TemplateCode = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999, '알림톡 템플릿코드가 입력되지 않았습니다.');
                        exit;
                end
                else
                begin
                        result := '';
                        setLastErrCode(-99999999);
                        setLastErrMessage('알림톡 템플릿코드가 입력되지 않았습니다.');
                        exit;                        
                end;
        end;
        
        if SenderNum = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999, '알림톡 발신번호가 입력되지 않았습니다.');
                        exit;
                end
                else
                begin
                        result := '';
                        setLastErrCode(-99999999);
                        setLastErrMessage('알림톡 발신번호가 입력되지 않았습니다.');
                        exit;
                end;
        end;
        
        if Length(Receivers) = 0 then
        begin
                if FIsThrowException then
                begin
                         raise EPopbillException.Create(-99999999, '수신정보배열이 입력되지 않았습니다.');
                         exit;
                end
                else
                begin
                        result := '';
                        setLastErrCode(-99999999);
                        setLastErrMessage('수신정보배열이 입력되지 않았습니다.');
                        exit;
                end;
        end;
        

        requestJson := '{';

        if TemplateCode <> ''  then requestJson := requestJson + '"templateCode":"' + EscapeString(TemplateCode) + '",';
        if SenderNum    <> ''  then requestJson := requestJson + '"snd":"'          + EscapeString(SenderNum)    + '",';
        if Content      <> ''  then requestJson := requestJson + '"content":"'      + EscapeString(Content)      + '",';
        if AltContent   <> ''  then requestJson := requestJson + '"altContent":"'   + EscapeString(AltContent)   + '",';
        if AltSendType  <> ''  then requestJson := requestJson + '"altSendType":"'  + EscapeString(AltSendType)  + '",';
        if reserveDT    <> ''  then requestJson := requestJson + '"sndDT":"'        + EscapeString(reserveDT)    + '",';
        if requestNum   <> ''  then requestJson := requestJson + '"requestNum":"'   + EscapeString(requestNum)   + '",';

        requestJson := requestJson + '"msgs":[';
        for i := 0 to Length(Receivers) - 1 do begin
                requestJson := requestJson
                        + '{"rcv":"'   + EscapeString(Receivers[i].rcv)      + '",'
                        + '"rcvnm":"'  + EscapeString(Receivers[i].rcvnm)    + '",'
                        + '"msg":"'    + EscapeString(Receivers[i].msg)      + '",'
                        + '"altmsg":"' + EscapeString(Receivers[i].altmsg)   + '"}';
                if i < Length(Receivers) - 1 then requestJson := requestJson + ',';
        end;

        requestJson := requestJson + ']';
                
        if Length(Buttons) > 0 then
        begin
                requestJson := requestJson + ',"btns":[';
                for i := 0 to Length(Buttons) - 1 do begin
                        requestJson := requestJson +
                                '{"n":"'+EscapeString(Buttons[i].buttonName)+'",'+
                                '"t":"'+EscapeString(Buttons[i].buttonType)+'",'+
                                '"u1":"'+EscapeString(Buttons[i].buttonURl1)+'",'+
                                '"u2":"'+EscapeString(Buttons[i].buttonURL2)+'"}';

                        if i < Length(Buttons) - 1 then requestJson := requestJson + ',';
                end;
                requestJson := requestJson + ']';                
        end;


        requestJson := requestJson + '}';

        try
                responseJson := httppost('/ATS', CorpNum, UserID, requestJson);
                result := getJsonString(responseJson, 'receiptNum');
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

// 친구톡 텍스트 (단건)
function TKakaoService.SendFTS(CorpNum : String; PlusFriendID : String; SenderNum : String; AltSendType : String; ReserveDT : String; AdsYN : Boolean; ReceiverNum : String; ReceiverName : String; FTSMsg : String; FTSAltMsg : String; Buttons : TSendKakaoButtonList; UserID : string = ''; requestNum : String = '') : String;
var
        Receivers : TSendKakaoReceiverList;
begin
        SetLength(Receivers,1);
        Receivers[0] := TSendKakaoReceiver.Create;
        Receivers[0].rcv := ReceiverNum;
        Receivers[0].rcvnm := ReceiverName;
        Receivers[0].msg := FTSMsg;
        Receivers[0].altmsg := FTSAltMsg;

        result := SendFTS(CorpNum, PlusFriendID, SenderNum, '', '', AltSendType, ReserveDT, AdsYN, Receivers, Buttons, UserID, requestNum);
end;

// 친구톡 텍스트 (대량)
function TKakaoService.SendFTS(CorpNum : String; PlusFriendID : String; SenderNum : String; Content : String; AltContent : String; AltSendType : String; ReserveDt : String; AdsYN : Boolean; Receivers : TSendKakaoReceiverList; Buttons : TSendKakaoButtonList; UserID : string = ''; requestNum : String = '') : String;
var
        requestJson, responseJson : string;
        i : Integer;
begin

        if SenderNum = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999, '친구톡 발신번호가 입력되지 않았습니다.');
                        exit;
                end
                else
                begin
                        result := '';
                        setLastErrCode(-99999999);
                        setLastErrMessage('친구톡 발신번호가 입력되지 않았습니다.');
                        exit;
                end;
        end;

        if Length(Receivers) = 0 then
        begin
                if FIsThrowException then
                begin
                         raise EPopbillException.Create(-99999999, '수신정보배열이 입력되지 않았습니다.');
                         exit;
                end
                else
                begin
                        result := '';
                        setLastErrCode(-99999999);
                        setLastErrMessage('수신정보배열이 입력되지 않았습니다.');
                        exit;
                end;
        end;
        
        if PlusFriendID = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999, '플러스친구 아이디가 입력되지 않았습니다.');
                        exit;
                end
                else
                begin
                        result := '';
                        setLastErrCode(-99999999);
                        setLastErrMessage('플러스친구 아이디가 입력되지 않았습니다.');
                        exit;                        
                end;
        end;

        requestJson := '{';

        if PlusFriendID <> ''  then requestJson := requestJson + '"plusFriendID":"' + EscapeString(PlusFriendID) + '",';
        if SenderNum    <> ''  then requestJson := requestJson + '"snd":"'          + EscapeString(SenderNum)    + '",';
        if Content      <> ''  then requestJson := requestJson + '"content":"'      + EscapeString(Content)      + '",';
        if AltContent   <> ''  then requestJson := requestJson + '"altContent":"'   + EscapeString(AltContent)   + '",';
        if AltSendType  <> ''  then requestJson := requestJson + '"altSendType":"'  + EscapeString(AltSendType)  + '",';
        if reserveDT    <> ''  then requestJson := requestJson + '"sndDT":"'        + EscapeString(reserveDT)    + '",';
        if requestNum   <> ''  then requestJson := requestJson + '"requestNum":"'   + EscapeString(requestNum)    + '",';
        if adsYN then requestJson := requestJson + '"adsYN":true,';

        requestJson := requestJson + '"msgs":[';
        for i := 0 to Length(Receivers) - 1 do begin
                requestJson := requestJson +
                        '{"rcv":"'+EscapeString(Receivers[i].rcv)+'",'+
                        '"rcvnm":"'+EscapeString(Receivers[i].rcvnm)+'",'+
                        '"msg":"'+EscapeString(Receivers[i].msg)+'",'+
                        '"altmsg":"'+EscapeString(Receivers[i].altmsg)+'"}';

                if i < Length(Receivers) - 1 then requestJson := requestJson + ',';
        end;
        requestJson := requestJson + ']';

        requestJson := requestJson + ',"btns":[';
        for i := 0 to Length(Buttons) - 1 do begin
                requestJson := requestJson +
                        '{"n":"'+EscapeString(Buttons[i].buttonName)+'",'+
                        '"t":"'+EscapeString(Buttons[i].buttonType)+'",'+
                        '"u1":"'+EscapeString(Buttons[i].buttonURl1)+'",'+
                        '"u2":"'+EscapeString(Buttons[i].buttonURL2)+'"}';

                if i < Length(Buttons) - 1 then requestJson := requestJson + ',';
        end;
        requestJson := requestJson + ']';

        requestJson := requestJson + '}';

        try
                responseJson := httppost('/FTS', CorpNum, UserID, requestJson);
                result := getJsonString(responseJson, 'receiptNum');
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


// 친구톡 이미지 (단건)
function TKakaoService.SendFMS(CorpNum : String; PlusFriendID : String; SenderNum : String; AltSendType : String; ReserveDT : String; AdsYN : Boolean; ReceiverNum : String; ReceiverName : String; FTSMsg : String; FTSAltMsg : String; FMSFilePath : String; ImageURL : String; Buttons : TSendKakaoButtonList; UserID : string = ''; requestNum : String = '') : String;
var
        Receivers : TSendKakaoReceiverList;
begin
        SetLength(Receivers,1);
        Receivers[0] := TSendKakaoReceiver.Create;
        Receivers[0].rcv := ReceiverNum;
        Receivers[0].rcvnm := ReceiverName;
        Receivers[0].msg := FTSMsg;
        Receivers[0].altmsg := FTSAltMsg;

        result := SendFMS(CorpNum, PlusFriendID, SenderNum, '', '', AltSendType, ReserveDT, AdsYN, Receivers, FMSFilePath, ImageURL, Buttons, UserID, requestNum);
end;

// 친구톡 이미지 (대량)
function TKakaoService.SendFMS(CorpNum : String; PlusFriendID : String; SenderNum : String; Content : String; AltContent : String; AltSendType : String; ReserveDT : String; AdsYN : Boolean; Receivers : TSendKakaoReceiverList; FMSFilePath : String; ImageURl: string; Buttons : TSendKakaoButtonList; UserID : string = ''; requestNum : String = '') : String;
var
        requestJson, responseJson : string;
        i : Integer;
        files : TFileList;
begin
        if SenderNum = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999, '친구톡 발신번호가 입력되지 않았습니다.');
                        exit;
                end
                else
                begin
                        result := '';
                        setLastErrCode(-99999999);
                        setLastErrMessage('친구톡 발신번호가 입력되지 않았습니다.');
                        exit;
                end;
        end;

        if Length(Receivers) = 0 then
        begin
                if FIsThrowException then
                begin
                         raise EPopbillException.Create(-99999999, '수신정보배열이 입력되지 않았습니다.');
                         exit;
                end
                else
                begin
                        result := '';
                        setLastErrCode(-99999999);
                        setLastErrMessage('수신정보배열이 입력되지 않았습니다.');
                        exit;
                end;
        end;
        
        if PlusFriendID = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999, '플러스친구 아이디가 입력되지 않았습니다.');
                        exit;
                end
                else
                begin
                        result := '';
                        setLastErrCode(-99999999);
                        setLastErrMessage('플러스친구 아이디가 입력되지 않았습니다.');
                        exit;                        
                end;
        end;

        SetLength(files,1);

        files[0] := TFile.Create;
        files[0].FieldName := 'file';                 
        files[0].FileName := ExtractFileName(FMSFilePath);
        files[0].Data := TFileStream.Create(FMSFilePath,fmOpenRead);

        requestJson := '{';

        if PlusFriendID <> ''          then requestJson := requestJson + '"plusFriendID":"' + EscapeString(PlusFriendID) + '",';
        if SenderNum <> ''          then requestJson := requestJson + '"snd":"' + EscapeString(SenderNum) + '",';
        if Content <> ''         then requestJson := requestJson + '"content":"' + EscapeString(Content) + '",';
        if AltContent <> ''         then requestJson := requestJson + '"altContent":"' + EscapeString(AltContent) + '",';
        if AltSendType <> ''         then requestJson := requestJson + '"altSendType":"' + EscapeString(AltSendType) + '",';
        if reserveDT <> ''       then requestJson := requestJson + '"sndDT":"' + EscapeString(reserveDT) + '",';
        if imageURL <> ''       then requestJson := requestJson + '"imageURL":"' + EscapeString(imageURL) + '",';
        if requestNum <> ''       then requestJson := requestJson + '"requestNum":"' + EscapeString(requestNum) + '",';
        if adsYN then requestJson := requestJson + '"adsYN":true,';

        requestJson := requestJson + '"msgs":[';
        for i := 0 to Length(Receivers) - 1 do begin
                requestJson := requestJson +
                        '{"rcv":"'+EscapeString(Receivers[i].rcv)+'",'+
                        '"rcvnm":"'+EscapeString(Receivers[i].rcvnm)+'",'+
                        '"msg":"'+EscapeString(Receivers[i].msg)+'",'+
                        '"altmsg":"'+EscapeString(Receivers[i].altmsg)+'"}';

                if i < Length(Receivers) - 1 then requestJson := requestJson + ',';
        end;
        requestJson := requestJson + ']';

        requestJson := requestJson + ',"btns":[';
        for i := 0 to Length(Buttons) - 1 do begin
                requestJson := requestJson +
                        '{"n":"'+EscapeString(Buttons[i].buttonName)+'",'+
                        '"t":"'+EscapeString(Buttons[i].buttonType)+'",'+
                        '"u1":"'+EscapeString(Buttons[i].buttonURl1)+'",'+
                        '"u2":"'+EscapeString(Buttons[i].buttonURL2)+'"}';

                if i < Length(Buttons) - 1 then requestJson := requestJson + ',';
        end;
        requestJson := requestJson + ']';

        requestJson := requestJson + '}';

        try
                try
                        responseJson := httppost('/FMS', CorpNum, UserID, requestJson, files);
                        result := getJsonString(responseJson, 'receiptNum');                        
                except
                        on le : EPopbillException do begin
                                if FIsThrowException then
                                begin
                                        raise EPopbillException.Create(le.code, le.message);
                                        exit;
                                end;
                        end;
                end;
        finally
                for i := 0 to Length(files) -1 do
                begin
                        files[i].Data.Free;
                end;
        end;

end;


// 전송단가 조회
function TKakaoService.GetUnitCost(CorpNum : String; KakaoMsgType:EnumKakaoType; UserID : String = '') : Single;
var
        responseJson : String;
begin

        try 
                responseJson := httpget('/KakaoTalk/UnitCost?Type='+GetEnumName(TypeInfo(EnumKakaoType),integer(KakaoMsgType)), CorpNum, UserID);
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code, le.message);
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
                result := strToFloat(getJsonString(responseJson, 'unitCost'));
        end;
end;

// 과금정보 조회
function TKakaoService.GetChargeInfo(CorpNum : String; KakaoMsgType:EnumKakaoType; UserID : String = '') : TKakaoChargeInfo;
var
        responseJson : String;
begin
        try
                responseJson := httpget('/KakaoTalk/ChargeInfo?Type='+GetEnumName(TypeInfo(EnumKakaoType),integer(KakaoMsgType)), CorpNum, UserID);
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code,le.message);
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
                result := TKakaoChargeInfo.Create;

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
                                result := TKakaoChargeInfo.Create;
                                setLastErrCode(-99999999);
                                setLastErrMessage('결과처리 실패.[Malformed Json]');
                                exit;
                        end;
                end;
        end;
        end;
end;

function TKakaoService.GetMessagesRN(CorpNum, requestNum, UserID: String): TSentKakaoInfo;
var
        responseJson : String;
        jSons : ArrayofString;
        i : Integer;
begin
        if requestNum = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999,'요청번호(requestNum)가 입력되지 않았습니다');
                        exit;
                end
                else
                begin
                        result := TSentKakaoInfo.Create;
                        setLastErrCode(-99999999);
                        setLastErrMessage('요청번호(requestNum)가 입력되지 않았습니다');
                        exit;
                end;
        end;

        try

        responseJson := httpget('/KakaoTalk/Get/'+ requestNum, CorpNum, UserID);

        try
                result := TSentKakaoInfo.Create;
                result.contentType := getJsonString(responseJson, 'contentType');
                result.templateCode := getJsonString(responseJson, 'templateCode');
                result.plusFriendID := getJsonString(responseJson, 'plusFriendID');
                result.sendNum := getJsonString(responseJson, 'sendNum');
                result.altContent := getJsonString(responseJson, 'altContent');
                result.altSendType := getJsonString(responseJson, 'altSendType');
                result.reserveDT := getJsonString(responseJson, 'reserveDT');
                result.adsYN := getJsonBoolean(responseJson, 'adsYN');
                result.imageURL := getJsonString(responseJson, 'imageURL');
                result.sendCnt := getJsonString(responseJson, 'sendCnt');
                result.successCnt := getJsonString(responseJson, 'successCnt');
                result.failCnt := getJsonString(responseJson, 'failCnt');
                result.altCnt := getJsonString(responseJson, 'altCnt');
                result.cancelCnt := getJsonString(responseJson, 'cancelCnt');

                jSons := getJSonList(responseJson, 'btns');
                SetLength(result.btns, Length(jSons));

                for i:= 0 to Length(jSons)-1 do
                begin
                        result.btns[i] := TSendKakaoButton.Create;
                        result.btns[i].buttonName := getJSonString(jSons[i],'n');
                        result.btns[i].buttonType := getJSonString(jSons[i],'t');
                        result.btns[i].buttonURL1 := getJSonString(jSons[i],'u1');
                        result.btns[i].buttonURL2 := getJSonString(jSons[i],'u2');
                end;

                jSons := getJSonList(responseJson, 'msgs');
                SetLength(result.msgs, Length(jSons));

                for i:= 0 to Length(jSons)-1 do
                begin
                        result.msgs[i] := TSentKakaoDetail.Create;
                        result.msgs[i].state := getJsonInteger(jSons[i],'state');
                        result.msgs[i].sendDT := getJsonString(jSons[i],'sendDT');
                        result.msgs[i].result := getJsonInteger(jSons[i], 'result');
                        result.msgs[i].resultDT := getJsonString(jSons[i], 'resultDt');
                        result.msgs[i].contentType := getJsonString(jSons[i], 'contentType');
                        result.msgs[i].receiveNum := getJsonString(jSons[i], 'receiveNum');
                        result.msgs[i].receiveName := getJsonString(jSons[i], 'receiveName');
                        result.msgs[i].content := getJsonString(jSons[i], 'content');
                        result.msgs[i].altContentType := getJsonInteger(jSons[i], 'altContentType');
                        result.msgs[i].altSendDT := getJsonString(jSons[i], 'altSendDT');
                        result.msgs[i].altResult := getJsonInteger(jSons[i], 'altResult');
                        result.msgs[i].altResultDT := getJsonString(jSons[i], 'altResultDT');
                        result.msgs[i].altContent := getJsonString(jSons[i], 'altContent');
                        result.msgs[i].receiptNum := getJsonString(jSons[i], 'receiptNum');
                        result.msgs[i].requestNum := getJsonString(jSons[i], 'requestNum');
                end;

                except
                        on E:Exception do begin
                                if FIsThrowException then
                                begin
                                        raise EPopbillException.Create(-99999999, '결과처리 실패.[Malformed Json]');
                                        exit;
                                end
                                else
                                begin
                                        result := TSentKakaoInfo.Create;
                                        setLastErrCode(-99999999);
                                        setLastErrMessage('결과처리 실패.[Malformed Json]');
                                        exit;
                                end;
                        end;
                end;
        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code,le.message);
                        end
                        else
                        begin
                                result := TSentKakaoInfo.Create();
                                exit;
                        end;
                end;
        end;
end;

function TKakaoService.CancelReserveRN(CorpNum, requestNum, UserID: String): TResponse;
var
        responseJson : String;
begin
        if requestNum = '' then
        begin
                if FIsThrowException then
                begin
                        raise EPopbillException.Create(-99999999,'요청번호(requestNum)가 입력되지 않았습니다');
                        exit;
                end
                else
                begin
                        result.code := -99999999;
                        result.message := '요청번호(requestNum)가 입력되지 않았습니다'; 
                        exit;
                end;
        end;

        try
                responseJson := httpget('/KakaoTalk/Cancel/' + requestNum, CorpNum, UserID);


        except
                on le : EPopbillException do begin
                        if FIsThrowException then
                        begin
                                raise EPopbillException.Create(le.code, le.Message);
                                exit;
                        end
                        else
                        begin
                                result.code := le.code;
                                result.message := le.message;
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
                result.code := getJsonInteger(responseJson,'code');
                result.message := getJsonString(responseJson,'message');
        end;
end;


// End of Unit
end.
