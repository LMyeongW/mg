<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/approvalPop.css">
</head>
<body>
<form method="post" id="update_form" name="updateForm">
    <div class="approvalPop">
        <div class="content">
            <div class="title">
                <div class="t1">
                  ${data.employeeName}  님의 승인신청서
                </div>
            </div>
            <!-- .title -->

            <div class="input_box">
                <div class="employeeNo">
                    <span class="no">사원번호 : </span><span class="conNo">${data.emploNo}</span>
                    <input type="hidden" name="applNo" value="${data.applNo}"/>
                </div>

                <div class="department">
                    <span class="d1">부서 : ${data.departmentId}</span>
					
                </div>

                <div class="position">
                    <span class="d1">직급 :  ${data.positionId}</span>

                </div>
				<div class="position">
                    <span class="d1">종류 : ${data.applselect}</span>

                </div>

                <div class="salary">
                    <span class="d1">시작일 : ${data.startDate}</span>
                    
                </div>

                <div class="comregdate">
                    <span class="d1">종료일 : ${data.endDate}</span>
                     
                </div>
                
                <div class="status">
                    <span class="d1">상태 : </span>
                    <select name="status">
                    	<option selected>${data.status}</option>
                    	<option value="1A">승인</option>
                    	<option value="2A">거부</option>
                    	<option value="3A">승인대기</option>
                    </select>
                </div>

            </div>
            <!-- .input_box -->
            <div class="submit">
		<!--<input type="button" value="등록하기" id="submit_btn"/> -->
					<a href="javascript:void(0)" id="submit_btn">등록</a>
            </div>
        </div>
        <!-- .content -->
    </div>
    <!-- .update_pop --> 
</form>

<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script>
	
	$(document).ready(function(){
		$("#submit_btn").click(function() {
			var con = confirm("등록하시겠습니까?");
			if(con == true){
				var data = $('form[name=updateForm]').serialize();
				console.log(data);
				
				$.ajax({
					
					type : 'post',
					url : '/admin/applApprovalPage',
					data : data,
					success : function(data){
						alert("등록에 성공하였습니다.");
						window.close();
						opener.location.reload();
						
					},
					error : function(){
						alert("연결에 실패하였습니다.");
					}

		
				 });	
			}else {
				alert("등록이 취소되었습니다.");
			}
		 });
		
	});
	


</script>
</body>
</html>