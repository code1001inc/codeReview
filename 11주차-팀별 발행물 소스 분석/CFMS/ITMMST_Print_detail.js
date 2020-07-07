var Lsort = 'text-align : left; padding-left:5px;';
var Rsort = 'text-align : right; padding-right:5px;';
var Csort = 'text-align : center;';
var gJSON = null;
var jBean_obj = null;
var Array_data = new Array();
var resultDataArray = null;
var TotalPage = 0;
var ReqPage = 0;
var AppPage = 0;
var ReqBlankCheck = true;
var AppBlankCheck = true;

$(document).ready(function(){
	var today = new Date().toISOString().substr(0, 10).replace('T', ' ');
	jBean_obj = new Object();		
	jBean_obj = JSON.parse($("#jBean").val());
	var obj_Count = Object.keys(jBean_obj.Array_data).length;
	
	var OPTION = $("#sOPTION").val(); //추가한부분2
	
	//Array 넣기
	if(obj_Count > 0){
		for(var i = 0; i < obj_Count; i++){
			jsonTemp = new Object();
			jsonTemp.REQCOD = jBean_obj.Array_data[i].REQCOD;
			jsonTemp.REQSEQ = jBean_obj.Array_data[i].REQSEQ;
			Array_data.push(jsonTemp);
		}
	}else{
		alert("품의서를 발행할 품목이 없습니다. \n확인 후 다시 시도 해 주십시오.");
		close();
		return;
	}
	
//	setTotalReq();
	
	getPrintTotalReq();
	
	history.replaceState({}, null, location.pathname); //파라미터 값 제거
});


$.fn.rowspan = function(colIdx, isStats) { //열(row)병합
    return this.each(function(){  
    	var that;
        $('tr', this).each(function(row) {      
            $('td:eq('+colIdx+')', this).filter(':visible').each(function(col) {
                if ($(this).html() == $(that).html() && (!isStats || isStats && $(this).prev().html() == $(that).prev().html()) && $(this).text() != "") {            
                    rowspan = $(that).attr("rowspan") || 1;
                    rowspan = Number(rowspan)+1;
                    
                    $(that).attr("rowspan",rowspan);	// do your action for the colspan cell here
                    $(this).remove();					// do your action for the old cell here
//                    console.log(that);
                    //$(this).hide();
                    //$(this).remove(); 
                } else {            
                    that = this;         
                }          
                that = (that == null) ? this : that;	// do your action for the old cell here
            });     
        });    
    });  
};

function setTotalReq(i){ //합계표
	var TotalReq = new Array();
	
//	TotalReq.push('<div id="target" style="position:relative;">');
	if(i == 0){
		TotalReq.push('	<div id="PrintHead'+i+'" style="padding-top: 50px;">');
	}else{
		TotalReq.push('	<div id="PrintHead'+i+'" style="padding-top: 50px; page-break-before:always;">');
	}
	//<!-- 타이틀 시작 -->
	TotalReq.push('		<div style="text-align: center; padding: 10px 30px 20px 30px;">');
	TotalReq.push('			<span class="Title">사무용품(전산소모품)신청현황 합계표</span>'); 
	TotalReq.push('		</div>');
	//<!-- 타이틀 끝 -->
	//<!-- 신청일자 시작 -->
	TotalReq.push('		<div style="text-align: center; margin-bottom: 18px;">');
	TotalReq.push('			<span class="Reqdat" style="float: left; font-weight: bold; padding: 80px 5px 10px 10px; font-size: 12pt; ">');
	TotalReq.push('	                               신청일자 : <font class = "PUMDAT"></font><br/>');
	TotalReq.push('			</span>'); 
	TotalReq.push('		</div>');
	//<!-- 신청일자 끝 -->
	//<!-- 결제란 시작 -->
	TotalReq.push('		<table class="datalist01">');
	TotalReq.push('			<colgroup>');
	TotalReq.push('				<col width="9%" /><!-- 결재 -->');
	TotalReq.push('				<col width="13%"/><!-- 담당 -->');
	TotalReq.push('				<col width="13%"/><!-- 팀장 -->');
	TotalReq.push('				<col width="13%"/><!-- 부서장 -->');
	TotalReq.push('				<col width="13%"/><!-- 임원II -->');
	TotalReq.push('				<col width="13%"/><!-- 임원I -->');
	TotalReq.push('				<col width="13%"/><!-- 본부장 -->');
	TotalReq.push('				<col width="13%"/><!-- 대표이사 -->');
	TotalReq.push('			</colgroup>');
	TotalReq.push('			<tbody>');
	TotalReq.push('				<tr>');
	TotalReq.push('					<td rowspan="2" scope="col" style="font-weight: bold;">결<br/><br/>재<br/></td>');
	TotalReq.push('					<td scope="col" style="font-weight: bold; padding: 3px 5px 3px 5px">담당</td>');
	TotalReq.push('					<td scope="col" style="font-weight: bold; padding: 3px 5px 3px 5px">팀장</td>');
	TotalReq.push('					<td scope="col" style="font-weight: bold; padding: 3px 5px 3px 5px">부서장</td>');
	TotalReq.push('					<td scope="col" style="font-weight: bold; padding: 3px 5px 3px 5px">임원Ⅱ</td>');
	TotalReq.push('					<td scope="col" style="font-weight: bold; padding: 3px 5px 3px 5px">임원Ⅰ</td>');
	TotalReq.push('					<td scope="col" style="font-weight: bold; padding: 3px 5px 3px 5px">본부장</td>');
	TotalReq.push('					<td scope="col" style="font-weight: bold; padding: 3px 5px 3px 5px">대표이사</td>');
	TotalReq.push('				</tr>');
	TotalReq.push('');
	TotalReq.push('				<tr>');
	TotalReq.push('					<td scope="col" style="font-weight: bold; padding: 0; height: 48px;"></td>');
	TotalReq.push('					<td scope="col" style="font-weight: bold; padding: 0; height: 48px;"></td>');
	TotalReq.push('					<td scope="col" style="font-weight: bold; padding: 0; height: 48px;"></td>');
	TotalReq.push('					<td scope="col" style="font-weight: bold; padding: 0; height: 48px;"></td>');
	TotalReq.push('					<td scope="col" style="font-weight: bold; padding: 0; height: 48px;"></td>');
	TotalReq.push('					<td scope="col" style="font-weight: bold; padding: 0; height: 48px;"></td>');
	TotalReq.push('					<td scope="col" style="font-weight: bold; padding: 0; height: 48px;"></td>');
	TotalReq.push('				</tr>');
	TotalReq.push('			</tbody>');
	TotalReq.push('		</table>');
	//<!-- 결제란 끝 -->
	TotalReq.push('		<div class="body" style="margin: 10px 0px 8px 5px;"></div>');
	TotalReq.push('	</div>');
	//<!-- 그리드 해더 시작 -->
	TotalReq.push('	<div id="GridHead'+i+'">');
	TotalReq.push('		<table class="datalist02" style="margin-top: -2px; margin-left: 8px;">');                     
	TotalReq.push('			<colgroup id="ds'+i+'HeadCol">');                                                                               
	TotalReq.push('				<col width="10%"/><!-- 사업부/계열사 -->');
	TotalReq.push('				<col width="7%" /><!-- 구분 -->');
	TotalReq.push('				<col width="4%" /><!-- 수량 -->');
	TotalReq.push('				<col width="7%" /><!-- 공급가 -->');
	TotalReq.push('				<col width="7%" /><!-- 부가세 -->');
	TotalReq.push('				<col width="7%" /><!-- 합계금액 -->');
	TotalReq.push('				<col width="7%" /><!-- 비고 -->');
	TotalReq.push('			</colgroup>');                                                                              
	TotalReq.push('			<thead>');       	                                                                     
	TotalReq.push('				<tr>');                                                                                    
	TotalReq.push('					<th scope="col">사업부/계열사</th>');                                         
	TotalReq.push('					<th scope="col">구     분</th>');                                                             
	TotalReq.push('					<th scope="col">수     량</th>');                                                             
	TotalReq.push('					<th scope="col">공 급 가</th>');                                                               
	TotalReq.push('					<th scope="col">부 가 세</th>');                                                               
	TotalReq.push('					<th scope="col">합계금액</th>');
	TotalReq.push('					<th scope="col">비      고</th>');                                                                
	TotalReq.push('				</tr>');                                                                                    
	TotalReq.push('			</thead>');
	TotalReq.push('		</table>');                                                                                 
	TotalReq.push('	</div>');
	//<!-- 그리드 해더 끝 -->
	//<!-- 그리드 바디 시작 -->
	TotalReq.push('	<div class="gridbox" id="PrintBody'+i+'"></div>');
	//<!-- 그리드 바디 끝 -->
//	TotalReq.push('	<div style="margin:10px 0 0 10px; width: 500px; font-size: 10pt;">');
//	TotalReq.push('		※ 첨부 : 사업부/계열사 사무용품(전산소모품)신청내역서 1부');
//	TotalReq.push('	</div>');
	TotalReq.push('	<div class="pagingClass" style="float: right; margin: 10px 10px 0 0;"></div>');
//	TotalReq.push('</div>');
	
//	TotalReq.push('<div id="targetApplication" style="position:relative;"></div>');
	
	$("#target")[0].innerHTML += TotalReq.join('');
}

