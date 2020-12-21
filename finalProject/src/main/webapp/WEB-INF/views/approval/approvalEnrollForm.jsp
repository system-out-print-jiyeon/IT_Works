<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
   
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/v4-shims.css">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
  
  
  
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

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
 /* 작성하기 버튼 */
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
    height: 100vh;
    background-color: #e7e1e1;
    position: fixed;
    
    

}


.sidebar_menu{
    align-items: center;
    list-style: none;
}  

.sidebar_menu a{
    display: block;
    text-decoration: none;
    line-height: 40px;
    color: rgb(107, 102, 102);
    font-size: 20px;
    padding-left: 40px;
    box-sizing: border-box;
    
}

.sidebar_menu a:hover{
    color: rgb(39, 37, 37);
}


.menu1 li{ 
    padding-left: 60px;
    list-style: none; 
}

.profile:hover{cursor: pointer;}
.profile .menu1{display: none;}


/* 문서작성폼 */
.enrollForm{
    margin-left: 300px;
    
}

.titleBox{
    margin-left: 30px; 
    position: relative;
}

.titleBox:hover{
    cursor: pointer;
}

.infoTable{
    border-collapse: collapse;
    width: 800px;
    height: 100px;
    
}

.infoTable th{
    background-color: #e7e1e1;
}

.infoTable td{
    padding-left: 20px;
}

.approvalLine{
    margin-left: 30px;
}
.approvalTable{
    border-collapse: collapse;
    width: 800px;
    height: 200px;
}

.approvalTable th{
    background-color:  #e7e1e1;
    width: 80px;
}

.mainTitle{
    height: 150px;
}

.secondTitle{
    height: 40px;
}

.firstCell{
    height: 40px;
}

.secondCell{
    height: 80px;
}

.thirdCell{
    height: 40px;
}

/* 기안하기 버튼 */

.submitButton{
    padding: 30px;
    padding-bottom: 100px;
    text-align: center;
    
}

.submitButton button{
    width: 150px;
    height: 50px;
    background-color: #e7e1e1;
    border-radius: 10px;
    border-style: none;
}

/* 써머노트 */
.detailContents{
    margin-left: 30px;
}

/* 결재선 모달  */

.modalDiv{
        margin: 50px;
        background-color: white;
        border: 1px solid  #878787;
        width: 900px;
        height: 600px;
        box-sizing: border-box;
        z-index: 10000;
        position: absolute;
        top: 15%;
        left: 20%;
        display: none;
        
        
       
    }
    .modalDiv_1{
        
        margin-top: 20px;
        margin-bottom: 20px;
        margin-left: 30px;
        color: rgb(73, 174, 233); 
        
    }

    .modalCancel:hover{
        cursor: pointer;
    }

    .modalDiv_2{
        height: 5%;
    }

    .modalDiv_3{
        height: 75%;
    }

    .modalDiv_3_1{
        width: 25%;
        position: relative;
    }

    .modalDiv_3_1_1{
        width: 88%;
        height: 98%;
        border: 1px solid #878787;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        overflow: scroll;
    }

    .modalDiv_3_1_1 div{
        margin-left: 5px;
        margin-top: 5px;
        
    }

    .modalDiv_3_1_1 div div{
        margin-left: 15px;
        
    }


    .modalDiv_3_2{
        width:15%;
        display: block;
        text-align: center;

        
        
    }

    .modalDiv_3_2 button{
        width: 100px;
        height: 40px;
        margin-top: 20px;
        margin-bottom: 20px;
        vertical-align: middle;

        
        
        
    }

    .modalDiv_3_3{
        width:60%;
        
    }

    .modalDiv_3_3_1{
        width: 97%;
        height: 72.5%;
        border: 1px solid #878787;
        overflow: scroll;
       
        

    }

    .modalDiv_3_3_2{
     
    }

    .modalDiv_3_3_3{
        width: 97%;
        height: 15%;
        border: 1px solid #878787;
    }

    .modalDiv_4{
        height: 10%;
        text-align: center;
    }

    .modalDiv_4 button{
        margin-top: 5px;
        margin-left: 20px;
        margin-right: 20px;
    }

    .table1{
        border:1px solid  #878787;
        text-align: center;
        
    }

    .table1 tr{
        height: 50px;
        
    }

    

    .th_numbering{
        width: 30px;
        
        
    }

    .td_nameSpace{
        width: 140px;
        
    }

    .th_category{
        width: 100px;
        border-right-style: hidden;
    }

    .td_reference{
        background-color: #878787;
        width: 130px;
        height:55px;
        text-align: center;
        border: 3px solid white;

    }

    /* dim */

    .dim{
        position: fixed;
        left: 0;
        top: 0;
        z-index: 900;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        display: none;
    }
