<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.beans.*" %>
<%@ page language="java" import="java.sql.*"%>

<jsp:useBean id="m" class="member.beans.Member">
   <jsp:setProperty name="m" property="*"/>
</jsp:useBean>
 <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 아이디 중복 확인 </title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("userId");
	MemberDao dao = MemberDao.getInstance();

	if( dao.isDuplicatedId(id) ) {
%>
		사용할 수 있는 아이디입니다.
<%  }else { %>
		사용중인 아이디가 있습니다. 다시 입력하여 주십시오.
<%  } %>

 
</body>
</html>
