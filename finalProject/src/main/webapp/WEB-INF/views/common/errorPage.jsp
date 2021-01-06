<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@300&display=swap" rel="stylesheet">
<style>
	h1{
		font-weight:bold; 
		font-size:30px;
		color: rgb(57, 146, 230);
		font-family: 'Noto Serif KR', serif;
	}
</style>
</head>
<body>


    <br>
    <div align="center">	
        <img src="https://cdn2.iconfinder.com/data/icons/file-extenstions/63/ERROR-512.png" width="400">

        <h1 style="">${ errorMsg }</h1>
    </div>
    <br>
    
    
</body>
</html>