function setApplication(i){ //신청내역서
	var ApplicationPage = new Array();
	
	ApplicationPage.push('');
	
//	ApplicationPage.push('<div id="target'+i+'" style="position:relative; page-break-before:always">');
	ApplicationPage.push('	<div id="PrintHead'+i+'" style="padding-top: 50px; page-break-before:always">');
	//타이틀 시작
	ApplicationPage.push('    	<div style="text-align: center; padding: 10px 30px 20px 30px;">');
	ApplicationPage.push('    		<span class="Title">사업부/계열사 사무용품(전산소모품)신청내역서</span>'); 
	ApplicationPage.push('    	</div>');
	//타이틀 끝
	//신청일자 시작
	ApplicationPage.push('		<div style="text-align: center; margin-bottom: 18px;">');
	ApplicationPage.push('			<span class="Reqdat" style="float: left; font-weight: bold; padding: 80px 5px 10px 10px; font-size: 12pt;">');
	ApplicationPage.push('        	신청일자 : <font class = "PUMDAT"></font><br/>');
	ApplicationPage.push('        	</span>');
	ApplicationPage.push('		</div>');
	//신청일자 끝
	//결제란 시작
	ApplicationPage.push('    	<table class="datalist01" id="authorlist'+i+'">');
	ApplicationPage.push('			<colgroup>');
	ApplicationPage.push('				<col width="9%" /><!-- 결재 -->');
	ApplicationPage.push('				<col width="13%"/><!-- 담당 -->');
	ApplicationPage.push('				<col width="13%"/><!-- 팀장 -->');
	ApplicationPage.push('				<col width="13%"/><!-- 부서장 -->');
	ApplicationPage.push('				<col width="13%"/><!-- 임원II -->');
	ApplicationPage.push('				<col width="13%"/><!-- 임원I -->');
	ApplicationPage.push('				<col width="13%"/><!-- 본부장 -->');
	ApplicationPage.push('				<col width="13%"/><!-- 대표이사 -->');
	ApplicationPage.push('			</colgroup>');
	ApplicationPage.push('			<tbody>');
	ApplicationPage.push('				<tr>');
	ApplicationPage.push('					<td rowspan="2" scope="col" style="font-weight: bold;">결<br/><br/>재<br/></td>');
	ApplicationPage.push('					<td scope="col" style="font-weight: bold; padding: 3px 5px 3px 5px">담당</td>');
	ApplicationPage.push('					<td scope="col" style="font-weight: bold; padding: 3px 5px 3px 5px">팀장</td>');
	ApplicationPage.push('					<td scope="col" style="font-weight: bold; padding: 3px 5px 3px 5px">부서장</td>');
	ApplicationPage.push('					<td scope="col" style="font-weight: bold; padding: 3px 5px 3px 5px">임원Ⅱ</td>');
	ApplicationPage.push('					<td scope="col" style="font-weight: bold; padding: 3px 5px 3px 5px">임원Ⅰ</td>');
	ApplicationPage.push('					<td scope="col" style="font-weight: bold; padding: 3px 5px 3px 5px">본부장</td>');
	ApplicationPage.push('					<td scope="col" style="font-weight: bold; padding: 3px 5px 3px 5px">대표이사</td>');
	ApplicationPage.push('				</tr>');
	ApplicationPage.push('');
	ApplicationPage.push('				<tr>');
	ApplicationPage.push('					<td scope="col" style="font-weight: bold; padding: 0; height: 48px;"></td>');
	ApplicationPage.push('					<td scope="col" style="font-weight: bold; padding: 0; height: 48px;"></td>');
	ApplicationPage.push('					<td scope="col" style="font-weight: bold; padding: 0; height: 48px;"></td>');
	ApplicationPage.push('					<td scope="col" style="font-weight: bold; padding: 0; height: 48px;"></td>');
	ApplicationPage.push('					<td scope="col" style="font-weight: bold; padding: 0; height: 48px;"></td>');
	ApplicationPage.push('					<td scope="col" style="font-weight: bold; padding: 0; height: 48px;"></td>');
	ApplicationPage.push('					<td scope="col" style="font-weight: bold; padding: 0; height: 48px;"></td>');
	ApplicationPage.push('				</tr>');
	ApplicationPage.push('			</tbody>');
	ApplicationPage.push('		</table>');
	//결제란 긑
	ApplicationPage.push('	</div>');
	//그래드 해더 시작
	ApplicationPage.push('	<div id="GridHead'+i+'" style="margin-top: 5px;">');
	ApplicationPage.push(' 		<table class="datalist03" style="margin-top: 10px; margin-left: 8px;">');                     
	ApplicationPage.push('			<colgroup id="ds'+i+'HeadCol">');                                                                               
	ApplicationPage.push('				<col width="12%"/><!-- 사업부/계열사 -->');
	ApplicationPage.push('				<col width="8%" /><!-- 분류 -->');
	ApplicationPage.push('				<col width="25%"/><!-- 품명 -->');
	ApplicationPage.push('				<col width="4%" /><!-- 단위 -->');
	ApplicationPage.push('				<col width="4%" /><!-- 수량 -->');
	ApplicationPage.push('				<col width="7%" /><!-- 단위단가 -->');
	ApplicationPage.push('				<col width="8%" /><!-- 공급가 -->');
	ApplicationPage.push('				<col width="7%" /><!-- 부가세 -->');
	ApplicationPage.push('				<col width="8%" /><!-- 합계금액 -->');
	ApplicationPage.push('				<col width="4%" /><!-- 비고 -->');
	ApplicationPage.push('			</colgroup>');                                                                              
	ApplicationPage.push('			<thead>');       	                                                                     
	ApplicationPage.push('				<tr>');                                                                                    
	ApplicationPage.push('					<th scope="col">사업부/계열사</th>');                                         
	ApplicationPage.push('					<th scope="col">분류</th>');                                                             
	ApplicationPage.push('					<th scope="col">품명</th>');                                                             
	ApplicationPage.push('					<th scope="col">단위</th>');                                                               
	ApplicationPage.push('					<th scope="col">수량</th>');                                                               
	ApplicationPage.push('					<th scope="col">단위단가</th>');
	ApplicationPage.push('					<th scope="col">공급가</th>');
	ApplicationPage.push('					<th scope="col">부가세</th>');
	ApplicationPage.push('					<th scope="col">합계금액</th>');
	ApplicationPage.push('					<th scope="col">비고</th>');                                                                
	ApplicationPage.push('				</tr>');                                                                                    
	ApplicationPage.push('			</thead>');
	ApplicationPage.push('		</table>');  
	ApplicationPage.push('	</div>');
	//그리드 해더 끝
	//그래드 바디 시작
	ApplicationPage.push('	<div class="gridbox" id="PrintBody'+i+'"></div>');
	//그리드 바디 끝
//	ApplicationPage.push('</div>');
	ApplicationPage.push('	<div class="pagingClass" style="float: right; margin: 10px 10px 0 0;"></div>');
	ApplicationPage.push('	<div class="hidden-print">================================================================================================================================================</div>');
	
	$("#targetApplication")[0].innerHTML += ApplicationPage.join('');
}


