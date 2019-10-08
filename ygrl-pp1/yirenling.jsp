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
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		车牌号或车架号<input type="text" name="keywordsx" id="keywordsx" />
		<!-- <span id="keyword">搜索</span> -->
		认领日期查询	<input type="date" name="renlingDate" id="renlingDate" />
		<input type="date" name="renlingDate1" id="renlingDate1" />
		<a href="javascript:searchStudent()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
		
		&nbsp;&nbsp;&nbsp;&nbsp;	
		
<c:if test="${sessionScope.user.username=='管理员' }">



		
		<a href="${pageContext.request.contextPath }/last/daochucqrl"    class="btn btn-info btn-sm"><span class="glyphicon glyphicon-plus"></span>导出EXCEL</a>
		</c:if>
		</div>
		
	

	<!--~~~~~~~~~~~~~~~~~~~~ 展示person的table ~~~~~~~~~~~~~~~~~~~~-->
	<table id="datagrid_person">
		<thead>
			<tr>
				<th data-options="field:'id',width:20,checkbox:true">ID</th>
				

					<th data-options="field:'inputdate',width:60">导入日期</th>
				<th data-options="field:'datatype',width:30,formatter:person.shuju_fmt">数据类别</th>
				<th data-options="field:'licenseno',width:30">车牌号</th>
				<th data-options="field:'frameno',width:30">车架号</th> 
				
				<th data-options="field:'enddate',width:60">终保日期</th>
				
			<th data-options="field:'claimdate',width:60">认领日期</th>
			<th data-options="field:'dxgh',width:30">员工工号</th>
				<th data-options="field:'username',width:30">员工姓名</th>
				
				
				
			<th data-options="field:'jqstartdate',width:60">交强默认起保日期</th>
			<th data-options="field:'jqstartdate_hz',width:60">交强核准起保日期</th>
					<th data-options="field:'systartdate',width:60">商业默认起保日期</th>
				<th data-options="field:'systartdate_hz',width:60">商业核准起保日期</th>
				<th data-options="field:'yjgj',width:35,formatter:person.huawu_fmt">一级跟进状态</th>
				<th data-options="field:'ejgj',width:35,formatter:person.jiaoqiang_fmt">二级跟进状态</th>
					
				
				<th data-options="field:'remark',width:60,formatter:person.shanye_fmt">备注</th>
				
						
				
		
			</tr>
		</thead>
	</table>
	<script>
		/* 定义person相关的函数 */
		
		
			function searchStudent(){
		$('#datagrid_person').datagrid('load',{

	startDate1:$('#startDate').val(),
	endDate1:$('#endDate').val(),
	keywordsx:$('#keywordsx').val(),
	
	renlingDate:$('#renlingDate').val(),
	renlingDate1:$('#renlingDate1').val()
	
	
	
		});
	}
		
		var person = {
			/**
				参数:
				value: 当前列的值。
				row：当前行的json数据。
				index: 数据所在行的下标。
			
			 */
	
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
						huawu_fmt : function(value, row, index) {
				//console.log(value,row,index);
				if (value == 1) {
					return '非目标客户';
				} 
				else if(value==2){
				return '拒绝沟通';
				
				}
								else if(value==3){
				
				return '未接起电话';
				}
								else if(value==4){
				
				return '无话务功能';
				}
								else if(value==5){
				
				return '已办车险';
				}
								else if(value==6){
				
				return '正常跟进';
				}
												else if(value==7){
				
				return '投保成功';
				}
				
				else {
					return '未填写';
				}
			}, 
			
			
						jiaoqiang_fmt : function(value, row, index) {


		if (value == 11) {
					return '错号';
				} 
				else if(value==12){
				return '承保限制';
				
				}
								else if(value==13){
				
				return '过户';
				}
				
				
				else if(value==14){
				
				return '异地承保';
				}
								else if(value==15){
				
				return '分期车';
				}
								else if(value==21){
				
				return '拒访，挂断';
				}
								else if(value==22){
				
				return '明确拒绝';
				}
												else if(value==23){
				
				return '不让联系';
				}
				else if(value==24){
				return '投诉倾向';
				
				}
								else if(value==25){
				
				return '骂人态度不好';
				}
								else if(value=='26'){
				
				return '现在不方便';
				}
								else if(value==31){
				
				return '无人接听';
				}
								else if(value==32){
				
				return '停机';
				}
								else if(value==33){
				
				return '关机';
				}
		
					else if(value==41){
				
				return '占线';
				}
				
								else if(value==42){
				return '暂时无法接通';
				
				}
								else if(value==43){
				
				return '空号';
				}
								else if(value==44){
				
				return '关机';
				}
								else if(value==45){
				
				return '停机';
				}
								else if(value==46){
				
				return '长期无人接听';
				}
								else if(value==51){
				
				return '平安已保';
				}
												else if(value==52){
				
				return '人寿已保';
				}
				
								else if(value==53){
				return '太平洋已保';
				
				}
								else if(value==54){
				
				return '其他已保';
				}
								else if(value==55){
				
				return '人保已保';
				}
								else if(value==61){
				
				return '保费计算';
				}
								else if(value==62){
				
				return '专人代办';
				}
								else if(value==63){
				
				return '与家人商量';
				}
												else if(value==64){
				
				return '与其他公司对比';
				}
				
				
												else if(value==65){
				
				return '未到期';
				}
												else if(value==66){
				
				return '已报价';
				}
				
								else if(value==67){
				return '意向跟进';
				
				}
								else if(value==71){
				
				return '投保已缴费';
				}
								else if(value==72){
				
				return '投保';
				}
				
				else {
					return '未填写';
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
