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
			alert("�α��� �ȵƴ�")
			location.href='RentMain.jsp?Center=MemberLogin.jsp'
		</script>
<%
	}
	// �α��� �� ���̵� �о� ��
	RentcarDAO r= new RentcarDAO();
	Vector<CarVeiwBean> v = r.getAllReserve(id);
%>
<center>
<table width=1000 border=1>
<tr height=100>
	<td align="center" colspan="11">
	<font size=6>���� ���� Ȯ��</font>
	</td>
</tr>
<tr height=40>
	<td width=50 align="center">��ȣ</td>
	<td width=150 align="center">�̹���</td>
	<td width=125 align="center">�̸�</td>
	<td width=125 align="center">�뿩��</td>
	<td width=60 align="center">�뿩�Ⱓ</td>
	<td width=100 align="center">�ݾ�</td>
	<td width=60 align="center">����</td>
	<td width=60 align="center">����</td>
	<td width=60 align="center">wifi</td>
	<td width=60 align="center">���̺��Ʈ</td>
	<td width=60 align="center">�׺���̼�</td>
	<td width=90 align="center">����</td>
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
	<td width=90 align="center"><button onclick="location.href='ReserveDelete.jsp?num=<%=bean.getReservenum()%>'">����</button></td>
</tr>
<%
	}
%>
</table>
</center>
</body>
</html>