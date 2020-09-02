<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<%
	String center= request.getParameter("Center");
	// 처음 실행 시에는 center값이 넘어오지 않기에
	if(center == null){
		center="Center.jsp";
	}
%>
<body>
<center>
<table width=1000>
<tr heigth=120 align="center">
	<td align="center" width=1000><jsp:include page="Top.jsp"></jsp:include></td>
</tr>
<tr align="center" height=500>
	<td align="center" width=1000><jsp:include page="<%=center %>"></jsp:include></td>
</tr>
<tr heigth=100 align="center">
	<td align="center" width=1000><jsp:include page="Bottom.jsp"></jsp:include></td>
</tr>
</table>
</center>
</body>
</html>