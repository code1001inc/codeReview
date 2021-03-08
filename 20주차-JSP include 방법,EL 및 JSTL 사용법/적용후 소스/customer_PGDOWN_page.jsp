<%@page import="net.sf.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%@ include file = "program_Layout.jsp" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- JSTL -->
<script type="text/javascript" src="test/customer_PGDOWN_page.js?version=${version}"></script>

<div class="pgmTitle" id="pgmTitle">
	<div class="pgmTitle_1">설치프로그램 다운로드</div>
</div>	

<div class="pgmContent" id="pgmContent" >
	<div class="pgmContentLeft" id="pgmContentLeft" style="width: 1000px; height: 600px;" >
		<div class="pgmContentTitle">
			<div class="pgmContentTit">
				프로그램 리스트
			</div>
			<div class="pgmContentBtn">
				<img src="img/btn_search.png" class="Content_Btn" id="Btn_List_Search" />
			</div>
		</div>
		<div class="pgmLeftContent" id="pgmLeftContent">
			<div class="pgmLeftSchDiv" id="pgmLeftSchDiv" style="height: 0px;">
				<div class="pgmLeftSchDiv01" >
				</div>
				<div class="pgmLeftSchDiv01" >
				</div>
			</div>
			<% 
				JSONObject result = (JSONObject)request.getAttribute("result");
				for(Object vo : result.getJSONArray("rs")){
					pageContext.setAttribute("vo", vo);
					System.out.println(vo);
				}
			%>
			
			<div class="pgmLeftListDiv" id="pgmLeftListDiv" style="width: 100%; overflow-y: auto;">
				<table class="viewContentTable01" id="viewContentTable01" style="">
					<colgroup>
						<col width="3%"/><col width="13%"/><col width="22%"/><col width="11%"/>
						<c:if test="${sessionScope.USERID == 'ADMIN'}">
							<col width="5%"/>
						</c:if>
					</colgroup>
					<tbody>
						<tr>
							<th>SEQ</th>
							<th>프로그램명</th>
							<th>프로그램설명</th>
							<th>다운로드</th>
							<c:if test="${sessionScope.USERID == 'ADMIN'}">
								<th>사용구분</th>
							</c:if>
						</tr>
						<c:forEach var="vo" items="${result.rs}" varStatus="status">
							<c:if test="${sessionScope.USERID == 'ADMIN' || vo.DSPGBN == 'Y'}">
								<tr>
									<td>${status.count}</td>
									<td>${vo.PGMNAM}</td>
									<td>${vo.PGHELP}</td>
									<td>
										<c:if test="${!empty vo.PBIT32}">
											<button class="PGM_DOWN" id="" value="${vo.PBIT32}" style="box-sizing: border-box; cursor: pointer; margin: 2px;">32Bit Down</button>
										</c:if>
										<c:if test="${!empty vo.PBIT64}">
											<button class="PGM_DOWN" id="" value="${vo.PBIT64}" style="box-sizing: border-box; cursor: pointer; margin: 2px;">64Bit Down</button>
										</c:if>
									</td>
									<c:if test="${sessionScope.USERID == 'ADMIN'}">
										<c:choose>
											<c:when test="${vo.DSPGBN == 'Y'}">
												<td><button class="DSP_CHECK" id="DSPGBN${vo.SEQNUM}" style="background:blue; color:white; width:62px;">사용</button></td>
											</c:when>
											<c:otherwise>
												<td><button class="DSP_CHECK" id="DSPGBN${vo.SEQNUM}" style="background:orange; color:white;">미사용</button></td>
											</c:otherwise>
										</c:choose>
									</c:if>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>	
	<div class="pgmContentRight" id="pgmContentRight">
		<div class="pgmContentTitle">				
			<div class="pgmContentTit">
				특기사항
			</div>
			<div class="pgmContentBtn">
			</div>
		</div>
		<div class="pgmRightContent" id="pgmRightContent" style="overflow:hidden;">
		  	<table class="viewContentTable01" id="viewContentTable01">
				<colgroup>
       				<col width="30%"/><col width="70%"/>
   				</colgroup>
				<tbody>
				
				</tbody>
			</table>
			<div class="pgmRightListDiv" id="pgmRightListDiv">
