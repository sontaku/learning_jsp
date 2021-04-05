<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		emp 테이블에서 '홍길동(본인이름)'인 사원의 정보를 수정하기
			- 업무(job) : IT
			- 매니저(mgr) : 8899
			- 입사일(hiredate) : 오늘 날짜(ex. sysdate 이용)
	*/
	// 1. 드라이버 로딩
		Class.forName("oracle.jdbc.driver.OracleDriver");
		System.out.println("드라이버 로딩 성공");
		// 2. 연결객체 얻어오기
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "SCOTT";
		String password = "TIGER";
		Connection con = DriverManager.getConnection(url, user, password);
		// 3. SQL 문장
		String sql = "UPDATE emp set JOB = ?, MGR = ?, HIREDATE = SYSDATE WHERE ENAME = ?";
		// 4. 전송 객체 얻어오기
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, "IT");
		ps.setInt(2, 8899);
		//ps.setString(3, "SYSDATE");
		ps.setString(3, "홍길동");
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
<title>02_DBupdate.jsp</title>
</head>
<body>
	<h2>내용을 수정하였습니다</h2>
	<a href="02_DBtest.jsp">목록보기</a>
</body>
</html>