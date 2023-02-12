package com.study.demo.employee.service;

import java.util.List;

import com.study.demo.vo.BoardVO;

public interface BoardService {
	
	//게시판 작성
	void boardWrite(BoardVO boardvo);

	List<BoardVO> boardlist(int sqlPostNum, int postNum);

	int boardTotalcount();

	Object boardDetail(int boardNo);

	void boardUpdate(BoardVO boardvo);

	void boardDelete(BoardVO boardvo);

	

}
