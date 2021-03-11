


function basicOperationModule( procName , URL ){
		
	
	
	let goReset = function(){
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
	
	
	
	let goSelect = function(){
		let json = {};
		json.USERID  = sessionUSERID;
		json.PROC_KIND  = procName+"_Select";
		
		let ob1 = InputTagModule.goSelect();
		let ob2 = DropdownBoxModule.goSelect();
		let ob3 = RadioButtonModule.goSelect();
		Object.assign( json , ob1 , ob2 , ob3 );
		
		if( !validationCheck( json ) ){
			return false;
		};

		var sendData =  JSON.stringify(json);
		var resultData = null;
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
	
	
	
	let selectDetail = function(){
		let selectedGridData = JqxgridModule.selectDetail();
		if( selectedGridData === null ){ return; };
		InputTagModule.selectDetail( selectedGridData );
		DropdownBoxModule.selectDetail( selectedGridData );
		RadioButtonModule.selectDetail( selectedGridData );
	};

	
	
	let goSave = function(){
		JqxgridModule.goSave();
	};
	
	
	
	let goDelete = function(){
		JqxgridModule.goDelete();
	};
		
	
	
	let goExcel = function(){
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
	
	
	
	return {
		goReset : goReset ,
		goSelect : goSelect ,
		selectDetail : selectDetail ,
		goSave : goSave , 
		goDelete : goDelete
	};
	
	
	
};




