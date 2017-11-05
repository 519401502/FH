<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8"/>
    <title></title>
    <meta name="description" content="overview & stats"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="static/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="static/css/bootstrap-responsive.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="static/css/font-awesome.min.css"/>
    <!-- 下拉框 -->
    <link rel="stylesheet" href="static/css/chosen.css"/>

    <link rel="stylesheet" href="static/css/ace.min.css"/>
    <link rel="stylesheet" href="static/css/ace-responsive.min.css"/>
    <link rel="stylesheet" href="static/css/ace-skins.min.css"/>

    <link rel="stylesheet" href="static/css/datepicker.css"/><!-- 日期框 -->
    <script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
    <script type="text/javascript" src="static/js/jquery.tips.js"></script>

    <script type="text/javascript">


        //保存
        function save() {
            if ($("#GNAME").val() == "") {
                $("#GNAME").tips({
                    side: 3,
                    msg: '请输入商品名称',
                    bg: '#AE81FF',
                    time: 2
                });
                $("#GNAME").focus();
                return false;
            }
            if ($("#GPRICE").val() == "") {
                $("#GPRICE").tips({
                    side: 3,
                    msg: '请输入商品价格',
                    bg: '#AE81FF',
                    time: 2
                });
                $("#GPRICE").focus();
                return false;
            }
            if ($("#GNOW_PRICE").val() == "") {
                $("#GNOW_PRICE").tips({
                    side: 3,
                    msg: '请输入现价',
                    bg: '#AE81FF',
                    time: 2
                });
                $("#GNOW_PRICE").focus();
                return false;
            }

            if((document.getElementById("tp") != null) && ($("#tp").val()=="" || document.getElementById("tp").files[0] =='请选择图片')){

                $("#tp").tips({
                    side:3,
                    msg:'请选图片',
                    bg:'#AE81FF',
                    time:3
                });
                return false;
            }


            $("#Form").submit();
            $("#zhongxin").hide();
            $("#zhongxin2").show();
        }
        //过滤类型
        function fileType(obj){
            var fileType=obj.value.substr(obj.value.lastIndexOf(".")).toLowerCase();//获得文件后缀名
            if(fileType != '.gif' && fileType != '.png' && fileType != '.jpg' && fileType != '.jpeg'){
                $("#tp").tips({
                    side:3,
                    msg:'请上传图片格式的文件',
                    bg:'#AE81FF',
                    time:3
                });
                $("#tp").val('');
                if( document.getElementById("tp") != null){
                    document.getElementById("tp").files[0] = '请选择图片';
                }

            }
        }
    </script>
</head>
<body>
<form action="goods/${msg }.do" name="Form" id="Form" method="post" enctype="multipart/form-data">
    <input type="hidden" name="GOODS_ID" id="GOODS_ID" value="${pd.GOODS_ID}"/>
    <div id="zhongxin">
        <table id="table_report" class="table table-striped table-bordered table-hover">
            <tr>
                <td style="width:70px;text-align: right;padding-top: 13px;">商品名称:</td>
                <td><input type="text" name="GNAME" id="GNAME" value="${pd.GNAME}" maxlength="32" placeholder="这里输入商品名称"
                           title="商品名称"/></td>
            </tr>
            <tr>
                <td style="width:70px;text-align: right;padding-top: 13px;">商品价格:</td>
                <td><input type="text" name="GPRICE" id="GPRICE" value="${pd.GPRICE}" maxlength="32"
                           placeholder="这里输入商品价格" title="商品价格"/> &nbsp;&nbsp;元</td>
            </tr>
            <tr>
                <td style="width:70px;text-align: right;padding-top: 13px;">现价:</td>
                <td><input type="text" name="GNOW_PRICE" id="GNOW_PRICE" value="${pd.GNOW_PRICE}" maxlength="32"
                           placeholder="这里输入现价" title="现价"/>&nbsp;&nbsp;元</td>
            </tr>
            <tr>
                <td style="width:70px;text-align: right;padding-top: 13px;">图片:</td>
                <td><c:if test="${pd == null || pd.GPIC_PATH == '' || pd.GPIC_PATH == null }">
                    <input type="file" id="tp" name="tp" onchange="fileType(this)"/>
                </c:if>
                    <c:if test="${pd != null && pd.GPIC_PATH != '' && pd.GPIC_PATH != null }">
                        <a href="<%=basePath%>uploadFiles/uploadImgs/${pd.GPIC_PATH}" target="_blank"><img
                                src="<%=basePath%>uploadFiles/uploadImgs/${pd.GPIC_PATH}" width="210"/></a>
                        <input type="button" class="btn btn-mini btn-danger" value="删除"
                               onclick="delP('${pd.GPIC_PATH}','${pd.GOODS_ID }');"/>
                    </c:if>
                </td>
            </tr>
            <tr>
                <td style="text-align: center;" colspan="10">
                    <a class="btn btn-mini btn-primary" onclick="save();">保存</a>
                    <a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
                </td>
            </tr>
        </table>
    </div>

    <div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img
            src="static/images/jiazai.gif"/><br/><h4 class="lighter block green">提交中...</h4></div>

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
    $(function () {

        //单选框
        $(".chzn-select").chosen();
        $(".chzn-select-deselect").chosen({allow_single_deselect: true});

        //日期框
        $('.date-picker').datepicker();
        //上传
        $('#tp').ace_file_input({
            no_file:'请选择图片 ...',
            btn_choose:'选择',
            btn_change:'更改',
            droppable:false,
            onchange:null,
            thumbnail:false, //| true | large
            whitelist:'gif|png|jpg|jpeg',
            //blacklist:'gif|png|jpg|jpeg'
            //onchange:''
            //
        });

    });
    //删除图片
    function delP(PICNUM) {
        if (confirm("确定要删除图片？")) {
            var GOODS_ID = $("#GOODS_ID").val();
            var url = "goods/deltp.do?GOODS_ID=" + GOODS_ID + "&guid=" + new Date().getTime();
            $.get(url, function (data) {
                if (data == "success") {
                    alert("删除成功!");
                    document.location.reload();
                }
            });
        }
    }
</script>
</body>
</html>