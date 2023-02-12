<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판작성</title>
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/boardWrite.css">
</head>
<body>
    <div id="wrap">
    <form id="write_form" method="post" name="writeForm">
    
    <input type ="hidden" name ="positionId" value="${member.positionId}"/>
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
                        <div class="title">게시물 작성</div>
                    </div>
                    <div class="my">
                        <div class="myprofile">
                        	<div class="resultImg">
                               <!-- <div class="img"></div>
                                	<div class="imgDelete">삭제</div> -->
                            </div>
                        </div>
                        <div class="myname"><input type="text" readonly="readonly" name="employeeId" class="mynameInput" value ="${member.employeeId}"/></div>
                    </div>
                    <div class="right_border"></div>
                    <!-- .title -->

                    <div class="input_wrap">
                        <!-- <div class="writer">
                            <div class="t1">작성자</div>
                            <input type="text">
                        </div> -->
                        <div class="b_title">
                            <div class="t1">제목</div>
                            <input type="text" name="boardTitle" placeholder="제목을 입력해주세요.">
                        </div>

                        <div class="Category">
                            <div class="t1">카테고리</div>
                            <select name="boardCategory" id="boardCategory">
                            	<option value="">선택</option>
                                <option value="a1">인사말</option>
                                <option value="a2">정보공유</option>
                                <option value="a3">건강</option>
                                <option value="a4">기타</option>
                            </select>
                        </div>
                        <div class="t2">내용</div>
                        <div class="boardContent">
                            
                            <div class="content1">
                                <textarea name="boardContent" id="boardContent" placeholder="내용을 입력해주세요."></textarea>
                            </div>
                        </div>

                        <div class="btn_box">
                            <div class="write_btn">등록</div>
                            <div class="writeCen_btn">취소</div>
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
		var employeeId =  $("input[name=employeeId]").val();
		var uploadResult = $(".resultImg");
		
		$.getJSON("/account/profileImage", {employeeId : employeeId}, function(arr){
			console.log("이미지 반환" + arr);
			
			var str ="";
			var obj = arr[0];
	    	var fileCallPath = encodeURIComponent(obj.profileLoadPath + "/s_" + obj.profileUuid + "_" + obj.profileName);
	    	
	    	str += "<div class='picture' data-path= '" + obj.profileLoadPath + "' data-uuid='" + obj.profileUuid + "' data-filename='" + obj.profileName + "'>";
	 
	    	str += "<div class='img'>";
	    	str += "<img src='/account/display?profileName="+ fileCallPath +"'>";
	    	str += "</div>";
	    	str += "<div class='imgDelete' data-file='"+ fileCallPath + "'>삭제</div>";
			str += "<input type='hidden' name='profileName' value='"+ obj.profileName +"'>";
			str += "<input type='hidden' name='profileUuid' value='"+ obj.profileUuid +"'>";
			str += "<input type='hidden' name='profileLoadPath' value='"+ obj.profileLoadPath +"'>";
	    	str += "</div>";
	     	
	    	uploadResult.append(str);
		});
		
		$('.write_btn').on("click",function(){
			var title = $('input[name=boardTitle]').val();
			var category = $("#boardCategory option:selected").val();
			var content = $('input[name= boardContent]').val();
			
			if(title == ""){
				alert("제목을 입력해주세요.");
				return false;
			}
			
			if(category == ""||category == "선택"){
				alert("카테고리를 선택해주세요.");
				return false;
			}
			if(content == ""){
				alert("내용을 입력해주세요.");
				return false;
			}
			
			
			if(confirm("게시물을 작성하시겠습니까?")){
				var data = $('form[name=writeForm]').serialize();
				console.log(data);
				
				$.ajax({
					
					type : 'POST',
					url : '/board/write',
					data : data,
					success : function(result){
						alert("게시물을 성공적으로 작성하였습니다.");
						location.href="/main";
					},
					error : function(){
						alert("연결에 실패하였습니다.");
					}

				});//ajax
			} else{
				alert("게시물 작성을 취소하였습니다.");
				return false;
			}
		});//write_btn
		
		var cencal = $('.writeCen_btn');
		cencal.click(function(){
			
			if(confirm("게시물 작성페이지에서 나가시겠습니까?")){
				location.href="/main"
				
			} else {
				return false;
			}
		});
	});//document
	


</script>
</body>
</html>