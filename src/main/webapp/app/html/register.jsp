<%--
  Created by IntelliJ IDEA.
  User: 18624915319
  Date: 2017/7/25
  Time: 下午4:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <!-- 优先使用 IE 最新版本和 Chrome -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <!-- 添加到主屏后的标题（iOS 6 新增） -->
    <meta name="apple-mobile-web-app-title" content="">
    <!-- 是否启用 WebApp 全屏模式，删除苹果默认的工具栏和菜单栏 -->
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <!-- 设置苹果工具栏颜色 -->
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <!-- 添加智能 App 广告条 Smart App Banner（iOS 6+ Safari） -->
    <meta name="apple-itunes-app" content="app-id=myAppStoreID, affiliate-data=myAffiliateData, app-argument=myURL">
    <!-- 忽略页面中的数字识别为电话，忽略email识别 -->
    <meta name="format-detection" content="telphone=no, email=no" />
    <!-- 手机适屏 -->
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <title>注册</title>
    <!-- 引入css -->
    <!--引入公共样式表-->
    <link rel="stylesheet" href="../css/base.css">
    <!-- 引入 reg.css -->
    <link rel="stylesheet" href="../css/reg.css">
    <!-- 引入js -->
</head>
<body>
<div class="reg_box">
    <div class="reg_cl">
        <img src="../imgs/icon_close.png" alt="">
    </div>
    <div class="reg_log">
        <div class="log_img">
            <div class="img_box">
                <img src="../imgs/ml_logo.png" alt="">
            </div>
        </div>
        <text>注册</text>
    </div>
    <div class="reg_btn">
        <form action="" method="post">
            <div class="phone">
                <input type="number" name="tel" class="tel" value="" placeholder="请输入手机号">
            </div>
            <div class="ver">
                <input type="number" class="int_ver" value="" placeholder="请输入验证码">
                <button type="button">验证码</button>
            </div>
            <button type="submit" class="btn">注册</button>
        </form>
    </div>
</div>

<div class="hint">
    成功
</div>
</body>
<script src="../js/jquery-1.7.2.min.js"></script>
</html>