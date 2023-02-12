<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/announcementDetail.css">
</head>
<body>
    <div id="wrap">

        <header>
            <div class="inner_size">
                <div class="header_m">
                    <h1>
                        <a href="/main" class="mainlink">
                            <div class="img">
                                <img src="/resources/img/logo_black.png" alt="로고" />
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
            <form name="a_form">
            	<input type="hidden" name="announcementNo" id="announcementNo" value="${data.announcementNo}"/>
            	<input type="hidden" name="announcementCategory" id="announcementCategory" value="${data.announcementCategory}"/>
                <div class="inner_size">
                    <div class="content_category">
                        <div class="home">
                            <a href="/main">
                                <img src="/resources/img/home.png" alt="메인">
                            </a>
                        </div>
                        <div class="arr">
                            <img src="/resources/img/arr.png" alt="화살표">
                        </div>
                        <div class="cate_name">
                            <a href="#">
                                ${data.announcementCategory}
                            </a>
                        </div>
                    </div>
                    <div class="content">
                        <div class="con_header">
                            <div class="header_top">
                                <div class="con_category">${data.announcementCategory}</div>
                                <div class="regDate">${data.announcementRegdate}</div>
                            </div>
                            <div class="title">
                               	 ${data.announcementTitle}
                            </div>
                        </div>
                        <div class="con_mid">
							<div class="textarea">
								${data.announcementContent}
							</div>
							<c:if test="${member.adminCk == 1}">
								<div class="upAndDe">
                            		<a href="javascript:void(0)" class="update">수정</a>
                            		<a href="javascript:void(0)" class="delete">삭제</a>
								</div>
							 </c:if>
                            <div class="list">
 
                                <a href="/announcement/listPage">목록보기</a>
                            </div>
                        </div>
                        <!-- .con_mid -->

                        <div class="con_bottom">
                            <table>
    							<tbody id="tbodyList"></tbody>
                            </table>
                        </div>
                        <!-- .con_bottom -->
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
<script>
	$(document).ready(function(){
		
		$('.update').click(function(){
			var announcementNo = $('input[name="announcementNo"]').val();
			console.log(announcementNo);
			
			$('.update').prop("href", "/admin/announcementUpdate?announcementNo="+announcementNo);
			
		});
		
		$('.delete').click(function(){

			var con = confirm("해당 공지사항을 삭제하시겠습니까?");
			if(con){
				var data = $('form[name=a_form]').serialize();

				$.ajax({
					
					tpye : 'get',
					url : '/admin/announcementDelete',
					data : data,
					success : function(result){
						alert("성공적으로 삭제되었습니다.");
						location.href="/main";
					},
					error : function(){
						alert("연결에 실패하였습니다..");
						
					}
					
					
				});
				return true;
			} else {
				alert("취소되었습니다.");
				return false;
			}
			
			
		});
		
		detailList()
	});
	
	function detailList(num, categoryType){
		
		var categoryType = $('input[name=announcementCategory]').val();
		console.log(categoryType);
		$.ajax({
			
			type : 'get',
			url : '/announcement/inList',
			dataType : 'json',
			data : {
				"num" : num,
				"categoryType" : categoryType
			},
			success : function (result){
				
				
				var data = result.data;
				var html ="";
				
				console.log(data);
				
				for(i=0; i <data.list.length; i++){
					html += "<tr class='click' id='" + data.list[i].announcementNo + "'>";
	           		html += "<td width ='15%'><div class='acontent1'>["  + data.list[i].announcementCategory + "] " + data.list[i].announcementTitle + "</div></td>";
	           		html += "<td width ='40%'><div class='acontent'>"+ data.list[i].announcementContent + "</div></td>";
	           		html += "<td width ='15%' class='s2'>" + data.list[i].announcementRegdate + "</td>";
	       		    html += "</tr>";
				}
				$('#tbodyList').html(html);
				
				$('.click').on("click", function(){
					location.href="/announcement/detail?announcementNo=" + this.id + "&num=" + data.page.num;
				});
			},
			error : function(){
				alert("연결에 실패하였습니다.");
			}
			
		});
	}

</script>
</body>
</html>