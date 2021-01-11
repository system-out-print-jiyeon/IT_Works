<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
   <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> 
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

</head>
<style>
.wrap{
	  width: 100%; 
      height: 100%;
      display: flex;
     
    }
.fullBoard{
    width: 1100px; 
    height:100%;
    margin-top:70px;
	margin-left:330px;
	margin-bottom:100px;
	}
.fullBoard h3{
	padding-top:70px;
	font-weight: 900;
}

.title > .info {
    display: inline-block;
    margin: 3px;
    line-height: 16px;
}

.postPage{
	 width: 100%; 
    height:100%;
}
th{
    background: lightgray;
    text-align: center;
    width:100px;

}

.replyTable{
	width:
}
.title{
    width: 95%;
    float: left;
}



.sidebar{
	margin-top:80px;
}



</style>

<body>

 	<jsp:include page="../common/navbar.jsp"/>

	<jsp:include page="board_sidebar.jsp"/>


	<div class="wrap">

        <div class="fullBoard">
            <h3>&nbsp;&nbsp;자유 게시판</h3> 
                
               <br><br><br><br>
                <div class="postPage">
             <table id="contentArea" align="center" class="table">
                <tr>
                    <th>제목</th>
                    <td>${fb.FBoardTitle }</td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>${ fb.memName }</td>
                </tr>
                <tr>
                    <th>작성일</th>
                    <td>${ fb.FCreateDate }</td>
                </tr>
                <tr>
                
                
                    <th>첨부파일</th>
                    <td colspan="3">
                		<c:choose>
                			<c:when test="${ empty fb.originName }">
                				첨부파일이 없습니다.
                			</c:when>
                			<c:otherwise>
                       			<a href="${ fb.changeName }" download="${ fb.originName }">${ fb.originName }</a>
                        	</c:otherwise>
               			</c:choose>
                    </td>
                
                
                </tr>
                <tr>
                    <td colspan="4" style="height:150px">${ fb.FBoardContent }</td>
                </tr>
            </table>
            <br>
			<hr>
			<c:if test="${ loginUser.memNo eq fb.FBoardWriter }">
	            <div align="center">
	                <a style="color:white;" class="btn btn-secondary" onclick="postFormSubmit(2)">삭제하기</a>
	                &nbsp;&nbsp;&nbsp;&nbsp;
	                <a style="color:white;" class="btn btn-primary" onclick="postFormSubmit(1)">수정하기</a>
	            </div><br><br>
	        
			</c:if>
			<script>
				function postFormSubmit(num){
					var url = "";
					if(num == 1){ // 수정
						url = "updateForm.fb";
					}else if(num == 2){ // 삭제
						url = "delete.fb";
					}
					
					$("#postForm").attr("action", url).submit();
					
				}
			</script>
			<form action="" method="POST" id="postForm">
				<input type="hidden" name="fbno" value="${ fb.FBoardNo }">
				<input type="hidden" name="fileName" value="${ fb.changeName }">
			</form>
              
              
              
             <table id="replyArea" class="table" align="center">
                <thead>
                    <tr>
                        <th colspan="2">
                            <textarea class="form-control" id="content" cols="55" rows="2" style="resize:none; width:100%"></textarea>
                        </th>
                        <th style="vertical-align: middle"><button class="btn btn-secondary" onclick="addReply();">등록하기</button></th>
                    </tr>
                    <tr>
                       <td colspan="3">댓글 (<span id="rcount"></span>) </td> 
                    </tr>
                </thead>
                <tbody>
                    
                </tbody>
            </table>
           
           
           </div>   
       </div>    
       
	<script>
		$(function(){
			selectReplyList();
		})
		
		function addReply(){
			if($("#content").val().trim().length != 0){
				$.ajax({
					url:"rinsert.fb",
					data:{
						comContent:$("#content").val(),
						refBno:${fb.FBoardNo}, 
						comWriter:"${loginUser.memNo}" 
					},
					success:function(result){
						
						if(result == "success"){
							$("#content").val("");
							selectReplyList();
						}
						
					},error:function(){
						console.log("댓글 작성용 ajax 통신 실패!");
					}
				})
			}
		}
		
		function selectReplyList(){
			$.ajax({
				url:"rlist.fb",
				data:{fbno:${fb.FBoardNo}},
				success:function(list){
					$("#rcount").text(list.length);
					var value ="";
					
					for(var i in list){
						value += "<tr>" + 
									 "<th>" + list[i].memName + "</th>" + 
									 "<td>" + list[i].comContent + "</td>" + 
									 "<td>" + list[i].createDate + "</td>" + 
								 "</tr>";
					}
					$("#replyArea tbody").html(value);
					
				}, error:function(){
					console.log("댓글 작성용 ajax 통신 실패");
				}
			})
		}
	
	</script>

       
       
</div>           
</body>
</html>