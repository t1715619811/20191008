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
		
		
		车牌号或车架号<input type="text" name="keywords" id="startDate" />
		
		<!-- <span id="keyword">搜索</span> -->
		<a href="javascript:searchStudent()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
		
		</div>
		
	

	
		<!--~~~~~~~~~~~~~~~~~~~~ 编辑+认领的dialog的按钮组 ~~~~~~~~~~~~~~~~~~~~-->
	<div id="dialog_person_modify_buttons">
		<a href="#">确定</a>
	</div>
	
	

	<!--~~~~~~~~~~~~~~~~~~~~ 展示person的table ~~~~~~~~~~~~~~~~~~~~-->
	<table id="datagrid_person">
		<thead>
			<tr>
				<th data-options="field:'id',width:100,checkbox:true">ID</th>
				<th data-options="field:'licenseno',width:120">车牌号</th>
				<th data-options="field:'frameno',width:80,formatter:person.sex_fmt">车架号</th>
				<th data-options="field:'inputdate',width:80">导入日期</th>
				<th data-options="field:'enddate',width:80">终保日期</th>
				
				<th data-options="field:'hehe',width:200,formatter:person.op_fmt">操作</th>
			</tr>
		</thead>
	</table>
	
	<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~编辑person的dialog~~~~~~~~~~~~~~~~~~~~~~~~ -->
	<div id="dialog_person_modify" align='center'>
		<form id="form_person_modify" action="${pageContext.request.contextPath }/insurance/changeStatus1?idp=1" method="post">
		
			
			
<table>

			
													<tr>
				<td>交强核准起保日期</td>
				<td><input type="date" name="jqstartdate_hz"></td>
				
				</tr>
				
												<tr>
				<td>商业核准起保日期</td>
				<td><input type="date" name="systartdate_hz"></td>
				
				</tr>
				<tr>
					<td>	一级跟进: </td>
		<td>
		  <select  name="yjgj" id="sheng22" >111</select>
		</td>
		</tr>
		<tr>
		<td>二级跟进:</td>
		<td><select name="ejgj" id="city">
			
		</select></td>
</tr>


<tr>
<td>备注</td>

