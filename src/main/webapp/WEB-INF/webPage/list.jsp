<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <h2>wlecome  ${list}</h2> --%>

 <c:forEach var="user" items="${list}">
     <tr>
      <td>
       userName=${user.userName}  
       userTel=${user.userTel}
       userSex=${user.userSex}<br/>
      </td>
     </tr>
    </c:forEach>
</body>
</html>