<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>신청서목록</title>
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/applicationList.css">
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
            <div class="application_wrap">
                <div class="inner_size">
                        <div class="title">신청 목록</div>
                        <nav class="menu">
                            <ul>
                               	<li><a href="/admin/employeelist">직원관리</a><span class="line1"></span></li>
                                <li><a href="/admin/resignation">퇴사자관리</a><span class="line1"></span></li>
                                <li><a href="/admin/application">신청서관리</a><span class="line"></span></li>
                                <li><a href="/admin/joinlist">회원승인</a><span class="line1"></span></li>
                            </ul>
                        </nav>
                        <div class="application_mg">
                            <div class="application_search">
                                <input type="text" class="search_input" name="searchKeyword" placeholder="검색어를 입력해주세요.">
                                <a href="#" class="searchbtn">검색</a>
                            </div>

                            <div class="table_box">
                            	<div class="check_box">
                					<button type="button" class="selectDelete">선택삭제</button>
                				</div>
                                <table>
                                    <thead>
                                        <tr>
                                     		<th><div class="c1"><input type="checkbox" id="allCheck"></div></th>
                                            <th>사원번호</th>
                                            <th>이름</th>
                                            <th>부서명</th>
                                            <th>직급</th>
                                            <th>선택</th>
                                            <th>신청일</th>
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
		
		$('.searchbtn').click(function(){
			var searchKeyword = $("input[name=searchKeyword]").val();
			
			$("input[name=searchKeyword]").val(searchKeyword);
			applicationList();
			
		});
		
	    $(".search_input").on("keyup",function(key){
	        if(key.keyCode==13) {
				var searchKeyword = $("input[name = searchKeyword]").val();
				
				$("input[name = searchKeyword]").val(searchKeyword);
				applicationList();
	        }
	    });
		

		
		
		$('.selectDelete').on('click', function(){
			
			var applNoArray =[];
			
			$("input:checkbox[name=chck]:checked").each(function(){
				
				applNoArray.push($(this).val());
				
			});
			
			if(applNoArray == "" || applNoArray == null){
				alert("삭제할 항목을 선택해주세요.");
				return false;
			} else {
				var confirmAlert = confirm("정말로 삭제하시겠습니까?");
				
				if(confirmAlert == true){
					
					$.ajax({
						
						type : 'POST',
						url : '/admin/applicationSelectDelete.do',
						dataType : 'json',
						data : JSON.stringify(applNoArray),
						contentType : 'application/json',
						success : function(result){
							location.reload();
							alert("선택하신 항목이 정상적으로 삭제되었습니다.");
						},
						error : function(){
							alert("연결에 실패하였습니다.");
						}
					});//선택삭제 ajax
				}
			}
			

		});//선택삭제 버튼
	});
	
	function applicationList(num, searchKeyword){
		var searchKeyword = $("input[name=searchKeyword]").val();
		
		$.ajax({
			type : 'get',
			url : '/admin/applicationList.do',
			data : {
				"num" : num,
				"searchKeyword" : searchKeyword
			},
			success : function(result){
				
				var data = result.data;
				
				var html = "";
			
				
				for(var i= 0; i <data.list.length; i++){
					html += '<tr>';
					html += '<td width="1%"><input type="checkbox" class="checkBox" name="chck" value="'+ data.list[i].applNo +'"></td>';
	                html += '<td width="10%">'+ data.list[i].emploNo +'</td>';
	                html += '<td width="10%">'+ data.list[i].employeeName +'</td>';
	                html += '<td width="10%">'+ data.list[i].departmentId +'</td>';
	                html += '<td width="10%">'+ data.list[i].positionId +'</td>';
	                html += '<td width="10%" class ="resig">'+ data.list[i].applselect +'</td>';
	                html += '<td width="11%" class ="comreg">'+ data.list[i].regDate + '</td>';
	                html += '<td width="11%" class ="resig">'+ data.list[i].status + '</td>';
	                html += '<td width="8%"><a href="javascript:void(0)" id ="'+ data.list[i].applNo +'" class = "approval">승인</a></td>';
	                html += '<td width="8%"><a href="javascript:void(0)" id ="'+ data.list[i].applNo +'" class ="delete">삭제</a></td>';
	                html += '</tr>';
				}
				$('.tbodyList').html(html);
				
				
				var page = "";
				if(data.page.prev){
					var startPageNum = data.page.startPageNum - 1;
					page += '<span class="prev">[ ';
					page += '<a href="javascript:applicationList(' + startPageNum +')">이전</a>';
					page += ']</span>';

				}
				
				for(var num = data.page.startPageNum; num <= data.page.endPageNum; num++ ){
					if(data.select == num){
						page += '<span class="numPadding">';
						page += '<span class="point"><a href="javascript:applicationList(' + num + ')">' + num + '</a></span>';
						page +=	'</span>';
					}
					
					if(data.select != num){
						page += '<span class="numPadding">';
						page += '<span class="noPoint"><a href="javascript:applicationList(' + num + ')">' + num + '</a></span>';
						page +=	'</span>';
					}
				}
				
				
				if(data.page.next){
					var endPageNum = data.page.endPageNum + 1;
					page += '<span class="next">[';
					page +=	'<a href="javascript:applicationList(' + endPageNum +')">다음</a>';
					page += ']</span>';
					
				}
				$('.paging_box').html(page);
				
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
				
				$('.delete').on("click", function(e){
					var con = confirm("정말로 삭제하시겠습니까?");
					
					if(con == true){
						alert("삭제에 성공하였습니다.");
						$(location).attr("href", "/admin/applApprovalDelete?applNo="+ this.id);
					} else {
						alert("삭제를 취소하였습니다.");
					}
					
				});
				
				//체크박스
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
				})
				
			
				
			},
			error : function(){
				alert("연결에 실패하였습니다.");
			}
			
		});
	}

</script>
</body>
</html>