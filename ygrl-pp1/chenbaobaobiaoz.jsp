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
		
		
		终保日期<input type="date" name="startDate" id="startDate" />
		至<input type="date" name="endDate" id="endDate" />
		<!-- <span id="keyword">搜索</span> -->
		<a href="javascript:searchStudent()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
			&nbsp;&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath }/chenbao/baobiaodaochu1"    class="btn btn-info btn-sm"><span class="glyphicon glyphicon-plus"></span>导出EXCEL</a>
		${sessionScope.powLow}
		
		</div>
		


	<!--~~~~~~~~~~~~~~~~~~~~ 展示person的table ~~~~~~~~~~~~~~~~~~~~-->
	<table id="datagrid_person">
		<thead>
			<tr>
				<th data-options="field:'id',width:100,checkbox:true">ID</th>
		<th data-options="field:'mingcheng',width:100">名称</th>	
			<th data-options="field:'gonghao',width:100">工号</th>	
	<th data-options="field:'jqtdxb',width:100">团队续保(交强)</th>
<th data-options="field:'jqftdxb',width:100">非团队续保(交强)</th>
<th data-options="field:'jqybts',width:100">已保它司(交强)</th>
<th data-options="field:'jqwbjq',width:100">未保交强(交强)</th>
	<th data-options="field:'sytdxb',width:100">团队续保(商业)</th>
<th data-options="field:'sqftdxb',width:100">非团队续保(商业)</th>
<th data-options="field:'sqybts',width:100">已保它司(商业)</th>
<th data-options="field:'sqwbjq',width:100">未保商业(商业)</th>



			</tr>
		</thead>
	</table>
	<script>
		/* 定义person相关的函数 */
		
		
			function searchStudent(){
		$('#datagrid_person').datagrid('load',{

	startDate1:$('#startDate').val(),
	endDate1:$('#endDate').val()
	
	
	
		});
	}
		
		var person = {
			/**
				参数:
				value: 当前列的值。
				row：当前行的json数据。
				index: 数据所在行的下标。
			 */






			/* 格式化显示操作按钮列 */
/* 			op_fmt : function(value, row, index) {
				return '<a class="person_showupdate_btn" href="#">查看详情</a>';
			} */
			
		};

		/*~~~~~~~~~~~~~~~~~~~~ 生效datagrid效果 ~~~~~~~~~~~~~~~~~~~~*/
		//$("table").datagrid();
		$("#datagrid_person").datagrid({
			title : "客户信息",
			iconCls : "icon-man",
			height : 500,
			url : '${pageContext.request.contextPath}/chenbao/showAllchenbaoz',//自动请求url，自动创建tr，装在数据.
			toolbar : '#datagrid_toolbar',//引用按钮组,
			rownumbers : true,//显示行号
			checkOnSelect : true,//使行只有在复选框选中，才是真正的选中。 
			fitColumns : true,//让表格列宽，强行自适应到整合页面宽度
			striped : true,//斑马线效果
			onLoadSuccess : function() {//datagrid数据加载完毕之后，执行的代码
				//datagrid数据加载完毕，在使用easyui插件，再次是按钮效果生效。
				//$("shanchu").linkbutton();
				//为每行的删除按钮添加样式和属性
					$(".person_showupdate_btn").linkbutton({
					iconCls : "icon-edit",
					onClick:function(){
					
											$("#dialog_person_modify").dialog({
							closed:false,//显示dialog
						});

					 var vid = $(this).parent().parent().parent().children().eq(0).find("input").val();
					  location.href=("${pageContext.request.contextPath}/insurance/getById.do?id="+vid);
					 
					 
					 }
				});
				//每行的修改按钮添加月昂视和属性。
	
			},
			pagination : true//添加分页工具栏
		});


		/*~~~~~~~~~~~~~~~~~~~~~~~~~ easyui样式bug微调 ~~~~~~~~~~~~~~~~~~~~~~~~~*/
		
		$("#dialog_person_add_buttons").css("width","240px").css("text-align",'center');
		
		$("#dialog_person_modify_buttons").css("width","240px");
		
		
		
	</script>
</body>
</html>
