
<%@page contentType="text/html;charset=utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/style.css"/>
	<!--font-awesome字体图标库-->
	<link rel="stylesheet" type="text/css" href="../../css/font-awesome.min.css"/>
	<script src="${pageContext.request.contextPath }/js/jquery-1.10.1.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath }/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<title>员工管理系统首页</title>
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
				<form class="form-inline" action="${pageContext.request.contextPath }/user/xiugai2" method="post">
						<table class="table  table-bordered" style="width:100%;">
							<tr class="bg-info">
								<td style="text-align: center;" colspan="2"><span style="font-size: 20px;font-weight: bold;">员工修改</span></td>
							</tr>
							<tr class="active">
								<td style="width: 180px; vertical-align: middle">员工姓名</td>
								
								<input type="hidden" value="${requestScope.kaohe.id }" name="id">
								
								<td><input type="text" style="width: 100%;"  value='${requestScope.kaohe.name }'  class="form-control" name="name" id=""></td>
							</tr>
							<tr class="active">
								<td style="width: 180px; vertical-align: middle">员工薪资</td>
								<td><input type="text" style="width: 100%;" value='${requestScope.kaohe.grade }'  class="form-control" name="grade" id=""></td>
							</tr>
							<tr class="active">
								<td style="width: 180px; vertical-align: middle">员工工号</td>
								<td><input type="text" style="width: 100%;"  value='${requestScope.kaohe.xuehao }'  class="form-control" name="xuehao" id=""></td>
							</tr>
							<tr>
								<td colspan="2"><input type="submit" style="width: 200px;" class="btn btn-success" value="修改"></td>
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
