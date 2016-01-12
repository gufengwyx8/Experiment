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
			<center><h2>编辑用户信息</h2></center>
			<div style="width:80%;margin:0 auto;">
				<s:form action="editUser" namespace="/user" method="post" cssClass="detail_table" cssStyle="white-space:nowrap;text-align:left;">
					<s:hidden name="user.id" value="%{id}"/>
					<s:textfield name="user.id" label="用户编号" disabled="true"></s:textfield>
					<s:textfield name="user.name" label="用户名"></s:textfield>
					<s:select name="user.type" list="#{'STUDENT':'实验员','TEACHER':'教授'}" label="身份"/>
					<s:submit value="保存"/>
				</s:form>
			</div>
		</div>
		<jsp:include page="../footer.jsp"></jsp:include>
	</body>
</html>
