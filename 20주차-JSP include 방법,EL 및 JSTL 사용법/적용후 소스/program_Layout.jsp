<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0,user-scalable=no, width=device-width, target-densitydpi=medium-dpi" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="x-ua-compatible" content="IE=edge" />
	
	<title>천일미래경영시스템</title>

<!-- 	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />	 -->
	<link rel="stylesheet" href="css/jquery-ui.css" />
    <link rel="stylesheet" href="jqwidgets-ver4.3.0/jqwidgets/styles/jqx.base.css" type="text/css" />
    <link rel="stylesheet" href="jqwidgets-ver4.3.0/jqwidgets/styles/jqx.windowsphone.css" type="text/css" />
    <link rel="stylesheet" href="jqwidgets-ver4.3.0/jqwidgets/styles/jqx.blackberry.css" type="text/css" />
    <link rel="stylesheet" href="jqwidgets-ver4.3.0/jqwidgets/styles/jqx.mobile.css" type="text/css" />
    <link rel="stylesheet" href="jqwidgets-ver4.3.0/jqwidgets/styles/jqx.android.css" type="text/css" />
    
	<link rel="stylesheet" type="text/css" href="css/slick.css"/>
	<link rel="stylesheet" type="text/css" href="css/slick-theme.css"/>
	<link id ="CSS_ID" rel="stylesheet" type="text/css" href="css/CFMS_W.css?version={{version}}"/>
	<link rel="stylesheet" type="text/css" href="calendar/css/fullcalendar.css"/>
	<script type="text/javascript" src="jquery/jquery-1.11.2.min.js"></script>
	
	<script src="jquery/jquery-ui-1.9.1.custom.min.js" type="text/javascript"></script>
	<script src="jquery/ajaxupload.js" type="text/javascript"></script> 	
	<script type="text/javascript" src="js/common.js"></script>
	<script type="text/javascript" src="js/json2.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
	<script type="text/javascript" src="js/md5.js"></script>
	<script type="text/javascript" src="js/SST.js"></script>
	<script type="text/javascript" src="jquery/jquery.maskedinput.js"></script>
	<script src="js/logsave.js?version={{version}}" type="text/javascript"></script>
	<script src="js/security_setting.js?version={{version}}" type="text/javascript"></script>
	<script src="js/approve_setting.js?version={{version}}" type="text/javascript"></script>
	<script src="js/jquery.timepicker.min.js?version={{version}}" type="text/javascript"></script>
	
	<script src="Editor/js/HuskyEZCreator.js" type="text/javascript" charset="utf-8"></script>
	<script src="jquery/jquery.tablednd.js" type="text/javascript"></script> 	
	<script type="text/javascript" src="js/moment.js?version={{version}}"></script>
	<script type="text/javascript" src="js/moment.min.js?version={{version}}"></script>
	<script type="text/javascript" src="js/moment_ko.js?version={{version}}"></script>
	
	<script type="text/javascript" src="jqwidgets-ver4.3.0/jqwidgets/jqxcore.js"></script>
    <script type="text/javascript" src="jqwidgets-ver4.3.0/jqwidgets/jqxdata.js"></script>
    <script type="text/javascript" src="jqwidgets-ver4.3.0/jqwidgets/jqxdatatable.js"></script>
    <script type="text/javascript" src="jqwidgets-ver4.3.0/jqwidgets/jqxbuttons.js"></script>
    <script type="text/javascript" src="jqwidgets-ver4.3.0/jqwidgets/jqxnumberinput.js"></script>
    <script type="text/javascript" src="jqwidgets-ver4.3.0/jqwidgets/jqxscrollbar.js"></script>
    <script type="text/javascript" src="jqwidgets-ver4.3.0/jqwidgets/jqxlistbox.js"></script>
    <script type="text/javascript" src="jqwidgets-ver4.3.0/jqwidgets/jqxdropdownlist.js"></script>
    <script type="text/javascript" src="jqwidgets-ver4.3.0/jqwidgets/jqxmenu.js"></script>
    <script type="text/javascript" src="jqwidgets-ver4.3.0/jqwidgets/jqxgrid.js"></script>
	<script type="text/javascript" src="jqwidgets-ver4.3.0/jqwidgets/jqxgrid.pager.js"></script>    
	<script type="text/javascript" src="jqwidgets-ver4.3.0/jqwidgets/jqxgrid.columnsresize.js"></script>
    <script type="text/javascript" src="jqwidgets-ver4.3.0/jqwidgets/jqxcalendar.js"></script>
    <script type="text/javascript" src="jqwidgets-ver4.3.0/jqwidgets/jqxdatetimeinput.js"></script>
    <script type="text/javascript" src="jqwidgets-ver4.3.0/jqwidgets/jqxcheckbox.js"></script>
    <script type="text/javascript" src="jqwidgets-ver4.3.0/jqwidgets/globalization/globalize.js"></script>    
    <script type="text/javascript" src="jqwidgets-ver4.3.0/jqwidgets/jqxgrid.sort.js"></script>
    <script type="text/javascript" src="jqwidgets-ver4.3.0/jqwidgets/jqxgrid.filter.js"></script>
    <script type="text/javascript" src="jqwidgets-ver4.3.0/jqwidgets/jqxgrid.pager.js"></script>
    <script type="text/javascript" src="jqwidgets-ver4.3.0/jqwidgets/jqxgrid.selection.js"></script>
    <script type="text/javascript" src="jqwidgets-ver4.3.0/jqwidgets/jqxgrid.aggregates.js"></script>    
    <script type="text/javascript" src="jqwidgets-ver4.3.0/jqwidgets/jqxpanel.js"></script>
    <script type="text/javascript" src="jqwidgets-ver4.3.0/demos/jqxgrid/generatedata.js"></script>
	<script type="text/javascript" src="jqwidgets-ver4.3.0/mobiledemos/simulator.js"></script>
	<script type="text/javascript" src="jqwidgets-ver4.3.0/jqwidgets/jqxsortable.js"></script>
	<script type="text/javascript" src="jqwidgets-ver4.3.0/jqwidgets/jqxtooltip.js"></script>
    <script type="text/javascript" src="jqwidgets-ver4.3.0/jqwidgets/jqxtree.js"></script>
	<script type="text/javascript" src="jqwidgets-ver4.3.0/jqwidgets/jqxgrid.grouping.js"></script>
    <script type="text/javascript" src="jqwidgets-ver4.3.0/jqwidgets/jqxgrid.edit.js"></script>
    <script type="text/javascript" src="jqwidgets-ver4.3.0/jqwidgets/jqxtabs.js"></script>
    <script type="text/javascript" src="jqwidgets-ver4.3.0/jqwidgets/jqxdata.export.js"></script>
	<script type="text/javascript" src="jqwidgets-ver4.3.0/jqwidgets/jqxgrid.export.js"></script>
    
    <script>
    	var sessionUSERID = '{{sessionUSERID}}'; 
    	var sessionUSERNM = '{{sessionUSERNM}}'; 
    	var sessionJIKGUB = '{{sessionJIKGUB}}'; 
    	var sessionJIKGNM = '{{sessionJIKGNM}}'; 
    	var sessionAUTHOR = '{{sessionAUTHOR}}'; 
    	var sessionAUTHNM = '{{sessionAUTHNM}}'; 
    	var sessionORGCOD = '{{sessionORGCOD}}'; 
    	var sessionORGNAM = '{{sessionORGNAM}}';
    	var sessionORGADD = '{{sessionORGADD}}'; 
    	var sessionCUSTCD = '{{sessionSAUPCD}}';
    	var sessionSAUPCD = '{{sessionSAUPCD}}'; 
    	var sessionSAUPNM = '{{sessionSAUPNM}}'; 
    	var sessionORGLST = '{{sessionORGLST}}'; 
    	var sessionLOGDAT = '{{sessionLOGDAT}}'; 
    	var sessionUNIQID = '{{sessionUNIQID}}'; 
    	var sessionUSERFG = '{{sessionUSERFG}}'; 
    	var sessionDIVCOD = '{{sessionDIVCOD}}'; 
    	var sessionSPOTID = '{{sessionSPOTID}}'; 
    	var sessionITMADM = '{{sessionITMADM}}';
		var sessionITMANM = '{{sessionITMANM}}';
		
    	//키보드변수
    	var keyENTER  = 13;
    	var keyESCAPE = 27;
    	var keyDOWN   = 40;
    	var keyUP     = 38;
    	var keyLEFT   = 37;
    	var keyRIGHT  = 39;
    	var keyTAB    = 9;
    	var keyBACKKEY= 8;
    	var keyDELETE = 46;
    </script>
    

</head>
<body>

</body>
</html>