function getPrintTotalReq(){ //합계표
	json = new Object();
	json.PROC_KIND  = "getPrintTotalReq";
	json.Array_data = Array_data;
	var data = JSON.stringify(json);
	$.ajax({
		type: "POST", timeout: 60000, 
//		url: sessionUSERID==""?'../htmls/getFromServerData_PUM.jsp':'../htmls/getFromServerData_W.jsp',	
		url: '../htmls/getFromServerData_PUM.jsp',
//		data: { "jsQuery": data, "PROC_KIND": json.PROC_KIND},
		data: { "jsQuery": data, "PROC_KIND": json.PROC_KIND, "USERID": sessionUSERID},
		dataType:"json",
    	complete: function() {	},
    	success: function(data) { 
    		var log = data.log;
			if(log=="noLog"){
				alert("세션이 종료되었습니다.");
				return;
			}
			
			var ORGNAM = "";

//			var QTYTOT = 0, AMTTOT = 0, VATTOT = 0, TOTTOT = 0;		//반복문 내에서의 합계
			var SAMQTY = 0, SAMAMT = 0, SAMVAT = 0, SAMTOT = 0;		//전체 사무용품 합계
			var JUNQTY = 0, JUNAMT = 0, JUNVAT = 0, JUNTOT = 0;		//전체 전산소모품 합계
			var SOGQTY = 0, SOGAMT = 0, SOGVAT = 0, SOGTOT = 0;		//전체 송장 합계
			var YOGQTY = 0, YOGAMT = 0, YOGVAT = 0, YOGTOT = 0;		//전체 용지 합계 // 18-12-26 추가
			var TOTQTY = 0, TOTAMT = 0, TOTVAT = 0, TOTALL = 0;		//전체  합계
			
    		var rsCount = data.rsCount;
    		var ReqNowCount = 0;
    		var ReqTotalCount = 0;
    		
    		var ReqTotalPage = 0;		//전체 페이지 수
			var ReqRemainCount = 0;		//남은 자료 수
			var ReqPageSize = 26;		//페이지당 최대 자료 출력 수
			var ReqPageSum = 5;			//최종합계 부분
    		
			//합계표 입력부
			$("#allTarget")[0].innerHTML += '<div id="target" style="position:relative;"></div>';
    		
    		if(rsCount == 0){
    			setTotalReq(0);
    			$("#target")[0].innerHTML = "";
    			$("#target")[0].innerHTML = "<div style='width:100%; margin-top:300px; text-align:center; font-size: 30px;'>해당 자료가 없습니다. 담당자에게 문의하세요.</div>";
    		}else{
    			ReqTotalCount = rsCount;
    			
				ReqTotalPage = Math.floor(ReqTotalCount / ReqPageSize);
				ReqRemainCount = ReqTotalCount % ReqPageSize;
				if(ReqRemainCount > 0)	ReqTotalPage += 1;
				if(ReqRemainCount > 21 || ReqRemainCount == 0)	ReqTotalPage += 1;
    			
    			ReqPage = ReqTotalPage;
    			
    			/* */
            	for(var a = 0; a < ReqTotalPage; a++){
            		setTotalReq(a);
            		resultDataArray = new Array();
        			resultDataArray.push("<table class='datalist02' style='margin-top: -2px; margin-left: 8px;'>");
                	resultDataArray.push("<colgroup>");
                	resultDataArray.push($("#ds0HeadCol").html());
                	resultDataArray.push("</colgroup>");
                	resultDataArray.push("<tbody>");
                	
                	//해당 페이지에서 e의 시작점
                	var ReqStart = 0;
                	//해당 페이지에서 e의 종료점
                	var ReqEnd = 0;
                	
                	if(ReqRemainCount > 21 || ReqRemainCount == 0){//전체 합계 부분을 데이터의 마지막 부분에 넣을 공간이 없을 경우
	                	if((a+1) == ReqTotalPage){//마지막 페이지일 경우
	                		ReqStart = 0;
	                		ReqEnd = 0;
	                	}else{
	                		ReqStart = (a * ReqPageSize);
	                		ReqEnd = (ReqTotalCount - (a * ReqPageSize))>=ReqPageSize?ReqPageSize:(ReqTotalCount - (a * ReqPageSize)); 
	                	}
                	}else{//전체 합계 부분을 데이터의 마지막 부분에 넣을 공간이 있을 경우
                		ReqStart = (a * ReqPageSize);
	                	ReqEnd = (a * ReqPageSize + ((((a+1) == ReqTotalPage) && (ReqRemainCount > 0))?ReqRemainCount:ReqPageSize));
                	}
                	
                	for(var e = ReqStart; e < ReqEnd; e++){
                		if(data.rs[e].ITMCLS == "01"){
                			resultDataArray.push("<tr style='cursor:hand'>");
                			resultDataArray.push("<td style='"+Csort+"'>"+data.rs[e].ORGNAM+"</td>");	 				 //0 사업부계열사
                			resultDataArray.push("<td style='"+Csort+"'>"+data.rs[e].ITMCNM+"</td>");	  
                			resultDataArray.push("<td style='"+Rsort+"'>"+pcomma2(data.rs[e].QTYTOT+"")+"</td>");	      
                			resultDataArray.push("<td style='"+Rsort+"'>"+pcomma2(data.rs[e].AMTTOT+"")+"</td>");	
                			resultDataArray.push("<td style='"+Rsort+"'>"+pcomma2(data.rs[e].VATTOT+"")+"</td>");	
                			resultDataArray.push("<td style='"+Rsort+"'>"+pcomma2(data.rs[e].TOTTOT+"")+"</td>");	
                			resultDataArray.push("<td style='"+Csort+"'></td>");
                			resultDataArray.push("</tr>");
                			
                			SAMQTY += parseInt(data.rs[e].QTYTOT);
                			SAMAMT += parseInt(data.rs[e].AMTTOT);
                	        SAMVAT += parseInt(data.rs[e].VATTOT);
                	        SAMTOT += parseInt(data.rs[e].TOTTOT);
                		}else if(data.rs[e].ITMCNM == "전산소모품"){
                			resultDataArray.push("<tr style='cursor:hand' id='JUNSAN'>");
                	        resultDataArray.push("<td style='"+Csort+"'>"+data.rs[e].ORGNAM+"</td>");	 				 //0 사업부계열사
                			resultDataArray.push("<td style='"+Csort+"'>"+data.rs[e].ITMCNM+"</td>");
                	        resultDataArray.push("<td style='"+Rsort+"'>"+pcomma2(data.rs[e].QTYTOT+"")+"</td>");	      
                	        resultDataArray.push("<td style='"+Rsort+"'>"+pcomma2(data.rs[e].AMTTOT+"")+"</td>");	
                	        resultDataArray.push("<td style='"+Rsort+"'>"+pcomma2(data.rs[e].VATTOT+"")+"</td>");	
                	        resultDataArray.push("<td style='"+Rsort+"'>"+pcomma2(data.rs[e].TOTTOT+"")+"</td>");
                	        resultDataArray.push("<td style='"+Csort+"'></td>");
                	        resultDataArray.push("</tr>");
                	        
                	        JUNQTY += parseInt(data.rs[e].QTYTOT);
                	        JUNAMT += parseInt(data.rs[e].AMTTOT);
                	        JUNVAT += parseInt(data.rs[e].VATTOT);
                	        JUNTOT += parseInt(data.rs[e].TOTTOT);
                		}else if(data.rs[e].ITMCLS == "03"){
                			resultDataArray.push("<tr style='cursor:hand' id='SOJANG'>");
                	        resultDataArray.push("<td style='"+Csort+"'>"+data.rs[e].ORGNAM+"</td>");	 				 //0 사업부계열사
                			resultDataArray.push("<td style='"+Csort+"'>"+data.rs[e].ITMCNM+"</td>");
                	    	resultDataArray.push("<td style='"+Rsort+"'>"+pcomma2(data.rs[e].QTYTOT+"")+"</td>");	      
                	    	resultDataArray.push("<td style='"+Rsort+"'>"+pcomma2(data.rs[e].AMTTOT+"")+"</td>");	
                	    	resultDataArray.push("<td style='"+Rsort+"'>"+pcomma2(data.rs[e].VATTOT+"")+"</td>");	
                	    	resultDataArray.push("<td style='"+Rsort+"'>"+pcomma2(data.rs[e].TOTTOT+"")+"</td>");	
                	    	resultDataArray.push("<td style='"+Csort+"'></td>");
                	    	resultDataArray.push("</tr>");
                	    	
                	    	SOGQTY += parseInt(data.rs[e].QTYTOT);
                	        SOGAMT += parseInt(data.rs[e].AMTTOT);
                	        SOGVAT += parseInt(data.rs[e].VATTOT);
                	        SOGTOT += parseInt(data.rs[e].TOTTOT);
                		}else if(data.rs[e].ITMCLS == "04"){
                			resultDataArray.push("<tr style='cursor:hand' id='YONGJI'>");
                	        resultDataArray.push("<td style='"+Csort+"'>"+data.rs[e].ORGNAM+"</td>");	 				 //0 사업부계열사
                			resultDataArray.push("<td style='"+Csort+"'>"+data.rs[e].ITMCNM+"</td>");
                	    	resultDataArray.push("<td style='"+Rsort+"'>"+pcomma2(data.rs[e].QTYTOT+"")+"</td>");	      
                	    	resultDataArray.push("<td style='"+Rsort+"'>"+pcomma2(data.rs[e].AMTTOT+"")+"</td>");	
                	    	resultDataArray.push("<td style='"+Rsort+"'>"+pcomma2(data.rs[e].VATTOT+"")+"</td>");	
                	    	resultDataArray.push("<td style='"+Rsort+"'>"+pcomma2(data.rs[e].TOTTOT+"")+"</td>");	
                	    	resultDataArray.push("<td style='"+Csort+"'></td>");
                	    	resultDataArray.push("</tr>");
                	    	
                	    	YOGQTY += parseInt(data.rs[e].QTYTOT);
                	        YOGAMT += parseInt(data.rs[e].AMTTOT);
                	        YOGVAT += parseInt(data.rs[e].VATTOT);
                	        YOGTOT += parseInt(data.rs[e].TOTTOT);
                		}else if(data.rs[e].ITMCLS == "" && data.rs[e].ITMCNM == "합계"){
                			resultDataArray.push("<tr style='cursor:hand'>");
                		  	resultDataArray.push("<td style='"+Csort+" background-color: #fff'>"+data.rs[e].ORGNAM+"</td>");	 				 
                		  	resultDataArray.push("<td style='"+Csort+" background-color: #EAEAEA'>합계</td>");	            	 
                		  	resultDataArray.push("<td style='"+Rsort+" background-color: #EAEAEA'>"+pcomma2(data.rs[e].QTYTOT+"")+"</td>");	            	 
                		  	resultDataArray.push("<td style='"+Rsort+" background-color: #EAEAEA'>"+pcomma2(data.rs[e].AMTTOT+"")+"</td>");	     
                		  	resultDataArray.push("<td style='"+Rsort+" background-color: #EAEAEA'>"+pcomma2(data.rs[e].VATTOT+"")+"</td>");	     
                		  	resultDataArray.push("<td style='"+Rsort+" background-color: #EAEAEA'>"+pcomma2(data.rs[e].TOTTOT+"")+"</td>");
                		  	resultDataArray.push("<td style='"+Rsort+" background-color: #EAEAEA'></td>");
                		  	resultDataArray.push("</tr>");
                		  	
                		  	TOTQTY += parseInt(data.rs[e].QTYTOT);
                		  	TOTAMT += parseInt(data.rs[e].AMTTOT);
                		  	TOTVAT += parseInt(data.rs[e].VATTOT);
                		  	TOTALL += parseInt(data.rs[e].TOTTOT);
                		}
                	}
            		
                	//해당 페이지의 공백 시작점
                	var ReqBlankStart = 0;
                	//해당 페이지의 공백 종료점
                	var ReqBlankEnd = 0;
                	
                	if(ReqRemainCount > 21 || ReqRemainCount == 0){//전체 합계 부분을 데이터의 마지막 부분에 넣을 공간이 없을 경우
	                	if((a+1) == ReqTotalPage){//마지막 페이지일 경우
	                		ReqBlankEnd = ReqPageSize - ReqPageSum;
	                	}else{
	                		ReqBlankEnd = ReqPageSize - ( ReqEnd - (ReqPageSize * a) );
	                	}
                	}else{//전체 합계 부분을 데이터의 마지막 부분에 넣을 공간이 있을 경우
                    	ReqBlankEnd = ((((a+1) == ReqTotalPage))?(ReqPageSize - ReqRemainCount - ReqPageSum):(ReqPageSize - (ReqEnd - ReqStart)));	
                	}
                	
                	//남은 데이터의 수가 21이 넘어서 마지막페이지가 1장 추가되었을 경우 마지막 페이지의 공란 처리
    				for(var b = ReqBlankStart; b < ReqBlankEnd; b++){
    					if(b == 0 && ReqBlankCheck){
    						resultDataArray.push("<tr class='BLANK' style='border-style':none;>");	
		    				resultDataArray.push("<td colspan='7' id='BLANK'> - 이하 여백 - </td>");
		    				resultDataArray.push("</tr>");
		    				ReqBlankCheck = !ReqBlankCheck;
    					}else{
		    				resultDataArray.push("<tr class='BLANK' style='border-style':none;>");	
		    				resultDataArray.push("<td class='BLANK'></td>");
		    				resultDataArray.push("<td class='BLANK'></td>");
		    				resultDataArray.push("<td class='BLANK'></td>");
		    				resultDataArray.push("<td class='BLANK'></td>");
		    				resultDataArray.push("<td class='BLANK'></td>");
		    				resultDataArray.push("<td class='BLANK'></td>");
		    				resultDataArray.push("<td class='BLANK'></td>");
		    				resultDataArray.push("</tr>");
    					}
	    			}
                	
	    			//마지막 페이지에서 전체 합계 부분
    				if(((a+1) == ReqTotalPage)){
            			resultDataArray.push("<tr style='cursor:hand'>");
            			resultDataArray.push("<td style='"+Csort+"' rowspan='"+ReqPageSum+"'>합계</td>");
            			resultDataArray.push("<td style='"+Csort+"'>사무용품</td>");	            	 
            			resultDataArray.push("<td style='"+Rsort+"'>"+pcomma2(SAMQTY+"")+"</td>");	            	 
            			resultDataArray.push("<td style='"+Rsort+"'>"+pcomma2(SAMAMT+"")+"</td>");	            	 
            			resultDataArray.push("<td style='"+Rsort+"'>"+pcomma2(SAMVAT+"")+"</td>");
            			resultDataArray.push("<td style='"+Rsort+"'>"+pcomma2(SAMTOT+"")+"</td>");
            			resultDataArray.push("<td style='"+Rsort+"'></td>");
            			resultDataArray.push("</tr>");
            			
            			resultDataArray.push("<tr style='cursor:hand'>");
            			resultDataArray.push("<td style='"+Csort+"'>전산소모품</td>");	            	 
            			resultDataArray.push("<td style='"+Rsort+"'>"+pcomma2(JUNQTY+"")+"</td>");	            	
            			resultDataArray.push("<td style='"+Rsort+"'>"+pcomma2(JUNAMT+"")+"</td>");	            	
            			resultDataArray.push("<td style='"+Rsort+"'>"+pcomma2(JUNVAT+"")+"</td>");
            			resultDataArray.push("<td style='"+Rsort+"'>"+pcomma2(JUNTOT+"")+"</td>");
            			resultDataArray.push("<td style='"+Rsort+"'></td>");
            			resultDataArray.push("</tr>");
            			
            			resultDataArray.push("<tr style='cursor:hand'>");
            			resultDataArray.push("<td style='"+Csort+"'>송장</td>");	            	 
            			resultDataArray.push("<td style='"+Rsort+"'>"+pcomma2(SOGQTY+"")+"</td>");	            	
            			resultDataArray.push("<td style='"+Rsort+"'>"+pcomma2(SOGAMT+"")+"</td>");	            	
            			resultDataArray.push("<td style='"+Rsort+"'>"+pcomma2(SOGVAT+"")+"</td>");
            			resultDataArray.push("<td style='"+Rsort+"'>"+pcomma2(SOGTOT+"")+"</td>");
            			resultDataArray.push("<td style='"+Rsort+"'></td>");
            			resultDataArray.push("</tr>");
            			
            			resultDataArray.push("<tr style='cursor:hand'>");
            			resultDataArray.push("<td style='"+Csort+"'>용지</td>");	            	 
            			resultDataArray.push("<td style='"+Rsort+"'>"+pcomma2(YOGQTY+"")+"</td>");	            	
            			resultDataArray.push("<td style='"+Rsort+"'>"+pcomma2(YOGAMT+"")+"</td>");	            	
            			resultDataArray.push("<td style='"+Rsort+"'>"+pcomma2(YOGVAT+"")+"</td>");
            			resultDataArray.push("<td style='"+Rsort+"'>"+pcomma2(YOGTOT+"")+"</td>");
            			resultDataArray.push("<td style='"+Rsort+"'></td>");
            			resultDataArray.push("</tr>");
            			
            			resultDataArray.push("<tr style='cursor:hand' >");
            			resultDataArray.push("<td style='"+Csort+" background-color: #EAEAEA'>합계</td>");	            	
            			resultDataArray.push("<td style='"+Rsort+" background-color: #EAEAEA'>"+pcomma2(TOTQTY+"")+"</td>");	            
            			resultDataArray.push("<td style='"+Rsort+" background-color: #EAEAEA'>"+pcomma2(TOTAMT+"")+"</td>");	            	
            			resultDataArray.push("<td style='"+Rsort+" background-color: #EAEAEA'>"+pcomma2(TOTVAT+"")+"</td>");
            			resultDataArray.push("<td style='"+Rsort+" background-color: #EAEAEA'>"+pcomma2(TOTALL+"")+"</td>");
            			resultDataArray.push("<td style='"+Rsort+" background-color: #EAEAEA'></td>");
            			resultDataArray.push("</tr>");
    				}
                	
                	resultDataArray.push("</tbody>");
       				resultDataArray.push("</table>");
                	
                	$('#PrintBody'+a)[0].innerHTML = resultDataArray.join('');
            		//$("#PrintBody")의 0번째 열 병합
            		$('#PrintBody'+a).rowspan(0);
            	}
    		}
//    		
//    		$('#PrintBody'+0)[0].innerHTML = resultDataArray.join('');
//    		//$("#PrintBody")의 0번째 열 병합
//    		$('#PrintBody'+0).rowspan(0);
    		
    		getPrintApplication();
    	},
    	error: function(xhr, textStatus, errorThrown) {
			alert('An error occurred: ' + ( errorThrown ? errorThrown :xhr.status ));
    	}
    });
	
}

