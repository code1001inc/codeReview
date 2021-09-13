let receive_data = '';
let RST_arr = [ ];

var selectRow1 = -1;
var selectCol1 = -1;
var source1;
var dataAdapter1;

var ODDGBN = '';
var tabsID = 'H_selESTMAE';
var kuk_session = ["07", "08", "09", "10", "11", "12", "01", "02", "03", "04", "05", "06" , "TOTAL"];
$(document).ready(function(){
	selPgmLstCheck(tabsID);
	$("#searchBtn").click(function(){ 
		goSelect();
	});
	
	$("#resetBtn").click(function(){
		dgridReset1();
	});
	
	$("#saveBtn").click(function()  { goSave();   });
	$("#deleteBtn").click(function(){ goDelete();});
	$("#closeBtn").click(function() { parent.tabs_remove();});
	$('#excelBtn').click(function() {goExcel('jqxgrid','추정매출_조회');});
	
	makeGridJQ();
	BindUserFunc();
	
	$('#ODDGBN').on( 'change' , function(){  goAREACDList('SCHGBN' , 'checkbox' , $("#JRADIO") , $('#ODDGBN') , $('#ODDGBN2') ); });
	$('#ODDGBN2').on( 'change' , function(){ goAREACDList('SCHGBN' , 'checkbox' , $("#JRADIO") , $('#ODDGBN') , $('#ODDGBN2') ); });
	
	
	
	
	/* ==================================================================================== */
	/* ==================== 테스트 영역 =================================================== */
	/* ==================================================================================== */
	
	$("#select_test").click(function(){    
		console.log(' select_test 실행 ');
		
		// 출처가 실적매출인 월 목록 조회 
		var json2	 = {}
		json2.USERID  = sessionUSERID;
		json2.USERNM  = sessionUSERNM;
		json2.PROC_KIND  = "RST_MONTH_LIST";
		json2.ODDGBN  = '45S';
		let data2 =  { 'jsQuery' : JSON.stringify(json2)};
		let url2 = "/kdbp/htmls/H_data.jsp";
		$.post( url2 , data2 , function(data){
			let result = JSON.parse(data).rs;
			let temp_arr = [];
			result.forEach(function(element){
				temp_arr.push(element.MAEMON);
			});			
			console.log(temp_arr);
			RST_arr = temp_arr;
		});
		
		
		var json	 = new Object();
		json.USERID  = sessionUSERID;
		json.USERNM  = sessionUSERNM;
		json.PROC_KIND  = "ESTMAESelect";
		json.ODDGBN  = '45S';
		json.BUSNAM  = '';
		json.SCHGBN = "'평택지점','언양지점'";
		
		var data =  JSON.stringify(json);
		wait_swal(ajaxCall, data, 'sel');
		
		
		$('#jqxgrid').jqxGrid('selectrow', 1);
		$('#jqxgrid').jqxGrid('selectrow', 2);
		$('#jqxgrid').jqxGrid('selectrow', 3);
		$('#jqxgrid').jqxGrid('selectrow', 4);
		
	});
	
	$("#excel_test").click(function(){    
		console.log(' excel_test 실행 ');
		let url = "/kdbp/html/Test_Code/Test.jsp";
		$.get(url , function(data){
			var json = JSON.parse(data);
			console.log(json.rs);
			console.log(make_display_data( json.rs ));
			receive_data = json.rs;
			dataFilterArray = make_display_data(receive_data);
			source1.localdata = dataFilterArray;
		    dataAdapter1.dataBind();
		    resizeGridJQ("#jqxgrid", 200);
		    $('#jqxWidget').show();
		});
	});
	
	$("#insert_test").click(function(){    
		console.log(' insert_test 실행 ');
		
		var grid = $('#jqxgrid').jqxGrid('getrows');
		if( grid.find( isErro ) ){
			warning_swal("수량이나 금액만 입력된 데이터가 있습니다.");
			return; 
		};
		function isErro( element ){
			return ( element.ERRO )?? false;
		};
		
		var rows = receive_data;
		if(rows.length == 0){
			warning_swal("저장하실 항목이 없습니다.");
			return;
		}
		var json	 = new Object();
		json.USERID  = sessionUSERID;
		json.ODDGBN1  = $('#ODDGBN').val();
		json.rows  = rows;
		json.PROC_KIND  = "ESTMAEInsert";
		var data =  JSON.stringify(json);
		wait_swal(ajaxCall, data, 'add');
	});
	
	$("#delete_test").click(function(){    
		console.log(' delete_test 실행 ');
		
	});
	

});




