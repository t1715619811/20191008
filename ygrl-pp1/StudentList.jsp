<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Document</title>

<%@include file="/commons/easyui.jsp"%>

<script type="text/javascript">
	
	
			function test1(){
			//reload方法。
			$("#datagrid_person").datagrid('reload');
		}
		
		function test2(){
			$("#datagrid_person").datagrid('load');
		}
	
	
	
	var shenginfo = [
		{
			"id":"1001",
			"name":"河南",
			"citys":[
				{"id":"101","name":"郑州"},
				{"id":"102","name":"开封"},
				{"id":"103","name":"南阳"},
				{"id":"104","name":"新乡"},
				{"id":"105","name":"信阳"},
				{"id":"106","name":"荥阳"},
				{"id":"107","name":"周口"},
				{"id":"108","name":"商丘"},
				{"id":"109","name":"驻马店"}
			]
		},
		{
			"id":"1002",
			"name":"北京",
			"citys":[
				{"id":"111","name":"朝阳区"},
				{"id":"112","name":"海淀区"},
				{"id":"113","name":"昌平区"},
				{"id":"114","name":"东城区"},
				{"id":"115","name":"西城区"},
				{"id":"116","name":"宣武区"},
				{"id":"117","name":"丰台区"},
				{"id":"118","name":"大兴区"}
			]
		},
		{
			"id":"1003",
			"name":"河北",
			"citys":[
				{"id":"121","name":"邯郸"},
				{"id":"122","name":"石家庄"},
				{"id":"123","name":"邢台"},
				{"id":"124","name":"衡水"},
				{"id":"125","name":"唐山"},
				{"id":"126","name":"秦皇岛"},
				{"id":"127","name":"保定"},
				{"id":"128","name":"廊坊"}
			]
		},
		{
			"id":"1004",
			"name":"山东",
			"citys":[
				{"id":"131","name":"淄博"},
				{"id":"132","name":"济宁"},
				{"id":"133","name":"青岛"},
				{"id":"134","name":"日照"},
				{"id":"135","name":"烟台"}
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
		//1. 获得shenginfo数组中所有省份信息的id和name
		//pp1省市联动,便利数组
		for(var i=0;i<shenginfo.length;i++){
		//初始化省份的每一条消息
			var sid = shenginfo[i].id;
			var sname = shenginfo[i].name;
			//得到省份的那个select,拼在select里面，
			//获得省份的select的方式是通过获得省份的id，
			//拼接的方式是.append
			//$(),里面是创造出来的option标签加上省份对应的内容
			//所有省份的信息可以通过下标的方式从函数数组中获得
			//注意点，""，保证代码的格式正确
			$("#sheng").append($("<option value='"+sid+"'>"+sname+"</option>"));
		}
		//2. 初始化city城市信息
		var citys = shenginfo[0].citys;
		for(var i=0;i<citys.length;i++){
			//citys[i].id   name   option 
			//步骤同上，设置初始化省为河南省,市为河南省的市
			$("#city").append($('<option value="'+citys[i].id+'">'+citys[i].name+'</option>'));
		}
		
	}
	function changeCitys(){
		//清空城市下拉列表
		//dom.empty();
		//通过id获得市市的那个下拉列表select,并把下拉列表清空
		$("#city").empty();
		//修改city的选项内容。
		//1. 修改哪个省份下的城市信息     i
		//select.selectedIndex
		//通过省份的select的id获得下拉列表select标签，使用prop得到下拉列表的坐标
		var index = $("#sheng").prop("selectedIndex");
		//2. 获得shenginf[i].citys
		//根绝坐标获得具体的城市信息
		var citys = shenginfo[index].citys;
		for(var i=0;i<citys.length;i++){
		//通过city的id得到城市select标签,然后用.append制造出option标签和绑定城市的内容
			$("#city").append($('<option value="'+citys[i].id+'">'+citys[i].name+'</option>'));
			
		}
	}
	//网页加载之后进行绑定
	$(function(){
		//网页load执行运行
		//1. 初始化：信息   事件绑定
		//初始化
		initSelect();
		//2. 绑定sheng的onchange事件
		//获得省份的select用.on的方式绑定单击事件(change)，后面绑定改变城市的函数名
		$("#sheng").on("change",changeCitys);
	});
	
</script>

<style>
.error {
	color: red;
}
</style>
</head>
<body>
	

	
	
	
	
	
	<div id="datagrid_toolbar">
		
		
		车牌号或车架号1111111<input type="text" name="keywords" id="startDate" />
		
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
			<th data-options="field:'xxx',width:60">交强核准起保日期</th>
					<th data-options="field:'systartdate',width:60">商业默认起保日期</th>
				<th data-options="field:'systartdate_hz',width:60">商业核准起保日期</th>
				<th data-options="field:'xxxx',width:35,formatter:person.huawu_fmt">一级跟进状态</th>
				<th data-options="field:'xxxxx',width:35,formatter:person.jiaoqiang_fmt">二级跟进状态</th>
					
				
				<th data-options="field:'xxx',width:60,formatter:person.shanye_fmt">备注</th>
				
						
				
				
				<th data-options="field:'hehe',width:140,formatter:person.op_fmt">操作</th>
			</tr>
		</thead>
	</table>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~编辑person的dialog~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<div id="dialog_person_modify" align='center'>
		<form id="form_person_modify" action="${pageContext.request.contextPath }/insurance/changeStatus1" method="post">
		
			
			
<table>

			
													<tr>
				<td>较强核准起保日期</td>
				<td><input type="date" name="jqstartdate_hz"></td>
				
				</tr>
				
												<tr>
				<td>商业核准起保日期</td>
				<td><input type="date" name="systartdate_hz"></td>
				
				</tr>
				<tr>
					<td>	省份: </td>
		<td><select  name="sheng" id="sheng">
			
		</select></td>
		</tr>
		<tr>
		<td>市:</td>
		<td><select name="city" id="city">
			
		</select></td>
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
			/**
				参数:
				value: 当前列的值。
				row：当前行的json数据。
				index: 数据所在行的下标。
			 */
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
				//console.log(value,row,index);
				if (value == '11') {
					return '错号';
				} 
				else if(value=='12'){
				return '承保限制';
				
				}
								else if(value=='13'){
				
				return '过户';
				}
								else if(value=='14'){
				
				return '异地承保';
				}
								else if(value=='15'){
				
				return '分期车';
				}
								else if(value=='21'){
				
				return '拒访，挂断';
				}
								else if(value=='22'){
				
				return '明确拒绝';
				}
												else if(value=='23'){
				
				return '不让联系';
				}
				
								else if(value=='24'){
				return '投诉倾向';
				
				}
								else if(value=='25'){
				
				return '骂人态度不好';
				}
								else if(value=='26'){
				
				return '现在不方便';
				}
								else if(value=='31'){
				
				return '无人接听';
				}
								else if(value=='32'){
				
				return '停机';
				}
								else if(value=='33'){
				
				return '关机';
				}
												else if(value=='41'){
				
				return '占线';
				}
				
								else if(value=='42'){
				return '暂时无法接通';
				
				}
								else if(value=='43'){
				
				return '空号';
				}
								else if(value=='44'){
				
				return '关机';
				}
								else if(value=='45'){
				
				return '停机';
				}
								else if(value=='46'){
				
				return '长期无人接听';
				}
								else if(value=='51'){
				
				return '平安已保';
				}
												else if(value=='52'){
				
				return '人寿已保';
				}
				
								else if(value=='53'){
				return '太平洋已保';
				
				}
								else if(value=='54'){
				
				return '其他已保';
				}
								else if(value=='55'){
				
				return '人保已保';
				}
								else if(value=='61'){
				
				return '保费计算';
				}
								else if(value=='62'){
				
				return '专人代办';
				}
								else if(value=='63'){
				
				return '与家人商量';
				}
												else if(value=='64'){
				
				return '与其他公司对比';
				}
				
				
												else if(value=='65'){
				
				return '未到期';
				}
												else if(value=='66'){
				
				return '已报价';
				}
				
								else if(value=='67'){
				return '意向跟进';
				
				}
								else if(value=='71'){
				
				return '投保已缴费';
				}
								else if(value=='72'){
				
				return '投保';
				}
				
				else {
					return '未填写';
				}
			}, 
			
			
			
			
		
			
			
			
			
			
			
			/* 格式化显示操作按钮列 */
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
			width:250,
			closed:true,
			modal:true,
			buttons:"#dialog_person_modify_buttons",
		});
	
	
					//每行的编辑按钮添加月昂视和属性。
				$(".person_showupdate_btn").linkbutton({
					iconCls : "icon-edit",
					onClick:function(){
						console.log(this);
						//1. 显示出编辑的dialog。
						$("#dialog_person_modify").dialog({
							closed:false,//显示dialog
						});
						//2. 获得当前行的数据的id属性值: 350041.
						console.log($(this).parent().parent().parent().children().eq(0).find("input").val());
						console.log($(this).parent().parent().parent().children().eq(1).find("input").val());
						console.log($(this).parent().parent().parent().children().eq(2).find("input").val());
						console.log($(this).parent().parent().parent().children().eq(3).find("input").val());
						console.log($(this).parent().parent().parent().children().eq(4).find("input").val());
						var vid = $(this).parent().parent().parent().children().eq(0).find("input").val();
						//3. ajax请求，根据id=350041从控制器端，获得对应的person信息。 json
						//4. 填充在form表单中。"load"
						$("#form_person_modify").form('load',"${pageContext.request.contextPath}/insurance/changeStatus?id="+vid);
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
					msg:json.msg,
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
			width:250,
			closed:true,
			modal:true,
			buttons:"#dialog_person_modify_buttons",
		});
	
	
			$("#dialog_person_modify_buttons a:contains(确定)").linkbutton({
			iconCls:"icon-ok",
			/* 编辑单击事件 */
			onClick:function(){
				//1. 提交表单的数据。
				$("#form_person_modify").form("submit");
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
