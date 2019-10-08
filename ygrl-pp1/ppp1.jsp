
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title></title>
		
	<%@include file="/commons/easyui.jsp"%>
		
		
		<style>
			.easyui-accordion ul{
				list-style: none;
				margin: 5px 0px 55px 0px;
				padding: 0px;
				text-align: center;
			}
			.easyui-accordion ul>li>a{
				display: block;
				padding: 5px;
			}
			
			
		</style>
	</head>
	<body class="easyui-layout">
	<!-- 	<div data-options="region:'north'" style="height: 80px;">Logo还没有画</div> -->
		<div data-options="region:'south',split:true" style="height: 50px;"></div>
		<!--<div data-options="region:'east',title:'通知',collapsed:true" style="width: 20%;"></div>-->
		<div data-options="region:'west',title:'菜单',split:true" style="width: 12%;">

		
		
		
		
			<div class="easyui-accordion" style="margin: 0px;height: 100%;">
		
				<div data-options="title:'用户操作'">
					<ul>
						
						<li><a class="easyui-linkbutton" style="height: 30px;" href="#"> <i class="fa fa-user-circle"></i> 修改状态</a></li>
						
					</ul>
				</div>
	
		
		
			</div>
		</div>
		
		<div data-options="region:'center',title:'主页         欢迎：${sessionScope.user.username }登入系统'">
	
			<div id="tt" >
			</div>		
				
		</div>
		
		<script type="text/javascript">
			/*初始化tabs*/
			$("#tt").tabs();
			
			/*菜单事件*/
			
			$(".easyui-accordion ul>li>a").on('click',function(){
				console.log($(this).text());
				console.log($("#cuowujiemian1").val());
				switch($(this).text().trim()){

				
						
	
					case '修改状态':
						$("#tt").tabs('close',0);
							$("#tt").tabs('add',{
								index:0,
								title:'修改状态',
								href:"${pageContext.request.contextPath}/erjiliandong.jsp",
								closable:true,
								
							});
						
					break;
				
				
			
			
	
						
				
						
						
						

				}
			});
			
			

			
			
			
			
			
		</script>
	</body>
</html>
