package mvc.simple;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SimpleControl extends HttpServlet{
	
	String jspDir = "/05_mvc_class/1_mvcSimple";
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processReq(req, resp);
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processReq(req, resp);
	}
	
	// get이나 post 어느걸 요청받아도
	// 이 메소드를 실행함
	protected void processReq(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 1. 사용자의 요청 분석
		String type = req.getParameter("type");
		
		// 2. 사용자 요청에 따라 결과 지정
		String value = "";
		if(type == null) value = "안녕하세요";
		else if(type.equals("first")) value = "처음뵙겠습니다";
		
		// 3. 처리 결과를 request / session 저장
		// ********** setAttribute()
		req.setAttribute("param", value);
		
		// 4. view의 파일로 포워딩 
		// <jsp:forward page="simpleView.jsp"/> 를
		// java코드로 작성하면 아래와 같다.
		RequestDispatcher disp = req.getRequestDispatcher(jspDir + "/simpleView.jsp");
		disp.forward(req, resp);
	}
}