function getPrintApplication(){ //신청내역서
	json = new Object();
	json.PROC_KIND  = "getPrintReq";
	json.Array_data = Array_data;
	var data = JSON.stringify(json);
	
	$.ajax({
		type: "POST", timeout: 60000, 
//		url: sessionUSERID==""?'../htmls/getFromServerData_PUM.jsp':'../htmls/getFromServerData_W.jsp',
		url: '../htmls/getFromServerData_PUM.jsp',
		data: { "jsQuery": data, "PROC_KIND": json.PROC_KIND, "USERID": sessionUSERID},
		dataType:"json",
    	complete: function() {	},
    	success: function(data) { 
    		var log = data.log;
			if(log=="noLog"){
				alert("세션이 종료되었습니다.");
				return;
			}
			
			var TOTQTY = 0, TOTDAN = 0, TOTAMT = 0, TOTVAT = 0, TOTTOT = 0;
			
			var AppTotalCount = data.rsCount;	//전체 자료 수
			var AppRemainCount = 0;		//마지막 페이지 자료 수
			var AppTotalPage = 0;		//전체 페이지 수
			var AppPageSize = 26;		//페이지당 자료 출력 수
    		
			AppTotalPage = Math.floor(AppTotalCount / AppPageSize);
			AppRemainCount = AppTotalCount % AppPageSize;
			if(AppRemainCount > 0) AppTotalPage += 1;
			
			AppPage = AppTotalPage;
			
			//신청내역서 입력부
			$("#allTarget")[0].innerHTML += '<div id="targetApplication" style="position:relative;"></div>';
    		
    		if(AppTotalCount == 0){
    			setApplication(ReqPage);
    			$("#PrintBody"+ReqPage)[0].innerHTML = "<div style='width:100%; margin-top:300px; text-align:center; font-size: 30px;'>해당 자료가 없습니다. 담당자에게 문의하세요.</div>";
    		}else{
    			//페이지 수가 2 이상일 때,
    			for(var a = ReqPage; a < AppTotalPage + ReqPage; a++){
    				setApplication(a);
    				
        			resultDataArray = new Array();
        			resultDataArray.push("<table class='datalist03' style='margin-top: -2px; margin-left: 8px;'>");
                	resultDataArray.push("<colgroup>");
                	resultDataArray.push($("#ds"+ReqPage+"HeadCol").html());
                	resultDataArray.push("</colgroup>");
                	resultDataArray.push("<tbody>");
                	
                	//해당 페이지에서 e의 시작점
                	var AppStart = 0;
                	//해당 페이지에서 e의 종료점
                	var AppEnd = 0;
                	
                	AppStart = ((a-ReqPage) * AppPageSize);
                	AppEnd = ((a-ReqPage) * AppPageSize + ((((a+1) == (AppTotalPage+ReqPage)) && (AppRemainCount > 0))?AppRemainCount:AppPageSize));
                	
                	for(var e = AppStart; e < AppEnd; e++){
                		resultDataArray.push("<tr style='cursor:hand'>");
    	    			if(data.rs[e].DIVNAM.length >= 9){
    	    				resultDataArray.push("<td style='"+Csort+"'><font style='font-size:10px;'>"+data.rs[e].DIVNAM+"</font><br/>"+data.rs[e].ORGNAM+"</td>");	 				 //0 사업부계열사
    	    			}else{
    	    				resultDataArray.push("<td style='"+Csort+"'>"+data.rs[e].DIVNAM+"<br/>"+data.rs[e].ORGNAM+"</td>");	 				 //0 사업부계열사
    	    			}
    	    			resultDataArray.push("<td style='"+Csort+"'>"+data.rs[e].ITMCNM+"</td>");
    	    			if(data.rs[e].ITMNAM.length >= 25){
    	    				resultDataArray.push("<td style='"+Lsort+"'><font style='font-size:10px;'>"+data.rs[e].ITMNAM+"</font></td>");
    	    			}else{
    	    				resultDataArray.push("<td style='"+Lsort+"'>"+data.rs[e].ITMNAM+"</td>");
    	    			}
    	    			resultDataArray.push("<td style='"+Csort+"'>"+data.rs[e].ITMDNM+"</td>");
    	    			resultDataArray.push("<td style='"+Rsort+"'>"+pcomma2(data.rs[e].REQQTY)+"</td>");
    	    			resultDataArray.push("<td style='"+Rsort+"'>"+pcomma2(data.rs[e].REQDAN)+"</td>");	      
    	    			resultDataArray.push("<td style='"+Rsort+"'>"+pcomma2(data.rs[e].REQAMT)+"</td>");	
    	    			resultDataArray.push("<td style='"+Rsort+"'>"+pcomma2(data.rs[e].REQVAT)+"</td>");	
    	    			resultDataArray.push("<td style='"+Rsort+"'>"+pcomma2(data.rs[e].REQTOT)+"</td>");
    	    			resultDataArray.push("<td style='"+Csort+"'></td>");
    	    			resultDataArray.push("</tr>");
    	    			
    	    			TOTQTY += parseInt(data.rs[e].REQQTY);
    	    			TOTDAN += parseInt(data.rs[e].REQDAN);
    	    			TOTAMT += parseInt(data.rs[e].REQAMT);
    	    			TOTVAT += parseInt(data.rs[e].REQVAT);
    	    			TOTTOT += parseInt(data.rs[e].REQTOT);
                	}
                	var AppBlankStart = 0;
                	var AppBlankEnd = AppPageSize - AppRemainCount;
       				if( ((a+1) == (AppTotalPage+ReqPage)) && (AppRemainCount > 0) ){
       					//빈칸 넣는 부분
    	    			for(var b = AppBlankStart; b < AppBlankEnd; b++){ //추가한부분
    	    				if(b == 0 && AppBlankCheck){
    	    					resultDataArray.push("<tr class='BLANK'>");	
	    	    				resultDataArray.push("<td class='BLANK' colspan='10' style='border-color: #000'> - 이하 여백 - </td>");			              
	    	    				resultDataArray.push("</tr>");
	    	    				AppBlankCheck = !AppBlankCheck;
    	    				}else{
	    	    				resultDataArray.push("<tr class='BLANK'>");	
	    	    				resultDataArray.push("<td class='BLANK' style='border-color: #000'></td>");			              
	    	    				resultDataArray.push("<td class='BLANK' style='border-color: #000'></td>");
	    	    				resultDataArray.push("<td class='BLANK' style='border-color: #000'></td>");
	    	    				resultDataArray.push("<td class='BLANK' style='border-color: #000'></td>");			              
	    	    				resultDataArray.push("<td class='BLANK' style='border-color: #000'></td>");			              
	    	    				resultDataArray.push("<td class='BLANK' style='border-color: #000'></td>");
	    	    				resultDataArray.push("<td class='BLANK' style='border-color: #000'></td>");
	    	    				resultDataArray.push("<td class='BLANK' style='border-color: #000'></td>");
	    	    				resultDataArray.push("<td class='BLANK' style='border-color: #000'></td>");
	    	    				resultDataArray.push("<td class='BLANK' style='border-color: #000'></td>");
	    	    				resultDataArray.push("</tr>");
    	    				}
    	    				
    	    				if((b+1) == AppBlankEnd){
    	    					//신청내역서 마지막장에 합계 추가해주는 부분
    	    					resultDataArray.push("<tr class='BLANK'>");	
    	       					resultDataArray.push("<td style='"+Csort+" background-color: #EAEAEA;'>합계</td>");				              
    	       					resultDataArray.push("<td style='"+Csort+" background-color: #EAEAEA;'></td>");		
    	       					resultDataArray.push("<td style='"+Lsort+" background-color: #EAEAEA;'></td>");		
    	       					resultDataArray.push("<td style='"+Csort+" background-color: #EAEAEA;'></td>");			              
//    	       					resultDataArray.push("<td style='"+Rsort+" background-color: #EAEAEA;'>"+pcomma2(TOTQTY+"")+"</td>");		            
//    	       					resultDataArray.push("<td style='"+Rsort+" background-color: #EAEAEA;'>"+pcomma2(TOTDAN+"")+"</td>");		
    	       					resultDataArray.push("<td style='"+Rsort+" background-color: #EAEAEA;'></td>");		            
    	       					resultDataArray.push("<td style='"+Rsort+" background-color: #EAEAEA;'></td>");
    	       					resultDataArray.push("<td style='"+Rsort+" background-color: #EAEAEA;'>"+pcomma2(TOTAMT+"")+"</td>");		
    	       					resultDataArray.push("<td style='"+Rsort+" background-color: #EAEAEA;'>"+pcomma2(TOTVAT+"")+"</td>");		
    	       					resultDataArray.push("<td style='"+Rsort+" background-color: #EAEAEA;'>"+pcomma2(TOTTOT+"")+"</td>");		
    	       					resultDataArray.push("<td style='"+Csort+" background-color: #EAEAEA;'></td>");		
    	       					resultDataArray.push("</tr>");
    	    				}
    	    				
    	    			}
       				}
       				
       				resultDataArray.push("</tbody>");
       				resultDataArray.push("</table>");
       				
       				$("#PrintBody"+a)[0].innerHTML = resultDataArray.join('');
       				//$("#PrintBody"+a)의 0번째 열 병합
       	    		$("#PrintBody"+a).rowspan(0);
    			}
    		}
    		
    		goApplyOption();
    		if($("#sPRINTC").val() == "N"){//품의서 첨부자료용 프린트 안하고 결제라인 안보이게
    			$(".datalist01").css({'display':'none'});
    		}else if($("#sPRINTC").val() == "P"){//결제라인 포함 신청내역서 추가 - 2019-12-30
    			json = new Object();
    			json.PROC_KIND = "customer_PUMAPR_ApprovalLine";
    			json.SAUPNO = $("#sPUMDIV").val();
    			json.VSTSEQ = $("#sPUMSEQ").val();
    			var data = JSON.stringify(json);
    			$.ajax({
   				type: "POST", timeout: 60000, 
    				url: '../htmls/getFromServerData_W.jsp',
    				data: { "jsQuery": data },
    				dataType:"json",
    		    	complete: function() {	},
    		    	success: function(data) { 
    		    		console.log(data);
    		    		var rescod = data.rescod;
    		    		var resmsg = data.resmsg;
    		    		if(rescod){
    		    			if(data != null && data != "" && data.rs != undefined){
    		    				var trs = $(".datalist01").find("tr:eq(1)");
    		    				var fin = true;
    		    				var DIVUSR = "";
    		    				var APRTXT = "";
        		    			for(var a = 0, a_len = trs.length; a < a_len; a++){
        		    				fin = true;
        		    				var tds = $(trs[a]).find("td");
        		    				$.each(data.rs, function(index, entry){
        		    					APRTXT = "";
        		    					if(entry.APRSTS == "DNY" && entry.APRUSR != ""){
        		    						APRTXT = "<font style=''>반&nbsp;&nbsp;려</font>";
        		    					}else if(entry.APRSTS == "REG" && entry.APRUSR != ""){
        		    						APRTXT = "<font style=''>미&nbsp;&nbsp;결</font>";
        		    					}else if(entry.APRSTS == "APP" && entry.APRUSR != ""){//역순으로 넣어야 정상적으로 들어감.
        		    						APRTXT = "<img src='http://118.38.12.14/CFMS/user_upload/"+entry.APRUSR+".jpg' style='max-width: 100%; max-height: 100%;'>";
        		    					}
        		    					
        		    					if(entry.APRDIG == "Y"){//전결
        		    						tds[6].innerHTML = APRTXT;//대표이사 자리에 넣기
        		    					}else {
        		    						tds[6-index].innerHTML = APRTXT;
        		    					}
        		    				});
        		    			}
    		    			}
    		    		}
    		    	}
    			});
    		}else{
    			goPrintPreview();
	    		close(); //프린트 인쇄 화면 종료시 자동으로 페이지 닫기
    		}
    	},
    	error: function(xhr, textStatus, errorThrown) {
			alert('An error occurred: ' + ( errorThrown ? errorThrown :xhr.status ));
    	}
    });
}

