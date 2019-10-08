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
		
		&nbsp;&nbsp;&nbsp;&nbsp;	<a href="${pageContext.request.contextPath }/last/daochucqrl"    class="btn btn-info btn-sm"><span class="glyphicon glyphicon-plus"></span>导出EXCEL</a>
		
		</div>
		
	

	<!--~~~~~~~~~~~~~~~~~~~~ 展示person的table ~~~~~~~~~~~~~~~~~~~~-->
	<table id="datagrid_person">
		<thead>
			<tr>

<th data-options="field:'id',width:20,checkbox:true">ID</th>
				
				<th data-options="field:'licenseno',width:30">车牌号</th>
				<th data-options="field:'frameno',width:30">车架号</th> 
				<th data-options="field:'inputdate',width:60">导入日期</th>
				<th data-options="field:'enddate',width:60">终保日期</th>
				
			<th data-options="field:'claimdate',width:60">认领日期</th>
			<th data-options="field:'datatype',width:30,formatter:person.shuju_fmt">数据类型</th>
				<th data-options="field:'username',width:30">认领人</th>
				<th data-options="field:'hwflag',width:35,formatter:person.huawu_fmt">话务状态</th>
				<th data-options="field:'jqtbzt',width:35,formatter:person.jiaoqiang_fmt">交强投保状态</th>
				<th data-options="field:'jqtbztZx',width:35,formatter:person.jiaoqiang_fmt">坐席选择交强投保状态</th>
				<th data-options="field:'jqtbztflag',width:35,formatter:person.yizhixing_fmt">交强投保状态选择一致性</th>
				
				
				
				
				
				<th data-options="field:'jqstartdate',width:60">交强起保日期</th>				
				<th data-options="field:'sytbzt',width:60,formatter:person.shanye_fmt">商业投保状态</th>
				<th data-options="field:'sytbzt_zx',width:60,formatter:person.shanye_fmt">坐席选择商业投保状态</th>
				<th data-options="field:'sytbztflag',width:60,formatter:person.yizhixing_fmt">商业投保状态一致性</th>
								
				<th data-options="field:'systartdate',width:60">商业默认起保日期</th>
				
				
				<th data-options="field:'systartdate_hz',width:60">商业核准起保日期</th>
				<th data-options="field:'syresult_hz',width:60,formatter:person.hejieguo_fmt">商业核准结果</th>
				<th data-options="field:'gjcb',width:60,formatter:person.shifougenjin_fmt">可否跟进承保商业</th>
				<th data-options="field:'jscb',width:60,formatter:person.shifougenjin_fmt1">可否结束商业跟进</th>
				
				
				
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
	
			huawu_fmt : function(value, row, index) {
				//console.log(value,row,index);
				if (value == 0) {
					return '空号停机';
				} 
				else if(value==1){
				return '车辆过户';
				
				}
								else if(value==2){
				
				return '不是本人';
				}
								else if(value==3){
				
				return '无此车辆';
				}
								else if(value==4){
				
				return '无法接通';
				}
								else if(value==5){
				
				return '系统正确';
				}
												else if(value==6){
				
				return '精准营销';
				}
				
				else {
					return '';
				}
			}, 
			
			
						jiaoqiang_fmt : function(value, row, index) {
				//console.log(value,row,index);
				if (value == '01') {
					return '已保他司_平安';
				} 
				else if(value=='02'){
				return '已保他司_人寿';
				
				}
								else if(value=='03'){
				
				return '已保他司_阳光';
				}
								else if(value=='04'){
				
				return '已保他司_太保';
				}
								else if(value=='05'){
				
				return '已保他司_中华';
				}
								else if(value=='06'){
				
				return '其他';
				}
								else if(value=='10'){
				
				return '团队续保';
				}
												else if(value=='11'){
				
				return '非团队续保';
				}
				else {
					return '未保交强';
				}
			}, 
			
			
			
			
						shanye_fmt : function(value, row, index) {
				//console.log(value,row,index);
				if (value == '01') {
					return '已保他司_平安';
				} 
				else if(value=='02'){
				return '已保他司_人寿';
				
				}
								else if(value=='03'){
				
				return '已保他司_阳光';
				}
								else if(value=='04'){
				
				return '已保他司_太保';
				}
								else if(value=='05'){
				
				return '已保他司_中华';
				}
								else if(value=='06'){
				
				return '其他';
				}
								else if(value=='10'){
				
				return '团队续保';
				}
												else if(value=='11'){
				
				return '非团队续保';
				}
				else {
					return '未保商业';
				}
			}, 
			
			
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
			
	
			
			
			
			shifougenjin_fmt : function(value, row, index) {
			
			
			if(value=='0'){
			
			return '否';
			}
			
			else if(value=='1'){
			
			return '是';
			}
			else{
			
			return '';
			
			}
			
			
			
			
			},
			
			shifougenjin_fmt1: function(value, row, index) {
			
			
			if(value=='0'){
			
			return '否';
			}
			
			else if(value=='1'){
			
			return '是';
			}
			else{
			
			return '';
			
			}
			
			
			
			
			},
			
			
			
			hejieguo_fmt : function(value, row, index) {
			
			if(value=='11'){
			
			return '上年承保人保商业';}
			else if(value=='10'){
			
			return '上年未保人保商业';
			
			}
			else if(value=='22'){
			
			return '上年未保商业';
			}
			else{
			
			return '';
			}
			
			},
			
			yizhixing_fmt :function(value, row, index) {
			
			if(value=='0'){
			return '不一致';
			}
			if(value=='1'){
			
			return '一致'
			}
			
			
			},
			
			
		};

		/*~~~~~~~~~~~~~~~~~~~~ 生效datagrid效果 ~~~~~~~~~~~~~~~~~~~~*/
		//$("table").datagrid();
		$("#datagrid_person").datagrid({
			title : "客户信息",
			iconCls : "icon-man",
			height : 500,
			url : '${pageContext.request.contextPath}/last/showAll4',//自动请求url，自动创建tr，装在数据.
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
