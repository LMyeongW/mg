package com.study.demo.employee;


import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.study.demo.employee.service.MemberService;
import com.study.demo.vo.employeeVO;

@Controller
@RequestMapping("/account")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
    @Autowired
    private BCryptPasswordEncoder pwEncoder;
    
    @Autowired
    private JavaMailSender mailSender;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public ModelAndView joinGET() {
		
		logger.info("회원가입 페이지 진입");
		
		return new ModelAndView("/account/join");
	}
	
	@RequestMapping(value="/join", method = RequestMethod.POST)
	public ModelAndView joinPOST(employeeVO employeevo) {
		ModelAndView mav = new ModelAndView();
		logger.info("회원가입 실행");
		
		String rawPw = "";
		String encodePw = "";
		
		rawPw = employeevo.getEmployeePw();
		encodePw = pwEncoder.encode(rawPw);
		employeevo.setEmployeePw(encodePw);
		
		
		memberService.employeeJoin(employeevo);
		
		logger.info("회원가입 입력 정보" + employeevo);
		
		mav.setViewName("redirect:/");
		
		return mav;
	}
	
	@RequestMapping(value="/employeeIdCk", method = RequestMethod.GET)
	@ResponseBody
	public String employeeIdCk(String employeeId)throws Exception{
		
		int result = memberService.idCheck(employeeId);
		
		logger.info("결과값" + result);
		
		if(result != 0) {
			return "fail"; //중복o
		} else {
			return "success"; //중복x
		}
		
		
	}
	
	
	@RequestMapping(value="/emailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String emailCheck(String email) throws Exception {
		
		//뷰로부터 넘어오는 데이터
		logger.info("뷰로부터 넘어오는 email : "+ email);
		
		Random random = new Random();
		int checkNum = random.nextInt(888888)+111111;
		logger.info("인증번호 : "+ checkNum);
		
		String setFrom = "emali";
		String toMail = email;
		String title = "회원가입 인증 이메일입니다.";
		String content =
                "홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
		/*try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }*/
        
		String num = Integer.toString(checkNum);
		
		return num;
	}
	
	@RequestMapping(value ="/login", method = RequestMethod.GET)
	public ModelAndView loginGET() {
		logger.info("로그인페이지집입");
		return new ModelAndView("/account/login");
	}
	
	@RequestMapping(value ="/login.do", method = RequestMethod.POST)
	public String loginPOST(HttpServletRequest request, employeeVO employeevo, RedirectAttributes rttr) {
		
		System.out.println("전달된 데이터 : " + employeevo);
		
		HttpSession session = request.getSession();
		String rawPw ="";
		String encodePw ="";
		
		employeeVO emplovo = memberService.employeeLogin(employeevo);
		
		System.out.println("담긴 데이터  : " + emplovo);
		
		if(emplovo != null) {
			rawPw = employeevo.getEmployeePw();       
			encodePw = emplovo.getEmployeePw();  
			if(true == pwEncoder.matches(rawPw, encodePw) ) {   
				
				emplovo.setEmployeePw("");                
				session.setAttribute("member", emplovo);
				
				if(emplovo.getLogin_appr() == 0) {
					rttr.addFlashAttribute("msg", "회원가입 승인 대기중입니다.");
					session.invalidate(); //세션초기화
					System.out.println("로그인 세션 : "+ session);
					return "redirect:/account/login";
				} else if(emplovo.getLogin_appr() == 2) {
					rttr.addFlashAttribute("msg", "회원가입 승인이 거부되었습니다.");
					session.invalidate(); //세션초기화
					System.out.println("로그인 세션 : "+ session);
					return "redirect:/account/login";
				}
				System.out.println("로그인 세션 : "+ session);
				return "redirect:/main";
			} else {
				rttr.addFlashAttribute("result", 0);
				return "redirect:/account/login";
			}
			
		}else{
			rttr.addFlashAttribute("result", 0);
			return "redirect:/account/login";
		}

	}
	
    /* 로그아웃 */
    @RequestMapping(value="logout.do", method=RequestMethod.GET)
    public String logoutMainGET(HttpServletRequest request) throws Exception{
        
        logger.info("logoutMainGET메서드 진입");
        
        HttpSession session = request.getSession();
        
        session.invalidate();
        
        return "redirect:/account/login";        
        
    }
}