function BindUserFunc(){
	$('#ODDGBNhelp').getCODMST_NR('ST', $('#ODDGBN'), $('#ODDGBNNM') , $('ODDGBN2'), 'selOddCodList');
	$('#ODDGBNhelp2').getCODMST_NR('ST', $('#ODDGBN2'), $('#ODDGBNNM2') , $('ODDGBN2'), 'selOddCodList');
	$('#BUSGBNhelp').getCODMST_NR('ST', $('#BUSNAM'), $('#BUSGBNNM') , $('BUSNAM'), 'selBusMstList');
	$('#ACDEXThelp').getCODMST_NR('ST', $('#ACDEXT'), $('#ACDNAM') , $('REMARK'), 'selAcdMstList');
}

function makeGridJQ(){	
	//그리드 번호
	var SEQNUMCellsrenderer = function (row, columnfield, value) {return DataGridSeqNum(row, value);};
	
	//통계
	var TOTAL_Cnt = function (aggregates) { return DataGridColCount2(dataFilterArray);   };
	//소계색상
	var sumgbn = function (row, column, value, defaultHtml) {
//        var renderstring = "";
//        var entry = source1.localdata[row];
//        switch(entry.SUMSEQ){
//		case "2":
//			return 'back1';
//		case "3":
//			return 'back2';
//		}        
//        return renderstring;
    };
    
    
	var datafields = [
		{ name: 'JEPGB2', type: 'string' },
		{ name: 'ERRO', type: 'string' },
    ]; 
    var columns = [
		{
		    text: 'Seq', sortable: false, filterable: false, editable: false, pinned: true,
		    groupable: false, draggable: false, resizable: false,
		    datafield: '', columntype: 'number', width: 50, cellsalign: 'center', align: 'center',
		    cellsrenderer: SEQNUMCellsrenderer
		}, 
		{ datafield: 'JEPGB2'  ,text: '중분류'		, pinned: true, editable: false, cellclassname:sumgbn ,width: 200, cellsalign: 'left',   align: 'center', aggregatesrenderer: TOTAL_Cnt },                
		{ datafield: 'ERRO'  ,text: '에러 검증'		, pinned: true, editable: false, cellclassname:sumgbn ,width: 100, cellsalign: 'left',   align: 'center', cellsrenderer: cellsrenderer , aggregatesrenderer: TOTAL_Cnt },                
    ];
    
    
    var cellsrenderer = function (row, columnfield, value, defaulthtml, columnproperties ) {
    	
    	let result = RST_arr.find( function(element){
    		return element === columnfield
    	});
        if (result) {
            return '<span style="margin: 4px; float: ' + columnproperties.cellsalign + '; color: #0000ff;">' + value.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + '</span>';
        }
        
    }
    
    
    var cellclass = function (row, columnfield, value) {
        if (value === 0) {
            return 'red';
        }
    };

    
    
    
    var columngroups = [];
    for(var i=0; i<kuk_session.length; i++) {
  	  var AMOUNT_name = 'AMOUNT_PLN'+kuk_session[i];
  	  
  	  if( kuk_session[i] != 'TOTAL'  ){
  	  	  datafields.push({ name: 'MAEQTY'+kuk_session[i], type: 'number' });
  	  	  datafields.push({ name: 'AMOUNT'+kuk_session[i], type: 'number' });
  	  	  
  	  	  columns.push({ datafield: 'MAEQTY'+kuk_session[i]  ,text: '수량'		, editable: false, cellclassname:sumgbn ,width: 120, cellsalign: 'right',  align: 'center', cellsrenderer: cellsrenderer , cellclassname: cellclass, cellsformat: "d0", columngroup: kuk_session[i]+'AMOUNT' , aggregates: ["sum"]});
  	  	  columns.push({ datafield: 'AMOUNT'+kuk_session[i]  ,text: '금액'		, editable: false, cellclassname:sumgbn ,width: 140, cellsalign: 'right',  align: 'center', cellsrenderer: cellsrenderer , cellclassname: cellclass, cellsformat: "d0", columngroup: kuk_session[i]+'AMOUNT' , aggregates: ["sum"]});
  	  	  
  	      columngroups.push({ text: kuk_session[i]+'월' , align: 'center', name: kuk_session[i]+"AMOUNT" });
  	  }else{
  	  	  datafields.push({ name: 'MAEQTY_'+kuk_session[i], type: 'number' });
  	  	  datafields.push({ name: 'AMOUNT_'+kuk_session[i], type: 'number' });
  	  	  
  	  	  
  	  	  columns.push({ datafield: 'MAEQTY_'+kuk_session[i]  ,text: '수량'		, editable: false, cellclassname:sumgbn ,width: 120, cellsalign: 'right',  align: 'center', cellsrenderer: cellsrenderer , cellclassname: cellclass, cellsformat: "d0", columngroup: kuk_session[i]+'AMOUNT' , aggregates: ["sum"]});
  	  	  columns.push({ datafield: 'AMOUNT_'+kuk_session[i]  ,text: '금액'		, editable: false, cellclassname:sumgbn ,width: 140, cellsalign: 'right',  align: 'center', cellsrenderer: cellsrenderer , cellclassname: cellclass, cellsformat: "d0", columngroup: kuk_session[i]+'AMOUNT' , aggregates: ["sum"]});
  	         
  	  	  
  	      columngroups.push({ text: kuk_session[i] , align: 'center', name: kuk_session[i]+"AMOUNT" });
  	  }

  	  
    }
    
	source1 =
    {
        datatype: "json",
        datafields: datafields, 
        localdata: dataFilterArray
    };

	dataAdapter1 = new $.jqx.dataAdapter(source1);
    $("#jqxgrid").jqxGrid(
    {
    	width: '99%',
    	height: '100%',
        source: dataAdapter1,
        columnsresize: true,
        sortable: true,
        theme: 'light',
        filterable: true,
        showfilterrow: false,
        showstatusbar: true,
        statusbarheight: 30,
        showaggregates: true,
        editable: true,
        columns: columns,
        columngroups: columngroups
    });
}



