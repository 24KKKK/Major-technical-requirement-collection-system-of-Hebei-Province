<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>需求管理</title>
</head>
<body>
	需求管理
	<form name="form1" id="form1" action="">
		<table border="1" width="900" name="table1" id="table1">
			<tr>
				<td>需求编号</td>
				<td>需求名称</td>
				<td>需求状态</td>
				<!-- 				<td>原因</td> -->
				<td>操作</td>
			</tr>
			<jsp:useBean id="db" class="DBBean.Bean" scope="page" />
			<%
				String Inamenum = "";
				String Iresult = "";
				String Ixqname = "";
				String Iname = session.getAttribute("Iname").toString();
// 				String xsreason="";
// 				String sql2="";//用来查询未通过的原因，用于显示原因

				//				System.out.println("需求管理界面的：" + Iname);
				String sql = "select Inamenum,Iresult,Ixqname from xuqiu where Iname=" + "'" + Iname + "'";
				//String sql2="select Iresult where"
				ResultSet rs = db.executeQuery(sql);
				while (rs.next()) {
					//System.out.println(rs.getString(1)); //可以输出Inamenum的所有值  比如Iname为图书馆  那么输出图书馆1  图书馆2  图书馆3
					Inamenum = rs.getString(1);
					Iresult = rs.getString(2);
					Ixqname = rs.getString(3);
					
 					
					
					out.println("<tr><td>" + Inamenum + "</td><td>" + Ixqname + "</td><td>" + Iresult + 
//							"</td><td>" + xsreason+
							"</td><td><a href='del.jsp?Inamenum=" + Inamenum
							+ "'>删除</a>&nbsp;<a href='saveedit.jsp?Inamenum=" + Inamenum + "'>修改</a></td></tr>");
				}
				
// 				sql2="select xsreason from xssh where Inamenum="+"'"+Inamenum+"'";
// 				ResultSet rs2=db.executeQuery(sql2);
// 				while(rs2.next()){
// 						xsreason=rs2.getString(1);
// 						System.out.println("xqmanage界面的xsreason："+xsreason);
// 					}
				rs.close();
				db.close();
			%>
		</table>
	</form>
</body>
</html>