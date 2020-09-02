<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="MemberLoginProc.jsp" method="post">
<table width=300 border=1>
<tr height=40>
	<td width=120 align="center"><input type="text" name="id" placeholder="아이디 : "></td>
</tr>
<tr height=40>
	<td width=120 align="center"><input type="password" name="password" placeholder="비밀번호 :  "></td>
</tr>
<tr height=40>
	<td colspan="2" align="center"><input type="submit" value="로그인"></td>
</tr>
</table>
</form>
</body>
</html>