<!-- 				<p style="padding:0 10px; font-size: 15px; font-family: 'Nanum Gothic';">담당자 연락처는 「 메뉴 > 조직관리 > 조직관리 > 조직도 」 에서 검색하여 확인해 주시기 바랍니다.</p> -->
				<div style="position: relative; padding: 10px;">
					<!-- 1 -->
					<div style="width: 100%;">
						<font style="font-size: 16px; font-family: 'Nanum Gothic'; font-weight: 900;">1. <font style="color: #0000ff;">VPN 사용 안내</font></font>
						
						<div style="position: relative; width: 100%; padding-left: 20px; box-sizing: border-box; margin-top: 5px;">
							<div style="position: absolute; width: 130px;">
								<font style="font-size: 15px; font-family: 'Nanum Gothic';">◆ VPN 사용대상 :</font>
							</div>
							<div style="position: relative; width: calc(100% - 130px); padding-left: 130px;">
								<font style="font-size: 15px; font-family: 'Nanum Gothic';">컨테이너(gTOSS)<font style="display: inline-block; width: 25px; text-align: center;">→</font>전사용자</font><br>
								<font style="font-size: 15px; font-family: 'Nanum Gothic';">국제물류포워딩<font style="display: inline-block; width: 25px; text-align: center;">→</font>전사용자</font><br>
								<font style="font-size: 15px; font-family: 'Nanum Gothic';">천일TLS-포항<font style="display: inline-block; width: 25px; text-align: center;">→</font>전사용자</font><br>
								<font style="font-size: 15px; font-family: 'Nanum Gothic';">천일TLS-의왕<font style="display: inline-block; width: 25px; text-align: center;">→</font>회계사용자</font><br>
								<font style="font-size: 15px; font-family: 'Nanum Gothic';">천일하역<font style="display: inline-block; width: 25px; text-align: center;">→</font>전사용자</font><br>
								<font style="font-size: 15px; font-family: 'Nanum Gothic';">천일회계<font style="display: inline-block; width: 25px; text-align: center;">→</font>전사용자(타사업부 포함)</font>
								<!-- 
								<div style="position: relative; height: 34px;">
									<font style="font-size: 15px; font-family: 'Nanum Gothic';">천일회계<font style="display: inline-block; width: 25px; text-align: center;">→</font></font>
									<div style="position: relative; display: inline-block; box-sizing: border-box;">
										<font style=" font-size: 15px; font-family: 'Nanum Gothic';">전사용자</font>
										<font style=" font-size: 15px; font-family: 'Nanum Gothic';">(타사업부 포함)</font>
									</div>
								</div>
								 -->
							</div>
						</div>
						
						<div style="position: relative; width: 100%; padding-left: 20px; box-sizing: border-box; margin-top: 5px;">
							<font style="position: absolute; font-size: 15px; font-family: 'Nanum Gothic';">◆</font>
							<div style="position: relative; width: calc(100% - 15px); padding-left: 20px; box-sizing: border-box;">
								<font style="font-size: 15px; font-family: 'Nanum Gothic';">VPN 사용자는 프로그램 리스트에서 해당 프로그램을 사용자 설명서에 따라 설치한 후 프로그램 운영</font>
								<div style="position: relative; width: 100%; box-sizing: border-box;">
									<font style="position: absolute; font-size: 13px; font-family: 'Nanum Gothic'; color: #737373;">＊</font>
									<div style="position: relative; padding-left: 15px; box-sizing: border-box;">
										<font style="font-size: 13px; font-family: 'Nanum Gothic'; color: #737373;">VPN 설치 시 ID, PASSWORD는 해당 사업부 지정관리자에게 문의한 후 지정</font>
									</div>
								</div>
							</div>
						</div>
						
						<div style="position: relative; width: calc(100% - 15px); padding-left: 20px; box-sizing: border-box; margin-top: 5px;">
							<font style="font-size: 15px; font-family: 'Nanum Gothic';"> ※ IBM DB2 사용자 필수 Download 프로그램 ※</font>
							<div style="position: relative; padding-left: 20px; box-sizing: border-box;">
								<font style="font-size: 15px; font-family: 'Nanum Gothic';">ntwdblib</font><br>
								<font style="font-size: 15px; font-family: 'Nanum Gothic';">ISeries</font><br>
								<font style="font-size: 15px; font-family: 'Nanum Gothic';">ISeries-Patch</font><br>
								<font style="font-size: 15px; font-family: 'Nanum Gothic';">BdeFull</font>
							</div>
						</div>
					</div>
					<!-- 2 -->
					<div style="width: 100%; margin-top: 20px;">
						<font style="font-size: 16px; font-family: 'Nanum Gothic'; font-weight: 900;">2. 시스템 문의</font>
						<div style="position: relative; width: 100%; padding-left: 20px; box-sizing: border-box; margin-top: 5px;">
							<font style="position: absolute; font-size: 15px; font-family: 'Nanum Gothic';">◆</font>
							<div style="position: relative; width: calc(100% - 15px); padding-left: 20px; box-sizing: border-box;">
								<font style="font-size: 15px; font-family: 'Nanum Gothic';"> 천일아이엔씨에 대한 문의 시 연락처는 「 메뉴 > 조직관리 > 조직관리 > 조직도 」 에서 검색하여 확인해 주시기 바랍니다</font>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>	
