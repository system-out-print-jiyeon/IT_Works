<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
        background: rgb(253, 253, 253)
    }
    .datawrap{
        height: 80%;
        width: 80%;
        margin: auto;
        margin-top: 50px;
        border: 3px solid rgb(220, 220, 220);
        background:white;
    }
    .tablewrap{
        height:10%;
        margin: auto;
        width: 100%;
        margin-top: 0px;
        margin-bottom: 30px;
        
    }
    #table1>thead>tr>th{font-size: 12px; padding-left: 10px; font-weight: 100; border-bottom: 2px solid rgb(220, 220, 220);}
    #table1>tbody>tr>td{font-size: 12px; padding-left: 10px; font-weight: 600; }
    #title{height:5%; font-size: 20px; font-weight: 600; border-bottom: 2px solid rgb(220, 220, 220); padding-left: 10px;}
    
    #content{height:67%; font-size: 15px; padding-left: 10px; border-bottom: 2px solid rgb(220, 220, 220); }
    #attach{height: 5%; font-size: 14px; padding-right: 30px;}
    #attach>a{line-height: 30px;}
    div>span{padding-left: 20px;}
</style>
<body>
	<jsp:include page="support_sidebar.jsp"/>
    <div class="wrap">
        <h4>업무협업</h4>
        <div class="datawrap">
            <div class="tablewrap">
                <table id="table1" border="0" bordercolor="lightgray">
                    <thead>
                        <tr>
                            <th width="150">카테고리</th>
                            <th width="120">발신부서</th>
                            <th width="160">요청시작일</th>
                            <th width="160">요청종료일</th>
                            <th width="100">등록일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>${ws.category}</td>
                            <td>${ws.mem.deptName}팀</td>
                            <td>${ws.startDate}</td>
                            <td>${ws.endDate}</td>
                            <td>${ws.createDate}</td>
                        </tr>
                    </tbody>
                </table>    
            </div>
            <div id="title">
                	${ws.supportTitle}
            </div>
            
            <div id="attach" align="right">
            	<c:if test="${ws.attach.originName ne null}">
	                <a href="${ws.attach.filePath}${ws.attach.changeName} " 
	                	download="${ws.attach.originName}">${ws.attach.originName}</a>
            	</c:if>
            </div>
            <div id="content">
                <p style="height: 100%">
                    	${ws.supportContent}
                </p>
            </div>
            <div align="right" style="width: 98%; margin-top:10px">
            	<c:if test="${loginUser.memNo eq ws.memNo}">
	                <button type="button" class="btn btn-info btn-sm" onclick="postForm(1);">수정</button>
	                <button type="button" class="btn btn-danger btn-sm" onclick="postForm(2);">삭제</button>
            	</c:if>
                <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='list.sp';">목록</button>
            </div>
            
            <form action="" method="post" id="postForm">
            	<input type="hidden" name="sno" value="${ws.supportNo}">
            </form>
            
            <script type="text/javascript">
            	function postForm(num){
            		if(num == 1){
            			document.getElementById('postForm').action = "updateForm.sp";
            		}else{
            			if(confirm("정말 삭제하시겠습니까?")){
	            			document.getElementById('postForm').action = "delete.sp";
            			}
            		}
            		document.getElementById('postForm').submit();
            	}
            </script>
        </div>
    </div>
</body>
</html>