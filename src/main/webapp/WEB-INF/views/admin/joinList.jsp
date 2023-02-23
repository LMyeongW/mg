<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 신청목록</title>
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/joinList.css">
</head>

<body>
    <div id="wrap">
        <header>
            <div class="inner_size">
                <div class="header_m">
                   <h1>
                    	<a href="/main" class="link">
                        	<div class="img">
                                <img src="/resources/img/logo_black.png" alt="로고"/>
                            </div>
							관리자페이지
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
            <div class="join_wrap">
                <div class="inner_size">
                	<div class="title">회원가입 승인 대기</div>
                     <nav class="menu">
                     	<ul>
                        	<li><a href="/admin/employeelist">직원관리</a><span class="line1"></span></li>
                            <li><a href="/admin/resignation">퇴사자관리</a><span class="line1"></span></li>
                            <li><a href="/admin/application">신청서관리</a><span class="line1"></span></li>
                            <li><a href="/admin/joinlist">회원승인</a><span class="line"></span></li>
                        </ul>
                     </nav>
                        <div class="join_mg">
                            <div class="join_search">
                                <input type="text" name = "searchKeyword" class="search_input" placeholder="검색어를 입력해주세요." value ="${searchKeyword}">
                                <button type="button" class="searchbtn">검색</button>
                            </div>
                            <div class="refusal">
                                <input id="refusal_input" readonly="readonly">
								<input id="employeeId" name="employeeId" type="hidden">
								<button class="refusal_btn">거부 목록</button>
                            </div>
                            <div class="table_box">
                            	<table >
                                    <thead>
                                        <tr>
                                        	<th>아이디</th>
                                            <th>이름</th>
                                            <th>생년월일</th>
                                            <th>성별</th>
                                            <th>전화번호</th>
                                            <th>이메일</th>
                                            <th>주소</th>
                                            <th>가입일</th>
                                            <th class = "t8">승인</th>
                                            <th class = "t8">거부</th>
                                        </tr>
                                    </thead>
                                     <c:forEach var="data" items="${data}">
                                    	<tbody>
                                    		<c:if test="${data != null}">
                                        	<tr>
                                        	   	<td width ="7%">
                                            		<c:out value="${data.employeeId}" />
                                            	</td>
                                            	<td width ="7%">
                                            		<c:out value="${data.employeeName}" />
                                            	</td>
                                            	<td width ="10%">
                                            		<c:out value="${data.employeeBirthday1} " />-<c:out value="${data.employeeBirthday2} " />-<c:out value="${data.employeeBirthday3} " />
												</td>
												<td width ="7%">
                                            		<c:out value="${data.employeeGender} " />
                                            	</td>
                                            	<td width ="11%">
                                            		<c:out value="${data.employeePhone} " />
                                            	</td>
                                            	<td width ="12%">
                                            		<div><c:out value="${data.employeeMail} " /></div>
												</td>
  												<td width ="22%">
                                            		<div class="t6"><c:out value="${data.employeeAddr1} " /> <c:out value="${data.employeeAddr2} " /> <c:out value="${data.employeeAddr3} " /></div>
                                            	</td >
                                            	<td width ="10%">
                                            		<fmt:formatDate value="${data.regdate}" pattern="yyyy-MM-dd"/>
                                            	</td>
                                            	<td width ="7%">
                                   					<div class="btn_box">
                                   						<a href ="/admin/joindetail?employeeId=${data.employeeId}&${employeevo.qustr}${page.searchKeyword}" class ="btn1">
                                            				승인
                                            			</a> 
                                   					</div> 		
                                            	</td>
                                            	<td width ="7%">
                                            		<a class="btn2" href="javascript:void(0);" title="${data.employeeId}">거부</a>
                                            	</td>
                                        	</tr>
                                        	</c:if>
  

                                    	</tbody>
       									
 
									</c:forEach>

                                </table>

                            </div>
                         	<div class="confirm">
            					<div class="text">
                					<div class="content">
                   						정말로 거부하시겠습니까?
                					</div>
                					<div class="yes"><a href="" class="confirmNo">확인</a></div>
                					<div class="no"><a href="javascript:void(0);" class="cencel">취소</a></div>
            					</div>
        					</div>
                            <div class ="paging_box">
  								<c:if test="${page.prev}">
  									<span>[ <a href="/admin/joinlist?num=${page.startPageNum - 1}${page.searchKeyword}">이전</a> ]</span>
  								</c:if>
  		
     							<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
  									<span>
  										<c:if test="${select != num }">
  											<span class="noPoint"><a href="/admin/joinlist?num=${num}${page.searchKeyword}">${num}</a></span>
  										</c:if>
  										
  										<c:if test="${select == num }">
  											<span class="point">${num}</span>
  										</c:if>
  									</span>
								</c:forEach>
		
								<c:if test="${page.next}">
  									<span>[ <a href="/admin/joinlist?num=${page.endPageNum + 1}${page.searchKeyword}">다음</a> ]</span>
  								</c:if>
							</div>
                            <!-- .table_box -->
                            <c:if test="${empty data}">
								<div class="noData">
                             		등록된 정보가 없습니다.
                                 </div>
                            </c:if>
                        </div>
                    <!-- .employee_mg -->
                    
                    
              
                </div>
            </div>
            <!-- .admin_wrap -->
        </main>
        <!-- main -->
        


        <footer></footer>
        <!-- footer -->
    </div>
    <!-- #wrap -->
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script>
	
	
    $('.refusal_btn').on("click", function(e){
		let popUrl = "/admin/refusalPop";
		let popOption = "width = 1160px, height=900px, top=300px, left=0, scrollbars=yes";
		
		window.open(popUrl,"거절 목록",popOption);
    });
    
	$('.searchbtn').on("click", function(e){
		var searchKeyword = $("input[name = searchKeyword]").val();
		
		location.href = "/admin/joinlist?num=1" + "&searchKeyword=" + searchKeyword ;
		var noData = $('input[name=employeeId]').val();

	});
	
    $(".search_input").on("keyup",function(key){
        if(key.keyCode==13) {
			var searchKeyword = $("input[name = searchKeyword]").val();

			location.href = "/admin/joinlist?num=1" + "&searchKeyword=" + searchKeyword ;
			var noData = $('input[name=employeeId]').val();
			employeeList();
        }
    });
	
	$(document).ready(function(){
        $('.btn2').click(function () {
            $('.confirm').addClass('on');
            
            $('.confirmNo').prop('href', "/admin/refusalUpdate?employeeId="+this.title);
            
            
        });
    	$('.cencel').click(function(){
       		$('.confirm').removeClass('on');
    	});
	});

</script>
</body>

</html>