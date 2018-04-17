<#assign base=request.contextPath />
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Amaze UI Admin index Examples</title>
    <meta name="description" content="登录界面¬">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="icon" type="image/png" href="${base}/static/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="${base}/static/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
    <link rel="stylesheet" href="${base}/static/css/amazeui.min.css"/>
    <link rel="stylesheet" href="${base}/static/css/admin.css">
    <link rel="stylesheet" href="${base}/static/css/app.css">
</head>

<body data-type="login">

<div class="am-g myapp-login">
    <div class="myapp-login-logo-block  tpl-login-max">
        <div class="myapp-login-logo-text">
            <div class="myapp-login-logo-text">
                设计师培训<span> 后台登录</span> <i class="am-icon-skyatlas"></i>

            </div>
        </div>

        <div class="am-u-sm-10 login-am-center">
            <form class="am-form" method="post" action="/login" onsubmit="return beforeLogin()">
                <fieldset>
                    <div class="am-form-group">
                        <input type="number" class="" id="user-name" name="tel" placeholder="请输入手机号">
                    </div>
                    <div class="am-form-group">
                        <input type="password" class="" id="user-pwd" name="password" placeholder="请输入密码">
                    </div>
                    <div class="am-form-group am-hide">
                        <input type="password" class="" id="user-re-pwd" placeholder="请输入密码">
                    </div>
                    <p>
                        <button type="submit" class="am-btn am-btn-default">登录</button>
                    </p>
                </fieldset>
            </form>
        </div>
    </div>
</div>

<script src="${base}/static/js/jquery.min.js"></script>
<script src="${base}/static/js/amazeui.min.js"></script>
<script src="${base}/static/js/app.js"></script>
<script src="${base}/static/js/jquery.tips.js"></script>
<#include "_inc/_login.ftl"/>
</body>

</html>