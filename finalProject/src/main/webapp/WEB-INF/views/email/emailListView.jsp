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

/*내용*/
.em_title{
	color:gray;
	font-size:30px;
}
.em_content{
    width:100%;
    margin-left:300px;
}
.em_navbar {
	width:100%;
    position: fixed;
    background:white;
}
.em_content_center{
    margin-top:100px;
}
.em_content_center>table{
    width: 95%;
    height: 80%;
    text-align: center;
}
.em_content_center .update{
    color:gray;
    font-size:20px;
    margin-right:20px;
}
.em_content_center button{
    color:gray;
    text-decoration:none;
    border:none;
    background:none;
}
.em_content_center{
    padding:20px;
}
.em_content_center tbody>tr{
    font-size:17px;
    color:gray;
}
.em_content_center tbody>tr:hover{
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
.em_content_center .icon{
    color:rgb(105, 164, 253); 
    font-size:25px; 
    font-weight:900;
}
.em_content_center .icon-none{
    color:rgb(212, 211, 211);
    font-size:25px; 
    font-weight:900;
}
.em_content_center input[type="checkbox"]{
    width:17px;
    height:17px;
}

/* 페이징 바 */
.em_content_center>.paging{
    margin-top:100px;
    text-align:center;
}
.em_content_center>.paging>a{
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
.em_content_center>.paging>a:hover{
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
    <div class="em_navbar">
    	<!-- 상단바 include -->
		<jsp:include page="../common/approvalNavbar.jsp"/>
    </div>
	<div class="em_wrap">

		<jsp:include page="../common/sideBar_email.jsp"/>

        <div class="em_content">
            <div class="em_content_center">
			<span class="em_title">${ title }</span>

                <form name="form_mail" method="post">

                    <div class="submit_btn">
                        <input type="checkbox" id="checkall"> 
                        <label class="update" for="checkall">전체선택</label>
                        <span class="update"><button type="submit" disabled="true" onclick='btn_click("important");'><i class="fa fa-star"></i> 중요</button></span>
                        <span class="update"><button type="submit" disabled="true" onclick='btn_click("delete");'><i class="fa fa-trash"></i> 삭제</button></span>             
                    </div>
                    <table class="table">
                        <tbody>
							<c:forEach var="em" items="${ list }">
	                            <tr>
	                                <td width="2%" class="icon"><input type="checkbox" name="chk" value="15"></td>
	                                <td width="2%" class="icon"><i class="fa fa-paper-plane"></i></td>
	                                <c:choose>
	                                	<c:when test='${ em.emInp == "Y" }'>
	                                		<td width="2%" class="icon"><i class="fa fa-star"></i></td>
	                                	</c:when>
	                                	<c:otherwise>
	                                		<td width="2%" class="icon-none"><i class="fa fa-star"></i></td>
	                                	</c:otherwise>
	                                </c:choose>
	                                
	                                
	                                           
	                                
	                                <td width="2%" class="icon"><i class="fa fa-envelope-open"></i></td>
	                                <td width="15%">${ em.emFrom }</td>
	                                <td width="2%" class="icon"><i class="fa fa-download"></i></td>
	                                <td>${ em.emTitle }</td>
	                                <td width="15%">${ em.emEnrollDate }</td>
	                            </tr>
<!-- 	                            <tr>
	                                <td width="2%" class="icon"><input type="checkbox" name="chk" value="20"></td>
	                                <td width="2%" class="icon"><i class="fa fa-paper-plane"></i></td>              
	                                <td width="2%" class="icon-none"><i class="fa fa-star"></i></td>
	                                <td width="2%" class="icon-none"><i class="fa fa-envelope"></i></td>
	                                <td width="15%">user01@naver.com</td>
	                                <td width="2%" class="icon-none"><i class="fa fa-download"></i></td>
	                                <td>안녕하세요 김길순입니다</td>
	                                <td width="15%">2020-12-13</td>
	                            </tr> -->
                           </c:forEach>

                        </tbody>
                    </table>
                </form>
                <c:choose>
                	<c:when test="${ empty condition }">
                <div class="paging">
                <div class="em_title" style="text-align:center;">${ pi.currentPage }page</div>
                	<c:if test="${ pi.currentPage ne 1 }">
                    	<a href="listFrom.em?currentPage=${ pi.currentPage - 1 }&email=${ loginUser.email }"><i class="fa fa-angle-double-left"></i></a>
                    </c:if>
                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">

                    	<a href="listFrom.em?currentPage=${ p }&email=${ loginUser.email }">${ p }</a>

                    </c:forEach>
                    <c:if test="${ pi.currentPage ne pi.maxPage }">
                    	<a href="listFrom.em?currentPage=${ pi.currentPage + 1 }&email=${ loginUser.email }"><i class="fa fa-angle-double-right"></i></a>
                    </c:if>
                </div>
                	</c:when>
                
                </c:choose>
            </div>
        </div>
    </div>

    <!-- 푸터바 include -->

    <!-- 스크립트 -->
    <!-- 전체 체크박스 선택 -->
    <script>
    $(document).ready(function(){
        $("#checkall").click(function(){
            if($("#checkall").prop("checked")){ 
                $("input[name=chk]").prop("checked",true);
            }else{
                $("input[name=chk]").prop("checked",false);

                // 전체선택 체크박스 체크 해제시 버튼 비활성화
                $(".submit_btn button").css({"color":"gray"}).prop("disabled",true);
            }
        })
    })

    // 체크박스가 체크되면 버튼 활성화 되게 만들기 
    $('.em_content_center input[type="checkbox"]').click(function(){
        var tmpp = $(this).prop('checked'); 
        var tt=$("[name='chk']:checked").length;
        // 하나라도 체크되어있을 때 버튼 활성화 시키기 위해 length로 체크된 값의 개수를 구함
        
        if(tmpp==true || tt>0){
            // 버튼 활성화
            $(".submit_btn button").css({"color":"rgb(80, 150, 255)"}).prop("disabled",false);
        }
        else{
            // 버튼 비활성화
            $(".submit_btn button").css({"color":"gray"}).prop("disabled",true);
        }
    });
    </script>

    <!-- 중요/삭제 클릭시 action -->
    <script>

        function btn_click(str){                             
            if(str=="important"){  // 중요메일 등록

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