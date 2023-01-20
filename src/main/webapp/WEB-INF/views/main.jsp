<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 리스트</title>
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/main.css">
</head>

<body>
    <div id="wrap">
        <header>
            <div class="inner_size">
                <div class="header_m">
                    <h1>사원관리</h1>
                    <!-- .loginAndjoin -->
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
                        	<div class="myprofil"></div>
                        	<input type="hidden" name="employeeId" value ="${member.employeeId}"/>
                        	<div class="name">${member.employeeName}님</div>
                        	<div class="email">${member.employeeMail}</div>
                        	<a href="/application/submit" class="applsubmit">신청서 작성</a>
                        	<div class="logOut"><a href="/account/logout.do">로그아웃</a></div>
                    	</div>
                    </c:if>
                </div>
                <!-- .m_top -->
                <div class="m_middle">
               		<c:if test="${member != null}">
                    	<div class="left">
                        	<div class="applicationList">
                            		<div class="title">신청 이력</div>
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
                            		</div> 
                        		</div>
                    		</div>
					</c:if>
                    <c:if test="${member == null}">
                    	<div class="left">
                        	<div class="applicationList">
                        		<div class="title">신청 이력</div>
                        		<div class="table">
                        			<table>
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
                        			</table>
          							<a href="/account/login" class="login_btn1">로그인 후 확인하기</a>
          						</div>
                        	</div>
                    	</div>
                    </c:if>
                    <div class="right"></div>
                </div>
                <!-- .m_middle -->
                <div class="m_bottom"></div>
                <!-- .m_bottom -->
            </div>
            <!-- .inner_size -->

        </main>
        <!-- main -->


        <footer>
            Footer
        </footer>
        <!-- footer -->
    </div>
    <!-- #wrap -->
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script>
	$(document).ready(function(){
		
		submitList();
		
	});
	
	
	
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
	           		html += "<td width ='10%'>" + data.list[i].startDate + "</td>";
	           		html += "<td width ='10%'>" + data.list[i].applselect + "</td>";
	           		html += "<td width ='10%'>" + data.list[i].status + "</td>";
	           		html += "<td width ='9%'><a href ='application/submitUpdate?applNo="+ data.list[i].applNo +"' title='' class='update'>수정 </a></td>";
	           		html += "<td width ='9%'><a href ='application/submitCencel?applNo="+ data.list[i].applNo +"' title='' class='detail'>신청취소</a></td>";
	       		    html += "</tr>";
				}
				
				$('#tbodyList').html(html);
				
				var page = "";
				if(data.page.prev){
					var startPageNum = data.page.startPageNum - 1;
					page += '<span class="prev">[ ';
					page += '<a href="javascript:submitList(\''+ employeeId +'\',' + startPageNum +')">이전</a>';
					page += ']</span>';

				}
				
				for(var num = data.page.startPageNum; num <= data.page.endPageNum; num++ ){
					page += '<span class="numPadding">';
					page += '<a href="javascript:submitList(\''+ employeeId +'\',' + num + ')">' + num + '</a>';
					page +=	'</span>';
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

</script>
</body>
</html>