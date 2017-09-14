<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>提交技术审核意见</title>
</head>

<body>

	<jsp:useBean id="db" class="DBBean.Bean" scope="page" />
	<%
		request.setCharacterEncoding("utf-8");
		String submit = request.getParameter("submit");
		//String RequirementID=(String)request.getParameter("RequirementID");
		//String RequirementID = new String((session.getAttribute("RequirementID")).toString());
		//String Zt=(String)request.getParameter("njy");
		String ly = (String) request.getParameter("ly");
		String Inamenum = (String) request.getParameter("Inamenum");
		System.out.println("formal_lycheckjs页面的Inamenum" + Inamenum);
		System.out.println("formal_lycheckjs页面的ly" + ly);
		if (submit != null) {
			String s = "update jssh set jsreason=" + "'" + ly + "'" + " where Inamenum=" + "'" + Inamenum + "'";
			int i = db.executeUpdate(s);
			if (i == 1) {
				//out.println("<script language='javaScript'> alert('在线填报提交成功！');</script>");
				response.setHeader("refresh", "0;url=jsshenheindex.jsp");
			} else {
				out.println("<script language='javaScript'> alert('在线填写技术审核意见失败，请重新填写！');</script>");
				response.setHeader("refresh", "0;url=formal_lyjs.jsp");
			}
		}
		db.close();
	%>
</body>
</html>
