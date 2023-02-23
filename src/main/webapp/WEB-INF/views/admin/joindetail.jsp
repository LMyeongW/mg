<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 승인</title>
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/joindetail.css">
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
                        	관리자페이지
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

            <nav class="menu">
                <ul class="d1">
                    <li><a href="/admin/employeelist">직원관리</a></li>
                    <li><a href="/admin/resignation">퇴사자 목록</a></li>
                    <li><a href="#">휴직자 목록</a></li>
                    <li><a href="/admin/joinlist">회원가입 승인</a></li>
                </ul>
                <!-- .d1 -->
            </nav>
            <!-- menu -->
			<form method="post">
            	<div class="detail_wrap">
                	<div class="detail_box">
                    	<div class="box_top">
                        	<h2>회원 상세정보</h2>
                        	<div class="regdate">가입신청일 : <fmt:formatDate value="${data.regdate}" pattern="yyyy-MM-dd"/></div>
                    	</div>
                    	<div class="detail">
                        	<div class="id">
                           		 아이디 : <span>${data.employeeId}</span>
                        	</div>
                        	<div class="name">
                           		이름 : <span>${data.employeeName}</span>
                        	</div>
                        	<div class="birthday">
								 생년월일 :  <span>${data.employeeBirthday1}-${data.employeeBirthday2}-${data.employeeBirthday3}</span>
                        	</div>
                        	<div class="gender">
                           		성별 :  <span>${data.employeeGender}</span>
                       	 	</div>
                        	<div class="phone">
                        		전화번호 : <span>${data.employeePhone}</span>
                        	</div>
                        	<div class="email">
                				email : <span>${data.employeeMail}</span>
                       		</div>
                        	<div class="addr">
 								주소 : <span>${data.employeeAddr1} ${data.employeeAddr2} ${data.employeeAddr3}</span>
                        	</div>
                       	
                    	</div>
                    	<!-- .detail -->
                    	<div class="btn">
                    		<div class="appr">
                    			<input name="apprBtn" readonly="readonly" value="승인"/>
                    		</div>
                        	<!-- 승인 -->
                        	<div class=" ref"><a href="/admin/joinlist">취소</a></div>
                        <!-- 거절 -->
                    	</div>
                	</div>
                	<!-- .detail_box -->
            	</div>
            	<!-- detail_wrap -->
            </form>

        </main>
        <!-- main -->

        <footer></footer>
        <!-- footer -->
    </div>
    <!-- #wrap -->
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script>
	$(document).ready(function(){
		$('.appr').click(function(){
			var con = confirm("회원가입을 승인 하시겠습니까?")
			if(con){
				alert("승인이 완료되었습니다.");
				$('input[name=apprBtn]').attr("type", "submit");
				return true;
			}else {
				alert("승인요청을 취소하였습니다.");
			}
			
		});
	});
</script>
</body>
</html>