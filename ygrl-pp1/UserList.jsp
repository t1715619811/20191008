<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>EasyUI示例</title>
<%@include file="/commons/easyui.jsp"%>

<style>
	#dialog_user_add td{
		border:1px dotted gray;
		width:700px;
		hight:600px;
	}
</style>
</head>

<body>




	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~添加user的dialog~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<div id="dialog_user_add" align='center' >
		<form id="form_user_add" action="${pageContext.request.contextPath }/user/update" method="post">
			<table>
				<tr>
					<td>原密码</td>
					<td><input type="text" name="username1" id="username1" /></td>
				</tr>
				<tr>
					<td>新密码</td>
					<td><input type="text" name="password1" id="password1" /></td>
				</tr>
				<tr>
					<td>再输一次新密码</td>
					<td><input type="text" name="password11" id="password11" /></td>
				</tr>

			</table>
						<td>
						<input id="update" type="submit" class="loginButton" data-options="iconCls:'icon-man'" value="修改">
						</td>
		</form>	
	</div>
	
	
	
	
		
</body>



</html>
