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
<tr height=100>
	<td align="center" colspan="3">
	<font size=6 color="gray">전체 렌트카 보기</font>
	</td>
</tr>

<%
	RentcarDAO r = new RentcarDAO();
	Vector<CarListBean> v= r.getAllCar();
	
	// tr을 3개씩 보여주고 다시 tr을 실행할 수 있도록 하는 변수 선언
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
				<font size=3 color="gray">차량명 : <%=bean.getName() %></font>
<%		
			j+=1; //j를 증가시켜 3개까지 보여준다.

	}
%>
</body>
</html>