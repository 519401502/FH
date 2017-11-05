<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<title></title>
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="static/css/font-awesome.min.css" />
		<!-- 下拉框 -->
		<link rel="stylesheet" href="static/css/chosen.css" />
		
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		
		<link rel="stylesheet" href="static/css/datepicker.css" /><!-- 日期框 -->
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		
<script type="text/javascript">
	
	
	//保存
	function save(){
			if($("#TITLE").val()==""){
			$("#TITLE").tips({
				side:3,
	            msg:'请输入标题',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#TITLE").focus();
			return false;
		}
		if($("#SRC_PATH").val()==""){
			$("#SRC_PATH").tips({
				side:3,
	            msg:'请输入资源路径',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#SRC_PATH").focus();
			return false;
		}
		if($("#INTEGRAL").val()==""){
			$("#INTEGRAL").tips({
				side:3,
	            msg:'请输入积分',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#INTEGRAL").focus();
			return false;
		}
		if($("#IS_SHOW").val()==""){
			$("#IS_SHOW").tips({
				side:3,
	            msg:'请输入是否显示',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#IS_SHOW").focus();
			return false;
		}
		if($("#TYPE1").val()==""){
			$("#TYPE1").tips({
				side:3,
	            msg:'请输入类型1',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#TYPE1").focus();
			return false;
		}
		if($("#TYPE2").val()==""){
			$("#TYPE2").tips({
				side:3,
	            msg:'请输入类型2',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#TYPE2").focus();
			return false;
		}
		if($("#SRC_DESC").val()==""){
			$("#SRC_DESC").tips({
				side:3,
	            msg:'请输入描述',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#SRC_DESC").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="kit/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="KIT_ID" id="KIT_ID" value="${pd.KIT_ID}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">标题:</td>
				<td><input type="text" name="TITLE" id="TITLE" value="${pd.TITLE}" maxlength="32" placeholder="这里输入标题" title="标题"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">资源路径:</td>
				<td><input type="text" name="SRC_PATH" id="SRC_PATH" value="${pd.SRC_PATH}" maxlength="32" placeholder="这里输入资源路径" title="资源路径"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">积分:</td>
				<td><input type="number" name="INTEGRAL" id="INTEGRAL" value="${pd.INTEGRAL}" maxlength="32" placeholder="这里输入积分" title="积分"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">是否显示:</td>
				<td><select value="${pd.IS_SHOW}" name="IS_SHOW" id="IS_SHOW">
					<c:if test="${pd.IS_SHOW == 1}">
						<option value="1">不显示</option>
					</c:if>
					<c:if test="${pd.IS_SHOW == 0}">
						<option value="0">显示</option>
					</c:if>
					<option value="0">显示</option>
					<option value="1">不显示</option>
				</select>
					<%--<input type="number" name="IS_SHOW" id="IS_SHOW" value="${pd.IS_SHOW}" maxlength="32" placeholder="这里输入是否显示" title="是否显示"/></td>--%>
				</td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">类型1:</td>
				<td><input type="text" name="TYPE1" id="TYPE1" value="${pd.TYPE1}" maxlength="32" placeholder="这里输入类型1" title="类型1"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">类型2:</td>
				<td><input type="text" name="TYPE2" id="TYPE2" value="${pd.TYPE2}" maxlength="32" placeholder="这里输入类型2" title="类型2"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">描述:</td>
				<td><input type="text" name="SRC_DESC" id="SRC_DESC" value="${pd.SRC_DESC}" maxlength="32" placeholder="这里输入描述" title="描述"/></td>
			</tr>
			<tr>
				<td style="text-align: center;" colspan="10">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
		</table>
		</div>
		
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
		
	</form>
	
	
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
		<script type="text/javascript">
		$(top.hangge());
		$(function() {
			
			//单选框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			//日期框
			$('.date-picker').datepicker();
			
		});
		
		</script>
</body>
</html>