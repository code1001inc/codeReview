<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>
<%@ page import="common.*" %>
<%@ page import="template.*" %>
<%@ include file = "config.jsp" %> 
<%
	CommonLib	util	= new CommonLib();
	
	String today  = util.minusDate(0);
	
// --------------------------------
// 페이지선언 
// --------------------------------
	
    layoutPage		= "program_Layout.html";
    //topPage		    = "customer_Top.html";
    contentPage		= "customer_PGDOWN.html";

	//서브페이지 path
	naviPath = "<a href='"+httpPath+"'>Home</a> > " + controlName ;	  	

// --------------------------------
// 템플릿
// --------------------------------
    BearTemplate tpl = new BearTemplate(); 
	
    tpl.setDocumentRoot(template_dir);
    tpl.define("layoutPage",  layoutPage);
    //tpl.define("topPage", topPage); 
    tpl.define("contentPage", contentPage); 

%>
<%@ include file = "login_define.jsp" %>  
<%	
	tpl.assign("pMETDAT", today);  

	tpl.assign("today", today);
	tpl.assign("version", util.getTime("yyyyMMddHHmm"));
	tpl.parse("contentPage");
	//tpl.parse("topPage");
	tpl.parse("layoutPage");

	out.println(tpl.fetch("layoutPage"));		  
    tpl.clear(); 
%>