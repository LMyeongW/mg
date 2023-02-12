<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/announcementList.css">
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
            <div class="inner_size">
                <div class="list_wrap">
                    <div class="list_box">
                        <div class="title">
                            새소식
                        </div>
                        <div class="btn">
                            <div class="all on">전체</div>
                            <div class="notify">공지</div>
                            <div class="event">이벤트</div>
                        </div>

                        <div class="content">
                            <div class="c1 on1">
                                <table>
    								<tbody id="tbodyList1"></tbody>
                                </table>
								
								<div class ="paging_box"></div>
								<div class="noData">등록된 정보가 없습니다.</div>
                            </div>
                            <div class="c2">
                                <table>
    								<tbody id="tbodyList2"></tbody>
                                </table>
                                <div class ="paging_box1"></div>
    							<div class="noData1">등록된 정보가 없습니다.</div>
                            </div>
                            <div class="c3">
                                <table>
    								<tbody id="tbodyList3"></tbody>
                                </table>
                                <div class ="paging_box2"></div>
    							<div class="noData2">등록된 정보가 없습니다.</div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- .list_wrap -->
            </div>
            <!-- .inner_size -->
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
		
        $('.all').click(function(){
            $('.all').addClass('on');
            $('.all').siblings().removeClass('on');
            $('.c1').addClass('on1');
            $('.c1').siblings().removeClass('on1');
        });

        $('.notify').click(function(){
            $('.notify').addClass('on');
            $('.notify').siblings().removeClass('on');
            $('.c2').addClass('on1');
            $('.c2').siblings().removeClass('on1');
        });

        $('.event').click(function(){
            $('.event').addClass('on');
            $('.event').siblings().removeClass('on');
            $('.c3').addClass('on1');
            $('.c3').siblings().removeClass('on1');
        });
		
        listAll();
        listNotify();
        listEvent();
        
        
	});
	
	function listAll(num){
		
	       $.ajax({
	        	
	        	type : 'get',
	        	url : '/announcement/listAll',
	        	dataType : 'json',
	        	data : {
	        		"num" : num
	        	},
	        	success : function(result){
	        		
	        		var data = result.data
	        		var html = "";
	        		
					for(var i= 0; i <data.list.length; i++){
						html += "<tr class='click' id='" + data.list[i].announcementNo + "'>";
		           		html += "<td width ='15%'><div class='acontent1'>["  + data.list[i].announcementCategory + "] " + data.list[i].announcementTitle + "</div></td>";
		           		html += "<td width ='40%'><div class='acontent'>"+ data.list[i].announcementContent + "</div></td>";
		           		html += "<td width ='15%' class='s2'>" + data.list[i].announcementRegdate + "</td>";
		       		    html += "</tr>";
					}
					$('#tbodyList1').html(html);
					
					if(html == null || html == "") {
						$('.noData').addClass('on');
					} else {
						$('.noData').removeClass('on');
					}
					
					$('.click').on("click", function(){
						var click = $('.click');
						location.href="/announcement/detail?announcementNo=" + this.id;
						console.log(this.id);
					});
					
					var page ="";
					
					if(data.page.prev){
						var startPageNum = data.page.startPageNum - 1;
						page += '<span class="prev">[ ';
						page += '<a href="javascript:listAll(' + startPageNum +')">이전</a>';
						page += ']</span>';

					}
					
					for(var num = data.page.startPageNum; num <= data.page.endPageNum; num++ ){
						if(data.select == num){
							page += '<span class="numPadding">';
							page += '<span class="point"><a href="javascript:listAll(' + num + ')">' + num + '</a></span>';
							page +=	'</span>';
						}
						
						if(data.select != num){
							page += '<span class="numPadding">';
							page += '<span class="noPoint"><a href="javascript:listAll(' + num + ')">' + num + '</a></span>';
							page +=	'</span>';
						}
					}
					
					if(data.page.next){
						var endPageNum = data.page.endPageNum + 1;
						page += '<span class="next">[';
						page +=	'<a href="javascript:listAll(' + endPageNum +')">다음</a>';
						page += ']</span>';
					}
					$('.paging_box').html(page);
	        	},
	        	error : function(){
	        		alert("연결에 실패하였습니다.");
	        	}
	        	
	        });
	}
	
	function listNotify(num){
		$.ajax({
        	
        	type : 'get',
        	url : '/announcement/listNotify',
        	dataType : 'json',
        	data : {
        		"num" : num
        	},
        	success : function(result){
        		
        		var data = result.data
        		var html = "";
        		
				for(var i= 0; i <data.list.length; i++){
					html += "<tr class='click' id='" + data.list[i].announcementNo + "'>";
	           		html += "<td width ='15%'><div class='acontent1'>["  + data.list[i].announcementCategory + "] " + data.list[i].announcementTitle + "</div></td>";
	           		html += "<td width ='40%'><div class='acontent'>"+ data.list[i].announcementContent + "</div></td>";
	           		html += "<td width ='15%' class='s2'>" + data.list[i].announcementRegdate + "</td>";
	       		    html += "</tr>";
				}
				$('#tbodyList2').html(html);
				
				if(html == null || html == "") {
					$('.noData1').addClass('on');
				} else {
					$('.noData1').removeClass('on');
				}
				
				$('.click').on("click", function(){
					var click = $('.click');
					location.href="/announcement/detail?announcementNo=" + this.id;
					console.log(this.id);
				});
				
				var page ="";
				
				if(data.page.prev){
					var startPageNum = data.page.startPageNum - 1;
					page += '<span class="prev">[ ';
					page += '<a href="javascript:listNotify(' + startPageNum +')">이전</a>';
					page += ']</span>';

				}
				
				for(var num = data.page.startPageNum; num <= data.page.endPageNum; num++ ){
					if(data.select == num){
						page += '<span class="numPadding">';
						page += '<span class="point"><a href="javascript:listNotify(' + num + ')">' + num + '</a></span>';
						page +=	'</span>';
					}
					
					if(data.select != num){
						page += '<span class="numPadding">';
						page += '<span class="noPoint"><a href="javascript:listNotify(' + num + ')">' + num + '</a></span>';
						page +=	'</span>';
					}
				}
				
				if(data.page.next){
					var endPageNum = data.page.endPageNum + 1;
					page += '<span class="next">[';
					page +=	'<a href="javascript:listNotify(' + endPageNum +')">다음</a>';
					page += ']</span>';
				}
				$('.paging_box1').html(page);
        	},
        	error : function(){
        		alert("연결에 실패하였습니다.");
        	}
        	
        });
		
	
	}
	
	function listEvent(num){
		$.ajax({
        	
        	type : 'get',
        	url : '/announcement/listEvent',
        	dataType : 'json',
        	data : {
        		"num" : num
        	},
        	success : function(result){
        		
        		var data = result.data
        		var html = "";
        		
				for(var i= 0; i <data.list.length; i++){
					html += "<tr class='click' id='" + data.list[i].announcementNo + "'>";
	           		html += "<td width ='15%'><div class='acontent1'>["  + data.list[i].announcementCategory + "] " + data.list[i].announcementTitle + "</div></td>";
	           		html += "<td width ='40%'><div class='acontent'>"+ data.list[i].announcementContent + "</div></td>";
	           		html += "<td width ='15%' class='s2'>" + data.list[i].announcementRegdate + "</td>";
	       		    html += "</tr>";
				}
				$('#tbodyList3').html(html);
				
				if(html == null || html == "") {
					$('.noData2').addClass('on');
				} else {
					$('.noData2').removeClass('on');
				}
				
				$('.click').on("click", function(){
					var click = $('.click');
					location.href="/announcement/detail?announcementNo=" + this.id;
					console.log(this.id);
				});
				
				var page ="";
				
				if(data.page.prev){
					var startPageNum = data.page.startPageNum - 1;
					page += '<span class="prev">[ ';
					page += '<a href="javascript:listEvent(' + startPageNum +')">이전</a>';
					page += ']</span>';

				}
				
				for(var num = data.page.startPageNum; num <= data.page.endPageNum; num++ ){
					if(data.select == num){
						page += '<span class="numPadding">';
						page += '<span class="point"><a href="javascript:listEvent(' + num + ')">' + num + '</a></span>';
						page +=	'</span>';
					}
					
					if(data.select != num){
						page += '<span class="numPadding">';
						page += '<span class="noPoint"><a href="javascript:listEvent(' + num + ')">' + num + '</a></span>';
						page +=	'</span>';
					}
				}
				
				if(data.page.next){
					var endPageNum = data.page.endPageNum + 1;
					page += '<span class="next">[';
					page +=	'<a href="javascript:listEvent(' + endPageNum +')">다음</a>';
					page += ']</span>';
				}
				$('.paging_box2').html(page);
        	},
        	error : function(){
        		alert("연결에 실패하였습니다.");
        	}
        	
        });
	}

</script>
</body>
</html>