<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
<style>
.Addboard{
    width: 100%;
    padding: 10px;
    margin: 20px;
    height: 100%;
}

#departboard{width: 1000px; height: 600px; font-size: 20px;}
.button_2{
    margin-top: 200px;
    padding-left: 300px; 
    margin-top: 300px;
}

</style>
<body>
	    <div class="Addboard">
        <h1>게시판 추가</h1>
        <div class="depboard">
            <table id="departboard">
                <tr>
                    <th>부서 게시판</th>   
                    <td>
                        <select name="select" id="departmentTim">
                            <option value="부서선택">부서 선택</option>
                            <option value="지원팀">지원팀</option>
                            <option value="기획팀">기획팀</option>
                            <option value="개발팀">개발팀</option>
                            <option value="인사팀">인사팀</option>
                            <option value="총무팀">총무팀</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>게시판명</th>
                    <td><input type="text" name="title" style="width: 800px;"></td>
                </tr>
                <tr>
                    <th>설명</th>
                    <td><input type="text" name="explanation" style="width: 800px; height: 300px;"> </td>
                </tr>
                <tr>
                    <th>댓글</th>
                    <td>
                        <input type="radio" id="allowed" name="allow" value="허용">
                            <label for="allowed">허용</label> &nbsp;
                        <input type="radio" id="notAllowed" name="allow" value="비허용">
                            <label for="notAllowed">허용하지 않음</label>
                    </td> 
                </tr>
                
            </table>
        
            <div class="button_2" align="right">
                <button type="button" class="btn btn-info btn btn-primary btn-lg">만들기</button>
                <button type="button" class="btn btn btn-lg">취소</button>
            </div>
        </div>           
    </div>   
</body>
</html>