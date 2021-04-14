<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>1_basic.jsp</title>
</head>
<body>

	<!-- ���� ���� -->
	<c:set var='gender' value='male' />
	<c:if test="${ gender =='male'}">����� �����Դϴ�</c:if>
	<c:if test="${ gender =='female'}">����� �����Դϴ�</c:if>

	<c:set var='age'>24</c:set>
	<c:if test="${age ge 20}">����� �����Դϴ�</c:if>

	<!-- 
	<c:choose>
		<c:when test="${age lt 10}">���</c:when>
		<c:when test="${age ge 10 and age lt 20}">û�ҳ�</c:when>
		<c:otherwise>����</c:otherwise>
	</c:choose>

	<hr />
	<c:set var="sum" value="0" />
	<c:forEach var="i" begin="1" end="100">
		<c:set var="sum" value="${ sum+i }" />
	</c:forEach>
	1~100������ �� : ${sum }
	<hr />
 -->

	<c:set var="evensum" value="0" />
	<c:set var="oddsum" value="0" />
	<c:forEach var="i" begin="1" end="100">
		<c:if test="${i mod 2 eq 0}">
			<c:set var="evensum" value="${ evensum+i }" />
		</c:if>
		<c:if test="${i mod 2 eq 1}">
			<c:set var="oddsum" value="${ oddsum+i }" />
		</c:if>
	</c:forEach>
	<br /> 1~100������ ¦���� �� : ${ evensum}
	<br /> 1~100������ Ȧ���� �� : ${ oddsum}
	<br />


	<!-- ������ -->
	<c:forEach var="j" begin="2" end="9">
		<c:forEach var="k" begin="1" end="9">
			${j} X ${k} = ${j*k} <br/>
		</c:forEach>
	</c:forEach>
	
	
	
</body>
</html>