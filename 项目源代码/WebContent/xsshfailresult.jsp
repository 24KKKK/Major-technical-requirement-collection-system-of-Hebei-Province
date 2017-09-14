<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>形式审核未通过页面</title>
</head>
<body>

	<jsp:useBean id="db" class="DBBean.Bean" scope="page" />
	<%
	request.setCharacterEncoding("utf-8");
	
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
	java.util.Date currentTime = new java.util.Date();//得到当前系统时间
	String str_date = formatter.format(currentTime); //将日期时间格式化  
	System.out.println(str_date);

		String Inamenum = (String) request.getParameter("Inamenum");
		System.out.println("xsshfailresult界面的Inamenum：" + Inamenum);
		String Iname = session.getAttribute("Iname").toString();
		System.out.println("xsshfailresult界面的Iname：" + Iname);
		
		String str_insertxssh="insert into xssh values('" + Iname + "','" + Inamenum + "','" + "形式审核未通过" + "','" + "" + "','" + str_date + "')";
		System.out.println("将未通过结果插入xssh的插入语句："+str_insertxssh);
		int j=db.executeUpdate(str_insertxssh);
		System.out.println("将未通过结果插入xssh的i："+j);
		
		String str = "update xuqiu set Iresult=" + "'" + "形式审核未通过" + "'"+" where Inamenum=" + "'" + Inamenum + "'";
		System.out.println("xsshfailresult修改形式审核需求结果的修改语句："+str);
		int i=db.executeUpdate(str);
		System.out.println("xsshfailresult修改形式审核需求结果的i："+i);
		if (i == 1) {
			response.setHeader("refresh", "0;url=formal_ly.jsp?Inamenum="+Inamenum);
		} else {
			out.println("<script language='javaScript'>alert('操作失败，点击确定返回原页面！');</script>");
			response.setHeader("refresh", "0;url=xsshenheindex.jsp");
		}
 		db.close();
	%>
</body>
</html>