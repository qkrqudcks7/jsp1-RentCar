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
<!-- DB에 연결하여 최신순 자동차 3대만 뿌려주는 데이터를 가져옴 -->
<%
	RentcarDAO r= new RentcarDAO();
	// 백터를 이용하여 데이터를 저장
	Vector<CarListBean> v =r.getSelectCar();
%>
<table width=1000>
<tr height=100>
	<td align="center" colspan="3">
	<font size=6 color="gray">최신형 자동차</font>
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
		<p>차량명 : <%=bean.getName() %>
	</td>
<%
	}
%>
</tr>
</table>
<br><br>
<form action="RentMain.jsp?Center=CarCategoryList.jsp" method="post">
<font size=3 color="gray"><b>차량 검색하기</b></font>&nbsp;&nbsp;
<select name="category">
	<option value="1">소형</option>
	<option value="2">중형</option>
	<option value="3">대형</option>
</select>&nbsp;&nbsp;
<input type="submit" value="검색">&nbsp;&nbsp;
</form>
<button onclick="location.href='CarAllList.jsp'">전체검색</button>
</center>
</body>
</html>