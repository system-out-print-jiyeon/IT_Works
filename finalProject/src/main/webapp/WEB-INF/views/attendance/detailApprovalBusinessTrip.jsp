<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="../common/navbar.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Amiri:wght@700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/v4-shims.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
  
</head>
<style>
/* *{
    border: 1px solid red;
}  */
.wrap{width: 100%; 
      height: 100%;
      display: flex;
    }

 .titleBar{text-align: center;}

.titleArea{
   border-radius: 10px;
   border: 0;
   width: 250px;
   height: 45px;
   font-size: larger;
   color: white;
   background-color: rgb(84, 129, 189);
   padding-top: 10px;
}

/* 사이드바 */
.sidebar{    
    justify-content: space-between;
    padding: 8px 24px;
    width: 300px;
    height: 1200px;
    background-color: #e7e1e1;
    margin-top: 80px;
}

.sidebar_menu{
    align-items: center;
    list-style: none;
}  

.sidebar_menu a{
    text-decoration: none;
    line-height: 40px;
    color: rgb(107, 102, 102);
    font-size: 18px;
    padding-left: 40px;
    box-sizing: border-box;
}

.sidebar_menu a:hover{
    color: rgb(39, 37, 37);
}

.menu1 li{ 
    padding-left: 20px;
    list-style: none; 
}


/*선택된메뉴*/
.selectedTitle{
    background-color: rgba(76, 135, 212, 0.616);
    border-radius: 10px;
}  



.profile:hover{cursor: pointer;}
.profile .menu1{display: none;}

/* 컨텐트 */
.contentArea{width: 100%; height: 1000px;margin-top: 80px;}
.contentArea h4{
    padding: 20px;
    font-weight: 700;
    padding-left: 110px;
}
.businessFormArea{
    width: 100%;
    height: 700px;
}

/* 테이블 */
.businessFormArea{
    padding: 50px;
}

#businessTable tr td{
    height: 40px;
    padding: 10px;	
}
#businessTable{
    table-layout: fixed;
}
.tdTitle{
    text-align: center;
    background: lightgray;
    font-family: 'Noto Sans KR', sans-serif;
}
.tdTitleHeight{
    text-align: center;
    background: lightgray;
    font-family: 'Noto Sans KR', sans-serif;
    height: 150px !important;
    padding-top: 60px;
}
textarea {
    display:block;
}
 input[type=text] {
 padding: 15px;
 text-align: center;
 margin: 0px;
}

</style>
</head>
<body>

 	<jsp:include page="../common/navbar.jsp"/>
 
        <div class="wrap">      
            <div class="sidebar">

                    <br><br>
                <div class="titleBar">
                    <div class="titleArea">근태관리</div>
                </div>
                    <br><br><br>

                <div class="sidebar_menu">
                    <li class="profile" ><a class="btn"><i class="fas fa-sort-down">&nbsp;</i>근태 현황</a>
                        <ul class="menu1">
                            <li><a href="workTime.at">출/퇴근 등록</a></li>
                        </ul>
                    </li>
                    <br>
                    <li class="profile" ><a class="btn"><i class="fas fa-sort-down">&nbsp;</i>출장</a>
                        <ul class="menu1">
                            <li><a href="insertForm.bt">출장 신청</a></li>
                            <li><a href="list.bt">출장 내역 조회</a></li>
                            <li class="selectedTitle"><a href="approval.bt">출장 승인</a></li>
                        </ul>
                    </li>
                    <br>
                    <li class="profile" ><a class="btn"><i class="fas fa-sort-down">&nbsp;</i>연차</a>
                        <ul class="menu1">
                            <li><a href="insertForm.an">연차 신청</a></li>
                            <li><a href="list.an">연차 내역 조회</a></li>
                            <li><a href="approval.an">연차 승인</a></li>
                        </ul>
                    </li>
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

            <div class="contentArea">

                <br><br>
                <h4>출장 승인</h4>

                <div class="businessFormArea" align="center">
                    <form method="post" name="form">
                    	<input type="hidden" name="buProposer" id="buProposer" value="${ loginUser.memNo }">
                        <table id="businessTable" class="table-bordered" width="1000px">
                            <tr>
                                <td width="60" class="tdTitle">소속 부서</td>
                                <td width="100">${ bt.deptName}</td>
                                <td width="60" class="tdTitle">직위</td>
                                <td width="100">${ bt.jobName }</td>
                            </tr>
                            <tr>
                                <td class="tdTitle">성명</td>
                                <td>${ bt.memName }</td>
                                <td class="tdTitle">기안 일시</td>
                                <td>${ bt.createDate }</td>
                            </tr>
                            <tr>
                                <td class="tdTitle">출장 기간</td>
                                <td align="center">${ bt.businessStart }</td>
                                 <td align="center" style="font-weight:900">~</td>
                                <td align="center">${ bt.businessEnd }</td>
                            </tr>
                            <tr>
                                <td class="tdTitle">출장지</td>
                                <td align="center">${ bt.businessPlace }</td>
                                <td class="tdTitle">출장중 연락처</td>
                                <td align="center">${ bt.businessPhone }</td>
                            </tr>
                            <tr>
                                <td class="tdTitleHeight">출장 목적</td>
                                <td colspan="3">${ bt.businessPurpose }</td>
                            </tr>
                            <tr>
                                <td class="tdTitleHeight">업무 계획</td>
                                <td colspan="3">${ bt.businessPlan }</td>
                            </tr>
                            <tr>
                                <td class="tdTitleHeight">예상 경비</td>
                                <td colspan="3">${ bt.budget }</td>
                            </tr>    
                        </table>

                        <br><br>

                        <div class="btnArea" align="center">
                            <button type="submit" value="return" onclick="javascript: form.action='clickReturn.bt?btno='+${bt.businessNo}+'&apno='+${loginUser.memNo };" class="btn btn-danger">반려</button>
                            &nbsp;&nbsp;
                            <button type="submit" value="approval" onclick="javascript: form.action='clickApproval.bt?btno='+${bt.businessNo}+'&apno='+${loginUser.memNo };" class="btn btn-primary">승인</button>
                        </div>



                    </form>
                </div>


            </div>





        </div>
</body>
</html>