</style>
</head>
<body>

	<jsp:include page="../common/approvalNavbar.jsp"/>

<div class="wrap">
        
      
        
        <div class="sidebar">

                <br><br>
            <div class="writeButton">
              	 <a href="approval.me"><button class="button1">작성하기</button></a>
            </div>
                <br><br><br>

            <div class="sidebar_menu">
                <li class="profile" ><a class="btn"><i class="fas fa-sort-down">&nbsp;</i>진행 중인 문서</a>
                    <ul class="menu1">
                        <li><a href="approval.do">전체</a></li>
                        <li><a href="approval.do">대기</a></li>
                        <li><a href="approval.do">확인</a></li>
                        <li><a href="approval.do">예정</a></li>
                        <li><a href="approval.do">진행</a></li>
                    </ul>
                </li>
                <li class="profile" ><a class="btn"><i class="fas fa-sort-down">&nbsp;</i>문서함</a>
                    <ul class="menu1">
                        <li><a href="approval.do">전체</a></li>
                        <li><a href="approval.do">기안</a></li>
                        <li><a href="approval.do">결제</a></li>
                        <li><a href="approval.do">수신</a></li>
                        <li><a href="approval.do">회람/참조</a></li>
                        <li><a href="approval.do">반려</a></li>
                    </ul>
                </li>
                <li><a href=""><i class="fas fa-cog"></i>&nbsp;관리자 설정</a></li>
            </div>
        
        </div>

        <div class="enrollForm">

            <div class="titleBox">
                <h5>기본 설정</h5>
                <table class="infoTable" border="1px">
                    <tr>
                        <th>문서 종류</th>
                        <td>  <select name="" id="">
                                <option value="">&nbsp;선택</option>
                                <option value="지출결의서">지출 결의서</option>
                                <option value="문서발급요청서">문서 발급 요청서</option>
                                <option value="프로젝트업무보고서">프로젝트 업무 보고서</option>
                                <option value="품의서">품의서</option>
                            </select> 
                        </td>
                        <th>작성자</th>
                        <td>인사팀 홍길동</td>
                    </tr>
                    <tr>
                        <th>보존 연한</th>
                        <td>
                            <select name="" id="">
                                <option value="">&nbsp;보존 연한</option>
                                <option value="1년">1년</option>
                                <option value="3년">3년</option>
                                <option value="5년">5년</option>
                            </select> 
                        </td>
                        <th>보안 등급</th>
                        <td>
                            <select name="" id="">
                                <option value="">&nbsp;보안 등급</option>
                                <option value="S등급">S 등급</option>
                                <option value="A등급">A 등급</option>
                                <option value="B등급">B 등급</option>
                                <option value="C등급">C 등급</option>
                            </select> 
                        </td>
                    </tr>
                </table>
            </div>

            <div class="formInfo">

            </div>

            <div class="titleBox" style="display: flex; margin-left: 30px;">
                <h5>결재선</h5> <a class="modalOpen"><h6 style="margin-left: 40px; color: rgb(73, 174, 233);">결재선 설정</h6> </a>
            </div>

            <div class="approvalLine">
              <table class="approvalTable" border="1px">
                <tr>
                    <th rowspan="3" class="mainTitle">결재</th>
                    <th class="firstCell"></th>
                    <th class="firstCell"></th>
                    <th class="firstCell"></th>
                    <th class="firstCell"></th>
                    <th class="firstCell"></th>
                    <th class="firstCell"></th>
                    <th class="firstCell"></th>
                </tr>
                <tr>
                    <td class="secondCell"></td>
                    <td class="secondCell"></td>
                    <td class="secondCell"></td>
                    <td class="secondCell"></td>
                    <td class="secondCell"></td>
                    <td class="secondCell"></td>
                    <td class="secondCell"></td>
                    
                </tr>
                <tr>
                    <td class="thirdCell"></td>
                    <td class="thirdCell"></td>
                    <td class="thirdCell"></td>
                    <td class="thirdCell"></td>
                    <td class="thirdCell"></td>
                    <td class="thirdCell"></td>
                    <td class="thirdCell"></td>
                    
                </tr>
                
                <tr>
                    <th class="secondTitle">참조</th>
                    <td colspan="7"></td>
                    
                </tr>
            </table>
            </div>

            <div class="titleBox">
               <h5>제목</h5> 
            </div>
                
            <div class="inputTitle">
                <input type="text" style="width: 800px; margin-left: 30px;">
            </div>

            <div class="titleBox">
               <h5>상세 입력</h5> 
            </div>

            <div class="detailContents">

                <div id="summernote"></div>


            </div>

            <div class="attachment" style="border:dashed; width: 800px; margin: 30px; display: flex;">
            
                <h5 style="margin: 30px;">별첨</h5>
                <h6 style="margin-top: 30px; margin-bottom: 30px; color: rgb(73, 174, 233); border-right: 1px solid#878787;">파일 첨부 &nbsp;</h6> &nbsp; 
                <h6 style="margin-top: 30px; color: rgb(73, 174, 233);">관련문서 첨부</h6> 
                <h6 style="margin-top: 30px; margin-bottom: 30px; margin-left: 100px; text-align: center; color: #878787;" >여기로 파일을 끌어놓으세요</h6>
                
                

            </div>

            <div class="submitButton">
                <button>기안하기</button>
            </div>


        </div>

        
        
        

        

    </div>

    <div class="modalDiv">
        <div class="modalDiv_1">
            <span>결재선 설정</span> 
            <span class="modalCancel"><i class="fas fa-times fa-2x" style="color: #878787; float: right; margin-right: 10px; "></i></span>
        </div>

        <div class="modalDiv_2">
            <input type="text" placeholder="이름, 조직 검색" style="margin-left: 12px; width: 180px; height: 20px;" > &nbsp;<i class="fas fa-redo"></i>
            <select name="" id="" style="float: right;  margin-right: 30px; width: 180px; height: 25px;" >
                <option value="">자주 쓰는 결재선</option>
                <option value="">자주 쓰는 결재선1</option>
                <option value="">자주 쓰는 결재선2</option>
                <option value="">자주 쓰는 결재선3</option>
            </select>
        </div>

        <div class="modalDiv_3" style="display: flex;">

            <div class="modalDiv_3_1">
                <div class="modalDiv_3_1_1">
                    <div class="modalDiv_business"><i class="fas fa-plus-circle"></i> 경영지원팀(13)
                        <div class="member1">
                            <div><input type="checkbox" name="business" id="">부장 박동성</div>
                            <div><input type="checkbox" name="business" id="">부장 박동성</div>
                            <div><input type="checkbox" name="business" id="">부장 박동성</div>
                            <div><input type="checkbox" name="business" id="">부장 박동성</div>
                        </div>
                    </div>
                        
                    <div class="modalDiv_personnel"><i class="fas fa-plus-circle"></i> 인사팀(12)
                        <div class="member2">
                            <div><input type="checkbox" name="personnel" id="">부장 박동성</div>
                            <div><input type="checkbox" name="personnel" id="">부장 박동성</div>
                            <div><input type="checkbox" name="personnel" id="">부장 박동성</div>
                            <div><input type="checkbox" name="personnel" id="">부장 박동성</div>
                        </div>
                    </div>
                    <div class="modalDiv_accounting"><i class="fas fa-plus-circle"></i> 총무팀(15)
                        <div class="member3">
                            <div><input type="checkbox" name="accounting" id="">부장 박동성</div>
                            <div><input type="checkbox" name="accounting" id="">부장 박동성</div>
                            <div><input type="checkbox" name="accounting" id="">부장 박동성</div>
                            <div><input type="checkbox" name="accounting" id="">부장 박동성</div>
                        </div>
                    </div>
                    <div class="modalDiv_developer"><i class="fas fa-plus-circle"></i> 개발팀(10)
                        <div class="member4">
                            <div><input type="checkbox" name="developer" id="">부장 박동성</div>
                            <div><input type="checkbox" name="developer" id="">부장 박동성</div>
                            <div><input type="checkbox" name="developer" id="">부장 박동성</div>
                            <div><input type="checkbox" name="developer" id="">부장 박동성</div>
                        </div>
                    </div>
                    <div class="modalDiv_planning"><i class="fas fa-plus-circle"></i> 기획팀(8)
                        <div class="member5">
                            <div><input type="checkbox" name="planning" id="">부장 박동성</div>
                            <div><input type="checkbox" name="planning" id="">부장 박동성</div>
                            <div><input type="checkbox" name="planning" id="">부장 박동성</div>
                            <div><input type="checkbox" name="planning" id="">부장 박동성</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modalDiv_3_2">
                <button style="margin-top: 70px;">결재 <i class="fas fa-chevron-right" style="float: right; margin-right: 10px; margin-top: 1px;"></i></button>
                <button>합의 <i class="fas fa-chevron-right" style="float: right; margin-right: 10px; margin-top: 1px;"></i></button>
                <button>재무합의 <i class="fas fa-chevron-right" style="float: right; margin-right: 10px; margin-top: 1px;"></i></button>
                <button>참조 <i class="fas fa-chevron-right" style="float: right; margin-right: 10px; margin-top: 1px;"></i></button>
            </div>
            <div class="modalDiv_3_3">
                <div class="modalDiv_3_3_1">
                    <table class="table1" border="1px" style="border-collapse: collapse;">
                        <tr>
                            <th class="th_numbering">1</th>
                            <th class="th_category">결재</th>
                            <td class="td_nameSpace" style="border-right-style:hidden; ">
                                홍길동 <br>
                                인사팀 
                            </td>
                            <td class="td_nameSpace" style="border-right-style:hidden;">
                                홍길동 <br>
                                인사팀
                            </td>
                            <td class="td_nameSpace" style="border-right-style:hidden;">
                                홍길동 <br>
                                인사팀
                            </td>
                            
                        </tr>
                        <tr>
                            <th class="th_numbering">2</th>
                            <th class="th_category">결재</th>
                            <td class="td_nameSpace" style="border-right-style:hidden;">
                                홍길동 <br>
                                인사팀
                            </td>
                            <td class="td_nameSpace" style="border-right-style:hidden;">
                                홍길동 <br>
                                인사팀
                            </td>
                            <td class="td_nameSpace" style="border-right-style:hidden;">
                                홍길동 <br>
                                인사팀
                            </td>
                           
                        </tr>
                        <tr>
                            <th class="th_numbering">3</th>
                            <th class="th_category">결재</th>
                            <td class="td_nameSpace" style="border-right-style:hidden;">
                                홍길동 <br>
                                인사팀
                            </td>
                            <td class="td_nameSpace" style="border-right-style:hidden;">
                                홍길동 <br>
                                인사팀
                            </td>
                            <td class="td_nameSpace" style="border-right-style:hidden;">
                                홍길동 <br>
                                인사팀
                            </td>
                          
                        </tr>
                        <tr>
                            <th class="th_numbering">4</th>
                            <th class="th_category">합의</th>
                            <td class="td_nameSpace" style="border-right-style:hidden;">
                                홍길동 <br>
                                인사팀
                            </td>
                            <td class="td_nameSpace" style="border-right-style:hidden;">
                                홍길동 <br>
                                인사팀
                            </td>
                            <td class="td_nameSpace" style="border-right-style:hidden;">
                                홍길동 <br>
                                인사팀
                            </td>
                           
                        </tr>
                        <tr>
                            <th class="th_numbering">5</th>
                            <th class="th_category">합의</th>
                            <td class="td_nameSpace" style="border-right-style:hidden;">
                                홍길동 <br>
                                인사팀
                            </td>
                            <td class="td_nameSpace" style="border-right-style:hidden;">
                                홍길동 <br>
                                인사팀
                            </td>
                            <td class="td_nameSpace" style="border-right-style:hidden;">
                                홍길동 <br>
                                인사팀
                            </td>
                          
                        </tr>
                        <tr>
                            <th class="th_numbering">6</th>
                            <th class="th_category">재무합의</th>
                            <td class="td_nameSpace" style="border-right-style:hidden;">
                                홍길동 <br>
                                인사팀
                            </td>
                            <td class="td_nameSpace" style="border-right-style:hidden;">
                                홍길동 <br>
                                인사팀
                            </td>
                            <td class="td_nameSpace" style="border-right-style:hidden;">
                                홍길동 <br>
                                인사팀
                            </td>
                            
                        </tr>
                        <tr>
                            <th class="th_numbering">7</th>
                            <th class="th_category">재무합의</th>
                            <td class="td_nameSpace" style="border-right-style:hidden;">
                                홍길동 <br>
                                인사팀
                            </td>
                            <td class="td_nameSpace" style="border-right-style:hidden;">
                                홍길동 <br>
                                인사팀
                            </td>
                            <td class="td_nameSpace" style="border-right-style:hidden;">
                                홍길동 <br>
                                인사팀
                            </td>
                          
                        </tr>
                    </table>
                </div>
                <div class="modalDiv_3_3_2"  style="margin-top: 13px; margin-bottom: 13px;">
                    <p>참조</p>
                </div>
                <div class="modalDiv_3_3_3">
                    <table>
                        <tr>
                            <td class="td_reference">
                               홍길동 <br>
                                인사팀
                            </td>
                            <td class="td_reference">
                                홍길동 <br>
                                인사팀
                            </td>
                            <td class="td_reference">
                                홍길동 <br>
                                인사팀
                            </td>
                            <td class="td_reference">
                                홍길동 <br>
                                인사팀
                            </td>
                        </tr>
                    </table>

                </div>
            </div>

        </div>

        <div class="modalDiv_4">
            <button style="width: 80px; height: 40px;">확인</button>
            <button style="width: 80px; height: 40px;" class="modalCancel">취소</button>
        </div>
        
    </div>


    <div class="dim"></div>

    



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


    /* 써머노트 */
    $('#summernote').summernote({
        
        tabsize: 2,
        width:800,
        height: 500,
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

      /* 모달창 보이기 */
      $(document).ready(function(){
        $(".modalOpen").click(function(){
            $(".modalDiv").show();
            $(".dim").show();
        });

        $(".modalCancel").click(function(){
            $(".modalDiv").hide();
            $(".dim").hide();
        });
    });

    /* 결재선 팀원 드롭다운 */
    $(document).ready(function(){
        $(".modalDiv_business").click(function(){
        var submenu = $(".member1");
        if(submenu.css("display") == 'block'){
            submenu.slideUp();
        }else{
            submenu.slideDown();
        }
        
    });

    $(".modalDiv_personnel").click(function(){
        var submenu = $(".member2");
        if(submenu.css("display") == 'block'){
            submenu.slideUp();
        }else{
            submenu.slideDown();
        }
        
    });

    $(".modalDiv_accounting").click(function(){
        var submenu = $(".member3");
        if(submenu.css("display") == 'block'){
            submenu.slideUp();
        }else{
            submenu.slideDown();
        }
        
    });

    $(".modalDiv_developer").click(function(){
        var submenu = $(".member4");
        if(submenu.css("display") == 'block'){
            submenu.slideUp();
        }else{
            submenu.slideDown();
        }
        
    });

    $(".modalDiv_planning").click(function(){
        var submenu = $(".member5");
        if(submenu.css("display") == 'block'){
            submenu.slideUp();
        }else{
            submenu.slideDown();
        }
        
    });
});

  </script>



</body>
</html>