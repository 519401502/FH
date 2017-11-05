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
			if($("#ACCOUNT_ID").val()==""){
			$("#ACCOUNT_ID").tips({
				side:3,
	            msg:'请输入名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#ACCOUNT_ID").focus();
			return false;
		}
		if($("#PAY_TYPE").val()==""){
			$("#PAY_TYPE").tips({
				side:3,
	            msg:'请输入付款方式',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PAY_TYPE").focus();
			return false;
		}
//		if($("#CARRY").val()==""){
//			$("#CARRY").tips({
//				side:3,
//	            msg:'请输入运送方式',
//	            bg:'#AE81FF',
//	            time:2
//	        });
//			$("#CARRY").focus();
//			return false;
//		}
//		if($("#REBATE").val()==""){
//			$("#REBATE").tips({
//				side:3,
//	            msg:'请输入折扣',
//	            bg:'#AE81FF',
//	            time:2
//	        });
//			$("#REBATE").focus();
//			return false;
//		}
		if($("#CREATE_DATE").val()==""){
			$("#CREATE_DATE").tips({
				side:3,
	            msg:'请输入创建日期',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CREATE_DATE").focus();
			return false;
		}
//		if($("#REMARK").val()==""){
//			$("#REMARK").tips({
//				side:3,
//	            msg:'请输入备注',
//	            bg:'#AE81FF',
//	            time:2
//	        });
//			$("#REMARK").focus();
//			return false;
//		}
		if($("#STATUS").val()==""){
			$("#STATUS").tips({
				side:3,
	            msg:'请输入审核状态',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#STATUS").focus();
			return false;
		}
//		if($("#REFUND_STATUS").val()==""){
//			$("#REFUND_STATUS").tips({
//				side:3,
//	            msg:'请输入退款状态',
//	            bg:'#AE81FF',
//	            time:2
//	        });
//			$("#REFUND_STATUS").focus();
//			return false;
//		}
		if($("#PAY_STATUS").val()==""){
			$("#PAY_STATUS").tips({
				side:3,
	            msg:'请输入支付状态',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PAY_STATUS").focus();
			return false;
		}
//		if($("#LOW_STOCKS").val()==""){
//			$("#LOW_STOCKS").tips({
//				side:3,
//	            msg:'请输入库存余量',
//	            bg:'#AE81FF',
//	            time:2
//	        });
//			$("#LOW_STOCKS").focus();
//			return false;
//		}
		if($("#AMOUNT").val()==""){
			$("#AMOUNT").tips({
				side:3,
	            msg:'请输入订单总金额',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#AMOUNT").focus();
			return false;
		}
//		if($("#AMOUNT_EXCHANGE_SCORE").val()==""){
//			$("#AMOUNT_EXCHANGE_SCORE").tips({
//				side:3,
//	            msg:'请输入订单总兑换积分',
//	            bg:'#AE81FF',
//	            time:2
//	        });
//			$("#AMOUNT_EXCHANGE_SCORE").focus();
//			return false;
//		}
//		if($("#FEE").val()==""){
//			$("#FEE").tips({
//				side:3,
//	            msg:'请输入运费总金额',
//	            bg:'#AE81FF',
//	            time:2
//	        });
//			$("#FEE").focus();
//			return false;
//		}
//		if($("#PTOTAL").val()==""){
//			$("#PTOTAL").tips({
//				side:3,
//	            msg:'请输入商品总金额',
//	            bg:'#AE81FF',
//	            time:2
//	        });
//			$("#PTOTAL").focus();
//			return false;
//		}
		if($("#QUANTITY").val()==""){
			$("#QUANTITY").tips({
				side:3,
	            msg:'请输入商品总数量',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#QUANTITY").focus();
			return false;
		}
//		if($("#UPDATE_AMOUNT").val()==""){
//			$("#UPDATE_AMOUNT").tips({
//				side:3,
//	            msg:'请输入是否有过修改',
//	            bg:'#AE81FF',
//	            time:2
//	        });
//			$("#UPDATE_AMOUNT").focus();
//			return false;
//		}
//		if($("#EXPRESS_CODE").val()==""){
//			$("#EXPRESS_CODE").tips({
//				side:3,
//	            msg:'请输入配送方式编码',
//	            bg:'#AE81FF',
//	            time:2
//	        });
//			$("#EXPRESS_CODE").focus();
//			return false;
//		}
//		if($("#EXPRESS_NAME").val()==""){
//			$("#EXPRESS_NAME").tips({
//				side:3,
//	            msg:'请输入配送方式名称',
//	            bg:'#AE81FF',
//	            time:2
//	        });
//			$("#EXPRESS_NAME").focus();
//			return false;
//		}
//		if($("#EXPRESS_NO").val()==""){
//			$("#EXPRESS_NO").tips({
//				side:3,
//	            msg:'请输入快递运单号',
//	            bg:'#AE81FF',
//	            time:2
//	        });
//			$("#EXPRESS_NO").focus();
//			return false;
//		}
//		if($("#EXPRESS_COMPANY_NAME").val()==""){
//			$("#EXPRESS_COMPANY_NAME").tips({
//				side:3,
//	            msg:'请输入快递公司名称',
//	            bg:'#AE81FF',
//	            time:2
//	        });
//			$("#EXPRESS_COMPANY_NAME").focus();
//			return false;
//		}
//		if($("#CONFIRM_SEND_PRODUCT_REMARK").val()==""){
//			$("#CONFIRM_SEND_PRODUCT_REMARK").tips({
//				side:3,
//	            msg:'请输入确认发货备注',
//	            bg:'#AE81FF',
//	            time:2
//	        });
//			$("#CONFIRM_SEND_PRODUCT_REMARK").focus();
//			return false;
//		}
//		if($("#OTHER_REQUIREMENT").val()==""){
//			$("#OTHER_REQUIREMENT").tips({
//				side:3,
//	            msg:'请输入客户的附加要求',
//	            bg:'#AE81FF',
//	            time:2
//	        });
//			$("#OTHER_REQUIREMENT").focus();
//			return false;
//		}
//		if($("#CLOSED_COMMENT").val()==""){
//			$("#CLOSED_COMMENT").tips({
//				side:3,
//	            msg:'请输入是否已经评论',
//	            bg:'#AE81FF',
//	            time:2
//	        });
//			$("#CLOSED_COMMENT").focus();
//			return false;
//		}
//		if($("#SCORE").val()==""){
//			$("#SCORE").tips({
//				side:3,
//	            msg:'请输入订单获赠的积分',
//	            bg:'#AE81FF',
//	            time:2
//	        });
//			$("#SCORE").focus();
//			return false;
//		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="ordercontroller/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="ORDER_ID" id="ORDER_ID" value="${pd.ORDER_ID}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">账号ID:</td>
				<td><input type="text" name="ACCOUNT_ID" id="ACCOUNT_ID" value="${pd.ACCOUNT_ID}" maxlength="32" placeholder="这里输入账号ID" title="账号ID"/></td>
			</tr>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">付款方式:</td>
				<td><input type="text" name="PAY_TYPE" id="PAY_TYPE" value="${pd.PAY_TYPE}" maxlength="32" placeholder="这里输入付款方式" title="付款方式"/></td>
			</tr>
			<%--<tr>--%>
				<%--<td style="width:70px;text-align: right;padding-top: 13px;">运送方式:</td>--%>
				<%--<td><input type="text" name="CARRY" id="CARRY" value="${pd.CARRY}" maxlength="32" placeholder="这里输入运送方式" title="运送方式"/></td>--%>
			<%--</tr>--%>
			<%--<tr>--%>
				<%--<td style="width:70px;text-align: right;padding-top: 13px;">折扣:</td>--%>
				<%--<td><input type="text" name="REBATE" id="REBATE" value="${pd.REBATE}" maxlength="32" placeholder="这里输入折扣" title="折扣"/></td>--%>
			<%--</tr>--%>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">创建日期:</td>
				<td><input type="text" name="CREATE_DATE" id="CREATE_DATE" value="${pd.CREATE_DATE}" maxlength="32" placeholder="这里输入创建日期" title="创建日期"/></td>
			</tr>
			<%--<tr>--%>
				<%--<td style="width:70px;text-align: right;padding-top: 13px;">备注:</td>--%>
				<%--<td><input type="text" name="REMARK" id="REMARK" value="${pd.REMARK}" maxlength="32" placeholder="这里输入备注" title="备注"/></td>--%>
			<%--</tr>--%>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">审核状态:</td>
				<td><input type="text" name="STATUS" id="STATUS" value="${pd.STATUS}" maxlength="32" placeholder="这里输入审核状态" title="审核状态"/></td>
			</tr>
			<%--<tr>--%>
				<%--<td style="width:70px;text-align: right;padding-top: 13px;">退款状态:</td>--%>
				<%--<td><input type="text" name="REFUND_STATUS" id="REFUND_STATUS" value="${pd.REFUND_STATUS}" maxlength="32" placeholder="这里输入退款状态" title="退款状态"/></td>--%>
			<%--</tr>--%>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">支付状态:</td>
				<td><input type="text" name="PAY_STATUS" id="PAY_STATUS" value="${pd.PAY_STATUS}" maxlength="32" placeholder="这里输入支付状态" title="支付状态"/></td>
			</tr>
			<%--<tr>--%>
				<%--<td style="width:70px;text-align: right;padding-top: 13px;">库存余量:</td>--%>
				<%--<td><input type="text" name="LOW_STOCKS" id="LOW_STOCKS" value="${pd.LOW_STOCKS}" maxlength="32" placeholder="这里输入库存余量" title="库存余量"/></td>--%>
			<%--</tr>--%>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">订单总金额:</td>
				<td><input type="text" name="AMOUNT" id="AMOUNT" value="${pd.AMOUNT}" maxlength="32" placeholder="这里输入订单总金额" title="订单总金额"/></td>
			</tr>
			<%--<tr>--%>
				<%--<td style="width:70px;text-align: right;padding-top: 13px;">订单总兑换积分:</td>--%>
				<%--<td><input type="number" name="AMOUNT_EXCHANGE_SCORE" id="AMOUNT_EXCHANGE_SCORE" value="${pd.AMOUNT_EXCHANGE_SCORE}" maxlength="32" placeholder="这里输入订单总兑换积分" title="订单总兑换积分"/></td>--%>
			<%--</tr>--%>
			<%--<tr>--%>
				<%--<td style="width:70px;text-align: right;padding-top: 13px;">运费总金额:</td>--%>
				<%--<td><input type="text" name="FEE" id="FEE" value="${pd.FEE}" maxlength="32" placeholder="这里输入运费总金额" title="运费总金额"/></td>--%>
			<%--</tr>--%>
			<%--<tr>--%>
				<%--<td style="width:70px;text-align: right;padding-top: 13px;">商品总金额:</td>--%>
				<%--<td><input type="text" name="PTOTAL" id="PTOTAL" value="${pd.PTOTAL}" maxlength="32" placeholder="这里输入商品总金额" title="商品总金额"/></td>--%>
			<%--</tr>--%>
			<tr>
				<td style="width:70px;text-align: right;padding-top: 13px;">商品总数量:</td>
				<td><input type="text" name="QUANTITY" id="QUANTITY" value="${pd.QUANTITY}" maxlength="32" placeholder="这里输入商品总数量" title="商品总数量"/></td>
			</tr>
			<%--<tr>--%>
				<%--<td style="width:70px;text-align: right;padding-top: 13px;">是否有过修改:</td>--%>
				<%--<td><input type="text" name="UPDATE_AMOUNT" id="UPDATE_AMOUNT" value="${pd.UPDATE_AMOUNT}" maxlength="32" placeholder="这里输入是否有过修改" title="是否有过修改"/></td>--%>
			<%--</tr>--%>
			<%--<tr>--%>
				<%--<td style="width:70px;text-align: right;padding-top: 13px;">配送方式编码:</td>--%>
				<%--<td><input type="text" name="EXPRESS_CODE" id="EXPRESS_CODE" value="${pd.EXPRESS_CODE}" maxlength="32" placeholder="这里输入配送方式编码" title="配送方式编码"/></td>--%>
			<%--</tr>--%>
			<%--<tr>--%>
				<%--<td style="width:70px;text-align: right;padding-top: 13px;">配送方式名称:</td>--%>
				<%--<td><input type="text" name="EXPRESS_NAME" id="EXPRESS_NAME" value="${pd.EXPRESS_NAME}" maxlength="32" placeholder="这里输入配送方式名称" title="配送方式名称"/></td>--%>
			<%--</tr>--%>
			<%--<tr>--%>
				<%--<td style="width:70px;text-align: right;padding-top: 13px;">快递运单号:</td>--%>
				<%--<td><input type="text" name="EXPRESS_NO" id="EXPRESS_NO" value="${pd.EXPRESS_NO}" maxlength="32" placeholder="这里输入快递运单号" title="快递运单号"/></td>--%>
			<%--</tr>--%>
			<%--<tr>--%>
				<%--<td style="width:70px;text-align: right;padding-top: 13px;">快递公司名称:</td>--%>
				<%--<td><input type="text" name="EXPRESS_COMPANY_NAME" id="EXPRESS_COMPANY_NAME" value="${pd.EXPRESS_COMPANY_NAME}" maxlength="32" placeholder="这里输入快递公司名称" title="快递公司名称"/></td>--%>
			<%--</tr>--%>
			<%--<tr>--%>
				<%--<td style="width:70px;text-align: right;padding-top: 13px;">确认发货备注:</td>--%>
				<%--<td><input type="text" name="CONFIRM_SEND_PRODUCT_REMARK" id="CONFIRM_SEND_PRODUCT_REMARK" value="${pd.CONFIRM_SEND_PRODUCT_REMARK}" maxlength="32" placeholder="这里输入确认发货备注" title="确认发货备注"/></td>--%>
			<%--</tr>--%>
			<%--<tr>--%>
				<%--<td style="width:70px;text-align: right;padding-top: 13px;">客户的附加要求:</td>--%>
				<%--<td><input type="text" name="OTHER_REQUIREMENT" id="OTHER_REQUIREMENT" value="${pd.OTHER_REQUIREMENT}" maxlength="32" placeholder="这里输入客户的附加要求" title="客户的附加要求"/></td>--%>
			<%--</tr>--%>
			<%--<tr>--%>
				<%--<td style="width:70px;text-align: right;padding-top: 13px;">是否已经评论:</td>--%>
				<%--<td><input type="text" name="CLOSED_COMMENT" id="CLOSED_COMMENT" value="${pd.CLOSED_COMMENT}" maxlength="32" placeholder="这里输入是否已经评论" title="是否已经评论"/></td>--%>
			<%--</tr>--%>
			<%--<tr>--%>
				<%--<td style="width:70px;text-align: right;padding-top: 13px;">订单获赠的积分:</td>--%>
				<%--<td><input type="number" name="SCORE" id="SCORE" value="${pd.SCORE}" maxlength="32" placeholder="这里输入订单获赠的积分" title="订单获赠的积分"/></td>--%>
			<%--</tr>--%>
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