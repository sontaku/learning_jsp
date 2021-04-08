<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--<%@ page import="temp.*" %>-->
<%@ page import="basic.dao.EmpDAO, basic.dto.EmpDTO"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%
	Connection con = EmpDAO.getConnection();
	
	int empno = Integer.parseInt(request.getParameter("empno"));
	String ename = request.getParameter("ename");
	int deptno = Integer.parseInt(request.getParameter("deptno"));
	String job = request.getParameter("job");
	int sal = Integer.parseInt(request.getParameter("sal"));

	EmpDTO empDTO = new EmpDTO();
	empDTO.setEmpno(empno);
	empDTO.setEname(ename);
	empDTO.setDeptno(deptno);
	empDTO.setJob(job);
	empDTO.setSal(sal);

	EmpDAO empDAO = EmpDAO.getInstance();
	try {
		empDAO.insert(empDTO);
	} catch (Exception e) {
		e.printStackTrace();
	}

	con.close();
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사원등록</title>
</head>
<body>성공적으로 입력되었지 DB에서 확인합니다.
</body>
</html>