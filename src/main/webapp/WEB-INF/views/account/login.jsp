<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/login.css">
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
                       	</a>
                       	 LmwCompany
                        	
                    </h1>
                    <c:if test="${member == null}">
                    	<div class="loginAndjoin">
                        	<a href="/account/login" class="login">로그인</a>
                        	<a href="/account/join" class="join">회원가입</a>
                    	</div>
                    </c:if>
                    
                    <c:if test="${member != null}">
                    	<div class="loginAndjoin">
                        	<a href="#" class="login">로그아웃</a>
                     
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
            <!-- .menu -->
            <form id="login_form" method ="post">
                <div class="login_wrap">
                    <div class="login_box">
                        <div class="login_top">
                            <h1>로그인</h1>
                        </div>
                        <div class="id_box">
                            <div class="id_input_box">
                                ID
                                <input id="id_input" name ="employeeId" >
                            </div>
                            <!-- .id_input_box -->
                        </div>
                        <!-- .id_box -->
                        <div class="pw_box">
                            <div class="pw_input_box">
                                PASSWORD
                                <input type="password" id="pw_input" name="employeePw" >
                            </div>
                            <!-- .pw_input_box -->
                        </div>
                        <!-- .pw_box -->
                        <div class="loginAndCencel">
                            <div class="login_btn_box">
                                <input type="button" class="login_btn" value="Login">
                            </div>
                            
                            <div class="cencel_btn_box">
                                <a href="/main">Cencel</a>
                            </div>
                        </div>
                        <!-- .loginAndCencel -->


                    </div>
                    <!-- .login_box -->

                </div>
                <!-- .login_wrap -->
            </form>
            <!-- form -->
            </div>
        </main>
        <!-- main -->

        <footer></footer>
        <!-- footer -->
    </div>
    <!-- #wrap -->
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>



	$(".login_btn").click(function(){
		
		
	/*	var employeeId = $('#id_input').val();
		console.log(employeeId);
		var data = {employeeId : employeeId}
		console.log(data);
	
		console.log("테스트")
		$.ajax({
			type : "get",
			url : "/account/employeeIdCk",
			data : data,
			success : function(result){
				
				if(result != 'fail'){
					alert("아이디나 비밀번호를 확인해주세요.");
				}
				

				

				
			}
		});	*/
		//alert("로그인버튼클릭");
		$("#login_form").attr("action","/account/login.do");
		$("#login_form").submit();
		
	});
	
	
	$(document).ready(function(){
		var msg = "${msg}";
		if(msg != ""){
			Swal.fire({
				  icon: 'error',
				  text: msg,
				})
		}
		
	});
	
</script>
</body>

</html>