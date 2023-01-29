<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거절 목록</title>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/refusalPop.css">
</head>
<body>
    <div class="refusal_wrap">
        <div class="inner_size">
            
            <div class="content">
                <div class="title">거절 목록</div>

                <div class="refusal_table">
                	<div class="check_box">
                		<div class="c1"><input type="checkbox" id="allCheck"><labal>전체선택</labal></div>
                		<button type="button" class="selectDelete">선택삭제</button>
                	</div>
                    <table>
                        <thead>
                            <tr>
                            	<th width="3%"></th>
                                <th width="12%">아이디</th>
                                <th width="8%">이름</th>
                                <th width="12%">전화번호</th>
                                <th width="12%">이메일</th>  
                                <th width="12%">거부일</th>
                                <th width="8%" class = "t8">등록</th>
                                <th width="8%" class = "t8">삭제</th>
                            </tr>
                        </thead>
                        <c:forEach var="data" items="${data}">
                        	<tbody>
                            	<tr>
                            		<td>
                            			<input type="checkbox" class="checkBox" name="chck" value="${data.employeeId}">
                            		</td>
                                	<td>
                                    	<c:out value="${data.employeeId}" />
                                    </td>
                                    <td>
                                        <c:out value="${data.employeeName}" />
									</td>
                                    <td>
                                    	<c:out value="${data.employeePhone} " />
                                    </td>
                                    <td>
                                    	<div><c:out value="${data.employeeMail} " /></div>
									</td>
 
                                    <td>
                                    	<fmt:formatDate value="${data.refusalregdate}" pattern="yyyy-MM-dd"/>
                                    </td>
                                    <td>
                                   		<a class="btn1" href="javascript:void(0);" title="${data.employeeId}">취소</a>

                                    </td>
                                    <td >
                                    	<a class="btn2" href="#">삭제</a>
                                    	<div class="confirm">
            								<div class="text">
                								<div class="content1">
                   									정말로 삭제하시겠습니까?
                								</div>
                								<div class="yes"><a href="/admin/joindelete?employeeId=${data.employeeId}&${employeevo.qustr}" class="okay">확인</a></div>
                								<div class="no"><a href="#" class="cencel">취소</a></div>
            								</div>
        								</div>
                                     </td>
                                </tr>
                        	</tbody>
						</c:forEach>
                    </table>
                    <div class ="paging_box">
  						<c:if test="${page.prev}">
  							<span>[ <a href="/admin/refusalPop?num=${page.startPageNum - 1}">이전</a> ]</span>
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
  							<span>[ <a href="/admin/refusalPop?num=${page.endPageNum + 1}">다음</a> ]</span>
  						</c:if>
					</div>
                    
                	<div class="confirm1">
            			<div class="text1">
                			<div class="content1">
                   				정말로 취소하시겠습니까?
                			</div>
                			<div class=""><a href="" class="confirmYes">확인</a></div>
                			<div class="no"><a href="javascript:void(0);" class="cencel1">취소</a></div>
        				</div>
                	</div>
            </div>
        </div>
        <!-- .inner_size -->
    </div>
  </div>
    <!-- .refusal_wrap -->
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script>


	$(document).ready(function(){
		
		$('.btn1').click(function(){
    		$('.confirm1').addClass('on');
    		
    		$('.confirmYes').prop('href',"/admin/cencelRefusal?employeeId="+this.title);
    		
		});
		$('.cencel1').click(function(){
   			$('.confirm1').removeClass('on');
		});
		
    	$('.btn2').click(function(){
    		console.log($(this).siblings().addClass('on'));
        	//$('.confirm').addClass('on');
    	});
    	$('.cencel').click(function(){
       		$('.confirm').removeClass('on');
    	});
    	
    	
    	
    	$('#allCheck').click(function(){
    		var chk = $('#allCheck').prop("checked");
    		if(chk){
    			$('.checkBox').prop("checked", true);
    		} else {
    			$('.checkBox').prop("checked", false);
    		}
    		
    	});
    	
    	$('.checkBox').click(function(){
    		$('#allCheck').prop("checked", false);
    		
    	});
    	
    	
    	$('.selectDelete').on('click', function(){
			
    		var employeeIdArray =[];
    		
    		$("input:checkbox[name=chck]:checked").each(function(){
    			
    			employeeIdArray.push($(this).val());
    			
    		});	
    		console.log(employeeIdArray);
    		
    		if(employeeIdArray == ""){
    			alert("삭제할 항목을 선택해주세요.");
    			return false;
    		}
    		
    		var confirmAlert = confirm("정말로 삭제하시겠습니까?");
    		
    		if(confirmAlert){
    				
    			$.ajax({
    				
    				type : 'POST',
    				url : '/admin/joindelete.do',
    				dataType : 'json',
    				data : JSON.stringify(employeeIdArray),
    				contentType : 'application/json',
    				
    				success : function(result) {
    					location.reload();
    					alert("선택하신 항목이 정상적으로 삭제되었습니다.");

    				},
    				error : function(request, status, error){
    					
    				}
    				
    			})
    			
    		}
 
    	});
	});
	


</script>
</body>
</html>