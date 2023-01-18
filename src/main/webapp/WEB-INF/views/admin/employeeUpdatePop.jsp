<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/employeeUpdatePop.css">
</head>
<body>
<form method="post" id="update_form" name="updateForm">
    <div class="update_pop">
        <div class="content">
            <div class="title">
                <div class="t1">
                  ${data.employeeName}  님의 사원정보 수정
                </div>
            </div>
            <!-- .title -->

            <div class="input_box">
                <div class="employeeNo">
                    <span class="no">사원번호 : </span><span class="conNo">${data.emploNo}</span>
                    <input type="hidden" name="emploNo" value="${data.emploNo}"/>
                </div>

                <div class="department">
                    <span class="d1">부서 : </span>
                    <select name="departmentId" id ="departmentId">     
                    	<option selected> ${data.departmentId}</option>
                        <option value="A1">회계팀</option>
                        <option value="D1">디자인팀</option>
                        <option value="D2">개발팀</option>
                        <option value="M1">마케팅</option>
                        <option value="P1">인사팀</option>
                        <option value="P2">홍보팀</option>
                        <option value="S1">서비스팀</option>
                        <option value="D00">미정</option>
                    </select>
                </div>

                <div class="position">
                    <span class="d1">직급 : </span>
                    <select name="positionId" id="positionId">
                     	<option selected> ${data.positionId}</option>
                        <option value="07">인턴</option>
                        <option value="06">사원</option>
                        <option value="05">주임</option>
                        <option value="04">대리</option>
                        <option value="03">과장</option>
                        <option value="08">차장</option>
                        <option value="02">부장</option>
                        <option value="01">이사</option>
                        <option value="00">사장</option>
                        <option value="P00">미정</option>
                    </select>
                </div>

                <div class="status">
                    <span class="d1">직원구분 : </span>
                    <select name="statusId" id="statusId">
                        <option selected> ${data.statusId}</option>
                        <option value="01">정규</option>
                        <option value="02">계약</option>
                        <option value="03">퇴사</option>
                        <option value="04">퇴직</option>
                        <option value="05">해고</option>
                        <option value="06">계약완료</option>
                        <option value="00">미정</option>
                    </select>
                </div>

                <div class="salary">
                    <span class="d1">기본급 : </span>
                    <input type="text" name="salary" id ="salary" value="${data.salary}">
                </div>

                <div class="comregdate">
                    <span class="d1">입사일 : </span>
                    <input type="date" name="comregdate" id="comregdate" value="${data.comregdate}">
                </div>

            </div>
            <!-- .input_box -->
            <div class="submit">
		<!--<input type="button" value="등록하기" id="submit_btn"/> -->
					<a href="#" id="submit_btn">등록</a>
            </div>
        </div>
        <!-- .content -->
    </div>
    <!-- .update_pop --> 
</form>

<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script>
	
	//유효성체크
	var departCk = false;
	var positionCk = false;
	var statusCk = false;
	var salaryCk = false;
	var comreg = false;
	
	$(document).ready(function(){
		$("#submit_btn").click(function() {
			
			var department = $('#departmentId').val();
			var position = $('#positionId').val();
			var status = $('#statusId').val();
			var sal = $('#salary').val();
			var comreg = $('#comregdate').val();
			
			if(department == ""|| department == null ){
				alert("부서를 선택해주세요.");
				departCk = false;
			} else {
				departCk = true;
			}
			
			if(position == ""|| position == null ){
				alert("직급을 선택해주세요.");
				positionCk = false;
			} else {
				positionCk = true;
			}
			
			if(status == ""|| status == null ){
				alert("직원구분을 선택해주세요.");
				statusCk = false;
			} else {
				statusCk = true;
			}
			
			if(sal == ""|| sal == null ){
				alert("급여를 작성해주세요.");
				salaryCk = false;
			} else {
				salaryCk = true;
			}
			
			if(comreg == ""|| comreg == null ){
				alert("입사일은 선택해주세요");
				comreg = false;
			} else {
				comreg = true;
			}
			
			if(departCk&&positionCk&&statusCk&&salaryCk&&comreg) {
				
				var data = $('form[name=updateForm]').serialize();
				
				var con = confirm("정말 등록하시겠습니까?");
				
				if(con == true){
					$.ajax({
		 				type : "post",
		 				url : "/admin/employeeUpdatePop",
		 				data : data,
		 				success : function(data){
		 					alert("등록에 성공하였습니다.");
							window.close();
							opener.location.reload();
		 				},
		 				error : function (){
		 					alert("등록에 실패하였습니다.");
		 				}
						
		 			});
				} else if(con == false){
					alert("등록을 취소하였습니다.");
				}

			}
	
		 });
		
	});

</script>
</body>
</html>