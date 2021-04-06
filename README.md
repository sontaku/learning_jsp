# JSP

## 웹 서버 프로그램

- 웹 서버 : 웹 브라우저의 요청을 받아 요청에 대한 결과를 다시 웹 브라우저에 전송하는 역할
- 어플리케이션 서버 :  로그인과 게시글 보기와 같이 DB의 데이터를 처리하고 그 결과를 전달



### 환경설정

- TOMCAT 다운
- 환경변수 지정



## Servlet

> 자바 언어로 웹 개발을 위해 만든 표준
>
> 서블릿을 보완하기 위해 스크립트 방식의 표준 JSP 등장

서블릿을 통해 구동 후 컴파일 된 파일 생성 위치

- \workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost

참고 : https://mangkyu.tistory.com/14



## 문법

### Directive(설정부) - *중요*

```jsp
<%@ ~ %>
```

페이지 설정 정보 지정

- page : 페이지 설정

- include

  - header footer 분리

    각 작성한 header.jsp파일과 footer.jsp파일을 body태그 상단과 하단에 주입한다.

    

    ```jsp
    <body>
        <%@ include file='/header.jsp' %>
        
        ~ body 내용  ~
        
        <%@ include file='/footer.jsp' %>
    </body>
    ```

    

- taglib : 태그 삽입

### Declaration(선언부)

```jsp
<%! %>
```

멤버변수, 함수 선언

### Scriptlet(코드부) - *중요*

```jsp
<% %>
```

자바코드 기술하는 부분

### Expression(표현부)

```jsp
<%= %>
```

결과 값을 화면에 출력



#### 예시

```jsp
<%@ page 
	language="java" 
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%! 
	/*선언부*/
	String name = "홍길1동";
%>

<%
	String msg;
	msg = "안녕하세요";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>

	한 주를 열심히 보냅시다
	<%= name %>님, <%= msg %>!!!!

</body>
</html>
```



## DB connecting

1. 드라이버 로딩

   - ```jsp
     <% Class.forName("oracle.jdbc.driver.OracleDriver"); %>
     ```

2. 연결 객체 얻어오기

   - ```jsp
     <%
     	String url = "jdbc:oracle:thin:@192.168.10.75:1521:xe";
     	String user = "SCOTT";
     	String password = "TIGER";
     	Connection con = DriverManager.getConnection(url, user, password);
     	System.out.println("연결성공");
     %>
     ```

3. SQL 문장 생성

   - ```jsp
     <% String sql = "SELECT * FROM emp"; %>
     ```

4. 전송 객체 얻어오기

   - Statement

   - PreparedStatement : 미완성된 sql(?포함한) 전송시 사용. Statement를 상속받았기에 확장성에 좋다.

   - CallStatement : PL/SQL의 function() / procedure

   - ```jsp
     <% PreparedStatement ps = con.prepareStatement(sql); %>
     ```

5. 전송

   - executeQuery() : SELECT

   - executeUpdate() : INSERT, UPDATE, DELETE

   - ```jsp
     <% ResultSet rs = ps.executeQuery(); %>
     ```
     
     - executeUpdate()는 insert, delete, update의 경우 자주 사용하며 DB 결과에 대한 처리 행 개수를 리턴(int)받는다.



```html
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
		<td><%= rs.getString("EMPNO") %></td>
		<td><%= rs.getString("ENAME") %></td>
		<td><%= rs.getString("JOB") %></td>
		<td><%= rs.getString("MGR") %></td>
		<td><%= rs.getString("HIREDATE") %></td>
	  </tr>
	  
	<% } // end of while %>

</table>
</div>
</body>
```



### JSP 처리과정

이미지 만들어서 넣기



컴파일로 생성된 class 파일을 사용자에게 전송

한 번 실행된 메모리는 다른 사용자에게 재사용된다.





## form

### 문법

```jsp
<form action="전달할곳.jsp" method="post">
	사용자: <input name='User' type='text'><br/>
	비밀번호: <input name='Pass' type='password'><br/>
<input type='submit' value='login'> 
```

위의 form의 경우엔 각 input에서 전달 받은 'User', 'Pass' 값을 '전달할곳.jsp' 파일로 파라미터로 넘겨준다.



### 전달방식

- get

  ```jsp
  <%
  	String user = request.getParameter("User");
  	String pass = request.getParameter("Pass");
  %>
  ```

  - 전달 받은 파라미터 값을 넘겨준다. 
  - url의 뒷부분에 파라미터를 전송
  - HTTP 프로토콜의 헤더영역에서 전송
  - 전송데이터 길이 제한이 있고, 데이터가 노출 될 수 있다.

- post

  ```jsp
  <%
  	// post 방식으로 전달시 한글깨짐이 발생함
  	request.setCharacterEncoding("UTF-8");
  
  	String user = request.getParameter("User");
  	String pass = request.getParameter("Pass");
  %> 
  ```

  - get방식과 달리 url에 파라미터값이 담기지 않는다.
  - 전송데이터 길이 제한이 없으며, 데이터를 감출 수 있다.
  - 비밀번호와 같은 중요한 내용 혹은 방대한 데이터(파일 전송) 전달시 post를 사용한다. 



