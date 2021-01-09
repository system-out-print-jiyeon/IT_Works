<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/v4-shims.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
  
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
<style>
.wrap{width: 100%; 
      height: 100%;
      display: flex;
    }


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

/* 사이드바 */
.sidebar{    
    justify-content: space-between;
    padding: 8px 24px;
    width: 300px;
    height: 1200px;
    background-color: #e7e1e1;
}

.sidebar_menu{
    align-items: center;
    list-style: none;
}  

.sidebar_menu a{
    display: block;
    text-decoration: none;
    line-height: 60px;
    color: rgb(107, 102, 102);
    font-size: 25px;
    padding-left: 20px;
    box-sizing: border-box;
}

.sidebar_menu a:hover{
    color: rgb(39, 37, 37);
}

.menu1 li{ 
    padding-left: 40px;
    list-style: none; 
}

.profile:hover{cursor: pointer;}
.profile .menu1{display: none;}

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

.filebox label {
  display: inline-block;
  padding: .2em .75em;
  color: #fff;
  font-size: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #5c84b8;
  cursor: pointer;
  border: 1px solid #4c5bae;
  border-radius: .25em;
  -webkit-transition: background-color 0.2s;
  transition: background-color 0.2s;
}

.filebox label:hover {
  background-color: #5664e4;
}

.filebox label:active {
  background-color: #2295e2;
}

.filebox input[type="file"] {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  border: 0;
}

.button_2{margin-top: 70px;}
.SummerNote{
    height: 400px;
}
</style>
<body>
	<div class="boardEnrollForm">
            <h1>글쓰기</h1>                
            <table id="enrollForm">
                <tr>
                    <th>게시판</th>   
                    <td><h2>자유게시판</h2></td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td><input type="text" name="title" style="width: 800px;"></td>
                </tr>
                <tr>
                    <th>비공개 설정</th>
                    <td>
                        <input type="radio" id="open" name="disclosure" value="공개">
                            <label for="open">공개</label> &nbsp;
                        <input type="radio" id="private" name="disclosure" value="비공개">
                            <label for="private">비공개</label>
                    </td> 
                </tr>
                <tr>
                    <th><label for="upfile">첨부파일</label></th>
                    <td>
                    	<input type="file" id="upfile" name="">
                    </td>
                </tr>
            </table>
                <div class="SummerNote">
                    <div id="summernote"></div>
                </div>
                    
                
            <div class="boardEnrollForm2">
                <table id="enrollForm2">
                    <tr>
                        <th>댓글</th>
                        <td>
                            <input type="radio" id="allowed" name="allow" value="허용">
                                <label for="allowed">허용</label> &nbsp;
                            <input type="radio" id="notAllowed" name="allow" value="비허용">
                                <label for="notAllowed">비허용</label>
                        </td> 
                    </tr>

                    <tr>
                        <th>공지로 등록</th>
                        <td>
                            <input type="checkbox" id="Notice registration" name="noticeboard" value="공지로 등록">
                                <label for="Notice registration">공지로 등록</label> &nbsp;
                        </td>
                    </tr>
                </table>
            </div>
            
            <div class="button_2" align="right">
                <button type="button" class="btn btn btn-lg">작성 취소</button>
                <button type="button" class="btn btn-success btn btn-primary btn-lg">임시 저장</button>
                <button type="button" class="btn btn-info btn btn-primary btn-lg">등록</button>
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