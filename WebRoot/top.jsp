<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<div class="container">
	<script type="text/javascript">
		var timeout = 500;
		var closetimer = 0;
		var ddmenuitem = 0;
	
		// open hidden layer
		function mopen(id) {
			// cancel close timer
			mcancelclosetime();
	
			// close old layer
			if (ddmenuitem)
				ddmenuitem.style.visibility = 'hidden';
	
			// get new layer and show it
			ddmenuitem = document.getElementById(id);
			ddmenuitem.style.visibility = 'visible';
	
		}
		// close showed layer
		function mclose() {
			if (ddmenuitem)
				ddmenuitem.style.visibility = 'hidden';
		}
	
		// go close timer
		function mclosetime() {
			closetimer = window.setTimeout(mclose, timeout);
		}
	
		// cancel close timer
		function mcancelclosetime() {
			if (closetimer) {
				window.clearTimeout(closetimer);
				closetimer = null;
			}
		}
	
		// close layer when click-out
		document.onclick = mclose;
		// -->
	</script>
	<script type="text/javascript">
			$(function(){
				$('#login').dialog('close');
				$('#reg').dialog('close');
			});
		</script>
	<div class="header">
		<div class="title">
			<div>
				科学数据管理系统
			</div>
		</div>
		<ul>
			<s:if test="loginUser!=null">
				<li>
					欢迎,
					<s:property value="loginUser.name" />
				</li>
				<li>
					<a href="logout">登出</a>
				</li>
			</s:if>
			<s:else>
				<div>
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#login').dialog('open')">登录</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#reg').dialog('open')">注册</a>
				<div id="login" class="easyui-dialog" title="登录" style="width:400px;height:200px;padding:10px;font-size:18px;">
					<s:form action="login" method="post" namespace="/">
						<s:select name="user.type" list="#{'STUDENT':'实验员','TEACHER':'教授','ADMIN':'管理员'}" label="身份"/>
						<s:textfield name="user.name" label="用户名"/>
						<s:password name="user.password" label="密码"/>
						<s:submit value="登录"/>
					</s:form>
				</div>
				<div id="reg" class="easyui-dialog" title="注册" style="width:400px;height:200px;padding:10px;font-size:18px;">
					<s:form action="reg" method="post" namespace="/">
						<s:select name="user.type" list="#{'STUDENT':'实验员','TEACHER':'教授'}" label="身份"/>
						<s:textfield name="user.name" label="用户名"/>
						<s:password name="user.password" label="密码"/>
						<s:submit value="注册" onclick="alert('注册成功');"/>
					</s:form>
				</div>
			</div>
			</s:else>
		</ul>
	</div>
	<div class="navList">
		<ul id="sddm">
			<li><a href="index" onmouseover="mopen('m0')" onmouseout="mclosetime()">主页</a>
				<div id="m0" onmouseover="mcancelclosetime()" onmouseout="mclosetime()">
				</div>
			</li>
			<s:if test="loginUser!=null">
			<li><a href="#" onmouseover="mopen('m1')" onmouseout="mclosetime()">实验管理</a>
				<div id="m1" onmouseover="mcancelclosetime()" onmouseout="mclosetime()">
					<a href="experiment/listExperiment">实验内容信息管理</a>
					<a href="user/listUser">实验人员信息查询</a>
				</div>
			</li>
			<li><a href="#" onmouseover="mopen('m2')" onmouseout="mclosetime()">个人信息管理</a>
				<div id="m2" onmouseover="mcancelclosetime()" onmouseout="mclosetime()">
					<a href="user/showUser?user.id=<s:property value='loginUser.id'/>">查看信息</a>
					<a href="user/editUser?id=<s:property value='loginUser.id'/>">修改信息</a>
					<a href="user/password">修改密码</a>
				</div>
			</li>
			<s:if test="loginUser.type.toString()=='ADMIN'">
			<li><a href="article/listArticle" onmouseover="mopen('m3')" onmouseout="mclosetime()">用户管理</a>
				<div id="m3" onmouseover="mcancelclosetime()" onmouseout="mclosetime()">
					<a href="user/listUser?type=STUDENT">实验员管理</a>
					<a href="user/listUser?type=TEACHER">教授管理</a>
					<a href="user/listUser?type=ADMIN">管理员管理</a>
				</div>
			</li>
			</s:if>
			</s:if>
		</ul>
		<div style="clear:both"></div>
	</div>
	<div class="main">
		<div class="mainBody">
		<div style="height:1px;"></div>