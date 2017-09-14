<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>技术审核未通过页面</title>
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
		System.out.println("jsshfailresult界面的Inamenum：" + Inamenum);
		String Iname = session.getAttribute("Iname").toString();
		System.out.println("jsshfailresult界面的Iname：" + Iname);
		
		String str_insertjssh="insert into jssh values('" + Iname + "','" + Inamenum + "','" + "技术审核未通过" + "','" + "" + "','" + str_date + "')";
		System.out.println("将未通过结果插入jssh的插入语句："+str_insertjssh);
		int j=db.executeUpdate(str_insertjssh);
		System.out.println("将未通过结果插入jssh的i："+j);
		
		String str = "update xuqiu set Iresult=" + "'" + "技术审核未通过" + "'"+" where Inamenum=" + "'" + Inamenum + "'";
		System.out.println("jsshfailresult修改技术审核需求结果的修改语句："+str);
		int i=db.executeUpdate(str);
		System.out.println("jsshfailresult修改技术审核需求结果的i："+i);
		if (i == 1) {
			response.setHeader("refresh", "0;url=formal_lyjs.jsp?Inamenum="+Inamenum);
		} else {
			out.println("<script language='javaScript'>alert('操作失败，点击确定返回原页面！');</script>");
			response.setHeader("refresh", "0;url=jsshenheindex.jsp");
		}
 		db.close();
	%>
</body>
</html>