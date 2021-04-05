<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	int sabun = 7369;
	// 7369 사번을 가진 사원 정보 얻어오기
	// 1. 드라이버 로딩
	Class.forName("oracle.jdbc.driver.OracleDriver");
	System.out.println("드라이버 로딩 성공");
	// 2. 연결객체 얻어오기
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "SCOTT";
	String password = "TIGER";
	Connection con = DriverManager.getConnection(url, user, password);
	System.out.println("연결성공");
	// 3. sql 문장 만들기
	String sql = "SELECT * FROM emp WHERE empno = " + sabun;
	// 4. 전송 객체 얻어오기
	//		Statement stmt
	//		PreparedStatement : 미완성된 sql(?포함한) 전송시
	//		CallStatement : PL/SQL의 function()/procedure
	PreparedStatement ps = con.prepareStatement(sql);
	// 5. 전송
	//		ResultSet executeQuery() : SELECT
	//		int executeUpdate() : INSERT, UPDATE, DELETE
	ResultSet rs = ps.executeQuery();
					// **********************************
					// PreparedStatement 인 경우에는 executeQuery(sql) 안됨
	System.out.println("종료");
	*/
%>
<%
	int sabun = Integer.parseInt(request.getParameter("sabun"));
//7369 사번을 가진 사원 정보 얻어오기
	// 1. 드라이버 로딩
	Class.forName("oracle.jdbc.driver.OracleDriver");
	System.out.println("드라이버 로딩 성공");
	// 2. 연결객체 얻어오기
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "SCOTT";
	String password = "TIGER";
	Connection con = DriverManager.getConnection(url, user, password);
	System.out.println("연결성공");
	// 3. sql 문장 만들기
	String sql = "SELECT * FROM emp WHERE empno = " + sabun;
	// 4. 전송 객체 얻어오기
	//		Statement stmt
	//		PreparedStatement : 미완성된 sql(?포함한) 전송시
	//		CallStatement : PL/SQL의 function()/procedure
	PreparedStatement ps = con.prepareStatement(sql);
	// 5. 전송
	//		ResultSet executeQuery() : SELECT
	//		int executeUpdate() : INSERT, UPDATE, DELETE
	ResultSet rs = ps.executeQuery();
					// **********************************
					// PreparedStatement 인 경우에는 executeQuery(sql) 안됨
	System.out.println("종료");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align=center>
<table border=2 cellSpacing=3>
	<!-- 얻어온 사원 정보를 출력하기 -->
	<tr class="title">
		<tr>
			<td>사번</td>
			<td>이름</td>
			<td>직업</td>
			<td>매니저</td>
			<td>입사일</td>
			<td>급여</td>
			<td>수수료</td>
			<td>부서번호</td>
		</tr>
		<% if(rs.next()) { %>

		<tr>
			<td><%= rs.getString("EMPNO") %></td>
			<td><%= rs.getString("ENAME") %></td>
			<td><%= rs.getString("JOB") %></td>
			<td><%= rs.getString("MGR") %></td>
			<td><%= rs.getString("HIREDATE") %></td>
			<td><%= rs.getString("SAL") %></td>
			<td><%= rs.getString("COMM") %></td>
			<td><%= rs.getString("DEPTNO") %></td>
		</tr>
		<% } // end of while %>
	</table>
</div>
</body>
</html>