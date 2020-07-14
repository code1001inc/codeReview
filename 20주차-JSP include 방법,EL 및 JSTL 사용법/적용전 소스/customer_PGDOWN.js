var window_width  = parseInt($(window).width()); 
var window_height = parseInt($(window).height());

var detailDir = "../htmls/detail.jsp?PAGNAM=";

var MODEGB = "Tel";
var sQRYCOD = "";
var fadeGbn = true;

//팝업 전역변수
$(document).ready(function () {
	if(window_width > 1024){		// pc화면
		MODEGB = "PC";
	}else if(window_width <= 960){	// 스마트폰 화면
		MODEGB = "MOB";
	}else{
	}

	//조회 버튼
	$("#Btn_Detail_Search").click(function(){
		gosel();
	});
	
	$(window).resize(function() {
		pageSize();
	});
	
	pageSize();
	
	Key_option();
	
	goListSelect(null);
	gosel();	
});

function Key_option(){
	
}

function gosel(){
	init(1);
	
	try{
		var json	 = new Object();
		json.PROC_KIND  = "customer_PGDOWN_Select";
		json.PGMCOD = "customer_PGDOWN.jsp";  
		json.PGMNAM = "설치프로그램 다운로드";
		var data =  JSON.stringify(json);
		
		//processDiv();
		ajaxCall(data, 'sel');		
	}catch(e){
		//alertCatchMsg(e);
	}finally{
	}
}

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
		ajaxCall(data, 'update');		
	}catch(e){
		//alertCatchMsg(e);
	}finally{
	}
}

