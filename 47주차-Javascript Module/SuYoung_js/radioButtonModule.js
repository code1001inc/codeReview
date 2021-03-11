




function radioButtonModule( $containerTag ){
	
	$radioButtonTag = $containerTag.querySelectorAll('.radioButton') ;
		
	
	let $resetTarget = [];
	let $selectCondition = [];
	let $detailTag = [];
	let $saveTarget = [];
	let $deleteCondition = [];
	
	
	// radioButton 태그를 종류별로 나눠 준다.  
	$radioButtonTag.forEach(function( item , index){
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
		$resetTarget.forEach(function(item, index, arr) {
			// resetTarget배열에 담긴 tag를 돌면서 값을 초기화 한다.
			// 클래스 값으로 radioDefault값을 가진 tag를 선택하고 아닌 태그의 checked속성을 없앤다. 
			if( item.className.indexOf('radioDefault') !== -1 ){
				item.checked = true;
			}else{
				item.removeAttribute( 'checked' );
			}
		});		
	};
	
	
	let goSelect = function(){
		let obj = {};
		// selectCondition배열에 담긴 tag들을 돌면서 값을 가져와 obj객체에 담는다.
		// 사용안해서 아직 미구현
		$selectCondition.forEach(function(item, index, arr) {
			
		});
		return obj;	
	};
	
	
	let selectDetail = function( rowdata ){
		// detailTag배열에 담긴 tag들을 돌면서 그리드에서 전달받은 값으로 radio태그를 선택한다. 
		$detailTag.forEach(function( item , index){
			if( item.value === rowdata[item.name] ){
				item.checked = true;
			}else{
				item.removeAttribute( 'checked' );
			}
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




