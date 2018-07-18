<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%  
         String path = request.getContextPath();  
     %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<!-- 引入Jquery -->
<script type="text/javascript" src="<%=path%>/easyui/jquery.min.js"></script>
<!-- 引入Jquery_easyui -->
<script type="text/javascript"
	src="<%=path%>/easyui/jquery.easyui.min.js"></script>
<!-- 引入easyUi国际化--中文 -->
<script type="text/javascript"
	src="<%=path%>/easyui/locale/easyui-lang-zh_CN.js"></script>
<!-- 引入easyUi默认的CSS格式--蓝色 -->
<link rel="stylesheet" type="text/css"
	href="<%=path%>/easyui/themes/default/easyui.css" />
<!-- 引入easyUi小图标 -->
<link rel="stylesheet" type="text/css"
	href="<%=path%>/easyui/themes/icon.css" />
<script type="text/javascript">
	var url;

 	 $(function() {
		//创建老师显示表格
		 $("#dg").datagrid({
			url : '${pageContext.request.contextPath}/user/list',
			toolbar : '#tb',
			fitColumns : true,
			fit : true,
			striped : true,
			nowrap : false,
			pagination : true,
			pagePosition : 'both',
			rownumbers : true,
			columns : [ [ {
				title : '用户Id',
				field : 'userId',
				width : 80,
				checkbox : true
			}, {
				title : '用户名称',
				field : 'userName',
				width : 80,
			}, {
				title : '联系方式',
				field : 'userTel',
				width : 80,
			}, {
				title : '用户性别',
				field : 'userSex',
				width : 80,
			} ] ],

		}) 
		
		//条件查询教师信息
		 $("#searchBut").click(function() {
			$('#dg').datagrid('load', {
				userName : $("#userName").val(),
				userTel : $("#userTel").val()
			});
		})
		//打开添加信息对话框
		$("#addBut").click(function() {
			/* $("#dd").dialog("open").dialog("setTitle", "添加用户信息"); */
			 $("#dd").dialog({
				closed : false,
				buttons : '#btns',
				title : '添加用户信息'
			})
			 url = '${pageContext.request.contextPath}/user/saveOrUpdate';
		})
		//关闭添加信息对话框
		$("#closeBut").click(function() {
			$("#dd").dialog({
				closed : true
			})

		})
		//清空添加信息对话框
		$("#redoBut").click(function() {
			$("#form1").form('clear');
		})
		//保存信息
        $("#saveBut").click(function saveUser() {  
            $("#form1").form("submit", {  
                url : url,  
                onSubmit : function() {  
                    return $(this).form("validate");  
                },  
                success : function(result) {  
                    var result = eval('(' + result + ')');  
                    if (result.success) {  
                        $.messager.alert("系统提示", "保存成功！");  
                        resetValue();  
                        $("#dd").dialog("close");  
                        $("#dg").datagrid("reload");  
                    } else {  
                        $.messager.alert("系统提示", "保存失败！");  
                        return;  
                    }  
                }  
          	});  
        } )
        //打开修改对话框
		$("#editBut").click(function() {
			 var selectedRows = $("#dg").datagrid("getSelections");  
			if (selectedRows.length == 0) {
				$.messager.alert('提示', '请选择要修改的数据', 'info');
			} else if (selectedRows.length > 1) {
				$.messager.alert('提示', '只能选择一条数据进行修改', 'warning');
				$("#dg").datagrid('unselectAll');
			} else {
				$("#dd").dialog({
					closed : false,
					buttons : '#btns',
					title : '修改信息'
				})
				var row = selectedRows[0];
	            $("#form1").form("load", row);
	            //两种方式，第一种是在URL后面加上主键，第二种是在form中天健input id hidden
	             //url = '${pageContext.request.contextPath}/user/saveOrUpdate?userId='+row.userId;
	             url = '${pageContext.request.contextPath}/user/saveOrUpdate';
			}
		})
		
		$("#removeBut").click(function() {  
            var selectedRows = $("#dg").datagrid("getSelections");  
            if (selectedRows.length == 0) {  
            	$.messager.alert('提示', '请选择所要删除的数据', 'info');  
                return;  
            }  
            var strIds = [];  
            for ( var i = 0; i < selectedRows.length; i++) {  
                strIds.push(selectedRows[i].userId);  
            }  
            var ids = strIds.join(",");
            $.messager.confirm("系统提示", "您确定要删除这<font color=red>"  
                    + selectedRows.length + "</font>条数据吗？", function(r) {  
                if (r) {  
                    $.post("${pageContext.request.contextPath}/user/deleteUsers", {  
                        ids : ids  
                    }, function(result) {  
                        if (result.success) {  
                            $.messager.alert("系统提示", "数据已成功删除！");  
                            $("#dg").datagrid("reload");  
                        } else {  
                            $.messager.alert("系统提示", "数据删除失败，请联系系统管理员！");  
                        }  
                    }, "json");  
                }  
            });  
        }) 
		
		
        function resetValue() {  
	            $("#userName").val("");  
	            $("#userTel").val("");  
	            $("#userSex").combobox("setValue", "");  
	        }  
	}) 