function goListSelect(data){
	console.log(data);
	var pgmLeftListDiv = $("#pgmLeftListDiv");
	
	var rd = [];
	pgmLeftListDiv.hide();
	rd.push('<table class="viewContentTable01" id="viewContentTable01" style="">');
	if(sessionUSERID == 'ADMIN')
		rd.push(	'<colgroup><col width="3%"/><col width="13%"/><col width="17%"/><col width="11%"/><col width="5%"/></colgroup>');
	else
		rd.push(	'<colgroup><col width="3%"/><col width="13%"/><col width="22%"/><col width="11%"/></colgroup>');
	rd.push(	'<tbody>');
	rd.push(		'<tr>');
	rd.push(			'<th>SEQ</th>');
	rd.push(			'<th>프로그램명</th>');
	rd.push(			'<th>프로그램설명</th>');
	rd.push(			'<th>다운로드</th>');
	if(sessionUSERID == 'ADMIN')
		rd.push(			'<th>사용구분</th>');
	rd.push(		'</tr>');
	//내용
	if(data != null && data.rs !== undefined){
		var tempSEQ = 1;
		$.each(data.rs, function(index, entry){
			if(sessionUSERID == 'ADMIN' || entry.DSPGBN == 'Y'){
				rd.push(		'<tr>');
				rd.push(			'<td>'+(tempSEQ++)+'</td>');
				rd.push(			'<td style="text-align: left;">'+entry.PGMNAM+'</td>');
				rd.push(			'<td style="text-align: left;">'+entry.PGHELP+'</td>');
				rd.push(			'<td>');
				//32bit
				if(entry.PBIT32 != ""){
					var BIT32_TITLE = (entry.PBIT64 == "") ? "Down" : "32Bit Down"; 
					rd.push(				'<button class="PGM_DOWN" id="" value="'+entry.PBIT32+'" style="box-sizing: border-box; cursor: pointer; margin: 2px;">'+BIT32_TITLE+'</button>');
				}
				//64bit
				if(entry.PBIT64 != ""){
					rd.push(				'<button class="PGM_DOWN" id="" value="'+entry.PBIT64+'" style="box-sizing: border-box; cursor: pointer; margin: 2px;">64Bit Down</button>');
				}
				rd.push(			'</td>');
				if(sessionUSERID == 'ADMIN'){
					if(entry.DSPGBN == 'Y')
//						rd.push(			'<td><input type="checkbox" id="DSPGBN'+entry.SEQNUM+'" style="width:15px; height:15px;" value="Y" checked /></td>');
						rd.push(			'<td><button class="DSP_CHECK" id="DSPGBN'+entry.SEQNUM+'" style="background:blue; color:white; width:62px;">사용</button></td>');
					else
//						rd.push(			'<td><input type="checkbox" id="DSPGBN'+entry.SEQNUM+'" style="width:15px; height:15px;" value="" /></td>');
						rd.push(			'<td><button class="DSP_CHECK" id="DSPGBN'+entry.SEQNUM+'" style="background:orange; color:white;">미사용</button></td>');
				}
				rd.push(		'</tr>');
			}
		});
	}
			
	rd.push(	'</tbody>');					
	rd.push('</table>');
	pgmLeftListDiv.html(rd.join(''));
	pgmLeftListDiv.show();
	
	$(".PGM_DOWN").unbind().bind('click', function(event){
		var FILE_NAME = event.target.value;
		goDown(FILE_NAME);
//		window.open('http://118.38.12.14/CFMS/PGDOWN/' + encodeURIComponent(FILE_NAME), '_blank');
	});
	
	$(".DSP_CHECK").unbind().bind('click', function(event){
		goupdate(event.target.id);
	});
}
//검색 결과 초기화
function init(set){
	if(set == 1){
		$('#pgmLeftListDiv').html("");
	}
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
//			async: false,
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

function ajaxCall(jsonData, gubun){
	setTimeout(function() {
	$.ajax({
		type: "POST", timeout: 600000,
		url: '../htmls/getFromServerData_W.jsp',
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
						var scrollTop = $('#pgmLeftListDiv').scrollTop();
						init(1);
						gosel();
						var eGBNCHK_interval = setInterval(function(){
							if($('#pgmLeftListDiv #viewContentTable01').length>0){
								clearInterval(eGBNCHK_interval);
								eGBNCHK_interval = null;
								$('#pgmLeftListDiv').scrollTop(scrollTop);
							}
						}, 30);
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
	
//	var height_pgmLeftSchDiv	= $(".pgmLeftSchDiv").height();
//	var height_pgmLeftSchDiv01	= $(".PIFMST_pgmLeftSchDiv01").height() + parseInt($(".PIFMST_pgmLeftSchDiv01").css("padding-top").replace("px", ""));
//	var height_pgmLeftSchDiv02	= $(".PIFMST_pgmLeftSchDiv02").height() + parseInt($(".PIFMST_pgmLeftSchDiv02").css("padding-top").replace("pn", "")) + parseInt($(".PIFMST_pgmLeftSchDiv02").css("margin-bottom").replace("px", "")); 
//	var height_pgmLeftSchDiv	= height_pgmLeftSchDiv01 + height_pgmLeftSchDiv02;
	var height_pgmLeftListDiv	= height_pgmLeftContent/* - height_pgmLeftSchDiv - 9*/;
	
	var width_pgmLeftListDiv    = parseInt($("#pgmLeftListDiv").width()-1);
	
	var height_pgmContentRight	= parseInt($(window).height()) - height_pgmTitle;
	var height_pgmRightContent	= height_pgmContentRight - height_pgmContentTitle - 10;
	
	//왼쪽 컨텐츠 높이 조절 시작
	$("#pgmContentLeft").css("height", height_pgmContentLeft + "px");
	$("#pgmLeftContent").css("height", height_pgmLeftContent + "px");
//	$("#pgmLeftListDiv").jqxGrid({	height: height_pgmLeftListDiv, width: width_pgmLeftListDiv	});
	$("#pgmLeftListDiv").css("height", height_pgmLeftListDiv + "px");
//	$("#viewContentTable01").css("height", height_pgmLeftListDiv + "px");
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
//		$("#pgmLeftListDiv").jqxGrid({	height: height_pgmLeftContent - $("#pgmLeftSchDiv").height() - 1, width: width_pgmLeftListDiv	});
			
		//edit 페이지에서만 동작
		if($("#iframe_PIFMST").attr("src").match(/customer_PIFMST_edit.jsp/)){
			$("#iframe_PIFMST")[0].contentWindow.setEditorHeight(fadeGbn);			
		}
	}
	
//	$('#pgmLeftListDiv').jqxGrid({ width: $("#pgmContentLeft").width()});
}

function goLOGMSTDetail(LOGCLS, USERID, USERNM, ORGCOD, LOGDAT){
	try{
		var json	 = new Object();
		json.PROC_KIND  = "customer_LOGMST_detail_qrySel";
		json.sLOGCLS    =  LOGCLS;
		json.sUSERID    =  USERID;
		json.sUSERNM    =  USERNM;
		json.sORGCOD    =  ORGCOD;
		json.sLOGDAT    =  LOGDAT;
		json.PGMCOD = "customer_LOGMST.jsp";  
		json.PGMNAM = "사용이력조회현황";
		var data =  JSON.stringify(json);
		//processDiv();
		ajaxCall(data, 'qry');
	}catch(e){
		//alertCatchMsg(e);
	}finally{
	}
}

function openLOGMSTDetail(data){
	var logDialog = $("#logDialog");
//	var source_data = new Array();
	var qry = "";
	if(data != ""){
		$.each(data.rs, function(index, entry){
			qry = entry.QRYCOD;
		});
	}else{
		qry = "";
	}
	logDialog.val(qry);
	logDialog.load(detailDir + "LOGMST_detail").dialog({
		autoOpen: false,
		width: 763,
		height: 670,
		resizable: false,
		modal: true,
		closeOnEscape: false,
		open: function(event, ui) {
			var type = "detail";
		}
	}).parents(".ui-dialog").find(".ui-dialog-titlebar").remove();
	logDialog.dialog("open");
}