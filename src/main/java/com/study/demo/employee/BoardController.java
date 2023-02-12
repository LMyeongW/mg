package com.study.demo.employee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.study.demo.employee.service.BoardService;
import com.study.demo.vo.BoardVO;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value ="/write", method = RequestMethod.GET)
	public ModelAndView boardWrite() {
		return new ModelAndView("/board/boardWrite");
	}
	
	@RequestMapping(value ="/write", method = RequestMethod.POST)
	public ModelAndView boardWritePOST(@ModelAttribute("boardvo")BoardVO boardvo) {
		ModelAndView mav = new ModelAndView();
		
		System.out.println(boardvo);
		boardService.boardWrite(boardvo);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="/detail", method = RequestMethod.GET)
	public ModelAndView boardDetail(@RequestParam("boardNo")int boardNo) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("data", boardService.boardDetail(boardNo));
		mav.setViewName("/board/boardDetail");
		return mav;
	}
	
	@RequestMapping(value="/update", method = RequestMethod.POST)
	public ModelAndView boardUpdatePOST(@ModelAttribute("boardvo")BoardVO boardvo) {
		ModelAndView mav = new ModelAndView();
		
		System.out.println("게시판 수정 : " + boardvo);
		boardService.boardUpdate(boardvo);
		
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="/delete", method = RequestMethod.GET)
	public ModelAndView boardDelete(@ModelAttribute("boardvo")BoardVO boardvo) {
		ModelAndView mav = new ModelAndView();
		
		boardService.boardDelete(boardvo);
		
		mav.setViewName("redirect:/main");
		return mav;
	}
}
