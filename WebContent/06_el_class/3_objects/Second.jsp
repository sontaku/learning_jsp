<%@ page contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title> 데이타 받는 페이지 </title>
</head>
<body>

<%
	// 1. 파라미터
	// String xxx = request.getParameter("data");
	// xxx 변수에 값으로 'important'
	
	// 2. 세션
	// String obj = (String)session.getAttribute("login");
	// obj 변수 값으로 "당신의아이디"
	
	// 위의 자바 코딩을 쓰지 않고 아래와 같이 처리
%>

파라메터 값(전 페이지에서 넘어오는 값) :  ${param.data }<br/> 

세션의 값 :  ${sessionScope.login}<br/>

쿠키의 값 :	 ${cookie.isFlag.value}<br/>


<hr>


</body>
</html>