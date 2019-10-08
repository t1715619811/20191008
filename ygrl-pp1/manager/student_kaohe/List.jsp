<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

 

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/style.css"/>
	<!--font-awesome字体图标库-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/font-awesome.min.css"/>
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
<img src="${pageContext.request.contextPath }/upload/${sessionScope.usert.pic}" width="100px" alt="">
	<div class="container-fluid">

		<!--按钮工具栏-->
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-2">
				
			</div>
						<div class="col-md-3">
				<form action="${pageContext.request.contextPath }/user/mohuselect" class="form form-inline input-group">
					<input type="text" class="form-control" placeholder="请输入员工名" name="name" id="name" />
					<span class="input-group-btn"><input type="submit" class="btn btn-success" value="搜索" /></span>	
				</form>
			</div>	
			<div class="col-md-5"></div>
		</div>
	
	
	
	
	
	
	
	
	
	
	<form action="${pageContext.request.contextPath }/department/deleteDepartments.do">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-2">
				<!--按钮组-->
				<div class="btn-group">
					<a href="${pageContext.request.contextPath }/manager/student_kaohe/Add.jsp" class="btn btn-info btn-sm"><span class="glyphicon glyphicon-plus"></span> 添加员工月薪</a>

					
				</div>
			</div>
			<div class="col-md-3">
				
			</div>				
			<div class="col-md-5"></div>
		</div>
		<div class="row">
			<div class="col-md-12"></div>
		</div>
		<!--月薪管理table-->
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<table class="table table-bordered table-condensed table-hover">
					<thead>
						<tr class="bg-info text-capitalize">

							<th>编号</th>
							<th>姓名</th>
							<th>月薪</th>
							<th>工号</th>
							<th style="width: 20%;">操作</th>
						</tr>
					</thead>
					<tbody>
					
	

	
	
	
			
			
 
 <c:forEach var="p" items="${sessionScope.zongshu}">    
						<tr>

							<td>${p.id }</td>
							<td>${p.name }</td>
							<td>${p.grade }</td>
							<td>${p.xuehao }</td>
							<td>
								<a href="${pageContext.request.contextPath}/user/shanchuchengji?id=${p.id }" class="btn btn-xs btn-warning"><span class="glyphicon glyphicon-trash"></span> 删除</a>
								<a href="${pageContext.request.contextPath}/user/xiugai?id=${p.id }" class="btn btn-xs btn-info"><span class="glyphicon glyphicon-edit"></span> 修改</a>
								
							</td>
						</tr>
 </c:forEach>








					</tbody>
				</table>
			</div>
			<div class="col-md-2"></div>
		</div>
		</form>
		<!--分页-->
		<div class="row">
			<div class="col-md-4"></div>
			
			
			
			
			
			
			<div class="col-md-4">
				<ul class="pager">
				<c:if test="${sessionScope.dpagenum >1}">
					<li class="previous"><a href="#" class="btn btn-default">上一页</a></li>
					</c:if>
					
					
					<c:if test="" >
					<li class="next"><a href="#" class="btn btn-default">下一页</a></li>
				</c:if>
				</ul>
				
			</div>
			
			
			
			
			
			
			
			<div class="col-md-4"></div>
		</div>
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