function dgridReset1(){
	$('#jqxgrid').jqxGrid('clearselection');
	$('#div_search1').find('input[type=text]').val(''); 
	$('#div_search1').find('input[type=checkbox]').prop("checked",false);
	$('#div_search1').find('select option:eq(0)').prop("selected", true);
	$('#JRADIO').html('<div style="color:orange;" >※ 전체지점 조회</div>');
	receive_data = '';
	RST_arr = [];
	selectRow1 = -1;
	dataFilterArray = [];
	source1.localdata = dataFilterArray;
    dataAdapter1.dataBind();
}

function goSelect(){
	
	if( $('#ODDGBN').val() == "" ){
		warning_swal(" 기수구분을 선택해야 합니다.",'#ODDGBN');
		return;
	}

	//지점 체크값
	var SCHGBN = '';
	$('input:checkbox[name="SCHGBN"]').each(function() {
	      if(this.checked){
	    	  SCHGBN = SCHGBN + "'"+ this.value + "'"+",";
	      }
	});
	
	
	// 출처가 실적매출인 월 목록 조회 
	var json2	 = {}
	json2.USERID  = sessionUSERID;
	json2.USERNM  = sessionUSERNM;
	json2.PROC_KIND  = "RST_MONTH_LIST";
	json2.ODDGBN  = $('#ODDGBN').val();
	let data2 =  { 'jsQuery' : JSON.stringify(json2)};
	let url2 = "/kdbp/htmls/H_data.jsp";
	$.post( url2 , data2 , function(data){
		let result = JSON.parse(data).rs;
		let temp_arr = [];
		result.forEach(function(element){
			temp_arr.push(element.MAEMON);
		});			
		RST_arr = temp_arr;
	});
	
	
	
	
	SCHGBN = SCHGBN.slice(0,-1); //마지막 , 자르기
	var json	 = new Object();
	json.USERID  = sessionUSERID;
	json.USERNM  = sessionUSERNM;
	json.PROC_KIND  = "ESTMAESelect";
	json.ODDGBN  = $('#ODDGBN').val();
	json.BUSNAM  = $('#BUSNAM').val();
	json.SCHGBN  = SCHGBN;
	var data =  JSON.stringify(json);
	wait_swal(ajaxCall, data, 'sel');
	
	
}


