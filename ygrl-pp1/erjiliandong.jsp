<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Document</title>

<%@include file="/commons/easyui.jsp"%>



<style>
.error {
	color: red;
}
</style>
</head>
<body>
	

	
	
	
	
	
	<div id="datagrid_toolbar">
		
		
		车牌号或车架号<input type="text" name="keywords" id="startDate" />
		
		<!-- <span id="keyword">搜索</span> -->
		<a href="javascript:searchStudent()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
		
		</div>
		
	

	
		<!--~~~~~~~~~~~~~~~~~~~~ 编辑的dialog的按钮组 ~~~~~~~~~~~~~~~~~~~~-->
	<div id="dialog_person_modify_buttons">
		<a href="#">确定</a>
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
				
						
				
				
				<th data-options="field:'hehe',width:140,formatter:person.op_fmt">操作</th>
			</tr>
		</thead>
	</table>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~编辑person的dialog~~~~~~~~~~~~~~~~~~~~~~~~ -->
	
	
	<div id="dialog_person_modify" align='center'>
		<form id="form_person_modify" action="${pageContext.request.contextPath }/insurance/changeStatus1?idp=2" method="post">
		
			
			
<table>

			
													<tr>
				<td>交强核准起保日期</td>
				<td><input type="date" name="jqstartdate_hz" id="jqstartdate_hz"></td>
				
				</tr>
				
												<tr>
				<td>商业核准起保日期</td>
				<td><input type="date" name="systartdate_hz" id="systartdate_hz"></td>
				
				</tr>
				<tr>
					<td>	一级跟进: </td>
		<td>
		  <select  name="yjgj1" id="sheng666" >111</select>
		</td>
		</tr>
		<tr>
		<td>二级跟进:</td>
		<td><select name="ejgj1" id="city34">
			
		</select></td>
</tr>

<tr>
<td>备注</td>

<td><textarea rows="4" cols="40" name="remark" placeholder="最多50字" maxlength="50" id="remark"
></textarea></td>

