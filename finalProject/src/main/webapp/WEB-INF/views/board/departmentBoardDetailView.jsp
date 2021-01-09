<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

</head>
<style>
.departwrite{
    width: 100%; 
    height:1000px;
    margin: 40px;
    margin-top: 70px;}

.likePage{
    float: right;
    font-size: 30px;
    
}
#heartbeat{
    color: pink;
}

#heartbeat1{
    color: pink;
}

.commentpage{
        width: 50px;
        height: 50px;
        background-color:darkgray;
        border-radius: 50px;
        margin: 2px;
        
}
.Names{
    padding: 7px;
    text-align: center;
    height: 20px;
}

.date{
    padding-left: 60px;
}
</style>
<body>
	<body>
        

                <div class="departwrite">
                    <h1>전체 게시판</h1> 
                    <hr>    
                    <div class="postPage">
                        <div class="title">
                            <input type="text" name="departmentName" id="" style="height: 150px; width:350px;">
                            <button type="button" class="btn btn-success">클릭</button>                            
                        </div>
                        
                        <hr>
                    <div class="contentlist">
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
                        <div class="commentpage">
                                                       
                                <div class="Names">OOO사원</div>
                                <span class="date">2020/12/08(화)</span>                               
                            <br><br><br><br>
                        </div>
                    </div>                                              
                    <br><br>
                    <span>
                        <div class="writeAcomment">
                            <span><input type="text" name="comment" style="width: 1000px; height: 30px;"></span>
                            <span><button class="btn btn-default btn-sm">댓글 작성</button></span>    
                        </div>
                    </span>                             

                        <hr>
                    <div class="contentlist1">
                        <div class="likePage">
                            <a class="btn_heart">
                                <span id="heartbeat1" class="wrap_heart" title="좋아요 클릭">
                                    <span class="likecount1">0</span>
                                    <div class="fabutton1" style="float: right;">
                                        <i class="fas fa-heart"></i>
                                    </div>
                                </span>
                            </a>
                        </div>                      
                        <div class="commentpage">
                            <div class="Names">OOO사원</div>
                            
                        </div>
                        <div class="writepage">
                            <span><p>환영합니다. 여기는 부서게시판입니다.</p></span>
                        </div>
                        
                                                  
                    </div>                          
                    <span>
                        <div class="writeAcomment">
                            <span><input type="text" name="comment" style="width: 1000px; height: 30px;"></span>
                            <span><button class="btn btn-default btn-sm">댓글 작성</button></span>    
                        </div>
                    </span>                            
                        
                        <script>
                            var count =0;
                            $("#heartbeat").click(function(){
                                count++;
                                $('.likecount').text(count);
                                $(".fas.fa-heart").remove();
                                $(".fabutton").html('<i class="fas fa-heart"></i>'); 
                                
                            })

                            var count =0;
                            $("#heartbeat1").click(function(){
                                count++;
                                $('.likecount1').text(count);
                                $(".fas.fa-heart").remove();
                                $(".fabutton1").html('<i class="fas fa-heart"></i>'); 
                                
                            })
                            </script>
                    </div> 
                      
                </div>
</body>
</html>