<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> 
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

</head>
<style>
.boardEnrollForm{
    width: 100%;
    padding: 20px;
    margin: 20px;
    height: 100%;
}

#enrollForm{
    width: 1000px; 
    height: 300px; 
    font-size: 18px;
}
#enrollForm2{
    width: 300px;
    height: 100px; 
    font-size: 18px; 
    margin-top: 140px;
}

.button_2{margin-top: 70px;}
.SummerNote{
    height: 400px;
}
.boardEnrollForm h2, .boardEnrollForm h4{
	font-weight:700;
}
 
 

</style>
<body>
	<div class="contentArea">
		<div class="boardEnrollForm">
		
	            <h2>글쓰기</h2>                
	            <table id="enrollForm">
	                <tr>
	                    <th>게시판</th>   
	                    <td><h4>자유게시판</h4></td>
	                </tr>
	               <form method="post" action="insert.fb" enctype="multipart/form-data">
	               <input type="hidden" name="fBoardWriter" value="${loginUser.memNo }">
	               
		                <tr>
		                    <th>제목</th>
		                    <td><input type="text" name="fBoardTitle" style="width: 800px;"></td>
		                </tr>
		                
		                <tr>                   
		                    <th><label for="upfile">첨부파일</label></th>
		                    <td><input type="file" id="upfile" name="upfile"></td>                   
		                </tr>
		            </table>
		                <div class="SummerNote">
		                    <textarea id="summernote" name="fBoardContent" required></textarea>
		                </div>
		                    
		                
		            <div class="boardEnrollForm2">
		                <table id="enrollForm2">
		                   
		                    <tr>
		                        <th>공지로 등록</th>
		                        <td>
		                            <input type="checkbox" id="boardDivision" name="boardDivision" value="N">
		                                <label for="Notice registration">공지로 등록</label> &nbsp;
		                        </td>
		                    </tr>
		                </table>
		            </div>
		            
		            <div class="button_2" align="center">
		                <button type="reset" class="btn btn-secondary">작성취소</button>
		                &nbsp;&nbsp;&nbsp;
		                <button type="submit" class="btn btn-primary">&nbsp;등록&nbsp;</button>
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