</script>
</head>
<body>
	<table id="dg"></table>

	<%-- <table id="dg" title="用户管理" class="easyui-datagrid" fitColumns="true"  
        pagination="true" rownumbers="true"  
        url="${pageContext.request.contextPath}/user/list" fit="true"  
        toolbar="#tb">  
        <thead>  
            <tr>  
                <th field="cb" checkbox="true" align="center"></th>  
                <th field="userId" width="50" align="center">编号</th>  
                <th field="userName" width="50" align="center">用户名</th>  
                <th field="userTel" width="50" align="center">联系电话</th>  
                <th field="userSex" width="50" align="center">角色</th>  
            </tr>  
        </thead>  
    </table> --%>

	<!-- toolbar用户查询 -->

	<div id="tb">

		<table>
			<tr>
				<td>请输入名称</td>
				<td><input type="text" id="userName" /></td>

				<td>请输入电话</td>
				<td><input type="text" id="userTel" /> <a href="#"
					id="searchBut" class="easyui-linkbutton"
					data-options="iconCls:'icon-search',plain:true">查询</a></td>
			</tr>
		</table>

		<a href="#" id="addBut" class="easyui-linkbutton"
			data-options="iconCls:'icon-add',plain:true">添加</a> <a href="#"
			id="editBut" class="easyui-linkbutton"
			data-options="iconCls:'icon-edit',plain:true">修改</a> <a href="#"
			id="removeBut" class="easyui-linkbutton"
			data-options="iconCls:'icon-remove',plain:true">删除</a>
	</div>

	<!-- 管理员添加教师信息
	modal:定义窗口是否带有遮罩效果。默认为true -->

	<div id="dd" class="easyui-dialog"
		data-options="closed:true,closable:false,modal:true"
		style="width: 500px; height: 250px">
		<form id="form1" action="" method="post">
			<table>
				<tr>
					<td>用户名称</td>
					<td><input type="text" name="userName" id="userName"
						class="easyui-validatebox" data-options="required:true"></td>
					<td>用户电话</td>
					<td><input type="text" name="userTel" id="userTel"
						class="easyui-validatebox" data-options="required:true"></td>
				</tr>
				<tr>
					<td>用户性别  <input
						type="hidden" name="userId" id="userId" class="easyui-validatebox"></td>
					<td><select name="userSex" id="userSex" class="easyui-combobox"
						data-options="editable:false,panelHeight:50,required:true"
						style="width: 150px">
							<option value="男">男</option>
							<option value="女">女</option>
					</select></td>
				</tr>
			</table>
		</form>
	</div>

	<div id="btns">
		<a href="#" id="saveBut" class="easyui-linkbutton"
			data-options="iconCls:'icon-save'">保存</a> <a href="#" id="redoBut"
			class="easyui-linkbutton" data-options="iconCls:'icon-redo'">重置</a> <a
			href="#" id="closeBut" class="easyui-linkbutton"
			data-options="iconCls:'icon-close'">关闭</a>

	</div>


	<!-- 	<div id="ed" class="easyui-dialog" title="修改教师信息"
		data-options="closed:true,closable:false,modal:true"
		style="width: 500px; height: 250px">

		<form id="form2" action="" method="post">
			<table>
				<tr>
					<td>教师编号</td>
					<td><input type="text" name="number" id="enumber"
						class="easyui-validatebox" data-options="required:true">
						<input type="hidden" name="id" id="eid"
						class="easyui-validatebox" data-options="required:true">
						</td>
					<td>教师名称</td>
					<td><input type="text" name="name" id="ename"
						class="easyui-validatebox" data-options="required:true"></td>
				</tr>
				<tr>
					<td>教师密码</td>
					<td><input type="text" name="tea_password" id="etea_password"
						class="easyui-validatebox" data-options="required:true"></td>
					<td>教师性别</td>
					<td><select name="sex" id="esex" class="easyui-combobox"
						data-options="editable:false,panelHeight:50,required:true"
						style="width: 150px">
							<option value="男">男</option>
							<option value="女">女</option>
					</select></td>
				</tr>
				<tr>
					<td>出生日期</td>
					<td><input type="text" name="brit" id="ebrit"
						class="easyui-datebox" data-options="required:true"></td>
					<td>电子邮件</td>
					<td><input type="text" name="email" id="eemail"
						class="easyui-validatebox" data-options="validType:'email'"></td>
				</tr>
				<tr>
					<td>教师电话</td>
					<td><input type="text" name="tea_tel" id="etea_tel"
						class="easyui-validatebox" data-options="required:true"></td>
					<td>教师地址</td>
					<td><input type="text" name="addr" id="eaddr"
						class="easyui-validatebox" data-options="required:true"></td>
				</tr>
				<tr>
					<td>教师课程Id</td>
					<td><input type="text" name="tea_courseId" id="etea_courseId"
						class="easyui-validatebox" data-options="required:true"></td>
				</tr>

			</table>
		</form> 
	</div>-->

	<!-- 修改对话框下方按钮  -->
<!-- 	<div id="ebtns">
		<a href="#" id="esaveBut" class="easyui-linkbutton"
			data-options="iconCls:'icon-save'">保存</a> <a href="#" id="eredoBut"
			class="easyui-linkbutton" data-options="iconCls:'icon-redo'">重置</a> <a
			href="#" id="ecloseBut" class="easyui-linkbutton"
			data-options="iconCls:'icon-close'">关闭</a>

	</div> -->


</body>

</html>