</tr>
</table>

	</form>

	</div>
	<script>
		/* 定义person相关的函数 */
		
		
			function searchStudent(){
		$('#datagrid_person').datagrid('load',{

	keywords:$('#startDate').val(),

	
	
	
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
				
				return '专人代办';
				}
								else if(value==62){
				
				return '与家人商量';
				}
												else if(value==63){
				
				return '与其他公司对比';
				}
				
				
												else if(value==64){
				
				return '未到期';
				}
												else if(value==65){
				
				return '已报价';
				}
				
								else if(value==66){
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
				
				
						op_fmt : function(value, row, index) {
				return '<a class="person_showupdate_btn" href="#">编辑</a>';
			}

		
				
	

		};
		

		/*~~~~~~~~~~~~~~~~~~~~ 生效datagrid效果 ~~~~~~~~~~~~~~~~~~~~*/
		//$("table").datagrid();
		$("#datagrid_person").datagrid({
			title : "客户信息",
			iconCls : "icon-man",
			height : 500,
			url : '${pageContext.request.contextPath}/insurance/showAll1',//自动请求url，自动创建tr，装在数据.
			toolbar : '#datagrid_toolbar',//引用按钮组,
			rownumbers : true,//显示行号
			checkOnSelect : true,//使行只有在复选框选中，才是真正的选中。 
			fitColumns : true,//让表格列宽，强行自适应到整合页面宽度
			striped : true,//斑马线效果
			onLoadSuccess : function() {//datagrid数据加载完毕之后，执行的代码
				//datagrid数据加载完毕，在使用easyui插件，再次是按钮效果生效。
				//$("shanchu").linkbutton();
				//为每行的删除按钮添加样式和属性
	
				//每行的编辑按钮添加月昂视和属性。
			$("#dialog_person_modify").dialog({
			title:"编辑客户信息",
			iconCls:"icon-man",
			width:1000,
			closed:true,
			modal:true,
			buttons:"#dialog_person_modify_buttons",
		});
	
	
					//每行的编辑按钮添加月昂视和属性。
				$(".person_showupdate_btn").linkbutton({
					iconCls : "icon-edit",
					onClick:function(){
					$("#city34").empty();
						//1. 显示出编辑的dialog。
						$("#dialog_person_modify").dialog({
							closed:false,//显示dialog
						});
						//2. 获得当前行的数据的id属性值: 350041.
						
						
							//$("#city34").val(${sessionScope.erjip});
						var vid = $(this).parent().parent().parent().children().eq(0).find("input").val();
						//3. ajax请求，根据id=350041从控制器端，获得对应的person信息。 json
						//4. 填充在form表单中。"load"
						//$("#form_person_modify").form('load',"${pageContext.request.contextPath}/insurance/changeStatus?id="+vid);
				
				
				 var param="id="+vid;
				$.ajax({
					url:"${pageContext.request.contextPath}/insurance/changeStatus",
					type:"post",
					data:param,
					dataType:"json",
					success:function(json){
					
				    $("#jqstartdate_hz").val("");
				    $("#systartdate_hz").val("");
				    $("#sheng666").val("");
					$("#city34").val("");
					$("#remark").val("");
					//alert(json.ppgou.yjgj);
					
					
					$("#jqstartdate_hz").val(json.ppgou.jqstartdate_hz);
					$("#systartdate_hz").val(json.ppgou.systartdate_hz);
					$("#remark").val(json.ppgou.remark);
					var city34s = sheng666info[json.ppgou.yjgj.trim()-1].city34s;
					for(var i=0;i<city34s.length;i++){
						$("#city34").append($('<option value="'+city34s[i].id+'">'+city34s[i].name+'</option>'));
					}
					
					
					$("#sheng666").val(json.ppgou.yjgj.trim());
					$("#city34").val(json.ppgou.ejgj.trim());
					
					
					
					
					
					
					
					}
				});
					}
				});
				
				
				
				
				
				
				
				
				
				
				
				
			$("#form_person_modify").form({
			success:function(data){
				//编辑的表单提交成功，且服务器响应回到浏览器。
				console.log(data);
				//1. 关闭编辑的dialog
				$("#dialog_person_modify").dialog({
					closed:true,
				});
				//2. 提示：编辑成功。
				var json = JSON.parse(data);
				$.messager.show({
					title:"提示",
					msg:"编辑成功",
				});
				//3. datagrid重新加载。
				$("#datagrid_person").datagrid('reload');
				$("#form_person_modify").form('clear');
			}
		});
	
	
			/*~~~~~~~~~~~~~~~~~~~~~~~~~ 初始化编辑的dialog和form表单 ~~~~~~~~~~~~~~~~~~~~~~~~~*/
		$("#dialog_person_modify").dialog({
			title:"编辑客户信息",
			iconCls:"icon-man",
			width:650,
			closed:true,
			modal:true,
			buttons:"#dialog_person_modify_buttons",
		});
	
	
			$("#dialog_person_modify_buttons a:contains(确定)").linkbutton({
			iconCls:"icon-ok",
			/* 编辑单击事件 */
			onClick:function(){
			
			
			var pp1=$("#sheng666").val();
			var pp2=$("#city34").val();
		if(pp1==null||pp2==null){
		alert("跟进不能为空");
		}
			if(pp1!=null&&pp2!=null){
			
			$("#form_person_modify").form("submit");
			
			}
			
			
				//1. 提交表单的数据。
				//
			}
		});
	

	
			},
			pagination : true//添加分页工具栏
		});


		/*~~~~~~~~~~~~~~~~~~~~~~~~~ easyui样式bug微调 ~~~~~~~~~~~~~~~~~~~~~~~~~*/
		
		$("#dialog_person_add_buttons").css("width","240px").css("text-align",'center');
		
		$("#dialog_person_modify_buttons").css("width","240px");
		
		
		
		

	
	
			function test1(){
			//reload方法。
			$("#datagrid_person").datagrid('reload');
		}
		
		function test2(){
			$("#datagrid_person").datagrid('load');
		}
	
	
	
	var sheng666info = [
		{
			"id":"1",
			"name":"非目标客户",
			"city34s":[
				{"id":"11","name":"错号"},
				{"id":"12","name":"承保限制"},
				{"id":"13","name":"过户"},
				{"id":"14","name":"异地承保"},
				{"id":"15","name":"分期车"}
			
			]
		},
		{
			"id":"2",
			"name":"拒绝沟通",
			"city34s":[
				{"id":"21","name":"拒访，挂断"},
				{"id":"22","name":"明确拒绝"},
				{"id":"23","name":"不让联系"},
				{"id":"24","name":"投诉倾向"},
				{"id":"25","name":"骂人,态度不好"},
				{"id":"26","name":"现在不方便"}
				
			]
		},
		{
			"id":"3",
			"name":"未接起电话",
			"city34s":[
				{"id":"31","name":"无人接听"},
				{"id":"32","name":"停机"},
				{"id":"33","name":"关机"}
				
			]
		},
		{
			"id":"4",
			"name":"无话务功能",
			"city34s":[
				{"id":"41","name":"占线"},
				{"id":"42","name":"暂时无法接通"},
				{"id":"43","name":"空号"},
				{"id":"44","name":"关机"},
				{"id":"45","name":"停机"},
				{"id":"46","name":"长期无人接听"}
			
			]
		},
			{
			"id":"5",
			"name":"已办车险",
			"city34s":[
				{"id":"51","name":"平安已保"},
				{"id":"52","name":"人寿已保"},
				{"id":"53","name":"太平洋已保"},
				{"id":"54","name":"其他已保"},
				{"id":"55","name":"人保已保"}
				
			]
		},
			{
			"id":"6",
			"name":"正常跟进",
			"city34s":[
					{"id":"61","name":"专人代办"},
				{"id":"62","name":"与家人商量"},
				{"id":"63","name":"与其他公司对比"},
				{"id":"64","name":"未到期"},
				{"id":"65","name":"已报价"},
				{"id":"66","name":"意向跟进"}
				
			
			]
			
		},
			{
			"id":"7",
			"name":"投保成功",
			"city34s":[
				{"id":"71","name":"投保未缴费"},
				{"id":"72","name":"投保"}
				
			
			]
		}
		
		
		
		
		
	];
	
	/**
		初始化省份的select
	*/
		//1. 获得省份信息中每个省份信息，将id   name 取出来，
		//获得每个省份信息
		//2. 省份select 创建option+id+name   
		//3. 绑定在select标签内部
	
	function initSelect(){
		for(var i=0;i<sheng666info.length;i++){
			var sid = sheng666info[i].id;
			var sname = sheng666info[i].name;
			$("#sheng666").append($("<option value='"+sid+"'>"+sname+"</option>"));
		}
		
	}
	function changecity34s(){
		//清空城市下拉列表
		//dom.empty();
		//通过id获得市市的那个下拉列表select,并把下拉列表清空
		$("#city34").empty();
		//修改city34的选项内容。
		//1. 修改哪个省份下的城市信息     i
		//select.selectedIndex
		//通过省份的select的id获得下拉列表select标签，使用prop得到下拉列表的坐标
		var index = $("#sheng666").prop("selectedIndex");
		//2. 获得sheng666inf[i].city34s
		//根绝坐标获得具体的城市信息
		var city34s = sheng666info[index].city34s;
		for(var i=0;i<city34s.length;i++){
		//通过city34的id得到城市select标签,然后用.append制造出option标签和绑定城市的内容
			$("#city34").append($('<option value="'+city34s[i].id+'">'+city34s[i].name+'</option>'));
			
		}
		
	}
	//网页加载之后进行绑定
	$(function(){
		//网页load执行运行
		//1. 初始化：信息   事件绑定
		//初始化
	    initSelect(); 
		//2. 绑定sheng666的onchange事件
		//获得省份的select用.on的方式绑定单击事件(change)，后面绑定改变城市的函数名
		$("#sheng666").on("change",changecity34s);
	});

		
		
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>
