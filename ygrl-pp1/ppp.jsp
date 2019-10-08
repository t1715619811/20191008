
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title></title>
		
		<link rel="stylesheet" href="${pageContext.request.contextPath }/themes/default/easyui.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/themes/icon.css"/>
		<link href="css/font-awesome.min.css" rel="stylesheet">
		<script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath }/js/jquery.easyui.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${pageContext.request.contextPath }/js/easyui-lang-zh_CN.js" type="text/javascript" charset="utf-8"></script>
		<style>
			.easyui-accordion ul{
				list-style: none;
				margin: 5px 0px 55px 0px;
				padding: 0px;
				text-align: center;
			}
			.easyui-accordion ul>li>a{
				display: block;
				padding: 5px;
			}
			
			
		</style>
	</head>
	<body class="easyui-layout">
	<!-- 	<div data-options="region:'north'" style="height: 80px;">Logo还没有画</div> -->
		<div data-options="region:'south',split:true" style="height: 50px;"></div>
		<!--<div data-options="region:'east',title:'通知',collapsed:true" style="width: 20%;"></div>-->
		<div data-options="region:'west',title:'菜单',split:true" style="width: 12%;">
		<input type="text" value="${sessionScope.zhuanshu1}" style="display:none" id="cuowujiemian1">
		<input type="text" value="${sessionScope.zhuanshu2}" style="display:none" id="cuowujiemian2">
		<input type="text" value="${sessionScope.zhuanshu3}" style="display:none" id="cuowujiemian3">
		
		<input type="text" value="${sessionScope.baobiao11}" style="display:none" id="baobiao11">
		<input type="text" value="${sessionScope.baobiao12}" style="display:none" id="baobiao12">
		<input type="text" value="${sessionScope.baobiao13}" style="display:none" id="baobiao13">
		<input type="text" value="${sessionScope.baobiao21}" style="display:none" id="baobiao21">
		<input type="text" value="${sessionScope.baobiao22}" style="display:none" id="baobiao22">
		<input type="text" value="${sessionScope.baobiao23}" style="display:none" id="baobiao23">
		<input type="text" value="${sessionScope.baobiao31}" style="display:none" id="baobiao31">
		<input type="text" value="${sessionScope.baobiao32}" style="display:none" id="baobiao32">
		<input type="text" value="${sessionScope.baobiao33}" style="display:none" id="baobiao33">
		
		
		
		
			<div class="easyui-accordion" style="margin: 0px;height: 100%;">
				<div data-options="title:'系统管理'">
					<ul>
						<li><a class="easyui-linkbutton" style="height: 30px;" href="#"> <i class="fa fa-user-circle-o"></i>修改密码</a></li>
					    <li id="tuichudenglu"><a class="easyui-linkbutton" style="height: 30px;" href="#"> <i class="fa fa-user-circle-o"></i>退出登录</a></li>
					</ul>
				</div>
				<div data-options="title:'用户操作'">
					<ul>
						<li><a class="easyui-linkbutton" style="height: 30px;" href="#"> <i class="fa fa-home"></i> 员工认领</a></li>
						<li><a class="easyui-linkbutton" style="height: 30px;" href="#"> <i class="fa fa-user-circle"></i> 修改状态</a></li>
						<c:if test="${sessionScope.user.power.trim()!='坐席' }">
						<li><a class="easyui-linkbutton" style="height: 30px;" href="#"> <i class="fa fa-line-chart"></i>数据划转</a></li>
						</c:if>
					</ul>
				</div>
				<div data-options="title:'统计查询'">
					<ul>
					
			<c:if test="${sessionScope.user.power.trim()!='坐席' }">
						<li><a class="easyui-linkbutton" style="height: 30px;" href="#">超期未认领清单</a></li>
						</c:if>
						<c:if test="${sessionScope.user.power.trim()!='坐席' }">
						<li><a class="easyui-linkbutton" style="height: 40px;" href="#">超期认领清单查询</a></li>
						</c:if>
						<li><a class="easyui-linkbutton" style="height: 30px;" href="#">已认领数据查询</a></li>
						<c:if test="${sessionScope.user.power.trim()!='坐席' }">
						<li><a class="easyui-linkbutton" style="height: 30px;" href="#">区部认领报表</a></li>
						</c:if>
						<c:if test="${sessionScope.user.power.trim()!='坐席' }">
						<li><a class="easyui-linkbutton" style="height: 30px;" href="#">团队认领报表</a></li>
						</c:if>
						<c:if test="${sessionScope.user.power.trim()!='坐席' }">
						<li><a class="easyui-linkbutton" style="height: 30px;" href="#">坐席认领报表</a></li>
						</c:if>
						<c:if test="${sessionScope.user.power.trim()!='坐席' }">
						<li><a class="easyui-linkbutton" style="height: 30px;" href="#">区部承保报表</a></li>
						</c:if>
						<c:if test="${sessionScope.user.power.trim()!='坐席' }">
						<li><a class="easyui-linkbutton" style="height: 30px;" href="#">团队承保报表</a></li>
						</c:if>
						<c:if test="${sessionScope.user.power.trim()!='坐席' }">
						<li><a class="easyui-linkbutton" style="height: 30px;" href="#">坐席承保报表</a></li>
						</c:if>
						<c:if test="${sessionScope.user.power.trim()!='坐席' }">
						<li><a class="easyui-linkbutton" style="height: 30px;" href="#">区部跟进报表</a></li>
						</c:if>
						<c:if test="${sessionScope.user.power.trim()!='坐席' }">
						<li><a class="easyui-linkbutton" style="height: 30px;" href="#">团队跟进报表</a></li>
						</c:if>
						<c:if test="${sessionScope.user.power.trim()!='坐席' }">
						<li><a class="easyui-linkbutton" style="height: 30px;" href="#">坐席跟进报表</a></li>
						</c:if>
						
						
						
					</ul>					
				</div>
				<div data-options="title:'后续模块'">
					<ul>
						<li><a class="easyui-linkbutton" style="height: 30px;" href="#">后续模块</a></li>
						<li><a class="easyui-linkbutton" style="height: 30px;" href="#">后续模块</a></li>
					</ul>
					
				</div>
				<div data-options="title:'后续模块'">
					<ul>
						<li><a class="easyui-linkbutton" style="height: 30px;" href="#"><i class="fa fa-calendar"></i>后续模块</a></li>
					</ul>
					
				</div>
			</div>
		</div>
		
		<div data-options="region:'center',title:'主页         欢迎：${sessionScope.user.username }登入系统'">
		
	
			<div id="tt" >
			</div>		
				
		</div>
		
		<script type="text/javascript">
			/*初始化tabs*/
			$("#tt").tabs();
			
			/*菜单事件*/
			
			$(".easyui-accordion ul>li>a").on('click',function(){
				console.log($(this).text());
				console.log($("#cuowujiemian1").val());
				switch($(this).text().trim()){
					case '修改密码':
						//判断是否已经有员工认领
						$("#tt").tabs('close',0);
							$("#tt").tabs('add',{
								index:0,
								title:'修改密码',
								href:"${pageContext.request.contextPath}/UserList.jsp",
								closable:true,
							});
						
						break;
				
						
					case '员工认领':
						//判断是否已经有员工认领
						$("#tt").tabs('close',0);
							$("#tt").tabs('add',{
								index:0,
								title:'员工认领',
								href:"${pageContext.request.contextPath}/baodan.jsp",
								closable:true,
							});
					break;
					case '修改状态':
						$("#tt").tabs('close',0);
							$("#tt").tabs('add',{
								index:0,
								title:'修改状态',
								href:"${pageContext.request.contextPath}/erjiliandong.jsp",
								closable:true,
								
							});
						
					break;
				
				
				//第三模块
				
		 							case '超期未认领清单':
						//判断是否已经有员工认领
						$("#tt").tabs('close',0);
							$("#tt").tabs('add',{
							
							
								index:0,
								title:'超期未认领清单',
								href:$("#cuowujiemian1").val(),
								closable:true,
							});
						
						break; 
				
						 							case '超期认领清单查询':
						//判断是否已经有员工认领
						$("#tt").tabs('close',0);
							$("#tt").tabs('add',{
								index:0,
								title:'超期认领清单查询',
								href:$("#cuowujiemian2").val(),
								closable:true,
							});
						
						break; 
				
				
					case '已认领数据查询':
						//判断是否已经有员工认领
						$("#tt").tabs('close',0);
							$("#tt").tabs('add',{
								index:0,
								title:'已认领清单查询',
								href:"${pageContext.request.contextPath}/yirenling.jsp",
								closable:true,
							});
						
						break; 

				
						case '数据划转':
						//判断是否已经有员工认领
						$("#tt").tabs('close',0);
							$("#tt").tabs('add',{
								index:0,
								title:'数据划转',
								href:$("#cuowujiemian3").val(),
								closable:true,
							});
						
						break; 
						
						
						
//针对报表的
						case '区部认领报表':
						//判断是否已经有员工认领
						$("#tt").tabs('close',0);
							$("#tt").tabs('add',{
								index:0,
								title:'区部认领报表',
								href:$("#baobiao31").val(),
								closable:true,
							});
						
						break; 	
					
											case '团队认领报表':
						//判断是否已经有员工认领
						$("#tt").tabs('close',0);
							$("#tt").tabs('add',{
								index:0,
								title:'团队认领报表',
								href:$("#baobiao32").val(),
								closable:true,
							});
						
						break; 
					
											case '坐席认领报表':
						//判断是否已经有员工认领
						$("#tt").tabs('close',0);
							$("#tt").tabs('add',{
								index:0,
								title:'坐席认领报表',
								href:$("#baobiao33").val(),
								closable:true,
							});
						
						break; 
					
					
											case '区部承保报表':
						//判断是否已经有员工认领
						$("#tt").tabs('close',0);
							$("#tt").tabs('add',{
								index:0,
								title:'区部承保报表',
								href:$("#baobiao11").val(),
								closable:true,
							});	
						break; 
					
										
											case '团队承保报表':
						//判断是否已经有员工认领
						$("#tt").tabs('close',0);
							$("#tt").tabs('add',{
								index:0,
								title:'团队承保报表',
								href:$("#baobiao12").val(),
								closable:true,
							});
						
						break; 
					
						
											
											case '坐席承保报表':
						//判断是否已经有员工认领
						$("#tt").tabs('close',0);
							$("#tt").tabs('add',{
								index:0,
								title:'坐席承保报表',
								href:$("#baobiao13").val(),
								closable:true,
							});
						
						break; 
						
						
						
								case '区部跟进报表':
						//判断是否已经有员工认领
						$("#tt").tabs('close',0);
							$("#tt").tabs('add',{
								index:0,
								title:'区部跟进报表',
								href:$("#baobiao21").val(),
								closable:true,
							});
						
						break; 
					
										
											case '团队跟进报表':
						//判断是否已经有员工认领
						$("#tt").tabs('close',0);
							$("#tt").tabs('add',{
								index:0,
								title:'团队跟进报表',
								href:$("#baobiao22").val(),
								closable:true,
							});
						
						break; 
					
						
											
											case '坐席跟进报表':
						//判断是否已经有员工认领
						$("#tt").tabs('close',0);
							$("#tt").tabs('add',{
								index:0,
								title:'坐席跟进报表',
								href:$("#baobiao23").val(),
								closable:true,
							});
						
						break;
						
						
						
						

				}
			});
			
			
			
			
			$("#tuichudenglu").on('click',function(){
			
			
			
			 location.href=("${pageContext.request.contextPath}/last/tuichu");
			
			
			
			});
			
			
			
			
			
			
		</script>
	</body>
</html>
