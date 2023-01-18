<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
	
	
	<c:if test="${member != null}">
	<form method ="post">
	<input type="hidden" name="employeeId" value="${member.employeeId}"/>
	<div class="applicationList">
		<table >
        	<thead>
            	<tr>
                	<th>사원번호</th>
                    <th>신청일</th>
                    <th>신청종류</th>
                    <th class = "t8">수정</th>
                    <th class = "t8">취소</th>
                </tr>
            </thead>
            <tbody id="tbodyList">
  				
			</tbody>

		</table>
	</div>
	</form>
	</c:if>
	
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script>
	$(document).ready(function(){
		
		submitList();
		
	});
	
	
	
	function submitList(employeeId){
		var employeeId =  $("input[name=employeeId]").val();
		console.log(employeeId);
		
		$.ajax({
			type : 'get',
			url : '/main.do',
			data : {
				"employeeId" : employeeId
			},
			
			success : function(result){
				console.log(result);
				
				var data = result.data;
				
				console.log(data);
				
				var html = "";
				
				for(var i= 0; i <data.length; i++){

					html += "<tr>";
	            	html += "<td width ='9%'>"+ data[i].employeeId +"</td>";
					html += "<td width ='9%'>" + data[i].startDate + "</td>";
	           		html += "<td width ='10%'>" + data[i].applselect + "</td>";
	           		html += "<td width ='9%'><a href ='javascript:void(0)' title='' class='update'>수정 </a></td>";
	           		html += "<td width ='9%'><a href ='javascript:void(0)' title='' class='detail'>상세보기</a></td>";
	       		    html += "</tr>";
				}
				
				$('#tbodyList').html(html);
			},
			error : function(){
				alert("연결에 실패하였습니다.")
			}
			
		});
	}

</script>
</body>
</html>