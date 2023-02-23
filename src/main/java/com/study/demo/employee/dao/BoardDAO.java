package com.study.demo.employee.dao;

import java.util.List;

import com.study.demo.vo.BoardVO;

public interface BoardDAO {
	
	//게시물 작성
	void boardWrite(BoardVO boardvo);
	
	//게시물 리스트
	List<BoardVO> boardlist(int sqlPostNum, int postNum);
	
	//게시물 갯수
	int boardTotalcount();
	
	//게시물 상세페이지
	Object boardDetail(int boardNo);
	
	//게시물 수정
	void boardUpdate(BoardVO boardvo);
	
	//게시물 삭제
	void boardDelete(BoardVO boardvo);

}
