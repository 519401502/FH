<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <!-- 优先使用 IE 最新版本和 Chrome -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <!-- 添加到主屏后的标题（iOS 6 新增） -->
    <meta name="apple-mobile-web-app-title" content=""/>
    <!-- 是否启用 WebApp 全屏模式，删除苹果默认的工具栏和菜单栏 -->
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <!-- 设置苹果工具栏颜色 -->
    <meta name="apple-mobile-web-app-status-bar-style" content="black"/>
    <!-- 添加智能 App 广告条 Smart App Banner（iOS 6+ Safari） -->
    <meta name="apple-itunes-app" content="app-id=myAppStoreID, affiliate-data=myAffiliateData, app-argument=myURL"/>
    <!-- 忽略页面中的数字识别为电话，忽略email识别 -->
    <meta name="format-detection" content="telphone=no, email=no"/>
    <!-- 手机适屏 -->
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <title>注册</title>
    <!-- 引入css -->
    <!--引入公共样式表-->
    <link rel="stylesheet" href="./css/base.css"/>
    <!-- 引入 reg.css -->
    <%--<link rel="stylesheet" href="./css/reg.css">--%>
    <!-- 引入js -->
    <style>
        .reg_box {
            width: 96%;
            height: 100%;
            padding: 0 2%;
            background: #f8f8f8;
            position: relative;
            overflow: hidden;
        }

        button {
            border-radius: 5px;
            background: #e73838;
            color: #fff;
            text-align: center;
        }

        input {
            border-bottom: #999 1px solid;
            height: 30px;
            line-height: 30px;
            width: 100%;
        }

        .reg_cl {
            width: 100%;
            height: 5%;
        }

        .reg_cl img {
            width: 20px;
            height: 20px;
            margin-top: 2%;
        }

        .logo {
            width: 100%;
            height: 45%;
        }

        .log_img {
            width: 100%;
            height: 80%;
            position: relative;
        }

        .img_box {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            background: #fff;
            position: absolute;
            left: 50%;
            top:30%;
            margin-left: -50px;
        }

        .img_box img {
            width: 98%;
            height: 98%;
            margin: 1%;
            border-radius: 50%;
        }

        .logo p {
            width: 100%;
            text-align: center;
        }

        .reg_btn {
            width: 100%;
            height: 50%;
        }

        .tel_phone {
            width: 90%;
            margin: 0 5%;
            margin-top: 15px;
        }

        .ver {
            width: 90%;
            margin: 0 5%;
            margin-top: 15px;
            display: flex;
        }

        .ver .hq{
            width: 30%;
            margin-left: 5%;
            border-radius: 5px;
            background: #e73838;
            color: #fff;
            text-align: center;
        }

        .btn {
            width: 90%;
            margin-left: 5%;
            margin-top: 20px;
            text-align: center;
            height: 40px;
        }

        .hint {
            position: fixed;
            width: 40%;
            height: 30px;
            left: 50%;
            margin-left: -20%;
            background: #404040;
            top: 50%;
            margin-top: -15px;
            text-align: center;
            color: #fff;
            line-height: 30px;
            border-radius: 5px;
            display: none;
        }
    </style>
</head>

<body>
<div class="reg_box">
    <div class="reg_cl">
        <img src="./imgs/icon_close.png">
    </div>
    <div class="logo">
        <div class="log_img">
            <div class="img_box">
                <img src="./imgs/ml_logo.png">
            </div>
        </div>
        <p>注册</p>
    </div>
    <div class="reg_btn">
        <form action="download" id="from_id" method="post">
            <div class="tel_phone">
                <input type="tel" name="phone" id="phone" maxlength="11" placeholder="请输入手机号">
                <input type="hidden" id="invite" name="invite" value="${pd.INVITECODE}">
            </div>

            <div class="ver">
                <input type="number" class="int_ver" id="code_id" value="" placeholder="请输入验证码">
                <input type="button" id="button_code" onclick="sendVCode(this)" class="hq" value="验证码"/>
            </div>
            <button type="button" class="btn" onclick="register(this)">注册</button>
        </form>
    </div>
</div>
<div class="hint"></div>
</body>
<script src="./js/jquery-1.7.2.min.js"></script>

<script type="text/javascript">
    var $hint = $('.hint');
    var timer;
    function register(data){
        if ($('#phone').val() != '' && $('#phone').val().length == 11 && $('#code_id').val() != ''){
//            $('#from.id').submit();
            document.getElementById("from_id").submit();
        } else {
            timer = setTimeout(function(){
                //操作错误提示显示
                $hint.css('display','inline-block');
                $hint.html('请输入正确的手机号或验证码');
            },800);
            timer = setTimeout(function(){
                //操作错误提示显示
                $hint.css('display','none');
            },2000);
        }
    }

    var countdown = 60;
    function sendVCode(obj) {
        var _url = "sendcode";
        $.ajax({
            url: _url,
            type: 'POST',
            data: {phone: $('#phone').val()},
            success: function (data) {
                console.log(data);
                settime(obj);
            }
        });

        function settime(obj) {
            if (countdown == 0) {
                //点击后，过了60秒之后，恢复成获取验证码
                obj.removeAttribute("disabled")
                obj.style.backgroundColor="#e73838";
//                $('#button_code').val();
                obj.value = "获取验证码";
                countdown = 60;
                return;
            } else {
                //跳帧 0--->60
                obj.setAttribute("disabled", true);
                obj.style.backgroundColor="#ccc";
                obj.value = "重新发送(" + countdown + ")";
                countdown--;
            }
            setTimeout(function() {
                settime(obj);
            }, 1000)
        }



    }


</script>
</html>