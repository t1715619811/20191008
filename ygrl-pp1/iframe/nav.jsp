

<%@page contentType="text/html;charset=utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/style.css"/>
	<script src="${pageContext.request.contextPath }/js/jquery-1.10.1.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath }/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
	
	
	
	
	
<title>医院分诊管理系统首页</title>
</head>
<body>
			<!--	
				导航条
				navbar 导航条
				navbar-default 主题风格
				navbar-fixed-top 固定到顶部
			-->
			<nav class="navbar navbar-default ">
				<!--标题LOGO-->
				<div class="navbar-header">
					<a href="#" class="navbar-brand" style="font-size:30px;font-weight: bold;">分诊管理系统</a>
				</div>
				<!--导航组-->
				<div class="container-fluid">
					<ul class="nav navbar-nav">
						<!--菜单项-->
						<li><a href="../index.jsp" target="_top">首页</a></li>
						<li> 
							<!--data-toggle 使得当前超链接可以点击并下拉选项-->
							<a href="#" data-toggle="dropdown">科室管理</a>
							<!--让菜单选项隐藏起来-->
							<ul class="dropdown-menu">
								<li><a href="${pageContext.request.contextPath }/manager/department/DepartmentList.jsp" target="_top">科室管理</a></li>
								<li><a href="${pageContext.request.contextPath }/manager/department/AddDepartment.jsp" target="_top">增加科室</a></li>
							</ul>
						</li>
						<li>
							<!--data-toggle 使得当前超链接可以点击并下拉选项-->
							<a href="#" data-toggle="dropdown">患者管理</a>
							<!--让菜单选项隐藏起来-->
							<ul class="dropdown-menu">
								<!-- <li><a href="../manager/patient/PatientList.html" target="_top">患者管理</a></li> -->
								<li><a href="${pageContext.request.contextPath }/patient/showAll" target="_top">患者管理</a></li>
								
								
								<li><a href="${pageContext.request.contextPath }/manager/patient/AddPatient.jsp" target="_top">增加患者</a></li>
							</ul>
						</li>
										
						
						<li> 
							<!--data-toggle 使得当前超链接可以点击并下拉选项-->
							<a href="#" data-toggle="dropdown">分诊管理</a>
							<!--让菜单选项隐藏起来-->
							<ul class="dropdown-menu">
								<li><a href="${pageContext.request.contextPath }/patient/wannengs.do" target="_top">分诊管理</a></li>
							</ul>
						</li>
						
						
						
												<li> 
							<!--data-toggle 使得当前超链接可以点击并下拉选项-->
							<a href="#" data-toggle="dropdown">医药采购平台</a>
							<!--让菜单选项隐藏起来-->
							<ul class="dropdown-menu">
								<li><a href="${pageContext.request.contextPath }/drug/showDrugschu.do" target="_top">药品管理</a></li>
								<li><a href="${pageContext.request.contextPath }/exam/yaosheng.do" target="_top">药品审核</a></li>
							</ul>
						</li>
						
						
						
						
												<li>
						
													<!--data-toggle 使得当前超链接可以点击并下拉选项-->
							<a href="#" data-toggle="dropdown">日志管理</a>
							<!--让菜单选项隐藏起来-->
							<ul class="dropdown-menu">
								<li><a href="${pageContext.request.contextPath }/user/denglurizhi.do" target="_top">登录日志</a></li>
								<li><a href="${pageContext.request.contextPath }/user/zhengduanrizhi.do" target="_top">诊断日志</a></li>
							</ul>
						</li>
						
						
						
						
						
						
						<li> 
							<!--data-toggle 使得当前超链接可以点击并下拉选项-->
							<a href="#" data-toggle="dropdown">其他管理</a>
							<!--让菜单选项隐藏起来-->
							<ul class="dropdown-menu">
								<li><a href="${pageContext.request.contextPath }/user/selectAllFiles.do" target="_top">共享文档</a></li>
								<li><a href="#" target="_top">值班管理</a></li>
								<li><a href="#" target="_top">通知管理</a></li>
							</ul>
						</li>
						
					</ul>
					<!--退出登陆-->
					<ul class="nav nav-form navbar-nav navbar-right">
						<li><a href="${pageContext.request.contextPath }/user/tuichu.do" target="_top"><span class="glyphicon glyphicon-log-out"></span>退出</a></li>
					</ul>
				</div>
			</nav>
</body>
</html>
