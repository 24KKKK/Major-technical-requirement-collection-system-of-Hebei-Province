<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<title>填写形式审核不通过的原因</title>
<style type="text/css">
input.full {
	width: 100%;
	height: 100%;
}

option.afull {
	width: 100%;
	height: 100%;
}
</style>
<style type="text/css">
table {
	border-collapse: collapse;
	border: none;
	margin: 0px auto;
	width: 500px;
}

span {
	color: #ff0000;
}

th, td {
	border: solid #333 1px;
	height: 20px;
}

div {
	text-align: center;
}
</style>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}

em {
	color: #3F0;
}

body {
	font-family: Verdana;
	font-size: 14px;
	margin: 0;
}

#container {
	margin: 0 auto;
	width: 910px;
}

#header {
	height: 206px;
	background: #6cf;
	margin-bottom: 5px;
}

#menu {
	height: 20px;
	background: lightgray;
	margin-bottom: 5px;
}

#mainContent {
	height: 500px;
	margin-bottom: 5px;
}

#content {
	margin: 0 245px !important;
	margin: 0 245px;
	height: 500px;
	background-image: url(images/1.jpg);
}

#footer {
	height: 40px;
	background: lightgray;
}
</style>
</head>
<script language="javascript"> 
//形式审核意见限制100字***********************************************************************************************************
function countChar(textareaName,spanName) 
{ 
	document.getElementById(spanName).innerHTML = 100 - document.getElementById(textareaName).value.length; 
	if(document.getElementById(spanName).innerHTML==0)
	{
		alert("形式审核意见不能超过100字！");
		document.getElementById("ly").disabled=true;
	}
	else
		document.getElementById("ly").disabled=false;
}
</script>
<body>
	<br />
	<br />
	<br />
	<br />
	<br />
	<%
String Inamenum=(String)request.getParameter("Inamenum");
	System.out.println("formal_ly页面的Inamenum:"+Inamenum);
%>
	<h1 align="center" class="one">形式审核意见</h1>
	<br />
	<form name="homeForm" method="post" action="formal_lycheck.jsp">
		<table>
			<tr>
				<td colspan="5"><span class="xing">*</span>请简单填写一下对该重大技术征集表的形式审核意见（限100字以内）</td>
			</tr>
			<tr>
				<td style="height: 100px;" colspan="5">当前可以输入<span id="counter">100</span>字<br />
					<textarea rows="6" cols="120" style="resize: none;" id="ly"
						name="ly" onkeydown='countChar("ly","counter");'
						onkeyup='countChar("ly","counter");'></textarea></td>
			</tr>
			<input type="hidden" name="Inamenum" value=<%=Inamenum %>></input>
		</table>
		<br />
		<center>

			<input type="submit" name="submit" value="提交"
				style="width: 100px; height: 30px; color: #BC8F8F"></input>
	</form>
	</center>
</body>
</html>