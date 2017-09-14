
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>注册页面</title>

<script type="text/javascript">
	function check() {
		var flag = true;
		var Iname = document.getElementById("Iname").value;
		var Ipassword = document.getElementById("Ipassword").value;
		var Ipassword2 = document.getElementById("Ipassword2").value;
		var Iadd = document.getElementById("Iadd").value;
		var Ifrdb = document.getElementById("Ifrdb").value;
		var Iemail = document.getElementById("Iemail").value;
		var Iclient = document.getElementById("Iclient").value;
		var Igh = document.getElementById("Igh").value;
		var Iphone = document.getElementById("Iphone").value;
		var Iyzbm = document.getElementById("Iyzbm").value;
		if ("" == Iname) {
			alert("请输入机构全称！");
			flag = false;
			return false;
		} else if ("" == Ipassword) {
			alert("请输入密码！");
			flag = false;
			return false;
		} else if (Ipassword2 == "") {
			alert("请确认密码！");
			flag = false;
			return false;
		} else if (Ipassword2 != Ipassword) {
			alert("密码不一致");
			flag = false;
			return false;
		} else if (Iadd == "") {
			alert("请输入通讯地址！");
			flag = false;
			return false;
		} else if (Ifrdb == "") {
			alert("请输入法人代表！");
			flag = false;
			return false;
		} else if (Iemail == "") {
			alert("请输入邮箱！");
			flag = false;
			return false;
		} else if (Iclient == "") {
			alert("请输入联系人！");
			flag = false;
			return false;
		} else if (Igh == "") {
			alert("请输入固定电话！");
			flag = false;
			return false;
		}
		//		else if (Igh.length != 12) {
		// 			alert("固定电话号码应为12位阿拉伯数字！");
		// 			flag = false;
		// 			return false;
		// 		} else if (Iyzbm.length != 12) {
		// 			alert("固定电话号码应为12位阿拉伯数字！");
		// 			flag = false;
		// 			return false;
		// 		}

		/*  else if(Igh.match("^[0-9]*$"))
		{
		alert("固定电话号码应为12位阿拉伯数字！");
		flag=false;
		return false;
		}*/
		else if (Iphone.length != 11) {
			alert("手机号码为11位阿拉伯数字！");
			flag = false;
			return false;
		} else if (Iphone == "") {
			alert("手机号码为11位阿拉伯数字！");
			flag = false;
			return false;
		}
		/* else if(Iphone.match("^[0-9]*$"))
		{
		alert("手机号码为11位阿拉伯数字！");
		flag=false;
		return false;
		}*/

		if (flag == true) {
			//form.submit();  
			return true;
		}
	}
</script>
</head>

<body>
	<center>
		<font size="5">企业注册</font>
		<form name="form" method="post" action="AddUser.jsp">
			<table width="655" border="0">
				<tr>
					<td width="91" height="35" align="center">*机构全称</td>
					<td width="518" align="left"><input name="Iname" type="text"
						id="Iname" size="25" /></td>
				</tr>
				<tr>
					<td height="35" align="center">*密码</td>
					<td align="left"><input name="Ipassword" type="password"
						id="Ipassword" size="25" /></td>
				</tr>
				<tr>
					<td height="35" align="center">*确认密码</td>
					<td align="left"><input name="Ipassword2" type="password"
						id="Ipassword2" size="25" /></td>
				</tr>
				<tr>
					<td height="42" align="center">*通讯地址</td>
					<td align="left"><input name="Iadd" type="text" id="Iadd"
						size="50" /></td>
				</tr>
				<tr>
					<td height="36" align="center">*法人代表</td>
					<td align="left"><input name="Ifrdb" type="text" id="Ifrdb"
						size="25" /></td>
				</tr>
				<tr>
					<td height="38" align="center">*电子信箱</td>
					<td align="left"><input name="Iemail" type="text" id="Iemail"
						size="25" /></td>
				<tr>
					<td height="40" align="center">邮政编码</td>
					<td align="left"><input name="Iyzbm" type="text" id="Iyzbm"
						size="25" /></td>
				</tr>
				<tr>
					<td height="40" align="center">*单位网址</td>
					<td align="left"><input name="Iweb" type="text" id="Iweb"
						size="25" /></td>
				</tr>
				<tr>
					<td height="40" align="center">*联系人</td>
					<td align="left"><input name="Iclient" type="text"
						id="Iclient" size="25" /></td>
				</tr>
				<tr>
					<td height="40" align="center">*固话</td>
					<td align="left"><input name="Igh" type="text" id="Igh"
						size="25" /></td>
				</tr>
				<tr>
					<td height="40" align="center">*手机</td>
					<td align="left"><input name="Iphone" type="text" id="Iphone"
						size="25" /></td>
				</tr>
				<tr>
					<td height="40" align="center">传真</td>
					<td height="40" align="left"><input name="Ifax" type="text"
						id="Ifax" size="25" /></td>
				</tr>
			</table>
			<p>
				<input type="submit" name="Register" id="Register" value="注册"
					onclick="return check()">
			</p>
		</form>
	</center>
	<font size=4 color=red> 带*号的为必填项</font>

</body>
</html>