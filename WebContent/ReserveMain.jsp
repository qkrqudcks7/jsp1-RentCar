<%@page import="model.CarListBean"%>
<%@page import="java.util.Vector"%>
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
<center>
<!-- DB�� �����Ͽ� �ֽż� �ڵ��� 3�븸 �ѷ��ִ� �����͸� ������ -->
<%
	RentcarDAO r= new RentcarDAO();
	// ���͸� �̿��Ͽ� �����͸� ����
	Vector<CarListBean> v =r.getSelectCar();
%>
<table width=1000>
<tr height=100>
	<td align="center" colspan="3">
	<font size=6 color="gray">�ֽ��� �ڵ���</font>
	</td>
</tr>
<tr height=240>
<%
	for(int i=0;i<v.size();i++){
		CarListBean bean=v.get(i);

%>
	<td width=333 align="center">
		<a href="RentMain.jsp?Center=CarReserveInfo.jsp?num=<%=bean.getNum()%>">
		<img alt="" src="img/<%=bean.getImg() %>" width=300 height=200>
		</a>
		<p>������ : <%=bean.getName() %>
	</td>
<%
	}
%>
</tr>
</table>
<br><br>
<form action="RentMain.jsp?Center=CarCategoryList.jsp" method="post">
<font size=3 color="gray"><b>���� �˻��ϱ�</b></font>&nbsp;&nbsp;
<select name="category">
	<option value="1">����</option>
	<option value="2">����</option>
	<option value="3">����</option>
</select>&nbsp;&nbsp;
<input type="submit" value="�˻�">&nbsp;&nbsp;
</form>
<button onclick="location.href='CarAllList.jsp'">��ü�˻�</button>
</center>
</body>
</html>