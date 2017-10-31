<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//Dtr HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtr">
<html>
<head>
<link href="<%= request.getContextPath() %>/MGWSWarrantyService.css" rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath() %>/jquery/jquery-1.4.2.js" type="text/javascript"></script>
<script type="text/javascript">
function back(){
	<% String vin=(String)request.getParameter("vin");
	 String apikey=(String)request.getParameter("apikey"); 
	 String companyName=(String)request.getParameter("companyName");
	 String appName=(String)request.getParameter("appName");
	if(vin==null ){
	vin="";
	}
	if(apikey==null ){
	apikey="";
	}
	if(companyName==null ){
	companyName="";
	}
	if(appName==null ){
	appName="";
	}
	%>
	document.forms[0].vin.value="<%=vin %>";
	document.forms[0].apikey.value="<%=apikey %>";
	document.forms[0].companyName.value="<%=companyName %>";
	document.forms[0].appName.value="<%=appName %>";

document.forms[0].action="<%=request.getContextPath() %>/index.jsp";
document.forms[0].submit();
}

function formatXml(xml) {    
	var formatted = '';
	var reg = /(>)(<)(\/*)/g;
	xml = xml.replace(reg, '$1\r\n$2$3');  
	var pad = 0;
	jQuery.each(xml.split('\r\n'), function(index, node) {
	var indent = 0;
	if (node.match( /.+<\/\w[^>]*>$/ )) {  
	  indent = 0;
	} else if (node.match( /^<\/\w/ )) {
	  if (pad != 0) {
	      pad -= 1; 
	  }
	} else if (node.match( /^<\w[^>]*[^\/]>.*$/ )) {
	  indent = 1;
    } else {
      indent = 0;
    } 
    var padding = '';       
    for (var i = 0; i < pad; i++) { 
      padding += '  ';       
    }         
    formatted += padding + node + '\r\n';    
    pad += indent;    }); 
    document.getElementById('xmlId').value = formatted;    
    //return formatted;
}

</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MGWS API Response</title>
<style type="text/css">
th {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 11px;
	font-weight: bold;
	width:170px;
	height: 20px;
	color: #000;
	cellspacing: 1;
	text-align: right;
	cursor: pointer;
	background-color: #D8EAFB;
	text-align:left
}
td {
	font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;
	font-size: 11px;
	font-style: normal;
	font-weight: normal;
	height: 20px;
	cellspacing: 0;
	overflow-y:auto;	
	background-color: #F2F6F9;
	text-align:left
}
</style>
</head>
<body onload="formatXml('<c:out value="${requestScope.xmlResponse}" />');">
<h4 class="logout" style="text-align:left;font-size: 14px;">XML Response:</h4>
<textarea rows="35" cols="130" name="test"  id="xmlId"></textarea>
<br>
<form ><input type ="button" onclick="back();" value= "Back" class="wizardButtonmir" style="float: left">
<input type="hidden" name="vin" />
<input type="hidden" name="apikey" />
<input type="hidden" name="companyName" />
<input type="hidden" name="appName" />
</form>
<br>
</body>
</html>