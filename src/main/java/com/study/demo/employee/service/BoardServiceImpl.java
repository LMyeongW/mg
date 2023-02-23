package com.study.demo.employee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.demo.employee.dao.BoardDAO;
import com.study.demo.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardDAO boardDao;
	
	//게시물 작성
	@Override
	public void boardWrite(BoardVO boardvo) {
		boardDao.boardWrite(boardvo);
	}
	
	//게시물 리스트
	@Override
	public List<BoardVO> boardlist(int sqlPostNum, int postNum) {
		return boardDao.boardlist(sqlPostNum, postNum);
	}
	//게시물 갯수
	@Override
	public int boardTotalcount() {
		return boardDao.boardTotalcount();
	}
	
	//게시물 상세페이지
	@Override
	public Object boardDetail(int boardNo) {
		return boardDao.boardDetail(boardNo);
	}
	
	//게시물 수정
	@Override
	public void boardUpdate(BoardVO boardvo) {
		 boardDao.boardUpdate(boardvo);
	}
	
	//게시물 삭제
	@Override
	public void boardDelete(BoardVO boardvo) {
		 boardDao.boardDelete(boardvo);
		
	}

}
