<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 1. 드라이버 로딩
	Class.forName("oracle.jdbc.driver.OracleDriver");
	System.out.println("드라이버 로딩 성공");
	// 2. 연결객체 얻어오기
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "SCOTT";
	String password = "TIGER";
	Connection con = DriverManager.getConnection(url, user, password);
	// 3. SQL 문장
	String sql = "INSERT INTO emp(EMPNO, ENAME, SAL, DEPTNO) VALUES(seq_emp_empno.nextval, ?, ?, ?)";
	// 4. 전송 객체 얻어오기
	PreparedStatement ps = con.prepareStatement(sql);
	//ps.setInt(1, 9999");
	ps.setString(1, "홍길동");
	ps.setInt(2, 10000);
	ps.setInt(3, 20);
	// 5. 전송하기 : executeUpdate()
	//		- executeQuery() / executeUpdate()
	ps.executeUpdate();
	// 6. 닫기
	ps.close();
	con.close();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>02_DBInsert.jsp</title>
</head>
<body>
	<h4>입력 성공하였습니다</h4>
	<a href='02_DBtest.jsp'>목록보기</a>
	<a href='/Jsp/01_basic_class/1_base/02_DBtest.jsp'>목록보기</a>
</body>
</html>