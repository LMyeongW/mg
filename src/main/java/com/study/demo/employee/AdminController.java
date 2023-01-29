package com.study.demo.employee;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.study.demo.employee.service.AdminService;
import com.study.demo.employee.service.ApplicationService;
import com.study.demo.employee.service.AttachService;
import com.study.demo.vo.ApplicationVO;
import com.study.demo.vo.AttachImageVO;
import com.study.demo.vo.Page;
import com.study.demo.vo.employeeVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService employeeService;
	
	@Autowired
	private AttachService attachService;
	
	@Autowired
	private ApplicationService applicationService;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	//회원가입리스트
	@RequestMapping(value = "/joinlist", method = RequestMethod.GET)
	public ModelAndView joinList(@RequestParam(value="num", defaultValue = "1")int num,
			@ModelAttribute("employeevo")employeeVO employeevo, HttpServletRequest request,
			@ModelAttribute("searchKeyword")String searchKeyword
			) throws UnsupportedEncodingException {
		ModelAndView mav = new ModelAndView();
		
		System.out.println(searchKeyword);
		Page page = new Page();
		
		page.setNum(num);
		page.setTotalCount(employeeService.jointotalCount(searchKeyword));
		page.setSearchKeyword(searchKeyword);
		List<employeeVO> list = employeeService.listPage(page.getSqlPostNum(), page.getPostNum(), searchKeyword);
		
		mav.addObject("data", list);
		mav.addObject("page", page);
		mav.addObject("select", num);
		
		employeevo.setQustr();
		mav.setViewName("admin/joinList");
		System.out.println(mav);
		
		return mav;
	}
	
	//회원가입 상세페이지
	@RequestMapping(value = "/joindetail", method = RequestMethod.GET)
	public ModelAndView joindetailGET(String employeeId,  @ModelAttribute("employeevo")employeeVO employeevo) throws UnsupportedEncodingException {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("data", employeeService.joinDetail(employeeId));
		
		employeevo.setQustr();
		mav.setViewName("admin/joindetail");
		
		return mav;
	}
	
	//회원가입 승인
	@RequestMapping(value = "/joindetail", method = RequestMethod.POST)
	public ModelAndView joinApprPOST(@ModelAttribute("employeevo")employeeVO employeevo) {
		ModelAndView mav = new ModelAndView();
		
		employeeService.joinAppr(employeevo);
		mav.setViewName("redirect:/admin/employeelist");
		
		return mav;
	}
	
	//회원가입 정보 삭제
	@RequestMapping(value="/joindelete", method = RequestMethod.GET)
	public ModelAndView joinDeleteGET(@RequestParam("employeeId")String employeeId, @ModelAttribute("employeevo")employeeVO employeevo) throws UnsupportedEncodingException{
		ModelAndView mav = new ModelAndView();
		employeeService.joindelete(employeeId);
		
		System.out.println(employeeId);
		
		employeevo.setQustr();
		mav.setViewName("redirect:/admin/refusalPop");
		return mav;
	}
	
	//거절목록 선택삭제
	@RequestMapping(value="/joindelete.do", method = RequestMethod.POST)
	@ResponseBody
	public  List<String> joinDeletePOST(@RequestBody List<String> employeeIdArray) {
		
		logger.info("employeeIdArray={}", employeeIdArray);
		employeeService.selectDelete(employeeIdArray);
		
		return employeeIdArray;
	}
	
	//회원가입 거절
	@RequestMapping(value="/refusalUpdate", method = RequestMethod.GET)
	public ModelAndView refusalUpdateGET(@ModelAttribute("employeevo")employeeVO employeevo){
		ModelAndView mav = new ModelAndView();
		
		employeeService.refusalUpdate(employeevo);
		mav.setViewName("redirect:/admin/joinlist");
		return mav;
	}
	
	//회원가입 승인 거절 팝업창
	@RequestMapping(value="/refusalPop", method = RequestMethod.GET)
	public ModelAndView refusalPopGET(@RequestParam(value="num", defaultValue = "1")int num, @ModelAttribute("employeevo")employeeVO employeevo){
		ModelAndView mav = new ModelAndView();

		logger.info("refusalPopGET.......");
		
		Page page = new Page();
		page.setNum(num);
		page.setTotalCount(employeeService.refusaltotalCount());
		
		List<employeeVO> refusalList = employeeService.refusalList(page.getSqlPostNum(), page.getPostNum());
		mav.addObject("data", refusalList);
		mav.addObject("page", page);
		mav.addObject("select", num);
	
		mav.setViewName("/admin/refusalPop");
		System.out.println(mav);
		
		return mav;
	}
	
	//회원가입 승인 거절 취소
	@RequestMapping(value="/cencelRefusal", method = RequestMethod.GET)
	public ModelAndView cencelRefusalGET(@ModelAttribute("employeevo")employeeVO employeevo) {
		ModelAndView mav = new ModelAndView();
		
		employeeService.cencelRefusal(employeevo);
		mav.setViewName("redirect:/admin/refusalPop");
		
		return mav;
	}
	
	
	//사원관리리스트페이지
	@RequestMapping(value = "/employeelist", method = RequestMethod.GET)
	public ModelAndView employeeList() {
		
		ModelAndView mav = new ModelAndView();

		mav.setViewName("admin/mgList");
	
		return mav;
	}
	
	//사원관리리스트출력
	@RequestMapping(value = "/employeelist.do", method = RequestMethod.GET)
	public ModelAndView employeelistSort(@ModelAttribute("orderType")String orderType,
			@ModelAttribute("searchKeyword")String searchKeyword,
			@ModelAttribute("statusIdSelect")String statusIdSelect,
			@ModelAttribute("employeevo")employeeVO employeevo,
			@RequestParam(value="num", defaultValue = "1")int num) throws UnsupportedEncodingException {
		
		ModelAndView mav = new ModelAndView();
		
		Page page = new Page();
		
		HashMap<String, Object> rtnMap = new HashMap<String, Object>();
		
		System.out.println(searchKeyword);
		System.out.println(statusIdSelect);
		
		page.setNum(num);
		page.setTotalCount(employeeService.emploTotalCount(searchKeyword, statusIdSelect));
		
		List<employeeVO> list = employeeService.emploListSort(orderType, page.getSqlPostNum(), page.getPostNum(), searchKeyword, statusIdSelect);
		
		DecimalFormat decFormat = new DecimalFormat("###,###,###,###,###,###");
		
		for(int i = 0; i < list.size(); i++) {
			list.get(i).setSalary2(decFormat.format(list.get(i).getSalary()));
		}
		
		rtnMap.put("list", list);
		rtnMap.put("page", page);
		rtnMap.put("orderType", orderType);
		rtnMap.put("select", num);
		mav.addObject("data", rtnMap);
		
		employeevo.setQustr();
		System.out.println(list.toString());
		mav.setViewName("jsonView");
		return mav;
	}

	//사원정보수정팝업창
	@RequestMapping(value="/employeeUpdatePop", method = RequestMethod.GET)
	public ModelAndView employeeUpdatePop(@RequestParam("emploNo")int emploNo){
		ModelAndView mav = new ModelAndView();

		mav.addObject("data", employeeService.employeeSelect(emploNo));
		mav.setViewName("/admin/employeeUpdatePop");
		
		return mav;
	}
	
	//사원정보팝업수정
	@RequestMapping(value="/employeeUpdatePop", method = RequestMethod.POST)
	@ResponseBody
	public void employeeUpdatePOST(@ModelAttribute("employeevo")employeeVO employeevo) {
		
		logger.info("업데이트 정보={}", employeevo);
		employeeService.employeeUpdatePOST(employeevo);
		
	}
	
	
	//사원관리상세페이지
	@RequestMapping(value="/employeedetail", method = RequestMethod.GET)
	public ModelAndView employeeDetailGET(@RequestParam("emploNo")int emploNo, @ModelAttribute("employeevo")employeeVO employeevo) throws UnsupportedEncodingException {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("data", employeeService.employeeSelect(emploNo));
		
		employeevo.setQustr();
		
		mav.setViewName("admin/employeeDetail");
	
		return mav;
	}
	
	//사원정보 수정
	@RequestMapping(value="/employeedetail", method = RequestMethod.POST)
	@ResponseBody
	public void employeeDetailPOST(@ModelAttribute("employeevo")employeeVO employeevo) {
		
		System.out.println("@@@@@@@@@ : "+employeevo.getBonusPercent());
		System.out.println("@@@@@@@@@ : "+employeevo.getBonus());
		employeeService.employeeDetailPOST(employeevo);
	}
	
	//첨부파일 업로드
	@RequestMapping(value ="/uploadAjaxAction", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AttachImageVO>> uploadAjaxActionPOST(MultipartFile[] uploadFile) { // MultiparFile에 대해 간략히 설명을 하면 뷰(View)에서 전송한 multipart 타입의 파일을 다룰 수 있도록 해주는 인터페이스
		
		logger.info("uploadAjaxAction...............");
		
		/* 이미지 파일 체크 */
		for(MultipartFile multipartFile: uploadFile) {
			
			File checkfile = new File(multipartFile.getOriginalFilename());
			String type = null;
			
			try {
				type = Files.probeContentType(checkfile.toPath());
				logger.info("MIME TYPE : " + type);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			if(!type.startsWith("image")) {
				
				List<AttachImageVO> list = null;
				return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);
			}
		}//for
		
		String uploadFolder = "C:\\upload";
		
		//날짜 폴더 경로
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		String datePath = str.replace("-", File.separator);
		
		/* 폴더 생성 */
		File uploadPath = new File(uploadFolder, datePath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		/*이미지 정보 담는 객체*/
		List<AttachImageVO> list = new ArrayList<AttachImageVO>();
		
		// 향상된 for
		for(MultipartFile multipartFile : uploadFile) {
			
			/*이미지 정보 객체*/
			AttachImageVO attachImagevo = new AttachImageVO();
			
			/* 파일 이름 */
			String uploadFileName = multipartFile.getOriginalFilename();
			attachImagevo.setFileName(uploadFileName);
			attachImagevo.setUploadPath(datePath);
			
			/* uuid 적용 파일 이름 (동일한 이름을 가진 파일을 저장하게 되면 기존의 파일을 덮어씌워 버린다는 점입니다. 이러한 문제점을 보완) */
			/*  UUID(범용 고유 식별자)는 쉽게 말해 국제기구에서 표준으로 정한 식별자(일련번호)라고 생각 */
			String uuid = UUID.randomUUID().toString();
			attachImagevo.setUuid(uuid);
			
			uploadFileName = uuid + "_" + uploadFileName;
			
			/* 파일 위치, 파일 이름을 합친 File 객체 */
			File saveFile = new File(uploadPath, uploadFileName);
			
			/* 파일 저장 */
			try {
				multipartFile.transferTo(saveFile);
				
				/*썸네일 생성(ImageIO)*/
				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);
				
				BufferedImage bo_image = ImageIO.read(saveFile);
				
					/*비율*/
					double ratio = 1;
					/*넓이 높이*/
					int width = (int) (bo_image.getWidth()/ratio);
					int height = (int)(bo_image.getHeight()/ratio);
				
				BufferedImage bt_image = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);//이미지 너비 지정
				
				Graphics2D graphic = bt_image.createGraphics();
				graphic.drawImage(bo_image, 0, 0, width, height, null); //저장되는 이미지 파일의 좌표 x, y 너비 0 ,0 일반적으로 null사용
				
				ImageIO.write(bt_image, "jpg", thumbnailFile); // 첫번째는 파일로 저장할 이미지 , 두번째는 이미지형식 , 세번째는 이미지가 저장될 경로와 이름으로 생성한 file객체를 부여
				
				/*방법2 thumbnailaotor 라이브러리 사용*/
				/*File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);	
				
				BufferedImage bo_image = ImageIO.read(saveFile);

					//비율 
					double ratio = 3;
					//넓이 높이
					int width = (int) (bo_image.getWidth() / ratio);
					int height = (int) (bo_image.getHeight() / ratio);					
				
				
				Thumbnails.of(saveFile)
		        .size(width, height)
		        .toFile(thumbnailFile);*/
				
			} catch (Exception e) {
				e.printStackTrace();
			} 
			list.add(attachImagevo);
		}//for
		ResponseEntity<List<AttachImageVO>> result = new ResponseEntity<List<AttachImageVO>>(list, HttpStatus.OK);
		
		return result;
	}
	
	//이미지 출력
	@RequestMapping(value ="/display", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getImage(String fileName) {
		
		logger.info("getImage()........" + fileName);
		
		File file = new File("c:\\upload\\" + fileName);
		
		ResponseEntity<byte[]> result = null;
		
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
	@GetMapping(value="/AttachImage", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AttachImageVO>> AttachImage(int emploNo){
		
		logger.info("AttachImage.........." + attachService.AttachImage(emploNo));
		
		return new ResponseEntity<List<AttachImageVO>>(attachService.AttachImage(emploNo), HttpStatus.OK);
	}
	
	
	//이미지 파일 삭제
	@RequestMapping(value = "deleteFile", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName){
		
		logger.info("deleteFile()........" + fileName);
		
		File file = null;
		
		try {
			
			/* 썸네일 파일 삭제 */
			file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8")); //기존에 파일이름에 인코딩햇던걸 풀어줌
			
			file.delete(); //파일 삭제 코드
			
			/*원본 파일 삭제*/
			String originFileName = file.getAbsolutePath().replace("s_", ""); //해당 메서드를 호출하면 대상 File 객체의 경로를 문자열(String) 타입의 데이터로 반환
			
			logger.info("originFileName : " + originFileName);
			
			file = new File(originFileName);
			
			file.delete(); //파일삭제
			
			
		}catch (Exception e){
			e.printStackTrace();
			
			return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED); //예외발생
		}
	
		return new ResponseEntity<String>("success", HttpStatus.OK); //try문에서 예외 없이 성공적으로 처리 햇다는 문자열을 뷰로 전달
	}
	
	//이미지삭제
	@RequestMapping(value = "/imgDatadelete.do", method = RequestMethod.GET)
	@ResponseBody
	public void imgDatedelete(@ModelAttribute("employeevo")AttachImageVO attachImagevo) {
		
		attachService.imgDatedelete(attachImagevo);
		
		logger.info("attachImagevo{} : " + attachImagevo);
	}
	
	//퇴사자관리페이지
	@RequestMapping(value="/resignation", method = RequestMethod.GET)
	public ModelAndView resignation() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/admin/resignation");
		return mav;
	}
	
	//퇴사자리스트
	@RequestMapping(value="/resignationList", method = RequestMethod.GET)
	public ModelAndView resignationList(@ModelAttribute("employeevo")employeeVO employeevo,
			@ModelAttribute("searchKeyword")String searchKeyword,
			@ModelAttribute("orderType")String orderType,
			@RequestParam(value="num", defaultValue = "1")int num) throws UnsupportedEncodingException {
		
		ModelAndView mav = new ModelAndView();
		
		System.out.println(orderType);
		System.out.println(searchKeyword);
		
		Page page = new Page();
		
		HashMap<String, Object> rtnMap = new HashMap<String, Object>();
		
		page.setNum(num);
		page.setTotalCount(employeeService.resignationTotalCount(searchKeyword));
		
		List<employeeVO> list = employeeService.resignationList(page.getSqlPostNum(), page.getPostNum(), orderType, searchKeyword);
		
		rtnMap.put("list", list);
		rtnMap.put("page", page);
		rtnMap.put("orderType", orderType);
		rtnMap.put("select", num);
		
		mav.addObject("data", rtnMap);
		
		System.out.println("list = "+ rtnMap);
		
		employeevo.setQustr();
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	//퇴사자 상세정보
	@RequestMapping(value="/resignationDetail", method = RequestMethod.GET)
	public ModelAndView resignationDetail(@RequestParam("emploNo")int emploNo){
		ModelAndView mav = new ModelAndView();

		mav.addObject("data", employeeService.resignationDetail(emploNo));
		mav.setViewName("/admin/resignationDetail");
		
		return mav;
	}
	
	//퇴사자 상세수정
	@RequestMapping(value="/resignationDetail.do", method = RequestMethod.POST)
	@ResponseBody
	public void resignationDetailUpdate(@ModelAttribute("employeevo")employeeVO employeevo){
		
		employeeService.resignationDetailUpdate(employeevo);
		
		System.out.println(employeevo);
	}
	
	//퇴사자삭제
	@RequestMapping(value="/resignationDelete.do", method = RequestMethod.GET)
	@ResponseBody
	public void resignationDelete(@ModelAttribute("employeevo")employeeVO employeevo) {
		
		employeeService.resignationDelete(employeevo);
	}
	
	//퇴사자 선택삭제
	@RequestMapping(value = "/resignationSelectDelete.do", method =  RequestMethod.POST)
	@ResponseBody
	public List<String> resignationSelectDelete(@RequestBody List<String> employNoArray){
		
		logger.info("employeeIdArray={}", employNoArray);
		
		employeeService.resignationSelectDelete(employNoArray);
		
		return employNoArray;
	}
	
	//신청서 목록
	@RequestMapping(value = "/application", method = RequestMethod.GET)
	public ModelAndView applicationGET() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/admin/applicationList");
		return mav;
	}
	//신청서 목록 출력
	@RequestMapping(value ="/applicationList.do", method = RequestMethod.GET)
	public ModelAndView applicationList(@ModelAttribute("applicationvo")ApplicationVO applicationvo,
			@ModelAttribute("searchKeyword")String searchKeyword,
			@RequestParam(value="num", defaultValue = "1")int num) {
		
		System.out.println(searchKeyword);
		ModelAndView mav = new ModelAndView();
		
		Page page = new Page();
		
		HashMap<String, Object> rtnMap = new HashMap<String, Object>();
		
		page.setNum(num);
		page.setTotalCount(applicationService.applTotalCount(searchKeyword));
		
		List<ApplicationVO> list = applicationService.applicationList(page.getSqlPostNum(), page.getPostNum(), searchKeyword);
		
		System.out.println(list);
		
		rtnMap.put("page", page);
		rtnMap.put("list", list);
		rtnMap.put("select", num);
		mav.addObject("data", rtnMap);
		
		System.out.println(rtnMap);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	@RequestMapping(value = "/applApprovalPage", method = RequestMethod.GET)
	public ModelAndView applApprovalPageGet(@RequestParam("applNo")int applNo) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("data", applicationService.applApprovalPage(applNo));
		
		mav.setViewName("/admin/approvalPop");
		return mav;
	}
	
	@RequestMapping(value = "/applApprovalPage", method = RequestMethod.POST)
	@ResponseBody
	public void applApprovalPagePost(@ModelAttribute("applicationvo")ApplicationVO applicationvo) {
		
		applicationService.applApprovalUpdate(applicationvo);
		
		System.out.println(applicationvo);
	}
	
	@RequestMapping(value = "/applApprovalDelete", method = RequestMethod.GET)
	public ModelAndView applApprovalDelete(@ModelAttribute("applicationvo")ApplicationVO applicationvo) {
		ModelAndView mav = new ModelAndView();
		
		applicationService.applApprovalDelete(applicationvo);
		
		mav.setViewName("redirect:/admin/application");
		return mav;
	}
	
	//
	
	//버려?
	@RequestMapping(value = "/statusSelect.do", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView statusSelect(@ModelAttribute("statusType")String statusType) {
		ModelAndView mav = new ModelAndView();
		System.out.println(statusType);
		
		List<employeeVO> list = employeeService.statusSelect(statusType);
		mav.addObject("data", list);
		return mav;
	}
	

	
	
	
}
