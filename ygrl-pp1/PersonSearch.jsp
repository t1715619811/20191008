<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title></title>
		<%@include file="/commons/easyui.jsp"%>
		<style>
			div{
				text-align: center;
			}
		</style>
		<script>
			//定义跟person相关的方法
			var person = {
				init:function(){
					$.ajax({
						url:"${pageContext.request.contextPath}/person/getAll.do",
						data:"pageNum=1&pageSize=5",
						type:"post",
						dataType:"json",
						success:function(page){
							//将json数据绑定在标签上。
							$("#d1").data("page",page);
							//清空tbody
							$("#tb").empty();
							//遍历json中的list属性,并添加在tbody中。
							$.each(page.list,function(i,e){
								var jqtr = person.createRow(e);
								$("#tb").append(jqtr);
							});
						}
					});
				},
				//根据一个person信息创建一个tr
				createRow:function(obj){//传递一个person的json对象，返回一个tr的dom对象。
					return $("<tr><td>"+obj.id+"</td><td>"+obj.name+"</td><td>"+obj.age+"</td><td>"+obj.sex+"</td><td>"+obj.mobile+"</td><td>"+obj.address+"</td><td><a href='#'>删除</a>  <a href='#'>修改</a></td></tr>");
				},
				//上一页
				prevPage:function(){
					console.log("上一页");
					//从d1标签上获得被绑定的值获得绑定的page
					var pageNum = $("#d1").data("page").pageNum-1;
					//如果已经是第一页，就不要发送ajax请求，提示 ，已经是第一页了
					var page = $("#d1").data("page");
					if(page.pageNum<=1){
						toastr.warning("已经是第一页了");
					}else{
						//发送上一页请求
						$.ajax({
							url:"${pageContext.request.contextPath}/person/getAll.do",
							data:"pageNum="+pageNum+"&pageSize=5",
							type:"post",
							dataType:"json",
							success:function(page){
								//将json数据绑定在标签上。
								$("#d1").data("page",page);
								//清空tbody
								$("#tb").empty();
								//遍历json中的list属性,并添加在tbody中。
								$.each(page.list,function(i,e){
									var jqtr = person.createRow(e);
									$("#tb").append(jqtr);
								});
							}
						});
					}
					
						
				},
				//下一页
				nextPage:function(){
					//从d1标签上获得被绑定的值获得绑定的page
					var pageNum = $("#d1").data("page").pageNum+1;
					//如果已经是最后一页，就不发送ajax请求。直接提示，已经是最后一页。
					var page = $("#d1").data("page");
					if(page.count/page.pageSize<page.pageNum){
						toastr.warning("已经是最后一页了");
					}else{
						//发送下一页请求
						$.ajax({
							url:"${pageContext.request.contextPath}/person/getAll.do",
							data:"pageNum="+pageNum+"&pageSize=5",
							type:"post",
							dataType:"json",
							success:function(page){
								//将json数据绑定在标签上。
								$("#d1").data("page",page);
								//清空tbody
								$("#tb").empty();
								//遍历json中的list属性,并添加在tbody中。
								$.each(page.list,function(i,e){
									var jqtr = person.createRow(e);
									$("#tb").append(jqtr);
								});
							}
						});
					}
					
						
				},
				//根据id查询
				getById:function(){
						$.ajax({
							url:"${pageContext.request.contextPath}/person/getById.do",
							type:"get",
							data:"id="+$('#pid').val(), 
							dataType:"json",
							success:function(obj){
								$("#tb").html("<tr><td>"+obj.id+"</td><td>"+obj.name+"</td><td>"+obj.age+"</td><td>"+obj.sex+"</td><td>"+obj.mobile+"</td><td>"+obj.address+"</td></tr>");
							}
						});
				},
				remove:function(e){
					//获得当前行
					$.messager.confirm({
						title:"客户操作",
						msg:"确定要删除吗?",
						fn:function(r){
							if(r){
								var a = e.target;
								var tr = $(a).parent().parent();
								console.log(tr.find("td").eq(0).text());
								$.ajax({
									url:"${pageContext.request.contextPath}/person/remove.do",
									type:"post",
									data:"id="+tr.find("td").eq(0).text(), 
									dataType:"json",
									success:function(obj){
										//提示删除成功
										$.messager.show({
											title:"提示",
											msg:"删除完毕！"
										});
										//重新加载当前页person信息
										//获得当前页的page信息
										//发送上一页请求
										var page = $("#d1").data("page");
										$.ajax({
											url:"${pageContext.request.contextPath}/person/getAll.do",
											data:"pageNum="+page.pageNum+"&pageSize="+page.pageSize,
											type:"post",
											dataType:"json",
											success:function(page){
												//将json数据绑定在标签上。
												$("#d1").data("page",page);
												//清空tbody
												$("#tb").empty();
												//遍历json中的list属性,并添加在tbody中。
												$.each(page.list,function(i,e){
													var jqtr = person.createRow(e);
													$("#tb").append(jqtr);
													});
											}
										});
									}
								});
							}else{
								$.messager.show({
									title:"提示",
									msg:"取消删除！"
								});
							}
						}
					});
				},
				add:function(){
					//1. 获得表单的数据
					var param = $("#fm").serialize();
					//2. 发送ajax请求添加。
					$.ajax({
						url:"${pageContext.request.contextPath}/person/add.do",
							data:param,
							type:"post",
							dataType:"json",
							success:function(page){
								//显示提示信息
								toastr.success(obj.msg);
								//重新加载当前页person信息
								//获得当前页的page信息
								//发送上一页请求
								var page = $("#d1").data("page");
								$.ajax({
									url:"${pageContext.request.contextPath}/person/getAll.do",
									data:"pageNum="+page.pageNum+"&pageSize="+page.pageSize,
									type:"post",
									dataType:"json",
									success:function(page){
										//将json数据绑定在标签上。
										$("#d1").data("page",page);
										//清空tbody
										$("#tb").empty();
										//遍历json中的list属性,并添加在tbody中。
										$.each(page.list,function(i,e){
											var jqtr = person.createRow(e);
											$("#tb").append(jqtr);
										});
									}
								});
								//让当前表单消失
								$("#addPersonFm").slideUp(2000);
							}
					});
				}
			};
		
			$(function(){
				//点击添加按钮，显示添加表单
				$("#showAddPersonBtn").on('click',function(){
					$("#addPersonFm").slideDown(2000);
				});
				//网页加载完毕之后显示第一页的person信息
				person.init();
				$("#btn").on('click',person.getById);
				//给上一页和下一页按钮绑定事件
				$("#tf a:contains(上一页)").on('click',person.prevPage);
				$("#tf a:contains(下一页)").on('click',person.nextPage);
				//给删除按钮绑定事件。
				$("#tb").on('click',"a:contains(删除)",person.remove);
				//给添加按钮绑定事件
				$("#addPersonBtn").on('click',person.add);	
				
			});
		</script>
	</head>
	
	<body>
		<!-- 缓存数据标签 -->
		<!-- d1用来缓存当前分页的page数据。 -->
		<span id="d1"></span>
		<div id="addPersonFm" style="display:none;">
			<form id="fm" action="#">
				<table align='center' border="1">
					<tr>
						<td>姓名</td>
						<td><input type="text" name="name" id="pname" /></td>
					</tr>
					<tr>
						<td>年龄</td>
						<td><input type="text" name="age" id="page" /></td>
					</tr>
					<tr>
						<td>性别</td>
						<td><input type="text" name="sex" id="psex" /></td>
					</tr>
					<tr>
						<td>手机号</td>
						<td><input type="text" name="mobile" id="pmobile" /></td>
					</tr>
					<tr>
						<td>地址</td>
						<td><input type="text" name="address" id="paddress" /></td>
					</tr>
					<tr>
						<td></td>
						<td><input id="addPersonBtn" type="button" value="添加" /></td>
					</tr>
				</table>
			</form>
		</div>
		
		
		<table align='center' border='1' width="70%">
			<thead>
				<tr>
					<th colspan="1">
					<input id="showAddPersonBtn" type="button" value="添加" />
					</th>
					<th colspan="6">
						<input type="text" name="id" id="pid"  />
						<input id="btn" type="button" value="搜索" />
					</th>
				</tr>
				<tr style="background-color:#0080FF;color:white;">
					<th>ID</th>
					<th>姓名</th>
					<th>年龄</th>
					<th>性别</th>
					<th>手机号</th>
					<th>地址</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody id="tb">
				<tr>
					<td colspan="7">没有查询到数据．．．．．．</td>
				</tr>
			</tbody>
			<tfoot id="tf">
				<tr>
					<td></td>
					<td><a href="#">上一页</a></td>
					<td></td>
					<td></td>
					<td></td>
					<td><a href="#">下一页</a></td>
					<td></td>
				</tr>
			</tfoot>
		</table>
		
	</body>
</html>
