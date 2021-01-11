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
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    	
</head>
<style>

.personAddress{
    width: 85%; 
    height:800px; 
    padding-top: 100px;
    margin: auto; 
    box-sizing: border-box;
    margin-left:400px;
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
	width: 85%;
    background:white;
    height: 100px;
    font-size: 27px; 
}

.tablelist1>thead>tr>th {
    background: lightgray;
    text-align: center;
}

.tablelist1>tbody>tr>td{ 
    padding: 10px;
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

	<jsp:include page="address_sidebar.jsp" />
	
	<div class="personAddress">
        <h1>전체 주소록<small>(개인 주소록)</small></h1> 
        <section class="tool_bar">
                    
                        
            <button id="quickregist" class="btn btn-default btn-sm">
                <span class="glyphicon glyphicon-plus"></span>
                <span class="txt">빠른등록</span>
            </button>                                           
                        
            <button type="button" id="contactDelete" class="btn btn-default btn-sm" onclick="deleteAdd();">
                <span class="glyphicon glyphicon-trash"></span>
                <span class="txt_caution">삭제</span>
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
                    <thead>
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
                    	<c:forEach var="a" items="${ peList }">
                        <tr>
                            <td><input name="adNo" type="checkbox" value="${ a.addNo }" ></td>
                            <td>${ a.addName }</td>
                            <td>${ a.addPhone }</td>
                            <td>${ a.departmentName }팀</td>
                            <td>${ a.addDepartmentPhone }</td>
                            <td>${ a.jobgradeName }</td>
                            <td>${ a.addEmail }</td>
                            <td>${ a.addCompanyName }</td>
                        </tr>                        
                        </c:forEach>                       
                    </tbody>
                </table>
            </div>
            
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
	    function deleteAdd(){
	    	var answer = confirm('해당 주소록을 정말 삭제하시겠습니까?');
	    	if(answer == true){
	    		var count = $("tbody :checked").length;
	    		if(count > 1){
	    			alert('항목 하나만 선택해주세요.');
	    			$(":checkbox").removeAttr('checked');
	    		}else{
	    			deleteAddress();
	    		}
	    	} 
	    }
	    function deleteAddress(){
	    	$("tbody :checkbox").each(function(){
       			if($(this).is(":checked") == true){
		    		var adno = $(this).val();
       				 $.ajax({
       					url: "delete.ad",
       					type: "post",
       					data: {addNo : adno},
       					success:function(result){
       						if(result>0){
       							alert('성공적으로 삭제되었습니다.');
       							selectAddressPerList();
       						}else{
       							alert('삭제에 실패했습니다.');
       						}
       					},error:function(){
       						console.log('통신실패');
       					}
       				}) 
       			}
       		})
	    }
    	function quick(){
    		 			
    			$.ajax({
    				url:"quick.ad",
    				data:{
    					addName:$("#quickName").val(),
    					addEmail:$("#quickEmail").val(),
    					addPhone:$("#quickPhone").val(),
    					addWriter:"${ loginUser.memNo }",
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
    					if(list[i].addDepartment === undefined){
    					      list[i].departmentName = '';
  	                      	  list[i].addDepartmentPhone = '';
  	                      	  list[i].jobgradeName = '';
  	                      	  list[i].addCompanyName = '';
 	                       }
  	                   value += "<tr>" +
  	                            "<td>" + list[i].addNo + "</td>" +
  	                                 "<td>" + list[i].addName + "</td>" +
  	                                 "<td>" + list[i].addPhone + "</td>" +
  	                                 "<td>" + list[i].departmentName + "</td>" +
  	                                 "<td>" + list[i].addDepartmentPhone + "</td>" +
  	                                 "<td>" + list[i].jobgradeName + "</td>" +
  	                                 "<td>" + list[i].addEmail + "</td>" +
  	                                 "<td>" + list[i].addCompanyName + "</td>" +
  	                              "</tr>";
  	                }

    				
    				$("#addressArea tbody").html(value);
    				
    			},error:function(){
    				console.log("댓글 작성용 ajax 통신 실패");
    			}
    		})
    		
    	}
    </script>
    
    
</body>
</html>