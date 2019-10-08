<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>投保单管理</title>
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
	<div id="datagrid_toolbar">
		
		
		原认领人工号<input type="text" name="keywords" id="startDate" />
		
		
		<!-- <span id="keyword">搜索</span> -->
		<a href="javascript:searchStudent()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
		
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;新认领人工号<input type="text" name="keywords1" id="endDate" />
		
		<a href="javascript:searchStudent1()" class="easyui-linkbutton" iconCls="icon-search" plain="true">批量化转</a></div>
		
		
	</div>

	<!--~~~~~~~~~~~~~~~~~~~~ 展示person的table ~~~~~~~~~~~~~~~~~~~~-->
	<table id="datagrid_person">
		<thead>
			<tr>
	
	
				<th data-options="field:'id',width:100,checkbox:true">ID</th>
			<th data-options="field:'inputdate',width:60">导入日期</th>
			<th data-options="field:'datatype',width:30,formatter:person.shuju_fmt">数据类别</th>
			<th data-options="field:'licenseno',width:30">车牌号</th>
				<th data-options="field:'frameno',width:80">车架号</th> 
				
				
			<th data-options="field:'enddate',width:60">终保日期</th>	
			<th data-options="field:'dxgh',width:30">认领工号</th>
			<th data-options="field:'username',width:30">认领人</th>
			<th data-options="field:'zubie',width:30">组别</th>
			<th data-options="field:'qubu',width:30">区部</th>
			</tr>
		</thead>
	</table>
	<script>
		/* 定义person相关的函数 */
		
		
			function searchStudent(){
		$('#datagrid_person').datagrid('load',{

	keywords:$('#startDate').val(),
	
		});	
	}
	
				function searchStudent1(){
		$('#datagrid_person').datagrid('load',{

	keywords:$('#startDate').val(),
	keywords1:$('#endDate').val(),
		});	
		
		
						$.messager.show({
					title:"提示",
					msg:"批量化转成功",
				});
		
	}
	
	
		
		var person = {


shuju_fmt: function(value,index){
			
			
			if(value=='0'){
			
			
			return '自续';
			}
			if(value=='1'){
			return '传续';
			
			}
			
					if(value=='2'){
			
			return '转保';
			
			}
			},
	




			
		};

		/*~~~~~~~~~~~~~~~~~~~~ 生效datagrid效果 ~~~~~~~~~~~~~~~~~~~~*/
		//$("table").datagrid();
		$("#datagrid_person").datagrid({
			title : "员工认领",
			iconCls : "icon-man",
			height : 500,
			url : '${pageContext.request.contextPath}/insurance/showAll4',//自动请求url，自动创建tr，装在数据.
			toolbar : '#datagrid_toolbar',//引用按钮组,
			rownumbers : true,//显示行号
			checkOnSelect : true,//使行只有在复选框选中，才是真正的选中。 
			fitColumns : true,//让表格列宽，强行自适应到整合页面宽度
			striped : true,//斑马线效果
			onLoadSuccess : function() {//datagrid数据加载完毕之后，执行的代码
				//datagrid数据加载完毕，在使用easyui插件，再次是按钮效果生效。
				//$("shanchu").linkbutton();
				//为每行的删除按钮添加样式和属性
	
				//每行的修改按钮添加月昂视和属性。
	
					$(".person_remove_btn").linkbutton({
					iconCls : "icon-edit",
					onClick:function(){
					
											var r = confirm("确认要认领么？");
				//return false;//禁用超链接默认事件。
				if(r==true){
											console.log(this);
						var vid = $(this).parent().parent().parent().children().eq(0).find("input").val();
						console.log(vid);
					var param="";
					param = param+"deleteid="+vid;
								$.ajax({
					url:"${pageContext.request.contextPath}/insurance/renling",
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
					
					
					
					
					
					
					
					
					
					
				}else{
					return false;//禁用默认事件
				}

					}
				});
				
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
			},
			pagination : true//添加分页工具栏
		});


		/*~~~~~~~~~~~~~~~~~~~~~~~~~ easyui样式bug微调 ~~~~~~~~~~~~~~~~~~~~~~~~~*/
		
		$("#dialog_person_add_buttons").css("width","240px").css("text-align",'center');
		
		$("#dialog_person_modify_buttons").css("width","240px");
		
		
		
	</script>
</body>
</html>
