<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Document</title>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<style>

.personAddress{
    width: 100%; 
    height:100%; 
    margin: 50px
}

.tool_bar{
    width: 100%; 
    height: 40px; 
    margin-top: 100px; 
    position: relative;
}

.quickAdress{
    position: relative;
    display: none;
}

table{
    width: 100%;
    background:white;
    height: 30%;
}

th{
    background: lightgray;
    text-align: center;
    padding: 10px;
}

td{ 
    padding: 20px;
    text-align: center;
}

#pagingArea{
    width:fit-content;
    margin:auto;
}

</style>
<body>
	<div class="personAddress">
        <h1>전체 주소록<small>(개인 주소록)</small></h1> 
        <section class="tool_bar">
                    
                        
            <button id="quickregist" class="btn btn-default btn-sm">
                <span class="glyphicon glyphicon-plus"></span>
                <span class="txt">빠른등록</span>
            </button>
                        
                        
            <button id="contactMail" class="btn btn-default btn-sm">
                <span class="glyphicon glyphicon-envelope"></span>
                <span class="txt">메일발송</span>
            </button>
                        
            <button id="contactDelete" class="btn btn-default btn-sm">
                <span class="glyphicon glyphicon-trash"></span>
                <span class="txt_caution" onclick="postFormSubmit(2)">삭제</span>
            </button>
                      
        </section>

        <form id="post" class="speed_regist">
        <fieldset>
            <div class="quickAdress">
                <input id="quickName" type="text" placeholder="이름(표시명)">
                <input id="quickEmail" type="text" placeholder="이메일">
                <input id="quickPhone" type="text" placeholder="전화번호">
                <button type="button" id="quickBtn" class="glyphicon glyphicon-plus btn btn-default btn-sm" onclick="postFormSubmit(1)"></button>                             
            </div>
        </fieldset>
        </form>
            <br>
        
            <div class="tablelist">
                <table border="1" class="tablelist1">
                    <thead>
                        <tr>
                            <th><input type="checkbox" id="checkedAll" value="${ a.addNo }">전체선택</th>
                            <th>이름</th>
                            <th>전화번호</th>
                            <th>부서</th>
                            <th>부서 전화번호</th>
                            <th>직위</th>
                            <th>이메일</th>
                            <th>회사명</th>
                        </tr>
                    </thead>
                    <tbody align="center">
                    	<c:forEach var="a" items="${ list }">
                        <tr>
                            <td><input name="adNo" type="checkbox" value="${a.addNo }"></td>
                            <td>${ a.addName }</td>
                            <td>${ a.addPhone }</td>
                            <td>${ a.addDepartment }</td>
                            <td>${ a.addDepartmentPhone }</td>
                            <td>${ a.addSpot }</td>
                            <td>${ a.addEmail }</td>
                            <td>${ a.addCompanyName }</td>
                        </tr>
                        <!--
                        <tr>
                            <td><input name="adNo" type="checkbox" value="10"></td>
                            <td>김OO</td>
                            <td>010-1111-2222</td>
                            <td>OO팀</td>
                            <td>070-1111-1111</td>
                            <td>사원</td>
                            <td>abc@naver.com</td>
                            <td>IT'S WORKS COMPANY</td>
                        </tr>
                        -->
                        </c:forEach>                       
                    </tbody>
                </table>
            
                <br><br><br><br>
                <div id="pagingArea">
                	<ul class="pagination">             
                		<c:choose>
                			<c:when test="${ pi.currentPage eq 1 }">
	                    		<li class="page-item disabled"><a class="page-link" href="#"><</a></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="page-item"><a class="page-link" href="Personlist.ad?currentPage=${ pi.currentPage-1 }"><</a></li>
                    		</c:otherwise>
                    	</c:choose>
                                        
                    	<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    		<li class="page-item"><a class="page-link" href="Personlist.ad?currentPage=${ p }">${ p }</a></li>
                    	</c:forEach>
                                  
                    	<c:choose>
							<c:when test="${ pi.currentPage eq pi.maxPage }">
	                    		<li class="page-item disabled"><a class="page-link" href="#">></a></li>
	                    </c:when>
	                    <c:otherwise>
	                    	<li class="page-item"><a class="page-link" href="Personlist.ad?currentPage=${ pi.currentPage+1 }">></a></li>
                    	</c:otherwise>
                    </c:choose>
                </ul>
            </div>         
            </div>
    </div>
    <script>
        $(document).ready(function(){

            $("#quickregist").click(function(){
                $(".quickAdress").slideToggle();
            })
            //최상단 체크박스 클릭
            $("#checkedAll").click(function(){
                //클릭되었으면
                if($("#checkedAll").prop("checked")){
                    //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
                    $("input[name=adNo]").prop("checked",true);
                    //클릭이 안되있으면
                }else{
                    //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
                    $("input[name=adNo]").prop("checked",false);
                }
            });
        });
    </script>
    
</body>
</html>