<%@ page language="java" contentType="text/html; charset=gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>调度任务</title>
<link rel="stylesheet" type="text/css" href="./js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="./js/easyui/themes/icon.css">
    <script type="text/javascript" src="./js/easyui/jquery.min.js"></script>
<%-- <script type="text/javascript" src="./js/jquery-1.4.2.min.js"></script> --%>
<script type="text/javascript" src="./js/easyui/jquery.easyui.min.js"></script>
</head>
<body>
<br/>
<table id="dg"></table>
<br/>
<input type="button" id="ButonGetCheck" value="启动" />
</body>
<script type="text/javascript">
$(document).ready(function(){
	var actionURL = "SchedualServlet";
        loadDataList(actionURL);
}); 

function loadDataList(actionURL){
	$('#dg').datagrid({
		title: '可以启动的任务',
		url: actionURL,
		width: '950',
		rownumbers: true,
		columns:[[
		{ field:'ck',checkbox:true },
		{ field: 'videoID', title: '视频ID' },
		{ field: 'showName', title: '视频显示名' },
		{ field: 'fileName', title: '视频文件名' },
		{ field: 'videoGUID', title: '视频GUID' }
		]],
		singleSelect: false,
		selectOnCheck: true,
		checkOnSelect: true,
		onLoadSuccess:function(data){                   
			if(data){
				$.each(data.rows, function(index, item){
					if(item.checked){
						$('#dg').datagrid('checkRow', index);
					}
				});
			}
		}
	});
}



$('#ButonGetCheck').click(function(){
	var checkedItems = $('#dg').datagrid('getChecked');
	var names = [];
	$.each(checkedItems, function(index, item){
		names.push(item.videoID);
	});
	var actionURL='SchedualServlet?keywords='+names;
	alert("开始上传");
	loadDataList(actionURL);
});


</script>
</html>
