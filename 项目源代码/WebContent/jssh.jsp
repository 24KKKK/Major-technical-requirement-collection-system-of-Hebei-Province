<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>技术审核查看已通过形式审核界面</title>
<!-- 去掉文本域右下角的拖动 -->
<style type="text/css">
textarea {
	resize: none;
}
</style>

</head>

<script type="text/javascript">
	if (window.ActiveXObject && !window.XMLHttpRequest) {
		window.XMLHttpRequest = function() {
			return new ActiveXObject((navigator.userAgent.toLowerCase()
					.indexOf('msie 6') != -1) ? 'Microsoft.XMLHTTP'
					: 'Msxml2.XMLHTTP');
		};
	}//取得XMLHttpRequest对象 
	var req;
	var flagSelect;
	// 	function testName(flag, value)//使用Ajax访问服务器
	// 	{
	// 		flagSelect = flag; //标记一下当前是选择省,还是选择市
	// 		req = new XMLHttpRequest();
	// 		if (req) {
	// 			req.onreadystatechange = setValue;
	// 		}
	// 		req.open('POST', "getinfo.jsp?flag=" + flag + "&value=" + value);//把参数带到服务器中
	// 		req.setRequestHeader('Content-Type',
	// 				'application/x-www-form-urlencoded');
	// 		req.send(null);
	// 	}
	// 	function setValue() {
	// 		if (req.readyState == 4)//访问到服务器
	// 		{
	// 			if (req.status == 200)//正确返回
	// 			{
	// 				if (flagSelect == "1")//如果选择某个省要更新市和区
	// 				{
	// 					var v = req.responseText.split("||");//req.responseText是服务器返回来的字符串
	// 					paint(document.all("sec"), v[0]);//更新市下拉框
	// 					paint(document.all("thi"), v[1]);//更新区下拉框
	// 				}
	// 				if (flagSelect == "2")//如果选择某市,只需改变区
	// 				{
	// 					var v = req.responseText;//req.responseText是服务器返回来的字符串
	// 					paint(document.all("thi"), v);//更新区下拉框
	// 				}
	// 			}
	// 		}
	// 	}
	// 	function paint(obj, value)//根据一对数据去更新一个下拉框
	// 	{
	// 		var ops = obj.options;
	// 		var v = value.split(";");//得到一些数据,(修改过了..)
	// 		while (ops.length > 0)//先清空原来的数据
	// 		{
	// 			ops.remove(0);
	// 		}
	// 		for (var i = 0; i < v.length - 1; i++)//把新得到的数据显示上去
	// 		{
	// 			var o = document.createElement("OPTION");//创建一个option把它加到下拉框中
	// 			o.value = v[i].split(",")[0];
	// 			o.text = v[i].split(",")[1];
	// 			ops.add(o);
	// 		}
	// 	}
	//判断是否选择的基础研究，然后隐藏后面的行列
	// 	function check_jichu() {
	// 		var jichu = document.getElementsByName("Itype"); //学科分类  领域  lingyu1  lingyu2  行业  应用行业
	// 		if (jichu[0].checked == true) {
	// 			document.getElementById("table2").style.display = "none"

	// 		} else if (jichu[1].checked == true || jichu[2].checked == true
	// 				|| jichu[3].checked == true || jichu[4].checked == true) {
	// 			document.getElementById("table2").style.display = "block"
	// 		}
	// 	}
</script>

