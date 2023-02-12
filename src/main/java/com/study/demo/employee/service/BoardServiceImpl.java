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
	
	@Override
	public void boardWrite(BoardVO boardvo) {
		boardDao.boardWrite(boardvo);
		
	}

	@Override
	public List<BoardVO> boardlist(int sqlPostNum, int postNum) {
		return boardDao.boardlist(sqlPostNum, postNum);
	}

	@Override
	public int boardTotalcount() {
		return boardDao.boardTotalcount();
	}

	@Override
	public Object boardDetail(int boardNo) {
		return boardDao.boardDetail(boardNo);
		
	}

	@Override
	public void boardUpdate(BoardVO boardvo) {
		 boardDao.boardUpdate(boardvo);
	}

	@Override
	public void boardDelete(BoardVO boardvo) {
		 boardDao.boardDelete(boardvo);
		
	}

}
