<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 관리 리스트(수정/삭제)</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/v4-shims.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
    <!--  
    -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>
  /* rgb(52, 152, 219) --> 사이트 색상 */
 *{ 
     margin: 0;
     padding: 0;
     
     box-sizing: border-box;
 }

.wrap{width: 100%; 
      height: 100%;
      display: flex;
     
    }
 /* 작성하기 버튼 */
.writeButton{text-align: center;}

.button1{
   border-radius: 10px;
   border: 0;
   width: 250px;
   height: 45px;
   font-size: larger;
   color: white;
   background-color: rgb(84, 129, 189);
   
            }

.button1:hover{
   cursor: pointer;
   background-color: rgb(27, 97, 189);
   
            }

/* 콘텐츠 영역 */

.content{
   
    width:100%;
    margin-left: 300px;
    
    display:block;
    margin-top: 50px;

}

.content_1{height: fit-content; margin-left: 40px; width: fit-content;}

.content_2{height: fit-content; align-content: center; position: relative;}

.content_3{height: fit-content; padding-left: 50px;}

.w3-bar{height: fit-content; text-align: center;}

.content_1:hover{cursor: pointer;}

table{
    width: 95%;
    height: 80%;
    border-collapse: collapse;
    border-spacing: 0;
    background: #fafafa;
    text-align: center;
}
th{background: #e7e1e1;}

th,td{
    padding: 10px 15px;

}

/* tbody tr:hover{background-color: rgb(52, 152, 219); color: white;} */

/* 문서양식 드롭다운 */
.formtype{
    border: 1px solid darkgray;
    width: 150px;
    height: 170px;
    background-color: white;
    text-align: center;
    font-size: 15px;
    z-index: 1000;
    display: none;
    margin-left: 50px;
    position: absolute;
    
    
}
.formtype div{
    margin-top: 10px;
    
}

.formtype div:hover{
    background-color: rgb(204, 198, 198);
}
.formtype a{
    text-decoration: none;
    color: rgb(61, 56, 56);
    
}
.search #selectList{width: 100px;}
.search #selectList,#keyword{ 
    height: 40px; 
    border: 1px solid #e7e1e1; 
    border-radius: 5px;
}
.search button{
    height: 40px;
    width: 60px; 
    background-color: rgb(52, 152, 219); 
    color: white;
    border: 1px solid #e7e1e1; 
    border-radius: 5px;
}
/*
.search button:hover{
    background-color: #e7e1e1;
    color: rgb(52, 152, 219);}
*/
#update,#delete{
    height: 30px;
    width: 60px; 
    margin-bottom: 10px;
}
</style>
</head>
<body>
	<div class="wrap">
	<jsp:include page="../common/approvalNavbar.jsp"/>
        
        <jsp:include page="../common/sideBar_manage.jsp"/>

        <div class="content"><br><br><br>
            <div class="content_1">
                <h2>사원 리스트 조회</h2>
                <div class="search" style="margin-left: 770px;">
                    <form action="searchM.ma" method="POST" id="searchForm">
                    	<input type="hidden" name="currentPage" value="1">
                        <select name="selectList" id="selectList">
                            <option value="mem">사원명</option>
                            <option value="dept">부서</option>
                            <option value="job">직책</option>
                            <option value="status">상태(Y/N으로 검색)</option>
                        </select>
                        <input type="text" id="keyword" name="keyword">
                        <button type="submit">검색</button>
                    </form>
                </div>
            </div>
            <br>
            <div class="content_2">
                <form action="updateForm.ma" method="GET" id="updateBox">
                	<input type="hidden" name="delId" value="${ loginUser.memId }">
                	<input type="hidden" name="delPwd" value="${ loginUser.memPwd }">
                    <div style="margin-left: 30px;">
                        <button type="button" class="btn btn-primary" id="update" onclick="checked1();">수정</button>
                        <button type="button" class="btn btn-danger" id="delete" onclick="checked2();" data-toggle="modal" data-target="#myModal">
                            삭제
                        </button>
                    </div>
                    <table class="table" style="margin: auto; text-align: center;">
                        <thead class="thead-dark">
                            <tr>
                                <th>선택</th>
                                <th>구분</th>
                                <th>사원번호</th>
                                <th>사원명</th>
                                <th>부서</th>
                                <th>직책</th>
                                <th>생년월일</th>
                                <th>입사일</th>
                                <th>휴대폰</th>
                                <th>이메일</th>
                                <th>상태</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:forEach var="m" items="${ list }">
	                            <tr>
	                                <td><input type="checkbox" class="checked" name="memNo" value="${ m.memNo }"></td>
	                                <td>
		                            	<c:choose>
			                            	<c:when test="${ m.jobName == 'j0' }">
			                            		계약직
			                            	</c:when>
		                            		<c:otherwise>
		                            			정규직
		                            		</c:otherwise>
		                            	</c:choose>
		                            </td>
	                                <td class="memNo">${ m.memNo }</td>
		                            <td>${ m.memName }</td>
		                            <td>${ m.deptName }</td>
		                            <td>${ m.jobName }</td>
		                            <td>${ m.birth }</td>
		                            <td>${ m.enrollDate }</td>
		                            <td>${ m.phone }</td>
		                            <td>${ m.email }</td>
		                            <td>
		                            	<c:choose>
			                            	<c:when test="${ m.status == 'Y' }">
			                            		재직중
			                            	</c:when>
			                            	<c:otherwise>
			                            		재직중아님
			                            	</c:otherwise>	                            	
		                            	</c:choose>
		                            </td>
	                            </tr>
                        	</c:forEach>
                        </tbody>
                        </table>
                </form>
                </div>

            <div class="content_2">
                
            </div>
            <br>
            <div class="content_3">
                <p>사원 수 : ${ count } </p>
            </div>
            <br>
            <div class="w3-bar">
            	<c:choose>
	            	<c:when test="${ pi.currentPage eq 1 }">
		                <a href="#" class="w3-button" disabled>&laquo;</a>
	            	</c:when>
	            	<c:otherwise>
	            		<a href="listManage.ma?currentPage=${ pi.currentPage-1 }" class="w3-button">&laquo;</a>
	            	</c:otherwise>
            	</c:choose>
                
                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	                <a href="listManage.ma?currentPage=${ p }" class="w3-button">${ p }</a>
                </c:forEach>
                
                <c:choose>
	                <c:when test="${ pi.currentPage eq pi.maxPage }">
		                <a href="listManage.ma?currentPage=${ pi.currentPage+1 }" class="w3-button">&raquo;</a>
	                </c:when>
	                <c:otherwise>
	                	<a href="#" class="w3-button" disabled>&raquo;</a>
	                </c:otherwise>
                </c:choose>
                
            </div>
            <br><br><br><br>
        </div>
    </div>

    <!-- 삭제 재확인 창(Modal) -->
    <div class="modal" id="myModal">
        <div class="modal-dialog">
        <div class="modal-content">
            <form action="delete.ma" method="GET">
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title">사원 삭제</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body" align="center">
                    사원 정보를 삭제하시겠습니까?<br>
                    (다시 한번 확인 해주세요)<br><br>
                     
                    <input type="hidden" id="delNo" name="delNo">
                    <input type="hidden" id="delId" name="delId">
                    <input type="hidden" id="delPwd" name="delPwd">
                    <input type="password" name="deletePwd" placeholder="관리자 비밀번호를 입력해주세요." style="width: 250px;">
                </div>
        
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary" id="submit">삭제</button>
                    <button type="reset" class="btn btn-danger" data-dismiss="modal">취소</button>
                </div>
            </form>
    
        </div>
        </div>
    </div>
    
    <!-- modal로 체크박스 값 넘겨주기 -->
    <script>
	    $("#delete").on("click",function(){
	    	$("#delNo").val($("input[class=checked]:checked").val());
	    	$("#delId").val($("input[name=delId]").val());
	    	$("#delPwd").val($("input[name=delPwd]").val());
	    });
    </script>
    
    <!-- 사원 리스트 체크박스 조건문 -->
    <script>
        function checked1(){
        	//alert("테스트중"); 	//--> 수정관련 test function 테스트
        	var checkedCount = $("input[class=checked]:checked").length;
        	
       		if($("input[class=checked]").is(":checked") == false){
       			alert("수정을 원하는 사원을 체크해주세요!");
       			
       		}else if(checkedCount > 1){
       			alert("한명의 사원만 선택해주세요!");
       		}else{
       			$("#updateBox").submit();
       		}
        }
    </script>
    
    <script>
    function checked2(){
    	var checkedCount = $("input[class=checked]:checked").length;
    	
   		if($("input[class=checked]").is(":checked") == false){
   			alert("삭제를 원하는 사원을 체크해주세요!");
			$("#updateBox #delete").attr("data-target","#");
   		}else if(checkedCount > 1){
   			alert("한명의 사원만 선택해주세요!");
   			$("#updateBox #delete").attr("data-target","#");
   		}else{
   			$("#updateBox #delete").attr("data-target","#myModal");
   		}
    }
    </script>

  <script>

    $(document).ready(function(){
        $(".profile>a").click(function(){
            var submenu = $(this).next();
            if(submenu.css("display") == 'block'){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
            
        });
    });

  </script>

<script>

    $(document).ready(function(){
        $(".content_1").click(function(){
            var submenu = $(".formtype");
            if(submenu.css("display") == 'none'){
                submenu.show();
            }else{
                submenu.hide();
            }
            
        });
    });

  </script>
</body>
</html>