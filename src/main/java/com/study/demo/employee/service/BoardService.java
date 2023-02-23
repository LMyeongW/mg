package com.study.demo.employee.service;

import java.util.List;

import com.study.demo.vo.BoardVO;

public interface BoardService {
	
	//게시판 작성
	void boardWrite(BoardVO boardvo);
	
	//게시판 리스트
	List<BoardVO> boardlist(int sqlPostNum, int postNum);
	
	//게시판 갯수
	int boardTotalcount();
	
	//게시판 상세페이지
	Object boardDetail(int boardNo);
	
	//게시판 수정
	void boardUpdate(BoardVO boardvo);
	
	//게시판 삭제
	void boardDelete(BoardVO boardvo);

	

}
