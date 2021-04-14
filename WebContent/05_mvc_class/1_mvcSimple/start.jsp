<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% String prjName = "/Jsp"; %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>start.jsp</title>
</head>
<body>
	<h1>기존방식</h1>
	<a href="./simpleView.jsp">기존방식 (상대)</a>
	<a href="<%=prjName %>/05_mvc_class/1_mvcSimple/simpleView.jsp">기존방식 (절대)</a>
	<hr/>
	<hr/>
	<h1>MVC 방식</h1> <!-- C : 서블릿, V : jsp -->
	<a href="<%=prjName%>/SimpleControl">MVC방식1</a>
	<a href="<%=prjName%>/siat.do">MVC방식2</a>
	<a href="<%=prjName%>/zzzzzzzzzzzz.son">MVC방식3</a>
	<a href="<%=prjName%>/siat.do?type=first">MVC방식4</a>
</html>