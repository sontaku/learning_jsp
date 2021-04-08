<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. 이전 화면에서 사용자 입력값 얻어오기
	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("name");
	if(name.equals("")) {
		name = "이름이 없습니까...?";
	}
	String gender = request.getParameter("gender");
	if(gender.equals("male")) {
		gender = "남자";
	} else {
		gender = "여자";
	}
	String occupation = request.getParameter("occupation");
	String hobby = request.getParameter("hobby");
	if(hobby == null) {
		hobby = "없음";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>02_Simple.jsp</title>
</head>
<body>
	<!-- 2. 얻어온 입력 값을 화면에 출력하기 -->
	<!-- 
	<table border="3">
		<tr>
			<td>이름</td>
			<td>성별</td>
			<td>직업</td>
			<td>취미</td>
		</tr>
		<tr>
			<td><%=name %></td>
			<td><%=gender %></td>
			<td><%=occupation %></td>
			<td><%=hobby %></td>
		</tr>
	</table>
	 -->
	 <h2>이름 : <%=name %></h2><br>
	 <h2>성별 : <%=gender %></h2><br>
	 <h2>직업 : <%=occupation %></h2><br>
	 <h2>취미 : <%=hobby %></h2>
</body>
</html>