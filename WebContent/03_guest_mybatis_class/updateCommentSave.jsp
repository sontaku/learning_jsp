<%@ page language="java" contentType="text/html; charset=utf-8"%>
 <%@ page import="mybatis.guest.model.Comment" %>    
 <%@ page import="mybatis.guest.service.CommentService" %>   
  
 <!--  이전 폼에서 넘겨오는 데이타의 한글 처리  -->
 <% 
 	request.setCharacterEncoding("utf-8");
 %>
  
 <!--  이전 폼의 각각의 데이터를 빈즈의 멤버로 지정  -->
 <jsp:useBean id="comment" class="mybatis.guest.model.Comment">
 	<jsp:setProperty name="comment" property="*"/>
 </jsp:useBean>   
 
 <!-- 서비스의 메소드 호출  -->
 <%
 	CommentService.getInstance().updateComment(comment);
 %>
    
    
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="refresh" content="3;URL=listComment.jsp">
<title>입력</title>
</head>
<body>
해당 메세지가 수정되었습니다.<br/>
잠시 후 목록페이지로 이동합니다.
</body>
</html>