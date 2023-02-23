<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/search_id.css">
</head>
<body>
    <div id="wrap">
    	<form name="searchForm">
        <div class="inner_size">
            <div class="wrap_box">
            	<div class="input_wrap">
            		<div class="title">아이디 찾기</div>
                	<div class="name">
                    	<div class="t1">이름</div>
                    	<input type="text" name="employeeName" placeholder="이름 입력" >
                	</div>
               		<div class="tel">
                    	<div class="t1">전화번호</div>

                    	<input class="phone_input" name="employeePhone"  oninput="oninputPhone(this)" placeholder="전화번호 입력" maxlength="14">
                	</div>
     
                	<div class="email">
                    	<div class="t1">이메일</div>
                    	<input type="text" name="employeeMail" class="mail_input" placeholder="이메일 입력" >
                    
                	</div>
                	<div class="emailCk">
                    	<input type="text" name="emailCk" disabled="disabled" class="mailCk_input" placeholder="인증번호 입력" ><div class="emailCk_btn">인증번호 전송</div>         
                	</div>
                

                	<div class="btn_box">
                    	<div class="search">찾기</div>
                    	<div class="cancel">취소</div>
                	</div>
            	</div>
           	 	<!-- .input_wrap -->
            
            	<div class="input_wrap1"></div>

			</div>
        </div>
        <!-- .inner_size -->
		</form>
    </div>
    <!-- #wrap -->
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
	/*전화번호 형식*/
	function oninputPhone(target) {
		target.value = target.value
		.replace(/[^0-9]/g, '')
 		.replace(/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
	}

	$(document).ready(function(){
		$('.search').on("click", function(){
			var data = $('form[name=searchForm]').serialize();
			
			var name = $('input[name=employeeName]').val();
			var tel = $('input[name=employeePhone]').val();
			var mail = $('input[name=employeeMail]').val();
			var mailCk = $('input[name=emailCk]').val();
			
			if(name == "" || name == null){
				Swal.fire(
					'이름을 입력해주세요.'
				)
				return false;
			}
			

			if(tel == "" || tel == null){
				Swal.fire(
					'전화번호를 입력해주세요.'
				)
				return false;
			}
			if(mail == "" || mail == null){
				Swal.fire(
					'이메일을 입력해주세요.'
				)
				return false;
			}
			if(mailCk == "" || mailCk == null){
				Swal.fire(
					'인증번호를 입력해주세요.'
				)
				return false;
			}
			
			var inputCode = $(".mailCk_input").val();
			if(inputCode != code){
				Swal.fire(
					'인증번호가 불일치합니다.'
				)
				return false;
			} 
			
			/*인증번호비교*/

			

			Swal.fire({
				  title: '아이디를 찾기를 실행하시겠습니까?',
				  icon: 'info',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Yes, search it!'
				}).then((result) => {
				  if (result.isConfirmed) {
					$.ajax({
						
						url : '/account/searchId.do',
						type : 'get',
						data : data,
						success : function(result){
							
							if (result.data == null || result.data == "") {
								Swal.fire({
									  icon: 'error',
									  title: '아이디찾기에 실패하였습니다.',
									  text: '일차하는 정보가 없습니다!! \n 다시 한번 확인해주세요.'
									})
							} else {
								$('.input_wrap').addClass('on');
								
								var html ="";
								html += "<div class='title'>아이디 찾기</div>";
								html += "<div class='resultId'>찾으신 아이디 : "+ result.data.employeeId +"</div>";
								html +=	"<div class='btn_box'>";
								html += "<div class='loginGo'><a href='/account/login'>로그인 하러가기</a></div>";
								html += "<div class='searchPw'><a href='/account/searchPw'>비밀번호 찾으러가기</a></div>";
								html +=	"</div>";
								html += "</div>";
								
							}
							$('.input_wrap1').html(html);
						},
						error : function(){
							alert("연결에 실패하였습니다.");
						}
					});
				  }
				})
			if(con){

			}

			
		});
		
		
		/*이메일인증번호*/
		var code ="";
		
		$(".emailCk_btn").click(function(){
			//alert("클릭");
			var email = $(".mail_input").val();
			var Ckable = $(".mailCk_input");
			
			if(email == "" || email == null){
				Swal.fire(
					'이메일을 입력해주세요.'
				)
				return false;
			}
			
			if(mailFormCheck(email)){
				Swal.fire({
					icon: 'info',
					title: '인증번호 전송 완료',
					text: '이메일을 확인하세요!',
				})
			}else {
				Swal.fire({
					icon: 'error',
					title: '올바르지 못한 이메일 양식입니다.',
					text: '다시한번 확인해주세요!',
				})
				return false;
			}
			
			$.ajax({
				
				type : "get",
				url : "idEmailCheck?email=" + email,
				success:function(result){
					
					alert("인증번호 : " + result);
					Ckable.attr("disabled", false);
					code = result;
				},

			});
		});
		/* 입력 이메일 형식 유효성 검사 */
		function mailFormCheck(email){
			var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
			
			return form.test(email);  //.test 형식에 부합하면 true
		}
		
		$('.cancel').click(function(){
			location.href ="/main";
		});


	});


</script>
</body>
</html>