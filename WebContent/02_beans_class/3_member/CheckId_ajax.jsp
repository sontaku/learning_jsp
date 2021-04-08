<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.beans.*" %>
<%@ page language="java" import="java.sql.*"%>

 <%
 	// ajax 버전
 	request.setCharacterEncoding("UTF-8");
 	String id = request.getParameter("userId");	
 	System.out.println(id);
 	MemberDao dao = MemberDao.getInstance();
	String result="NO";
 	if( dao.isDuplicatedId(id) ) {	
		result = "YES";
 	}
	out.print(result);
%>