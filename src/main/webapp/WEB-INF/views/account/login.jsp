<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 페이지</title>
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/login.css">
</head>

<body>
    <div id="wrap">
        <header>
            <div class="inner_size">
                <div class="header_m">
                    <h1>사원관리</h1>
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
                                <input id="pw_input" name="employeePw" >
                            </div>
                            <!-- .pw_input_box -->
                        </div>
                        <!-- .pw_box -->
                        <div class="loginAndCencel">
                            <div class="login_btn_box">
                                <input type="button" class="login_btn" value="Login">
                            </div>
                            
                            <div class="cencel_btn_box">
                                <a href="#">Cencel</a>
                            </div>
                        </div>
                        <!-- .loginAndCencel -->


                    </div>
                    <!-- .login_box -->

                </div>
                <!-- .login_wrap -->
            </form>
            <!-- form -->
        </main>
        <!-- main -->

        <footer></footer>
        <!-- footer -->
    </div>
    <!-- #wrap -->
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script>

	$(".login_btn").click(function(){
		
		//alert("로그인버튼클릭");
		$("#login_form").attr("action","/account/login.do");
		$("#login_form").submit();
		
	});
	
	
	$(document).ready(function(){
		var msg = "${msg}";
		if(msg != ""){
			alert(msg);
		}
		
	});
	
</script>
</body>

</html>