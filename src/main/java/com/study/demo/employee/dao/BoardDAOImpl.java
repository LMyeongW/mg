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
	
	//게시물 작성
	@Override
	public void boardWrite(BoardVO boardvo) {
		sql.insert(namespace+".boardWrite", boardvo);
	}
	
	//게시물 리스트
	@Override
	public List<BoardVO> boardlist(int sqlPostNum, int postNum) {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("sqlPostNum", sqlPostNum);
		data.put("postNum", postNum);
		
		return sql.selectList(namespace+".boardlist", data);
	}
	
	//게시물 갯수
	@Override
	public int boardTotalcount() {
		return sql.selectOne(namespace+".boardTotalcount");
	}
	
	//게시물 상세페이지
	@Override
	public Object boardDetail(int boardNo) {
		return sql.selectOne(namespace+".boardDetail", boardNo);
	}
	
	//게시물 수정
	@Override
	public void boardUpdate(BoardVO boardvo) {
		sql.update(namespace+".boardUpdate", boardvo);
	}
	
	//게시물 삭제
	@Override
	public void boardDelete(BoardVO boardvo) {
		sql.delete(namespace+".boardDelete", boardvo);
		
	}
}
