<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css">
  
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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

#pagingArea{width:fit-content;margin:auto;}

.free-board{
    width: 100%; 
    height:100%;
    margin: 30px
}

.tool_bar1{
    width: 100%;
    height: 50px;
    margin-top: 100px; 
    position: relative;
}


#free-boardList{
    width: 100%;
    background:white;
    height: 700px;
}
th{
    background: lightgray;
    text-align: center;

}
td{
    font-size: 19px;
    text-align: center;
    padding : 20px 8px 8px 8px!important;
}
#free-boardList>tbody>tr:hover{cursor:pointer;}
</style>
<body>
	<div class="wrap">      
        <div class="sidebar">

                <br><br>
            <div class="writeButton">
                    <button class="button1">글쓰기</button>
            </div>
                <br><br>

            <div class="sidebar_menu">
                <li class="profile"><a class="btn"><i class="fas fa-sort-down">&nbsp;</i>자유 게시판</a>
                    <ul class="menu1">
                        <li><a href="#" style="color: skyblue;">전체 게시판</a></li>
                    </ul>
                </li>
                <br>
                <li class="profile"><a class="btn"><i class="fas fa-sort-down">&nbsp;</i>부서 게시판</a>
                    <ul class="menu1">
                        <li style="font-size: 20px;"><a href="#"></a>+ 게시판 추가</li>
                    </ul>
                </li>
                <br>             
                    <ul class="menu1">          
                        <li><a href="#" style=" color: cornflowerblue;">업무협업</a></li>
                    </ul>
            </div>
        </div>
            <script>

                /* 사이드바 메뉴 보이기 */
                $(document).ready(function(){
                    $(".profile>a").click(function(){
                        var submenu = $(this).next();
                        if(submenu.css("display") == 'block'){
                            submenu.slideUp();
                        }else{
                            submenu.slideDown();
                        }

                    });
                });
            </script>

        <div class="free-board">
            <h1>전체 게시판<small>(자유)</small></h1> 
                <section class="tool_bar1">
                        
                    <button id="New writing" class="btn btn-default btn-sm">
                        <i class="fas fa-pencil-alt"></i>
                        <span class="txt">새글쓰기</span>
                    </button>
                            
                    <button id="Copy" class="btn btn-default btn-sm">
                        <i class="fas fa-copy"></i>
                        <span class="txt">복사</span>
                    </button>
                                                                                   
                    <button id="contactDelete" class="btn btn-default btn-sm">
                        <i class="fas fa-trash"></i>
                        <span class="txt_caution">삭제</span>
                    </button>
                                                      
                </section>

            <div class="tablelist">
                <table id="free-boardList" class="table">
                    <thead>
                        <tr>
                            <th width="30px"><input type="checkbox" id="checkedAll"></th>
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
                            <td><input name="chk" type="checkbox" value="10" data-row="0"></td>
                            <td>1</td>
                            <td>안녕하세요.</td>
                            <td>김OO</td>
                            <td>2020/12/14</td>
                            <td>0</td>
                            <td>0</td>
                        </tr>
                        <tr>
                            <td><input name="chk" type="checkbox" value="9" data-row="1"></td>
                            <td>2</td>
                            <td>안녕하세요.</td>
                            <td>김OO</td>
                            <td>2020/12/14</td>
                            <td>0</td>
                            <td>0</td>
                        </tr>
                        <tr>
                            <td><input name="chk" type="checkbox" value="8" data-row="2"></td>
                            <td>3</td>
                            <td>안녕하세요.</td>
                            <td>김OO</td>
                            <td>2020/12/14</td>
                            <td>0</td>
                            <td>0</td>
                        </tr>
                        <tr>
                            <td><input name="chk" type="checkbox" value="7" data-row="3"></td>
                            <td>4</td>
                            <td>안녕하세요.</td>
                            <td>김OO</td>
                            <td>2020/12/14</td>
                            <td>0</td>
                            <td>0</td>
                        </tr>
                        <tr>
                            <td><input name="chk" type="checkbox" value="6" data-row="4"></td>
                            <td>5</td>
                            <td>안녕하세요.</td>
                            <td>김OO</td>
                            <td>2020/12/14</td>
                            <td>0</td>
                            <td>0</td>
                        </tr>
                        <tr>
                            <td><input name="chk" type="checkbox" value="5" data-row="5"></td>
                            <td>6</td>
                            <td>안녕하세요.</td>
                            <td>김OO</td>
                            <td>2020/12/14</td>
                            <td>0</td>
                            <td>0</td>
                        </tr>
                        <tr>
                            <td><input name="chk" type="checkbox" value="4" data-row="6"></td>
                            <td>7</td>
                            <td>안녕하세요.</td>
                            <td>김OO</td>
                            <td>2020/12/14</td>
                            <td>0</td>
                            <td>0</td>
                        </tr>
                        <tr>
                            <td><input name="chk" type="checkbox" value="3" data-row="7"></td>
                            <td>8</td>
                            <td>안녕하세요.</td>
                            <td>김OO</td>
                            <td>2020/12/14</td>
                            <td>0</td>
                            <td>0</td>
                        </tr>
                        <tr>
                            <td><input name="chk" type="checkbox" value="2" data-row="8"></td>
                            <td>9</td>
                            <td>안녕하세요.</td>
                            <td>김OO</td>
                            <td>2020/12/14</td>
                            <td>0</td>
                            <td>0</td>
                        </tr>
                        <tr>
                            <td><input name="chk" type="checkbox" value="1" data-row="9"></td>
                            <td>10</td>
                            <td>안녕하세요.</td>
                            <td>김OO</td>
                            <td>2020/12/14</td>
                            <td>0</td>
                            <td>0</td>
                        </tr>
                    </tbody>
                </table>
            </div>
    
            <br><br><br><br>
            <div id="pagingArea">
                <ul class="pagination">
                    <li class="page-item disabled"><a class="page-link" href="#"><</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item"><a class="page-link" href="#">></a></li>
                </ul>
            </div>               
        </div>   
    </div>
        <script>
        $(document).ready(function(){

            $("#quickregist").click(function(){
                $(".quickAdress").slideToggle();
            })
            //최상단 체크박스 클릭
            $("#checkedAll").click(function(){
                //클릭되었으면
                if($("#checkedAll").prop("checked")){
                    //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
                    $("input[name=chk]").prop("checked",true);
                    //클릭이 안되있으면
                }else{
                    //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
                    $("input[name=chk]").prop("checked",false);
                }
            });
        });
        </script>       
</body>
</html>