<%@page import="model.CarListBean"%>
<%@page import="model.RentcarDAO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
%>
<jsp:useBean id="mybean" class="model.CarReserveBean">
	<jsp:setProperty name="mybean" property="*"/>
</jsp:useBean>
<%
	String id= (String)session.getAttribute("id");
	
	if(id==null){
%>
		<script type="text/javascript">
			alert("�α��� �� ������ �����մϴ�!")
			location.href='RentMain.jsp?Center=MemberLogin.jsp'
		</script>
<%
	}
	
	//��¥ ��
	Date d1=new Date();
	Date d2=new Date();
	//��¥�� �������ִ� Ŭ���� ����
	SimpleDateFormat s=new SimpleDateFormat("yyyy-MM-dd");
	
	d1=s.parse(mybean.getRday());
	d2=s.parse(s.format(d2));
	
	//��¥ �� �޼ҵ� ���
	int compare=d1.compareTo(d2);
	// �����Ϸ��� ��¥���� ���糯¥�� ũ�ٸ� -1
	// �����Ϸ��� ��¥�� ���糯¥�� ���ٸ� 0
	// �����Ϸ��� ��¥�� ���糯¥���� ũ�ٸ� 1
	System.out.println(compare);
	if(compare<0){
%>
		<script type="text/javascript">
			alert("���� ��¥�� ������ �� ����")
			history.go(-1)
		</script>
<%
	}
	
	// ��������� �ƹ� ������ ���ٸ� ������ ���� �� ��� �����ֱ�
	// ���̵� ���� ��Ŭ������ ���⿡ �����´�
	
	String id1=(String)session.getAttribute("id");
	mybean.setId(id1);
	RentcarDAO r =new RentcarDAO();
	r.setReserveCar(mybean);
	
	// ���� ���� ������
	CarListBean c=r.getOneCar(mybean.getNum());
	
	//���� �� �ݾ�
	int total=c.getPrice()*mybean.getQty()*mybean.getDday();
	int usein=0;
	if(mybean.getUsein()==1)usein=10000;
	int usewifi=0;
	if(mybean.getUsein()==1)usewifi=10000;
	int useseat=0;
	if(mybean.getUsein()==1)useseat=10000;
	
	int totalOption=mybean.getQty()*mybean.getDday()*(usein+usewifi+useseat);
%>
<center>
<table width=1000>
<tr height=100>
	<td align="center" colspan="2">
	<font size=6>���� ���� �Ϸ� ȭ��</font>
	</td>
</tr>
<tr>
	<td align="center">
	<img alt="" src="img/<%=c.getImg()%>" width=470">
	</td>
</tr>
<tr height=50>
	<td align="center">
	<font size=5 color="red">���� �ѿ��� �ݾ� : <%=total %>��</font>
	</td>
</tr>
<tr height=50>
	<td align="center">
	<font size=5 color="red">���� �ѿɼ� �ݾ� : <%=totalOption %>��</font>
	</td>
</tr>
<tr height=50>
	<td align="center">
	<font size=5 color="red">���� �ѿ��� �ݾ� : <%=total+totalOption %>��</font>
	</td>
</tr>
</table>
</center>
</body>
</html>