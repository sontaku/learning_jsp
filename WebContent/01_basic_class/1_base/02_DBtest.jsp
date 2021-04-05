<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<%
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
	String sql = "SELECT * FROM emp";
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
<html><head><title> 디비 테스트 </title>
</head>
<body>
 
<div align=center>
<table border=2 cellSpacing=3>

  <tr class="title">
    <td>사번</td>
    <td>사원명</td>
    <td>업무</td>
    <td>관리자사번</td>
    <td>입사일</td></tr>

	<% while(rs.next()) { %>
		
	
	  <tr>
		<td>
			<%= rs.getString(1) %>
		</td>
		<td>
			<a href="02_DBView.jsp?sabun=<%= rs.getString(1) %>">
			<%= rs.getString(2) %></a>
		</td>
		<td><%= rs.getString(3) %></td>
		<td><%= rs.getString(4) %></td>
		<td><%= rs.getString(5) %></td>
	  </tr>
	  
	<% } // end of while %>

</table>

<a href='02_DBInsert.jsp'>emp테이블에 추가(입력)</a><br>
<a href='/Jsp/01_basic_class/1_base/02_DBInsert.jsp'>emp테이블에 추가(입력)</a><br>
<a href='02_DBUpdate.jsp'>사원정보 수정하기</a><br>
</div>
</body>
</html>
