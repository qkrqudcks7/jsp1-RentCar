<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<%
	String id=(String)session.getAttribute("id");
	// �α��� �� �Ǿ��ִٸ�
	if(id==null){
		id="GUEST";
	}
%>
<body>
<table width=1000 bgcolor="white">
<tr height=70>
	<td colspan="4">
		<a href="RentMain.jsp"><img src="img/logo.PNG" height=65></a>
	</td>
	<td align="center" width=200><%=id %>
	<%
		if(id.equals("GUEST")){
	%>
			<button onclick="location.href='RentMain.jsp?Center=MemberLogin.jsp'">�α���</button>
	<%
		}
		else{
	%>
			<button onclick="location.href='Logout.jsp'">�α׾ƿ�</button>
	<%		
		}
	%>
	</td>
</tr>
<tr height=70>
	<td align="center" width=200 bgcolor="pink">
		<font color="white" size=5><a href="RentMain.jsp?Center=ReserveMain.jsp" style="text-decoration:none">�����ϱ�</a></font>
	</td>
	<td align="center" width=200 bgcolor="pink">
		<font color="white" size=5><a href="RentMain.jsp?Center=ReserveView.jsp" style="text-decoration:none">����Ȯ��</a></font>
	</td>
	<td align="center" width=200 bgcolor="pink">
		<font color="white" size=5><a href=# style="text-decoration:none">�����Խ���</a></font>
	</td>
	<td align="center" width=200 bgcolor="pink">
		<font color="white" size=5><a href=# style="text-decoration:none">�̺�Ʈ</a></font>
	</td>
	<td align="center" width=200 bgcolor="pink">
		<font color="white" size=5><a href=# style="text-decoration:none">������</a></font>
	</td>
</tr>
</table>
</body>
</html>