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
/*내용*/
.em_title{
	color:gray;
	font-size:30px;
}
.em_count{
	font-size:15px;
	color:rgb(93, 158, 255);
	font-weight:700;
}
.em_content{
    width:100%;
    margin-left:300px;
}
.em_navbar {
	width:100%;
    position: fixed;
    background:white;
    z-index:10;
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
#current-page{
        background:rgb(93, 158, 255); 
        color:white;
}
.email-from-list{
	background:linear-gradient( to right, rgb(253, 253, 241),rgb(255, 255, 255),rgb(255, 255, 255));
}
.email-to-list{
 	background:linear-gradient( to right, rgb(241, 251, 253),rgb(255, 255, 255),rgb(255, 255, 255));
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
			<span class="em_title">휴지통</span><span class="em_count">&nbsp;&nbsp;${ listCount }</span>
			<hr>
				<br><br>
				
				<c:choose>
				
					<c:when test="${empty list}">
						<p style="text-align:center; font-size:20px; color:gray; font-weight:900; margin-top:50px;" >휴지통에 보관중인 이메일이 존재하지 않습니다.</p>
					</c:when>
					<c:otherwise>
				
		                <form name="form_mail" method="post">
		
		                    <div class="submit_btn">
		                        <input type="checkbox" id="checkall" value=""> 
		                        <label class="update" for="checkall">전체선택</label>
		                        <label class="update"><button type="submit" disabled="true" onclick='btn_click("restore");'><i class="fa fa-trash-restore"></i> 복원</button></label>
		                        <label class="update"><button type="submit" disabled="true" onclick='btn_click("remove");'><i class="fa fa-trash-alt"></i> 영구삭제</button></label>
		                    </div>
		                    <table id="emailListTable" class="table">
		                        <tbody>
									<c:forEach var="em" items="${ list }">
										<c:choose>
											<c:when test='${ em.emCheck eq "emailFrom" }'>
											
					                            <tr class="email-from-list">
					                            	<input type="hidden" id="email-address" value="${ loginUser.email }">
					                                <input type="hidden" id="email-no" value="${ em.emNo }">
					                                
					                                <th width="4%" class="icon"><input type="checkbox" name="emNo" value="${ em.emNo }"></th> <!-- th로 해야 체크 할때 메일 상세화면으로 이동안됨 -->
					                                <td width="4%" class="icon"><i class="fa fa-paper-plane"></i></td>
					                                <c:choose>
					                                	<c:when test='${ em.emInp == "Y" }'>
					                                		<td width="4%" class="icon"><i class="fa fa-star"></i></td>
					                                	</c:when>
					                                	<c:otherwise>
					                                		<td width="4%" class="icon-none"><i class="fa fa-star"></i></td>
					                                	</c:otherwise>
					                                </c:choose>          
					                                <td width="4%" class="icon-none"><i class="fa fa-envelope-open"></i></td>
					                                <td width="15%">${ em.emTo }</td>
					                                <c:choose>
					                                	<c:when test="${ em.att gt 0 }">
					                               			<td width="4%" class="icon"><i class="fa fa-download"></i></td>
					                                	</c:when>
					                                	<c:otherwise>
					                                		<td width="4%" class="icon-none"><i class="fa fa-download"></i></td>
					                                	</c:otherwise>
					                                </c:choose>
					                                <td>${ em.emTitle }</td>
					                                <td width="15%">${ em.emEnrollDate }</td>
					                            </tr>
											
											</c:when>
											
											<c:when test='${ em.emCheck eq "emailTo" }'>
												 <tr class="email-to-list">
					                                <input type="hidden" id="email-address" value="${ loginUser.email }">
					                                <input type="hidden" id="email-rec-no" value="${ em.emRecNo }">
					                                <input type="hidden" id="email-read" value="${ em.emRead }">
					                                
					                                <th width="4%" class="icon"><input type="checkbox" name="emRecNo" value="${ em.emRecNo }"></th> <!-- th로 해야 체크 할때 메일 상세화면으로 이동안됨 -->
					                                <td width="4%" class="icon"><i class="fa fa-box-open"></i></td>
					                                <c:choose>
					                                	<c:when test='${ em.emInp == "Y" }'>
					                                		<td width="4%" class="icon"><i class="fa fa-star"></i></td>
					                                	</c:when>
					                                	<c:otherwise>
					                                		<td width="4%" class="icon-none"><i class="fa fa-star"></i></td>
					                                	</c:otherwise>
					                                </c:choose>            
					                                <c:choose>
					                                	<c:when test='${ em.emRead == "Y" }'>
					                                		<td width="4%" class="icon-none"><i class="fa fa-envelope-open"></i></td>
					                                	</c:when>
					                                	<c:otherwise>
					                                		<td width="4%" class="icon"><i class="fa fa-envelope"></i></td>
					                                	</c:otherwise>                      
					                                </c:choose>
					                                <td width="15%">${ em.emFrom }</td>
					                                <c:choose>
					                                	<c:when test="${ em.att gt 0 }">
					                               			<td width="4%" class="icon"><i class="fa fa-download"></i></td>
					                                	</c:when>
					                                	<c:otherwise>
					                                		<td width="4%" class="icon-none"><i class="fa fa-download"></i></td>
					                                	</c:otherwise>
					                                </c:choose>
					                                <td>${ em.emTitle }</td>
					                                <td width="15%">${ em.emEnrollDate }</td>
					                            </tr>
											</c:when>
										
										</c:choose>
									
			                            
		                           </c:forEach>
		
		                        </tbody>
		                    </table>
		                </form>
	                	<c:choose>
		                	<c:when test="${ empty condition }">
				                <div class="paging">
				                <hr>
				                	<c:if test="${ pi.currentPage ne 1 }">
				                    	<a href="listDelete.em?currentPage=${ pi.currentPage - 1 }&email=${ loginUser.email }"><i class="fa fa-angle-double-left"></i></a>
				                    </c:if>
				                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
										<c:choose>
					                    	<c:when test='${ pi.currentPage == p }'>
					                    		<a id="current-page">${ p }</a>
					                    	</c:when>
					                    	<c:otherwise>
					                    		<a href="listDelete.em?currentPage=${ p }&email=${ loginUser.email }">${ p }</a>
					                    	</c:otherwise>
										</c:choose>
				                    </c:forEach>
				                    <c:if test="${ pi.currentPage ne pi.maxPage }">
				                    	<a href="listDelete.em?currentPage=${ pi.currentPage + 1 }&email=${ loginUser.email }"><i class="fa fa-angle-double-right"></i></a>
				                    </c:if>
				                </div>
		                	</c:when>
	                	</c:choose>
                	</c:otherwise>
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
                $("input[name=emNo]").prop("checked",true);
                $("input[name=emRecNo]").prop("checked",true);                
            }else{
                $("input[name=emNo]").prop("checked",false);
                $("input[name=emRecNo]").prop("checked",false);
                // 전체선택 체크박스 체크 해제시 버튼 비활성화
                $(".submit_btn button").css({"color":"gray"}).prop("disabled",true);
            }
        })
    })

    // 체크박스가 체크되면 버튼 활성화 되게 만들기 
    $('.em_content_center input[type="checkbox"]').click(function(){
        var tmpp = $(this).prop('checked');
        var tt=$("[name='emNo']:checked").length;
        var tt2=$("[name='emRecNo']:checked").length;        
        // 하나라도 체크되어있을 때 버튼 활성화 시키기 위해 length로 체크된 값의 개수를 구함
        
        if(tmpp==true || tt>0 || tt2>0){
            // 버튼 활성화
            $(".submit_btn button").css({"color":"rgb(80, 150, 255)"}).prop("disabled",false);
        }
        else{
            // 버튼 비활성화
            $(".submit_btn button").css({"color":"gray"}).prop("disabled",true);
        }
    });
    </script>

    <!-- 복원 / 영구삭제 클릭시 action -->
    <script>
        function btn_click(str){                          
            if(str=="restore"){   // 메일 복원
            	if(confirm("선택한 이메일을 복원하시겠습니까?") == true){
	                form_mail.action="restoreList.em";
            	}
            }else if(str=="remove"){
             	if(confirm("선택한 이메일을 완전히 삭제하시겠습니까? 삭제시 복원할 수 없습니다.") == true){
            		form_mail.action="removeList.em";
            	}
            }
        }  
    </script>
    
    
	<!-- 보낸메일 상세페이지 가기 -->
	<script>
		$(function(){
			$("#emailListTable tbody .email-from-list td").click(function(){
				alert("이메일을 확인하시려면 복원을 해주세요!");
			})
		})
	</script>
	
	<!-- 받은메일 상세페이지 가기 -->
	<script>
		$(function(){
			$("#emailListTable tbody .email-to-list td").click(function(){
				alert("이메일을 확인하시려면 복원을 해주세요!");
			})
		})
	</script>
</body>
</html>