<body>
	<jsp:useBean id="db" class="DBBean.Bean" scope="page" />
	<%
		request.setCharacterEncoding("UTF-8");

		String Inamenum = (String) request.getParameter("Inamenum");
		String url = "select Iname,Ixqbelong,Iadd,Iszdy,Iweb,Iemail,Ifrdb,Iyzbm,Iclient,Igh,Iphone,Ifax,Ipeoprety,Iintro,Ixqname,Iyear1,Iyear2,Ixqrequest,Ixqguanjian,Ixqmubiao,Igjz1,Igjz2,Igjz3,Igjz4,Igjz5,Izjze,Ihzms,Icompany,Itype,fir,sec,thi,Ilingyu,Ixqyyhy,Iyear from xuqiu where Inamenum="
				+ "'" + Inamenum + "'";
		ResultSet rs = db.executeQuery(url);
		rs.next();

		String Iname = rs.getString(1);
		String Ixqbelong = rs.getString(2);
		String Iadd = rs.getString(3);
		String Iszdy = rs.getString(4);
		String Iweb = rs.getString(5);
		String Iemail = rs.getString(6);
		String Ifrdb = rs.getString(7);
		String Iyzbm = rs.getString(8);
		String Iclient = rs.getString(9);
		String Igh = rs.getString(10);
		String Iphone = rs.getString(11);
		String Ifax = rs.getString(12);
		String Ipeoprety = rs.getString(13);
		String Iintro = rs.getString(14);
		String Ixqname = rs.getString(15);
		String Iyear1 = rs.getString(16);
		String Iyear2 = rs.getString(17);
		String Ixqrequest = rs.getString(18);
		String Ixqguanjian = rs.getString(19);
		String Ixqmubiao = rs.getString(20);
		String Igjz1 = rs.getString(21);
		String Igjz2 = rs.getString(22);
		String Igjz3 = rs.getString(23);
		String Igjz4 = rs.getString(24);
		String Igjz5 = rs.getString(25);
		String Izjze = rs.getString(26);
		String Ihzms = rs.getString(27);
		String Icompany = rs.getString(28);
		String Itype = rs.getString(29);
		String fir = rs.getString(30);
		String sec = rs.getString(31);
		String thi = rs.getString(32);
		String Ilingyu = rs.getString(33);
		String Ixqyyhy = rs.getString(34);
		String year = rs.getString(35);

		System.out.println("jssh界面的Iname：" + Iname);
		System.out.println("jssh界面的Inamenum：" + Inamenum);

		rs.close();
	%>
	<form id="form2" method="post" action="jsshresult.jsp">
		<table width="900" border="1" align="center">
			<tr>
				<td align="center"><table width="900" border="1" align="center">
						<caption>
							<font size=5>河北省重大需求征集表</font>
						</caption>
						<tr>
							<td width="110" align="center">机构全称</td>
							<td colspan="3" align="left"><%=Iname%></td>
							<td width="140" align="center">归口管理部门</td>
							<td colspan="2" width="168" align="left"><%=Ixqbelong%></td>
						</tr>
						<tr>
							<td align="center">通讯地址</td>
							<td colspan="3" align="left"><%=Iadd%></td>
							<td width="140" align="center">所在地域</td>
							<td colspan="2" align="left"><%=Iszdy%></td>
						</tr>
						<tr>
							<td align="center">网址</td>
							<td colspan="3" align="left"><%=Iweb%></td>
							<td width="140" align="center">电子信箱</td>
							<td colspan="2" align="left"><%=Iemail%></td>
						</tr>
						<tr>
							<td align="center">法人代表</td>
							<td colspan="3" align="left"><%=Ifrdb%></td>
							<td align="center">邮政编码</td>
							<td colspan="2" align="left"><%=Iyzbm%></td>
						</tr>
						<tr>
							<td height="101" rowspan="2" align="center">联系人</td>
							<td height="101" colspan="2" rowspan="2" align="left"><%=Iclient%></td>
							<td width="155" align="center">电话</td>
							<td colspan="3" align="left" nowrap="nowrap"><p>
									1：固话
									<%=Igh%>
								</p>
								<p>
									2：手机
									<%=Iphone%>
								</p></td>
						</tr>
						<tr>
							<td align="center">传真</td>
							<td colspan="3" align="left" nowrap="nowrap"><%=Ifax%></td>
						</tr>
						<tr>
							<td align="center">机构属性</td>
							<td colspan="6" align="left"><%=Ipeoprety%></td>
						</tr>
						<tr>
							<td align="center">机构简介</td>
							<td colspan="6" align="left"><%=Iintro%></td>
						</tr>
						<tr>
							<td align="center">技术需求名称</td>
							<td colspan="3" align="left"><%=Ixqname%></td>
							<td align="center">*需求时限</td>
							<td colspan="2" align="center"><p>
									<%=Iyear1%>
									年至
									<%=Iyear2%>
									年
								</p></td>
						</tr>
						<tr>
							<td height="122" align="center"><p>*技术需求概述主要问题</p>
							<td colspan="6" align="left"><%=Ixqrequest%></td>
						</tr>
						<tr>
							<td height="122" align="center"><p>*需求技术关键</p>
							<td colspan="6" align="left"><%=Ixqguanjian%></td>
						</tr>
						<tr>
							<td height="122" align="center"><p>*技术需求概述预期目标</p>
							<td colspan="6" align="left"><%=Ixqmubiao%></td>
						</tr>
						<tr>
							<td align="center">关键字</td>
							<td colspan="6" align="center"><%=Igjz1%>,<%=Igjz2%>,<%=Igjz3%>,<%=Igjz4%>,<%=Igjz5%></td>
						</tr>
						<tr>
							<td align="center"><p>拟投入资金总额</p></td>
							<td colspan="5" align="left"><%=Izjze%> 万元</td>
						</tr>
						<tr>
							<td align="center"><p>技术需求解决方式</p></td>
							<td colspan="6" align="left"><%=Ihzms%></td>
						</tr>
						<tr>
							<td align="center">合作意向单位</td>
							<td colspan="5" align="left"><%=Icompany%></td>
						</tr>
						<tr>
							<td align="center">*科技活动类型</td>
							<td colspan="6" align="center"><%=Itype%></td>
						</tr>
						<table border="1" name="table2" id="table2">
							<tr id="学科分类">
								<td width="110" align="center">学科分类</td>
								<td><%=fir%>,<%=sec%>,<%=thi%></td>
							</tr>
							<tr id="所属领域">
								<td width="110" align="center"><p id="领域">需求技术所属领域(非基础研究填写)</p></td>
								<td colspan="6" align="center" id="lingyu"><%=Ilingyu%></td>
							</tr>
							<tr id="应用行业">
								<td width="110" align="center"><p id="行业">需求技术应用行业(非基础研究填写)</p></td>
								<td colspan="6" align="left"><%=Ixqyyhy%></td>
							</tr>
						</table>
					</table> <!-- 					<input type="hidden" name="saveflag" value="编辑保存" />  -->
					<input type="hidden" name="Inamenum" value=<%=Inamenum%>></td>
			</tr>
		</table>
		<center>
			<input type="submit" name="submit" id="submit" value="通过"
				onclick="this.form.action='jsshsuccresult.jsp';this.form.submit();" />
			<input type="submit" name="submit" id="submit" value="不通过"
				onclick="this.form.action='jsshfailresult.jsp';this.form.submit();" />
		</center>
	</form>
	<%
		rs.close();
		db.close();
	%>

</body>
</html>
