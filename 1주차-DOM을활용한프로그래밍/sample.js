function makeGridJQ(){
	/* 배열 메소드로 DOM 탐색을 통해 select 타입을 찾아온다.
	 * select 타입의 name과 id를 활용.
	*/
	var prgArr = $('#input_table').find("select");
	
	//그리드 베이스 설정
	var datafields = [
    	{ name: 'ODDGBN', type: 'string' },
        { name: 'ODDNAM', type: 'string' },
        { name: 'REMARK', type: 'string' },
        { name: 'INPDAT', type: 'string' },
        { name: 'INPSBN', type: 'string' },
        { name: 'UPTDAT', type: 'string' },
        { name: 'UPTSBN', type: 'string' }
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
        { text: '기수명', datafield: 'ODDNAM', width: 150, cellsalign: 'left', align: 'center' , aggregates: ['count'],
      	  aggregatesrenderer: function (aggregates) {
                var renderstring = "";
                $.each(aggregates, function (key, value) {
                    renderstring += '<div style="position: relative; margin: 4px; overflow: hidden;"> 총 :' + value +'건</div>';
                });
                return renderstring;
            }},
	];
	
    //그리드 초기 설정된 그룹
    var columngroups = [
        { text: "기준정보 버전", align: 'center', name: "PROGRAM" },
    ];
    
    //DOM을 통해 읽어온 Select의 name과 id를 사용해서 베이스로 구성된 그리드에 동적으로 추가 구성.
	$.each(prgArr, function (index, entry) {
		datafields.push({ name: entry.id, type: 'string' });
		columns.push({ text: entry.name, datafield: entry.id, width: 125, cellsalign: 'left', align: 'center', columngroup: 'PROGRAM' });
    });
    
    //동적으로 구성된 요소들을 최종적으로 활용하여 그리드를 구성.
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
    	height:'100%',
        source: dataAdapter1,
        columnsresize: true,
        sortable: true,
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
}