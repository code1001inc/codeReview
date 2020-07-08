<%@page import="java.net.URLDecoder"%><%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %><%@ page import="java.io.*, java.sql.*, java.util.*, common.*, query.*, net.sf.json.*" %><%@ page import="template.*" %><%@ include file = "config.jsp" %><%@ include file = "login_check.jsp" %><% request.setCharacterEncoding("UTF-8");%><%
	
	// 사용빈즈 정의
	CommonLib		util		=	new CommonLib();
	kdbp_excel_download		excel_download	    = new kdbp_excel_download();  

	String today  = util.getTime6();
	
	// request 정보 받아오기
	String jsQuery = util.checkNull(URLDecoder.decode(request.getParameter("jsQuery"),"utf-8"),"{}");
	JSONObject jBean = (JSONObject) JSONSerializer.toJSON( jsQuery );
	String EXLNAM = util.jsonString(jBean, "EXLNAM");
	System.out.println("EXLNAM : "+EXLNAM);
	

	String file_name = "";

	// request 정보 초기세팅
	file_name =  EXLNAM+".xlsx";
	
   // 다운로드 경로
	String saveFolder   = "download_excel/";
	//String filePath = context.getRealPath(saveFolder);
	String filePath = "Z:/"; //로컬 환경에서 개인 시큐어디스크로 사용
	
	if(!USERID.equals("")){
		excel_download.jsonToExcel(filePath, file_name, jBean); 
		
		//여기부터 화일 다운로드 창이 자동으로 뜨게 하기 위한 코딩(임시화일을 스트림으로 저장)
		File file = new File (filePath + file_name); //해당 경로의 파일 객체를 만든다.
		byte[] bytestream = new byte[(int)file.length()]; //파일 스트림을 저장하기 위한 바이트 배열 생성.
		FileInputStream filestream = new FileInputStream(file); //파일 객체를 스트림으로 불러온다.
		int i = 0, j = 0; //파일 스트림을 바이트 배열에 넣는다.
		while((i = filestream.read()) != -1) {
			bytestream[j] = (byte)i;
			j++;
		}
		filestream.close(); //FileInputStream을 닫아줘야 file이 삭제된다.

		
		try{
		boolean success = file.delete(); //화일을 생성과 동시에 byte[]배열에 입력후 화일은 삭제
		if(!success) System.out.println("<script>alert('not success')</script>");
		} catch(IllegalArgumentException e){
			System.err.println(e.getMessage());
		}

		// response.setContentType("application/x-msdownload;charset=EUC-KR"); //응답 헤더의 Content-Type을 세팅한다.
		// 파일명 한글 셋팅
		String file_name_kr   =  java.net.URLEncoder.encode(file_name,"UTF-8");
		response.setHeader("Content-Disposition","attachment; filename=" + file_name_kr +";"); //Content-Disposition 헤더에 파일 이름 세팅.
		response.setHeader("Set-Cookie", "excelDownCookie=true; path=/");
		OutputStream outStream = response.getOutputStream(); // 응답 스트림 객체를 생성한다.
		outStream.write(bytestream); // 응답 스트림에 파일 바이트 배열을 쓴다.
		outStream.close();
	}
%>