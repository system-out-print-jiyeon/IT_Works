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

</head>
<style>

.fullBoard{
    width: 100%; 
    height:100%;
    margin: 40px;
    margin-top: 70px;}

.tool_bar1{
    width: 100%;
    height: 40px; margin-top: 140px; position: relative;}

.title > .info {
    display: inline-block;
    margin: 3px;
    line-height: 16px;
}

th{
    background: lightgray;
    text-align: center;

}
td{
    font-size: 18px;
    text-align: center;
    padding : 15px 8px 8px 8px!important;
}

.title{
    width: 95%;
    float: left;
}
.likePage{
    float: right;
    font-size: 30px;
    
}
#heartbeat{
    color: pink;
}

#boardTable>tbody>tr:hover{cursor:pointer;}

</style>
<body>
	<body>
        <div class="fullBoard">
            <h1>전체 게시판</h1> 
                <section class="tool_bar1">                        
                    <button id="New writing1" class="btn btn-default btn-sm">
                        <i class="fas fa-pencil-alt"></i>
                        <span class="txt">새글쓰기</span>
                    </button>
                                
                    <button id="Copy2" class="btn btn-default btn-sm">
                        <i class="fas fa-copy"></i>
                        <span class="txt">복사</span>
                    </button>
                                                                                               
                    <button id="contactDelete3" class="btn btn-default btn-sm">
                        <i class="fas fa-trash"></i>
                        <span class="txt_caution">삭제</span>
                    </button>                               
                </section>
                <hr>
                    
                <div class="postPage">
                    <div class="title">
                        <h2>게시글</h2>
                        <div class="info">
                            <a class="name">OOO 사원</a>
                                <br>
                            <span class="date">2020-12-15</span>
                        </div>
                        <br><br><br>

                    </div>
                    <div class="likePage">
                        <a class="btn_heart">
                            <span id="heartbeat" class="wrap_heart" title="좋아요 클릭">
                                <span class="likecount">0</span>
                                <div class="fabutton" style="float: right;">
                                    <i class="fas fa-heart"></i>
                                </div>
                            </span>
                        </a>
                    </div>                      
                    <p><h3 style="clear: both;">내는 것이 따뜻한 봄바람이다 인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면</h3></p>
                    <br><br><br><br><br><br>
                    <hr>
                    <span>첨부파일</span>                           
                    <span><a href="" download="">파일.JPG</a></span>
                    <hr>
                    <div class="commentpage">                           
                        <span><input type="text" name="comment" style="width: 1400px; height: 30px;"></span>
                        <span><button class="btn btn-default btn-sm">댓글 작성</button></span>                            
                    </div>                        
                    <hr>
                    <br><br>
                    <table id="boardTable" class="table">
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>작성일</th>
                                <th>조회</th>
                                <th>좋아요</th>                               
                            </tr>
                        </thead>
                        <tbody align="center">
                            <tr>
                                <td>1</td>
                                <td>안녕하세요.</td>
                                <td>김OO</td>
                                <td>2020/12/14</td>
                                <td>0</td>
                                <td>0</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>안녕하세요.</td>
                                <td>김OO</td>
                                <td>2020/12/14</td>
                                <td>0</td>
                                <td>0</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>안녕하세요.</td>
                                <td>김OO</td>
                                <td>2020/12/14</td>
                                <td>0</td>
                                <td>0</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>안녕하세요.</td>
                                <td>김OO</td>
                                <td>2020/12/14</td>
                                <td>0</td>
                                <td>0</td>
                            </tr>
                    </table>
                        <script>
                            var count =0;
                            $("#heartbeat").click(function(){
                            count++;
                            $('.likecount').text(count);
                            $(".fas.fa-heart").remove();
                            $(".fabutton").html('<i class="fas fa-heart"></i>'); 
                                                                               
                        })
                        </script>
                    </div>   
                </div>        
</body>
</html>