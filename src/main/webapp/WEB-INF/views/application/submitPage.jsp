<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>신청서 작성</title>
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/submitPage.css">
</head>
<body>
    <div id="wrap">
    <form id="appl_form" method="post" name="applForm">
    
    <input type ="hidden" name ="positionId" value="${member.positionId }"/>
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
                    <div class="border_h">
                        <div class="title">신청서 작성</div>
                    </div>
                    <div class="my">
                        <div class="myprofile">
                        	<div class="resultImg"></div>
                        </div>
                        <div class="myname"><input type="text" readonly="readonly" name="employeeId" value ="${member.employeeId}"/></div>
                    </div>
                    <div class="right_border"></div>
                    <!-- .title -->

                    <div class="input_wrap">
                        <div class="positionId">
                            <span class="t1">부서 : </span>
                            <span class="c1"><input type ="text" readonly="readonly" name ="departmentId" value="${member.departmentId}"/></span>
                        </div>
                        <div class="employeeName">
                            <div class="e1">
                                <span class="t1">이름 : </span>
                                <span class="c1"><input type="text" class="name_input" readonly="readonly" name="employeeName" value ="${member.employeeName}"/></span>
                                
                            </div>
                            <div class="e2">
                                <span class="t1">사원번호 : </span>
                                <span class="c1"><input type ="text" readonly="readonly" name ="emploNo" value="${member.emploNo }"/></span>
                            </div>
                        </div>
                        <div class="status">
                            <div class="t1">신청종류 : </div>
                            <select name="applselect" class="applSelect_input">
                                <option selected>선택</option>
                                <option value="A1">휴가</option>
                                <option value="A2">연차</option>
                                <option value="A3">월차</option>
                                <option value="A4">반차(오전)</option>
                                <option value="A4-1">반차(오후)</option>
                                <option value="A5">휴직</option>
                                <option value="A6">기타</option>
                            </select>
                        </div>
                        <div class="applicationDate">
                            <div class="a1">
                                <span class="t1">시작일 : </span>
                                <input type="date" name ="startDate" class="startDate_input">
                            </div>
                            <div class="a2">
                                <span class="t1">종료일 : </span>
                                <input type="date" name = "endDate" class="endDate_input">
                            </div>
                        </div>
                        <!-- .applicationDate -->

                        <div class="emergency">
                            <div class="t1">비상연락망 : </div>
                            <input class="emergencyTell_input" name="emergencyTell" oninput="phoneForm(this)" placeholder="전화번호를 입력해주세요."/>
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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
	
	/*전화번호 형식*/
	const phoneForm = (target) => {
		target.value = target.value
	 		.replace(/[^0-9]/g, '')
	 		.replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
	}

	$(document).ready(function(){
		/*var applselect = false; //선택
		var startDate = false; //시작날
		var endDate = false; //종료날
		var emergencyTell = false; //비상연락망
		var reason = false; //사유*/
		
		var cencal = $('.applicationCen_btn');
		cencal.click(function(){
			Swal.fire({
				title: '신청서 작성페이지에서 나가시겠습니까??',
				text: '지금까지 작성하신 내용이 삭제됩니다.',
				icon: 'warning',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: 'Yes'
				}).then((result) => {
				  if (result.isConfirmed) {
					  location.href="/main"
				  }
			})

		});
	

		
		var employeeId =  $("input[name=employeeId]").val();
		var uploadResult = $(".resultImg");
		
		$.getJSON("/account/profileImage", {employeeId : employeeId}, function(arr){
			
			var str ="";
			var obj = arr[0];
	    	var fileCallPath = encodeURIComponent(obj.profileLoadPath + "/s_" + obj.profileUuid + "_" + obj.profileName);
	    	
	    	str += "<div class='picture' data-path= '" + obj.profileLoadPath + "' data-uuid='" + obj.profileUuid + "' data-filename='" + obj.profileName + "'>";
	 
	    	str += "<div class='img'>";
	    	str += "<img src='/account/display?profileName="+ fileCallPath +"'>";
	    	str += "</div>";
			str += "<input type='hidden' name='profileName' value='"+ obj.profileName +"'>";
			str += "<input type='hidden' name='profileUuid' value='"+ obj.profileUuid +"'>";
			str += "<input type='hidden' name='profileLoadPath' value='"+ obj.profileLoadPath +"'>";
	    	str += "</div>";
	     	
	    	uploadResult.append(str);
		});
		
		//날짜포맷 yyyy-mm-dd
		var date = new Date();

		var year = date.getFullYear();

		var month = date.getMonth();
		month += 1;
		if (month <= 9){
		    month = "0" + month;
		}

		var day = date.getDate();
		if (day <= 9){
		    day = "0" + month;
		}

		var today = year + '-' + month + '-' + day;
		
		$('.application_btn').on("click", function(e){
			
			var applS = $('.applSelect_input option:selected').val();
			var startD = $('.startDate_input').val();
			var endD = $('.endDate_input').val();
			var emergencyT = $('.emergencyTell_input').val();
			var reaSon = $('.reason_input').val();
			
			if(applS == ""|| applS == "선택"){
				Swal.fire({
					icon: 'error',
					title: '종류를 선택해주세요!',
				});
				return false;
			} 
			if(startD == ""){
				Swal.fire({
					icon: 'error',
					title: '시작일을 입력해주세요!',
				});
				return false;
			} 
			if(endD == ""){
				Swal.fire({
					icon: 'error',
					title: '종료일 입력해주세요!',
				});
				return false;
			}

			if(today > startD){
				Swal.fire({
					icon: 'error',
					title: '현재날짜를 지났습니다!',
				});
				return false;
			}
			
			if(today > endD){
				Swal.fire({
					icon: 'error',
					title: '현재날짜를 지났습니다!',
				});
				return false;
			}
			
			if(endD < startD){
				Swal.fire({
					icon: 'error',
					title: '시작일은 종료일보다 클 수 없습니다!',
				});
				return false;
			}

			if(emergencyT == ""){
				Swal.fire({
					icon: 'error',
					title: '비상연락처를 입력해주세요!',
				});
				return false;
			} 

			Swal.fire({
				title: '신청서를 제출하시겠습니까?',
				icon: 'info',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: 'Yes'
				}).then((result) => {
					if (result.isConfirmed) {
						var data = $('form[name=applForm]').serialize();
						$.ajax({
							
							type : 'post',
							url : '/application/submit',
							data : data,
							success : function(result){
								applAlert(result);
								if(result == '1'){
									location.href="/main";
								}
							}
						});
				 	}
			});

				
			function applAlert(result){
				if(result == '5'){
					alert("로그인을 하세요.")
					$(location).attr("href", "/account/login")
				}
			}
			
		});

	});


</script>
</body>
</html>