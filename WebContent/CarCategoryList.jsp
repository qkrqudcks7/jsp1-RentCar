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
<table width=1000>
<%
	// ī�װ� �з����� �޾ƿ�
	int category=Integer.parseInt(request.getParameter("category"));
	RentcarDAO r = new RentcarDAO();
	Vector<CarListBean> v= r.getCategory(category);
	
	// tr�� 3���� �����ְ� �ٽ� tr�� ������ �� �ֵ��� �ϴ� ���� ����
	int j=0;
	for(int i=0;i<v.size();i++){
		CarListBean bean=v.get(i);
		if(j%3==0){
%>
			<tr height=220>
<%
		}
%>
				<td width=333 align="center">
				<a href="RentMain.jsp?Center=CarReserveInfo.jsp?num=<%=bean.getNum()%>">
				<img alt="" src="img/<%=bean.getImg()%>" width=300 height=200>
				</a>
				<p>
				<font size=3 color="gray">������ : <%=bean.getName() %></font>
<%		
			j+=1; //j�� �������� 3������ �����ش�.

	}
%>
</table>
</center>
</body>
</html>