<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/pages/system/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>学生</title>
</head>
<body>
	<table id="dg" class="" title="列表" style="width: 700px; height: 300px">
		<thead>
			<tr>
				<th data-options="field:'ck',checkbox:true"></th>
				<th data-options="field:'name',width:80">学生姓名</th>
				<th data-options="field:'sex',width:80" formatter="changeValue">性别</th>
				<th data-options="field:'birthday',width:80" formatter="changeDate">出生日期</th>
				<th data-options="field:'qq',width:80">qq</th>
				<th data-options="field:'mobile',width:80">电话</th>
				<th data-options="field:'classname',width:80" formatter="changeClassname">班级</th>
				<th data-options="field:'dormname',width:80" formatter="changeDormname">宿舍</th>
			</tr>
		</thead>
	</table>
	
	<div id="toolbar">
		<a href="#" class="easyui-linkbutton add" iconCls="icon-add" onclick="create()" plain="true">新增</a> 
		<a href="#" class="easyui-linkbutton edit" iconCls="icon-edit" onclick="edit()" plain="true">修改</a> 
		<a href="#" class="easyui-linkbutton remove" iconCls="icon-remove" onclick="del()" plain="true">删除</a>
		<a href="#" class="easyui-linkbutton" onclick="checkOut()" iconCls="icon-redo" plain="true">退宿</a>
		<div>
			学生姓名: <input class="easyui-textbox" id="paramStudent">
			电话: <input class="easyui-textbox" id="paramMobile">
			qq: <input class="easyui-textbox" id="paramQq">
			宿舍:<input class="easyui-textbox" id="paramDormName">
			<a href="#" class="easyui-linkbutton" onclick="studentSearch()" iconCls="icon-search">查找</a>
			<a href="#" class="easyui-linkbutton" onclick="studentReset()" iconCls="icon-search">清空</a>
		</div>
	</div>
	<div id="classtoolbar">
		<div>
			班级名称: <input class="easyui-textbox" id="paramClass">
			<br/>
			<a href="#" class="easyui-linkbutton" onclick="doSearch()" iconCls="icon-search">查找</a>
			<a href="#" class="easyui-linkbutton" onclick="doReset()" iconCls="icon-redo">重置</a>
		</div>
	</div>
	<div id="dlgClass" class="easyui-dialog" title="数据" style="width: 350px; height: 450px; top: 80px;" data-options="modal:true" closed="true" buttons="#dlgClass-buttons">
		<table id="dgClass" class="easyui-datagrid"  cellpadding="0" cellspacing="0" style="width:100%">
			<thead>
				<tr>
					<th data-options="field:'classname'" style="width: 60%;">班级名称</th>
					<th data-options="field:'teachername'" style="width: 40%;">辅导员</th>
				</tr>
			</thead>
		</table>
	</div>
	<div id="dlgClass-buttons">
		<a href="#" class="easyui-linkbutton  save" onclick="afterSelect('dgClass','dlgClass','classid','classname')" iconCls="icon-ok">确定</a> 
		<a href="#" class="easyui-linkbutton cancel" onclick="javascript:$('#dlgClass').dialog('close')" iconCls="icon-cancel">取消</a>
	</div>
	
	
	<div id="dormtoolbar">
		<div>
			宿舍名称: <input class="easyui-textbox" id="paramDormpop">
			<br/>
			<a href="#" class="easyui-linkbutton" onclick="dormSearch()" iconCls="icon-search">查找</a>
			<a href="#" class="easyui-linkbutton" onclick="dormReset()" iconCls="icon-redo">重置</a>
		</div>
	</div>
	<div id="dlgDorm" class="easyui-dialog" title="数据" style="width: 350px; height: 450px; top: 80px;" data-options="modal:true" closed="true" buttons="#dlgDorm-buttons">
		<table id="dgDorm" class="easyui-datagrid"  cellpadding="0" cellspacing="0" style="width:100%">
			<thead>
				<tr>
					<th data-options="field:'dormname',width:80">宿舍名称</th>
					<th data-options="field:'dormadmin',width:80">宿管</th>
					<th data-options="field:'total',width:80">总床位数</th>
					<th data-options="field:'used',width:80">已用床位数</th>
					<th data-options="field:'remark',width:80">备注</th>
				</tr>
			</thead>
		</table>
	</div>
	<div id="dlgDorm-buttons">
		<a href="#" class="easyui-linkbutton  save" onclick="afterDormSelect('dgDorm','dlgDorm','dormid','dormname')" iconCls="icon-ok">确定</a> 
		<a href="#" class="easyui-linkbutton cancel" onclick="javascript:$('#dlgDorm').dialog('close')" iconCls="icon-cancel">取消</a>
	</div>
	
	<div id="dlg" class="easyui-dialog" title="数据参数" data-options="modal:true" style="width: 480px; height: 430px;" closed="true" buttons="#dlg-buttons">
		<form method="post" id="fm">
			<table cellpadding="5">
				<tr>
					<td><input type="hidden" id="id" name="id" /></td>
				</tr>
	    		<tr>
	    			<td>学生姓名:</td>
	    			<td><input class="easyui-textbox" id="name" type="text" name="name" maxlength="10" required="true" missingMessage="姓名必须填写"></input></td>
	    		</tr>
	    		<tr>
	    			<td>性别:</td>
	    			<td>
						<select name="sex" id="sex">
							<option value="1" selected="selected">男</option>
							<option value="2">女</option>
						</select>
					</td>
	    		</tr>
	    		<tr>
	    			<td>出生日期:</td>
	    			<td><input class="easyui-datebox" id="birthday" editable="false" maxlength="20" type="text" name="birthday"></input></td>
	    		</tr>
	    		<tr>
	    			<td>qq:</td>
	    			<td><input class="easyui-textbox" id="qq" validtype="qq" maxlength="15" type="text" name="qq" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>电话:</td>
	    			<td><input class="easyui-textbox" id="mobile" type="text" name="mobile" validtype="mobile" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>班级:</td>
	    			<td>
	    				<input type="hidden" name="classid" id="classid"></input>
	    				<input class="easyui-textbox" readonly="readonly"  type="text" name="classname" required="true" id="classname"></input>
	    				<a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="openWin('dlgClass','班级')" >选择</a>
	    				<a href="#" class="easyui-linkbutton" iconCls="icon-redo" onclick="clearText('classid','classname');" >清空</a>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>宿舍:</td>
	    			<td>
	    				<input type="hidden" name="dormid" id="dormid"></input>
	    				<input class="easyui-textbox" readonly="readonly"  type="text" name="dormname" required="true" id="dormname"></input>
	    				<a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="openDormWin('dlgDorm','宿舍')" >选择</a>
	    				<a href="#" class="easyui-linkbutton" iconCls="icon-redo" onclick="clearText('dormid','dormname');" >清空</a>
	    			</td>
	    		</tr>
	    	</table>
		</form>
	</div>
	
	<div id="dlg-buttons">
		<a href="#" class="easyui-linkbutton  save" onclick="save()" iconCls="icon-ok">保存</a> 
		<a href="#" class="easyui-linkbutton cancel" onclick="javascript:$('#dlg').dialog('close')" iconCls="icon-cancel">取消</a>
	</div>
	<script type="text/javascript">
	$(function() {  
		loadDataGrid();
    });  	
	function afterSelect(targetDg,targetDlg,valueId,valueName){
		var row = $("#"+targetDg).datagrid('getSelections');
		if (row.length >= 1){
			var ids;
			var names;
			for(var i=0;i<row.length;i++){
				if(ids == null){
					ids = row[i].id;
				}else{
					ids = ids+","+row[i].id;
				}
				if(names == null){
					names = row[i].classname;
				}else{
					names = names+","+row[i].classname;
				}
			}
			$("#"+valueId).val(ids);
			$("#"+valueName).textbox('setValue',names);
			$("#"+targetDlg).dialog('close');	
		}else{
			$.messager.show({
				title: '提示信息',
				msg: '您未选择任何数据！'
			});
		}
	}
	
	function afterDormSelect(targetDg,targetDlg,valueId,valueName){
		var row = $("#"+targetDg).datagrid('getSelections');
		if (row.length >= 1){
			var ids;
			var names;
			for(var i=0;i<row.length;i++){
				if(ids == null){
					ids = row[i].id;
				}else{
					ids = ids+","+row[i].id;
				}
				if(names == null){
					names = row[i].dormname;
				}else{
					names = names+","+row[i].dormname;
				}
			}
			$("#"+valueId).val(ids);
			$("#"+valueName).textbox('setValue',names);
			$("#"+targetDlg).dialog('close');	
		}else{
			$.messager.show({
				title: '提示信息',
				msg: '您未选择任何数据！'
			});
		}
	}
	function dormSearch(){
		var queryCondition = {'dormname':$('#paramDormpop').val(),'assignDorm':'true'};
		loadDormGrid(queryCondition);
	}
	function dormReset(){
		$('#paramDormpop').textbox('setValue','');
		loadDormGrid(null);
	}
	function studentSearch(){
		var queryCondition = {'name':$('#paramStudent').val(),'mobile': $('#paramMobile').val(),'qq': $('#paramQq').val(),'dormName': $('#paramDormName').val()};
		loadDataGrid(queryCondition);
	}
	function studentReset(){
		$('#paramStudent').textbox('setValue','');
		$('#paramMobile').textbox('setValue','');
		$('#paramQq').textbox('setValue','');
		$('#paramDormName').textbox('setValue','');
		loadDataGrid(null);
	}
	function openWin(dgrid,dtittle){
		$('#'+dgrid).dialog('open').dialog('setTitle',dtittle);
		loadClassGrid();
	}
	function openDormWin(dgrid,dtittle){
		$('#'+dgrid).dialog('open').dialog('setTitle',dtittle);
		var queryCondition = {'assignDorm':'true'};
		loadDormGrid(queryCondition);
	}
	function loadDataGrid(queryConditon){
		 $('#dg').datagrid({  
	            title : '学生信息',  
	            iconCls : 'icon-ok',  
	            pageSize : 5,//默认选择的分页是每页5行数据  
	            pageList : [ 5, 10, 15, 20 ],//可以选择的分页集合  
	            nowrap : true,//设置为true，当数据长度超出列宽时将会自动截取  
	            striped : true,//设置为true将交替显示行背景。  
	            collapsible : true,//显示可折叠按钮  
	            toolbar:"#toolbar",//在添加 增添、删除、修改操作的按钮要用到这个  
	            url:'studentController.do?datagrid',//url调用Action方法  
	            loadMsg : '数据装载中......',  
	            singleSelect:false,//为true时只能选择单行  
	            fitColumns:true,//允许表格自动缩放，以适应父容器  
	            checkOnSelect:true,
	            selectOnCheck:true,
	            fit:true,
	            remoteSort : false,  
	            pagination : true,  
	            rownumbers : true,
	            queryParams:queryConditon
	        });   
	}
	function loadClassGrid(queryConditon){
		 $('#dgClass').datagrid({  
	            title : '班级信息',  
	            iconCls : 'icon-ok',  
	            pageSize : 5,//默认选择的分页是每页5行数据  
	            pageList : [ 5, 10, 15, 20 ],//可以选择的分页集合  
	            nowrap : true,//设置为true，当数据长度超出列宽时将会自动截取  
	            striped : true,//设置为true将交替显示行背景。  
	            collapsible : true,//显示可折叠按钮  
	            toolbar:"#classtoolbar",//在添加 增添、删除、修改操作的按钮要用到这个  
	            url:'classController.do?datagrid',//url调用Action方法  
	            loadMsg : '数据装载中......',  
	            singleSelect:true,//为true时只能选择单行  
	            fitColumns:true,//允许表格自动缩放，以适应父容器  
	            checkOnSelect:true,
	            selectOnCheck:true,
	            fit:true,
	            remoteSort : false,  
	            pagination : true,  
	            rownumbers : true,
	            queryParams:queryConditon
	        });   
	}
	function loadDormGrid(queryConditon){
		 $('#dgDorm').datagrid({  
	            title : '宿舍信息',  
	            iconCls : 'icon-ok',  
	            pageSize : 5,//默认选择的分页是每页5行数据  
	            pageList : [ 5, 10, 15, 20 ],//可以选择的分页集合  
	            nowrap : true,//设置为true，当数据长度超出列宽时将会自动截取  
	            striped : true,//设置为true将交替显示行背景。  
	            collapsible : true,//显示可折叠按钮  
	            toolbar:"#dormtoolbar",//在添加 增添、删除、修改操作的按钮要用到这个  
	            url:'dormController.do?datagrid',//url调用Action方法  
	            loadMsg : '数据装载中......',  
	            singleSelect:true,//为true时只能选择单行  
	            fitColumns:true,//允许表格自动缩放，以适应父容器  
	            checkOnSelect:true,
	            selectOnCheck:true,
	            fit:true,
	            remoteSort : false,  
	            pagination : true,  
	            rownumbers : true,
	            queryParams:queryConditon
	        });   
	}
	function doSearch(){
		var queryCondition = {'classname':$('#paramClass').val()};
		loadClassGrid(queryCondition);
	}
	function doReset(){
		$('#paramClass').textbox('setValue','');
		loadClassGrid(null);
	}
    function changeValue(value, row, index){
        if (value == "1") {
            return '男';
        }
        else {
            return '女';
        }
    }

		var url;
		function create(){
			$('#dlg').dialog('open').dialog('setTitle','新建');
			$('#fm').form('clear');
			url = 'studentController.do?save';
		}
		function edit(){
			var row = $('#dg').datagrid('getSelections');
			if (row.length == 1){
				$('#dlg').dialog('open').dialog('setTitle','编辑');
				$('#fm').form('clear');
				$('#birthday').datebox('setValue',changeDate(row[0].birthday));
				$('#id').val(row[0].id);
				$('#name').textbox('setValue',row[0].name);
				$('#qq').textbox('setValue',row[0].qq);
				$('#mobile').textbox('setValue',row[0].mobile);
				$('#dormname').textbox('setValue',row[0].dorm.dormname);
				$('#dormid').val(row[0].dorm.id);
				$('#classname').textbox('setValue',row[0].classes.classname);
				$('#classid').val(row[0].classes.id);
				$('#sex').val(row[0].sex);
				url = 'studentController.do?update';
			}else{
				$.messager.show({
					title: '提示信息',
					msg: '请选择一行数据再进行编辑！'
				});
			}
		}
		function checkOut(){
			var row = $('#dg').datagrid('getSelections');
			if (row.length == 1){
				$.messager.confirm('提示信息','确定退宿?',function(r){
					if (r){
						$.ajax({
							url : 'studentController.do?checkOut',
							type : 'post',
							data : {
								stuId : row[0].id
							},
							cache : false,
							success : function(result) {
								if (result.success){
									$('#dg').datagrid('reload');
									$.messager.show({	
										title: '提示信息',
										msg: result.msg
									});
								} else {
									$.messager.show({	
										title: '提示信息',
										msg: result.msg
									});
								}
							}
						});
					}
				});
				
			}else{
				$.messager.show({
					title: '提示信息',
					msg: '请选择一行数据再进行操作！'
				});
			}
		}
		function save(){
			$('#fm').form('submit',{
				url: url,
				onSubmit: function(){
					return $(this).form('validate');
				},
				success: function(result){
					var result = eval('('+result+')');
					if (result.success){
						$('#dlg').dialog('close');		
						$('#dg').datagrid('reload');	
						$.messager.show({
							title: '提示信息',
							msg: result.msg
						});
					} else {
						$.messager.show({
							title: '提示信息',
							msg: result.msg
						});
					}
				}
			});
		}
		function del(){
			var rows = $('#dg').datagrid('getSelections');
			var ids = [];
			if (rows.length > 0){
				$.messager.confirm('提示信息','确定删除?',function(r){
					if (r){
						for ( var i = 0; i < rows.length; i++) {
							ids.push(rows[i].id);
						}
						$.ajax({
							url : 'studentController.do?delete',
							type : 'post',
							data : {
								ids : ids.join(',')
							},
							cache : false,
							success : function(result) {
								if (result.success){
									$('#dg').datagrid('reload');
									$.messager.show({	
										title: '提示信息',
										msg: result.msg
									});
								} else {
									$.messager.show({	
										title: '提示信息',
										msg: result.msg
									});
								}
							}
						});
					}
				});
			}else{
				$.messager.show({	
					title: '提示信息',
					msg: '请至少选择一条数据后再进行删除'
				});
			}
		}
		
		 function changeDormname(value, row, index){
		    	return row['dorm']['dormname'];
	    }
		 function changeClassname(value, row, index){
		    	return row['classes']['classname'];
	    }
	</script>
	
</body>
</html>