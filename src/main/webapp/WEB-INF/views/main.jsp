<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LmwCompany</title>
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/main.css">
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
                       	</a>
                       	LmwCompany
                        	
                    </h1>
                    <!-- .loginAndjoin -->
                    
					
					<c:if test="${member != null}">
                    	<c:if test="${member.adminCk == 1 }">
                    		<div class="link">
                    			<a href="/admin/announcementWrite" class="announce">공지 작성</a>
                    			<a href="/admin/employeelist">관리자페이지</a>
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
            <div class="inner_size">
                <div class="m_top">
                    <div class="mainV"></div>
                    <div class="mainRight">
                    <c:if test="${member == null}">
                    	<div class="loginArea">
                        	<div class="login">
                            	<a href="/account/login" class="loginA">로그인</a>
                        	</div>
                        	<div class="join">
                            	<a href="/account/join" class="joinA">회원가입</a>
                       		</div>
                    	</div>
                    </c:if>
					<c:if test="${member != null}">
                    	<div class="loginArea">
                    		<form name="profileForm" id="profile_From">
                        	<div class="myprofil">
                        		<div class="lineBox">
                                	<img src="/resources/img/picture1.png" alt="사진">
                            	</div>
                            	
                            	<button class="inputFile">
                                	<input type="file" name ="uploadFile"/>
                                	<input type="hidden" name="employeeId" value ="${member.employeeId}"/>
                            	</button>
                            	
                                <div class="resultImg">
                               
                                	<!-- <div class="img">
                                    	
                                	</div>
                                	<div class="imgDelete">
                                   	 삭제
                                	</div> -->
                            	</div>
							
                        	</div>
                 			</form>
                        	<input type="hidden" name="employeeId" value ="${member.employeeId}"/>
                        	<div class="name">${member.employeeName}님</div>
                        	<div class="email">${member.employeeMail}</div>  
                        	<div class="logOut"><a href="/account/logout.do">로그아웃</a></div>
                        	
                    	</div>
                    </c:if>
                    
                    	<div class="loginBottom">
                    		<div class ="icon_Area">
                    			<a href="/application/submit" class="appl_submit">
                    				<div class="icon_btn">
                    					<img src="/resources/img/submit.png" alt="작성">
                    				</div>
                    				<div class ="icon_title">
                    						신청서 작성
                    				</div>
                    			</a>
                    		</div>
                    		<div class ="icon_Area">
                    		   <a href="/board/write" class="board_submit">
                    				<div class="icon_btn">
                    					<img src="/resources/img/board.png" alt="게시판">
                    				</div>
                    				<div class ="icon_title">
                    					게시물 작성
                    				</div>
                    			</a>
                    		</div>
                    		<div class ="icon_Area">
                    		   <a href="#">
                    				<div class="icon_btn">
                    					<img src="/resources/img/setup.png" alt="게시판">
                    				</div>
                    				<div class ="icon_title">
                    					설정
                    				</div>
                    			</a>
                    		</div>
                    	</div>
                    </div>
                </div>
                <!-- .m_top -->
                <div class="m_middle">
                	<div class="left">
                		<div class="left_title">
                			<div class ="teg">문의사항</div>
                			<span class="teg_content"></span>
                		</div>
                		<div class="area1">
                			<div class="ar">회사소개</div>
                		</div>
                		<div class="area2">
                			<div class="ar">기업이념</div>
                		
                		</div>
                		<div class="area3">
                			<div class="ar">고객센터</div>
                		</div>
                		<div class="area4">
                			<div class="text">찾아오시는 길</div>
                			<div class=location_icon><img src="/resources/img/location.png" alt="위치아이콘"/></div>
                		</div>
                	</div>
     				<div class="right_box">


               			<c:if test="${member != null}">
               				<div class="selectMenu">
     							<div class="select1 on">휴가신청</div>
     							<div class="select2">자유게시판</div>
     						</div>
     						<div class="right1" id="board">
                				<div class="boardList">
                					<div class ="table">
                						<table>
                							<thead>
                                        		<tr>
                                            		<th width ="100px">No</th>
                                            		<th width ="150px">제목</th>
                                            		<th width ="130px">카테고리</th>
                                            		<th width ="130px">작성자</th>
                                            		<th width ="100px">작성일</th>
                                            		<th width ="100px">상세보기</th>
                                        			</tr>
                                    			</thead>
                							<tbody id="tbodyList1"></tbody>
                						</table>
                						<div class ="paging_box1"></div>
                            			<div class="noData1">등록된 정보가 없습니다.</div>
                					
                					</div>
                				</div>
                			</div>
                    		<div class="right on" id="applList">
                        		<div class="applicationList">
                            			<div class="table">
                                			<table >
                                    			<thead>
                                        			<tr>
                                            			<th width ="100px">이름</th>
                                            			<th width ="150px">신청일</th>
                                            			<th width ="130px">신청종류</th>
                                            			<th width ="130px">상태</th>
                                            			<th width ="100px">수정</th>
                                            			<th width ="100px">취소</th>
                                        			</tr>
                                    			</thead>
                                    			<tbody id="tbodyList"></tbody>
                               				</table>                            	
                            				<div class ="paging_box"></div>
                            				<div class="noData">등록된 정보가 없습니다.</div>
                            			</div> 
                        			</div>
                    			</div>
						</c:if>
                   		<c:if test="${member == null}">
                    		<div class="right2">
								<div class="rightColor">
                        			<div class="table">
          								<a href="/account/login" class="login_btn1">로그인 후 확인하기</a>
          							</div>
                        		</div>
                    		</div>
                    	</c:if>
     				
     				</div>
     				<!-- right_box -->
                </div>
                <!-- .m_middle -->
                

                <!-- .m_bottom -->
            </div>
            <!-- .inner_size -->
			<div class="m_bottom">
            	<div class="inner_size">
            		<div class="notify_title">
            			공지사항
            		</div>
            		
            		<a href="/announcement/listPage" class="listLink">
            			<span class="line1"></span>
            			<span class="line2"></span>
            		</a>
            		
            		
            		<div class="table">
            		<input type="hidden" name="announcementNo" value="${data.announcementNo}"/>
            			<table>
                			<tbody id="tbodyList2"></tbody>
                		</table>
            		</div>
            	</div>
            </div>
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
			</div>
        </footer>
        <!-- footer -->
    
    </div>
    <!-- #wrap -->
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script>
	$(document).ready(function(){
		
		submitList();
		boardList();
		announcementList();
		
		var employeeId =  $("input[name=employeeId]").val();
		console.log(employeeId);
		
		$('.appl_submit').click(function(){
			if(employeeId == null){
				alert("로그인후 이용가능합니다.");
				return false
			}
			
		});
		
		$('.board_submit').click(function(){
			if(employeeId == null){
				alert("로그인후 이용가능합니다.");
				return false
			}
			
		});
		
	});
	
	
	
	$('.select2').click(function(){
		$('.select2').addClass('on');
		$('.select1').removeClass('on');
		$('.right1').addClass('on');
		$('.right').removeClass('on');
	});
	$('.select1').click(function(){
		$('.select1').addClass('on');
		$('.select2').removeClass('on');
		$('.right').addClass('on');
		$('.right1').removeClass('on');
	});
	function boardList(num){
		$.ajax({
			type : 'get',
			url : '/main.board',
			dataType : 'json',
			data : {
				"num" : num
			},
			success : function(result){
				var data = result.data;
				console.log(data);
				
				var html = "";
				
				for(var i = 0; i < data.list.length; i++){
					html += "<tr>"
					html += "<td>" + data.list[i].boardNo +" </td>"
					html += "<td>" + data.list[i].boardTitle +" </td>"
					html += "<td>" + data.list[i].boardCategory +" </td>"
					html += "<td>" + data.list[i].employeeId + " </td>"
					html += "<td>" + data.list[i].boardRegdate +" </td>"
					html += "<td><a href='/board/detail?boardNo=" + data.list[i].boardNo +  "'>보기</a></td>"
					html += "</tr>"
				}
				$('#tbodyList1').html(html);
				if(html == null || html == "") {
					$('.noData1').addClass('on');
				} else {
					$('.noData1').removeClass('on');
				}
				
				/*페이징*/
				var page = "";
				if(data.page.prev){
					var startPageNum = data.page.startPageNum - 1;
					page += '<span class="prev">[ ';
					page += '<a href="javascript:boardList(' + startPageNum + ')">이전</a>';
					page += ']</span>';

				}
				
				for(var num = data.page.startPageNum; num <= data.page.endPageNum; num++ ){
					if(data.select == num){
						page += '<span class="numPadding">';
						page += '<span class="point"><a href="javascript:boardList(' + num + ')">' + num + '</a></span>';
						page +=	'</span>';
					}
					
					if(data.select != num){
						page += '<span class="numPadding">';
						page += '<span class="noPoint"><a href="javascript:boardList(' + num + ')">' + num + '</a></span>';
						page +=	'</span>';
					}
				}
				console.log(num);
				
				if(data.page.next){
					var endPageNum = data.page.endPageNum + 1;
					page += '<span class="next">[';
					page +=	'<a href="javascript:boardList(' + endPageNum +')">다음</a>';
					page += ']</span>';
					
				}
				$('.paging_box1').html(page);
			},
			error : function(){
				alert("연결에 실패하였습니다.");
			}
		});
	}
	
	function submitList(employeeId, num){
		var employeeId =  $("input[name=employeeId]").val();
		console.log(employeeId);
		
		$.ajax({
			type : 'get',
			url : '/main.do',
			dataType : 'json',
			data : {
				"employeeId" : employeeId,
				"num" : num
			},
			
			success : function(result){
				
				var data = result.data;
				
				console.log(data);
				
				var html = "";
				
				for(var i= 0; i <data.list.length; i++){

					html += "<tr>";
					html += "<td width ='9%'>" + data.list[i].employeeName + "</td>";
	           		html += "<td width ='10%'>" + data.list[i].regDate + "</td>";
	           		html += "<td width ='10%'>" + data.list[i].applselect + "</td>";
	           		html += "<td width ='10%' class='s1'>" + data.list[i].status + "</td>";
	           		html += "<td width ='9%'><a href ='application/submitUpdate?applNo="+ data.list[i].applNo +"' title='' class='update'>수정 </a></td>";
	           		html += "<td width ='9%'><a href ='application/submitCencel?applNo="+ data.list[i].applNo +"' title='' class='cancel'>신청취소</a></td>";
	       		    html += "</tr>";
				}
				
				$('#tbodyList').html(html);
				
				if(html == null || html == "") {
					$('.noData').addClass('on');
				} else {
					$('.noData').removeClass('on');
				}
				
				$('.cancel').on("click", function(){
					var con = confirm("취소신청을 하시겠습니까?");
					if(con == true){
						alert("신청이 완료되었습니다.");
					}else {
						alert("작업을 중지하였습니다.");
						return false;
					}
				});
				
				/*페이징*/
				var page = "";
				if(data.page.prev){
					var startPageNum = data.page.startPageNum - 1;
					page += '<span class="prev">[ ';
					page += '<a href="javascript:submitList(\''+ employeeId +'\',' + startPageNum +')">이전</a>';
					page += ']</span>';

				}
				
				for(var num = data.page.startPageNum; num <= data.page.endPageNum; num++ ){
					if(data.select == num){
						page += '<span class="numPadding">';
						page += '<span class="point"><a href="javascript:submitList(\''+ employeeId +'\',' + num + ')">' + num + '</a></span>';
						page +=	'</span>';
					}
					
					if(data.select != num){
						page += '<span class="numPadding">';
						page += '<span class="noPoint"><a href="javascript:submitList(\''+ employeeId +'\',' + num + ')">' + num + '</a></span>';
						page +=	'</span>';
					}
				}
				console.log(num);
				
				if(data.page.next){
					var endPageNum = data.page.endPageNum + 1;
					page += '<span class="next">[';
					page +=	'<a href="javascript:submitList(\''+ employeeId +'\',' + endPageNum +')">다음</a>';
					page += ']</span>';
					console.log(data.employeeId);
				}
				$('.paging_box').html(page);
				
			},
			error : function(){
				alert("연결에 실패하였습니다.")
			}
			
		});
	}
	
	function announcementList(){
		$.ajax({
			type : 'get',
			url : '/main.announcement',
			dataType : 'json',
			success : function (result){
				
				var data = result.data;
				console.log(data);
				
				var html ="";
				for(var i= 0; i <data.list.length; i++){
					html += "<tr class='click' id='" + data.list[i].announcementNo + "'>";
	           		html += "<td width ='15%'><div class='acontent1'>["  + data.list[i].announcementCategory + "] " + data.list[i].announcementTitle + "</div></td>";
	           		html += "<td width ='35%'><div class='acontent'>"+ data.list[i].announcementContent + "</div></td>";
	           		html += "<td width ='15%' class='s2'>" + data.list[i].announcementRegdate + "</td>";
	       		    html += "</tr>";

				}
				$('#tbodyList2').html(html);
				
				$('.click').on("click", function(){
					var click = $('.click');
					location.href="/announcement/detail?announcementNo=" + this.id;
					console.log(this.id);
				});
				
				
			}
		});
	}
	
    $('.lineBox').click(function(){
    	var inputFile = $("input[type=file]");
    	inputFile.click();
    	
    	inputFile.on("change", function(e){
    		if($(".imgDelete").length > 0){
    			deleteFile();
    		}
    		var formData = new FormData();
    		var fileInput = $("input[name=uploadFile]");
    		var fileList = fileInput[0].files;
    		var fileObj = fileList[0];
    		
    		console.log("fileList" + fileList);
    		console.log("fileObj" + fileObj.name);
    		console.log("fileObj" + fileObj.size);
    		console.log("fileObj" + fileObj.type);
    		
    		if(!fileCheck(fileObj.name, fileObj.size)){
    			return false;
    		}
    		
    		formData.append("uploadFile", fileObj);
    		
    		$.ajax({
    			url : '/account/uploadProfileImg',
    			type : 'post',
    			processData : false, //서버로 전송할 데이터를 queryStirng 형태로 변환할지 여부
    			contentType: false, //서버로 전송되는 데이터의 content-type
    			data : formData,
    			dataType : 'json',
    			success : function(result){
    				console.log(result);
    				showUploadImage(result);
    			},
    			error : function(result){
    				alert("이미지 파일이 아닙니다.");
    			}

    		});
    		
    	});
    });
    
    //파일체크
    var regex = new RegExp("(.*?)\.(jpg|png)$");
    var maxSize = 1048576;
    
    function fileCheck(fileName, fileSize){
    	if(fileSize >= maxSize){
    		alert("파일 사이즈 초과");
    		return false;
    	}
    	
    	if(!regex.test(fileName)){
    		alert("해당 종류의 파일은 업로드할 수 없습니다.");
    		return false;
    	}
    	return true;
    }
    
    //이미지 출력
   	function showUploadImage(uploadResultArr){
    	
    	//전달받을 데이터 검증
    	if(!uploadResultArr || uploadResultArr.length == 0){return}
    	
    	//<div> 태그 요소
    	var uploadResult = $(".resultImg");
    	
    	var obj = uploadResultArr[0];
    	
    	var str = "";
    	
    	//이미지 출력을 요청하는 url 매핑 메서드("/display")에 전달해줄 파일의 경로와 이름을 포함하는 값
    	var fileCallPath = encodeURIComponent(obj.profileLoadPath + "/s_" + obj.profileUuid + "_" + obj.profileName);
    	
    	str += "<div class='picture' data-path= '" + obj.profileLoadPath + "' data-uuid='" + obj.profileUuid + "' data-filename='" + obj.profileName + "'>";
 
    	str += "<div class='img'>";
    	str += "<img src='/account/display?profileName="+ fileCallPath +"'>";
    	str += "</div>";
    	str += "<div class='save_btn'>저장</div>"
    	str += "<div class='imgDelete' data-file='"+ fileCallPath + "'>삭제</div>";
		str += "<input type='hidden' name='profileName' value='"+ obj.profileName +"'>";
		str += "<input type='hidden' name='profileUuid' value='"+ obj.profileUuid +"'>";
		str += "<input type='hidden' name='profileLoadPath' value='"+ obj.profileLoadPath +"'>";
    	str += "</div>";
     	
    	uploadResult.append(str);
    }
    
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
	});
    
    //이미지 삭제버튼
    $('.resultImg').on("click",".imgDelete", function(){
    	var con = confirm("프로필 사진을 삭제하시겠습니까?")
    	if(con == true){
    		deleteFile();
    		alert("사진이 삭제되었습니다.");
    	}else {
    		alert("취소되었습니다.");
    	}
    	
    	console.log(deleteFile);
    });
    
    //이미지삭제
    function deleteFile(){
    	var targetFile = $('.imgDelete').data("file");
    	var targetDiv = $('.picture');
    	var savebtn = $('.save_btn');
    	$.ajax({
    		url : '/account/deleteFile',
    		data : {
    			profileName : targetFile
    		},
    		dataType : 'text',
    		type : 'post',
    		success : function(result){
    			console.log(result);
    			location.reload();
    			targetDiv.remove();
  
    			$("input[type=file]").val("");
    			
    			var data = $("form[name=profileForm]").serialize();
				$.ajax({
					type : 'GET',
					url : '/account/imgDatadelete',
					data : data,
					success : function(data){
	
							console.log("이미지 삭제 : "+ data);
					
	 				},
	 				error : function(){
	 					alert("연결에 실패하였습니다.");
	 				}
				});
    		},
    		error : function(result){
    			console.log(result);
    			
    			alert("파일을 삭제하지 못하였습니다.")
    		}
    		
    	});
    	console.log(targetFile);
    	
    }

	
    $('.resultImg').on("click", ".save_btn", function(){
    	var data = $("form[name=profileForm]").serialize();
    	var saveBox = $('.save_btn');
    	console.log(data);
    	
    	var con = confirm("저장하시겠습니까?")
    	if(con == true){
        	$.ajax({
        		
        		type : 'post',
        		url : '/account/profilePost',
        		
        		data : data,
        		success : function(result){
        			saveBox.remove();
        			alert("저장되었습니다.");
        		},
        		error : function(){
        			alert("연결에 실패하였습니다.");
        		}
        	});
    	}else {
    		alert("취소되었습니다.");
    	}

    	
    });
    


</script>
</body>
</html>