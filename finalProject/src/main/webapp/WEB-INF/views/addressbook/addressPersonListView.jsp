<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Document</title>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  	    <script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
  	
</head>
<style>

.personAddress{
    width: 1200px; 
    height:1000px; 
    padding-top: 100px;
    margin: auto; 
    box-sizing: border-box;
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
    width: 1500px;
    background:white;
    height: 200px;
    font-size: 25px; 
    text-align: center; 
}

th{
    background: lightgray;
}

td{ 
    padding: 20px;
    text-align: center;
    font-size: 20px;
}

#pagingArea{
    width:fit-content;
    margin:auto;
}

</style>
<body>
	
	<jsp:include page="../common/approvalNavbar.jsp" />
	<div class="ad_wrap">
	<jsp:include page="address_sidebar.jsp" />
	
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
                        
            <button action="" method="post" id="contactDelete" class="btn btn-default btn-sm">
                <span class="glyphicon glyphicon-trash"></span>
                <span class="txt_caution" onclick="btn_del(1);">삭제</span>
            </button>
                      
        </section>
       
        <fieldset>
            <div class="quickAdress">
                <input name="addName" id="quickName" type="text" placeholder="이름(표시명)">
                <input name="addEmail" id="quickEmail" type="text" placeholder="이메일">
                <input name="addPhone" id="quickPhone" type="text" placeholder="전화번호">
                <button type="button" id="quickBtn" class="glyphicon glyphicon-plus btn btn-default btn-sm" onclick="quick();"></button>                             
            </div>
        </fieldset>

            <br>
        
            <div class="tablelist">
                <table border="1" class="tablelist1" id="addressArea">
                    <thead align="center">
                        <tr>
                            <th><input type="checkbox" id="checkedAll" value="${ a.addNo }"></th>
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
                            <td><input name="adNo" type="checkbox" value="${ a.addNo }"></td>
                            <td>${ a.addName }</td>
                            <td>${ a.addPhone }</td>
                            <td>${ a.addDepartment }</td>
                            <td>${ a.addDepartmentPhone }</td>
                            <td>${ a.addSpot }</td>
                            <td>${ a.addEmail }</td>
                            <td>${ a.addCompanyName }</td>
                        </tr>                        
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
	                    		<li class="page-item"><a class="page-link" href="personlist.ad?currentPage=${ pi.currentPage-1 }"><</a></li>
                    		</c:otherwise>
                    	</c:choose>
                                        
                    	<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    		<li class="page-item"><a class="page-link" href="personlist.ad?currentPage=${ p }">${ p }</a></li>
                    	</c:forEach>
                                  
                    	<c:choose>
							<c:when test="${ pi.currentPage eq pi.maxPage }">
	                    		<li class="page-item disabled"><a class="page-link" href="#">></a></li>
	                    </c:when>
	                    <c:otherwise>
	                    	<li class="page-item"><a class="page-link" href="personlist.ad?currentPage=${ pi.currentPage+1 }">></a></li>
                    	</c:otherwise>
                    </c:choose>
                </ul>
            </div>         
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
    <script>
    	function quick(){
    		 			
    			$.ajax({
    				url:"quick.ad",
    				data:{
    					addName:$("#quickName").val(),
    					addEmail:$("#quickEmail").val(),
    					addPhone:$("#quickPhone").val(),
    					addCategory:'person'
    				},
    				success:function(result){
    					
    					if(result == "success"){
    						$(".quickAdress").val("");
    						
    						selectAddressPerList();
    						
    					}
    				},error:function(){
    					console.log("빠른 등록 ajax 통신 실패")
    				}
    			})
    		}
    	
    	
    	function selectAddressPerList(){
    		$.ajax({
    			url:"adpelist.ad",
    			success:function(list){
    				
    				//console.log(list);
    				$("#quickBtn").text(list.length);
    				
    				var value="";
    				for(var i in list){
    					value += "<tr>" +
    								"<td>" + "" + "</td>" +
			                        "<th>" + list[i].addName + "</th>" +
			                        "<td>" + list[i].addPhone + "</td>" +
			                        "<td>" + "" + "</td>" +
			                        "<td>" + "" + "</td>" +
			                        "<td>" + "" + "</td>" +
			                        "<td>" + list[i].addEmail + "</td>" +
			                        "<td>" + "" + "</td>" +
			                     "</tr>";
    				}
    				
    				$("#addressArea tbody").html(value);
    				
    			},error:function(){
    				console.log("댓글 작성용 ajax 통신 실패");
    			}
    		})
    		
    	}
    </script>
    
    <script>
        function btn_del(num){ 
        	var url = "";
            if(num == 1){
				url = "delete.ad";           	
            }
            $("#contactDelete").attr("action", url).submit();
        }  
    </script>
    
</body>
</html>