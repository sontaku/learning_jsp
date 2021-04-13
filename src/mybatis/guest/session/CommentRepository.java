package mybatis.guest.session;

import java.io.*;
import java.util.*;

import mybatis.guest.model.Comment;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.*;

public class CommentRepository {
	// private final String namespace = "CommentMapper";

	private SqlSessionFactory getSqlSessionFactory() {

		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream("mybatis-config.xml");
		} catch (IOException e) {
			throw new IllegalArgumentException(e);
		}
		SqlSessionFactory sessFactory = new SqlSessionFactoryBuilder().build(inputStream);
		return sessFactory;
	}

	/*
	 * JDBC : Connection MyBatis : SqlSession
	 */
	// select 문의 결과를 1개이든 여러개이든 list로 받아 병렬 처리함
	public List<Comment> selectComment() {
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		try {
			return sqlSess.selectList("CommentMapper.selectComment");

		} finally {
			// 반환
			sqlSess.close();
		}
	}

	public Comment selectCommentByPK(int cId) {
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		try {
//			Comment result = sqlSess.selectOne("");
//			return result;
			return sqlSess.selectOne("CommentMapper.selectCommentByPK", cId);
		} finally {
			// 반환
			sqlSess.close();
		}
	}

	public void insertComment(Comment comment) {
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		try {
			int result = sqlSess.insert("CommentMapper.insertComment", comment);
			if(result == 1) sqlSess.commit();
		} finally {
			// 반환
			sqlSess.close();
		}
	}

	// 삭제
	public void deleteComment(int cId) {
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		try {
			int result = sqlSess.delete("CommentMapper.deleteComment", cId);
			if(result == 1) sqlSess.commit();
		} finally {
			// 반환
			sqlSess.close();
		}
	}

	public void updateComment(Comment comment) {
		SqlSession sqlSess = getSqlSessionFactory().openSession();
		try {
			int result = sqlSess.update("CommentMapper.updateComment", comment);
			if(result == 1) sqlSess.commit();
		} finally {
			// 반환
			sqlSess.close();
		}
	}
}