function goApplyOption(){
	$(".PUMDAT").text($("#sPUMDAT").val()==""?moment().format('YYYY-MM-DD'):$("#sPUMDAT").val()); //신청일자 미입력시 오늘 날짜로 지정
	
	var OPTION = $("#sOPTION").val();
	if(OPTION == "T"){//합계표만
		goAuthor(0);
		goPageNumb(2);
		$("#targetApplication").addClass("hidden-print");
//		$("#targetApplication").css({'display':'none'});
	}else if(OPTION == "S"){//신청내역서만
		goAuthor(1);
		goPageNumb(1);
		$("#target").addClass("hidden-print");
		$("#PrintHead"+ReqPage).css({'page-break-before':'auto'});
	}else if(OPTION == "A"){//합계표 + 신청내역서 모두
		goAuthor(0);
		goPageNumb(0);
		$("#authorList"+ReqPage).css({"visibility":"hidden"});
	}
	if($("#sOPTION").val()=="S"){//신청내역서만 출력
		$("#target").css({'display':'none'});
	}else if($("#sOPTION").val()=="T"){//합계표만 출력
		$("#targetApplication").css({'display':'none'});
	}
}

function goPageNumb(z){ //페이지 넘버링
	var pagingClass = $(".pagingClass"); 
//	console.log("length : " + pagingClass.length);
	$.each(pagingClass, function(i, e){
		//z == 0 > 전체  // z == 1 > 신청내역서 // z == 2 > 합계표 
		$(this).text((z!=1?(i+1):(i+1-ReqPage)) + " / " + ( (z==0)?(pagingClass.length-z):((z==1)?AppPage:ReqPage)) );
	});
}

