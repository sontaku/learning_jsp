<%@page import="guest.model.MessageDao"%>
<%@page import="guest.model.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="guest.service.WriteMessageService"%>    

<!-- 
	0. 넘겨받는 데이타의 한글처리
	1. 화면의 입력값을 Message 클래스로 전달
	2. Service 클래스의 함수 호출
 -->     
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="m" class="guest.model.Message">
	<jsp:setProperty name="m" property="*"/>   
</jsp:useBean>
<%
	WriteMessageService service = WriteMessageService.getInstance();
	service.write(m);
%>
<!-- 
	view : 화면
	model : DB 관련
	service : 화면과 DB 연결 사이 중간 역할 코드
 -->
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 방명록 남김 </title>
</head>
<body>
	<font size="3" color="#bb44cc">
		방명록에 메세지를 남겼습니다. 
	</font><br/><br/><br/>
	 [ 목록보기 ] 
</body>
</html>