package com.san.spring.daoimpl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.san.spring.dao.CommentDao;
import com.san.spring.dto.CommentDto;

@Repository
public class CommentDaoimpl implements CommentDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public boolean updatestep(CommentDto commentDto) {
		System.out.println("Dao updatestep");
		int result = sqlSession.update("updatestep", commentDto);
		return result>0?true:false;
	}

	@Override
	public boolean addMainBbsComment(CommentDto commentDto) {
		System.out.println("Dao - addMainBbsComment");
		int result = sqlSession.insert("addMainBbsComment", commentDto);
		return result>0?true:false;
	}

	@Override
	public boolean addQnaBbsComment(CommentDto commentDto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean addReply(CommentDto commentDto) {
		System.out.println("Dao - addReply");
		int result = sqlSession.insert("addReply", commentDto);
		return result>0?true:false;
	}

	@Override
	public List<CommentDto> getCmtList(String post_number) {
		return sqlSession.selectList("getCmtList", post_number);
	}


}
