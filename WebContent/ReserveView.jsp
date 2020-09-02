<%@page import="model.CarVeiwBean"%>
<%@page import="model.CarReserveBean"%>
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
<%
	String id=(String)session.getAttribute("id");
	if(id==null){
%>
		<script type="text/javascript">
			alert("로그인 안됐다")
			location.href='RentMain.jsp?Center=MemberLogin.jsp'
		</script>
<%
	}
	// 로그인 된 아이디를 읽어 옴
	RentcarDAO r= new RentcarDAO();
	Vector<CarVeiwBean> v = r.getAllReserve(id);
%>
<center>
<table width=1000 border=1>
<tr height=100>
	<td align="center" colspan="11">
	<font size=6>차량 예약 확인</font>
	</td>
</tr>
<tr height=40>
	<td width=50 align="center">번호</td>
	<td width=150 align="center">이미지</td>
	<td width=125 align="center">이름</td>
	<td width=125 align="center">대여일</td>
	<td width=60 align="center">대여기간</td>
	<td width=100 align="center">금액</td>
	<td width=60 align="center">수량</td>
	<td width=60 align="center">보험</td>
	<td width=60 align="center">wifi</td>
	<td width=60 align="center">베이비시트</td>
	<td width=60 align="center">네비게이션</td>
	<td width=90 align="center">삭제</td>
</tr>
<%
	for(int i=0;i<v.size();i++){
		CarVeiwBean bean=v.get(i);
%>
<tr height=40>
	<td width=50 align="center"><%=bean.getReservenum() %></td>
	<td width=150 align="center"><img src="img/<%=bean.getImg()%>" width=120 height=70></td>
	<td width=125 align="center"><%=bean.getName() %></td>
	<td width=125 align="center"><%=bean.getRday() %></td>
	<td width=60 align="center"><%=bean.getDday() %></td>
	<td width=100 align="center"><%=bean.getPrice() %></td>
	<td width=60 align="center"><%=bean.getQty() %></td>
	<td width=60 align="center"><%=bean.getUsein() %></td>
	<td width=60 align="center"><%=bean.getUsewifi() %></td>
	<td width=60 align="center"><%=bean.getUseseat() %></td>
	<td width=60 align="center"><%=bean.getUsenavi() %></td>
	<td width=90 align="center"><button onclick="location.href='ReserveDelete.jsp?num=<%=bean.getReservenum()%>'">삭제</button></td>
</tr>
<%
	}
%>
</table>
</center>
</body>
</html>