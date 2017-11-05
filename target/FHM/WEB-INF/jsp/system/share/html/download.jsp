<%@ page import="com.fh.system.SystemStaticData" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
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
    <title>Aimilun</title>
    <!-- 引入css -->
    <!--引入公共样式表-->
    <link rel="stylesheet" href="./css/base.css">
    <style>
        .down_box{width:96%;height:100%;padding:0 2%;background: #f8f8f8;position: relative;overflow: hidden;}

        button{border-radius: 5px;background:#e73838;color: #fff;}

        .back{width: 100%;height: 5%;}
        .back img{width: 20px;height: 20px;margin-top: 2%;}

        .logo{width: 100%;height: 45%;}
        .log_img{width: 100%;height:80%;position:relative;}
        .img_box{width: 100px;height:100px;border-radius: 50%;background: #fff;position: absolute;left: 50%;top:50%;margin-left: -50px;}
        .img_box img{width: 98%;height: 98%;margin: 1%;border-radius: 50%;}
        .logo p{width: 100%;text-align: center;}
        .btn{width: 100%;height: 50%;}
        .downBtn{width: 90%;margin-left: 5%;height: 30px;margin-top: 20px;}
        .downBtn a{width: 100%;height: 30px;display: inline-block;background:#e73838;padding: 0;margin: 0;line-height: 30px;color: #fff; }
    </style>
</head>
<body>
<div class="down_box">
    <div class="back">
        <img src="./imgs/ic-back1.png">
    </div>

    <div class="logo">
        <div class="log_img">
            <div class="img_box">
                <img src="./imgs/ml_logo.png">
            </div>
        </div>
        <p style="margin-top: 20px;">AMILUN</p>
    </div>
    <div class="btn">
        <button class="downBtn" value="Android" title="Android">
            <a href="<%=SystemStaticData.appDown%>">Android</a >
        </button>
    </div>
</div>
</body>
</html>
