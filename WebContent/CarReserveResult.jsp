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
			alert("로그인 후 예약이 가능합니다!")
			location.href='RentMain.jsp?Center=MemberLogin.jsp'
		</script>
<%
	}
	
	//날짜 비교
	Date d1=new Date();
	Date d2=new Date();
	//날짜를 포멧해주는 클래스 선언
	SimpleDateFormat s=new SimpleDateFormat("yyyy-MM-dd");
	
	d1=s.parse(mybean.getRday());
	d2=s.parse(s.format(d2));
	
	//날짜 비교 메소드 사용
	int compare=d1.compareTo(d2);
	// 예약하려는 날짜보다 현재날짜가 크다면 -1
	// 예약하려는 날짜와 현재날짜가 같다면 0
	// 예약하려는 날짜가 현재날짜보다 크다면 1
	System.out.println(compare);
	if(compare<0){
%>
		<script type="text/javascript">
			alert("이전 날짜는 선택할 수 없음")
			history.go(-1)
		</script>
<%
	}
	
	// 결과적으로 아무 문제가 없다면 데이터 저장 후 결과 보여주기
	// 아이디 값이 빈클래스에 없기에 가져온다
	
	String id1=(String)session.getAttribute("id");
	mybean.setId(id1);
	RentcarDAO r =new RentcarDAO();
	r.setReserveCar(mybean);
	
	// 차량 정보 얻어오기
	CarListBean c=r.getOneCar(mybean.getNum());
	
	//차량 총 금액
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
	<font size=6>차량 예약 완료 화면</font>
	</td>
</tr>
<tr>
	<td align="center">
	<img alt="" src="img/<%=c.getImg()%>" width=470">
	</td>
</tr>
<tr height=50>
	<td align="center">
	<font size=5 color="red">차량 총예약 금액 : <%=total %>원</font>
	</td>
</tr>
<tr height=50>
	<td align="center">
	<font size=5 color="red">차량 총옵션 금액 : <%=totalOption %>원</font>
	</td>
</tr>
<tr height=50>
	<td align="center">
	<font size=5 color="red">차량 총예약 금액 : <%=total+totalOption %>원</font>
	</td>
</tr>
</table>
</center>
</body>
</html>