function goAuthor(z){ //결제경로 유무 지정
	var datalist01 = $(".datalist01"); //결제경로
	$.each(datalist01, function(i, e){ 
//		console.log(e);
		if(i != z) $(e).css({'visibility':'hidden'}); 
	});
}

function goPrintPreview(){
	var browser = navigator.userAgent.toLowerCase();
	
	if ( -1 != browser.indexOf('chrome') ){
		window.print();
	}else if ( -1 != browser.indexOf('trident') ){
       try{
	        //참고로 IE 5.5 이상에서만 동작함
	
	        //웹 브라우저 컨트롤 생성
	        var webBrowser = '<OBJECT ID="previewWeb" WIDTH=0 HEIGHT=0 margin=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
	
	        //웹 페이지에 객체 삽입
	        document.body.insertAdjacentHTML('beforeEnd', webBrowser);
	        
	
	        //ExexWB 메쏘드 실행 (7 : 미리보기 , 8 : 페이지 설정 , 6 : 인쇄하기(대화상자))
	        previewWeb.ExecWB(7, 1);
	
	        //객체 해제
	        previewWeb.outerHTML = "";
       }catch (e) {
            alert("   1. 도구 > 인터넷 옵션 > 보안 탭 > 신뢰할 수 있는 사이트 선택\n   2. 사이트 버튼 클릭\n   3. [ 이 영역에 있는 모든 사이트에 대해 서버 검증(Https:) 필요 ] 체크 해제\n   4. 사이트 추가 후 닫기\n   5. 사용자 지정 수준 클릭\n   6. [ 스크립팅하기 안전하지 않은 것으로 표시된 ActiveX 컨트롤 초기화 및 스크립팅 ] (사용)으로 체크\n\n※ 위 설정은 프린트 기능을 사용하기 위함임");
       }
	}
}