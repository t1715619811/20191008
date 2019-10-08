
<%@page contentType="text/html;charset=utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="../../css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="../../css/style.css"/>
	<!--font-awesome字体图标库-->
	<link rel="stylesheet" type="text/css" href="../../css/font-awesome.min.css"/>
	<script src="../../js/jquery-1.10.1.js" type="text/javascript" charset="utf-8"></script>
	<script src="../../js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<title>添加员工薪资首页</title>
<style type="text/css">
	th {
		text-align: center;
	}
</style>
</head>
<body>
	<div class="container-fluid">

		
		<div class="row">
			<div class="col-md-12"></div>
		</div>
		<!--信息管理table-->
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8" style="text-align: center;">
				<form class="form-inline" action="${pageContext.request.contextPath }/user/zengjia" method="post">
						<table class="table  table-bordered" style="width:100%;">
							<tr class="bg-info">
								<td style="text-align: center;" colspan="2"><span style="font-size: 20px;font-weight: bold;">添加员工薪资</span></td>
							</tr>
							<tr class="active">
								<td style="width: 180px; vertical-align: middle">姓名</td>
								<td><input type="text" style="width: 100%;" placeholder="请输入员工姓名" class="form-control" name="name" id=""></td>
							</tr>
							<tr class="active">
								<td style="width: 180px; vertical-align: middle">员工薪资</td>
								<td><input type="text" style="width: 100%;" placeholder="请输入员工薪资" class="form-control" name="grade" id=""></td>
							</tr>
							<tr class="active">
								<td style="width: 180px; vertical-align: middle">工号</td>
								<td><input type="text" style="width: 100%;" placeholder="请输入员工工号" class="form-control" name="xuehao" id=""></td>
							</tr>
							<tr>
								<td colspan="2"><input type="submit" style="width: 200px;" class="btn btn-success" value="添加"></td>
							</tr>
						</table>
					</form>
			</div>
			<div class="col-md-2"></div>
		</div>
		<!--底部-->
		<div class="row">
			<div class="com-md-12">
				<!--底部-->
				<footer class="modal-footer navbar-fixed-bottom">
					<div class="row">
						<div class="col-md-2"></div>

						<div class="col-md-2"></div>
					</div>
				</footer>
			</div>
		</div>
	</div>
</body>
</html>
