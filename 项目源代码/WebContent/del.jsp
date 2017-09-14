<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" pageEncoding="utf-8"%>
<html>
<head>
<title>删除需求</title>
</head>
<body>
	<jsp:useBean id="db" class="DBBean.Bean" scope="page" />
	<%
		request.setCharacterEncoding("utf-8");

		String Inamenum = request.getParameter("Inamenum");
		String str_del = "delete from xuqiu where Inamenum=" + "'" + Inamenum + "'";
		int i = db.executeUpdate(str_del);
		System.out.println("delete from xuqiu where Inamenum=" + Inamenum);
		if (i == 1) {
			out.println("<script language='javaScript'> alert('删除成功，点击确定后自动跳到需求管理页面！');</script>");
			response.setHeader("refresh", "1;url=xqmanage.jsp");
		} else {
			out.println("<script language='javaScript'> alert('删除失败，点击确定后自动跳到需求管理页面！');</script>");
			response.setHeader("refresh", "1;url=xqmanage.jsp");
		}
		db.close();
	%>
</body>
</html>
