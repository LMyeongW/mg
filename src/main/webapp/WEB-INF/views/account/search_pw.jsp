<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호찾기</title>
	<link rel="stylesheet" href="/resources/css/reset.css">
	<link rel="stylesheet" href="/resources/css/search_pw.css">
</head>
<body>
    <div id="wrap">
    	<form name="searchForm">
        <div class="inner_size">
            <div class="title">비밀번호 찾기</div>
            <div class="input_wrap">
                <div class="id">
                    <div class="t1">아이디</div>
                    <input type="text" name="employeeId" placeholder="아이디 입력">
                </div>

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
            <div class="input_wrap1 on"></div>
            <!-- .input_wrap -->
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
			
			var id = $('input[name=employeeId]').val();
			var name = $('input[name=employeeName]').val();
			var tel = $('input[name=employeePhone]').val();
			var mail = $('input[name=employeeMail]').val();
			var mailCk = $('input[name=emailCk]').val();
			
			if(id == "" || id == null){
				Swal.fire(
					'아이디를 입력해주세요.'
				)
				return false;
			}
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
				alert("인증번호가 불일치합니다.");
				
				return false;
			} 
			
			$.ajax({
				type : 'get',
				url : '/account/searchPw.do',
				data : data,
			
				success : function(result){

					if(result.data == null || result.data == ""){
						Swal.fire({
							  icon: 'error',
							  title: '일치하는 정보가 없습니다.',
							  text: '다시 한번 확인해주세요.'
							})
					}else {
						var data = result.data;
						
						$('.input_wrap').addClass('on');
						$('.input_wrap1').removeClass('on');
						var html = "";
						html += "<div class='pw'>"
						html +=	"<div class='t1'>비밀번호</div>"
						html += " <input type='text' name='employeePw' placeholder='비밀번호'  class='pw_input' >"
						html += "</div>"
						html += "<div class='pwck'>"
						html +=	"<div class='t1'>비밀번호 체크</div>"
						html += " <input type='password' name='employeePwCk' placeholder='비밀번호확인' class='pwck_input'>"
						html += "<span class='pwCk_No'>비밀번호가 불일치합니다.</span><span class='pwCk_Ok'>비밀번호가 일치합니다.</span>"
						html += "</div>"
						html += "<div class='btn_box'>"
						html += "<div class='change'>변경하기</div>"
						html += "<div class='searchId'><a href='/account/searchId'>아이디 찾기</a></div>"
						html += "<div class='cancel'><a href='/main'>취소</a></div>"
	                    html += "</div>"
	                        
	                        
					}
						$('.input_wrap1').html(html);
						
						/*비밀번호*/
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
							
						});
						
						$('.change').on("click", function(){
							var data = $('form[name=searchForm]').serialize();
							var pw = $('input[name=employeePw]').val();
							var pwck = $('input[name=employeePwCk]').val();
							
							if(pw == ""|| pw == null){
								Swal.fire(
									'비밀번호를 입력해주세요.'
								)
								return false;
							}
							if(pwck == ""|| pwck == null){
								Swal.fire(
									'비밀번호 확인을 입력해주세요.'
								)
								return false;
							}
							
							if(pw != pwck){
								
								Swal.fire({
									  icon: 'error',
									  title: '비밀번호가 서로 일치하지 않습니다.',
									  text: '다시 한번 확인해주세요.'
									})
								return false;
							}
							
							
							Swal.fire({
								  title: '비밀번호를 변경하시겠습니까?',
								  icon: 'warning',
								  showCancelButton: true,
								  confirmButtonColor: '#3085d6',
								  cancelButtonColor: '#d33',
								  confirmButtonText: 'yes change it!'
							}).then((result) => {
								if (result.isConfirmed) {
									  
									$.ajax({
											
										type: 'post',
										url : '/account/searchPwUpdate.do',
										data : data,
										success : function(result){
										    Swal.fire(
												'성공적으로 비밀번호가 변경되었습니다.',
												'success'
											)
											$('.swal2-styled').click(function(){
												location.href="/account/login"
											});
											
										},
										error : function(){
											alert("연결에 실패하였습니다.");
										}
											
									});

								}
							});

						});
		
				},
				error : function(){
					alert("연결에 실패하였습니다.");
				}
				
			});// ajax
			
		});// search버튼 클릭
		

		
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