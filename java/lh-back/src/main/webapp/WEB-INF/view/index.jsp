<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="common/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1, maximum-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="renderer" content="webkit">
<title>学一手后台管理系统</title>
<link rel="shortcut icon" href="${ctx}/favicon.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="${ctx}/static/plugin/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${ctx}/static/plugin/jquery-easyui-1.3.3/themes/icon.css">
</head>
<body class="easyui-layout">
    <div region="north" style="height: 78px; background-color: #ffff">
        <table width="100%">
            <tr>
                <td width="50%"></td>
                <td valign="bottom" style="font-size: 20px; color: #8B8B8B; font-family: '\u6977\u4f53';" align="right" width="50%">
                    <span>${sessionScope.weather.results.get(0).currentCity}</span>&nbsp;|&nbsp;
                    <img alt="" src="${sessionScope.weather.results.get(0).weather_data.get(0).dayPictureUrl}"/>&nbsp;|&nbsp;
                   <span>${sessionScope.weather.results.get(0).weather_data.get(0).weather}</span>&nbsp;|&nbsp; 
                    <span>${sessionScope.weather.results.get(0).weather_data.get(0).date}</span>&nbsp;|&nbsp; 
                    <font size="3">&nbsp;&nbsp;<strong>Current Admin:</strong> </font>
                    <font color="red">${sessionScope.currentAdmin.username}</font></td>
            </tr>
        </table>
    </div>
    <div region="center">
        <div class="easyui-tabs" fit="true" border="false" id="tabs">
            <div title="主页" data-options="iconCls:'icon-home'">
                <div align="center" style="padding-top: 50px">
                    <font color="grey" size="10">学一手后台管理系统</font>
                </div>
                <div align="center" style="padding-top: 20px;">
                    <font style="font-size: 20px;">http://47.92.123.48/</font>
                </div>
            </div>
        </div>
    </div>
    <div region="west" style="width: 200px; height: 500px;"
        title="学一手后台管理" split="true">
        <div class="easyui-accordion">
            <div title="课程维护" data-options="selected:true,iconCls:'icon-shujias'" style="padding: 10px; height: 10px;">
            	<a href="javascript:home.openTab('课程管理','${ctx }/course/')" class="easyui-linkbutton" data-options="plain:true" style="width: 150px;">课程管理</a>
            	<a href="javascript:home.openTab('章节管理','${ctx }/course/chapter')" class="easyui-linkbutton" data-options="plain:true" style="width: 150px;">章节管理</a>
            </div>
            <div title="公告管理" data-options="selected:true,iconCls:'icon-wenzhang'" style="padding: 10px; height: 10px;">
                <a href="javascript:home.openTab(' Post Info','postManage.jsp')" class="easyui-linkbutton" data-options="plain:true" style="width: 150px;"> Post Info</a>
            </div>
            <div title="系统设置" data-options="iconCls:'icon-item'" style="padding: 10px; border: none;">
                <a href="javascript:home.openTab(' Admin List','adminManage.jsp','icon-lxr')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-lxr'" style="width: 150px;">Admin List</a>
                <a href="javascript:home.logout()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-exit'" style="width: 150px;">Exit</a>
            </div>
        </div>
    </div>
	<script type="text/javascript" src="${ctx}/static/plugin/jquery-easyui-1.3.3/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/static/plugin/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
	<script type="text/javascript">
		var home = {
			addTab:function(url, text, iconCls){
				var content = "<iframe frameborder=0 scrolling='auto' style='width:100%;height:100%' src='"
	                + url + "'></iframe>";
		        $("#tabs").tabs("add", {
		            title : text,
		            iconCls : iconCls,
		            closable : true,
		            content : content
		        });
			},
			openTab:function(text, url, iconCls){
				if ($("#tabs").tabs("exists", text)) {
		            $("#tabs").tabs("close", text);
		            home.addTab(url, text, iconCls);
		            $("#tabs").tabs("select", text);
		        } else {
		        	home.addTab(url, text, iconCls);
		        }
			},
			logout:function(){
				$.messager.confirm("system prompt","Do you want to exit?",function(r) {
	               if (r) {
	                   window.location.href = "${ctx}/admin/logout";
	               }
	            });
			}
		}
	</script>
</body>
</html>