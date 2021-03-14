




function inputTagModule( procName , $containerTag , URL ){
	
	let $inputTag = $containerTag.querySelectorAll('input');
	
	
	let $resetTarget = [];
	let $selectCondition = [];
	let $detailTag = [];
	let $saveTarget = [];
	let $deleteCondition = [];
	
	
	// input 태그를 종류별로 나눠준다. 
	$inputTag.forEach(function( item , index){
		// type이 text가 아니면 다음 태그로 넘어간다. 
		if( item.type !== 'text'){
			return null;
		};
		
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
			// 태그의 name값으로 변수명을 지정하고 값을 넣는다. 
			obj[item.name] = item.value; 
		});
		return obj;
	};
	
		
	let selectDetail = function( selectedGirdData ){
		// detailTag배열에 담긴 tag들을 돌면서 그리드에서 전달받은 값을 넣는다. 
		$detailTag.forEach( function( item , index , arr ){
			// 그리드의 데이터를 태그의 name값으로 조회해서 가져온다. 
			item.value = selectedGirdData[item.name];
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

