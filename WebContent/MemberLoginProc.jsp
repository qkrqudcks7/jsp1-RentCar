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
	request.setCharacterEncoding("euc-kr");
	String id=request.getParameter("id");
	String pass=request.getParameter("password");
	
	RentcarDAO r= new RentcarDAO();
	
	//해당 회원이 있는지 여부를 숫자로 표현
	int result=r.getMember(id, pass);
	
	if(result==0){
		%>
		<script type="text/javascript">
			alert("회원 아이디 또는 패스워드가 틀립니다.")
			history.go(-1)
		</script>
		<%
	}
	else{
		session.setAttribute("id", id);
		response.sendRedirect("RentMain.jsp");
	}
%>
</body>
</html>