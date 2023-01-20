<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 페이지</title>
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/mgList.css">
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
            <div class="admin_wrap">
                <div class="inner_size">
                	<div class="title">직원관리</div>
                        <nav class="menu">
                            <ul>
                                <li><a href="/admin/employeelist">직원관리</a><span class="line"></span></li>
                                <li><a href="/admin/resignation">퇴사자관리</a><span class="line1"></span></li>
                                <li><a href="/admin/application">휴직자</a><span class="line1"></span></li>
                                <li><a href="/admin/joinlist">회원승인</a><span class="line1"></span></li>
                            </ul>
                        </nav>
                        <div class="employee_mg">
                            <div class="employ_search">
                                <input type="text" class="search_input" name="searchKeyword" placeholder="검색어를 입력해주세요.">
                                <a href="#" onclick="employeeList();" class="searchbtn">검색</a>
                                <select  id="status" name="statusIdSelect">
                                	<option value="all" selected >전체</option>
                      				<option value="01" >정규</option>
                        			<option value="02">계약</option>
                        			<option value="00" >미정</option>
                    			</select>
                            </div>
                            <div class="table_box">
                           
                                <table>
                                    <thead>
                                        <tr>
                                            <th>사원번호<a href="javascript:employeeList('asc');" title="오름차순">▲</a><a  href="javascript:employeeList('desc');" title="내림차순">▼</a></th>
                                            <th>이름</th>
                                            <th>성별</th>
                                            <th>전화번호</th> 
                                            <th>부서명</th>
                                            <th>직급</th>
                                            <th>직원구분</th>
                                            <th>기본급</th>
                                            <th>입사일</th>
                                            <th>수정</th>
                                            <th>상세보기</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tbodyList">
                                    
									</tbody>
                                </table>
                                
                            </div>
                            <!-- .table_box -->
                            <div class ="paging_box"></div>
							<div class="noData">등록된 정보가 없습니다.</div>
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
	
	$(document).ready(function(){
		employeeList();
		
		$(".searchbtn").click(function(){
			var searchKeyword = $("input[name = searchKeyword]").val();
			console.log(searchKeyword);
			
			$("input[name = searchKeyword]").val(searchKeyword);
			employeeList();
		});
		
		
		/*$('#status').on("change",function(){
			var statusType = $("select[name=statusIdSelect] option:selected").val()
			console.log(statusType);
			
			$.ajax({
				type : 'get',
				url : '/admin/statusSelect.do',
				data : {"statusType" : statusType},
				success : function(result){
					console.log(result);
				}
			});
		});	*/
	});
	


	
	function employeeList(order, num, searchKeyword){
		
		var searchKeyword = $("input[name = searchKeyword]").val();
		
		$.ajax({			
			type : 'get',
			url : '/admin/employeelist.do',
			data : {
				"orderType" : order,
				"num"       : num,
				"searchKeyword" : searchKeyword
				/*"statusType": statusType*/
			},
			
			success : function(result){
			
				var html = "";
				
				for(let i = 0; i <result.data.list.length; i++){
					html += "<tr>";
	            	html += "<td width ='9%'>"+  result.data.list[i].emploNo + "</td>";
	            	html += "<td width ='9%'>"+ result.data.list[i].employeeName +"</td>";
					html += "<td width ='9%'>" + result.data.list[i].employeeGender + "</td>";
	           		html += "<td width ='10%'>" + result.data.list[i].employeePhone + "</td>";
	           		html += "<td width ='9%'>" + result.data.list[i].departmentId + "</td>";
	           		html += "<td width ='9%'>"+ result.data.list[i].positionId + "</td>";
	           		html += "<td width ='9%' class='status'>" + result.data.list[i].statusId + "</td>";
	           		html += "<td width ='9%'>" + result.data.list[i].salary2 + "</td>";
	           		html += "<td width ='9%'>" + result.data.list[i].comregdate + "</td>";
	           		html += "<td width ='9%'><a href ='javascript:void(0)' title='"+ result.data.list[i].emploNo +"' class='update'>수정 </a></td>";
	           		html += "<td width ='9%'><a href ='javascript:void(0)' title='" + result.data.list[i].emploNo +"' class='detail'>상세보기</a></td>";
	       		    html += "</tr>";
					
				}
				$('#tbodyList').html(html);
				
				$('.update').on("click", function(e){
					let popUrl = "/admin/employeeUpdatePop?emploNo="+ this.title;
					let popOption = "width = 610px, height=800px, top=300px, left=0, scrollbars=no";
				
					window.open(popUrl,"사원정보 수정",popOption);
				});
				
				$('.detail').on("click", function(e){
					let popUrl = "/admin/employeedetail?emploNo="+ this.title;
					let popOption = "width = 970px, height=920px, top=300px, left=0, scrollbars=no";
				
					window.open(popUrl,"사원정보 수정",popOption);
					
				});
				
				
				var page ="";
				
				if(result.data.page.prev ){
					var startPageNum = result.data.page.startPageNum - 1;
					page += "<span class='prev'>[ ";
					page += '<a href="javascript:employeeList(\'' + result.data.orderType + '\',' + startPageNum +')">';
					page += "이전</a> ]</span>";
				}

				for(let num = result.data.page.startPageNum; num <= result.data.page.endPageNum; num++){
					page += "<span class = 'numPadding'>";
// 					page +=  '<a href="/admin/employeelistSort?num='+ num +'">' + num + '</a>';
					page += '<a href="javascript:employeeList(\''+ result.data.orderType+ '\', '+ num +')">' + num + '</a>';
					page += "</span>";
				}
					console.log(num);
				if(result.data.page.next){
					var endPageNum = result.data.page.endPageNum + 1;
					page += "<span class='next'>[ ";
					page += '<a href="javascript:employeeList(\'' + result.data.orderType + '\',' + endPageNum +')">';
					page += "다음</a> ]</span>";
				}
				$('.paging_box').html(page);
				
				if(html == null || html == "") {
					$('.noData').addClass('on');
				} else {
					$('.noData').removeClass('on');
				}
				
				/*$('#status').on("change",function(){
					var statusType = $("select[name=statusIdSelect] option:selected").val()
					console.log(statusType);
					
					$.ajax({
						type : 'get',
						url : '/admin/statusSelect.do',
						data : {"statusType" : statusType},
						success : function(result){
							console.log(result);
						}
					});
				});	*/

			},
			error : function(){
				alert("연결에 실패하였습니다.");
			}
		});
		
		
		
	}
    	
   /* $(document).ready(function(){
    		
        	$("#status[name=statusIdSelect]").change(function(){
        		var selectStatus = $("#status[name=statusIdSelect] option:selected").val();
        		console.log(selectStatus);
        		
        		$.ajax({
        			type : '',
        			url : '/admin/selectStatus',
        			data : selectStatus,
        			success : function(){
        				alert("데이터 넘기기 성공");
        			}
        		});
     });*/
        	
        	
    			

    			
 
		


	


</script>
</body>
</html>