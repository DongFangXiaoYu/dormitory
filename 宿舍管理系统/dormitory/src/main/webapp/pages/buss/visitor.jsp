<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/pages/system/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>访客</title>
</head>
<body>
	<table id="dg" class="" title="列表" style="width: 700px; height: 300px">
		<thead>
			<tr>
				<th data-options="field:'ck',checkbox:true"></th>
				<th data-options="field:'visitorname',width:80">访客姓名</th>
				<th data-options="field:'student.name',width:80" formatter="objValue">受访学生</th>
				<th data-options="field:'relationship',width:80" formatter="changeRelation">与受访者关系</th>
				<th data-options="field:'starttime',width:80" formatter="changeDateTime">进入时间</th>
				<th data-options="field:'endtime',width:80" formatter="changeDateTime">离开时间</th>
				<th data-options="field:'remark',width:80">备注</th>
			</tr>
		</thead>
	</table>
	
	<div id="toolbar">
		<a href="#" class="easyui-linkbutton add" iconCls="icon-add" onclick="create()" plain="true">新增</a> 
		<a href="#" class="easyui-linkbutton edit" iconCls="icon-edit" onclick="edit()" plain="true">修改</a> 
		<a href="#" class="easyui-linkbutton remove" iconCls="icon-remove" onclick="del()" plain="true">删除</a>
		<div>
			访客姓名: <input class="easyui-textbox" id="paramVisitorName">
			受访者姓名: <input class="easyui-textbox" id="paramStudent">
			进入时间: <input class="easyui-datebox" id="paramStarttime" style="width:80px">
			结束时间: <input class="easyui-datebox" id="paramEndtime" style="width:80px">
			<a href="#" class="easyui-linkbutton" onclick="doSearch()" iconCls="icon-search">查找</a>
			<a href="#" class="easyui-linkbutton" onclick="doReset()" iconCls="icon-redo">重置</a>
		</div>
	</div>
	
	<div id="dlg" class="easyui-dialog" title="数据参数" data-options="modal:true" style="width: 480px; height: 450px;" closed="true" buttons="#dlg-buttons">
		<form method="post" id="fm">
			<table cellpadding="5">
				<tr>
					<td><input type="hidden" id="id" name="id" /></td>
				</tr>
	    		<tr>
	    			<td>访客姓名:</td>
	    			<td><input class="easyui-textbox" type="text" id="visitorname" name="visitorname" maxlength="30" required="true" missingMessage="名称必须填写"></input></td>
	    		</tr>
	    		<tr>
	    			<td>受访学生:</td>
	    			<td>
	    				<input type="hidden" name="studentid" id="studentid"></input>
	    				<input class="easyui-textbox" readonly="readonly" required="true" type="text" name="studentname" id="studentname"></input>
	    				<a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="openWin('studentdg','宿舍信息');" >选择</a>
	    				<a href="#" class="easyui-linkbutton" iconCls="icon-redo" onclick="clearText('studentid','studentname');" >清空</a>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>与受访者关系:</td>
	    			<td>
	    				<select class="" id="relationship" name="relationship" style="width:80px;">
							<option value="1">亲属</option>
							<option value="2">同学</option>
							<option value="3">朋友</option>
							<option value="4">陌生人</option>
						</select>
					</td>
	    		</tr>
	    		<tr>
	    			<td>进入时间:</td>
	    			<td><input class="easyui-datetimebox" id="starttime" editable="false" type="text" name="starttime"  ></input></td>
	    		</tr>
	    		<tr>
	    			<td>离开时间:</td>
	    			<td><input class="easyui-datetimebox" id="endtime" editable="false"  type="text" name="endtime" ></input></td>
	    		</tr>
	    		
	    		<tr>
	    			<td>备注:</td>
	    			<td><textarea id="remark"  name="remark" style="width:180px; height:100px" maxlength="200" ></textarea></td>
	    		</tr>
	    	</table>
		</form>
	</div>
	
	<div id="dlg-buttons">
		<a href="#" class="easyui-linkbutton  save" onclick="save()" iconCls="icon-ok">保存</a> 
		<a href="#" class="easyui-linkbutton cancel" onclick="javascript:$('#dlg').dialog('close')" iconCls="icon-cancel">取消</a>
	</div>
	
	<div id="studentdg" class="easyui-dialog" title="数据" style="width: 400px; height: 450px; top: 80px;" data-options="modal:true" closed="true" buttons="#dlgStudent-buttons">
		<table id="studenttable" class="" title="列表" style="width: 700px; height: 300px">
			<thead>
				<tr>
					<th data-options="field:'name',width:80">学生姓名</th>
					<th data-options="field:'sex',width:80" formatter="changeValue">性别</th>
					<th data-options="field:'birthday',width:80" formatter="changeDate">出生日期</th>
					<th data-options="field:'qq',width:80">qq</th>
					<th data-options="field:'mobile',width:80">电话</th>
					<th data-options="field:'classes.classname',width:80" formatter="classname">班级</th>
					<th data-options="field:'dorm.dormname',width:80" formatter="dormname">宿舍</th>
				</tr>
			</thead>
		</table>
	</div>
	<div id="studenttoolbar">
	<div>
		学生姓名: <input class="easyui-textbox" id="paramStuName">
		<br/>
		<a href="#" class="easyui-linkbutton" onclick="studentSearch()" iconCls="icon-search">查找</a>
		<a href="#" class="easyui-linkbutton" onclick="studentReset()" iconCls="icon-redo">重置</a>
	</div>
		
	</div>
	<div id="dlgStudent-buttons">
		<a href="#" class="easyui-linkbutton  save" onclick="afterSelect('studenttable','studentdg','studentid','studentname')" iconCls="icon-ok">确定</a> 
		<a href="#" class="easyui-linkbutton cancel" onclick="javascript:$('#dormdg').dialog('close')" iconCls="icon-cancel">取消</a>
	</div>
	<script type="text/javascript">
	$(function() {  
		loadDataGrid();
    });  	
	function loadDataGrid(queryConditon){
		 $('#dg').datagrid({  
	            title : '访客信息',  
	            iconCls : 'icon-ok',  
	            pageSize : 5,
	            pageList : [ 5, 10, 15, 20 ],
	            nowrap : true,
	            striped : true,
	            collapsible : true,  
	            toolbar:"#toolbar", 
	            url:'visitorController.do?datagrid',
	            loadMsg : '数据装载中......',  
	            singleSelect:false,
	            fitColumns:true,  
	            checkOnSelect:true,
	            selectOnCheck:true,
	            fit:true,
	            remoteSort : false,  
	            pagination : true,  
	            rownumbers : true,
	            queryParams:queryConditon
	        });   
	}
	function loadStuGrid(queryConditon){
		 $('#studenttable').datagrid({  
	            title : '学生信息',  
	            iconCls : 'icon-ok',  
	            pageSize : 5,
	            pageList : [ 5, 10, 15, 20 ],
	            nowrap : true,
	            striped : true,
	            collapsible : true,  
	            toolbar:"#studenttoolbar", 
	            url:'studentController.do?datagrid',
	            loadMsg : '数据装载中......',  
	            singleSelect:true,
	            fitColumns:true,  
	            checkOnSelect:true,
	            selectOnCheck:true,
	            fit:true,
	            remoteSort : false,  
	            pagination : true,  
	            rownumbers : true,
	            queryParams:queryConditon
	        });   
	}
		var url;
		function create(){
			$('#dlg').dialog('open').dialog('setTitle','新建');
			$('#fm').form('clear');
			url = 'visitorController.do?save';
		}
		function edit(){
			var row = $('#dg').datagrid('getSelections');
			if (row.length == 1){
				$('#dlg').dialog('open').dialog('setTitle','编辑');
				$('#fm').form('clear');
				$('#starttime').datetimebox('setValue',changeDateTime(row[0].starttime));
				$('#endtime').datetimebox('setValue',changeDateTime(row[0].endtime));
				$('#studentid').val(row[0].student.id);
				$('#id').val(row[0].id);
				$('#studentname').textbox('setValue',row[0].student.name);
				$('#visitorname').textbox('setValue',row[0].visitorname);
				$('#relationship').val(row[0].relationship);
				$('#remark').val(row[0].remark);
				url = 'visitorController.do?update';
			}else{
				$.messager.show({
					title: '提示信息',
					msg: '请选择一行数据再进行编辑！'
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
		
		function doSearch(){
			var queryCondition = {'visitorname':$('#paramVisitorName').val(),'studentname': $('#paramStudent').val(),'starttime': $('#paramStarttime').datetimebox("getValue"),'endtime': $('#paramEndtime').datetimebox("getValue")};
			loadDataGrid(queryCondition);
		}
		function doReset(){
			$('#paramVisitorName').textbox('setValue','');
			$('#paramStudent').textbox('setValue','');
			$('#paramStarttime').datebox('setValue','');
			$('#paramEndtime').datebox('setValue','');
			loadDataGrid(null);
		}
		function studentSearch(){
			var queryCondition = {'name':$('#paramStuName').val()};
			loadStuGrid(queryCondition);
		}
		function studentReset(){
			$('#paramStuName').textbox('setValue','');
			loadStuGrid(null);
		}
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
	    				names = row[i].name;
	    			}else{
	    				names = names+","+row[i].name;
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
							url : 'visitorController.do?delete',
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
		function objValue(value, row, index){
	    	return row['student']['name'];
	    }
		 function openWin(dgrid,dtittle){
		    	$('#'+dgrid).dialog('open').dialog('setTitle',dtittle);
		    	loadStuGrid();
		 }
		 function changeRelation(value, row, index){
		        if (value == "1") {
		            return '亲属';
		        }
		        else if(value == "2"){
		            return '同学';
		        }else if(value == "3"){
		        	return '朋友';
		        }else{
		        	return '陌生人';
		        }
		    }
		 function changeValue(value, row, index){
		        if (value == "1") {
		            return '男';
		        }
		        else {
		            return '女';
		        }
		    }
		 function dormname(value, row, index){
		    	return row['dorm']['dormname'];
	    }
		 function classname(value, row, index){
		    	return row['classes']['classname'];
	    }
	</script>
	
</body>
</html>