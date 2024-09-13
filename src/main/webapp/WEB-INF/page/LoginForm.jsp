<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/index.css' />">
</head>
<body>
<div class="wrapper">
        <div class="logo">
            <img src="<c:url value='/images/emp.png' />">
        </div>
        <div class="text-center mt-4 name">
          LOGIN
        </div>
        <form action="LoginForm" method="post" class="p-3 mt-3">
            <div class="form-field d-flex align-items-center">
                <span class="far fa-user"></span>
                <input type="text" name="name" id="userName" placeholder="Username" autocomplete="off">
            </div>
             <p id="p" style="color:red; font-size:12px;">${error}</p>
            <div class="form-field d-flex align-items-center">
                <span class="fas fa-key"></span>
                <input type="password" name="password" id="pwd" placeholder="Password">
            </div>
            <button id="btn" class="btn mt-3">Login</button>
        </form>
        <div class="text-center fs-6">
            <a href="#">Forget password?</a> or <a href="loadUserForm">Sign up</a>
        </div>
    </div>
     <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
     <script type="text/javascript">
//      $(document).ready(function(){
//      		$("#p").text("");
//      	})
     	
//      	$("#btn").click(function(){
//      		$("#p").add();
//      	})
     </script>
</body>
</html>