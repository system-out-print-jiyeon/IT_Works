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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script><link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> 
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
            <h3>글 수정하기</h3> 
                
               <br><br><br><br>
                <div class="postPage">
           <form id="updateForm" method="post" action="update.fb" enctype="multipart/form-data">
             <table id="contentArea" align="center" class="table">
             <input type="hidden" name="fBoardNo" value="${ fb.FBoardNo }">
                <tr>
                    <th>제목</th>
                    <td><input type="text" name="fBoardTitle" value="${ fb.FBoardTitle }"></td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td><input type="text" id="writer" class="form-control" value="${ fb.memName }" name="" readonly></td>
                </tr>
                <tr>
                    <th>작성일</th>
                    <td>${ fb.FCreateDate }</td>
                </tr>
                <tr>
                
                
                    <th>첨부파일</th>
                    <td colspan="3">
                		<input type="file" id="upfile" class="form-control-file border" name="reupFile">
                           	
                        	<c:if test="${ !empty fb.originName }">   	
                        	
	                           	 현재 업로드된 파일 : 
	                            <a href="${ fb.changeName }" download="${ fb.originName }">${ fb.originName }</a>
	                            <input type="hidden" name="originName" value="${ fb.originName }">
	                            <input type="hidden" name="changeName" value="${ fb.changeName }">
	                            
                        	</c:if>
                    </td>
                
                
                </tr>
                <tr>
                    <td colspan="4" style="height:150px" class="SummerNote"><textarea rows="20" id="summernote" class="form-control" required name="fBoardContent" style="resize:none;">${fb.FBoardContent }</textarea></td>
                </tr>
            </table>
            <br>
			<hr>
			<br>

                <div align="center">
                    <button type="button" class="btn btn-secondary" onclick="javascript:history.go(-1);">이전으로</button>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <button type="submit" class="btn btn-primary">수정하기</button>
                </div>
              </form>
                    
                    </div>   
                </div>    
         </div>           
         
         
         
         <script>
                $('#summernote').summernote({                       
                    tabsize: 2,
                    width:900,
                    height: 400,
                    toolbar: [                              
                            ['fontname', ['fontname']],
                            ['fontsize', ['fontsize']],
                            ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
                            ['color', ['forecolor','color']],
                            ['table', ['table']],
                            ['para', ['ul', 'ol', 'paragraph']],
                            ['height', ['height']],
                            ['insert',['picture','link','video']],
                            ['view', ['fullscreen', 'help']]
                        ],
                        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
                        fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
                });                    
            </script>   
</body>
</html>