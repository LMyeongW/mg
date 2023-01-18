<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	IndexPage
	<c:if test="${member == null}">
		<div class="loginAndjoin">
        	<a href="/account/login" class="login">로그인</a>
            <a href="/account/join" class="join">회원가입</a>
        </div>
    </c:if>
                    
    <c:if test="${member != null}">
    	<div class="loginAndjoin">
        	<a href="#" class="login">로그아웃</a>
        </div>
    </c:if>
    
    <div class="login_area">
		<c:if test="${member != null}">
			<div class="login_success_area">
				<div>아이디 : ${member.employeeId} </div>
                <div>이름 :${member.employeeName } </div>
                <div>사원번호 : ${member.emploNo } </div>
               	<a href="#">로그아웃</a>
			</div>
					
			<div><a href="/application/submit" class="login">신청서작성</a></div>
			<div><a href="/admin/employeelist" class="login">사원관리페이지</a></div>
		</c:if>	
	</div>
	
	<div class="applicationList">
		<table >
        	<thead>
            	<tr>
                	<th>사원번호</th>
                    <th>이름</th>
                    <th>신청일</th>
                    <th>신청종류</th>
                    <th class = "t8">수정</th>
                    <th class = "t8">취소</th>
                </tr>
            </thead>
            <c:forEach var="data" items="${data}">
            	<tbody>
                	<tr>
                    	<td width ="7%">
                        	<c:out value="${data.emploNo}" />
                        </td>
                        <td width ="7%">
                        	<c:out value="${data.employeeName}" />
                        </td>
                        <td width ="10%">
                         	<c:out value="${data.startDate}" />
						</td>
                        <td width ="10%">
                         	<c:out value="${data.applselect}" />
						</td>

                        <td width ="7%">
                			<div class="btn_box">
                				<a href ="/admin/joindetail?employeeId=${data.employeeId}&${employeevo.qustr}" class ="btn1">
                         		승인
                         		</a> 
                			</div> 		
                       </td>
                       <td width ="7%">
                            <a class="btn2" href="javascript:void(0);" title="${data.employeeId}">거부</a>
                       </td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
	</div>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script>
	$(document).ready(function(){});

</script>
</body>
</html>