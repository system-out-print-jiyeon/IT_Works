<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="../common/navbar.css"> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Amiri:wght@700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>
    .wrap{
        padding-top: 50px;
        margin:auto; 
        width: 800px;
        height: 800px;
    }
    #listwrap{width: 90%; height: 80%; margin: auto; margin-top: 50px; }
    .box{height:8%; padding-top: 5px;}
    .box>div{float: left; height: 100%;}
    #box1>div{float: left; margin-right: 7px;}
    .insert{width: 80%;}
    .select{width: 20%;}
    .search{width: 10%;}
    #box2{height:60%;}
    .tablewrap>table {margin-top: 15px; width: 100%;}
    .tablewrap>table tbody>tr{text-align: center; font-size: 11px; height: 28px;}
    .tablewrap>table th{height: 35px; font-size: 13px; font-weight: 700; background-color: rgb(240, 240, 240); text-align: center;}
    .tablewrap>table tbody>tr:hover{cursor: pointer; background-color: rgb(240, 240, 240);}
    #box3{height:20%;}
    #box4{width: 50%; height: 12%; margin:auto;}
    #pagingArea{width: fit-content; margin: auto;}
    .custom-select:hover{cursor: pointer;}
</style>
</head>
<body>

	
	<jsp:include page="support_sidebar.jsp"/>

	
	<%-- 알림메시지출력 --%>
	<c:if test="${ !empty alertMsg }">
		<script type="text/javascript">
			alert("${ alertMsg }");
		</script>
		<c:remove var="alertMsg" scope="request"/>
	</c:if>
	
	<div class="wrap">
        <h4>업무협업</h4>
        <div id="listwrap">
            <div class="box">
                <div class="insert">
                    <button type="button" class="btn btn-info" onclick="location.href='insertForm.sp'">업무헙업 요청</button>
	                <a class="btn btn-link" id="myBtn" href="mysupportList.sp">내 업무협업</a>
                </div>
                <div class="select">
                    <select class="custom-select" id="category" name="category">
                        <option selected hidden>분류</option>
                        <option value="클레임">클레임</option>
                        <option value="업무요청">업무요청</option>
                        <option value="회사내지침">회사내지침</option>
                        <option value="회의록">회의록</option>
                    </select>
                </div>
            </div>
            <script type="text/javascript">
            	$(function(){
            		$("#category").change(function(){
	            		$.ajax({
	            			url:"ajaxCategorySort.go",
	            			type:"post",
	            			data:{category: $(this).val(), deptCode: "${loginUser.deptCode}"},
	            			success:function(list){
	            				var data = "";
	            				for(var i in list){
	            					data += "<tr>" + 
					                            "<td>"+ list[i].supportNo+"</td>" +
					                            "<td>"+ list[i].category+"</td>" +
					                            "<td>${loginUser.deptName}팀</td>" +
					                            "<td>"+ list[i].supportTitle+"</td>" +
					                            "<td>"+ list[i].createDate+"</td>" +
					                            "<td>"+list[i].mem.deptName+"팀</td>" +
		                        			"</tr>"
	            				}
	            				$(".tablewrap>table tbody").html(data);
	            			},error: function(){
	            				console.log("실패");
	            			}
	            		}) 
            		})
            	})
            </script>
            <div id="box2" class="tablewrap" align="center">
                <table border="1" bordercolor="lightgray">
                    <thead>
                        <tr>
                            <th width="30px">No</th>
                            <th width="100px">분류</th>
                            <th width="100px">수신부서</th>
                            <th width="400px">제목</th>
                            <th width="100px">작성일</th>
                            <th width="100px">발신부서</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:if test="${!empty list}">
	                    	<c:forEach var="li" items="${list}">
		                        <tr>
		                            <td>${li.supportNo}</td>
		                            <td>${li.category}</td>
			                        <td>${loginUser.deptName}팀</td>
		                            <td>${li.supportTitle }</td>
		                            <td>${li.createDate}</td>
		                            <td>${li.mem.deptName}팀</td>
		                        </tr>
	                    	</c:forEach>
                    	</c:if>
                    </tbody>
                </table>
                
            </div>
            <script type="text/javascript">
            	$(function(){
            		$(document).on('click', '.tablewrap>table tbody>tr', function(){
            			location.href = 'detail.sp?sno='+ $(this).children().eq(0).text();
            		})
            	})
            
            </script>
            <div id="box3">
                <form action="search.sp" method="post">
                    <div id="box1">
                        <div class="select">
                            <select class="custom-select" name="condition">
                                <option value="support_title" selected>제목</option>
                                <option value="support_content">내용</option>
                                <option value="dept_name">발신부서</option>
                            </select>
                        </div>
                        <div class="insert" style="width: 68%;">
                            <input type="text" class="form-control" name="keyword">
                            <input type="hidden" name="deptCode" value="${loginUser.deptCode}">
                        </div>
                        <button type="submit" class="search btn btn-secondary">검색</button>
                    </div>
                </form>
            </div>
            <div id="box4">
                <div id="pagingArea">
                    <ul class="pagination">
                    <c:choose>
                    	<c:when test="${pi.currentPage eq 1}">
                    	    <li class="page-item disabled"><a class="page-link" href="#"><</a></li>
                    	</c:when>
                    	<c:otherwise>
                    	    <li class="page-item"><a class="page-link" href="list.sp?currentPage=${pi.currentPage-1}"><</a></li>
                    	</c:otherwise>
                    </c:choose>
                    <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
                        <li class="page-item"><a class="page-link" href="list.sp?currentPage=${p}">${p}</a></li>
                    </c:forEach>
                    <c:choose>
                    	<c:when test="${pi.currentPage eq pi.maxPage}">
	                        <li class="page-item disabled"><a class="page-link" href="#">></a></li>
                    	</c:when>
                    	<c:otherwise>
	                        <li class="page-item"><a class="page-link" href="list.sp?currentPage=${pi.currentPage+1}">></a></li>
                    	</c:otherwise>
                    </c:choose>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</body>
</html>