function ajaxCall(jsonData, gubun){
	setTimeout(function() {
	$.ajax({
		type: "POST", timeout: 600000, 
		url: 'H_data.jsp',	
		data: {"jsQuery":jsonData},
		dataType:"json",
		async: false,
		beforeSend: function() {
			$("#searchBtn").attr("disabled",true); },
		complete: function() {},
		success: function(data) {   
			try{
				var rescod = data.rescod;
				var resmsg = data.resmsg;		
				if(rescod=='noLog'){
					sessionLogOut(resmsg);
				}else if(rescod=='false'){
					error_swal(resmsg);
					return;
				}else{

					if(gubun=='sel'){
					    
						dataJSON = data.rs;
						console.log(dataJSON);
						
						dataFilterArray = dataJSON;
						source1.localdata = dataFilterArray;
					    dataAdapter1.dataBind();
			    		$('#jqxgrid').jqxGrid('clearselection');
			    		
					}else{
						ok_swal(resmsg).then(function(result) {
							goSelect();
						});
					}
					setTimeout(function() { Swal.close(); }, 800);
				}					
			}catch(err){
				error_swal(err);
				$("#searchBtn").attr("disabled",false);
				return;
			}finally{
				//unProcessDiv();
				$("#searchBtn").attr("disabled",false);
			}
		},
		error: function(xhr, textStatus, errorThrown) {
			error_swal(xhr);
			return;
		}
	});	
	}, 0);		
}  


function goSave(){
	
	if( receive_data==='' ){
		warning_swal("엑셀 업로드한 데이터가 아니면 저장할 수 없습니다.");
		return; 
	}
	
	var grid = $('#jqxgrid').jqxGrid('getrows');
	if( grid.find( isErro ) ){
		warning_swal("수량이나 금액만 입력된 데이터가 있습니다.");
		return; 
	};
	
	function isErro( element ){
		return ( element.ERRO )?? false;
	};
	
	
	
	var rows = receive_data;
	if(rows.length == 0){
		warning_swal("저장하실 항목이 없습니다.");
		return;
	}

	var json	 = new Object();
	json.USERID  = sessionUSERID;
	json.ODDGBN1  = $('#ODDGBN').val();
	json.rows  = rows;
	json.PROC_KIND  = "ESTMAEInsert";
	
	var data =  JSON.stringify(json);
	wait_swal(ajaxCall, data, 'add');
	receive_data = '';
}


function goDelete(){
	try{
		var ODDGBN_input =  '<br><input name="ODDGBN3"  type="text" class="input7" id="ODDGBN3" style="width: 46px;" value=""  />'
			ODDGBN_input += '<input name="ODDGBNNM3"  type="text" class="input7r" id="ODDGBNNM3" style="width: 100px; margin-left: -2px;" value=""  readonly="readonly"/>'
			ODDGBN_input +=	'<input type="button" id="ODDGBNhelp3" class="btn btn-default" value="?" style="height:18px; padding:1px; width:20px; margin-left: -2px;"/><br>'
		
		Swal.fire({
			  title: '삭제할 기수 구분을 선택하세요.',
			  html: ODDGBN_input,
			  type: 'info',
			  onOpen: function() {
				  $('#ODDGBNhelp3').getCODMST_NR('ST', $('#ODDGBN3'), $('#ODDGBNNM3') , $('ODDGBN3'), 'selOddCodList');
			  },
			  showCancelButton: true,
			  confirmButtonText: '확인',
			  cancelButtonText: '취소',
			}).then(function(result){
			  if (result.value) {
				if($('#ODDGBNNM3').val()==""){warning_swal("기수 구분을 선택하지 않으셨습니다."); return;}
				var json	 = new Object();
				json.USERID  = sessionUSERID;
				json.ODDGBN = $('#ODDGBN3').val();
				json.PROC_KIND  = "ESTMAEDelete";
				var data =  JSON.stringify(json);		
				con_swal("삭제 요청","'"+$('#ODDGBNNM3').val()+"' 자료를 삭제하시겠습니까?").then(function(result) {
					if(result)wait_swal(ajaxCall, data, 'del');
				});
			  }
			})
		
	}catch(e){
		alertCatchMsg(e);
	}finally{
	}
}














