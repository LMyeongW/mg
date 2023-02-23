<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/join.css">
</head>

<body>
    <div id="wrap">
        <form id="join_from" method="post">
            <div class="inner_size">

                <div class="join_title">회원가입</div>
                <!-- .join_title -->

                <div class="id_wrap paddingwrap">
                    <div class="id_title input_title">
						<p>아이디</p>
                        <span class="idCk_No">사용중인 아이디 입니다.</span>
                        <span class="idCk_Ok">사용 가능한 아이디 입니다.</span>
                        <span class="errorMsg1"></span>
					</div>
                    <div class="id_input_box">
                        <input class="id_input" placeholder="아이디 입력" name="employeeId" minlength="5">
                    </div>
                </div>
                <!-- .id_wrap -->

                <div class="pw_wrap paddingwrap">
                    <div class="pw_title input_title">
                        <p>비밀번호</p>
                        <span class="errorMsg2"></span>
                    </div>
                    <div class="pw_input_box">
                        <input type="password" class="pw_input" placeholder="비밀번호 입력" name="employeePw">
                    </div>
                </div>
                <!-- .pw_wrap -->

                <div class="pwck_wrap paddingwrap">
                    <div class="pwck_title input_title">
                        <p>비밀번호 확인</p>
                        <span class="pwCk_No">비밀번호가 일치하지 않습니다.</span>
                        <span class="pwCk_Ok">비밀번호가 일치합니다.</span>
                        <span class="errorMsg3"></span>
                    </div>
                    <div class="pwck_input_box">
                        <input type="password" class="pwck_input" >
                    </div>
                </div>
                <!-- .pwck_wrap -->

                <div class="user_name_wrap paddingwrap">
                    <div class="name_title input_title">
                        <p>이름</p>
                        <span class="errorMsg4"></span>
                    </div>
                    <div class="name_input_box">
                        <input class="name_input" name="employeeName">
                    </div>
                </div>
                <!-- .user_name_wrap -->

                <div class="user_birthday_wrap paddingwrap">
                    <div class="birthday_title input_title">
                        <p>생년월일</p>
                        <!-- <span class="birth_Eff1">태어난 년도 4자리를 입력해주세요.</span>
                        <span class="birth_Eff2">태어난 월을 선택해주세요.</span>
                        <span class="birth_Eff3">태어난 일(날짜) 2자리를 입력해주세요.</span> -->
                        <span class="errorMsg5"></span>
                    </div>
                    <div class="birthday_input_box">
                        <input class="birthDayY_input" placeholder="년(4자)" name="employeeBirthday1" maxlength='4'>
                        <select class="birthDayM_select" name="employeeBirthday2" >
                            <option selected value="">월</option>
                            <option value="01">01</option>
                            <option value="02">02</option>
                            <option value="03">03</option>
                            <option value="04">04</option>
                            <option value="05">05</option>
                            <option value="06">06</option>
                            <option value="07">07</option>
                            <option value="08">08</option>
                            <option value="09">09</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                        </select>
                        <input class="birthDayD_input" placeholder="일" name="employeeBirthday3" maxlength='2'>
                    </div>
                </div>
                <!-- .user_birthday -->

                <div class="user_gender_wrap paddingwrap">
                    <div class="gender_title input_title">
                        <p>성별</p>
                        <span class="errorMsg6"></span>
                    </div>
                    <div class="gender_input_box">
                        <select class="gender_select" name="employeeGender">
                            <option selected value ="">선택</option>
                            <option value="M" >남자</option>
                            <option value="F" >여자</option>
                        </select>
                    </div>
                </div>

                <div class="user_phone_wrap paddingwrap">
                    <div class="phone_title input_title">
                    	<p>전화번호</p>
                        <span class="errorMsg7"></span>
                    </div>
                    <div class="phone_input_box">
                        <input class="phone_input" name="employeePhone" oninput="phoneForm(this)" placeholder="전화번호 입력"/>
                    </div>
                </div>
                <!-- .user_phone -->

                <div class="mail_wrap paddingwrap">
                    <div class="user_mail_wrap ">
                        <div class="mail_title input_title">
                            <p>이메일</p>
                            <span id="mailCk_wran"></span>
                            <span class="errorMsg8"></span>
                            <span class="msg"></span>
                        	<span class="msg1"></span>
   
                        </div>
                        <div class="mail_input_box">
                            <input class="mail_input" placeholder="이메일 입력" name="employeeMail">
                        </div>
                    </div>
                    <!-- user_mail -->

                    <div class="user_mailCk_wrap ">
                        <div class="mailCk_input_box">
                            <input class="mailCk_input" placeholder="인증번호를 입력하세요." disabled="disabled">
                        </div>
                        <div class="mailCk_button">
                            <span>인증번호 전송</span>
                        </div>
                    </div>
                    <!-- .user_mailCk_wrap -->
                </div>
                <!-- .mail_wrap -->

                <div class="address_wrap paddingwrap">
                    <div class="addr_title input_title">
                        <p>주소</p>
                        <span class="errorMsg9"></span>

                    </div>
                    <div class="addr1_wrap">
                        <div class="addr1_input_box">
                            <input class="addr1_input" name="employeeAddr1" readonly="readonly">
                        </div>

                        <div class="addr_search" onclick="execution_daum_address()">
                            <span>주소 찾기</span>
                        </div>
                    </div>
                    <!-- .addr1_warp -->

                    <div class="addr2_wrap">
                        <div class="addr2_input_box">
                            <input class="addr2_input" name="employeeAddr2" readonly="readonly">
                        </div>
                    </div>
                    <!-- .addr2_warp -->

                    <div class="addr3_wrap">
                        <div class="addr3_input_box">
                            <input class="addr3_input" name="employeeAddr3" readonly="readonly">
                        </div>
                    </div>
                    <!-- .addr3_warp -->
                </div>
                <!-- .address_wrap -->

                <div class="soc">
                    <div class="join_button">
                        <input type="button" class="join_btn" value="가입하기">
                    </div>
                    <!-- .join_button-->
                    <div class="join_cencel">
                        <div class="cencel">
                            <a href="/main">취소</a>
                        </div>
                    </div>
                </div>  
                <!-- submit or cencel -->
                
            </div>
            <!-- .inner_size -->
        </form>
    </div>
    <!-- #wrap -->
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

	var idCheck = false; //아이디
	var idckCheck = false; //아이디 중복검사
	var pwCheck = false; //비번
	var pwckCheck = false; //비번확인
	var pwckCCheck = false; //비번일치확인
	var nameCheck = false; //이름
	var birthCheck = false; //생일
	var genderCheck = false; //성별
	var phoneCheck = false; //전화번호
	var emailCheck = false; //이메일 
	var emailckCheck = false; //이메일 인증
	var addrCheck = false; //주소
	
	$(document).ready(function(){
		
		$(".join_btn").click(function(){
			
			var id = $('.id_input').val();
			var pw = $('.pw_input').val();
			var pwck = $('.pwck_input').val();
			var name = $('.name_input').val();
			var birthY = $('.birthDayY_input ').val();
			var birthM = $('.birthDayM_select option:selected').val();
			var birthD = $('.birthDayD_input').val();
			var gender = $('.gender_select').val();
			var phone = $('.phone_input').val();
			var mail = $('.mail_input').val();
			var addr = $('.addr3_input').val();
			

			
			if(id == ""){
				$('.errorMsg1').text("아이디를 입력해주세요.");
				idCheck = false;
			} else {
				$('.errorMsg1').text("");
				idCheck = true;
			}
			
			if(pw == ""){
				$('.errorMsg2').text("비밀번호를 입력해주세요.");
				pwCheck = false;
			} else {
				$('.errorMsg2').text("");
				pwCheck = true;
			}
			
			if(pwck == ""){
				$('.errorMsg3').text("비밀번호 확인을 입력해주세요.");
				pwckCheck = false;
			} else {
				$('.errorMsg3').text("");
				pwckCheck = true;
			}
			
			
			if(name == ""){
				$('.errorMsg4').text("이름을 입력해주세요.");
				nameCheck = false;
			} else {
				$('.errorMsg4').text("");
				nameCheck = true;
			}
			
			/*생년월일*/
			if(birthY == ""){
				$(".errorMsg5").text("태어난 년도 4자리를 입력해주세요.");
				birthCheck = false;
			}else if (birthM == ""){
				$('.errorMsg5').text("태어난 월을 선택해주세요.");
				birthCheck = false;
			}else if(birthD == ""){
				$('.errorMsg5').text("태어난 일(날짜) 2자리를 입력해주세요.");
				birthCheck = false;
			} else {
				$('.errorMsg5').text("");
				birthCheck = true;
			}
			
			if(gender == ""){
				$('.errorMsg6').text("성별을 선택해주세요.");
				genderCheck = false;
			} else {
				$('.errorMsg6').text("");
				genderCheck = true;
			}
			
			if(phone == ""){
				$('.errorMsg7').text("전화번호를 입력해주세요.");
				phoneCheck = false;
			} else {
				$('.errorMsg7').text("");
				phoneCheck = true;
			}
			
			if(mail == ""){
				$('.errorMsg8').text("이메일을 입력해주세요.");
				phoneCheck = false;
			} else {
				$('.errorMsg8').text("");
				emailCheck = true;
			}
			
			if(addr == ""){
				$('.errorMsg9').text("주소를 입력해주세요.");
				addrCheck = false;
			} else {
				$('.errorMsg9').text("");
				addrCheck = true;
			}
			
			

			if(idCheck&&idckCheck&&pwCheck&&pwckCheck&&pwckCCheck&&nameCheck&&birthCheck&&genderCheck&&phoneCheck&&emailCheck&&emailckCheck&&addrCheck){
				$("#join_from").attr("action", "/account/join");
				$("#join_from").submit();
			}

		});
	});
	


	/*아이디중복검사*/
	$(".id_input").on("propertychange change keyup paste input", function(){
		
		var employeeId = $('.id_input').val();
		var data = {employeeId : employeeId}
	
		$.ajax({
			type : "get",
			url : "/account/employeeIdCk",
			data : data,
			success : function(result){
				
				if(result != 'fail'){
					$(".idCk_Ok").css("display","inline-block");
					$(".idCk_No").css("display","none");
					idckCheck = true;
				} else {
					$(".idCk_No").css("display","inline-block");
					$(".idCk_Ok").css("display","none");
					idckCheck = false;
				}
				
				if(employeeId=="" || employeeId==null){
					$(".idCk_Ok").css("display","none");
					$(".idCk_No").css("display","none");
				}
			}
		});	
		
		if(employeeId == "" || employeeId == null){
			$('.errorMsg1').text("아이디를 입력해주세요.");
			return false;
		} else {
			$('.errorMsg1').text("");
		}
	});
	
	/*비밀번호*/
	$(".pw_input").on("propertychange change keyup paste input", function(){
		var pw = $(".pw_input").val();
		
		if(pw == ""|| pw == null){
			$('.errorMsg2').text("비밀번호를 입력해주세요.");
			return false;
		} else {
			$('.errorMsg2').text("");
		}
		
	});
	
	/*비밀번호확인*/
	$(".pwck_input").on("propertychange change keyup paste input", function(){
		
		var pw = $(".pw_input").val();
		var pwck = $(".pwck_input").val();
		
		if(pw == pwck){
			$(".pwCk_Ok").css("display","inline-block");
			$(".pwCk_No").css("display","none");
			pwckCCheck = true;
			
		} else {
			$(".pwCk_No").css("display","inline-block");
			$(".pwCk_Ok").css("display","none");
			pwckCCheck = false;
		}
		
		if(pwck == "" || pwck == null){
			$(".pwCk_Ok").css("display","none");
			$(".pwCk_No").css("display","none");
	
		}
		
		if(pwck == "" || pwck == null){
			$('.errorMsg3').text("비밀번호 확인을 입력해주세요.");
			return false;
		} else {
			$('.errorMsg3').text("");
		}
	});
	
	/*이름*/
	$(".name_input").on("propertychange change keyup paste input", function(){
		var name = $('.name_input').val();
		
		if(name == "" || name == null){
			$('.errorMsg4').text("이름을 입력해주세요.");
			return false;
		} else {
			$('.errorMsg4').text("");
		}
	});
		
	/* 년 경고문 */
	$(".birthDayY_input, .birthDayM_select, .birthDayD_input").on("propertychange change keyup paste input", function(){
		var birthY = $(".birthDayY_input").val();
		var birthM = $(".birthDayM_select option:selected").val();
		var birthD = $(".birthDayD_input").val();
		
		
		if(birthY == ""){
			//$('.birth_Eff1').css('display', 'inline-block');
			$(".errorMsg5").text("태어난 년도 4자리를 입력해주세요.");
			return false;
		}else{
			$(".errorMsg5").text("");
		}
		
		if(birthM == ""){
			$(".errorMsg5").text("태어난 월을 선택해주세요.");
			return false;
		}else{
			$(".errorMsg5").text("");
		}
		
		if(birthD == ""){
			$(".errorMsg5").text("태어난 일(날짜) 2자리를 입력해주세요.");
			return false;
		}else{
			$(".errorMsg5").text("");
		}
		
	});
	
	//성별
	$(".gender_select").on("propertychange change keyup paste input", function(){
		var gender = $('.gender_select option:selected').val();
		
		if(gender == ""){
			$('.errorMsg6').text("성별을 선택해주세요.");
			return false;
		} else {
			$('.errorMsg6').text("");
		}
		
	});
	
	/*전화번호 형식*/
	const phoneForm = (target) => {
		 target.value = target.value
		 	.replace(/[^0-9]/g, '')
		 	.replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
	}
	/*전화번호*/
	$(".phone_input").on("propertychange change keyup paste input", function(){
		var phone = $('.phone_input').val();
		
		if(phone == "" || phone == null){
			$('.errorMsg7').text("번화번호를 입력해주세요.");
			return false;
		} else {
			$('.errorMsg7').text("");
		}
		

		
	});
	
	/*이메일*/
	$(".mail_input").on("propertychange change keyup paste input", function(){
		var mail = $('.mail_input').val();
		
		if(mail == ""){
			$('.errorMsg8').text("이메일을 입력해주세요.");
		} else {
			$('.errorMsg8').text("");
		}
	});
	
	
	/*이메일인증번호*/
	var code ="";
	
	$(".mailCk_button").click(function(){
		//alert("클릭");
		var email = $(".mail_input").val();
		var Ckable = $(".mailCk_input");
		
		if(mailFormCheck(email)){
			$('.msg').text("이메일이 전송되었습니다. 이메일을 확인하세요.");
			$('.msg1').text("");
		}else {
			$('.msg1').text("올바르지 못한 이메일 양식입니다.");
			$('.msg').text("");
			return false;
		}
		
		$.ajax({
			
			type : "get",
			url : "emailCheck?email=" + email,
			success:function(data){
				
				alert("인증번호:" + data);
				Ckable.attr("disabled", false);
				code = data;
			},

		});
	});
	
	/* 입력 이메일 형식 유효성 검사 */
	function mailFormCheck(email){
		var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
		
		return form.test(email);  //.test 형식에 부합하면 true
	}
	
	
	/*인증번호비교*/
	$(".mailCk_input").blur(function(){
		var inputCode = $(".mailCk_input").val();
		var checkResult = $("#mailCk_wran"); //비교 결과
		
		
		if(inputCode == code){
			checkResult.text("인증번호가 일치합니다.");
			checkResult.attr("class", "mailCk_Ok");	
			$('.msg1').text("");
			emailckCheck = true;

		} else {
			checkResult.text("인증번호가 불일치합니다.");
			checkResult.attr("class", "mailCk_No");
			$('.msg').text("");
			emailckCheck = false;
		}
		
		if(inputCode == "" || inputCode == null) {
			checkResult.html("");
			checkResult.attr("id", "mailCk_wran");

		}
		

	});
	
	/*주소*/
	$(".addr3_input").on("propertychange change keyup paste input", function(){
		var addr = $('.addr3_input').val();
		
		if(addr == ""){
			$('.errorMsg9').text("주소를 입력해주세요.");
		} else {
			$('.errorMsg9').text("");
		}
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
            
            	$('.addr1_input').val(data.zonecode); //zonecode	13494	국가기초구역번호. 2015년 8월 1일부터 시행될 새 우편번호.
            	$('.addr2_input').val(addr);  //  addr = data.roadAddress; 도로명 주소
            	// 커서를 상세주소 필드로 이동한다.
            	$(".addr3_input").attr("readonly",false); // 기존 address_input_3에 입력안되게 햇다가 false로 풀리고 작성가능하게
            	$('.addr3_input').focus();
 
        	}
    	}).open();    
 
	}
	
</script>
    
</body>

</html>