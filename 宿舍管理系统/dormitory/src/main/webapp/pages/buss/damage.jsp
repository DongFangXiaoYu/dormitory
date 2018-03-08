<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="/pages/system/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>宿舍损坏</title>
</head>
<body>
	<table id="dg" class="" title="列表" style="width: 700px; height: 300px">
		<thead>
			<tr>
				<th data-options="field:'ck',checkbox:true"></th>
				<th data-options="field:'dorm.dormname',width:80" formatter="objValue">宿舍</th>
				<th data-options="field:'damagestation',width:80">损坏情况</th>
				<th data-options="field:'isfixed',width:80" formatter="changeValue">是否已修复</th>
				<th data-options="field:'damagetime',width:80" formatter="changeDate">损坏时间</th>
				<th data-options="field:'fixtime',width:80" formatter="changeDate" >修复时间</th>
				<th data-options="field:'remark',width:80">备注</th>
			</tr>
		</thead>
	</table>
	
	<div id="toolbar">
		<a href="#" class="easyui-linkbutton add" iconCls="icon-add" onclick="create()" plain="true">新增</a> 
		<a href="#" class="easyui-linkbutton edit" iconCls="icon-edit" onclick="edit()" plain="true">修改</a> 
		<a href="#" class="easyui-linkbutton remove" iconCls="icon-remove" onclick="del()" plain="true">删除</a>
		<div>
			宿舍: <input class="easyui-textbox" id="paramDorm">
			是否已修复: <input class="easyui-textbox" id="paramFix">
			<a href="#" class="easyui-linkbutton" onclick="doSearch()" iconCls="icon-search">查找</a>
			<a href="#" class="easyui-linkbutton" onclick="doReset()" iconCls="icon-redo">重置</a>
		</div>
	</div>
	
	<div id="dlg" class="easyui-dialog" title="数据参数" data-options="modal:true" style="width: 450px; height: 500px;" closed="true" buttons="#dlg-buttons">
		<form method="post" id="fm">
			<table cellpadding="5">
				<tr>
					<td><input type="hidden" id="id" name="id" /></td>
				</tr>
	    		<tr>
	    			<td>宿舍:</td>
	    			<td>
	    				<input type="hidden" name="dormid" id="dormid"></input>
	    				<input class="easyui-textbox" readonly="readonly" required="true"  type="text" name="dormname" id="dormname"></input>
	    				<a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="openWin('dormdg','宿舍信息');" >选择</a>
	    				<a href="#" class="easyui-linkbutton" iconCls="icon-redo" onclick="clearText('dormid','dormname');" >清空</a>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>损坏情况:</td>
	    			<td><textarea id="damagestation"  name="damagestation" style="width:180px; height:100px" maxlength="200" ></textarea></td>
	    		</tr>
	    		<tr>
	    			<td>是否已修复:</td>
	    			<td>
	    				<select class="" id="isfixed" name="isfixed" style="width:80px;">
							<option value="1">已修复</option>
							<option value="2">待修复</option>
							<option value="3">不修复</option>
						</select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>损坏时间:</td>
	    			<td><input class="easyui-datebox"  editable="false" type="text" id="damagetime" name="damagetime"  ></input></td>
	    		</tr>
	    		<tr>
	    			<td>修复时间:</td>
	    			<td><input class="easyui-datebox" editable="false"  type="text" id="fixtime" name="fixtime" ></input></td>
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
	<div id="dormdg" class="easyui-dialog" title="数据" style="width: 350px; height: 450px; top: 80px;" data-options="modal:true" closed="true" buttons="#dlgClass-buttons">
		<table id="dormtable" class="" title="列表" style="width: 700px; height: 300px">
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
	<div id="dormtoolbar">
	<div>
		宿舍名称: <input class="easyui-textbox" id="paramDormName">
		<br/>
		<a href="#" class="easyui-linkbutton" onclick="dormSearch()" iconCls="icon-search">查找</a>
		<a href="#" class="easyui-linkbutton" onclick="dormReset()" iconCls="icon-redo">重置</a>
	</div>
		
	</div>
	<div id="dlgClass-buttons">
		<a href="#" class="easyui-linkbutton  save" onclick="afterSelect('dormtable','dormdg','dormid','dormname')" iconCls="icon-ok">确定</a> 
		<a href="#" class="easyui-linkbutton cancel" onclick="javascript:$('#dormdg').dialog('close')" iconCls="icon-cancel">取消</a>
	</div>
	<script type="text/javascript">
	$(function() {  
		loadDataGrid();
    });  	
	
    function changeValue(value, row, index){
        if (value == "1") {
            return '已修复';
        }
        else if(value == "2"){
            return '待修复';
        }else{
        	return '不修复';
        }
    }
    function objValue(value, row, index){
    	return row['dorm']['dormname'];
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
    function openWin(dgrid,dtittle){
    	$('#'+dgrid).dialog('open').dialog('setTitle',dtittle);
    	loadDormGrid();
    }
	function loadDataGrid(queryConditon){
		 $('#dg').datagrid({  
	            title : '宿舍损坏信息',  
	            iconCls : 'icon-ok',  
	            pageSize : 5,
	            pageList : [ 5, 10, 15, 20 ],
	            nowrap : true,
	            striped : true,
	            collapsible : true,  
	            toolbar:"#toolbar", 
	            url:'damageController.do?datagrid',
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
	function loadDormGrid(queryConditon){
		 $('#dormtable').datagrid({  
	            title : '宿舍信息',  
	            iconCls : 'icon-ok',  
	            pageSize : 5,
	            pageList : [ 5, 10, 15, 20 ],
	            nowrap : true,
	            striped : true,
	            collapsible : true,  
	            toolbar:"#dormtoolbar", 
	            url:'dormController.do?datagrid',
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
			url = 'damageController.do?save';
		}
		function edit(){
			var row = $('#dg').datagrid('getSelections');
			if (row.length == 1){
				$('#dlg').dialog('open').dialog('setTitle','编辑');
				$('#fm').form('clear');
				$('#damagetime').datebox('setValue',changeDate(row[0].damagetime));
				$('#fixtime').datebox('setValue',changeDate(row[0].fixtime));
				$('#isfixed').val(row[0].isfixed);
				$('#damagestation').val(row[0].damagestation);
				$('#remark').val(row[0].remark);
				$('#dormid').val(row[0].dorm.id);
				$('#id').val(row[0].id);
				$('#dormname').textbox('setValue',row[0].dorm.dormname);
				//$('#fm').form('load',row[0]);
				url = 'damageController.do?update';
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
			var queryCondition = {'dormname':$('#paramDorm').val(),'isfixed': $('#paramFix').val()};
			loadDataGrid(queryCondition);
		}
		function doReset(){
			$('#paramDorm').textbox('setValue','');
			$('#paramFix').textbox('setValue','');
			loadDataGrid(null);
		}
		function dormSearch(){
			var queryCondition = {'dormname':$('#paramDormName').val()};
			loadDormGrid(queryCondition);
		}
		function dormReset(){
			$('#paramDormName').textbox('setValue','');
			loadDormGrid(null);
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
							url : 'damageController.do?delete',
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
	
	</script>
	
</body>
</html>