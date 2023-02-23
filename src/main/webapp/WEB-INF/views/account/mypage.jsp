<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/mypage.css">
</head>
<body>
    <div id="wrap">
            <header>
                <div class="inner_size">
                    <div class="header_m">
                        <h1>
                            <a href="/main" class="link">
                                <div class="img">
                                    <img src="/resources/img/logo_black.png" alt="로고"/>
                                </div>
                                LmwCompany
                            </a>
                           
                        </h1>
                        <c:if test="${member == null}">
                            <div class="loginAndjoin">
                                <a href="/account/login" class="login">로그인</a>
                                <a href="/account/join" class="join">회원가입</a>
                            </div>
                        </c:if>

                        <c:if test="${member != null}">
                            <div class="loginAndjoin">
                                <a href="/account/logout.do" class="login">로그아웃</a>

                            </div>
                        </c:if>
                        <!-- .loginAndjoin -->
                    </div>
                    <!-- .header_m -->
                </div>
                <!-- .inner_size -->
            </header>
            <!-- header -->
            <main>
                <div class="inner_size">
                    <div class="content">
                        <div class="title">마이페이지</div>
						<form name="myFrom">
                        <ul class="myInfo">
                            <li>
                                <div class="t1">아이디</div>
                                <div class="con1">
                                    <input type="text" readonly="readonly" name="employeeId" value="${member.employeeId}" class="input">
                                    <div class="wran">변경불가</div>

                                </div>
                            </li>
                            <li>
                                <div class="t1">비밀번호</div>
                                <div class="con1">
                                    <div class="change">비밀번호를 변경</div>
                                    <div class="pwck">
                                       	비밀번호 확인 : <input type="password" name="employeePw">
                                        <div class="ck">확인</div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="t1">이름</div>
                                <div class="con1">
                                    <input type="text" readonly="readonly" name="employeeName" value="${member.employeeName}" class="input">
                                    <div class="wran">변경불가</div>
   
                                </div>
                            </li>
                            <li>
                                <div class="t1">이메일</div>
                                <div class="con1">
                                    <input type="text" readonly="readonly" name="employeeMail" value="${member.employeeMail}" class="input">
                                    <div class="wran">변경불가</div>
                                </div>
                            </li>
                            <li>
                                <div class="t1">주소</div>
                                <div class="con1">
                                    <input type="text" readonly="readonly" name="employeeAddr1" value="${member.employeeAddr1}" class="input">
                                    <input type="text" readonly="readonly" name="employeeAddr2" value="${member.employeeAddr2}" class="input">
                                    <input type="text" readonly="readonly" name="employeeAddr3" value="${member.employeeAddr3}" class="input">
                                    <div class="wran">변경불가</div>
                                </div>
                            </li>
                            <li>
                                <div class="t1">생년월일</div>
                                <div class="con1">
                                    <input type="text" readonly="readonly" name="employeeBirthday1" value="${member.employeeBirthday1}" class="input">-
                                    <input type="text" readonly="readonly" name="employeeBirthday2" value="${member.employeeBirthday2}" class="input">-
                                    <input type="text" readonly="readonly" name="employeeBirthday3" value="${member.employeeBirthday3}" class="input">
                                    <div class="wran">변경불가</div>
                                </div>
                            </li>
                            <li>
                                <div class="t1">전화번호</div>
                                <div class="con1">
                                    <input type="text" readonly="readonly" name="employeePhone" value="${member.employeePhone}" class="input">
                                    <div class="wran">변경불가</div>
                                </div>
                            </li>
                        </ul>
						</form>
                        <div class="btn_box">
                            <div class="back"><a href="/main">돌아가기</a></div>
                        </div>
                        
                        <div class="pwchPage">
                        <form name="pwchForm">
                        	<input type="hidden" name="employeeId" value="${member.employeeId}">
                        	<input type="hidden" name="employeePhone" value="${member.employeePhone}">
                        	<input type="hidden" name="employeeName" value="${member.employeeName}">
                        	<input type="hidden" name="employeeMail" value="${member.employeeMail}">
            				<div class="title1">비밀번호 변경</div>
            				<div class="input_wrap">
                				<div class="pw">
                    				<div class="t1">비밀번호</div>
                    				<input type="password" name="employeePw" id="emploweePw" placeholder="비밀번호">
                    				
                				</div>
                				<div class="pwck">
                    				<div class="t1">비밀번호 확인</div>
                    				<input type="password" name="pwck" id="emploweePwCk" placeholder="비밀번호 확인" >
               		 			</div>

                				<div class="btn_box">
                    				<div class="change">변경</div>
                    				<div class="cancel">취소</div>
                				</div>
            				</div>
            			</form>
                        </div>
                        <!-- .pwchPage -->
                    </div>
                    <!-- .content -->
                </div>
                <!-- .inner_size -->
            </main>
            
			<div class="bg"></div>           

    </div>
    <!-- #wrap -->
 	
    <footer>
        <div class="inner_size">
            <ul class="f_menu">
                <li><a href="#">서비스이용약관</a></li>
                <li><a href="#">UGC 이용약관</a></li>
                <li><a href="#"><b>개인정도처리방침</b></a></li>
                <li><a href="#">쿠키정책</a></li>
                
            </ul>

            <div class="f_mid">
                <h4>COMPANY INFO</h4>
                <div class="box">
                    <ul class="info">
                        <li>COMPANY</li>
                        <li>ADDRESS</li>
                        <li>LICENSE</li>
                        <li>CUSTOMER SERVICE</li>
                    </ul>
                    <ul class="info1">
                        <li>LmwCompany</li>
                        <li>울산광역시 남구 신정4동 </li>
                        <li>000-00-00000</li>
                        <li>
                            010-0000-0000
                            <br>
                            평일 : 09:00~18:00 / 점심시간: 12:30~13:30 /토~일, 공휴일 휴무
                        </li>
                    </ul>
                </div>
                <!-- .box -->
            </div>
            <!-- .f_left -->
		</div>
	</footer>
    <!-- footer -->
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    $(document).ready(function(){
        $('.change').click(function(){
            $('.pwck').addClass('on');
        });
        
        $('.cancel').click(function(){
			$('.pwchPage').removeClass('on');
			$('.bg').removeClass('on');
        });
        
        $('.ck').on("click", function(){
        	var data = $('form[name=myFrom]').serialize();

        	$.ajax({
        		
        		url : '/account/mypwck',
        		type : 'get',
        		data : data,
        		success : function(result){
        			var pwck = $('input[name=employeePw]').val();
        			var employId = $('input[name=employeeId]').val();
        			
        			if(result.data == false){
        				Swal.fire({
        					  icon: 'error',
        					  text: '비밀번호가 올바르지 않습니다'
        					})
        				
        			}else {
						$('.pwchPage').addClass('on');
						$('.bg').addClass('on');
						
						$('.change').on("click", function(){
							var data = $('form[name=pwchForm]').serialize();
							var pw = $('input[id=emploweePw]').val();
							var pwck = $('input[id=emploweePwCk]').val();
							
							if(pw != pwck){
								alert("비밀번호가 서로 일치하지 않습니다.");
							} else {
								
								Swal.fire({
									title: '비밀번호를 변경하시겠습니까?',
									icon: 'warning',
									showCancelButton: true,
									confirmButtonColor: '#3085d6',
									cancelButtonColor: '#d33',
									confirmButtonText: '비밀번호 변경'
								}).then((result) => {
								if (result.isConfirmed) {
									
									$.ajax({
										url : '/account/mypwch',
										type : 'post',
										data : data,
										success : function(result){
										    Swal.fire(
										   		'변경완료',
										    	'비밀번호가 성공적으로 변경되었습니다.',
										    	'success'
										   	)
											$('.swal2-confirm').click(function(){
												location.href="/account/mypage";
											});
											$('.swal2-backdrop-show').click(function(){
												location.href="/account/mypage";
											});
										},
										error : function(){
											alert("연결에 실패하였습니다.");
										}
										
									});
								}
								})

								
							}
							
							
						});
						
        			}
        			
        		},
        		error : function(){
        			alert("연결에 실패하였습니다.");
        		}
        	});
        });

    });
</script>
</body>
</html>