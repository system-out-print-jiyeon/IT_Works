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
.em_content_center>table{
    width: 95%;
    height: 80%;
    text-align: center;
}
.en_content_center{
    padding:20px;
}
.en_content_center tbody>tr{
    font-size:17px;
    color:gray;
}
.add{
    font-size:15px;
    color:white;
    background:rgb(142, 187, 255); 
    border:none;
    border-radius:5px;
}
.add:hover{
    cursor:pointer;
    animation-name:key4;
    animation-duration:0.5s;
    animation-fill-mode:both;
    animation-direction:alternate;
}
@keyframes key4{
    to{
        background:rgb(80, 150, 255); 
        padding:3px;
    }
}
.remove{
    font-size:15px;
    color:white;
    background:rgb(253, 153, 150); 
    border:none;
    border-radius:5px;
}
.remove:hover{
    cursor:pointer;
    animation-name:key5;
    animation-duration:0.5s;
    animation-fill-mode:both;
    animation-direction:alternate;
}
@keyframes key5{
    to{
        background:rgb(255, 86, 80); 
        padding:3px;
    }
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
                <form action="" method="post" enctype="multipart/form-data">
                    <table class="table">
                        <tr>
                            <th width="150">보내는 사람</th>
                            <td><input type="email" value="user01@naver.com" readonly style="margin-left:5px;"></td>
                        </tr>
                        <tr>
                            <th>받는 사람</th>
                            <td>
                                <table id="addTable" class="table-sm table-borderless">
                                    <tr height="0">
                                        <td>
                                            <input type="email" name="recipient[0]" required>
                                            <input class="add" type="button" onClick="add()" value="추가">
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <th>제목</th>
                            <td><input type="text" name="" style="width:100%; margin-left:5px;" required></td>
                        </tr>
                        <tr>
                            <th>파일첨부</th>
                            <td><input type="file" name="" class="btn btn-outline-primary" multiple style="margin-left:5px;"></td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td><textarea id="summernote" name="editordata" style="margin-left:5px;"></textarea></td>
                        </tr>
                    </table>
                    <div align="center">
                        <input type="submit" value="메일 보내기">
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!--스크립트-->
    <!-- 받는사람 추가/삭제 -->
    <script>
        var oTbl;
        var recipients;
        var i = 0;

        function add() {
                
            i++;
                
            oTbl = document.getElementById("addTable");
            var oRow = oTbl.insertRow ();
            oRow.onmouseover=function(){oTbl.clickedRowIndex=this.rowIndex};
                
            var oCell = oRow.insertCell();
            var frmTag = "<input type='email' name='recipient["+i+"]' required>";

            frmTag += " <input type=button value='삭제' class='remove' onClick='removeRow()'>";
            oCell.innerHTML = frmTag;
        }

        function removeRow() {
        oTbl.deleteRow(oTbl.clickedRowIndex);
        }
    </script>

    <!-- 썸머노트 -->
    <script>
      //$('#summernote').summernote('disable'); 썸머노트 비활성화
      $('#summernote').summernote({
        tabsize: 2,
        height: 400,
        disableResizeEditor: true,
        
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ]
      });
    </script>
</body>
</html>