</div>

<script>
	var window_width  = parseInt($(window).width()); 
	var window_height = parseInt($(window).height())

	var MODEGB = "Tel";
	var fadeGbn = true;
	
	//팝업 전역변수
	$(document).ready(function () {
		if(window_width > 1024){		// pc화면
			MODEGB = "PC";
		}else if(window_width <= 960){	// 스마트폰 화면
			MODEGB = "MOB";
		}else{
		}
	
		$(window).resize(function() {
			pageSize();
		});
		
		pageSize();
		
	});

	$(".PGM_DOWN").unbind().bind('click', function(event){
		var FILE_NAME = event.target.value;
		alert(FILE_NAME);
	//	goDown(FILE_NAME);
	//	window.open('http://118.38.12.14/CFMS/PGDOWN/' + encodeURIComponent(FILE_NAME), '_blank');
	});
	
	$(".DSP_CHECK").unbind().bind('click', function(event){
	//	alert(event.target.id);
		goupdate(event.target.id);
	});
	
	function goupdate(SEQNUM){
		try{
			var json	 = new Object();
			json.PROC_KIND  = "customer_PGDOWN_Update";
			json.SEQNUM = SEQNUM.substr(6);
			json.DSPGBN = $('#'+SEQNUM).text()=='사용'?'':'Y';
			
			json.PGMCOD = "customer_PGDOWN.jsp";  
			json.PGMNAM = "설치프로그램 다운로드";
			var data =  JSON.stringify(json);
			
			//processDiv();
			ajaxCall(data, 'update', SEQNUM);		
		}catch(e){
			//alertCatchMsg(e);
		}finally{
		}
	}
	
	function init(set){
		if(set == 1){
			$('#pgmLeftListDiv').html("");
		}
	}
	
	function ajaxCall(jsonData, gubun, SEQNUM){
		setTimeout(function() {
		$.ajax({
			type: "POST", timeout: 600000,
			url: 'htmls/getFromServerData_W.jsp',
			data: {"jsQuery":jsonData},
			dataType:"json",
			async: false,
			beforeSend: function() { },
			complete: function() {	},
			success: function(data) {
				try{
					var resultData = [];

					var rescod = data.rescod;
					var resmsg = data.resmsg;

					if(rescod=='noLog'){
						sessionLogOut(resmsg);
					}else if(rescod=='false'){
						alert(resmsg);
					}else{
						if(gubun == 'sel'){
							goListSelect(data);
						}else if(gubun == 'update'){
							console.log('good');
							console.log(data);
							console.log(SEQNUM);
							if(data.rescod == 'true'){
								if($('#'+SEQNUM).text() == '미사용'){
									$('#'+SEQNUM).text('사용').css('background', 'blue');
								}else{
									$('#'+SEQNUM).text('미사용').css('background', 'orange');
								}
							}
							/* var scrollTop = $('#pgmLeftListDiv').scrollTop();
							init(1);
							gosel();
							var eGBNCHK_interval = setInterval(function(){
								if($('#pgmLeftListDiv #viewContentTable01').length>0){
									clearInterval(eGBNCHK_interval);
									eGBNCHK_interval = null;
									$('#pgmLeftListDiv').scrollTop(scrollTop);
								}
							}, 30); */
						}
					}
				}catch(err){
					alertCatchMsg(err);
					//unProcessDiv();
				}finally{
					//unProcessDiv();
				}
			},
			error: function(xhr, textStatus, errorThrown) {
				ajaxError(xhr);
				//unProcessDiv();
			}
		});
		}, 0);
	}
	
	function goDown(FILENM){
		if(FILENM=="") return;
		
		var proc_kind 	= "PGDOWN_FILE_DOWNLOAD";
		
		setTimeout(function() {
			$.ajax({
				type: "POST", timeout: 600000, 
				url: '../htmls/fileDownLoad.jsp',
				data: { "proc_kind" : proc_kind , 
					    "FILENM"    : FILENM    },
				dataType:"json",
//				async: false,
				beforeSend: function() {  },
				complete: function() {  },
				success: function(data) {   
					try{
						var rescod = data.rescod;
						var resmsg = data.resmsg;		
						
						if(rescod=='noLog'){
							sessionLogOut(resmsg);
						}else if(rescod=='false'){
							alert(resmsg);
						}else{
							if(MODEGB == "PC"){ 
								window.location.href = "../htmls/download.jsp?file_name=" + encodeURIComponent(FILENM);
							}else{ 
								//location.replace('../userfiles/' + FILENM);
								window.open('118.38.12.14/CFMS/WebContent/PGDOWN/' + encodeURIComponent(FILENM), '_blank');
							}
						}			
					}catch(err){
						alertCatchMsg(err);
						//unProcessDiv();
					}finally{
						//unProcessDiv();
					}
						
				},
				error: function(xhr, textStatus, errorThrown) {
					console.log(xhr);
					console.log(textStatus);
					console.log(errorThrown);
					ajaxError(xhr);
					//unProcessDiv();
				}
				
			});	
		}, 0);		
	}
	
	function pageSize(){
		var scrollSize = 0;
		var width_pgmContentLeft = 0;
		var margin_pgmContentRight = 0;
		
		if(fadeGbn==true)	{	width_pgmContentLeft = 1060;	margin_pgmContentRight = 2; 	}
		else				{	width_pgmContentLeft = 0;	margin_pgmContentRight = 0; 	}
		
		if(window_width > 1024){		// pc화면
			if(fadeGbn==true)	{	width_pgmContentLeft = 1060;	margin_pgmContentRight = 2; 	}
			else				{	width_pgmContentLeft = 0;	margin_pgmContentRight = 0; 	}
		}
		
		var height_pgmTitle			= $(".pgmTitle").height();
		var height_pgmContentLeft	= parseInt($(window).height()) - height_pgmTitle;
		
		var height_pgmContentTitle	= $(".pgmContentTitle").height();   
		var height_pgmLeftContent	= height_pgmContentLeft - height_pgmContentTitle - 10;
		
//		var height_pgmLeftSchDiv	= $(".pgmLeftSchDiv").height();
//		var height_pgmLeftSchDiv01	= $(".PIFMST_pgmLeftSchDiv01").height() + parseInt($(".PIFMST_pgmLeftSchDiv01").css("padding-top").replace("px", ""));
//		var height_pgmLeftSchDiv02	= $(".PIFMST_pgmLeftSchDiv02").height() + parseInt($(".PIFMST_pgmLeftSchDiv02").css("padding-top").replace("pn", "")) + parseInt($(".PIFMST_pgmLeftSchDiv02").css("margin-bottom").replace("px", "")); 
//		var height_pgmLeftSchDiv	= height_pgmLeftSchDiv01 + height_pgmLeftSchDiv02;
		var height_pgmLeftListDiv	= height_pgmLeftContent/* - height_pgmLeftSchDiv - 9*/;
		
		var width_pgmLeftListDiv    = parseInt($("#pgmLeftListDiv").width()-1);
		
		var height_pgmContentRight	= parseInt($(window).height()) - height_pgmTitle;
		var height_pgmRightContent	= height_pgmContentRight - height_pgmContentTitle - 10;
		
		//왼쪽 컨텐츠 높이 조절 시작
		$("#pgmContentLeft").css("height", height_pgmContentLeft + "px");
		$("#pgmLeftContent").css("height", height_pgmLeftContent + "px");
//		$("#pgmLeftListDiv").jqxGrid({	height: height_pgmLeftListDiv, width: width_pgmLeftListDiv	});
		$("#pgmLeftListDiv").css("height", height_pgmLeftListDiv + "px");
//		$("#viewContentTable01").css("height", height_pgmLeftListDiv + "px");
		//왼쪽 컨텐츠 높이 조절 종료
		
		//왼쪽 컨텐츠 넓이 조절
		$("#pgmContentLeft").css("width", width_pgmContentLeft + "px");
		//왼쪽 컨텐츠 넓이 조절 종료
		
		//오른쪽 컨텐츠 넓이 조절
		$("#pgmContentRight").css("width", (parseInt($(window).width()) - width_pgmContentLeft - margin_pgmContentRight - scrollSize) + "px");	//가로 컨텐츠 넓이	
		//오른쪽 컨텐츠 넓이 조절 종료
		$("#pgmContentRight").css("margin-left", (parseInt(margin_pgmContentRight)) + "px");	
		
		//오른쪽 컨텐츠 높이 조절 시작	
		$("#pgmContentRight").css("height", height_pgmContentRight + "px");
		$("#pgmRightContent").css("height", height_pgmRightContent + "px");
		//오른쪽 컨텐츠 높이 조절 종료
		
		if(window_width > 1024){		// pc화면
			$(".PIFMST_pgmLeftSchDiv01").css({"width":"50%"});
			$(".PIFMST_pgmLeftSchDiv02").css({"width":"50%"});
			//$(".PIFMST_pgmLeftSchTxt_write02").css({"width":"740px"});
			$("#PIFMST_noticediv").css({"line-height":"38px"});
			
		}else if(window_width < 1024 && window_width <= 960){	// 스마트폰 화면
			$("#pgmContentLeft").css("width", width_pgmContentLeft + "px");
			$("#pgmLeftContent").css("width", "100%");
			$("#pgmLeftListDiv").css("width", "100%");
			$("#pgmContentRight").css("width", "50.6%");
			$("#pgmRightContent").css("width", "97.6%");
		}else{
			$("#PIFMST_noticefont").css({"display":"block"});
			$("#PIFMST_pgmLeftSchDiv02").css({"padding":"0"});
			$("#pgmLeftSchDiv").css("height", ( height_pgmLeftSchDiv01 * 2) + (height_pgmLeftSchDiv02*2) -7 + "px");
//			$("#pgmLeftListDiv").jqxGrid({	height: height_pgmLeftContent - $("#pgmLeftSchDiv").height() - 1, width: width_pgmLeftListDiv	});
				
			//edit 페이지에서만 동작
			if($("#iframe_PIFMST").attr("src").match(/customer_PIFMST_edit.jsp/)){
				$("#iframe_PIFMST")[0].contentWindow.setEditorHeight(fadeGbn);			
			}
		}
		
//		$('#pgmLeftListDiv').jqxGrid({ width: $("#pgmContentLeft").width()});
	}
</script>