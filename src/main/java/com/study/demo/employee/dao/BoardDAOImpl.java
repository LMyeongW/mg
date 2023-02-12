package com.study.demo.employee.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.study.demo.vo.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO{
	@Autowired 
	private SqlSession sql;
	
	private static String namespace="board";

	@Override
	public void boardWrite(BoardVO boardvo) {
		sql.insert(namespace+".boardWrite", boardvo);
		
	}

	@Override
	public List<BoardVO> boardlist(int sqlPostNum, int postNum) {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("sqlPostNum", sqlPostNum);
		data.put("postNum", postNum);
		
		return sql.selectList(namespace+".boardlist", data);
	}

	@Override
	public int boardTotalcount() {
		return sql.selectOne(namespace+".boardTotalcount");
	}

	@Override
	public Object boardDetail(int boardNo) {
		return sql.selectOne(namespace+".boardDetail", boardNo);
	}

	@Override
	public void boardUpdate(BoardVO boardvo) {
		sql.update(namespace+".boardUpdate", boardvo);
	}

	@Override
	public void boardDelete(BoardVO boardvo) {
		sql.delete(namespace+".boardDelete", boardvo);
		
	}
}
