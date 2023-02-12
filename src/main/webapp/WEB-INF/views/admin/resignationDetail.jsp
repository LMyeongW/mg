<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>

<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>퇴사자 등록</title>
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/resignationDetail.css">
</head>

<body>
    <div id="wrap">
    <form method="post" name ="detailForm">
    <input type="hidden" name="emploNo" value="${data.emploNo}"/>
        <div class="inner_size">
            <div class="content">
         		<div class ="picture_box">
         			<div class="picture">
                    	<span class="line1"></span>
                    	<span class="line2"></span>
                	</div>
                	 <!-- .picture -->
         		</div>
               

                <div class="t1">
                    <div class="name">
                        이름 : <span>${data.employeeName}</span>
                    </div>
                    <div class="emploNo">
                        사원번호 : <span>${data.emploNo}</span>
                    </div>

                    <div class="department">
                        부서 : 
                        <select name="departmentId" id ="departmentId">     
                            <option selected> ${data.departmentId}</option>
                            <option value="A1" c:out value=" ${data.departmentId eq 'A1' ?'selected':''}">회계팀</option>
                            <option value="D1" c:out value=" ${data.departmentId eq 'D1' ?'selected':''}">디자인팀</option>
                            <option value="D2" c:out value=" ${data.departmentId eq 'D2' ?'selected':''}">개발팀</option>
                            <option value="M1" c:out value=" ${data.departmentId eq 'M1' ?'selected':''}">마케팅</option>
                            <option value="P1" c:out value=" ${data.departmentId eq 'P1' ?'selected':''}">인사팀</option>
                            <option value="P2" c:out value=" ${data.departmentId eq 'P2' ?'selected':''}">홍보팀</option>
                            <option value="S1" c:out value=" ${data.departmentId eq 'S1' ?'selected':''}">서비스팀</option>
                            <option value="D00" c:out value=" ${data.departmentId eq 'D00' ?'selected':''}">미정</option>
                        </select>
                    </div>
    
                    <div class="position">
                        직급 : 
                        <select name="positionId" id="positionId">
                            <option selected> ${data.positionId}</option>
                            <option value="07" c:out value=" ${data.positionId eq '07' ?'selected':''}">인턴</option>
                            <option value="06" c:out value=" ${data.positionId eq '06' ?'selected':''}">사원</option>
                            <option value="05" c:out value=" ${data.positionId eq '05' ?'selected':''}">주임</option>
                            <option value="04" c:out value=" ${data.positionId eq '04' ?'selected':''}">대리</option>
                            <option value="03" c:out value=" ${data.positionId eq '03' ?'selected':''}">과장</option>
                            <option value="08" c:out value=" ${data.positionId eq '08' ?'selected':''}">차장</option>
                            <option value="02" c:out value=" ${data.positionId eq '02' ?'selected':''}">부장</option>
                            <option value="01" c:out value=" ${data.positionId eq '01' ?'selected':''}">이사</option>
                            <option value="00" c:out value=" ${data.positionId eq '00' ?'selected':''}">사장</option>
                            <option value="P00" c:out value=" ${data.positionId eq 'P00' ?'selected':''}">미정</option>
                        </select>
                    </div>
    
                    <div class="status">
                        직원구분 : 
                        <select name="statusId" id="statusId">
                            <option selected> ${data.statusId}</option>
                            <option value="01" c:out value=" ${data.statusId eq '01' ?'selected':''}">정규</option>
                            <option value="02" c:out value=" ${data.statusId eq '02' ?'selected':''}">계약</option>
                            <option value="03" c:out value=" ${data.statusId eq '03' ?'selected':''}">퇴사</option>
                            <option value="04" c:out value=" ${data.statusId eq '04' ?'selected':''}">퇴직</option>
                            <option value="05" c:out value=" ${data.statusId eq '05' ?'selected':''}">해고</option>
                            <option value="06" c:out value=" ${data.statusId eq '06' ?'selected':''}">계약완료</option>
                            <option value="00" c:out value=" ${data.statusId eq '00' ?'selected':''}">미정</option>
                        </select>
                    </div>

                    <div class="comregdate">
                        입사일 : <span>${data.comregdate}</span>
                    </div>
                </div>
                <!-- .t1 -->
                <div class="t2">
                    <div class="phoneTitle">연락처</div>
                    <div class="phone"><input type="text" name="employeePhone" value ="${data.employeePhone}"></div>
                </div>
                <div class="t3">
                    <div class="emailTitle">Email</div>
                    <div class="email"><input type="text" name="employeeMail" value ="${data.employeeMail}"></div>
                </div>
                <div class="t4">
                    <div class="addrTitle">주소</div>
                    <div class="addr1"><input type="text" name="employeeAddr1" value ="${data.employeeAddr1}"></div>
                    <div class="addr2"><input type="text" name="employeeAddr2" value ="${data.employeeAddr2}"></div>
                    <div class="addr3"><input type="text" name="employeeAddr3" value ="${data.employeeAddr3}"></div>
                </div>

                <div class="t5">
                    <div class="reasonTitle">사유<span>퇴사일 : <input type="date" name="resignationdate" value ="${data.resignationdate}"></span></div>
                    <textarea name ="reason">${data.reason}</textarea>
                </div>

                <div class="registration">
                    <a href="javascript:void(0);" class ="registration_btn">등록</a>
                </div>
            </div>
            <!-- .content -->
        </div>
        <!-- .inner_size -->
    </form>
    </div>
    <!-- #wrap -->
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script>
/*이미지 출력*/

	$(document).ready(function(){
		 var emploNo ='<c:out value="${data.emploNo}"/>';
		 var uploadReslut = $(".picture_box");
		
		$.getJSON("/admin/AttachImage", {emploNo : emploNo}, function(arr){	
			
			if(arr.length === 0){			
				return;
				
				let str = "";
				str += "<div class='picture'>";
				str += "이미지가 없습니다.";
				str += "</div>";
				
				uploadReslut.html(str);	
			}
			
			var str = "";
			var obj = arr[0];
			
			var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
			str += "<div class='picture'";
			str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
			str += ">";
			str += "<img  class='img' src='/admin/display?fileName=" + fileCallPath +"'>";
			str += " <div class='imgDeleteBtn' data-file='" + fileCallPath + "'> </div>"
			str += "<input type='hidden' name='fileName' value='"+ obj.fileName +"'>";
			str += "<input type='hidden' name='uuid' value='"+ obj.uuid +"'>";
			str += "<input type='hidden' name='uploadPath' value='"+ obj.uploadPath +"'>";
			str += "</div>";
			
			uploadReslut.html(str);	
			console.log(str);
			
		});

	});

	$('.registration_btn').click(function(){
		
		var resignationdate = $('input[name=resignationdate]').val();
		
	
		console.log(resignationdate);
		var data = $('form[name=detailForm]').serialize();

		console.log(data.resignationdate);
		$.ajax({
			
			type : 'post',
			url : '/admin/resignationDetail.do',
			dataType: 'json',
			data : data,
			
			success : function(data){
				alert("등록에 성공하였습니다.");
				window.close();
				opener.location.reload();
				
			},
			error : function(data){
				alert("연결에 실패하였습니다.");
				console.log(data)
			}
			
		});//resignationInfo ajax
		
	});


</script>

</body>
</html>