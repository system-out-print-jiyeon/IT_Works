<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<style>
#pagingArea{
    width:fit-content;
    margin:auto; 
    font-size: 20px;
}

.Departmentboard{
    width: 100%; 
    height:100%;
    margin: 30px}




#boardList{
    width: 100%;
    background:white;
    height: 500px;
    margin-top: 90px;
}
th{
    background: lightgray;
    text-align: center;

}
td{
    font-size: 16px;
    text-align: center;
    padding : 15px 8px 8px 8px!important;
    height: 50px;
}
#boardList>tbody>tr:hover{cursor:pointer;}


</style>
<body>
	         <div class="Departmentboard">
            <h1>부서 게시판</h1> 
                
            <div class="tablelist">
                <table id="boardList" class="table">
                    <thead>
                        <tr>                               
                            <th>부서명</th>
                            <th>게시판</th>
                            <th>부서원</th>
                            <th>게시글 수</th>
                            <th>개설일</th>
                        </tr>
                    </thead>
                    <tbody align="center">
                        <tr>                                                              
                            <td>부서/OO팀</td>
                            <td>OO게시판</td>
                            <td>OOO 사원</td>
                            <td>0</td>
                            <td>2020-12-14(월) 15:15</td>
                        </tr>
                        <tr>                                                              
                            <td>부서/OO팀</td>
                            <td>OO게시판</td>
                            <td>OOO 사원</td>
                            <td>0</td>
                            <td>2020-12-14(월) 15:15</td>
                        </tr>
                        <tr>                                                              
                            <td>부서/OO팀</td>
                            <td>OO게시판</td>
                            <td>OOO 사원</td>
                            <td>0</td>
                            <td>2020-12-14(월) 15:15</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
                   
            <br><br><br><br>
            <div id="pagingArea">
                <ul class="pagination">
                    <li class="page-item disabled"><a class="page-link" href="#"><</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">></a></li>
                </ul>
            </div>
                
            </div>   
    </div>
             
</body>
</html>