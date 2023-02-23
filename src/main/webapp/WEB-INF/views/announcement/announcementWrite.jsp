<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지 작성페이지</title>
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/announcementWrite.css">
</head>

<body>
    <div id="wrap">
    	
        <header>
            <div class="inner_size">
                <div class="header_m">
                   <h1>
                    	<a href="/main" class="mainlink">
                        	<div class="img">
                                <img src="/resources/img/logo_black.png" alt="로고"/>
                            </div>
                            LmwCompany
                       	</a>
                        	
                    </h1>
                    <!-- .loginAndjoin -->
                    
					
					<c:if test="${member != null}">
                    	<c:if test="${member.adminCk == 1 }">
                    		<div class="link">
                    			<a href="/admin/joinlist">관리자페이지</a>
                    		</div>
                    	</c:if>
                    </c:if>
					
                </div>
                <!-- .header_m -->
				
            </div>
            <!-- .inner_size -->
        </header>
        <!-- header -->
        <main>
        <form name="a_form">
            <div class="inner_size">
                <div class="content_title">
                    공지사항
                </div>
                <div class="content">
                    <div class="title">공지사항 작성</div>
                    <div class="con">
                        <div class="left">
                            <div class="title_input">제목</div>
                            <div class="category_select">카테고리</div>
                            <div class="content_text">내용</div>
                        </div>
                        <!-- .left -->
                        <div class="right">
                            <div class="title_input">
                                <input type="text" name="announcementTitle" placeholder="제목을 입력해주세요.">
                            </div>
                            <div class="category_select">
                                <select name="announcementCategory" id="announcementCategory">
                                    <option>선택</option>
                                    <option value="a1">공지사항</option>
                                    <option value="a2">이벤트</option>
                                </select>
                            </div>
                            <div class="content_text">
                                <textarea name="announcementContent" id="" class="text" placeholder="내용을 입력해주세요."></textarea>
                            </div>
                        </div>
                        <!-- .right -->

                    </div>
                    <!-- .con -->
                    <div class="btn_box">
                        <div class="btn">등록</div>
                        <div class="cancel_btn">취소</div>
                    </div>
                </div>
                <!-- .content -->

            </div>
            <!-- .inner_size -->
        </form>
        </main>
        <!-- main -->


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

        </footer>
        <!-- footer -->
    
    </div>
    <!-- #wrap -->
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
	$(document).ready(function(){
		
		$('.btn').on("click", function(){
			var title = $('input[name=announcementTitle]').val();
			var category = $("#announcementCategory option:selected").val();
			var content = $('textarea[name= boardContent]').val();
			
			if(title == ""){
				Swal.fire({
					icon: 'error',
					title: '제목을 입력해주세요!',
				});
				return false;
			}
			if(category == "" || category == "선택"){
				Swal.fire({
					icon: 'error',
					title: '카테고리를 선택해주세요!',
				});
				return false;
			}
			if(content == ""){
				Swal.fire({
					icon: 'error',
					title: '내용을 입력주세요!',
				});
				return false;
			}
			
			Swal.fire({
				title: '공지사항을 등록하시겠습니까?',
				icon: 'info',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: 'Yes'
				}).then((result) => {
					if (result.isConfirmed) {
						
						var data = $('form[name=a_form]').serialize();
						
						$.ajax({
							
							url : '/admin/announcementWrite',
							type : 'post',
							data : data,
							success : function(){
								Swal.fire(
									'등록에 성공하였습니다!',
									'You clicked the button!',
									'success'
								)
								$('.swal2-confirm').click(function(){
									location.href="/main";
								});
								$('.swal2-backdrop-show').click(function(){
									location.href="/main";
								});
							},
							error : function(){
								alert("연결에 실패하였습니다.");
							}
							
						});

				 	}
				});

		});	
	});
</script>
</body>
</html>