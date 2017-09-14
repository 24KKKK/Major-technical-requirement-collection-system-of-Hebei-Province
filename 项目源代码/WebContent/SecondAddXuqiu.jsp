<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改之后进行添加需求</title>

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
		String btnname1 = (String) request.getParameter("submit");
		System.out.println("SecondAddXuqiu界面的btnname1：" + btnname1);
		// 		String btnname2 = request.getParameter("submit");
		// 		System.out.println("第二个页面<%的" + btnname2);

		String Iname = (String) request.getParameter("Iname");
		String Ixqbelong = (String) request.getParameter("Ixqbelong");
		String Iadd = (String) request.getParameter("Iadd");
		String Iszdy = (String) request.getParameter("Iszdy");
		String Iweb = (String) request.getParameter("Iweb");
		String Iemail = (String) request.getParameter("Iemail");
		String Ifrdb = (String) request.getParameter("Ifrdb");
		String Iyzbm = (String) request.getParameter("Iyzbm");
		String Iclient = (String) request.getParameter("Iclient");
		String Igh = (String) request.getParameter("Igh");
		String Iphone = (String) request.getParameter("Iphone");
		String Ifax = (String) request.getParameter("Ifax");
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
		String Ixqyyhy = (String) request.getParameter("Ixqyyhy");
		String Inamenum = (String) request.getParameter("Inamenum");
		System.out.println("SecondAddXuqiu界面的Inamenum：" + Inamenum);

		String saveflag = (String) request.getParameter("saveflag"); //用于判断是从修改界面传过来的，然后再进行判断保证主码的一致性
		System.out.println("SecondAddXuqiu界面的saveflag：" + saveflag);

		String[] check = request.getParameterValues("Ilingyu");
		String sumlingyu = ""; //把领域变成长字符串。
		if (check != null) {
			for (int i = 0; i < check.length; i++)
				sumlingyu = sumlingyu + check[i] + ",";
			System.out.println("需求结合" + sumlingyu);
		}

		String result = "";
		if (btnname1.equals("保存"))
			result = "已保存";
		else
			result = "已提交";
		// 		if (btnname2 == "提交")
		// 			result = "已提交";
		// 		else
		// 			result = "已保存";
		System.out.println("SecondAddXuqiu界面的result=" + result);

		//如果是第一次填报，那么应该先生成主码，然后再进行插入
		if (saveflag.equals("填报")) {
			//找出该设置Iname第几个需求的sql语句，比如前面有5个Iname的需求，现在该写Iname6了，其实这里是确定了需求表的主码，格式为：石家庄1，石家庄2，石家庄3，。。。
			int numadd = 1;
			Inamenum = "";
			String str_ChaNameNum = "select Iname from xuqiu where Iname like '" + Iname + "%'";
			System.out.println("str_ChaNameNum=" + str_ChaNameNum);
			ResultSet rs = db.executeQuery(str_ChaNameNum);
			while (rs.next()) {
				numadd++;
			}
			Inamenum = Iname + String.valueOf(numadd);
			System.out.println("Inamenum=" + Inamenum);
			rs.close();
		}

		//如果是保存再编辑进行保存，那么应该删除原来的填报，但是还应该用原来的主码，所以不需要再生成主码，而是删除原来的，再进行插入
		else if (saveflag.equals("编辑保存")) {
			//当用户保存-修改-保存时，原有的insert应该变为update，但由于update的sql语句会特别长，所以直接将原来的记录删除，然后重新插入最新的记录，这样则把第一次填报的插入和第二次修改的更新合并为了一个插入，而只需要在前面先进行一次删除即可。
			String str_del = "delete from xuqiu where Inamenum=" + "'" + Inamenum + "'";
			int i_del = db.executeUpdate(str_del);
			System.out.println("SecondAddXuqiu界面的i_del,是否删除成功：" + i_del);
		}

		//将第一次填报进行的插入和保存-修改-保存进行的更新合并为了同一个插入，根据上面的删除操作
		String Insert = "insert into xuqiu values('" + Inamenum + "','" + Iname + "','" + Ixqbelong + "','" + Iadd
				+ "','" + Iszdy + "','" + Iweb + "','" + Iemail + "','" + Ifrdb + "','" + Iyzbm + "','" + Iclient
				+ "','" + Igh + "','" + Iphone + "','" + Ifax + "','" + Ipeoprety + "','" + Iintro + "','" + Ixqname
				+ "','" + Iyear1 + "','" + Iyear2 + "','" + Ixqrequest + "','" + Ixqguanjian + "','" + Ixqmubiao
				+ "','" + Igjz1 + "','" + Igjz2 + "','" + Igjz3 + "','" + Igjz4 + "','" + Igjz5 + "','" + Izjze
				+ "','" + Ihzms + "','" + Icompany + "','" + Itype + "','" + fir + "','" + sec + "','" + thi + "','"
				+ sumlingyu + "','" + Ixqyyhy + "','" + result + "','" + str_date + "')";
		int i = db.executeUpdate(Insert);
		System.out.println("SecondAddXuqiu界面的i,是否插入成功：" + i);
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
		db.close();
	%>
</body>
</html>