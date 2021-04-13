package mybatis.guest.model;

// 한 테이블의 레코드를 표현하는 클래스이면서
// 파일(java, xml)과 파일에 데이터를 전달하기 위해 전송하는 역할 클래스
// - DTO == VO
// 		VO는 DTO와 동일한 개념이지만 read only 속성을 갖는다.
//		VO는 특정한 비즈니스 값을 담는 객체이고, DTO는 Layer간의 통신 용도로 오고가는 객체를 말한다.
public class Comment {
	private int commentNo; // 게시글번호 pk
	private String userId; // 작성자
	private String commentContent; // 게시글
	private String regDate; // 등록일

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

}