<td><textarea rows="4" cols="40" name="remark" placeholder="最多50字" maxlength="50"
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

			
			
			
			
			
			
			/* 格式化显示操作按钮列 */
			op_fmt : function(value, row, index) {
				return '<a class="person_showupdate_btn" href="#">编辑+认领</a>';
			}

		};

		/*~~~~~~~~~~~~~~~~~~~~ 生效datagrid效果 ~~~~~~~~~~~~~~~~~~~~*/
		//$("table").datagrid();
		$("#datagrid_person").datagrid({
			title : "客户信息",
			iconCls : "icon-man",
			height : 500,
			url : '${pageContext.request.contextPath}/insurance/showAll',//自动请求url，自动创建tr，装在数据.
			toolbar : '#datagrid_toolbar',//引用按钮组,
			rownumbers : true,//显示行号
			checkOnSelect : true,//使行只有在复选框选中，才是真正的选中。 
			fitColumns : true,//让表格列宽，强行自适应到整合页面宽度
			striped : true,//斑马线效果
			onLoadSuccess : function() {//datagrid数据加载完毕之后，执行的代码
				//datagrid数据加载完毕，在使用easyui插件，再次是按钮效果生效。
				//$("shanchu").linkbutton();
				//为每行的删除按钮添加样式和属性
	
				//每行的编辑+认领按钮添加月昂视和属性。
			$("#dialog_person_modify").dialog({
			title:"编辑+认领客户信息",
			iconCls:"icon-man",
			width:1000,
			closed:true,
			modal:true,
			buttons:"#dialog_person_modify_buttons",
		});
	
	
					//每行的编辑+认领按钮添加月昂视和属性。
				$(".person_showupdate_btn").linkbutton({
					iconCls : "icon-edit",
					onClick:function(){
						
										    $("#jqstartdate_hz").val("");
				    $("#systartdate_hz").val("");
						$("#form_person_modify").form('clear');
						//1. 显示出编辑的dialog。
						$("#dialog_person_modify").dialog({
							closed:false,//显示dialog
						});
						//2. 获得当前行的数据的id属性值: 350041.
						
						var vid = $(this).parent().parent().parent().children().eq(0).find("input").val();
						//3. ajax请求，根据id=350041从控制器端，获得对应的person信息。 json
						//4. 填充在form表单中。"load"
						$("#form_person_modify").form('load',"${pageContext.request.contextPath}/insurance/changeStatus?id="+vid);
					}
				});
	
			$("#form_person_modify").form({
			success:function(data){
				//编辑+认领的表单提交成功，且服务器响应回到浏览器。
				
				//1. 关闭编辑+认领的dialog
				$("#dialog_person_modify").dialog({
					closed:true,
				});
				//2. 提示：编辑+认领成功。
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
	
	
			/*~~~~~~~~~~~~~~~~~~~~~~~~~ 初始化编辑+认领的dialog和form表单 ~~~~~~~~~~~~~~~~~~~~~~~~~*/
		$("#dialog_person_modify").dialog({
			title:"编辑+认领客户信息",
			iconCls:"icon-man",
			width:1000,
			closed:true,
			modal:true,
			buttons:"#dialog_person_modify_buttons",
		});
	
	
			$("#dialog_person_modify_buttons a:contains(确定)").linkbutton({
			iconCls:"icon-ok",
			/* 编辑+认领单击事件 */
			onClick:function(){
			
			var p1=$("#jqstartdate_hz").val();
			var p2=$("systartdate_hz").val();
			var p3=$("#sheng22").val();
			var p4=$("#city").val();
			var p5=$("#remark").val();
		
	
			if(p3==null||p3==0){
			alert("跟进原因不能为空");
			}
 		if(p3!=null&&p3!=0){
			
		
				$("#form_person_modify").form("submit");
			} 
			

			}
		});
	

	
			},
			pagination : true//添加分页工具栏
		});


		/*~~~~~~~~~~~~~~~~~~~~~~~~~ easyui样式bug微调 ~~~~~~~~~~~~~~~~~~~~~~~~~*/
		
		$("#dialog_person_add_buttons").css("width","240px").css("text-align",'center');
		
		$("#dialog_person_modify_buttons").css("width","240px");
		var sheng22info = [
		
		
		
		
				{
			"id":"0",
			"name":"  ",
			"citys":[
			
				{"id":"01","name":"  "},
			
			
			]
		},
		
		{
			"id":"1",
			"name":"非目标客户",
			"citys":[
			
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
			"citys":[
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
			"citys":[
				{"id":"31","name":"无人接听"},
				{"id":"32","name":"停机"},
				{"id":"33","name":"关机"}
				
			]
		},
		{
			"id":"4",
			"name":"无话务功能",
			"citys":[
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
			"citys":[
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
			"citys":[
				
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
			"citys":[
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
		//1. 获得sheng22info数组中所有省份信息的id和name
		//pp1省市联动,便利数组
		for(var i=0;i<sheng22info.length;i++){
		//初始化省份的每一条消息
			var sid = sheng22info[i].id;
			var sname = sheng22info[i].name;
			//得到省份的那个select,拼在select里面，
			//获得省份的select的方式是通过获得省份的id，
			//拼接的方式是.append
			//$(),里面是创造出来的option标签加上省份对应的内容
			//所有省份的信息可以通过下标的方式从函数数组中获得
			//注意点，""，保证代码的格式正确
			$("#sheng22").append($("<option value='"+sid+"'>"+sname+"</option>"));
		}
		//2. 初始化city城市信息
		var citys = sheng22info[0].citys;
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
		var index = $("#sheng22").prop("selectedIndex");
		//2. 获得sheng22inf[i].citys
		//根绝坐标获得具体的城市信息
		var citys = sheng22info[index].citys;
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
		//2. 绑定sheng22的onchange事件
		//获得省份的select用.on的方式绑定单击事件(change)，后面绑定改变城市的函数名
		$("#sheng22").on("change",changeCitys);
	});
		
		
		
	</script>
</body>
</html>
