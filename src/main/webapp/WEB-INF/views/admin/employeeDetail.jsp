<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 페이지</title>
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/employeeDetail.css">
</head>

<body>
    <div id="wrap">
        <!-- header -->
        <main>
            <div class="detail_wrap">
            	
                <div class="detail_box1">
                <form method="post" id="detail_form" name="detailForm">
                	<input type="hidden" name="emploNo" value="${data.emploNo}"/>
                    <div class="detail_top">
                        <h2>사원 상세페이지</h2>
                    </div>
                    <div class="id_picture_box">
                        <div class="id_picture">
                            <span></span>
                            <span></span>
                        </div>
                        
 
                        
                        <!-- <div class="picture">
                        	<div class="imgDeleteBtn" data-file="fileCllPath ">
                        		<span class="line1"></span>
                        		<span class="line2"></span>
                        	</div>
                        </div> -->
                        <div class="form_section_content">
                        	<div id="uploadResult">
																		
							</div>
                    	</div>
                        <div class="picture_btn">
                        	<label for="fileItem">사진선택</label>
                           	<input type ="file" id ="fileItem" name='uploadFile' >
                            
           
                        </div>
                        
                    </div>
                    <div class="content">
                        <div class="name">· 사원명 : <span class="c1"> ${data.employeeName}</span></div>
                        <div class="name">· 사원번호 : <span class="c1"> ${data.emploNo}</span></div>
                        <div class="box1">
                            <div class="department">
                                · 부서 : 
                                <select name="departmentId" id ="departmentId" >
                                    <option selected> ${data.departmentId}</option>
                                    <option value="A1" <c:out value=" ${data.departmentId eq 'A1' ?'selected':''}"/>>회계팀</option>
                                    <option value="D1" <c:out value=" ${data.departmentId eq 'D1' ?'selected':''}"/>>디자인팀</option>
                                    <option value="D2" <c:out value=" ${data.departmentId eq 'D2' ?'selected':''}"/>>개발팀</option>
                                    <option value="M1" <c:out value=" ${data.departmentId eq 'M1' ?'selected':''}"/>>마케팅</option>
                                    <option value="P1" <c:out value=" ${data.departmentId eq 'P1' ?'selected':''}"/>>인사팀</option>
                                    <option value="P2" <c:out value=" ${data.departmentId eq 'P2' ?'selected':''}"/>>홍보팀</option>
                                    <option value="S1" <c:out value=" ${data.departmentId eq 'S1' ?'selected':''}"/>>서비스팀</option>
                                    <option value="D00" <c:out value=" ${data.departmentId eq 'D00' ?'selected':''}"/>>미정</option>
                                </select>
                            </div>

                            <div class="position">
                                · 직급 : 
                                <select name="positionId" id="positionId">
                                    <option selected> ${data.positionId}</option>
                                    <option value="07" <c:out value=" ${data.positionId eq '07' ?'selected':''}"/>>인턴</option>
                                    <option value="06" <c:out value=" ${data.positionId eq '06' ?'selected':''}"/>>사원</option>
                                    <option value="05" <c:out value=" ${data.positionId eq '05' ?'selected':''}"/>>주임</option>
                                    <option value="04" <c:out value=" ${data.positionId eq '04' ?'selected':''}"/>>대리</option>
                                    <option value="03" <c:out value=" ${data.positionId eq '03' ?'selected':''}"/>>과장</option>
                                    <option value="08" <c:out value=" ${data.positionId eq '08' ?'selected':''}"/>>차장</option>
                                    <option value="02" <c:out value=" ${data.positionId eq '02' ?'selected':''}"/>>부장</option>
                                    <option value="01" <c:out value=" ${data.positionId eq '01' ?'selected':''}"/>>이사</option>
                                    <option value="00" <c:out value=" ${data.positionId eq '00' ?'selected':''}"/>>사장</option>
                                    <option value="P00" <c:out value=" ${data.positionId eq 'P00' ?'selected':''}"/>>미정</option>
                                </select>
                            </div>
                        </div>

                        <div class="box2">
                            <div class="status">
                                · 직원구분 : 
                                <select name="statusId" id="statusId">
                                    <option selected> ${data.statusId}</option>
                                    <option value="01" <c:out value=" ${data.statusId eq '01' ?'selected':''}"/>>정규</option>
                                    <option value="02" <c:out value=" ${data.statusId eq '02' ?'selected':''}"/>>계약</option>
                                    <option value="03" <c:out value=" ${data.statusId eq '03' ?'selected':''}"/>>퇴사</option>
                                    <option value="04" <c:out value=" ${data.statusId eq '04' ?'selected':''}"/>>퇴직</option>
                                    <option value="05" <c:out value=" ${data.statusId eq '05' ?'selected':''}"/>>해고</option>
                                    <option value="06" <c:out value=" ${data.statusId eq '06' ?'selected':''}"/>>계약완료</option>
                                    <option value="00" <c:out value=" ${data.statusId eq '00' ?'selected':''}"/>>미정</option>
                                </select>
                            </div>
    
                            <div class="comreg">
                                · 입사일 : <span><input type="date" name="comregdate" value="${data.comregdate}" id="comregdate"></span>
                            </div>
                        </div>
                        
                        <div class="salary">· 기본급 : <span><input type="text" placeholder="급여를 입력하세요." name="salary" id = "salary" value ="${data.salary}" ></span></div>
                        <div class="bonus">· 상여금 : <span><input type="text" placeholder="퍼센트" name="bonusPercent"  value ="${data.bonusPercent}" class="bonusPer"> %</span> <span class="s1">=</span> <span><input type="text" placeholder="상여금액." name="bonus" readonly="readonly" value ="${data.bonus}" class="bonusm"></span></div>
                        <div class="totalSalary">· 총액 :<span class="s1"> </span> <span><input type="text" name="totalSalary" readonly="readonly" value ="${data.totalSalary}" class="totalSalary"></span></div>
                        

                    </div>
                    <!-- .content -->
                    <div class="content1">
                        <div class="addr">
                            <span>· 주소</span> <span class="addr_search" onclick="execution_daum_address()">주소변경</span>
                            <br>
                                <span class="a1"><input type="text"  name="employeeAddr1" id = "addr1" readonly="readonly" value ="${data.employeeAddr1}" ></span>
                            <br>
                                <span class="a1"><input type="text"  name="employeeAddr2" id = "addr2" readonly="readonly" value ="${data.employeeAddr2}" ></span>
                            <br>
                                <span class="a1"><input type="text"  name="employeeAddr3" id = "addr3" readonly="readonly" value ="${data.employeeAddr3}" ></span>

                        </div>
                        <div class="birthday">· 생년월일 : <span>${data.employeeBirthday1}-${data.employeeBirthday2}-${data.employeeBirthday3}</span></div>
                        <div class="phone">· 전화번호 : <span><input type="text" placeholder="전화번호를 입력해주세요." name="employeePhone" id="employeePhone" value ="${data.employeePhone}" ></span></div>
                        <div class="email">· Email : <span><input type="text" placeholder="이메일을 입력해주세요." name="employeeMail" id="employeeMail" value ="${data.employeeMail}" ></span></div>
                    </div>
                    <!-- .content1 -->
                    <div class="btn_box">
                        <div class="register"><a href="javascript:void(0)" id="register_btn">등록</a></div>
                        <div class="cencel"><a href="javascript:void(0)" id = "cencel_btn">취소</a></div>
                    </div>
                    <!-- .btn_box -->
                </form>
                </div>
                <!-- .detail_box -->
                
            </div>
            <!-- detail_wrap -->
        </main>
        <!-- main -->

        <footer></footer>
        <!-- footer -->
    </div>
    <!-- #wrap -->
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>



	$("input[type='file']").on("change", function(e){
		
		/* 이미지 존재시 삭제 */
		if($(".imgDeleteBtn").length > 0){
			deleteFile();
		}

		
		var formData = new FormData();//<form> 태그와 같은 역할을 해주는 FormData객체를 생성하여 첨부파일을 FormData에 저장을 하고 FormData 자체를 서버로 전송
		var fileInput = $('input[name="uploadFile"]');
		var fileList = fileInput[0].files; //파일리스트
		var fileObj = fileList[0];  //파일
		/*if(!fileCheck(fileObj.name, fileObj.size)){
			return false;
		}*/
		
		formData.append("uploadFile", fileObj); //기존 특정 Key 있는 상태에서 동일한 Key로 데이터를 추가하면 기존 값을 덮어쓰지 않고 기존 값 집합의 끝에 새로운 값을 추가
		
		$.ajax({
			url: "/admin/uploadAjaxAction", //서버로 요청을 보낼 url
			processData : false, //서버로 전송할 데이터를 queryStirng 형태로 변환할지 여부
			contentType : false, //서버로 전송되는 데이터의 content-type
			data : formData, //서버로 전송할 데이터
			type : "POST", //서보 요청 타입(GET, POST)
			dataType : 'json', //서버로부터 반환받을 데이터 타입
			success : function(result){
				console.log(result);
				showUploadImage(result);
			},
			error : function(result){
				alert("이미지 파일이 아닙니다.");
			}
		});
		

		//<input> 태그에 multiple 속성을 부여하여서 사용자가 여러 개의 파일을 선택할 수 있다면 아래와 같이 코드를 작성
		/*for(let i = 0; i < fileList.length; i++){
			formData.append("uploadFile", fileList[i]);
		}*/
		
		/*console.log("fileList : "+ fileList.name);
		console.log("fileObj : "+ fileObj.size);
		
		console.log("fileName : " + fileObj.name);
		console.log("fileSize : " + fileObj.size);
		console.log("fileType(MimeType) : " + fileObj.type);*/
	});
	

	
	//파일체크
	let regex = new RegExp("(.*?)\.(jpg|png)$");  //jpg,png 파일만 허용
	let maxSize = 1048576; //1MB
	
	function fileCheck(fileName, fileSize){
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과!");
			return false;
		}
		
		if(!regex.test(fileName)){ //! not 논리 연산자 즉 
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		return true;
	}

	/*이미지 출력*/
	function showUploadImage(uploadResultArr){
		
		/*전달받은 데이터 검증*/
		if(!uploadResultArr || uploadResultArr.lenght == 0){return}
		var targetFile = $(".imgDeleteBtn").data("file");
		var uploadResult = $(".id_picture_box");
		var obj = uploadResultArr[0];
		var str ="";
		var fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName);
		str += "<div class='picture'>";
		str += "<img  class='img' src='/admin/display?fileName=" + fileCallPath +"'>";
		str += " <div class='imgDeleteBtn' data-file='" + fileCallPath + "'><span class='line1'></span> <span class='line2'></span> </div>"
		str += "<input type='hidden' name='fileName' value='"+ obj.fileName +"'>";
		str += "<input type='hidden' name='uuid' value='"+ obj.uuid +"'>";
		str += "<input type='hidden' name='uploadPath' value='"+ obj.uploadPath +"'>";
		str += "</div>";
		
		uploadResult.append(str);
		
		if(obj.uuid != "" || obj.uuid != null){
			$(".picture_btn").hide();
		}
		
		$(".imgDeleteBtn").click(function(){
			$(".picture_btn").show();
		});
	}
	
	$(document).ready(function(){
		var emploNo ='<c:out value="${data.emploNo}"/>';
		var uploadReslut = $("#uploadResult");
		
		$.getJSON("/admin/AttachImage", {emploNo : emploNo}, function(arr){	
			
			if(arr.length === 0){			
				return;
				
				let str = "";
				str += "<div class='picture'>";
				
				str += "</div>";
				
				uploadReslut.html(str);	
			}
			
			var str = "";
			var obj = arr[0];
			
			var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
			str += "<div class='picture'";
			str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
			str += ">";
			str += "<img  class='img' src='/admin/display?fileName=" + fileCallPath +"'>";
			str += " <div class='imgDeleteBtn' data-file='" + fileCallPath + "'><span class='line1'></span> <span class='line2'></span> </div>"
			str += "<input type='hidden' name='fileName' value='"+ obj.fileName +"'>";
			str += "<input type='hidden' name='uuid' value='"+ obj.uuid +"'>";
			str += "<input type='hidden' name='uploadPath' value='"+ obj.uploadPath +"'>";
			str += "</div>";
			
			uploadReslut.html(str);	
			console.log(str);
			
			if(obj.uuid != "" || obj.uuid != null){
				$(".picture_btn").hide();
			}
			
			$(".imgDeleteBtn").click(function(){
				$(".picture_btn").show();
			});
		});
	});
	
	$(".id_picture_box").on("click", ".imgDeleteBtn", function(e){
		deleteFile();
	});
	
	
	
	//삭제메서드
	function deleteFile(){
		
		var targetFile = $(".imgDeleteBtn").data("file"); //fileName 속성명에 targetFile(이미지 파일 경로) 속성 값을 부여
		var targetDiv = $(".picture");
		
		$.ajax({
			url : '/admin/deleteFile',
			data : {fileName : targetFile},
			dataType : 'text', //문자 데이터이기 때문에 text
			type : 'POST',
			success : function(result){
				console.log(result);
				
				targetDiv.remove();
				$("input[type='file']").val("");
				
				var data = $('form[name=detailForm]').serialize();
				
				$.ajax({
					type : 'GET',
					url : '/admin/imgDatadelete.do',
					data : data,
					success : function(data){
	
							console.log("이미지 삭제 : "+ data);
					
	 				}
				});
				
			},
			error : function(result){
				console.log(result);
				
				alert("파일을 삭제하지 못하였습니다.")
			}
			
			
		});
		
	}
	
	//유효성체크
	var departCk = false;
	var positionCk = false;
	var statusCk = false;
	var salaryCk = false;
	var addrCk = false;
	var phoneCk = false;
	var emailCk = false;
	var comreg = false;
	
	$(document).ready(function(){
		$("#register_btn").click(function(){
			
			var department = $('#departmentId').val();
			var position = $('#positionId').val();
			var status = $('#statusId').val();
			var sal = $('#salary').val();
			var addr1 = $('#addr1').val();
			var addr2 = $('#addr1').val();
			var addr3 = $('#addr1').val();
			var phone = $('#employeePhone').val();
			var email = $('#employeeMail').val();
			var comreg = $('#comregdate').val();
			
			if(department == ""|| department == null ){
				alert("부서를 선택해주세요.");
				departCk = false;
			} else {
				departCk = true;
			}
			
			if(position == ""|| position == null ){
				alert("직급을 선택해주세요.");
				positionCk = false;
			} else {
				positionCk = true;
			}
			
			if(status == ""|| status == null ){
				alert("직원구분을 선택해주세요.");
				statusCk = false;
			} else {
				statusCk = true;
			}
			
			if(sal == ""|| sal == null ){
				alert("급여를 작성해주세요.");
				salaryCk = false;
			} else {
				salaryCk = true;
			}
			
			if(addr3 == ""|| addr3 == null ){
				alert("주소를 입력해주세요..");
				addrCk = false;
			} else {
				addrCk = true;
			}
			
			if(phone == ""|| phone == null ){
				alert("전화번호를 입력해주세요..");
				phoneCk = false;
			} else {
				phoneCk = true;
			}
			
			if(email == ""|| email == null ){
				alert("이메일을 입력해주세요..");
				emailCk = false;
			} else {
				emailCk = true;
			}
			
			if(comreg == ""|| comreg == null ){
				alert("입사일은 선택해주세요");
				comreg = false;
			} else {
				comreg = true;
			}
			
			if(departCk&&positionCk&&statusCk&&salaryCk&&addrCk&&phoneCk&&emailCk&&comreg) {
				
				var data = $('form[name=detailForm]').serialize();
				console.log(decodeURI(data));
				
				var con = confirm("정말 등록하시겠습니까?");
				
				if(con == true){
					$.ajax({
						
						type : 'post',
						url : '/admin/employeedetail',
						data : data,
						success : function(data){
							alert("등록에 성공하였습니다.");
							//window.close();
							opener.location.reload();
							location.reload();

		 				},
		 				error : function(){
		 					alert("등록에 실패하였습니다.");
		 				}
						
					});
				}else if(con == false){
					alert("등록을 취소하였습니다.");
				}
				
				
			}//유효성 검사
	
		});//등록버튼 클릭이벤트
		
		$('#cencel_btn').click(function(){
			window.close();
		}); //취소 버튼
	});
	
	/*다음 주소 연동*/
	function execution_daum_address(){
		 
    	new daum.Postcode({
        	oncomplete: function(data) {
            	// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            
        		// 각 주소의 노출 규칙에 따라 주소를 조합한다.
            	// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            	var addr = ''; // 주소 변수
           		var extraAddr = ''; // 참고항목 변수

            	//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            	if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                	addr = data.roadAddress;
            	} else { // 사용자가 지번 주소를 선택했을 경우(J)
                	addr = data.jibunAddress;
            	}

            	// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            	if(data.userSelectedType === 'R'){
                	// 법정동명이 있을 경우 추가한다. (법정리는 제외)
                	// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                	if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    	extraAddr += data.bname;
                	}
                	// 건물명이 있고, 공동주택일 경우 추가한다.
                	if(data.buildingName !== '' && data.apartment === 'Y'){
                    	extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                	}
                	// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                	if(extraAddr !== ''){
                    	extraAddr = ' (' + extraAddr + ')';
                	}
                	// 주소변수 문자열과 참고항목 문자열 합치기
                	addr += extraAddr;
            
            	} else {
            	  	addr += ' ';
            	}

            	// 우편번호와 주소 정보를 해당 필드에 넣는다.
            
            	$('#addr1').val(data.zonecode); //zonecode	13494	국가기초구역번호. 2015년 8월 1일부터 시행될 새 우편번호.
            	$('#addr2').val(addr);  //  addr = data.roadAddress; 도로명 주소
            	// 커서를 상세주소 필드로 이동한다.
            	$("#addr3").attr("readonly",false); // 기존 address_input_3에 입력안되게 햇다가 false로 풀리고 작성가능하게
            	$('#addr3').focus();
 
        	}
    	}).open();    
 
	}
	

	
</script>
</body>
</html>