


function validationCheck( validationTarget ){
	
	
	// 기본은 false(불합격)을 반환한다. (화이트리스트 방식!)
	var checkResult = false; 
	// 각 오류별 메시지를 담을 곳.
	var errorMessage = '';
	
	// 유효성 검사 대상들을 검사한다. 
	(function(){
		for( var key in validationTarget ){
			// key값이 STRDAT이면 
			// 반드시 입력받아야 하고 (null check) 
			// value값은 날짜여야 한다. 
			if(key==='STRDAT'){
				if( null_check( validationTarget[key] ) ){
					// 해당 오류의 오류메시지 등록.
					errorMessage = '회계연도를 선택하세요.';
					return;
				};
			
			// key값이 ODDGBN이면 
			// 반드시 입력받아야 하고 
			// value값은 기수 형태여야 한다. 
			}else if(key==='ODDGBN'){
				if( null_check( validationTarget[key] ) ){
					// 해당 오류의 오류메시지 등록.
					errorMessage = '기수구분을 선택하세요.';
					return;
				};
			};
		};
		// 중간에 종료되지않으면 최종적으로 true값을 반환한다. 
		checkResult = true;
	})();

	
	
	// 최종 결과에 따라 처리한다. 
	if( checkResult === true){
		// 유효성검사에 이상이 없는 경우 
		// true값을 반환한다.
		return true;
	}else{
		// 유효성검사에 이상이 있는 경우 .
		// 에러 메세지와 false값을 반환한다. 
		Swal.fire({
			allowEnterKey: false,
			title: errorMessage,
			type: 'error'
		});
		return false;
	};
	
	
	
	
//───── 유효성검사 공통 함수 ────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	
	// null값 확인
	function null_check( data ){
		if( data === '' ){ return true };
		return false;
	};
	
	// 데이터가 날짜 형태인지 확인. 
	function type_date_check( data ){
		return ( typeof data === 'number' )? true : false
	};
	
	// 데이터가 숫자 형태인지 확인.
	function type_number_check( data ){
		
	};
	
	// 데이터가 주민번호 형태인지 확인. 
	function type_resident_registration_number_check( data ){
		
	};
	
	
	
	
	
}; // 끝






