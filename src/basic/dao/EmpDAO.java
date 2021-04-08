package basic.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import basic.dto.EmpDTO;

public class EmpDAO {

  private static Connection con = null;
  private static EmpDAO empDAO = new EmpDAO();
  
  private EmpDAO() {
  }

  public static EmpDAO getInstance() {
	return empDAO;
  }
  
  PreparedStatement ps;
  String sql;

  public static Connection getConnection() throws ClassNotFoundException, SQLException {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "SCOTT", "TIGER");

    return con;
  }

  public void insert(EmpDTO empDTO) throws Exception {
    sql = "INSERT INTO EMP(EMPNO, ENAME, DEPTNO, JOB, SAL) VALUES(?,?,?,?,?)";
    ps = con.prepareStatement(sql);
    ps.setInt(1, empDTO.getEmpno());
    ps.setString(2, empDTO.getEname());
    ps.setInt(3, empDTO.getDeptno());
    ps.setString(4, empDTO.getJob());
    ps.setInt(5, empDTO.getSal());
    ps.executeUpdate();
  }

  public void update(EmpDTO empDTO) throws Exception {
    sql = "UPDATE emp SET JOB=?, MGR=?, HIREDATE = (SELECT SYSDATE FROM DUAL) WHERE ENAME=?";
    ps = con.prepareStatement(sql);
    ps.setString(1, empDTO.getJob());
    ps.setInt(2, empDTO.getMgr());
    ps.setString(3, empDTO.getEname());
    ps.executeUpdate();
  }

  public void delete(EmpDTO empDTO) throws Exception {
    sql = "DELETE FROM EMP WHERE EMPNO=?";
    ps = con.prepareStatement(sql);
    ps.setInt(1, empDTO.getEmpno());
    ps.executeUpdate();
  }

  public boolean login(EmpDTO empDTO) throws Exception {
    boolean login;

    sql = "SELECT * FROM EMP WHERE ENAME=? AND EMPNO=?";
    ps = con.prepareStatement(sql);
    ps.setString(1, empDTO.getEname());
    ps.setInt(2, empDTO.getEmpno());

    ResultSet rs = ps.executeQuery();

    login = rs.next();

    rs.close();
    ps.close();
    con.close();
    return login;
  }
}