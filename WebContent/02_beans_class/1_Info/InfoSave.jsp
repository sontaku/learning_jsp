<%@ page contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<%@ page import="info.InfoBean" %>

<jsp:useBean id="bean" class='info.InfoBean'>
	<jsp:setProperty name="bean" property="*"/>
</jsp:useBean>

<% //InfoBean bean = new InfoBean(); %>
<!-- 
	1) 이전화면에서 사용자 입력값을 얻어옴
	
	2) 각각의 입력값을 하나의 객체로 만들기
 	
 -->
<!DOCTYPE html>
<html>
<body>
	<h2>  당신의 신상명세서 확인 </h2>
	<%-- 
	이   름  : <%=bean.getName() %><br/> 
	주민번호 : <%=bean.getId() %><br/>
	성  별   : <%=bean.getGender() %><br/>
	--%>
	이   름  : <jsp:getProperty property="name" name="bean"/><br/>
	주민번호 : <jsp:getProperty property="id" name="bean"/><br/><br/>
	성  별   : <jsp:getProperty property="gender" name="bean"/><br/><br/>  
	맞습니까????
</body>
</html>