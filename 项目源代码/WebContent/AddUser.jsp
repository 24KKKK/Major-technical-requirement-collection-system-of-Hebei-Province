<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>添加注册</title>
</head>
<body>
	<jsp:useBean id="db" class="DBBean.Bean" scope="page" />
	<%
		String Iname = (String) request.getParameter("Iname");
		String Ipassword = (String) request.getParameter("Ipassword");
		String Ipassword1 = (String) request.getParameter("Ipassword2");
		String Iadd = (String) request.getParameter("Iadd");
		String Ifrdb = (String) request.getParameter("Ifrdb");
		String Iemail = (String) request.getParameter("Iemail");
		String Iyzbm = (String) request.getParameter("Iyzbm");
		String Iweb = (String) request.getParameter("Iweb");
		String Iclient = (String) request.getParameter("Iclient");
		String Igh = (String) request.getParameter("Igh");
		String Iphone = (String) request.getParameter("Iphone");
		String Ifax = (String) request.getParameter("Ifax");

		String s = "select Iname from BaseInfo";
		ResultSet rs = db.executeQuery(s);

		while (rs.next()) {
			if (Iname.equals(rs.getString(1))) {
				out.print("<script language='javaScript'> alert('用户名已存在，直接登录');</script>");
				response.setHeader("refresh", "0;url=Login.html");
			}
		}

		if (Ipassword.equals("")) {
			out.print("<script language='javaScript'> alert('密码不能为空');</script>");
			response.setHeader("refresh", "0;url=Register.jsp");
		}

		else if (Ipassword.equals(Ipassword1)) {
			String Insert = "Insert into BaseInfo values (" + "'"+ Iname + "'"+","+"'" + Ipassword 
					+ "'"+","+"'" + Iadd + "'"+","+"'" + Ifrdb + "'"+","+"'" 
			+ Iemail + "'"+","+"'" + Iyzbm + "'"+","+"'" + Iweb + "'"+","+"'" 
			+ Iclient + "'"+","+"'" + Igh + "'"+","+"'" + Iphone + "'"+","+"'" 
					+ Ifax+"'"+")";
			System.out.println("AddUser的Insert:"+Insert);
			int i = db.executeUpdate(Insert);
			if (i == 1) {
				out.print("<script language='javaScript'> alert('注册成功，返回登录页面');</script>");
				response.setHeader("refresh", "0;url=Login.html");
			}
		} else {
			out.print("<script language='javaScript'> alert('密码不一致，重新注册');</script>");
			response.setHeader("refresh", "0;url=Register.jsp");
		}
		db.close();
	%>
</body>
</html>