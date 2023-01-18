<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>신청서</title>
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/submitPage.css">
</head>
<body>
    <div id="wrap">
    <form id="appl_form" method="post" name="applForm">
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
                        	<a href="account/logout.do" class="login">로그아웃</a>
                     
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
                    <div class="border_h">
                        <div class="title">신청서 작성</div>
                    </div>
                    <div class="my">
                        <div class="myprofile"></div>
                        <div class="myname"><input type="text" readonly="readonly" name="employeeId" value ="${member.employeeId}"/></div>
                    </div>
                    <div class="right_border"></div>
                    <!-- .title -->

                    <div class="input_wrap">
                        <div class="positionId">
                            <span class="t1">부서 : </span>
                            <span class="c1">${member.departmentId}</span>
                        </div>
                        <div class="employeeName">
                            <div class="e1">
                                <span class="t1">이름 : </span>
                                <span class="c1">${member.employeeName}</span>
                            </div>
                            <div class="e2">
                                <span class="t1">사원번호 : </span>
                                <span class="c1">${member.emploNo}</span>
                            </div>
                        </div>
                        <div class="status">
                            <div class="t1">신청종류 : </div>
                            <select name="applselect" class="applSelect_input">
                                <option selected>선택</option>
                                <option value="A1">휴가</option>
                                <option value="A2">연차</option>
                                <option value="A3">월차</option>
                                <option value="A4">반차</option>
                                <option value="A5">휴직</option>
                                <option value="A6">기타</option>
                            </select>
                        </div>
                        <div class="applicationDate">
                            <div class="a1">
                                <span class="t1">신청일 : </span>
                                <input type="date" name ="startDate" class="startDate_input">
                            </div>
                            <div class="a2">
                                <span class="t1">종료일 : </span>
                                <input type="date" name = "endDate" class="enDdate_input">
                            </div>
                        </div>
                        <!-- .applicationDate -->

                        <div class="emergency">
                            <div class="t1">비상연락망 : </div>
                            <input type="text" placeholder="전화번호를 입력해주세요." name ="emergencyTell" class="emergencyTell_input" >
                        </div>

                        <div class="reason">
                            <div class="t1">사유</div>
                            <textarea name ="reason" class="reason_input"></textarea>
                        </div>

                        <div class="btn_box">
                            <div class="application_btn">등록</div>
                            <div class="applicationCen_btn">취소</div>
                        </div>
                    </div>
                    <!-- .input_wrap -->

                </div>
                <!-- .content -->
            </div>
            <!-- .inner_size -->
        
        </main>
    </form>
    </div>
    <!-- #wrap -->
    
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script>
	$(document).ready(function(){
		var applselect = false; //선택
		var startDate = false; //시작날
		var endDate = false; //종료날
		var emergencyTell = false; //비상연락망
		var reason = false; //사유

		$('.application_btn').on("click", function(e){
			
			var applS = $('.applSelect_input option:selected').val();
			var startD = $('.startDate_input').val();
			var endD = $('.endDate_input').val();
			var emergencyT = $('.emergencyTell_input').val();
			var reaSon = $('.reason_input').val();
			
			if(applS == ""|| applS == "선택"){
				alert("종류를 선택해주세요.");
				applselect = false;
			} else {
				applselect = true;
			}
			if(startD == ""){
				alert("시작일을 입력해주세요.");
				startDate = false;
			} else {
				startDate = true;
			}
			if(endD == ""){
				alert("종료일 입력해주세요.");
				endDate = false;
			} else {
				endDate = true;
			}
			if(emergencyT == ""){
				alert("비상연락처를 입력해주세요.");
				emergencyTell = false;
			} else {
				emergencyTell = true;
			}
			if(reaSon == ""){
				alert("사유를 입력해주세요.");
				reaSon = false;
			} else {
				reaSon = true;
			}
			if(applselect&&startDate&&endDate&&emergencyTell&&reaSon){
				var data = $('form[name=applForm]').serialize();
				console.log(data);
				$.ajax({
					
					type : 'post',
					url : '/application/submit',
					data : data,
					success : function(result){
						applAlert(result);
					}
				
				
				});
				
				function applAlert(result){
					if(result == '5'){
						alert("로그인을 하세요.")
						$(location).attr("href", "/account/login")
					} else if(result == '1') {
						alert("신청에 성공하셨습니다.")
						$('#appl_form').submit();
						$(location).attr("href", "/")
					}
				}
					
					//$('#appform').attr("action", "/member/submit");
			}

		});



	});


</script>
</body>
</html>