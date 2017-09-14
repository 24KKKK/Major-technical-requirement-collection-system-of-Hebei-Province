<%@ page language="java" contentType="text/html; charset=utf-8"
	import="java.sql.*" import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登录验证</title>
</head>
<body>
	<jsp:useBean id="db1" class="DBBean.Bean" scope="page" />

	<%
		request.setCharacterEncoding("utf-8");
		String Iname = (String) request.getParameter("user");
		System.out.print("登陆验证界面的Iname:" + Iname);
		String Ipassword = (String) request.getParameter("pwd");
		System.out.print("登陆验证界面的Ipassword:" + Ipassword);
		//先验证是否为形式审核员或者技术审核员，如果都不是再判断是不是普通用户
		if (Iname.equals("xsadmin")&& Ipassword.equals("xsadmin")) {
			session.setAttribute("Iname", Iname);
			response.sendRedirect("xsadminmain.jsp?Iname=" + Iname);
		}
		
		else if (Iname.equals("jsadmin")&& Ipassword.equals("jsadmin")) {
			session.setAttribute("Iname", Iname);
			response.sendRedirect("jsadminmain.jsp?Iname=" + Iname);
		}
		else{
			String sql = "select Iname,Ipassword from BaseInfo";
			ResultSet rs = db1.executeQuery(sql);
			while (rs.next()) {
				String name=rs.getString(1);
				String password=rs.getString(2);
				if (Iname.equals(name) && Ipassword.equals(password)) {
					session.setAttribute("Iname", Iname);
					response.sendRedirect("main.jsp?Iname=" + Iname);
				}
			}
			out.print("<script language='javaScript'> alert('用户名或密码错误，请重新输入');</script>");
			response.setHeader("refresh", "0;url=Login.html");
			rs.close();
		}
		db1.close();
	%>
</body>

</html>