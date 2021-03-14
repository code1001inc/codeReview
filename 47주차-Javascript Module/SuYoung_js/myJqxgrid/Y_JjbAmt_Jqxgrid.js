


function Y_JjbAmt_Jqxgrid( $containerTag ){
	
	
	let procName = $containerTag.id;
	
	
	let data = [];
	
	
	let datafields = [
    	{ name: 'ODDGBN', type: 'string' },
    	{ name: 'ODDGBNNM', type: 'string' },
    	{ name: 'ACDEXT', type: 'string' },
        { name: 'ACDNAM', type: 'string' },
        { name: 'CHAAMT_07', type: 'number' },
        { name: 'CHAAMT_08', type: 'number' },
        { name: 'CHAAMT_09', type: 'number' },
        { name: 'CHAAMT_10', type: 'number' },
        { name: 'CHAAMT_11', type: 'number' },
        { name: 'CHAAMT_12', type: 'number' },
        { name: 'CHAAMT_01', type: 'number' },
        { name: 'CHAAMT_02', type: 'number' },
        { name: 'CHAAMT_03', type: 'number' },
        { name: 'CHAAMT_04', type: 'number' },
        { name: 'CHAAMT_05', type: 'number' },
        { name: 'CHAAMT_06', type: 'number' }
    ]; 
	
	
    let columns = [
		{
		    text: 'Seq', sortable: false, filterable: false, editable: false, pinned: true,
		    groupable: false, draggable: false, resizable: false,
		    datafield: '', columntype: 'number', width: 50, cellsalign: 'center', align: 'center'
		}, 
		{ datafield: 'ODDGBN'    ,displayfield: 'ODDGBNNM',text: '기수구분'		,width: 80,  cellsalign: 'center', align: 'center' }, 
		{ datafield: 'ACDNAM'    ,text: '계정과목명'		,width: 170,  cellsalign: 'left',  align: 'center'  },
		{ datafield: 'CHAAMT_07', text: "7월", width: 125, align: 'center', cellsalign: 'right', cellsformat: "d0"},
		{ datafield: 'CHAAMT_08', text: "8월", width: 125, align: 'center', cellsalign: 'right', cellsformat: "d0"},
		{ datafield: 'CHAAMT_09', text: "9월", width: 125, align: 'center', cellsalign: 'right', cellsformat: "d0"},
		{ datafield: 'CHAAMT_10', text: "10월",width: 125, align: 'center', cellsalign: 'right', cellsformat: "d0"},
		{ datafield: 'CHAAMT_11', text: "11월",width: 125, align: 'center', cellsalign: 'right', cellsformat: "d0"},
		{ datafield: 'CHAAMT_12', text: "12월",width: 125, align: 'center', cellsalign: 'right', cellsformat: "d0"},
		{ datafield: 'CHAAMT_01', text: "1월", width: 125, align: 'center', cellsalign: 'right', cellsformat: "d0"},
		{ datafield: 'CHAAMT_02', text: "2월", width: 125, align: 'center', cellsalign: 'right', cellsformat: "d0"},
		{ datafield: 'CHAAMT_03', text: "3월", width: 125, align: 'center', cellsalign: 'right', cellsformat: "d0"},
		{ datafield: 'CHAAMT_04', text: "4월", width: 125, align: 'center', cellsalign: 'right', cellsformat: "d0"},
		{ datafield: 'CHAAMT_05', text: "5월", width: 125, align: 'center', cellsalign: 'right', cellsformat: "d0"},
		{ datafield: 'CHAAMT_06', text: "6월", width: 125, align: 'center', cellsalign: 'right', cellsformat: "d0"},
    ];
       
    
	source =
    {
        datatype: "json",
        datafields: datafields, 
        localdata: data
    };

	
	dataAdapter = new $.jqx.dataAdapter(source);
	
	
	let thisJqxgrid = $("#"+procName).find("#jqxgrid");
	
	
	thisJqxgrid.jqxGrid(
    {
    	width: '99%',
    	height: 610,
        source: dataAdapter,
        columnsresize: true,
        sortable: true,
        theme: 'light',
        filterable: true,
        showfilterrow: false,
        showstatusbar: true,
        statusbarheight: 30,
        showaggregates: true,
        columns: columns,
    });
    
	var selectedGirdData = null;
	
	
	
	
	
	let goReset = function(){
		var dataFilterArray = [];
		source.localdata = JSON.stringify(dataFilterArray);
		dataAdapter = new $.jqx.dataAdapter(source);
		thisJqxgrid.jqxGrid({ source: source });
		selectedGirdData = null;
	};
	
	
	let goSelect = function( data ){
		source.localdata = JSON.stringify(data);
		thisJqxgrid.jqxGrid({ source: source });
	};
	
	
	let goSave = function(){
		alert('저장 완료');
	}; 
	
	
	let goDelete = function(){
		alert('삭제 완료');
	}; 
	
	
	// 그리드 클릭 이벤트
	thisJqxgrid.on('rowselect', function (event) {
        // 선택된 그리드의 데이터 가져오기.
		var rowindex = event.args.rowindex; 
		selectedGirdData = $("#jqxgrid").jqxGrid('getrowdata', rowindex);  
    });
	
	let selectDetail = function(){
		return selectedGirdData;
	};	
	
	
	
	
	
	return {
		goReset : goReset ,
		goSelect : goSelect ,
		goSave : goSave ,
		goDelete : goDelete ,
		selectDetail : selectDetail ,
		thisJqxgrid : thisJqxgrid
	}
    
	
};







