<%@page import="model.CarListBean"%>
<%@page import="model.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	int num=Integer.parseInt(request.getParameter("num"));
	RentcarDAO r = new RentcarDAO();
	CarListBean bean=r.getOneCar(num);
	
	int category=bean.getCategory();
	String temp="";
	if(category==1)temp="����";
	else if(category==2)temp="����";
	else if(category==3)temp="����";
%>
<center>
<form action="RentMain.jsp?Center=CarOption.jsp" method="post">
<table width=1000>
<tr height=100>
	<td align="center" colspan="3">
	<font size=6 color="gray"><%=bean.getName() %> �����ϱ�</font>
	</td>
</tr>
<tr>
	<td rowspan="6" width=500>
	<img alt="" src="img/<%=bean.getImg()%>" width=450>
	</td>
	<td width=250 align="center">�����̸�</td>
	<td width=250 align="center"><%=bean.getName() %></td>
</tr>
<tr>
	<td width=250 align="center">��������</td>
	<td width=250 align="center"><select name="qty">
	<option value=1>1</option>
	<option value=2>2</option>
	<option value=3>3</option>
	</select></td>
</tr>
<tr>
	<td width=250 align="center">�����з�</td>
	<td width=250 align="center"><%=temp %></td>
</tr>
<tr>
	<td width=250 align="center">�뿩����</td>
	<td width=250 align="center"><%=bean.getPrice() %>����</td>
</tr>
<tr>
	<td width=250 align="center">����ȸ��</td>
	<td width=250 align="center"><%=bean.getCompany() %></td>
</tr>
<tr>
	<td align="center" colspan="2">
	<input type="hidden" name="num" value=<%=bean.getNum() %>>
	<input type="hidden" name="img" value=<%=bean.getImg() %>>
	<input type="submit" value="�ɼ� ���� �� �����ϱ�">
	</td>
</tr>
</table>
<br><br><br>
<font size=5 color="gray">���� ���� ����</font>
<p><%=bean.getInfo() %>
</form>
</center>
</body>
</html>