


function A_OddCod_Jqxgrid( $containerTag ){
	
	let procName = $containerTag.id;
	
	var prgArr = $('#input_table').find("select");
	
	let data = [];
	
	var datafields = [
    	{ name: 'ODDGBN', type: 'string' },
        { name: 'ODDNAM', type: 'string' },
        { name: 'STRDAT', type: 'string' },
        { name: 'ENDDAT', type: 'string' },
        { name: 'RSTPLN', type: 'string' },
        { name: 'sRSTPLN', type: 'string' },
        { name: 'REMARK', type: 'string' },
        { name: 'INPDAT', type: 'string' },
        { name: 'INPSBN', type: 'string' },
        { name: 'UPTDAT', type: 'string' },
        { name: 'UPTSBN', type: 'string' }
	]; 
	
    var columngroups = [
        { text: "기준정보 버전", align: 'center', name: "PROGRAM" },
    ];
    
	
	var columns = [
		
		{
		    text: 'No', sortable: false, filterable: false, editable: false,
		    groupable: false, draggable: false, resizable: false,
		    datafield: '', columntype: 'number', width: 50, cellsalign: 'center', align: 'center',
		    cellsrenderer: function (row, column, value) {
		        return "<div style='margin:4px;text-align:center;'>" + (value + 1) + "</div>";
		    }
		},                  
		{ text: '기수코드', datafield: 'ODDGBN', width: 75, cellsalign: 'center', align: 'center' },
		{ text: '구분', datafield: 'sRSTPLN', width: 35, cellsalign: 'center', align: 'center' , height:1000 },
        { text: '기수명', datafield: 'ODDNAM', width: 150, cellsalign: 'left', align: 'center' , aggregates: ['count'],
      	  aggregatesrenderer: function (aggregates) {
                var renderstring = "";
                $.each(aggregates, function (key, value) {
                    renderstring += '<div style="position: relative; margin: 4px; overflow: hidden;"> 총 :' + value +'건</div>';
                });
                return renderstring;
            }},
	];
       
	
	$.each(prgArr, function (index, entry) {
		datafields.push({ name: entry.id, type: 'string' });
		columns.push({ text: entry.name, datafield: entry.id, width: 125, cellsalign: 'left', align: 'center', columngroup: 'PROGRAM' });
    });
	
    
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
		//height:windowHeight-255,
		height:'100%',
        source: dataAdapter,
        columnsresize: true,
        sortable: true,
        //autoheight: true,
        theme: 'light',
        filterable: true,
        showfilterrow: false,
        showstatusbar: true,
        enableBrowserSelection: true,
        statusbarheight: 30,
        showaggregates: true,
        columngroups: columngroups,
        columns: columns
    });
    
	var selectedGirdData = null;
	
	
	
	
	let goReset = function(){
		// 그리드에 빈 값을 넣고 다시 그린다. 
		var dataFilterArray = [];
		source.localdata = JSON.stringify(dataFilterArray);
		dataAdapter = new $.jqx.dataAdapter(source);
		thisJqxgrid.jqxGrid({ source: source });
		selectedGirdData = null;
	};
	
	
	let goSelect = function( data ){
//		source.localdata = JSON.stringify(data);
//		thisJqxgrid.jqxGrid({ source: source });
		
	    var dataJSON = data;
	    var dataFilterArray = new Array();
	    var progCnt = $('#input_table').find("select").length;
	    $.each(dataJSON,function(index, entry){
	    	if(index!=0 && (index+1)%6==0){
	    		var temp_Obj = new Object;
	    		temp_Obj.ODDGBN = entry.ODDGBN;
	    		temp_Obj.ODDNAM = entry.ODDNAM;
	    		var RSTPLN = entry.RSTPLN;
	    		temp_Obj.RSTPLN = RSTPLN;
	    		if(RSTPLN==="PLN"){
	    			temp_Obj.sRSTPLN = "계획";
	    		}else{
	    			temp_Obj.sRSTPLN = "실적";
	    		}
	    		temp_Obj.STRDAT = entry.STRDAT;
	    		temp_Obj.ENDDAT = entry.ENDDAT;
	    		temp_Obj.REMARK = entry.REMARK;
	    		temp_Obj.INPDAT = entry.INPDAT;
	    		temp_Obj.INPSBN = entry.INPSBN;
	    		temp_Obj.UPTDAT = entry.UPTDAT;
	    		temp_Obj.UPTSBN = entry.UPTSBN;
	    		for(let i=progCnt-1; i>=0; i--){
	    			temp_Obj[dataJSON[index-i].PRGNAM] = dataJSON[index-i].PRGVER;
	    		}
	    		dataFilterArray.push(temp_Obj);
	    	}
	    });
		source.localdata = JSON.stringify(dataFilterArray);
		
		// 그리드에 값을 넣고 새로 그린다. 
		thisJqxgrid.jqxGrid({ source: source });
	};
	
	
	let goSave = function(){
		alert('저장 완료');
	}; 
	
	
	let goDelete = function(){
		alert('삭제 완료');
	}; 
	
	
	// 그리드 클릑 이벤트 
	thisJqxgrid.on('rowselect', function (event) {
        // 선택된 그리드의 데이터 가져오기.
		var rowindex = event.args.rowindex;  
		selectedGirdData = $("#jqxgrid").jqxGrid('getrowdata', rowindex); 
    });
	
	// selectDetail 함수 실행시 선택된 row의 값을 반환한다. 
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







