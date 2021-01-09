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

<style>
.search-wrap{
	border:2px solid gray;
	padding:10px;
	border-radius:10px;
}
.imp-label {
	font-size:22px;
	color:lightgray;
}
#imp{
display:none;
}
.search-wrap .search-icon:hover{
	animation-name:search;
    animation-duration:0.3s;
    animation-fill-mode:both;
    animation-direction: alternate;
}
@keyframes search{
    100%{
        color:rgb(93, 158, 255);
    }
}
.search-wrap select{
	border:none;
}
#keyword{
	border:none; 
	width:200px; 
	height:35px; 
}

</style>
</head>
<!-- 전체메일 / 보낸메일 / 받은메일 / 중요메일 -->
<body>
	<form action="emailSearch.em">
		<span class="search-wrap">
			<input type="hidden" name="email" value="${ loginUser.email }">
			<label for="imp" id="imp-label" class="imp-label" onclick="impclick();" ><i class="fa fa-star" id="imp-icon"></i></label>
			<input id="imp" type="checkbox" value="imp" name="imp">
			<select name="range">
				<option value="all">전체메일</option>
				<option value="from">보낸메일</option>
				<option value="to">받은메일</option>
			</select>
			<select name="condition" id="condition">
				<option value="title">제목</option>
				<option value="content">내용</option>
				<option value="date">날짜</option>
			</select>
			<input type="text" id="keyword" name="keyword" maxLength="8">
			<button type="submit"><i class="fa fa-search search-icon"></i></button>
		</span>
	</form>
	<br>
</body>

<script>
	$(document).ready(function(){
		$('#condition').on('change',function(){
			
			if((this.value) == 'date'){
				$('#keyword').prop('type', 'date');
			}else if((this.value) == 'title'){
				$('#keyword').prop('type', 'text');
			}else{
				$('#keyword').prop('type', 'text');
			}
		})
	})
</script>

<script>
	function impclick(){
		if($('#imp').is(":checked") == false){
			$('#imp-label').css("color", "rgb(93, 158, 255)");
			
		}else{
			$('#imp-label').css("color", "lightgray");
		}
	}
</script>

</html>