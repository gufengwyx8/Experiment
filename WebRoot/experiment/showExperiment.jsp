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
			<center><h2>实验报告</h2></center>
			<div style="width:80%;margin:0 auto;">
				<div>
					<div style="float:left;">日期：<s:date name="experiment.date" format="yyyy-MM-dd"/></div>
					<div style="float:right;">编号：<s:property value="experiment.no"/></div>
				</div>
				<table class="detail_table" style="clear:both;text-align:left;">
					<tr>
						<td width="80px">实验目的</td>
						<td><s:property value="experiment.mudi"/></td>
						<td >实验人员</td>
						<td>
							<s:iterator value="experiment.userList" var="u">
								<s:property value="#u.name"/>
							</s:iterator>
						</td>
					</tr>
					<tr>
						<td>反应式</td>
						<td colspan="3">
							<s:property value="experiment.fanyingshi" escape="false"/>
						</td>
					</tr>
					<tr>
						<td>参考文献</td>
						<td colspan="3"><s:property value="experiment.reference" escape="false"/></td>
					</tr> 
					<tr>
						<td>原料</td>
						<td colspan="3"><s:property value="experiment.yuanliao" escape="false"/></td>
					</tr> 
					<tr>
						<td>实验步骤</td>
						<td colspan="3"><s:property value="experiment.shiyanbuzhou" escape="false"/></td>
					</tr> 
					<tr>
						<td colspan="2">检测结果:<s:property value="experiment.result"/></td>
						<td>NMR编号:<s:property value="experiment.nmr"/></td>
						<td>HPLC编号:<s:property value="experiment.hplc"/></td>
					</tr> 
					<tr>
						<td>其他说明</td>
						<td colspan="3"><s:property value="experiment.remark" escape="false"/></td>
					</tr> 
				</table>
				<div>完成时间：<s:date name="experiment.finish" format="yyyy-MM-dd"/></div>
				<div style="text-align:right;">
					<a href="experiment/editExperiment?id=<s:property value='experiment.id'/>" class="easyui-linkbutton">编辑</a>
				</div>
			</div>
		</div>
		<jsp:include page="../footer.jsp"></jsp:include>
	</body>
</html>
