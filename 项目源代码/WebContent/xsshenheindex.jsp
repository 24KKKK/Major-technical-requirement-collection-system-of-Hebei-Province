<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>形式审核主界面</title>
</head>
<body>
	形式审核主界面
	<form name="form1" id="form1" action="">
		<table border="1" width="900" name="table1" id="table1">
			<tr>
				<td>需求编号</td>
				<td>单位名称</td>
				<td>需求名称</td>
				<!-- 				<td>需求状态</td> -->
				<td>操作</td>
			</tr>
			<jsp:useBean id="db" class="DBBean.Bean" scope="page" />
			<%
				String Inamenum = "";
				String Iname = "";
				String Ixqname = "";
				//String Iname = session.getAttribute("Iname").toString();

				//				System.out.println("需求管理界面的：" + Iname);
				String sql = "select Inamenum,Iname,Ixqname from xuqiu where Iresult='已提交'";
				ResultSet rs = db.executeQuery(sql);
				while (rs.next()) {
					//System.out.println(rs.getString(1)); //可以输出Inamenum的所有值  比如Iname为图书馆  那么输出图书馆1  图书馆2  图书馆3
					Inamenum = rs.getString(1);
					Iname = rs.getString(2);
					Ixqname = rs.getString(3);
					out.println("<tr><td>" + Inamenum + "</td><td>" + Iname + "</td><td>" + Ixqname
							+ "</td><td><a href='xssh.jsp?Inamenum=" + Inamenum + "'>形式审核</a></td></tr>");
				}
				rs.close();
				db.close();
			%>
		</table>
	</form>
</body>
</html>