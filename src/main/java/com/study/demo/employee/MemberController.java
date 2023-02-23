package com.study.demo.employee;


import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.study.demo.employee.service.MemberService;
import com.study.demo.vo.AttachImageVO;
import com.study.demo.vo.MyprofileVO;
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
				} else if(emplovo.getLogin_appr() == 3) {
					rttr.addFlashAttribute("msg", "더 이상 이용하실 수 없는 아이디입니다.");
					session.invalidate(); //세션초기화
					System.out.println("로그인 세션 : "+ session);
					return "redirect:/account/login";
				} 
				
				
				System.out.println("로그인 세션 : "+ session);
				return "redirect:/main";
			} else {
				rttr.addFlashAttribute("msg", "아이디나 비밀번호를 확인해주세요.");
				rttr.addFlashAttribute("result", 0);
				return "redirect:/account/login";
			}
			
		}else{
			rttr.addFlashAttribute("msg", "존재하지 않는 아이디입니다.");
			rttr.addFlashAttribute("result", 0);
			return "redirect:/account/login";
		}

	}
	
    /* 로그아웃 */
    @RequestMapping(value="/logout.do", method=RequestMethod.GET)
    public String logoutMainGET(HttpServletRequest request) throws Exception{
        
        logger.info("logoutMainGET메서드 진입");
        
        HttpSession session = request.getSession();
        
        session.invalidate();
        
        return "redirect:/main";        
        
    }
    
    //프로필 사진 업로드
    @RequestMapping(value = "/uploadProfileImg", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public ResponseEntity<List<MyprofileVO>> uploadProfileImg (MultipartFile[] uploadFile) {
    	
    	//이미지파일 체크
    	for(MultipartFile multipartFile : uploadFile) {
    		File checkfile = new File(multipartFile.getOriginalFilename());
    		String type = null; //MIME TYPE을 저장할 String 타입의 type 변수를 선언하고 null로 초기화
    		
    		try {
				type = Files.probeContentType(checkfile.toPath());
				logger.info("MIME TYPE : "+ type);
			} catch (IOException e) {
				e.printStackTrace();
			}
    		
    		//startsWiath() 메서드는 String 타입의 데이터를 파라미터로 전달받음 체크대상인 String데이터가 메서드의 파라미터로 전달 문자로 받으면 true 그렇지 않으면 false
    		//type.image가 아니라면
    		if(!type.startsWith("image")) {
    			List<MyprofileVO> list = null; //list는 null
    			return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST); //리턴
    		}
    	}//for
    	
    	
    	//저장경로
    	String uploadFolder = "C:\\uploadProfile";
    	
    	//날짜 문자열 얻기
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	
    	//오늘날짜 데이터 얻기
    	Date date = new Date();
    	
    	//문자열에 오늘날짜 데이터 삽입
    	String str = sdf.format(date);
    	
    	//날짜 사이 - 를 separator로 변경 -> (yyyy-MM-dd를 yyyy\MM\dd로 변경)
    	String datePath = str.replace("-", File.separator);
    	
    	//폴더 생성(경로, 파일이름)
    	File uploadPath = new File(uploadFolder, datePath);
    	
    	//폴더 생성시 중복으로 생성되는거 방지 -> 파일이 존재하지않을시 mkdirs(디렉토리)생성
    	if(uploadPath.exists() == false) {
    		uploadPath.mkdirs();
    	}
    	
    	//이미지 정보 담는 객체 -> 원본/썸네이일 이미지 여러개파일 보내기 때문에 ArrayList에 담아서 보내야함 -> 하나일땐 list가 아닌 인스턴스화해서 go
    	List<MyprofileVO> list = new ArrayList();
    	
    	
    	//향상된 for
    	for(MultipartFile multipartFile : uploadFile) {
			logger.info("-----------------------------------------------");
			logger.info("파일 이름 : " + multipartFile.getOriginalFilename());
			logger.info("파일 타입 : " + multipartFile.getContentType());
			logger.info("파일 크기 : " + multipartFile.getSize());			
			
			//이미지 정보 객체
			MyprofileVO vo = new MyprofileVO();
			
			//파일이름
			String uploadFileName = multipartFile.getOriginalFilename();
			vo.setProfileName(uploadFileName); // vo파일이름
			vo.setProfileLoadPath(datePath); //vo날짜 경로
			
			//uuid 적용 파일 이름 (같은이름 중독되서 파일이 삭제되는걸 방지하기 랜덤으로 이름적용)
			String uuid = UUID.randomUUID().toString();
			vo.setProfileUuid(uuid); //vo uuid이름
			
			uploadFileName = uuid + "_" + uploadFileName;
			
			//파일위치, 파일이름 합친 file객체(경로, 파일이름)
			File saveFile = new File(uploadPath, uploadFileName);
			
			//파일저장 오류 발생할 수 있으므로 try/catch사용
			try {
				multipartFile.transferTo(saveFile);//transferTo파일저장메서드
				
				//썸네일 생성(ImageIO)-> 이미지를 읽어오거나 생성
				//BufferedImage의 경우 이미지 데이터를 처리하거나 조작에 필요한 값과 메서드를 제공
				//Graphics2D 그림을 그리는데 필요한 설정값과 메서드 제공
				//s_+ 이미지 이름 
				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);
				
				BufferedImage bo_image =  ImageIO.read(saveFile);
				System.out.println(bo_image);//원본파일
				
				double ratio = 1;
				/*넓이 높이*/
				int width = (int) (bo_image.getWidth() / ratio);
				int height = (int) (bo_image.getHeight() / ratio);
				
				BufferedImage bt_image = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);//넓이, 높이, 생성될 이미지 타입
				System.out.println(bt_image);//썸네일파일
				
				Graphics2D graphic = bt_image.createGraphics();//bt_image이미지를 그리는데 필요한 설정값 메서드
				
				graphic.drawImage(bo_image, 0, 0, width, height, null);
				
				ImageIO.write(bt_image, "jpg", thumbnailFile);
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			list.add(vo);//vo객체를 list의 요소로 추가
			
		}//for
    	
    	ResponseEntity<List<MyprofileVO>> result = new ResponseEntity<List<MyprofileVO>>(list, HttpStatus.OK);
    	
		return result;
    }
    
    //화면 이미지 출력
    @RequestMapping(value="/display", method = RequestMethod.GET)
    public ResponseEntity<byte[]> getProFileImage(String profileName){
    	
    	logger.info("getProFileImage()........" + profileName);
    	
    	File file = new File("C:\\uploadProfile\\" + profileName);
    	
    	ResponseEntity<byte[]> result = null;//뷰로 반환할 ResponseEntity객체의 주소를 저장할 참조변수를 선언하고 null로 초기화
    	
		try {
			
			HttpHeaders header = new HttpHeaders();
			header.add("content-type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			
		}catch (IOException e) {
			
			e.printStackTrace();
		}
		return result;
	}
    
	//이미지 정보 반환
    @RequestMapping(value="/profileImage", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<MyprofileVO>> profileImage(String employeeId){
		
		logger.info("profileImage.........." + memberService.profileImage(employeeId));
		
		return new ResponseEntity<List<MyprofileVO>>(memberService.profileImage(employeeId), HttpStatus.OK);
	}
    
    
    //이미지 삭제
    @RequestMapping(value="/deleteFile", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String profileName){
		
		logger.info("deleteFile........" + profileName);
		
		File file = null;
		
		try {
			//썸네일 이미지 삭제
			file = new File("C:\\uploadProfile\\" + URLDecoder.decode(profileName, "UTF-8"));//인코딩되어있기 때문에 다시 디코딩해서 경로찾아야함
			file.delete();
			
			//원본이미지 삭제
			String originFileName = file.getAbsolutePath().replace("s_", "");
			
			logger.info("originFileName : " + originFileName);
			
			file = new File(originFileName);
			
			file.delete();
			
		}catch(Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);
		}
		return new ResponseEntity<String>("success", HttpStatus.OK);
		
	}
    
    //이미지 삭제
	@RequestMapping(value = "/imgDatadelete", method = RequestMethod.GET)
	@ResponseBody
	public void imgDatedelete(@ModelAttribute("employeevo")employeeVO employeevo) {
		
		memberService.imgDatadelete(employeevo);
		
		logger.info("employeevo{} : " + employeevo);
	}
    
    
    
    //이미지 변경
    @RequestMapping(value="/profilePost", method = RequestMethod.POST)
    public ModelAndView profilePost(employeeVO employeevo) {
    	ModelAndView mav = new ModelAndView();
    	
    	System.out.println(employeevo);
    	memberService.profileImgData(employeevo);
    	
    	mav.setViewName("jsonView");
    	return mav;
    }
    
    //아이디찾기페이지
    @RequestMapping(value="/searchId", method = RequestMethod.GET)
    public ModelAndView searchId() {
    	ModelAndView mav = new ModelAndView();
    	
    	mav.setViewName("/account/search_id");
    	return mav;
    }
    
    //아이디찾기
    @RequestMapping(value="/searchId.do", method = RequestMethod.GET)
    public ModelAndView search_result_Id(@ModelAttribute("employeevo")employeeVO employeevo
    		) {
    	ModelAndView mav = new ModelAndView();

    	employeeVO searchInfo = memberService.searchId(employeevo);
    	
    	mav.addObject("data", searchInfo);
    	System.out.println(searchInfo);
    	mav.setViewName("jsonView");
    	return mav;
    }
    
    //이메일 체크
	@RequestMapping(value="/idEmailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String idEmailCheck(String email) throws Exception {
		
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
	
    //비번찾기 페이지
    @RequestMapping(value="/searchPw", method = RequestMethod.GET)
    public ModelAndView searchPw() {
    	ModelAndView mav = new ModelAndView();
    	
    	mav.setViewName("/account/search_pw");
    	
    	return mav;
    }
    
    //비번찾기
    @RequestMapping(value="/searchPw.do", method = RequestMethod.GET)
    public ModelAndView search_pw(@ModelAttribute("employeevo")employeeVO employeevo) {
    	ModelAndView mav = new ModelAndView();

    	employeeVO searchInfo = memberService.searchPw(employeevo);
    	
    	mav.addObject("data", searchInfo);
    	System.out.println(searchInfo);
    	mav.setViewName("jsonView");
    	return mav;
    }
    
    //비번찾기
    @RequestMapping(value="/searchPwUpdate.do", method = RequestMethod.POST)
    public ModelAndView searchPwUpdate(@ModelAttribute("employeevo")employeeVO employeevo) {
    	ModelAndView mav = new ModelAndView();
    	
    	System.out.println(employeevo);
    	
		String rawPw = "";
		String encodePw = "";
		
		rawPw = employeevo.getEmployeePw();
		encodePw = pwEncoder.encode(rawPw);
		employeevo.setEmployeePw(encodePw);
    	
    	memberService.searchPwUpdate(employeevo);
    	
    	mav.setViewName("jsonView");
    	return mav;
    }
    
    //마이페이지
    @RequestMapping(value="/mypage", method = RequestMethod.GET)
    public ModelAndView mypageGET() {
    	ModelAndView mav = new ModelAndView();
    	
    	mav.setViewName("/account/mypage");
    	
    	return mav;
    }
    
    //마이비번 확인
    @RequestMapping(value="/mypwck", method = RequestMethod.GET)
    public ModelAndView mypwck(@ModelAttribute("employeevo")employeeVO employeevo) {
    	ModelAndView mav = new ModelAndView();
    	
    	employeeVO emplovo = memberService.mypwck(employeevo);

		String rawPw ="";
		String encodePw ="";
		
		
		
		rawPw = employeevo.getEmployeePw();       
		encodePw = emplovo.getEmployeePw();  
		System.out.println(encodePw);
		
		boolean endata = pwEncoder.matches(rawPw, encodePw);
		
		mav.addObject("data", endata);
    	System.out.println("전달된데이터" + employeevo);
    	System.out.println("담긴데이터" + emplovo);

    	
    	mav.setViewName("jsonView");
    	return mav;
    }
    
    //마이 비번변경
    @RequestMapping(value="/mypwch", method = RequestMethod.POST)
    public ModelAndView mypwch(@ModelAttribute("employeevo")employeeVO employeevo){
    	ModelAndView mav = new ModelAndView();
    	
    	System.out.println(employeevo);
    	
		String rawPw = "";
		String encodePw = "";
		
		rawPw = employeevo.getEmployeePw();
		encodePw = pwEncoder.encode(rawPw);
		employeevo.setEmployeePw(encodePw);
    	
    	memberService.mypwch(employeevo);
    	
    	mav.setViewName("jsonView");
    	
    	return mav;
    }
}
