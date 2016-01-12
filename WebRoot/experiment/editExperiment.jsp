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
		<script type="text/javascript" src="plugin/ckeditor/ckeditor.js"></script>
		<script type="text/javascript" src="plugin/ckfinder/ckfinder.js"></script>
		<script type="text/javascript">
			var options={
				filebrowserBrowseUrl : '/ckfinder/ckfinder/ckfinder.html',
				filebrowserImageBrowseUrl : '/ckfinder/ckfinder/ckfinder.html?type=Images',
				filebrowserFlashBrowseUrl : '/ckfinder/ckfinder/ckfinder.html?type=Flash',
				filebrowserUploadUrl : '/ckfinder/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files',
				filebrowserImageUploadUrl : '/ckfinder/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images',
				filebrowserFlashUploadUrl : '/ckfinder/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash'
			};
			$(function(){
				CKEDITOR.replace('txt1',options);
				CKEDITOR.replace('txt2',options);
				CKEDITOR.replace('txt3',options);
				CKEDITOR.replace('txt4',options);
				CKEDITOR.replace('txt5',options);
				$('#user').dialog('close');
				<s:iterator value="experiment.userList" var="e">
					addUser("{'id':'<s:property value='#e.id'/>','name':'<s:property value='#e.name'/>'}");
				</s:iterator>
			});
		</script>
		<script type="text/javascript">
			function myformatter(date){
				var y = date.getFullYear();
				var m = date.getMonth()+1;
				var d = date.getDate();
				return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
			}
			function myparser(s){
				if (!s) return new Date();
				var ss = (s.split('-'));
				var y = parseInt(ss[0],10);
				var m = parseInt(ss[1],10);
				var d = parseInt(ss[2],10);
				if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
					return new Date(y,m-1,d);
				} else {
					return new Date();
				}
			}
			var userArr=[];
			function addUser(val){
				var user=eval("("+val+")");
				for(var i in userArr){
					if(!!userArr[i]&&userArr[i]==user.id){
						return;
					}
				}
				userArr.push(user.id);
				$("<input/>").attr("type","hidden").attr("name","experiment.userList.id").val(user.id).appendTo($("#userList"));
				$("<div/>").attr("id","user"+user.id).html(user.name+"&nbsp;&nbsp;&nbsp;<a href=\"javascript:void(0)\" class='easyui-linkbutton' onclick=\"removeUser("+user.id+");\">删除</a>").appendTo($("#userList"));
			}
			function removeUser(id){
				for(var i in userArr){
					if(!!userArr[i]&&userArr[i]==id){
						delete userArr[i];
					}
				}
				$("#user"+id).remove();				
			}
		</script>
	</head>
	<body>
		<jsp:include page="../top.jsp"></jsp:include>
		<div>
			<center><h2>编辑实验报告</h2></center>
			<div style="width:80%;margin:0 auto;">
				<s:form action="editExperiment" namespace="/experiment" method="post" cssClass="detail_table" cssStyle="white-space:nowrap;text-align:left;">
					<s:textfield name="experiment.date" label="日期" cssClass="easyui-datebox" data-options="formatter:myformatter,parser:myparser" >
						<s:param name="value"><s:date name="experiment.date" format="yyyy-MM-dd"/></s:param> 
					</s:textfield>
					<s:hidden name="experiment.id" value="%{id}"/>
					<s:textfield name="experiment.no" label="编号"></s:textfield>
					<s:textfield name="experiment.address" label="实验地点"></s:textfield>
					<s:textfield name="experiment.mudi" label="实验目的"></s:textfield>
					<tr>
						<td>实验人员:</td>
						<td>
							<div id="userList">
								
							</div>
							<a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#user').dialog('open')">添加</a>
							<div id="user" class="easyui-dialog" title="添加实验人员" style="width:400px;height:200px;padding:10px;font-size:18px;">
								实验人员：<select id="userSelect">
									<s:iterator value="userList" var="u">
										<option value="{'id':'<s:property value='#u.id'/>','name':'<s:property value='#u.name'/>'}"><s:property value="#u.name"/></option>
									</s:iterator>
								</select><br/>
								<a href="javascript:void(0)" class="easyui-linkbutton" onclick="addUser($('#userSelect').val());$('#user').dialog('close')">添加</a>
							</div>
						</td>
					</tr>
					<s:textarea id="txt1" name="experiment.fanyingshi" label="反应式"></s:textarea>
					<s:textarea id="txt2" name="experiment.reference" label="参考文献"></s:textarea>
					<s:textarea id="txt3" name="experiment.yuanliao" label="原料"></s:textarea>
					<s:textarea id="txt4" name="experiment.shiyanbuzhou" label="实验步骤"></s:textarea>
					<s:textfield name="experiment.result" label="检测 "></s:textfield>
					<s:textfield name="experiment.nmr" label="NMR编号 "></s:textfield>
					<s:textfield name="experiment.hplc" label="HPLC编号"></s:textfield>
					<s:textarea id="txt5" name="experiment.remark" label="其他说明"></s:textarea>
					<s:textfield name="experiment.finish" label="完成时间" cssClass="easyui-datebox" data-options="formatter:myformatter,parser:myparser">
						<s:param name="value"><s:date name="experiment.finish" format="yyyy-MM-dd"/></s:param> 
					</s:textfield>
					<s:if test="loginUser!=null&&loginUser.type.toString()=='TEACHER'"><s:select list="#{'true':'合格','false':'不合格'}" name="experiment.review" label="审批"></s:select></s:if>
					<s:submit value="保存"/>
				</s:form>
			</div>
		</div>
		<jsp:include page="../footer.jsp"></jsp:include>
	</body>
</html>
