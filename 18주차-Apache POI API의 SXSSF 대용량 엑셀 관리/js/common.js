/* poi excel 다운로드
 * 필요 라이브러리 : Jquery , jquery.cookie.js
 * 사용법 
 * goExcel('그리드id','엑셀명');
 * ex)
 * goExcel('jqxgrid','폐용기부담금_조회');  
*/
function goExcel(grid_id, file_name) {
	let rows = $('#'+grid_id).jqxGrid('getrows'); //클로저 의심.
	let head_rows = [];	
	if(rows.length == 0){
		warning_swal("저장하실 항목이 없습니다.");
		return;
	}
	let cols = $("#"+grid_id).jqxGrid("columns");
	wait_swal(); // 화면에 프로그래스 띄우기
	 
  // 1초마다 excelDownCookie 라는 쿠키가 있는지 체크.
	let cookie_check = setInterval(function() {
		if ($.cookie("excelDownCookie") == "true") { 
		   $.removeCookie('excelDownCookie', { path: '/' });
	       clearInterval(cookie_check);
	       Swal.close();
	     }
	}, 1000);

	//헤더값 삽입
	let head_Obj = {};
	cols.records.map(function(obj) {
		if(obj.text != 'Seq'){
			let head_Property_Obj = {};
			head_Property_Obj['TEXT'] = obj.text;
			head_Property_Obj['WIDTH'] = obj.width;
			head_Property_Obj['ALIGN'] = obj.cellsalign;
			head_Property_Obj['FORMAT'] = obj.cellsformat;
			
			head_Obj[obj.datafield] = head_Property_Obj;
		}
	});
	head_rows.unshift(head_Obj);
	
	//그룹값이 있을 경우 삽입
	let has_Parent = cols.records.find(function (obj) {return obj.parent != null;}); // 그룹값이 있는지 체크.
	if(has_Parent !== undefined){
		let parent_Obj = {};
		cols.records.map(function(obj) {
			if(obj.text != 'Seq'){
				let parent_Property_Obj = {};
				parent_Property_Obj['TEXT'] = obj.parent==null?obj.text:obj.parent.text;
				parent_Property_Obj['LENGTH'] = obj.parent==null?0:obj.parent.groups.length;
				parent_Property_Obj['WIDTH'] = obj.width;
				parent_Property_Obj['ALIGN'] = obj.cellsalign;
				parent_Property_Obj['FORMAT'] = obj.cellsformat;
				
				parent_Obj[obj.datafield] = parent_Property_Obj;
			}
		});
		head_rows.unshift(parent_Obj);
	}
	
	//data json 생성
	var json	 = new Object();
	json.USERID  = sessionUSERID;
	json.EXLNAM  = file_name;
	json.rows  = rows;
	json.head_rows  = head_rows;
	var data =  JSON.stringify(json);
	
	//form 생성
	var form = document.createElement("form");
	form.method  = "post";
	form.target  = "downx";
	form.action  = "../htmls/excel_output.jsp";
	document.body.appendChild(form);
	
	var json = document.createElement("input");
	json.setAttribute("type", "hidden");
	json.setAttribute("name", "jsQuery");
	json.setAttribute("value", encodeURIComponent(data) );
	form.appendChild(json);
	form.submit();
	document.body.removeChild(form);
}