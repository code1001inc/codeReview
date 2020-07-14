<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>
<%@ page import="common.*" %>
<%@ page import="template.*" %>
<%@ include file = "config.jsp" %>
<%@ page import="java.io.*, java.sql.*, java.util.*, common.*, query.*, net.sf.json.*" %> 
<%
	CommonLib	util	= new CommonLib();
	

%>
<%	
    request.setAttribute("version", util.getTime("yyyyMMddHHmm"));
    JSONObject 				jBean 	= new JSONObject();
    cfms_w_query_3			query3	= new cfms_w_query_3();
    JSONObject 				result	= new JSONObject();
	/* String jsQuery = util.checkNull(request.getParameter("jsQuery"));
	
	jBean = (JSONObject) JSONSerializer.toJSON( jsQuery ); */
    
    jBean.put("USERID", USERID);
    
    result = query3.customer_PGDOWN_Select(jBean);
%>
<%@ include file = "../test/program_Layout.jsp" %>
<%@ include file = "../test/customer_PGDOWN_page.jsp" %>

<%-- <%@ include file = "customer_PGDOWN_page.jsp" %> --%>
<%-- <jsp:include file = "program_Layout.jsp"></jsp:include> --%>