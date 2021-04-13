package mybatis.guest.service;

import java.util.*;

import mybatis.guest.model.Comment;
import mybatis.guest.session.CommentRepository;

public class CommentService {
	
	private static CommentService service;
	
	private CommentService() {}
	public static CommentService getInstance(){
		if( service == null) service = new CommentService();
		return service;
	}
	
	private CommentRepository repo = new CommentRepository();
	
	public List<Comment> selectComment() {
		return repo.selectComment();
	}

	public Comment selectCommentByPrimaryKey(int cId) {
		return repo.selectCommentByPK(cId);
	}
	
	// 입력
	public void insertComment(Comment comment) {
		repo.insertComment(comment);
	}
	
	// 삭제
	public void deleteComment(int cId) {
		repo.deleteComment(cId);
	}
	
	// 수정
	public void updateComment(Comment comment) {
		repo.updateComment(comment);
	}
}