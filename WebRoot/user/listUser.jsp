<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<base href="<%=basePath%>" />

		<title>Index</title>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		<link rel="stylesheet" type="text/css" href="css/style.css" />
		<link rel="stylesheet" type="text/css"
			href="plugin/easyui/themes/default/easyui.css" />
		<link rel="stylesheet" type="text/css"
			href="plugin/easyui/themes/icon.css" />
		<script type="text/javascript" src="plugin/easyui/jquery.min.js"></script>
		<script type="text/javascript"
			src="plugin/easyui/jquery.easyui.min.js"></script>
	</head>
	<body>
		<jsp:include page="../top.jsp"></jsp:include>
		<div>
			<center><h2>实验人员信息管理</h2></center>
			<div style="text-align:center;margin:5px;">
				<a href="user/editUser" class="easyui-linkbutton">添加实验人员</a>
			</div>
			<div>
				<table class="detail_table" style="width:80%; margin:0 auto;">
					<tr>
						<th>用户编号</th>
						<th>用户名</th>
						<th>用户类型</th>
						<th>操作</th>
					</tr>
					<s:iterator value="userList" var="u">
						<tr>
							<td><s:property value="#u.id"/></td>
							<td><s:property value="#u.name"/></td>
							<td><s:property value="#u.typeName"/></td>
							<td><a href="user/showUser?user.id=<s:property value='#u.id'/>" class="easyui-linkbutton">查看</a>
								<s:if test="loginUser!=null&&loginUser.type.toString()=='ADMIN'">
									<a href="user/removeUser?user.id=<s:property value='#u.id'/>" class="easyui-linkbutton" onclick="return confirm('确认删除吗');">删除</a>
								</s:if>
							</td>
						</tr>
					</s:iterator>
				</table>
			</div>
		</div>
		<jsp:include page="../footer.jsp"></jsp:include>
	</body>
</html>
