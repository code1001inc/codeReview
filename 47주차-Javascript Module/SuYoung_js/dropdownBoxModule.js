




function dropdownBoxModule( procName , $containerTag , URL ){
	
	// 모든 select태그를 조회한다. 
	$dropdownBoxTag = $containerTag.querySelectorAll('select') ;

	
	let $resetTarget = [];
	let $selectCondition = [];
	let $detailTag = [];
	let $saveTarget = [];
	let $deleteCondition = [];

	
	// dropdownBox 태그를 종류별로 나눠 준다.  
	$dropdownBoxTag.forEach(function( item , index){
		// 초기화  대상 태그를 resetTarget배열에 담는다. 
		if( item.className.indexOf('resetTarget') !== -1 ){
			$resetTarget.push(item);
		};
		
		// 조회 조건 대상 태그를 selectCondition배열에 담는다.  
		if( item.className.indexOf('selectCondition') !== -1 ){
			$selectCondition.push(item);
		};
		
		// 상세 내용이 뿌려질 태그를 detailTag배열에 담는다. 
		if( item.className.indexOf('detailTag') !== -1 ){
			$detailTag.push(item);
		};
		
		// 저장 대상 태그를 saveTarget배열에 담는다. 
		if( item.className.indexOf('saveTarget') !== -1 ){
			$saveTarget.push(item);
		};
		
		// 삭제 조건 태그를 deleteCondition배열에 담는다. 
		if( item.className.indexOf('deleteCondition') !== -1 ){
			$deleteCondition.push(item);
		};
	});
	
	
	
	
	// 데이터 통신해서 모든 dropdownBox 채우기.  
	var resultData = null;
	var json	 = new Object();
	json.USERID  = sessionUSERID;
	json.PROC_KIND  = procName+"_dropdownBox";
	var sendData =  JSON.stringify(json);
	
	// ajax로 데이터를 조회해 온다. myAjax()함수는 ajax.js파일에 있다. 
	myAjax( URL , sendData , function( data , status ){
		resultData = data.rs;
	});
	
	// dropdownBoxTag배열에 담긴 모든 selec tag를 돌면서 해당하는 값을 넣어준다. 
	$dropdownBoxTag.forEach( function( item , index , arr ){
		$('#'+item.id).empty();
		$('#'+item.id).append("<option value =''selected></option>");
		let MSTNAM = item.id;
		$.each( resultData , function (index, entry) {
			if(MSTNAM == entry.MSTNAM ){
				let option = "<option value = '"+entry.VERNAM+"'>"+entry.VERNAM+"</option>";
				$('#'+entry.MSTNAM).append(option);
			}
		});
	} );
	
	
	

	
	
	
	let goReset  = function(){
		// resetTarget배열에 담긴 tag를 돌면서 값을 초기화 한다.
		$resetTarget.forEach(function(item, index, arr) {
			item.value = '';
		});			
	};
	
	
	let goSelect = function(){
		let obj = {};
		// selectCondition배열에 담긴 tag들을 돌면서 값을 가져와 obj객체에 담는다.
		$selectCondition.forEach(function(item, index, arr) {
			// select태그에서 선택된 option의 index값을 가져와서 최종적으로 option의 값을 가져온다. 
			obj[item.name] = item.options[item.selectedIndex].value;
		});
		return obj;		
	};
	
	
	let selectDetail = function( rowdata ){
		// detailTag배열에 담긴 tag들을 돌면서 그리드에서 전달받은 값을 넣는다.
		$detailTag.forEach(function( item , index){
			$('#'+item.id).val(rowdata[item.id]==undefined?"":rowdata[item.id]);
		});
	};
	
	
	let goSave = function(){
		
		
	};
	
	
	let goDelete = function(){
	
		
	};
	
	
	
	
	
	// 객체에 함수를 넣어서 반환한다. 
	return {
		// key : value(함수)
		goReset : goReset ,
		goSelect : goSelect ,
		selectDetail : selectDetail ,
		goSave : goSave , 
		goDelete : goDelete
	};
	
	
};




