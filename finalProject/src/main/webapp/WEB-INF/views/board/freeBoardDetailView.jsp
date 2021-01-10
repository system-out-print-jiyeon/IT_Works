<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

</head>
<style>
.wrap{
	  width: 100%; 
      height: 100%;
      display: flex;
     
    }
.fullBoard{
    width: 1000px; 
    height:100%;
    margin-top:100px;
	margin-left:350px;
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

*{border:1px solid red;}

</style>

<body>

 	<jsp:include page="../common/navbar.jsp"/>

	<jsp:include page="board_sidebar.jsp"/>


	<div class="wrap">

        <div class="fullBoard">
            <h3>전체 게시판</h3> 
                
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

			<c:if test="${ loginUser.memNo eq fb.FBoardWriter }">
	            <div align="center">
	                <!-- 수정하기, 삭제하기 버튼은 이글이 본인글일 경우만 보여져야됨 -->
	                <a class="btn btn-primary" onclick="postFormSubmit(1)">수정하기</a>
	                <a class="btn btn-danger" onclick="postFormSubmit(2)">삭제하기</a>
	            </div><br><br>
			</c:if>
			<script>
				function postFormSubmit(num){
					var url = "";
					if(num == 1){ // 수정
						url = "updateForm.bo";
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
                    <hr>
                    <div class="commentpage">                           
                        <span><input type="text" name="comment" style="width: 900px; height: 30px;"></span>
                        <span><button class="btn btn-dark">댓글 작성</button></span>                            
                    </div>                        
                    <hr>
                    <br><br>
                    <table id="replyTable" class="table">
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>작성일</th>                              
                            </tr>
                        </thead>
                        <tbody align="center">
                            <tr>
                                <td>1</td>
                                <td>안녕하세요.</td>
                                <td>김OO</td>
                                <td>2020/12/14</td>
                            </tr>
                    </table>
                    </div>   
                </div>    
                
                
         </div>           
</body>
</html>