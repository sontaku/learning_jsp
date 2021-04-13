<%@ page language="java" contentType="text/html; charset=utf-8"%>
 <%@ page import="mybatis.guest.model.Comment" %>    
 <%@ page import="mybatis.guest.service.CommentService" %>   
 <!-- 서비스의 메소드 호출  -->
 <%
 	int commentNo = Integer.parseInt(request.getParameter("cId"));
 	CommentService.getInstance().deleteComment(commentNo);
 %>
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="refresh" content="3;URL=listComment.jsp">
<title>입력</title>
</head>
<body>
해당 메세지가 삭제되었습니다.<br/>
잠시 후 목록페이지로 이동합니다.
</body>
</html>