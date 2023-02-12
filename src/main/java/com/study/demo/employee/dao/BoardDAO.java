package com.study.demo.employee.dao;

import java.util.List;

import com.study.demo.vo.BoardVO;

public interface BoardDAO {

	void boardWrite(BoardVO boardvo);

	List<BoardVO> boardlist(int sqlPostNum, int postNum);

	int boardTotalcount();

	Object boardDetail(int boardNo);

	void boardUpdate(BoardVO boardvo);

	void boardDelete(BoardVO boardvo);

}
