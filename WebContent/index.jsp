<%@ page 
	language="java" 
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%! 
	/*선언부*/
	String name = "홍길1동";
%>

<%
	String msg;
	msg = "안녕하세요";
%>

<!-- (1) HTML 주석 -->
<%-- (2) jsp 주석 --%>
<%
	// (3) JAVA 주석
	/* (4) JAVA 주석 */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>

	한 주를 열심히 보냅시다
	<%= name %>님, <%= msg %>!!!!

</body>
</html>