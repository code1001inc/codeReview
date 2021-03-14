



function myAjax( url , jsonData , actFunc ){
	$.ajax({
		type : "post",
		url : url,						
		data : {"jsQuery" : jsonData} ,								
		async : false,									
		dataType : "json",								 
		success : function ( data ){
			actFunc(data,status);
		}
    });	
};

