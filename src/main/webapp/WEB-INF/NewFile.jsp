<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%  
         String path = request.getContextPath();  
     %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<!-- 引入Jquery -->  
     <script type="text/javascript"   src="<%=path%>/easyui/jquery.min.js" ></script>  
     <!-- 引入Jquery_easyui -->  
     <script type="text/javascript"   src="<%=path%>/easyui/jquery.easyui.min.js" ></script>  
     <!-- 引入easyUi国际化--中文 -->  
     <script type="text/javascript"   src="<%=path%>/easyui/locale/easyui-lang-zh_CN.js"></script>  
     <!-- 引入easyUi默认的CSS格式--蓝色 -->  
     <link rel="stylesheet" type="text/css"   href="<%=path%>/easyui/themes/default/easyui.css" />  
     <!-- 引入easyUi小图标 -->  
     <link rel="stylesheet" type="text/css"   href="<%=path%>/easyui/themes/icon.css" />  

</head>
<body>
<h1>path =<%=request.getContextPath() %> </h1>
<div style="height: 500px"></div>
	<div id="login" class="easyui-dialog" title="登录界面" data-options="closable:false" style="width: 300px; height: 200px">
		<form action="" method="post" id="form1">
			<table align="center">
				<tr>
					<td>登录名称:</td>
					<td><input type="text" class="easyui-validatebox" id="usernumber" name="usernumber" data-options="required:true"></td>
				</tr>
				<tr>
					<td>登录密码:</td>
					<td><input type="password" class="easyui-validatebox" id="password" name="password" data-options="required:true"></td>
				</tr>
				<tr align="center">
					<td>登录身份:</td>
					<td><select id="identity" class="easyui-combobox" data-options="panelHeight:80" style="width: 150px">
						<option>==请选择登录身份==</option>
						<option value="m">管理员登录</option>
						<option value="t">教师登录</option>
						<option value="s">学生登录</option>
					</select></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<a id="btn1" href="#" class="easyui-linkbutton">&nbsp;&nbsp;&nbsp;登录&nbsp;&nbsp;&nbsp;</a>
					<a id="btn2" href="#" class="easyui-linkbutton">&nbsp;&nbsp;&nbsp;取消&nbsp;&nbsp;&nbsp;</a></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>