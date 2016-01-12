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
		<jsp:include page="top.jsp"></jsp:include>
		<div>
			<div style="float: left; width: 45%; padding: 30px;">
				<div style="border-bottom: 1px solid black; font-size: 30px;">
					查找资料
				</div>
				<div style="font-size: 25px; margin: 10px 20px;" id="chapter">
					<div style="margin: 13px 0;" name="<s:property value='#c.number'/>">
						<a href="experiment/multiSearch" class="easyui-linkbutton">多字段查询</a>
					</div>
					<div style="margin: 13px 0;" name="<s:property value='#c.number'/>">
						<a href="http://books.google.com/" class="easyui-linkbutton">Google
							Book</a>
					</div>
				</div>
			</div>
			<div style="float: left; width: 40%; padding: 30px;">
				<div style="border-bottom: 1px solid black; font-size: 30px;">
					实验评论
				</div>
				<div style="font-size: 25px; margin: 10px 20px;" id="chapter">
					<div style="margin: 13px 0;" name="<s:property value='#c.number'/>">
						<a href="http://i.blog.sina.com.cn/blogprofile/index.php?atten=1"
							class="easyui-linkbutton">实验评论</a>
					</div>
				</div>
			</div>
			<div style="float: left; width: 45%; padding: 30px;">
				<div style="border-bottom: 1px solid black; font-size: 30px;">
					查找实验报告
				</div>
				<div style="font-size: 25px; margin: 10px 20px;" id="chapter">
					<div style="margin: 13px 0;" name="<s:property value='#c.number'/>">
						<a href="experiment/listExperiment"
							class="easyui-linkbutton">显示所有报告</a>
					</div>
					<div style="margin: 13px 0;" name="<s:property value='#c.number'/>">
						<a href="http://scholar.google.com.hk/schhp?hl=zh-CN"
							class="easyui-linkbutton">Google Scholar</a>
					</div>
				</div>
			</div>
			<div style="float: left; width: 40%; padding: 30px;">
				<div style="border-bottom: 1px solid black; font-size: 30px;">
					化学数据库
				</div>
				<div style="font-size: 25px; margin: 10px 20px;" id="chapter">

					<div style="margin: 13px 0;" name="<s:property value='#c.number'/>">
						<a href="http://highwire.stanford.edu/lists/freeart.dtl"
							class="easyui-linkbutton">HighWire Press 电子期刊</a>
					</div>
					<div style="margin: 13px 0;" name="<s:property value='#c.number'/>">
						<a href="http://www.biomedcentral.com/journals"
							class="easyui-linkbutton">BioMed Central Open Access Journals</a>
					</div>
					<div style="margin: 13px 0;" name="<s:property value='#c.number'/>">
						<a href="http://www.plos.org/publications/journals/"
							class="easyui-linkbutton">Public Library of Science Journals</a>
					</div>
					<div style="margin: 13px 0;" name="<s:property value='#c.number'/>">
						<a href="http://www.ncbi.nlm.nih.gov/pubmed"
							class="easyui-linkbutton">PubMed</a>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>
