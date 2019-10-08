<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8"%>
<html >
<head>

	<title>PICC工作客户端</title>

<%@include file="/commons/easyui.jsp"%>

</head>
<body>

		<div class="login">
			<form id="loginForm" method="post" >
				<table >
					<tbody >
					<tr>
					
					<td><span style="font-size:20px;color:green;" >PICC信息部客户端</span></td>
					</tr>
						<tr>
							<td width="190" rowspan="2" align="center" valign="bottom">
								<img src="${pageContext.request.contextPath }/img/renbao_1.png">
							</td>
							<th>
								用户名:
							</th>
							<td>
								<input class="easyui-validatebox" type="text" name="username" data-options="required:true" id="username">
							</td>
					  </tr>
					  <tr>
							<th>
								密&nbsp;&nbsp;&nbsp;码:
							</th>
							<td>
								<input class="easyui-validatebox" type="password" maxlength="6" name="password" data-options="required:true,validType:'maxLength[6]'" id="password">
							</td>
					  </tr>

						<tr>
							<td>&nbsp;</td>
							<th>验证码:</th>
							<td id="tianjia">
								<input type="text" id="enCode" name="enCode" class="easyui-validatebox" size="8px" data-options="required:true,validType:'maxLength[6]'">
								<img id="captchaImage" class="captchaImage" src="${pageContext.request.contextPath}/user/captcha" title="点击更换验证码">
							
							</td>
						</tr>
					<tr>
						<td>&nbsp;</td>
						<th><span id="messspan" style="color: red"></span></th>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<th>&nbsp;</th>
						<td>
							<input type="button" class="homeButton"><input id="regist" type="button" class="loginButton" data-options="iconCls:'icon-man'" value="注册">
						</td>
						
					</tr>
		
				</tbody></table>
		
			</form>	
		</div>	
		
		
		<script type="text/javascript">
		

		$(function(){


				//网页加载完毕之后
				//绑定时间: jq的对象.on("事件名称",事件触发后的函数)
				$("#regist").on("click",function(){
					//发送ajax请求，验证登录。


	                var name = $("#username").val();
					var pwd = $("#password").val();
					var enCode=$("#enCode").val();
					
console.log("呵呵");

				if(name==null||pwd==null||enCode==null||name==""||pwd==""||enCode==""){

						$.messager.show({
							title:"提示",
							msg:"请把信息补全",
						});

}
if(name!=null&&pwd!=null&&enCode!=null&&name!=""&&pwd!=""&&enCode!=""){
var param="username="+name+"&password="+pwd+"&enCode="+enCode;
							$.ajax({
					url:"${pageContext.request.contextPath}/user/regist",
					type:"post",
					data:param,
					dataType:"json",
					success:function(json){
						console.log(json);
						//1. 重新加载当前页面的信息。
						//2. 提示信息。
						
										if(json.code==200){
													
								$.messager.show({
							title:"提示",
							msg:json.msg,
						});
										
					location.href="${pageContext.request.contextPath}/login.jsp";
					
				}
				
														if(json.code==400){
			
			
								$.messager.show({
							title:"提示",
							msg:json.msg,
						});
				}
				
				
					}
				});}
				

				
				});		
				
			});		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		



$("#captchaImage").on("click",function(){						
var src=$(this).attr("src");

var date=new Date().getTime();				
			
					src=$(this).attr("src",src+"?time="+date);
				
				});




		</script>
		
		
	
		
		
</body>
</html>