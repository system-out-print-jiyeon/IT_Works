<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <!-- 서머노트 (부트스트랩 필요) -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote.min.js"></script>
    <script src="https://github.com/summernote/summernote/tree/master/lang/summernote-ko-KR.js"></script>

    <!-- 아이콘 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
*{ 
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
.em_wrap{
    width: 100%; 
    height: 100%;
    display: flex;
}
/* 메뉴바 */
.em_menubar{
    width:300px;
    height:0%;
    background:linear-gradient(  rgb(245, 236, 236),rgb(240, 231, 231), rgb(255, 255, 255));
    position: fixed;

    animation-name:key1;
    animation-duration:2s;
    animation-delay:0.5s;
    animation-fill-mode:both;
}
@keyframes key1{
    to{
        height:100%;
    }
}

.em_menubar>button{
    font-size:20px;
    margin-top:50px;
    width:200px;
    height:100px;
    border-radius:10px;
    border:none;
    background:rgb(133, 182, 255); 
    color:white;
}
.em_menubar>button:hover{
    cursor:pointer;
    animation-name:key2;
    animation-duration:0.5s;
    animation-fill-mode:both;
    animation-direction: alternate;
}
@keyframes key2{
    to{
        background:rgb(80, 150, 255); 
        padding-right:10px;
    }
}
.em_menubar_list{
    margin:50px 0px 0px 0px;
}
.em_menubar_list li{
    list-style:none;
}
.em_menubar_list>span{
    font-size:25px;
    font-weight:900;
    color:rgb(85, 84, 84);
}

.em_menubar_list a{
    color:gray;
    font-size:20px;
}
.em_menubar_list a:hover{
    text-decoration:none;
    animation-name:key3;
    animation-duration:0.3s;
    animation-fill-mode:both;
    animation-direction: alternate;
}
@keyframes key3{
    100%{   
        color:rgb(80, 150, 255); 
        padding-right:5px;
    }
}
/*내용*/
.em_content{
    margin-top:100px;
    width:100%;
    margin-left:300px;
}
.em_content_center{
    padding:20px;
}
.em_content_center tbody>tr{
    font-size:17px;
    color:gray;
}
.em_content_center button{
    color:rgb(80, 150, 255);
    font-size:20px;
    text-decoration:none;
    border:none;
    background:none;
    margin-right:20px;
}
input[type="submit"]{
    font-size:20px;
    width:150px;
    height:50px;
    border-radius:10px;
    border:none;
    background:rgb(133, 182, 255); 
    color:white;
}
input[type="submit"]:hover{
    cursor:pointer;
    animation-name:key6;
    animation-duration:0.5s;
    animation-fill-mode:both;
    animation-direction: alternate;
}
@keyframes key6{
    to{
        background:rgb(80, 150, 255); 
    }
}
</style>
</head>
<body>
	<div class="em_wrap">

        <!-- 상단바 include -->

        <div class="em_menubar" align="center">
            <button>메일쓰기&nbsp;&nbsp;&nbsp;<i class="fa fa-angle-double-right"></i></button>
            <div class="em_menubar_list">
                <span>메일함</span>
                <ul>
                    <li><a href=""><i class="fa fa-envelope"></i> 전체 메일</a></li>
                    <li><a href=""><i class="fa fa-paper-plane"></i> 보낸 메일</a></li>
                    <li><a href=""><i class="fa fa-reply"></i>받은 메일</a></li>
                    <li><a href=""><i class="fa fa-star"></i>중요메일</a></li>
                </ul>
            </div>
            <div class="em_menubar_list">
                <span>휴지통</span>
                <ul>
                    <li><a href="#"><i class="fa fa-trash"></i></i>휴지통</a></li>
                </ul>
            </div>
        </div>

        <div class="em_content">
            <div clss="em_content_top">

            </div>
            <div class="em_content_center">
                <form name="form_mail" method="post">
                    <div class="submit_btn">
                        <span class="update"><button type="submit"  onclick='btn_click("reply");'>답장</button></span>
                        <span class="update"><button type="submit"  onclick='btn_click("forward");'>전달</button></span>                            
                        <span class="update"><button type="submit"  onclick='btn_click("important");'><i class="fa fa-star"></i>중요</button></span>
                        <span class="update"><button type="submit"  onclick='btn_click("delete");'><i class="fa fa-trash"></i>삭제</button></span>  
                    </div>
                </form>
                <table class="table">
                    <tr>
                        <th width="150">보낸사람</th>
                        <td><p>user01@naver.com</p></td>
                    </tr>
                    <tr>
                        <th>제목</th>
                        <td><p>test제목입니다.</p></td>
                    </tr>
                    <tr>
                        <th>첨부파일</th>
                        <td><a download="" href="">xxxx.html</a></td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td><textarea style="height:400px; width:100%; resize:none;" readonly>안녕하세요</textarea></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>

    <!--스크립트-->
    <script>

        function btn_click(str){
            if(str=="reply"){   // 답장

                form_mail.action="reply.ma"

            } else if(str=="forward"){  // 전달

                form_mail.action="forward.ma"

            } else if(str=="important"){  // 중요메일 등록

                alert("중요메일 등록이 완료되었습니다.");

                form_mail.action="important.em";

            } else if(str=="delete"){   // 메일 삭제

                alert("메일을 삭제하였습니다.");
                
                form_mail.action="delete.em";  
            }
        }  

    </script>
</body>
</html>