


function procMaker( procName , URL){
	
	// 해당 프로그램 container 태그
	let $containerTag = document.querySelector('#'+procName);
	
	
	
	
//───── 모듈 생성 ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	
	// 인풋태그 모듈
	let InputTagModule = inputTagModule( procName , $containerTag , URL );
	
	// 그리드 모듈
	let JqxgridModule = window[procName+'_Jqxgrid']( $containerTag );
	// window[문자열]()는 문자열로 함수를 바로 실행할 수 있다. 
	
	// 드롭다운 모듈
	let DropdownBoxModule = dropdownBoxModule( procName , $containerTag , URL );
	
	// 라디오버튼 모듈
	let RadioButtonModule = radioButtonModule( $containerTag );
	
	
		
//───── 버튼 조회 ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
	
	// 버튼 (이벤트를 등록할 버튼들을 조회한다.)
	let $resetButton = $containerTag.querySelector('#resetBtn');
	let $selectButton = $containerTag.querySelector('#searchBtn');
	let $saveButton = $containerTag.querySelector('#saveBtn');
	let $deleteButton = $containerTag.querySelector('#deleteBtn');
	let $closeButton = $containerTag.querySelector('#closeBtn');
	let $excelButton = $containerTag.querySelector('#excelBtn');
	
	
	
	
	
//───── 이벤트 등록 ───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────	

	// 쓰로틀링을 위한 함수 생성.
	// 이벤트가 한번 실행되면 일정 시간동안 여러번 실행할 수 없게 한다.  
	let timer;
	function throttlingFunc( func ){
		if (!timer) {
			func(); 
			timer = setTimeout(function() {
				timer = null;
			}, 200);
		};	
	}
	
	
	// 초기화 기능 이벤트 등록
	$resetButton.addEventListener('click' , function(){
		throttlingFunc( function(){ 
			goReset(); 
		});
	});
	
	
	// 조회 기능 이벤트 등록
	$selectButton.addEventListener('click' , function(){
		throttlingFunc( function(){ 
			goSelect(); 
		});
	});
	
	
	// 상세 조회 이벤트 등록
	JqxgridModule.thisJqxgrid.on('click' , function(){
		throttlingFunc( function(){ 
			selectDetail(); 
		});				
	});
	
	
	// 저장 기능 이벤트 등록
	$saveButton.addEventListener('click' , function(){
		throttlingFunc( function(){ 
			goSave();
			goSelect();			
		});			
	});
	
	
	//삭제 기능 이벤트 등록
	$deleteButton.addEventListener('click' , function(){
		throttlingFunc( function(){ 
			goDelete();
			goSelect();			
		});			
	});
	
	
	//엑셀 다운로드 기능 이벤트 등록
	$excelButton.addEventListener('click' , function(){
		throttlingFunc( function(){ 
			goExcel();
		});			
	});
	
	
	// 닫기 기능 이벤트 등록
	$closeButton.addEventListener('click' , function(){
		parent.tabs_remove();
	});	
	
	
	// 타임 피커 이벤트 등록
	let $STRDAT = $('#'+procName).find('.timePicker');
	$.each( $STRDAT , function( index , entry ){
		$(entry).MonthPicker();
		$(entry).mask("9999");
		$(entry).attr( 'autocomplete' , 'off' );
	});
	

	

	
	
//───── 기능 등록 ────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────	
	
	
	// 초기화 함수 구현
	function goReset(){
		// 각 모듈의 초기화 기능을 실행한다. 
		InputTagModule.goReset();
		DropdownBoxModule.goReset();
		RadioButtonModule.goReset();
		JqxgridModule.goReset();
		
		Swal.fire({
			type: 'warning',
			title: '초기화 완료',
			showConfirmButton: false,
			// 지속 시간
			timer: 1000,
			// 작은 창으로 만드는 설정 
			toast: true,
		})
	};
	
	
	
	// 조회 함수 구현
	function goSelect(){
		let json = {};
		json.USERID  = sessionUSERID;
		json.PROC_KIND  = procName+"_Select";
		
		// 각 모듈에서 값을 가져온다. 
		let ob1 = InputTagModule.goSelect();
		let ob2 = DropdownBoxModule.goSelect();
		let ob3 = RadioButtonModule.goSelect();
		// 가져온 객체를 합친다.
		Object.assign( json , ob1 , ob2 , ob3 );
		
		
		// 유효성 검사. validationCheck() 함수는 validation.js파일에 있다. 
		if( !validationCheck( json ) ){
			return false;
		};

		var sendData =  JSON.stringify(json);
		var resultData = null;
		// ajax통신으로 데이터를 조회한다. myAjax()함수는 ajax.js파일에 있다. 
		myAjax( URL , sendData , function( data , status ){
			resultData = data.rs;
		});
		
		JqxgridModule.goSelect( resultData );		
		
		Swal.fire({
			type: 'success',
			title: '조회 완료',
			showConfirmButton: false,
			// 지속 시간
			timer: 1000,
			// 작은 창으로 만드는 설정 
			toast: true,
		})
	};
	
	
	
	// 상세조회 함수 구현
	function selectDetail(){
		// JqxgridModule에서 선택된 row의 값을 가져온다. 
		let selectedGridData = JqxgridModule.selectDetail();
		// 선택된 row의 값이 없으면 함수를 중단한다. 
		if( selectedGridData === null ){ return; };
		// grid에서 가져온 값을 각 모듈에 전달한다. 
		InputTagModule.selectDetail( selectedGridData );
		DropdownBoxModule.selectDetail( selectedGridData );
		RadioButtonModule.selectDetail( selectedGridData );
	};

	
	
	// 저장 함수 구현
	function goSave(){
		JqxgridModule.goSave();
	};
	
	
	
	// 삭제 함수 구현
	function goDelete(){
		JqxgridModule.goDelete();
	};
		
	
	
	// 엑셀 함수 구현
	function goExcel(){
		Swal.fire({
			title: '엑셀 다운로드 중',
			showConfirmButton: false,
			// 지속 시간
			timer: 10000,
			// 외부 클릭 금지.
			allowOutsideClick: false ,
			// ESC키 사용 금지.
			allowEscapeKey: false ,
			allowEnterKey: false,
			// 진행 중 보여주기. 
			onBeforeOpen: function () {
				Swal.showLoading();
			},
		});
	};
	
	
	
	
	
};




