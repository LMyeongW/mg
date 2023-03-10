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
import javax.servlet.ServletRequest;
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
import com.study.demo.employee.service.AnnouncementService;
import com.study.demo.employee.service.ApplicationService;
import com.study.demo.employee.service.AttachService;
import com.study.demo.vo.AnnouncementVO;
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
	
	@Autowired
	private AnnouncementService announcementService;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	//?????????????????????
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
	
	//???????????? ???????????????
	@RequestMapping(value = "/joindetail", method = RequestMethod.GET)
	public ModelAndView joindetailGET(String employeeId,  @ModelAttribute("employeevo")employeeVO employeevo) throws UnsupportedEncodingException {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("data", employeeService.joinDetail(employeeId));
		
		employeevo.setQustr();
		mav.setViewName("admin/joindetail");
		
		return mav;
	}
	
	//???????????? ??????
	@RequestMapping(value = "/joindetail", method = RequestMethod.POST)
	public ModelAndView joinApprPOST(@ModelAttribute("employeevo")employeeVO employeevo) {
		ModelAndView mav = new ModelAndView();
		
		employeeService.joinAppr(employeevo);
		mav.setViewName("redirect:/admin/employeelist");
		
		return mav;
	}
	
	//???????????? ?????? ??????
	@RequestMapping(value="/joindelete", method = RequestMethod.GET)
	public ModelAndView joinDeleteGET(@RequestParam("employeeId")String employeeId, @ModelAttribute("employeevo")employeeVO employeevo) throws UnsupportedEncodingException{
		ModelAndView mav = new ModelAndView();
		employeeService.joindelete(employeeId);
		
		System.out.println(employeeId);
		
		employeevo.setQustr();
		mav.setViewName("redirect:/admin/refusalPop");
		return mav;
	}
	
	//???????????? ????????????
	@RequestMapping(value="/joindelete.do", method = RequestMethod.POST)
	@ResponseBody
	public  List<String> joinDeletePOST(@RequestBody List<String> employeeIdArray) {
		
		logger.info("employeeIdArray={}", employeeIdArray);
		employeeService.selectDelete(employeeIdArray);
		
		return employeeIdArray;
	}
	
	@RequestMapping(value="/refusalSelectCancel", method = RequestMethod.POST)
	@ResponseBody
	public  List<String> refusalSelectCancel(@RequestBody List<String> employeeIdArray) {
		
		logger.info("employeeIdArray={}", employeeIdArray);
		employeeService.refusalSelectCancel(employeeIdArray);
		
		return employeeIdArray;
	}
	
	//???????????? ??????
	@RequestMapping(value="/refusalUpdate", method = RequestMethod.GET)
	public ModelAndView refusalUpdateGET(@ModelAttribute("employeevo")employeeVO employeevo){
		ModelAndView mav = new ModelAndView();
		
		employeeService.refusalUpdate(employeevo);
		mav.setViewName("redirect:/admin/joinlist");
		return mav;
	}
	
	//???????????? ?????? ?????? ?????????
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
	
	//???????????? ?????? ?????? ??????
	@RequestMapping(value="/cencelRefusal", method = RequestMethod.GET)
	public ModelAndView cencelRefusalGET(@ModelAttribute("employeevo")employeeVO employeevo) {
		ModelAndView mav = new ModelAndView();
		
		employeeService.cencelRefusal(employeevo);
		mav.setViewName("redirect:/admin/refusalPop");
		
		return mav;
	}
	
	
	//??????????????????????????????
	@RequestMapping(value = "/employeelist", method = RequestMethod.GET)
	public ModelAndView employeeList() {
		
		ModelAndView mav = new ModelAndView();

		mav.setViewName("admin/mgList");
	
		return mav;
	}
	
	//???????????????????????????
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

	//???????????????????????????
	@RequestMapping(value="/employeeUpdatePop", method = RequestMethod.GET)
	public ModelAndView employeeUpdatePop(@RequestParam("emploNo")int emploNo){
		ModelAndView mav = new ModelAndView();

		mav.addObject("data", employeeService.employeeSelect(emploNo));
		mav.setViewName("/admin/employeeUpdatePop");
		
		return mav;
	}
	
	//????????????????????????
	@RequestMapping(value="/employeeUpdatePop", method = RequestMethod.POST)
	@ResponseBody
	public void employeeUpdatePOST(@ModelAttribute("employeevo")employeeVO employeevo) {
		
		logger.info("???????????? ??????={}", employeevo);
		employeeService.employeeUpdatePOST(employeevo);
		
	}
	
	
	//???????????????????????????
	@RequestMapping(value="/employeedetail", method = RequestMethod.GET)
	public ModelAndView employeeDetailGET(@RequestParam("emploNo")int emploNo, @ModelAttribute("employeevo")employeeVO employeevo) throws UnsupportedEncodingException {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("data", employeeService.employeeSelect(emploNo));
		
		employeevo.setQustr();
		
		mav.setViewName("admin/employeeDetail");
	
		return mav;
	}
	
	//???????????? ??????
	@RequestMapping(value="/employeedetail", method = RequestMethod.POST)
	@ResponseBody
	public void employeeDetailPOST(@ModelAttribute("employeevo")employeeVO employeevo) {
		
		System.out.println("@@@@@@@@@ : "+employeevo.getBonusPercent());
		System.out.println("@@@@@@@@@ : "+employeevo.getBonus());
		employeeService.employeeDetailPOST(employeevo);
	}
	
	//???????????? ?????????
	@RequestMapping(value ="/uploadAjaxAction", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AttachImageVO>> uploadAjaxActionPOST(MultipartFile[] uploadFile) { // MultiparFile??? ?????? ????????? ????????? ?????? ???(View)?????? ????????? multipart ????????? ????????? ?????? ??? ????????? ????????? ???????????????
		
		logger.info("uploadAjaxAction...............");
		
		/* ????????? ?????? ?????? */
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
		
		//?????? ?????? ??????
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		String datePath = str.replace("-", File.separator);
		
		/* ?????? ?????? */
		File uploadPath = new File(uploadFolder, datePath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		/*????????? ?????? ?????? ??????*/
		List<AttachImageVO> list = new ArrayList<AttachImageVO>();
		
		// ????????? for
		for(MultipartFile multipartFile : uploadFile) {
			
			/*????????? ?????? ??????*/
			AttachImageVO attachImagevo = new AttachImageVO();
			
			/* ?????? ?????? */
			String uploadFileName = multipartFile.getOriginalFilename();
			attachImagevo.setFileName(uploadFileName);
			attachImagevo.setUploadPath(datePath);
			
			/* uuid ?????? ?????? ?????? (????????? ????????? ?????? ????????? ???????????? ?????? ????????? ????????? ???????????? ???????????? ????????????. ????????? ???????????? ??????) */
			/*  UUID(?????? ?????? ?????????)??? ?????? ?????? ?????????????????? ???????????? ?????? ?????????(????????????)?????? ?????? */
			String uuid = UUID.randomUUID().toString();
			attachImagevo.setUuid(uuid);
			
			uploadFileName = uuid + "_" + uploadFileName;
			
			/* ?????? ??????, ?????? ????????? ?????? File ?????? */
			File saveFile = new File(uploadPath, uploadFileName);
			
			/* ?????? ?????? */
			try {
				multipartFile.transferTo(saveFile);
				
				/*????????? ??????(ImageIO)*/
				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);
				
				BufferedImage bo_image = ImageIO.read(saveFile);
				
					/*??????*/
					double ratio = 1;
					/*?????? ??????*/
					int width = (int) (bo_image.getWidth()/ratio);
					int height = (int)(bo_image.getHeight()/ratio);
				
				BufferedImage bt_image = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);//????????? ?????? ??????
				
				Graphics2D graphic = bt_image.createGraphics();
				graphic.drawImage(bo_image, 0, 0, width, height, null); //???????????? ????????? ????????? ?????? x, y ?????? 0 ,0 ??????????????? null??????
				
				ImageIO.write(bt_image, "jpg", thumbnailFile); // ???????????? ????????? ????????? ????????? , ???????????? ??????????????? , ???????????? ???????????? ????????? ????????? ???????????? ????????? file????????? ??????
				
				/*??????2 thumbnailaotor ??????????????? ??????*/
				/*File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);	
				
				BufferedImage bo_image = ImageIO.read(saveFile);

					//?????? 
					double ratio = 3;
					//?????? ??????
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
	
	//????????? ??????
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
	
	//????????? ?????? ??????
	@GetMapping(value="/AttachImage", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AttachImageVO>> AttachImage(int emploNo){
		
		logger.info("AttachImage.........." + attachService.AttachImage(emploNo));
		
		return new ResponseEntity<List<AttachImageVO>>(attachService.AttachImage(emploNo), HttpStatus.OK);
	}
	
	
	//????????? ?????? ??????
	@RequestMapping(value = "deleteFile", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName){
		
		logger.info("deleteFile()........" + fileName);
		
		File file = null;
		
		try {
			
			/* ????????? ?????? ?????? */
			file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8")); //????????? ??????????????? ?????????????????? ?????????
			
			file.delete(); //?????? ?????? ??????
			
			/*?????? ?????? ??????*/
			String originFileName = file.getAbsolutePath().replace("s_", ""); //?????? ???????????? ???????????? ?????? File ????????? ????????? ?????????(String) ????????? ???????????? ??????
			
			logger.info("originFileName : " + originFileName);
			
			file = new File(originFileName);
			
			file.delete(); //????????????
			
			
		}catch (Exception e){
			e.printStackTrace();
			
			return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED); //????????????
		}
	
		return new ResponseEntity<String>("success", HttpStatus.OK); //try????????? ?????? ?????? ??????????????? ?????? ????????? ???????????? ?????? ??????
	}
	
	//???????????????
	@RequestMapping(value = "/imgDatadelete.do", method = RequestMethod.GET)
	@ResponseBody
	public void imgDatedelete(@ModelAttribute("employeevo")AttachImageVO attachImagevo) {
		
		attachService.imgDatedelete(attachImagevo);
		
		logger.info("attachImagevo{} : " + attachImagevo);
	}
	
	//????????????????????????
	@RequestMapping(value="/resignation", method = RequestMethod.GET)
	public ModelAndView resignation() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/admin/resignation");
		return mav;
	}
	
	//??????????????????
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
	
	//????????? ????????????
	@RequestMapping(value="/resignationDetail", method = RequestMethod.GET)
	public ModelAndView resignationDetail(@RequestParam("emploNo")int emploNo){
		ModelAndView mav = new ModelAndView();

		mav.addObject("data", employeeService.resignationDetail(emploNo));
		mav.setViewName("/admin/resignationDetail");
		
		return mav;
	}
	
	//????????? ????????????
	@RequestMapping(value="/resignationDetail.do", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView resignationDetailUpdate(@ModelAttribute("employeevo")employeeVO employeevo){
		ModelAndView mav = new ModelAndView();
		employeeService.resignationDetailUpdate(employeevo);
		
		System.out.println(employeevo);
		
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	//???????????????
	@RequestMapping(value="/resignationDelete.do", method = RequestMethod.GET)
	@ResponseBody
	public void resignationDelete(@ModelAttribute("employeevo")employeeVO employeevo) {
		
		employeeService.resignationDelete(employeevo);
	}
	
	//????????? ????????????
	@RequestMapping(value = "/resignationSelectDelete.do", method =  RequestMethod.POST)
	@ResponseBody
	public List<String> resignationSelectDelete(@RequestBody List<String> employNoArray){
		
		logger.info("employeeIdArray={}", employNoArray);
		
		employeeService.resignationSelectDelete(employNoArray);
		
		return employNoArray;
	}
	
	//????????? ??????
	@RequestMapping(value = "/application", method = RequestMethod.GET)
	public ModelAndView applicationGET() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/admin/applicationList");
		return mav;
	}
	//????????? ?????? ??????
	@RequestMapping(value ="/applicationList.do", method = RequestMethod.GET)
	public ModelAndView applicationList(@ModelAttribute("applicationvo")ApplicationVO applicationvo,
			String searchKeyword,
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
	
	//????????? ???????????????
	@RequestMapping(value = "/applApprovalPage", method = RequestMethod.GET)
	public ModelAndView applApprovalPageGet(@RequestParam("applNo")int applNo) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("data", applicationService.applApprovalPage(applNo));
		
		mav.setViewName("/admin/approvalPop");
		return mav;
	}
	
	//????????? ??????
	@RequestMapping(value = "/applApprovalPage", method = RequestMethod.POST)
	@ResponseBody
	public void applApprovalPagePost(@ModelAttribute("applicationvo")ApplicationVO applicationvo) {
		
		applicationService.applApprovalUpdate(applicationvo);
		
		System.out.println(applicationvo);
	}
	
	//????????? ??????
	@RequestMapping(value = "/applApprovalDelete", method = RequestMethod.GET)
	public ModelAndView applApprovalDelete(@ModelAttribute("applicationvo")ApplicationVO applicationvo) {
		ModelAndView mav = new ModelAndView();
		
		applicationService.applApprovalDelete(applicationvo);
		
		mav.setViewName("redirect:/admin/application");
		return mav;
	}
	

	//????????? ????????????
	@RequestMapping(value = "/applicationSelectDelete.do", method =  RequestMethod.POST)
	@ResponseBody
	public List<String> applicationSelectDelete(@RequestBody List<String> applNoArray){
		
		logger.info("employeeIdArray={}", applNoArray);
		
		employeeService.applicationSelectDelete(applNoArray);
		
		return applNoArray;
	}
	
	//???????????? ???????????????
	@RequestMapping(value="/announcementWrite", method = RequestMethod.GET)
	public ModelAndView announcementWriteGET() {
		
		return new ModelAndView("/announcement/announcementWrite");
	}
	
	//???????????? ??????
	@RequestMapping(value ="/announcementWrite", method = RequestMethod.POST)
	public ModelAndView announcementWritePOST(@ModelAttribute("announcementvo")AnnouncementVO announcementvo, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		System.out.println(announcementvo);
		
		announcementvo.setAnnouncementContent(announcementvo.getAnnouncementContent().replace("\r\n", "<br>"));
		announcementService.announcementWrite(announcementvo);

		mav.setViewName("jsonView");
		return mav;
	}
	
	//???????????? ???????????????
	@RequestMapping(value ="announcementUpdate", method = RequestMethod.GET)
	public ModelAndView announcementUpdateGET(@RequestParam("announcementNo")int announcementNo, @ModelAttribute("announcementvo")AnnouncementVO announcementvo) {
		ModelAndView mav = new ModelAndView();
		
		AnnouncementVO  rtnVo = (AnnouncementVO) announcementService.announcementUpdateGET(announcementNo);
		rtnVo.setAnnouncementContent(rtnVo.getAnnouncementContent().replace("<br>", "\r\n"));
		
		
		mav.addObject("data", rtnVo);
		
		mav.setViewName("/announcement/announcementUpdate");
		return mav;
	}
	
	//???????????? ??????
	@RequestMapping(value ="announcementUpdate", method = RequestMethod.POST)
	public ModelAndView announcementUpdatePOST(@ModelAttribute("announcementvo")AnnouncementVO announcementvo ) {
		ModelAndView mav = new ModelAndView();
		
		System.out.println(announcementvo);
		announcementvo.setAnnouncementContent(announcementvo.getAnnouncementContent().replace("\r\n", "<br>"));
		announcementService.announcementUpdatePOST(announcementvo);
		
		mav.setViewName("jsonView");
		return mav;
	}
	
	//???????????? ??????
	@RequestMapping(value ="announcementDelete", method = RequestMethod.GET)
	public ModelAndView announcementDelete(@ModelAttribute("announcementvo")AnnouncementVO announcementvo, @RequestParam("announcementNo")int announcementNo ) {
		ModelAndView mav = new ModelAndView();
		
		System.out.println(announcementNo);
		announcementService.announcementDelete(announcementNo);
		mav.setViewName("jsonView");
		return mav;
	}
	
	
	
}