function year_select() {
	BUSGBN = "";
	DATGBN = "";
	ODDGBN = "";
	ODDGBNNM = "";
	
	var ODDGBN_input =  '<br><input name="ODDGBN2"  type="text" class="input7" id="ODDGBN2" style="width: 46px;" value=""  />';
		ODDGBN_input += '<input name="ODDGBNNM2"  type="text" class="input7r" id="ODDGBNNM2" style="width: 100px; margin-left: -2px;" value=""  readonly="readonly"/>';
		ODDGBN_input +=	'<input type="button" id="ODDGBNhelp2" class="btn btn-default" value="?" style="height:18px; padding:1px; width:20px; margin-left: -2px;"/><br>';
		
	var BUSGBN_input =  '<br><input name="BUSGBN2"  type="text" class="input7" id="BUSGBN2" style="width: 146px;" value=""  />';
		BUSGBN_input +=	'<input type="button" id="BUSGBNhelp2" class="btn btn-default" value="?" style="height:18px; padding:1px; width:20px; margin-left: -2px;"/><br>';
		
	var DATGBN_input =  '<br><input type="text" class="input7" id="DATGBN" name="DATGBN" value="{{Month}}" style="width: 55px; "/><br>';
	
	var queue_step = 0;
	var BUSGBNNM = "";
	
	Swal.mixin({
		  confirmButtonText: '다음 &rarr;',
		  cancelButtonText: '취소',
		  showCancelButton: true,
		  preConfirm: function() {
			  if(queue_step == 0){
				  ODDGBN = $('#ODDGBN2').val();
				  ODDGBNNM = $('#ODDGBNNM2').val();
			  }
			  queue_step++;
		  },
		  onOpen: function() {
			  $('#ODDGBNhelp2').getCODMST_NR('ST', $('#ODDGBN2'), $('#ODDGBNNM2') , $('ODDGBN2'), 'selOddCodList');
			  $('#BUSGBNhelp2').getCODMST_NR('ST', $('#BUSGBN2'), $('#BUSGBNNM2') , $('BUSGBN2'), 'selBusMstList');
			  $('#DATGBN').MonthPicker();
			  $("#DATGBN").mask("9999-99");
		  },
		}).queue([
		  {
		    title: '기수구분을 선택하세요.',
		    html: ODDGBN_input
		  }
		]).then(async function(result) {
			if (result.value) {
				if(ODDGBNNM == ''){
					warning_swal('기수구분이 정상적으로 선택되지 않았습니다.');
					return false;
				}else{
					
					let url = 'H_data.jsp';
					let sendData = {};
					sendData.USERID  = sessionUSERID;
					sendData.PROC_KIND  = "isESTMAE";
					sendData.ODDGBN  = ODDGBN;					
					let jsonData = JSON.stringify(sendData);
					let result = '';
					await $.post( url , {"jsQuery":jsonData} , function(data){
						let rscount = JSON.parse(data).rs.length;
						console.log(rscount);
						result = rscount;
					});
					if( result > 0 ) {
						warning_swal('해당기수에 이미 저장된 데이터가 있습니다. <br> 삭제하고 다시 시도하세요.');
						return false;
					}
					
					Swal.fire({
						title: '입력하신 자료를 확인해주세요.',
						html: '<pre><code> 기수구분 : '+ODDGBNNM+'</code></pre>',
						type: 'info',
						onOpen: function() {
							FileUpload();
						},
						footer: "" +
						"<br>" +
						'<button type="button" role="button" tabindex="0" class="SwalBtn1 btn btn-info customSwalBtn">' + '확인' + '</button>' +
						'<button type="button" role="button" tabindex="0" class="SwalBtn3 btn btn-danger customSwalBtn">' + '취소' + '</button>',
						showCancelButton: false,
						showConfirmButton: false
					});
				}
			}
		})
}





