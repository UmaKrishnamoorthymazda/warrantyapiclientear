<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page	language="java" contentType="text/html; charset=ISO-8859-1"	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<html>
<head>
<title>MGWSWarrantyService Client</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<%= request.getContextPath() %>/MGWSWarrantyService.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
function validate(){
 var vin = document.getElementById('vinId').value;
 var key = document.getElementById('keyId').value;
 var company = document.getElementById('companyId').value;
 var appName = document.getElementById('appId').value;
 if( myTrim(vin) == '' || myTrim(key) == '' || myTrim(company) == '' || myTrim(appName) == ''){
   alert('Please enter all the fields (VIN/API KEY/Company Name/Application Name)');    
   return;
 }else{
 document.forms[0].submit();
 }
}

function myTrim(x) {
    return x.replace(/^\s+|\s+$/gm,'');
}

</script>
<style type="text/css">
fieldset{ 
  border: #888888 1px solid;
  width: 100%;
  margin:10%;
}
</style>
</head>
<body >
<h4 class="logout" style="text-align:center;font-size: 14px;">MGWS API TEST</h4>
<fieldset>
<br>
		<form name="form2" action="MGWSAPITest">
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
		<table border="0" width="100%" cellpadding="2" cellspacing="0">
		<tr><th align="right" width="50%"valign="middle" class="form-label">VIN :&nbsp;</th>
			<td align="left" width="50%"><input type="text" name="vin" id="vinId" value="<%=vin %>" styleClass="wizardTextBox" /></td></tr>
		<tr><th align="right" width="50%"valign="middle" class="form-label">API KEY :&nbsp;</th>
			<td align="left" width="50%"><input type="text" name="apikey" id="keyId" value="<%=apikey %>" styleClass="wizardTextBox" style="width:270px"/></td></tr>
		<tr><th align="right" width="50%"valign="middle" class="form-label">Company Name :&nbsp;</th>
			<td align="left" width="50%"><input type="text" name="companyName" id="companyId" value="<%=companyName %>" styleClass="wizardTextBox" /></td></tr>
		<tr><th align="right" width="50%"valign="middle" class="form-label">Application Name :&nbsp;</th>
			<td align="left" width="50%"><input type="text" name="appName" value="<%=appName %>" id="appId" styleClass="wizardTextBox" style="width:270px"/></td></tr>
		<tr><th align="right" width="50%"valign="middle" class="form-label">Output Format:&nbsp;</th>
		<td align="left" width="30%" calss="ContentColTitle">XML<input type="radio" class="ContentColTitle" name="output" value="X" id="appId" checked/>&nbsp;&nbsp;JSON <input type="radio" name="output" value="J" id="appId"/></td></tr>
		<tr><th align="right" width="50%"valign="middle" class="form-label"></th><td align="left"><input type="button" value="Submit" onclick="validate();" class="wizardButtonmir" ></td></tr>
		
		</table>			
		</form>
</fieldset>
</body>
</html>