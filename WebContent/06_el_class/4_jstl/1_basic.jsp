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

	<!-- 변수 선언 -->
	<c:set var='gender' value='male' />
	<c:if test="${ gender =='male'}">당신은 남성입니다</c:if>
	<c:if test="${ gender =='female'}">당신은 여성입니다</c:if>

	<c:set var='age'>24</c:set>
	<c:if test="${age ge 20}">당신은 성인입니다</c:if>

	<!-- 
	<c:choose>
		<c:when test="${age lt 10}">어린이</c:when>
		<c:when test="${age ge 10 and age lt 20}">청소년</c:when>
		<c:otherwise>성인</c:otherwise>
	</c:choose>

	<hr />
	<c:set var="sum" value="0" />
	<c:forEach var="i" begin="1" end="100">
		<c:set var="sum" value="${ sum+i }" />
	</c:forEach>
	1~100까지의 합 : ${sum }
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
	<br /> 1~100까지의 짝수의 합 : ${ evensum}
	<br /> 1~100까지의 홀수의 합 : ${ oddsum}
	<br />


	<!-- 구구단 -->
	<c:forEach var="j" begin="2" end="9">
		<c:forEach var="k" begin="1" end="9">
			${j} X ${k} = ${j*k} <br/>
		</c:forEach>
	</c:forEach>
	
	
	
</body>
</html>