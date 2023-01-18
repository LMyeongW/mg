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
    <link rel="stylesheet" href="/resources/css/application.css">
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
                                        	<th></th>
                                            <th class="t1">사원번호<a href="javascript:resignationList('asc');" title="오름차순">▲</a><a  href="javascript:resignationList('desc');" title="내림차순">▼</a>
                                            </th>
                                            <th>이름</th>
                                            <th>아이디</th>
                                            <th>부서명</th>
                                            <th>직급</th>
                                            <th>직원구분</th>
                                            <th>입사일</th>
                                            <th>퇴사일</th>
                                            <th>승인</th>
                                            <th>삭제</th>
                                        </tr>
                                    </thead>
                                    <tbody class = "tbodyList">
                                   
                                    </tbody>

                                </table>
                            </div>
                            <!-- .table_box -->
                            
                            <div class ="paging_box">
							</div>
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
</script>
</body>
</html>