<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<title>登录界面</title>  
</head>  
<body>  
<form action="userLogin.do" method="post">  
<input type="hidden" name="categoryId" value="1" />  
  
  
<div class="login">  
  <div class="loginleft">  
     <p class="logotext">MySpringMVC登录界面</p>  
   </div>  
   <div class="loginright">  
     <p class="loginrighttit">用户登录</p>  
     <ul>  
       <li><p>用&nbsp;&nbsp;户&nbsp;&nbsp;名:</p> <input name="userName" id="userName" type="text"/>  
       </li>  
       <li><p>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:</p> <input name="loginPassword" id="loginPassword" type="password"/>  
       </li>  
</ul>  
     <p><input name="" type="submit" value="登&nbsp;&nbsp;录" class="loginrightbutton" /></p>  
   </div>   
</div>  
</form>  
</body>  
</html>  