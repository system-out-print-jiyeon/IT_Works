<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="../common/navbar.css"> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Amiri:wght@700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>
    div{border: 0px solid rgb(89, 89, 89); box-sizing: border-box;}
    .wrap{
        padding-top: 50px;
        margin:auto; 
        width: 800px;
        height: 800px;
    }
    .tablewrap{width: 80%; height: 80%; margin: auto; margin-top: 50px;}
    .tablewrap table{width: 100%; height: 100%; margin-bottom: 30px;}
    #table1>tbody>tr>th{text-align: center; font-size: 13px;}
    #table1>tbody>tr>td{padding-left: 10px; font-size: 13px;}
    #table1>tbody>tr label{margin-right: 20px; margin-top: 8px;}
    #table1>tbody>tr input{margin-right: 5px;}
</style>
</head>
<body>
	<jsp:include page="support_sidebar.jsp"/>
    <div class="wrap">
        <h4>업무협업</h4>
        <div class="tablewrap">
            <form action="update.sp" method="POST" enctype="multipart/form-data">
                <table id="table1" border="1" bordercolor="lightgray">
                    <tbody>
                    	
                        <tr>
                            <th width="100">카테고리</th>
                            <td>
                                <label for="claim">
                                    <input type="radio" name="category" id="claim" value="클레임" required> 클레임(조치사항)
                                </label>
                                <label for="workHelp">
                                    <input type="radio" name="category" id="workHelp" value="업무요청"> 업무요청
                                </label>
                                <label for="notice">
                                    <input type="radio" name="category" id="notice" value="회사내지침"> 회사내지침
                                </label>
                                <label for="meetingPaper">
                                    <input type="radio" name="category" id="meetingPaper" value="회의록"> 회의록
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <th>수신부서</th>
                            <td>
                                <label for="all">
                                    <input type="checkbox" id="all"> 모든부서
                                </label>
                                <label for="manager">
                                    <input type="checkbox" name="rdCode" id="manager" value="D5" required> 총무팀
                                </label>
                                <label for="human">
                                    <input type="checkbox"  name="rdCode" id="human" value="D2"> 인사팀
                                </label>
                                <label for="planning">
                                    <input type="checkbox" name="rdCode" id="planning" value="D4"> 기획팀
                                </label>
                                <label for="support">
                                    <input type="checkbox" name="rdCode" id="support" value="D3"> 경영지원팀
                                </label>
                                <label for="develop">
                                    <input type="checkbox" name="rdCode" id="develop" value="D1"> 개발팀
                                </label>
                            </td>
                        </tr>
                        <script>
                            $(function(){
                                $("#all").click(function(){
                                    if($(this).prop("checked")){
                                        $(":checkbox").prop("checked", true);
                                    }else{
                                        $(":checkbox").prop("checked", false);
                                    }
                                })
                                
                            });
                        </script>
                        <tr>
                            <th>요청시작일</th>
                            <td><input type="date" name="startDate" id="" class="form-control" value="${ws.startDate}" required></td>
                        </tr>
                        <tr>
                            <th>요청종료일</th>
                            <td><input type="date" name="endDate" id="" class="form-control" value="${ws.endDate}" required></td>
                        </tr>
                        <tr>
                            <th>제목</th>
                            <td><input type="text" name="supportTitle" id="" class="form-control" value="${ws.supportTitle}" required></td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td>
                                <textarea name="supportContent" class="form-control" rows="8" style="resize: none;" required>
                                	${ws.supportContent}
                                </textarea>
                            </td>
                        </tr>
                        <tr>
                            <th>첨부파일</th>
                            <td>
                                <c:if test="${ws.attach.originName ne null}">
					                <a id="attachFile" href="${ws.attach.filePath}${ws.attach.changeName} " 
					                	download="${ws.attach.originName}">${ws.attach.originName}</a>
					                <button type="button" class="btn btn-default btn-sm" onclick="deleteFile();"><strong>삭제</strong></button>	
				            	</c:if>
                                <input type="file" class="form-control-file border" name="reupfile">
                            </td>
                        </tr>
                </tbody>
            </table>
            <div align="right">
            	<input type="hidden" name="supportNo" value="${ws.supportNo}">
                <button type="submit" class="btn btn-info btn-sm">수정</button>
                <button type="reset" class="btn btn-secondary btn-sm" onclick="location.href='list.sp';">이전</button>
            </div>
        </form>
        </div>
    </div>
    
    <script type="text/javascript">
    	function deleteFile(){
    		$.ajax({
    			url: "deleteAttach.sp",
    			type: "post",
    			data: {supportNo : "${ws.supportNo}"},
    			success: function(result){
    				if(result>0){
    					$("#attachFile").removeAttr('href');
    					$("#attachFile").text('');
    					$(".btn-default").css('display', 'none');
    				}else{
	    				console.log("파일삭제실패");
    				}
    			},error: function(){
    				console.log("실패");
    			}
    		})
    	}
    </script>
</body>
</html>