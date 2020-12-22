<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>approvalListView</title>
   
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/v4-shims.css">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
  

<style>
  
 *{ 
     margin: 0;
     padding: 0;
     
     box-sizing: border-box;
 }

.wrap{width: 100%; 
      height: 100%;
      display: flex;
     
    }
 


/* 콘텐츠 영역 */

.content{
   
    width:100%;
    margin-left: 300px;
    
    display:block;
    margin-top: 100px;

}

.content_1{height: fit-content; margin-left: 50px; width: fit-content;}

.content_2{height: fit-content; align-content: center; position: relative;}

.content_3{height: fit-content; padding-left: 50px;}

.w3-bar{height: fit-content; text-align: center;}

.content_1:hover{cursor: pointer;}

table{
    width: 95%;
    height: 80%;
    border-collapse: collapse;
    border-spacing: 0;
    background: #fafafa;
    text-align: center;
}
th{background: #e7e1e1;}

th,td{
    padding: 10px 15px;

}

tbody tr:hover{background-color: #dbd5d5; cursor: pointer;}

/* 문서양식 드롭다운 */
.formtype{
    border: 1px solid darkgray;
    width: 150px;
    height: 170px;
    background-color: white;
    text-align: center;
    font-size: 15px;
    z-index: 1000;
    display: none;
    margin-left: 50px;
    position: absolute;
    
    
}
.formtype div{
    margin-top: 10px;
    
}

.formtype div:hover{
    background-color: rgb(204, 198, 198);
}
.formtype a{
    text-decoration: none;
    color: rgb(61, 56, 56);
    
}
</style>
</head>
<body>

	<jsp:include page="../common/approvalNavbar.jsp"/>

 <div class="wrap">
        
      
        
    <jsp:include page="../common/sideBar_approval.jsp"/>
    
        

        <div class="content">

            <div class="content_1" >
       <a  style="text-decoration: none;" >보기 : 모든 문서&nbsp;<i class="fas fa-sort-down"></i></a> 
            </div>
            <div class="formtype">
                <div><a href="">모든문서</a></div>
                <div><a href="">품의서</a></div>
                <div><a href="">지출결의서</a></div>
                <div><a href="">프로젝트업무보고서</a> </div>
                <div><a href="">문서발급요청서</a></div>
            </div>

            <div class="content_2">
                <table style="margin: auto; text-align: center;">
                  <thead>
                    <tr>
                        <th>문서 번호</th>
                        <th>제목</th>
                        <th>기안자</th>
                        <th>기안일</th>
                        <th>문서 종류</th>
                        <th>구분</th>
                    </tr>
                  </thead>

                  <tbody>
                    <tr>
                        <td>SS-기획팀-20201119-083</td>
                        <td>제목1</td>
                        <td>홍길동</td>
                        <td> 2020-11-19	</td>
                        <td>품의서</td>
                        <td>기안</td>
                    </tr>
                    <tr>
                        <td>SS-기획팀-20201119-083</td>
                        <td>제목1</td>
                        <td>홍길동</td>
                        <td>2020-11-19</td>
                        <td>품의서</td>
                        <td>기안</td>
                    </tr>
                    <tr>
                        <td>SS-기획팀-20201119-083</td>
                        <td>제목1</td>
                        <td>홍길동</td>
                        <td>2020-11-19</td>
                        <td>품의서</td>
                        <td>기안</td>
                    </tr>
                    <tr>
                        <td>SS-기획팀-20201119-083</td>
                        <td>제목1</td>
                        <td>홍길동</td>
                        <td>2020-11-19</td>
                        <td>품의서</td>
                        <td>기안</td>
                    </tr>
                    <tr>
                        <td>SS-기획팀-20201119-083</td>
                        <td>제목1</td>
                        <td>홍길동</td>
                        <td>2020-11-19</td>
                        <td>품의서</td>
                        <td>기안</td>
                    </tr>
                    <tr>
                        <td>SS-기획팀-20201119-083</td>
                        <td>제목1</td>
                        <td>홍길동</td>
                        <td>2020-11-19</td>
                        <td>품의서</td>
                        <td>기안</td>
                    </tr>
                    <tr>
                        <td>SS-기획팀-20201119-083</td>
                        <td>제목1</td>
                        <td>홍길동</td>
                        <td>2020-11-19</td>
                        <td>품의서</td>
                        <td>기안</td>
                    </tr>
                    <tr>
                        <td>SS-기획팀-20201119-083</td>
                        <td>제목1</td>
                        <td>홍길동</td>
                        <td>2020-11-19</td>
                        <td>품의서</td>
                        <td>기안</td>
                    </tr>
                    <tr>
                        <td>SS-기획팀-20201119-083</td>
                        <td>제목1</td>
                        <td>홍길동</td>
                        <td>2020-11-19</td>
                        <td>품의서</td>
                        <td>기안</td>
                    </tr>
                    <tr>
                        <td>SS-기획팀-20201119-083</td>
                        <td>제목1</td>
                        <td>홍길동</td>
                        <td>2020-11-19</td>
                        <td>품의서</td>
                        <td>기안</td>
                    </tr>
                    <tr>
                        <td>SS-기획팀-20201119-083</td>
                        <td>제목1</td>
                        <td>홍길동</td>
                        <td>2020-11-19</td>
                        <td>품의서</td>
                        <td>기안</td>
                    </tr>
                    <tr>
                        <td>SS-기획팀-20201119-083</td>
                        <td>제목1</td>
                        <td>홍길동</td>
                        <td>2020-11-19</td>
                        <td>품의서</td>
                        <td>기안</td>
                    </tr>
                    <tr>
                        <td>SS-기획팀-20201119-083</td>
                        <td>제목1</td>
                        <td>홍길동</td>
                        <td>2020-11-19</td>
                        <td>품의서</td>
                        <td>기안</td>
                    </tr>
                    <tr>
                        <td>SS-기획팀-20201119-083</td>
                        <td>제목1</td>
                        <td>홍길동</td>
                        <td>2020-11-19</td>
                        <td>품의서</td>
                        <td>기안</td>
                    </tr>
                    <tr>
                        <td>SS-기획팀-20201119-083</td>
                        <td>제목1</td>
                        <td>홍길동</td>
                        <td>2020-11-19</td>
                        <td>품의서</td>
                        <td>기안</td>
                    </tr>
                  </tbody>
                </table>

            </div>

            <div class="content_3">
                <p>문서 수 : 143</p>
            </div>
            <div class="w3-bar">
                <a href="#" class="w3-button">&laquo;</a>
                <a href="#" class="w3-button">1</a>
                <a href="#" class="w3-button">2</a>
                <a href="#" class="w3-button">3</a>
                <a href="#" class="w3-button">4</a>
                <a href="#" class="w3-button">&raquo;</a>
            </div>

        </div>

    </div>



  

<script>

    $(document).ready(function(){
        $(".content_1").click(function(){
            var submenu = $(".formtype");
            if(submenu.css("display") == 'none'){
                submenu.show();
            }else{
                submenu.hide();
            }
            
        });
    });

  </script>



</body>
</html>