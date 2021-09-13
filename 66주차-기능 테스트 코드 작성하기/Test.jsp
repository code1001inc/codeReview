<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>
<%@ page import="query.*, common.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="org.apache.commons.fileupload.FileItem"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="net.sf.json.*, jxl.*"%>
<%@ include file = "/htmls/config.jsp" %>

<%
	CommonLib          	util   	= new CommonLib();
	kdbp_excel_query  query = new kdbp_excel_query();
	kdbp_excel_poi_query  query_poi = new kdbp_excel_poi_query();
	JSONObject result = null;

	
	// 일반 메서드 테스트 
	if(false){
		
	}
	
	
	// 엑셀 업로드 메서드 테스트
	if(true){
		String JOBGBN = "";
		String ODDGBN = "45S";
		String ODDGBNNM = "45기실적";
	  String fileDir = "Y:/03. 시스템별 업무/2-01. 극동제연 사업계획 시스템/2. 엑셀등록 서식/H. 추정수지/";
	  String fileName = "추정매출액 입력양식(45기계획).xlsx";
	  File uploadedFile = new File(fileDir, fileName);
		result = query_poi.XLStoJSONObject_ESTMAE(JOBGBN, ODDGBN, ODDGBNNM, uploadedFile, USERID);  		
	}

  
  // 결과 반환
  out.print(result.toString());      

%>