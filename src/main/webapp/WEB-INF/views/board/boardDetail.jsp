<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시물 상세페이지</title>
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/boardDetail.css">
</head>
<body>
    <div id="wrap">
    <form method="post" name="boardDetail">
    
    <input type ="hidden" name ="positionId" value="${member.positionId}"/>
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
                        <div class="title">게시물</div>
                        <div class="regdate">
                        	작성일 : ${data.boardRegdate}
                        </div>
                    </div>
                    <div class="my">
                        <div class="myprofile">
                        	<div class="resultImg">
                               <!-- <div class="img"></div>
                                	<div class="imgDelete">삭제</div> -->
                            </div>
                        </div>
                        <div class="myname"><input type="hidden" name="employeeId" id="mynameInput" value="${data.employeeId}"/>${data.employeeId} 님의 게시물</div>
                        <input type="hidden" name="employeeId" id="idInput" value="${member.employeeId}"/>
                        <input type="hidden" name="boardNo" value="${data.boardNo}"/>
                    </div>
                    <div class="right_border"></div>
                    <!-- .title -->
                    <c:if test="${member.employeeId == data.employeeId}">
                    <div class="input_wrap">
                        <!-- <div class="writer">
                            <div class="t1">작성자</div>
                            <input type="text">
                        </div> -->
                        <div class="b_title">
                            <div class="t1">제목</div>
                            <input type="text" name="boardTitle" placeholder="제목을 입력해주세요." value ="${data.boardTitle}">
                        </div>

                        <div class="Category">
                            <div class="t1">카테고리</div>
                            <select name="boardCategory" id="boardCategory">
                            	<option selected>${data.boardCategory}</option>
                                <option value="a1">인사말</option>
                                <option value="a2">정보공유</option>
                                <option value="a3">건강</option>
                                <option value="a4">기타</option>
                            </select>
                        </div>
                        <div class="t2">내용</div>
                        <div class="boardContent">
                            <div class="content1">
                                <textarea name="boardContent" id="boardContent" placeholder="내용을 입력해주세요."> ${data.boardContent}</textarea>
                            </div>
                        </div>

                        <div class="btn_box">
                        	<c:if test="${member.employeeId == data.employeeId }">
                            	<div class="update_btn">수정</div>
                            	<div class="delete_btn">게시물 삭제</div>
                            	<div class="writeCen_btn">취소</div>
                            </c:if>

                        </div>
                    </div>
                    </c:if>
                    <!-- .input_wrap -->
                    
                    <c:if test="${member.employeeId != data.employeeId}">
                    <div class="input_wrap">
                        <!-- <div class="writer">
                            <div class="t1">작성자</div>
                            <input type="text">
                        </div> -->
                        <div class="b_title">
                            <div class="t1">제목</div>
                            <input type="text"  readonly="readonly" name="boardTitle" placeholder="제목을 입력해주세요." value ="${data.boardTitle}">
                        </div>

                        <div class="Category">
                            <div class="t1">카테고리</div>
                   				<input type="text"  readonly="readonly" name="boardCategory" value ="${data.boardCategory}" class="Category_input">
                        	</div>
                        <div class="t2">내용</div>
                        <div class="boardContent">
                            <div class="content1">
                                <textarea name="boardContent"  readonly="readonly" id="boardContent" placeholder="내용을 입력해주세요."> ${data.boardContent}</textarea>
                            </div>
                        </div>

                        <div class="btn_box1">
                        	<c:if test="${member.adminCk == 1}"> <div class="delete_btn1">게시물 삭제</div> </c:if>
                            <c:if test="${member.employeeId != data.employeeId}">
                            	<p class="update_btn1"></p>
                            	<div class="writeCen_btn"><a href="javascript:void(0)">취소</a></div>
                            </c:if>
                        </div>
                    </div>
                    </c:if>
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
	$(document).ready(function(){
		var employeeId =  $("input[id = mynameInput]").val();
		var employeeId1 =  $("input[id = idInput]").val();
		var uploadResult = $(".resultImg");

		$.getJSON("/account/profileImage", {employeeId : employeeId}, function(arr){
			
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
		
		$('.update_btn').on("click",function(){

			var title = $('input[name=boardTitle]').val();
			var category = $("#boardCategory option:selected").val();
			var content = $('input[name= boardContent]').val();
			
			if(title == ""){
				Swal.fire({
					icon: 'error',
					title: '제목을 입력해주세요!',
				});
				return false;
			}
			
			if(category == ""||category == "선택"){
				Swal.fire({
					icon: 'error',
					title: '카테고리를 선택해주세요!',
				});
				return false;
			}
			if(content == ""){
				Swal.fire({
					icon: 'error',
					title: '내용을 입력해주세요!',
				});
				return false;
			}
			
			Swal.fire({
				title: '게시물을 수정하시겠습니까?',
				icon: 'warning',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: 'Yes, update it!'
			}).then((result) => {
				if (result.isConfirmed) {
					
					var data = $('form[name=boardDetail]').serialize();
					$.ajax({
						
						type : 'POST',
						url : '/board/update',
						data : data,
						dataType: 'json',
						success : function(result){
							Swal.fire(
								'수정에 성공하였습니다!',
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

					});//ajax
				}
			})
		});//수정버튼클릭
		
		var cencal = $('.writeCen_btn');
		cencal.click(function(){
			
			Swal.fire({
				title: '현재페이지에서 나가시겠습니까??',
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
		
		var boardDelete = $('.delete_btn');
		boardDelete.click(function(){
			
			Swal.fire({
				title: '게시물을 삭제하시겠습니까?',
				text: '삭제된 게시물은 복구 할 수 없습니다.',	
				icon: 'warning',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: 'Yes'
				}).then((result) => {
				  if (result.isConfirmed) {
					  var boardNo = $('input[name=boardNo]').val();
					  location.href="/board/delete?boardNo=" + boardNo
				  }
			})
			
		});
		
		var boardDelete = $('.delete_btn1');
		boardDelete.click(function(){
			Swal.fire({
				title: '게시물을 삭제하시겠습니까?',
				text: '삭제된 게시물은 복구 할 수 없습니다.',	
				icon: 'warning',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: 'Yes'
				}).then((result) => {
				  if (result.isConfirmed) {
					  var boardNo = $('input[name=boardNo]').val();
					  location.href="/board/delete?boardNo=" + boardNo
				  }
			})
		});
	});//document
	


</script>
</body>
</html>