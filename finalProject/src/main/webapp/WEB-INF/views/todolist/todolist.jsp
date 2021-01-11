<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	body {
	  margin: 0;
	  min-width: 250px;
	}
	.wrapdiv {
	  box-sizing: border-box;
	  width: 400px;
	  height: 250px;
	  position: absolute;
	  margin-left:200px;
      border: 2px solid  rgba(247, 200, 47, 0.836);
	  border-radius: 15px;
	}
	ul {
	  margin: 0;
	  padding: 0;
	}
	ul li {
	  cursor: pointer;
	  position: relative;
	  padding: 8px 8px 8px 20px;
	  list-style-type: none;
	  background: #eee;
	  font-size: 14px;
	  transition: 0.2s;
	  border-radius: 5px;
	  /* make the list items unselectable */
	  -webkit-user-select: none;
	  -moz-user-select: none;
	  -ms-user-select: none;
	  user-select: none;
	}
	ul li:nth-child(odd) {
	  background: #f9f9f9;
	}
	/* Darker background-color on hover */
	ul li:hover {
	  background: #ddd;
	}
	/* When clicked on, add a background color and strike out text */
	ul li.checked {
	  background: #888;
	  color: #fff;
	  text-decoration: line-through;
	}
	/* Add a "checked" mark when clicked on */
	ul li.checked::before {
	  content: '';
	  position: absolute;
	  border-color: #fff;
	  border-style: solid;
	  border-width: 0 2px 2px 0;
	  
	  top: 10px;
	  left: 16px;
	  transform: rotate(45deg);
	  height: 15px;
	  width: 7px;
	}
	/* Style the close button */
	.close {
	  position: absolute;
	  right: 0;
	  top: 0;
	  padding: 8px 16px 8px 16px;
	}
	.close:hover {
	  color: white;
	}
	/* Style the header */
	.header {
	  width: 100%;
   	  height: 100px;  
      padding: 10px 20px;
      padding-right:0px;
	}
	/* Clear floats after the header */
	.header:after {
	  content: "";
	  display: table;
	  clear: both;
	}
	/* Style the input */
	input {
	  margin: 0;
	  border: 1px solid #bbb;
	  border-radius: 5px;
	  width: 85%;
	  padding: 7px;
	  float: left;
	  font-size: 14px;
	}
	/* Style the "Add" button */
	.addBtn {
	  padding: 8px;
	  background: #d9d9d9;
	  color: #555;
	  float: left;
	  text-align: center;
	  font-size: 14px;
	  cursor: pointer;
	  transition: 0.3s;
	  border-radius: 5px;
	}
	.addBtn:hover {
	  background-color: #bbb;
	}
	.box{
	   	width: 96%;
	    padding-left: 20px;
	}
</style>
<body>

    <div class="wrapdiv">
    		<pre align="right">All elements are deleted the next day.</pre>
        <div id="myDIV" class="header">
            <h3 style="margin:5px">To Do List</h3>
            <input type="text" id="myInput" placeholder="내용 입력">
            <span onclick="newElement();" class="addBtn">추가</span>
        </div>
        <div class="box">
            <ul id="myUL">
            </ul>
        </div>
            
    </div>
        
    <script>
    	$(function(){
    		
    		var cookie = document.cookie.split(';');
    		
    		for(var i in cookie){
    			var name = '${loginUser.memName}';
    			var index = cookie[i].search('=');
    			if(cookie[i].search(name) != -1){
    				insertLi(cookie[i].substr(index+1));
    			}
    		}
    		
    		// Click on a close button to hide the current list item
            var close = document.getElementsByClassName("close");
            var i;
            for (i = 0; i < close.length; i++) {
            	$(document).on('click','.close', function(){
                	var div = this.parentElement;	// li태그
                    var txt = (div.textContent).replace('\u00D7', '');	// li태그안의 값
                    var index = $(this).parent().index();	// li태그 인덱스
                    div.remove();
                    delCookie(index+1, txt);	// 쿠키삭제
            		
            	})
            }
    		
    	})
    	function insertLi(str){
    		
	   		var value = '<li>'+ str + '<span class="close">\u00D7</span></li>'			
	   		document.getElementById("myUL").innerHTML += value;
    		
    	}
    	
    	// 쿠키 생성
    	function setCookie(cname, cvalue){
		    var setCookie = '';
		    var date = new Date();
		    date.setDate(date.getDate()+1);
		    
		    setCookie += '${loginUser.memName}['+ cname + ']='+ cvalue+ ';';
		    setCookie += 'expires = '+ date.toUTCString();

		    document.cookie = setCookie;
    	}
    	
    	// 쿠키 삭제
    	function delCookie(cname, cvalue){
    		var date = new Date();
    			date.setDate(date.getDate()-1);
    		
    		var cookie = document.cookie.split(';');
    		
    		for(var i=0; i<cookie.length; i++){
    			var index = cookie[i].search("=");	// 쿠키 밸류값 구하기
    			var str = cookie[i].substr(index+1);
    			if(str == cvalue){	// 쿠키 밸류값과 매개변수값과 같으면 삭제
    	    		var currentCookie = cookie[i] + ';';
    	    			currentCookie += 'expires = '+ date.toUTCString();
    	    		document.cookie = currentCookie;
    			}
    		}
    	}
	    
	    
        // Create a "close" button and append it to each list item
        var myNodelist = document.getElementById('myUL').children;
        var i;
        for (i = 0; i < myNodelist.length; i++) {
            var span = document.createElement("SPAN");
            var txt = document.createTextNode("\u00D7");
            span.className = "close";
            span.appendChild(txt);
            myNodelist[i].appendChild(span);
        }

        

        // Add a "checked" symbol when clicking on a list item
        $(document).on('click','#myUL', function(ev){
        	if (ev.target.tagName === 'LI') {
                ev.target.classList.toggle('checked');
            }
        })

        // Create a new list item when clicking on the "Add" button
        function newElement() {
            var li = document.createElement("li");
            var inputValue = document.getElementById("myInput").value;
            var t = document.createTextNode(inputValue);
            li.appendChild(t);
            
            var liLen = document.getElementById("myUL").children.length;
            if(liLen>=3){
                alert('더이상 추가할 수 없습니다.');
            }else{
                if (inputValue === '') {
                    alert("내용을 입력해주세요.");
                }else{
                    document.getElementById("myUL").appendChild(li);
                    setCookie(liLen+1, inputValue);	// 쿠키생성
                }
            }

            document.getElementById("myInput").value = "";
            
            var span = document.createElement("SPAN");
            var txt = document.createTextNode("\u00D7");
            span.className = "close";
            span.appendChild(txt);
            li.appendChild(span);
            
            for (var i = 0; i < close.length; i++) {
            	$(document).on('click','.close', function(){
                	var div = this.parentElement;	// li태그
                    var txt = (div.textContent).replace('\u00D7', '');	// li태그안의 값
                    var index = $(this).parent().index();	// li태그 인덱스
                    div.remove();
                    delCookie(index+1, txt);	// 쿠키삭제
            	})
            }
    }
    </script>
	
</body>
</html>