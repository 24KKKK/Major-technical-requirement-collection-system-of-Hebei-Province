<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>添加需求</title>

<script language="javascript">
	var mydate = new Date();
	mydate.toLocaleString(); //获取日期与时间
	var year = mydate.getFullYear();
	var month = mydate.getMonth(); //获取当前月份(0-11,0代表1月)
	var day = mydate.getDate();
	var hour = mydate.getHours(); // 0-23
	var minute = mydate.getMinutes();// 0-59
	var second = mydate.getSeconds();// 0-59
</script>

</head>
<body>

	<jsp:useBean id="db" class="DBBean.Bean" scope="page" />
	<%
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
		java.util.Date currentTime = new java.util.Date();//得到当前系统时间
		String str_date = formatter.format(currentTime); //将日期时间格式化  
		System.out.println(str_date);

		//获取保存或者提交按钮的value
		String btnname1 = request.getParameter("submit");
		System.out.println("第二个页面<%的" + btnname1);
		
		request.setCharacterEncoding("utf-8");
		String Iname=session.getAttribute("Iname").toString();
		System.out.println("Addxuqiu界面的Iname:"+Iname);
		String str = "select Iadd,Ifrdb,Iemail,Iyzbm,Iweb,Iclient,Igh,Iphone,Ifax from BaseInfo where Iname=" + "'"
				+ Iname + "'";
		ResultSet rs4 = db.executeQuery(str);
		rs4.next();
		String Iadd = rs4.getString("Iadd");
		String Ifrdb = rs4.getString("Ifrdb");
		String Iemail = rs4.getString("Iemail");
		String Iyzbm = rs4.getString("Iyzbm");
		String Iweb = rs4.getString("Iweb");
		String Iclient = rs4.getString("Iclient");
		String Igh = rs4.getString("Igh");
		String Iphone = rs4.getString("Iphone");
		String Ifax = rs4.getString("Ifax");

//		String Iname = (String) request.getParameter("Iname");

		String Ixqbelong = (String) request.getParameter("Ixqbelong");
//		String Iadd = (String) request.getParameter("Iadd");
		String Iszdy = (String) request.getParameter("Iszdy");
//		String Iweb = (String) request.getParameter("Iweb");
//		String Iemail = (String) request.getParameter("Iemail");
//		String Ifrdb = (String) request.getParameter("Ifrdb");
//		String Iyzbm = (String) request.getParameter("Iyzbm");
//		String Iclient = (String) request.getParameter("Iclient");
//		String Igh = (String) request.getParameter("Igh");
//		String Iphone = (String) request.getParameter("Iphone");
//		String Ifax = (String) request.getParameter("Ifax");
		String Ipeoprety = (String) request.getParameter("Ipeoprety");
		String Iintro = (String) request.getParameter("Iintro");
		String Ixqname = (String) request.getParameter("Ixqname");
		String Iyear1 = (String) request.getParameter("Iyear1");
		String Iyear2 = (String) request.getParameter("Iyear2");
		String Ixqrequest = (String) request.getParameter("Ixqrequest");
		String Ixqguanjian = (String) request.getParameter("Ixqguanjian");
		String Ixqmubiao = (String) request.getParameter("Ixqmubiao");
		String Igjz1 = (String) request.getParameter("Igjz1");
		String Igjz2 = (String) request.getParameter("Igjz2");
		String Igjz3 = (String) request.getParameter("Igjz3");
		String Igjz4 = (String) request.getParameter("Igjz4");
		String Igjz5 = (String) request.getParameter("Igjz5");
		String Izjze = (String) request.getParameter("Izjze");
		String Ihzms = (String) request.getParameter("Ihzms");
		String Icompany = (String) request.getParameter("Icompany");
		String Itype = (String) request.getParameter("Itype");
		String fir = (String) request.getParameter("fir");
		String sec = (String) request.getParameter("sec");
		String thi = (String) request.getParameter("thi");
		
		String sqlfir="select firstName from first where firstid="+"'"+fir+"'";
		System.out.println("sqlfir="+sqlfir);
		ResultSet rs1=db.executeQuery(sqlfir);
		rs1.next();
		String firname=rs1.getString("firstName");
		//System.out.println("firname="+firname);
		
		String sqlsec="select secondName from second where secondid="+"'"+sec+"'";
		System.out.println("sqlsec="+sqlsec);
		ResultSet rs2=db.executeQuery(sqlsec);
		rs2.next();
		String secname=rs2.getString("secondName");
		//System.out.println("secname="+secname);
		
		String sqlthi="select thirdName from third where thirdid="+"'"+thi+"'";
		System.out.println("sqlthi="+sqlthi);
		ResultSet rs3=db.executeQuery(sqlthi);
		rs3.next();
		String thiname=rs3.getString("thirdName");
		//System.out.println("thiname="+thiname);
		
		String[] check = request.getParameterValues("Ilingyu");
		String sumlingyu = ""; //把领域变成长字符串。
		if (check != null) {
			for (int i = 0; i < check.length; i++)
				sumlingyu = sumlingyu + check[i] + ",";
			System.out.println("需求技术所属领域：" + sumlingyu);
		}
		
		String Ixqyyhy = (String) request.getParameter("Ixqyyhy");

		String result = "";
		if (btnname1.equals("保存"))
			result = "已保存";
		else
			result = "已提交";
		System.out.println("result=" + result);

		//找出该设置Iname第几个需求的sql语句，比如前面有5个Iname的需求，现在该写Iname6了
		int numadd = 1;
		String Inamenum = "";
		String str_ChaNameNum = "select Iname from xuqiu where Iname like '" + Iname + "%'";
		System.out.println("str_ChaNameNum=" + str_ChaNameNum);
		ResultSet rs = db.executeQuery(str_ChaNameNum);
		while (rs.next()) {
			numadd++;
		}
		Inamenum = Iname + String.valueOf(numadd);
		System.out.println("Inamenum=" + Inamenum);

		String Insert = "insert into xuqiu values('" + Inamenum + "','" + Iname + "','" + Ixqbelong + "','" + Iadd
				+ "','" + Iszdy + "','" + Iweb + "','" + Iemail + "','" + Ifrdb + "','" + Iyzbm + "','" + Iclient
				+ "','" + Igh + "','" + Iphone + "','" + Ifax + "','" + Ipeoprety + "','" + Iintro + "','" + Ixqname
				+ "','" + Iyear1 + "','" + Iyear2 + "','" + Ixqrequest + "','" + Ixqguanjian + "','" + Ixqmubiao
				+ "','" + Igjz1 + "','" + Igjz2 + "','" + Igjz3 + "','" + Igjz4 + "','" + Igjz5 + "','" + Izjze
				+ "','" + Ihzms + "','" + Icompany + "','" + Itype + "','" + firname + "','" + secname + "','" + thiname + "','"
				+ sumlingyu + "','" + Ixqyyhy + "','" + result + "','" + str_date + "')";
		System.out.println("Insert:"+Insert);
		int i = db.executeUpdate(Insert);
		System.out.println(i);
		if (i == 1) {
			if (result.equals("已保存"))
				out.println("<script language='javaScript'>alert('保存成功，点击确定返回主页面！');</script>");
			else if (result.equals("已提交"))
				out.println("<script language='javaScript'>alert('提交成功，点击确定返回主页面！');</script>");
			response.setHeader("refresh", "1;url=Welcome.html");
		} else {
			out.println("<script language='javaScript'>alert('操作失败，点击确定返回原页面！');</script>");
			response.setHeader("refresh", "1;url=tianbao.jsp");
		}
		rs.close();
		db.close();
	%>
</body>
</html>