<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>EasyUI示例</title>
<%@include file="/commons/easyui.jsp"%>

<style>
	#dialog_person_add td{
		border:1px dotted gray;
	}
</style>
</head>
	<script>
		function test1(){
			//reload方法。
			$("#datagrid_person").datagrid('reload');
		}
		
		function test2(){
			$("#datagrid_person").datagrid('load');
		}
	</script>

<body>

	<!--~~~~~~~~~~~~~~~~~~~~ datagrid按钮组 ~~~~~~~~~~~~~~~~~~~~-->
	<div id="datagrid_toolbar">
		<a href="#">删除选中</a> <a href="#">添加</a>
		<input type="text" name="keyword" id="keyword" />
	</div>
	<!--~~~~~~~~~~~~~~~~~~~~dialog添加person的按钮组 ~~~~~~~~~~~~~~~~~~~~ -->
	<div id="dialog_person_add_buttons">
		<a href="#">添加</a>
	</div>
	<!--~~~~~~~~~~~~~~~~~~~~ 修改的dialog的按钮组 ~~~~~~~~~~~~~~~~~~~~-->
	<div id="dialog_person_modify_buttons">
		<a href="#">修改</a>
	</div>

	<!--~~~~~~~~~~~~~~~~~~~~ 展示person的table ~~~~~~~~~~~~~~~~~~~~-->
	<table id="datagrid_person">
		<thead>
			<tr>
				<th data-options="field:'id',width:100,checkbox:true">ID</th>
				<th data-options="field:'name',width:120">名字</th>
				<th data-options="field:'sex',width:80,formatter:person.sex_fmt">性别</th>
				<th data-options="field:'age',width:80,sortable:true">年龄</th>
				<th data-options="field:'mobile',width:180">手机号</th>
				<th data-options="field:'address',width:200">地址</th>
				<th data-options="field:'hehe',width:200,formatter:person.op_fmt">操作</th>
			</tr>
		</thead>
	</table>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~添加person的dialog~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<div id="dialog_person_add" align='center'>
		<form id="form_person_add" action="${pageContext.request.contextPath }/person/add" method="post">
			<table>
				<tr>
					<td>名字</td>
					<td><input type="text" name="name" id="name" /></td>
				</tr>
				<tr>
					<td>性别</td>
					<td><input type="text" name="sex" id="sex" /></td>
				</tr>
				<tr>
					<td>年龄</td>
					<td><input type="text" name="age" id="age" /></td>
				</tr>
				<tr>
					<td>手机</td>
					<td><input type="text" name="mobile" id="mobile" /></td>
				</tr>
				<tr>
					<td>地址</td>
					<td><input type="text" name="address" id="address" /></td>
				</tr>
			</table>
		</form>	
	</div>
	
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~修改person的dialog~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<div id="dialog_person_modify" align='center'>
		<form id="form_person_modify" action="${pageContext.request.contextPath }/person/modify.do" method="post">
			<table>
				<tr>
					<td>名字</td>
					<td>
						<input type="hidden" name="id" />
						<input type="text" name="name" id="name" />
					</td>
				</tr>
				<tr>
					<td>性别</td>
					<td><input type="text" name="sex" id="sex" /></td>
				</tr>
				<tr>
					<td>年龄</td>
					<td><input type="text" name="age" id="age" /></td>
				</tr>
				<tr>
					<td>手机</td>
					<td><input type="text" name="mobile" id="mobile" /></td>
				</tr>
				<tr>
					<td>地址</td>
					<td><input type="text" name="address" id="address" /></td>
				</tr>
			</table>
		</form>
	</div>
	<script>
		/* 定义person相关的函数 */
		var person = {
			/**
				参数:
				value: 当前列的值。
				row：当前行的json数据。
				index: 数据所在行的下标。
			 */
			sex_fmt : function(value, row, index) {
				//console.log(value,row,index);
				if (value == 1) {
					return '男';
				} else {
					return '女';
				}
			},
			/* 格式化显示操作按钮列 */
			op_fmt : function(value, row, index) {
				return '<a class="person_remove_btn" href="#">删除</a> <a class="person_showupdate_btn" href="#">修改</a>';
			}
			
		};

		/*~~~~~~~~~~~~~~~~~~~~ 生效datagrid效果 ~~~~~~~~~~~~~~~~~~~~*/
		//$("table").datagrid();
		$("#datagrid_person").datagrid({
			title : "客户信息",
			iconCls : "icon-man",
			height : 500,
			url : '${pageContext.request.contextPath}/person/showAll',//自动请求url，自动创建tr，装在数据.
			toolbar : '#datagrid_toolbar',//引用按钮组,
			rownumbers : true,//显示行号
			checkOnSelect : true,//使行只有在复选框选中，才是真正的选中。 
			fitColumns : true,//让表格列宽，强行自适应到整合页面宽度
			striped : true,//斑马线效果
			onLoadSuccess : function() {//datagrid数据加载完毕之后，执行的代码
				//datagrid数据加载完毕，在使用easyui插件，再次是按钮效果生效。
				//$("shanchu").linkbutton();
				//为每行的删除按钮添加样式和属性
				$(".person_remove_btn").linkbutton({
					iconCls : "icon-edit",
					onClick:function(){
						console.log(this);
						var vid = $(this).parent().parent().parent().children().eq(0).find("input").val();
						console.log(vid);
					var param="";
					param = param+"deleteid="+vid;
								$.ajax({
					url:"${pageContext.request.contextPath}/person/remove.do",
					type:"post",
					data:param,
					dataType:"json",
					success:function(json){
						console.log(json);
						//1. 重新加载当前页面的信息。
						$("#datagrid_person").datagrid('reload');
						//2. 提示信息。
						$.messager.show({
							title:"提示",
							msg:json.msg,
						});
					}
				});
					}
				});
				
				
				
				
				
				
				
				
				
				//每行的修改按钮添加月昂视和属性。
				$(".person_showupdate_btn").linkbutton({
					iconCls : "icon-edit",
					onClick:function(){
						console.log(this);
						//1. 显示出修改的dialog。
						$("#dialog_person_modify").dialog({
							closed:false,//显示dialog
						});
						//2. 获得当前行的数据的id属性值: 350041.
						console.log($(this).parent().parent().parent().children().eq(0).find("input").val());
						var vid = $(this).parent().parent().parent().children().eq(0).find("input").val();
						//3. ajax请求，根据id=350041从控制器端，获得对应的person信息。 json
						//4. 填充在form表单中。"load"
						$("#form_person_modify").form('load',"${pageContext.request.contextPath}/person/getById.do?id="+vid);
					}
				});
			},
			pagination : true,//添加分页工具栏
		});
		
		
		/*~~~~~~~~~~~~~~~~~~~~~~~~~ 生效dialog ~~~~~~~~~~~~~~~~~~~~*/
		$("#dialog_person_add").dialog({
			width:250,
			title:"添加客户信息",
			iconCls:"icon-man",
			buttons:"#dialog_person_add_buttons",
			closed:true,//初始关闭
		});
		/*~~~~~~~~~~~~~~~~~~~~~~~~~ 初始化修改的dialog和form表单 ~~~~~~~~~~~~~~~~~~~~~~~~~*/
		$("#dialog_person_modify").dialog({
			title:"修改客户信息",
			iconCls:"icon-man",
			width:250,
			closed:true,
			modal:true,
			buttons:"#dialog_person_modify_buttons",
		});
		
		/* ~~~~~~~~~~~~~~~~~~~~~~添加person的form表单~~~~~~~~~~~~~~~~~~~~~ */
		$("#form_person_add").form({
			success:function(data){
				console.log(data);
				//提示信息
				var json = JSON.parse(data);
				$.messager.show({
					title:"提示",
					msg:json.msg,
				});
				//将dialog关闭
				$("#dialog_person_add").dialog({
					closed:true,
				});
				//将当前datagrid重新加载。
				$("#datagrid_person").datagrid('reload');
				//清空表单
				$("#form_person_add").form('clear');
			}
		});
		/*~~~~~~~~~~~~~~~~~~~~~~~~~~修改的person的form表单~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
		$("#form_person_modify").form({
			success:function(data){
				//修改的表单提交成功，且服务器响应回到浏览器。
				console.log(data);
				//1. 关闭修改的dialog
				$("#dialog_person_modify").dialog({
					closed:true,
				});
				//2. 提示：修改成功。
				var json = JSON.parse(data);
				$.messager.show({
					title:"提示",
					msg:json.msg,
				});
				//3. datagrid重新加载。
				$("#datagrid_person").datagrid('reload');
			}
		});
		/*~~~~~~~~~~~~~~~~~~~~~~~~~ 网页中所有按钮组属性事件初始化 ~~~~~~~~~~~~~~~~~~~~~~~~~*/
		/* 生效linkbutton */
		$("#dialog_person_modify_buttons a:contains(修改)").linkbutton({
			iconCls:"icon-ok",
			/* 修改单击事件 */
			onClick:function(){
				//1. 提交表单的数据。
				$("#form_person_modify").form("submit");
			}
		});
		
		
		
		
		
		
		$("#dialog_person_add_buttons a:contains(添加)").linkbutton({
			iconCls:"icon-ok",
			//绑定添加person信息事件
			onClick:function(){
				//1. 将表单数据提交到控制器。
				//$("form").form('submit');
				$("#form_person_add").form('submit');
				//2. 在表单提交成功的时候，讲数据datagrid数据reload一次。
			}
		});
		$("#datagrid_toolbar>a:contains(删除选中)").linkbutton({
			iconCls : "icon-remove",
			onClick:function(){
				//获得被选中的行数据。
				var as = $("#datagrid_person").datagrid('getChecked');
				//1. 获得所有被选中的id参数"id=10001&id=1002&id=1003";
				var param = "";
				for(var i=0;i<as.length;i++){
					var id = as[i].id;
					if(i==0){
						param = param+"id="+id;
					}else{
						param = param+"&id="+id;
					}
				}
				console.log(param);
				//2. ajax方式发送参数
				$.ajax({
					url:"${pageContext.request.contextPath}/person/removeBatch.do",
					type:"post",
					data:param,
					dataType:"json",
					success:function(json){
						console.log(json);
						//1. 重新加载当前页面的信息。
						$("#datagrid_person").datagrid('reload');
						//2. 提示信息。
						$.messager.show({
							title:"提示",
							msg:json.msg,
						});
					}
				});
				//3. 根据服务器响应结果，作出提示。
			}
		});
		$("#datagrid_toolbar>a:contains(添加)").linkbutton({
			iconCls : "icon-add",
			onClick:function(){
				$("#dialog_person_add").dialog({
					closed:false,//显示
					modal:true,//使对框框  灯罩效果
				});
			}
		});
		/* 搜索按钮 */
		$("#keyword").textbox({
			buttonIcon : "icon-search",
			buttonText : "搜索",
			onClickButton:function(){
				console.log("~~~~~~~~~~搜索开始~~~~~~~~~~~~~");
				//1. 获得输入框中的输入文本。  "宁"
				var keyword = $("#keyword").val();
				//2. 使用datagrid的load方法，发送  关键词参数。
				$("#datagrid_person").datagrid('load',{
					keywords:keyword
				});
				//3. 数据自动重新加载。
				//4. 提示信息：查询结束
				
			}
		});
		
		
		
		/*~~~~~~~~~~~~~~~~~~~~~~~~~ easyui样式bug微调 ~~~~~~~~~~~~~~~~~~~~~~~~~*/
		
		$("#dialog_person_add_buttons").css("width","240px").css("text-align",'center');
		
		$("#dialog_person_modify_buttons").css("width","240px");
	</script>
</body>
</html>
