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
	
	//�ش� ȸ���� �ִ��� ���θ� ���ڷ� ǥ��
	int result=r.getMember(id, pass);
	
	if(result==0){
		%>
		<script type="text/javascript">
			alert("ȸ�� ���̵� �Ǵ� �н����尡 Ʋ���ϴ�.")
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