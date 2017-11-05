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
    <base href="<%=basePath%>"><!-- jsp文件头和头部 -->
    <%@ include file="../../system/admin/top.jsp" %>
    <link href="static/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="static/css/ace.min.css"/>
    <link rel="stylesheet" href="static/css/ace-skins.min.css"/>
    <link rel="stylesheet" href="static/assets/css/font-awesome.css"/>
    <!-- ace styles -->
    <link rel="stylesheet" href="static/assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style"/>

    <script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
    <script type="text/javascript" src="static/js/jquery.tips.js"></script>

</head>
<body>
<form action="home/save.do" name="Form" id="Form" method="post" enctype="multipart/form-data">
    <input type="hidden" name="HOME_ID" id="HOME_ID" value="${pd.HOME_ID}"/>
<div class="container-fluid" id="main-container">


    <div id="page-content" class="clearfix">

        <div class="row-fluid">
            <div id="zhongxin">
                <label style="color: red;">* 上传图片尺寸宽高比例为 1:2</label>
                <table id="table_report" class="table table-striped table-bordered table-hover">
                    <tr>
                        <th width="50px">图片1:</th>
                        <td>
                            <c:if test="${pd == null || pd.PIC1 == '' || pd.PIC1 == null }">
                                <input type="file" id="tp1" name="tp1" onchange="fileType(this,'tp1')" />
                            </c:if>
                            <c:if test="${pd != null && pd.PIC1 != '' && pd.PIC1 != null }">
                                <a href="<%=basePath%>uploadFiles/uploadImgs/${pd.PIC1}" target="_blank"><img
                                        src="<%=basePath%>uploadFiles/uploadImgs/${pd.PIC1}" width="210"/></a>
                                <input type="button" class="btn btn-mini btn-danger" value="删除"
                                       onclick="delP('${pd.PIC1}','PIC1');"/>
                                <input type="hidden" name="tpz1" id="tpz1" value="${pd.PIC1 }"/>
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <th width="50px">图片2:</th>
                        <td>
                            <c:if test="${pd == null || pd.PIC2 == '' || pd.PIC2 == null }">
                                <input type="file" id="tp2" name="tp2" onchange="fileType(this,'tp2')" />
                            </c:if>
                            <c:if test="${pd != null && pd.PIC2 != '' && pd.PIC2 != null }">
                                <a href="<%=basePath%>uploadFiles/uploadImgs/${pd.PIC2}" target="_blank"><img
                                        src="<%=basePath%>uploadFiles/uploadImgs/${pd.PIC2}" width="210"/></a>
                                <input type="button" class="btn btn-mini btn-danger" value="删除"
                                       onclick="delP('${pd.PIC2}','PIC2');"/>
                                <input type="hidden" name="tpz2" id="tpz2" value="${pd.PIC2 }"/>
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <th width="50px">图片3:</th>
                        <td>
                            <c:if test="${pd == null || pd.PIC3 == '' || pd.PIC3 == null }">
                                <input type="file" id="tp3" name="tp3" onchange="fileType(this,'tp3')" />
                            </c:if>
                            <c:if test="${pd != null && pd.PIC3 != '' && pd.PIC3 != null }">
                                <a href="<%=basePath%>uploadFiles/uploadImgs/${pd.PIC3}" target="_blank"><img
                                        src="<%=basePath%>uploadFiles/uploadImgs/${pd.PIC3}" width="210"/></a>
                                <input type="button" class="btn btn-mini btn-danger" value="删除"
                                       onclick="delP('${pd.PIC3}','PIC3');"/>
                                <input type="hidden" name="tpz3" id="tpz3" value="${pd.PIC3 }"/>
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center;" colspan="2">
                            <a class="btn btn-mini btn-primary" onclick="save();">保存</a>
                        </td>
                    </tr>
                </table>
            </div>

        </div><!--/row-->

    </div><!--/#page-content-->
</div><!--/.fluid-container#main-container-->
</form>
<!-- 返回顶部  -->
<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse">
    <i class="icon-double-angle-up icon-only"></i>
</a>

<!-- 引入 -->
<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
<script src="static/js/bootstrap.min.js"></script>
<script src="static/js/ace-elements.min.js"></script>
<script src="static/js/ace.min.js"></script>
<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
<!-- 引入 -->
<script type="text/javascript" src="static/js/jquery.tips.js"></script><!--提示框-->
<!-- 引入 -->
<!--[if !IE]> -->
<script type="text/javascript">
    window.jQuery || document.write("<script src='static/assets/js/jquery.js'>" + "<" + "/script>");
</script>
<!-- <![endif]-->
<!--[if IE]>
<script type="text/javascript">
    window.jQuery || document.write("<script src='static/assets/js/jquery1x.js'>" + "<" + "/script>");
</script>
<![endif]-->
<!-- ace scripts -->
<script src="static/assets/js/ace/elements.fileinput.js"></script>
<script src="static/assets/js/ace/ace.js"></script>
<script type="text/javascript">
    $(top.hangge());
    function save(){

        $("#Form").submit();
    }
    $(function () {
        //上传
        $('#tp1').ace_file_input({
            style:'well',
            btn_choose:'请选择要上传的图片',
            btn_change:null,
            no_icon:'',
            droppable:true,
            thumbnail:'small',
            whitelist: 'gif|png|jpg|jpeg',
            //blacklist:'gif|png|jpg|jpeg'
            //onchange:''
            //
        });
        $('#tp2').ace_file_input({
            style:'well',
            btn_choose:'请选择要上传的图片',
            btn_change:null,
            no_icon:'',
            droppable:true,
            thumbnail:'small',
            whitelist: 'gif|png|jpg|jpeg',
            //blacklist:'gif|png|jpg|jpeg'
            //onchange:''
            //
        });
        $('#tp3').ace_file_input({
            style:'well',
            btn_choose:'请选择要上传的图片',
            btn_change:null,
            no_icon:'',
            droppable:true,
            thumbnail:'small',
            whitelist: 'gif|png|jpg|jpeg',
            //blacklist:'gif|png|jpg|jpeg'
            //onchange:''
            //
        });

    });
    //过滤类型
    function fileType(obj,id) {
        var fileType = obj.value.substr(obj.value.lastIndexOf(".")).toLowerCase();//获得文件后缀名
        if (fileType != "" && fileType != '.gif' && fileType != '.png' && fileType != '.jpg' && fileType != '.jpeg') {
            $('#'+id).tips({
                side: 3,
                msg: '请上传图片格式的文件',
                bg: '#AE81FF',
                time: 3
            });
            $("#"+id).val('');
            document.getElementById(id).files[0] = '请选择图片';
        }
    }

    //删除图片
    function delP(PATH, PICNUM) {
        if (confirm("确定要删除图片？")) {
            var url = "home/deltp.do?PATH=" + PATH + "&PICNUM=" + PICNUM + "&guid=" + new Date().getTime();
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

