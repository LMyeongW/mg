<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 페이지</title>
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/applicationList.css">
</head>

<body>
    <div id="wrap">
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
            <div class="application_wrap">
                <div class="inner_size">
                    <form>
                        <div class="title">톼사자 목록</div>
                        <nav class="menu">
                            <ul>
                               	<li><a href="/admin/employeelist">직원관리</a><span class="line1"></span></li>
                                <li><a href="/admin/resignation">퇴사자관리</a><span class="line1"></span></li>
                                <li><a href="/admin/application">휴직자</a><span class="line"></span></li>
                                <li><a href="/admin/joinlist">회원승인</a><span class="line1"></span></li>
                            </ul>
                        </nav>
                        <div class="application_mg">
                            <div class="application_search">
                                <input type="text" class="search_input" name="searchKeyword" placeholder="검색어를 입력해주세요.">
                                <a href="#" onclick="employeeList();" class="searchbtn">검색</a>
                            </div>
							<div class="check_box">
                				<div class="c1"><input type="checkbox" id="allCheck"><labal>전체선택</labal></div>
                				<button type="button" class="selectDelete">선택삭제</button>
                			</div>
                            <div class="table_box">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>사원번호</th>
                                            <th>이름</th>
                                            <th>부서명</th>
                                            <th>직급</th>
                                            <th>선택</th>
                                            <th>신청일</th>
                                            <th>종료일</th>
                                            <th>상태</th>
                                            <th>승인</th>
                                            <th>삭제</th>
                                        </tr>
                                    </thead>
                                    <tbody class = "tbodyList">
                						
                                    </tbody>
                                </table>
                            </div>
                            <!-- .table_box -->
                            
                            <div class ="paging_box"></div>
							<div class="noData">등록된 정보가 없습니다.</div>
                        </div>
                    </form>
                    <!-- .resignation_mg -->
                </div>
            </div>
            <!-- .resignation_wrap -->
        </main>
        <!-- main -->
        <footer></footer>
        <!-- footer -->
    </div>
    <!-- #wrap -->

<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script>
	$(document).ready(function(){
		applicationList();
	});
	
	function applicationList(){
		$.ajax({
			type : 'get',
			url : '/admin/applicationList.do',
			dataType : 'json',
			success : function(result){
				
				console.log(result);
				
				var data = result.data;
				
				console.log(data);
				var html = "";
			
				
				for(var i= 0; i <data.length; i++){
					html += '<tr>';
	                html += '<td width="10%">'+ data[i].emploNo +'</td>';
	                html += '<td width="10%">'+ data[i].employeeName +'</td>';
	                html += '<td width="10%">'+ data[i].departmentId +'</td>';
	                html += '<td width="10%">'+ data[i].positionId +'</td>';
	                html += '<td width="10%" class ="resig">'+ data[i].applselect +'</td>';
	                html += '<td width="11%" class ="comreg">'+ data[i].startDate + '</td>';
	                html += '<td width="11%" class ="resig">'+ data[i].endDate + '</td>';
	                html += '<td width="11%" class ="resig">'+ data[i].status + '</td>';
	                html += '<td width="8%"><a href="javascript:void(0)" id ="'+ data[i].applNo +'" class = "approval">승인</a></td>';
	                html += '<td width="8%"><a href="javascript:void(0)" id ="" class ="delete">삭제</a></td>';
	                html += '</tr>';
				}
				$('.tbodyList').html(html);
				
				if(html == null || html == "") {
					$('.noData').addClass('on');
				} else {
					$('.noData').removeClass('on');
				}
				
				$('.approval').on("click", function(e){
					let popUrl = "/admin/applApprovalPage?applNo="+this.id;
					let popOption = "width = 610px, height=800px, top=300px, left=0, scrollbars=no";
				
					window.open(popUrl,"사원정보 수정",popOption);
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