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
    /* background:linear-gradient(rgb(223, 225, 250),rgb(248, 241, 250), rgb(255, 255, 255)); */
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
    /* background:rgb(209, 170, 243);  */
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
        /* background:rgb(194, 135, 250); */
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
        /* color:rgb(181, 119, 231); */      
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
.em_content_center>table{
    width: 95%;
    height: 80%;
    text-align: center;
}
.en_content_center .update{
    color:gray;
    font-size:20px;
    margin-right:20px;
}
.en_content_center a{
    color:gray;
    text-decoration:none;
}
.en_content_center a:hover{
    animation-name:key4;
    animation-duration:0.3s;
    animation-fill-mode:both;
    animation-direction: alternate;
}
@keyframes key4{
    100%{
        color:rgb(80, 150, 255); 
    }
}
.en_content_center{
    padding:20px;
}
.en_content_center tbody>tr{
    font-size:17px;
    color:gray;
}
.en_content_center tbody>tr:hover{
    cursor:pointer;
    animation-name:key5;
    animation-duration:0.3s;
    animation-fill-mode:both;
}
@keyframes key5{
    100%{
        /* background:rgb(231, 225, 225); */
        background:rgb(241, 235, 235);
    }
}
.en_content_center .icon{
    color:rgb(105, 164, 253); 
    font-size:25px; 
    font-weight:900;
}
.en_content_center .icon-none{
    color:rgb(212, 211, 211);
    font-size:25px; 
    font-weight:900;
}
.en_content_center input[type="checkbox"]{
    width:17px;
    height:17px;
}
/* 페이징 바 */
.en_content_center>.paging{
    margin-top:100px;
    text-align:center;
}
.en_content_center>.paging>a{
    font-size:20px;
    font-weight:700;
    padding:5px;
    color:gray;
    text-decoration:none;
    width:50px;
    height:50px;
    background:rgb(241, 235, 235);
    display:inline-block;
    border-radius:5px;
}
.en_content_center>.paging>a:hover{
    animation-name:key6;
    animation-duration:0.3s;
    animation-fill-mode:both;
    animation-direction: alternate;
}
@keyframes key6{
    100%{
        background:rgb(93, 158, 255); 
        color:white;
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
                    <li><a href="#"><i class="fa fa-envelope"></i> 전체 메일</a></li>
                    <li><a href="#"><i class="fa fa-paper-plane"></i> 보낸 메일</a></li>
                    <li><a href="#"><i class="fa fa-reply"></i>받은 메일</a></li>
                    <li><a href="#"><i class="fa fa-star"></i>중요메일</a></li>
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
            <div clss="en_content_top">
            
            </div>
            <div class="en_content_center">
                <div>
                    <input type="checkbox" id="checkall" name="chk"> 
                    <label class="update" for="checkall">전체선택</label>
                    <span class="update"><a href=""><i class="fa fa-star"></i>중요</a></span>
                    <span class="update"><a href=""><i class="fa fa-trash"></i>삭제</a></span>
                </div>
                <table class="table">
                    <tbody>
                        <tr>
                            <td width="2%" class="icon"><input type="checkbox" name="chk"></td>
                            <td width="2%" class="icon"><i class="fa fa-paper-plane"></i></td>              
                            <td width="2%" class="icon"><i class="fa fa-star"></i></td>
                            <td width="2%" class="icon"><i class="fa fa-envelope-open"></i></td>
                            <td width="15%">user01@naver.com</td>
                            <td width="2%" class="icon"><i class="fa fa-download"></i></td>
                            <td>안녕하세요 김개똥 입니다.</td>
                            <td width="15%">2020-12-13</td>
                        </tr>
                        <tr>
                            <td width="2%" class="icon"><input type="checkbox" name="chk"></td>
                            <td width="2%" class="icon"><i class="fa fa-paper-plane"></i></td>              
                            <td width="2%" class="icon-none"><i class="fa fa-star"></i></td>
                            <td width="2%" class="icon-none"><i class="fa fa-envelope"></i></td>
                            <td width="15%">user01@naver.com</td>
                            <td width="2%" class="icon-none"><i class="fa fa-download"></i></td>
                            <td>안녕하세요 김길순입니다</td>
                            <td width="15%">2020-12-13</td>
                        </tr>
                        <tr>
                            <td width="2%" class="icon"><input type="checkbox" name="chk"></td>
                            <td width="2%" class="icon"><i class="fa fa-paper-plane"></i></td>              
                            <td width="2%" class="icon"><i class="fa fa-star"></i></td>
                            <td width="2%" class="icon"><i class="fa fa-envelope-open"></i></td>
                            <td width="15%">user01@naver.com</td>
                            <td width="2%" class="icon"><i class="fa fa-download"></i></td>
                            <td>안녕하세요 김길동입니다</td>
                            <td width="15%">2020-12-13</td>
                        </tr>
                        <tr>
                            <td width="2%" class="icon"><input type="checkbox" name="chk"></td>
                            <td width="2%" class="icon"><i class="fa fa-reply"></i></td>              
                            <td width="2%" class="icon-none"><i class="fa fa-star"></i></td>
                            <td width="2%" class="icon-none"><i class="fa fa-envelope"></i></td>
                            <td width="15%">user01@naver.com</td>
                            <td width="2%" class="icon-none"><i class="fa fa-download"></i></td>
                            <td>안녕하세요 이개똥</td>
                            <td width="15%">2020-12-13</td>
                        </tr>
                        <tr>
                            <td width="2%" class="icon"><input type="checkbox" name="chk"></td>
                            <td width="2%" class="icon"><i class="fa fa-paper-plane"></i></td>              
                            <td width="2%" class="icon"><i class="fa fa-star"></i></td>
                            <td width="2%" class="icon"><i class="fa fa-envelope-open"></i></td>
                            <td width="15%">user01@naver.com</td>
                            <td width="2%" class="icon"><i class="fa fa-download"></i></td>
                            <td>안녕하세요 김개똥</td>
                            <td width="15%">2020-12-13</td>
                        </tr>
                        <tr>
                            <td width="2%" class="icon"><input type="checkbox" name="chk"></td>
                            <td width="2%" class="icon"><i class="fa fa-paper-plane"></i></td>              
                            <td width="2%" class="icon"><i class="fa fa-star"></i></td>
                            <td width="2%" class="icon"><i class="fa fa-envelope-open"></i></td>
                            <td width="15%">user01@naver.com</td>
                            <td width="2%" class="icon"><i class="fa fa-download"></i></td>
                            <td>안녕하세요 강개똥</td>
                            <td width="15%">2020-12-13</td>
                        </tr>
                        <tr>
                            <td width="2%" class="icon"><input type="checkbox" name="chk"></td>
                            <td width="2%" class="icon"><i class="fa fa-paper-plane"></i></td>              
                            <td width="2%" class="icon"><i class="fa fa-star"></i></td>
                            <td width="2%" class="icon"><i class="fa fa-envelope-open"></i></td>
                            <td width="15%">user01@naver.com</td>
                            <td width="2%" class="icon"><i class="fa fa-download"></i></td>
                            <td>안녕하세요 유개똥</td>
                            <td width="15%">2020-12-13</td>
                        </tr>
                        <tr>
                            <td width="2%" class="icon"><input type="checkbox" name="chk"></td>
                            <td width="2%" class="icon"><i class="fa fa-paper-plane"></i></td>              
                            <td width="2%" class="icon"><i class="fa fa-star"></i></td>
                            <td width="2%" class="icon"><i class="fa fa-envelope-open"></i></td>
                            <td width="15%">user01@naver.com</td>
                            <td width="2%" class="icon"><i class="fa fa-download"></i></td>
                            <td>안녕하세요</td>
                            <td width="15%">2020-12-13</td>
                        </tr>
                        <tr>
                            <td width="2%" class="icon"><input type="checkbox" name="chk"></td>
                            <td width="2%" class="icon"><i class="fa fa-paper-plane"></i></td>              
                            <td width="2%" class="icon"><i class="fa fa-star"></i></td>
                            <td width="2%" class="icon"><i class="fa fa-envelope-open"></i></td>
                            <td width="15%">user01@naver.com</td>
                            <td width="2%" class="icon"><i class="fa fa-download"></i></td>
                            <td>안녕하세요</td>
                            <td width="15%">2020-12-13</td>
                        </tr>
                        <tr>
                            <td width="2%" class="icon"><input type="checkbox" name="chk"></td>
                            <td width="2%" class="icon"><i class="fa fa-paper-plane"></i></td>              
                            <td width="2%" class="icon"><i class="fa fa-star"></i></td>
                            <td width="2%" class="icon"><i class="fa fa-envelope-open"></i></td>
                            <td width="15%">user01@naver.com</td>
                            <td width="2%" class="icon"><i class="fa fa-download"></i></td>
                            <td>안녕하세요</td>
                            <td width="15%">2020-12-13</td>
                        </tr>
                    </tbody>
                </table>
                <div class="paging">
                    <a href=""><i class="fa fa-angle-double-left"></i></a>
                    <a href="">1</a>
                    <a href="">2</a>
                    <a href="">3</a>
                    <a href="">4</a>
                    <a href="">5</a>
                    <a href=""><i class="fa fa-angle-double-right"></i></a>
                </div>
            </div>
        </div>
    </div>

    <!-- 푸터바 include -->

    <script>
    $(document).ready(function(){
        $("#checkall").click(function(){
            if($("#checkall").prop("checked")){ 
                $("input[name=chk]").prop("checked",true);
            }else{
                $("input[name=chk]").prop("checked",false);
            }
        })
    })
    </script>
</body>
</html>