function FileUpload(){
	new AjaxUpload($('.SwalBtn1'),{
		
		action: 'uploadxls.jsp?JOBGBN=ESTMAE&ODDGBN='+ODDGBN+'&ODDGBNNM='+ODDGBNNM,
		name: 'myfile',
		onSubmit : function(file, ext){
			console.log(file);
			if (ext && /^(xls|xlsx)$/.test(ext)){
				wait_swal();
				$("#searchBtn").attr("disabled",true);
				this.disable();
			} else {
				warning_swal("엑셀파일만 업로드 가능합니다.");
				$("#searchBtn").attr("disabled",false);
				return false;				
			}
			
		},
		onComplete: function(file, response){
			$("#processDiv").dialog("destroy");		 
			$("#searchBtn").attr("disabled",false);
			this.enable();
			var json = JSON.parse(response);
			//unProcessDiv();
			if(json.rescod=="false"){
				error_swal(json.resmsg);
				return;
			}else{
				try{
					ok_swal(json.resmsg);
					$('#jqxWidget').hide();
					receive_data = json.rs;
					dataFilterArray = make_display_data(receive_data);
					source1.localdata = dataFilterArray;
				    dataAdapter1.dataBind();
				    resizeGridJQ("#jqxgrid", 200);
				    $('#jqxWidget').show();
				}catch(e){					
					error_swal(e);
					return;
				}finally{
				
				}
			}
		}
	});
}

$(document).on('click', '.SwalBtn3', function() {
	Swal.close();
});



function make_display_data( arr ){

	let result = [];
	let current_index = 0;

	
	arr.sort(function( a , b ){
		if(a.ODDGBN > b.ODDGBN) return 1;
		if(a.ODDGBN < b.ODDGBN) return -1;
		if(a.JEPGB2 > b.JEPGB2) return 1;
		if(a.JEPGB2 < b.JEPGB2) return -1;
		if(a.MAEMON > b.MAEMON) return 1;
		if(a.MAEMON < b.MAEMON) return -1;
		return 0;
	});

	
	for(let i=0 ; i < arr.length ; i++ ){
		if( i === 0 ){
			
			let temp_obj = {};
			temp_obj.ODDGBN = arr[0].ODDGBN ; 
			temp_obj.JEPGB2 = arr[0].JEPGB2 ; 
			temp_obj[ "MAEQTY"+arr[0].MAEMON.substr( 5 , 2 ) ] = arr[0].MAEQTY ; 
			temp_obj[ "AMOUNT"+arr[0].MAEMON.substr( 5 , 2 ) ] = arr[0].AMOUNT ;
			
			if( erro_check_01( arr[0].JEPGB2 , arr[0].MAEQTY , arr[0].AMOUNT ) ) temp_obj["ERRO"] = 'erro';
			
			result.push(temp_obj);
			
		}else if( result[current_index].ODDGBN === arr[i].ODDGBN 
				&& result[current_index].JEPGB2 === arr[i].JEPGB2  ){
			
			result[current_index][ "MAEQTY"+ arr[i].MAEMON.substr( 5 , 2 ) ] 
				=  String( Number( (result[current_index]["MAEQTY"+ arr[i].MAEMON.substr( 5 , 2 )])?? 0 ) + Number(arr[i].MAEQTY) ) ; 

			result[current_index][ "AMOUNT"+ arr[i].MAEMON.substr( 5 , 2 ) ]
				= String( Number( (result[current_index]["AMOUNT"+ arr[i].MAEMON.substr( 5 , 2 )])?? 0 ) + Number(arr[i].AMOUNT) ) ;

			if( erro_check_01( arr[i].JEPGB2 , arr[i].MAEQTY , arr[i].AMOUNT ) ) result[current_index]["ERRO"] = 'erro';
			
			
		}else {
			let temp_obj = {};
			temp_obj.ODDGBN = arr[i].ODDGBN ; 
			temp_obj.JEPGB2 = arr[i].JEPGB2 ; 
			temp_obj[ "MAEQTY"+arr[i].MAEMON.substr( 5 , 2 ) ] = arr[i].MAEQTY ; 
			temp_obj[ "AMOUNT"+arr[i].MAEMON.substr( 5 , 2 ) ] = arr[i].AMOUNT ;
			
			if( erro_check_01( arr[i].JEPGB2 , arr[i].MAEQTY , arr[i].AMOUNT ) ) temp_obj["ERRO"] = 'erro';
			
			current_index++;			
			result.push(temp_obj);
		}
		
	}
	return result;
}



function erro_check_01( JEPGB2 , MAEQTY , AMOUNT ){
		if( JEPGB2.substr(0,3) === "(R)" ) return false;
		let temp_MAEQTY = ( MAEQTY )? MAEQTY : "0";
		let temp_AMOUNT = ( AMOUNT )? AMOUNT : "0";
		if( (temp_MAEQTY !== temp_AMOUNT) && ( temp_MAEQTY === "0" || temp_AMOUNT === "0" ) ) return true;
		return false;
};





