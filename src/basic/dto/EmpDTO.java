package basic.dto;

public class EmpDTO {

  private int empno;
  private String ename;
  private int deptno;
  private String job;
  private int sal;
  private int mgr;
  private String hiredate;

  public int getEmpno() {
    return empno;
  }

  public void setEmpno(int empno) {
    this.empno = empno;
  }

  public String getEname() {
    return ename;
  }

  public void setEname(String ename) {
    this.ename = ename;
  }

  public int getDeptno() {
    return deptno;
  }

  public void setDeptno(int deptno) {
    this.deptno = deptno;
  }

  public String getJob() {
    return job;
  }

  public void setJob(String job) {
    this.job = job;
  }

  public int getSal() {
    return sal;
  }

  public void setSal(int sal) {
    this.sal = sal;
  }

  public int getMgr() {
    return mgr;
  }

  public void setMgr(int mgr) {
    this.mgr = mgr;
  }

  public String getHiredate() {
    return hiredate;
  }

  public void setHiredate(String hiredate) {
    this.hiredate = hiredate;
  }
}