<#assign base=request.contextPath />
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>设计师培训系统首页-培训课程</title>
    <meta name="description" content="后台管理">
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
    <script src="${base}/static/js/echarts.min.js"></script>
    <link href="${base}/static/css/video-js.min.css" rel="stylesheet">
</head>

<body data-type="index">


<header class="am-topbar am-topbar-inverse admin-header">
    <div class="am-topbar-brand">
        <a href="javascript:" class="tpl-logo">
            <img src="${base}/static/img/logo.png" alt="">
        </a>
    </div>
    <div class="am-icon-list tpl-header-nav-hover-ico am-fl am-margin-right">

    </div>

    <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only"
            data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span
            class="am-icon-bars"></span></button>

    <div class="am-collapse am-topbar-collapse" id="topbar-collapse">

        <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list tpl-header-list">

            <li class="am-dropdown" data-am-dropdown data-am-dropdown-toggle>
                <a class="am-dropdown-toggle tpl-header-list-link" href="javascript:">
                    <span class="tpl-header-list-user-nick">${userInfo.name!}</span><span
                        class="tpl-header-list-user-ico"> <img
                        src="${base}/static/img/user01.png"></span>
                </a>
            <#--<ul class="am-dropdown-content">-->
            <#--<li><a href="#"><span class="am-icon-bell-o"></span> 资料</a></li>-->
            <#--<li><a href="#"><span class="am-icon-cog"></span> 设置</a></li>-->
            <#--<li><a href="#"><span class="am-icon-power-off"></span> 退出</a></li>-->
            <#--</ul>-->
            </li>
            <li><a href="${base}/logOut" class="tpl-header-list-link"><span
                    class="am-icon-sign-out tpl-header-list-ico-out-size"></span></a></li>
        </ul>
    </div>
</header>


<div class="tpl-page-container tpl-page-header-fixed">


    <div class="tpl-left-nav tpl-left-nav-hover">
        <div class="tpl-left-nav-title">
            设计师培训后台管理系统
        </div>
        <div class="tpl-left-nav-list">
            <ul class="tpl-left-nav-menu">
                <li class="tpl-left-nav-item">
                    <a href="${base}" class="nav-link">
                        <i class="am-icon-home"></i>
                        <span>首页</span>
                    </a>
                </li>

                <#if userInfo.duty?exists>
                    <#if userInfo.duty?contains("课程管理")>
                        <li class="tpl-left-nav-item">
                            <a href="javascript:" class="nav-link tpl-left-nav-link-list">
                                <i class="am-icon-cloud"></i>
                                <span>课程管理</span>
                                <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
                            </a>
                            <ul class="tpl-left-nav-sub-menu">
                                <li>
                        <#if userInfo.duty?contains("添加课程")>
                                    <a href="${base}/endSys/class/add">
                                        <i class="am-icon-angle-right"></i>
                                        <span>添加课程</span>
                                    <#--<i class="am-icon-star tpl-left-nav-content-ico am-fr am-margin-right"></i>-->
                                    </a>
                        </#if>

                        <#if userInfo.duty?contains("所有课程")>
                                    <a href="${base}/endSys/class/all">
                                        <i class="am-icon-angle-right"></i>
                                        <span>所有课程</span>
                                    <#--<i class="tpl-left-nav-content tpl-badge-success">-->
                                    <#--18-->
                                    <#--</i>-->
                                    </a>
                        </#if>
                                </li>
                            </ul>
                        </li>
                    </#if>


                    <#if userInfo.duty?contains("用户管理")>
                <li class="tpl-left-nav-item">
                    <a href="javascript:" class="nav-link tpl-left-nav-link-list">
                        <i class="am-icon-user"></i>
                        <span>用户管理</span>
                        <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
                    </a>
                    <ul class="tpl-left-nav-sub-menu">
                        <li>
                        <#if userInfo.duty?contains("添加用户")>
                            <a href="${base}/endSys/addUser">
                                <i class="am-icon-angle-right"></i>
                                <span>添加用户</span>
                                <i class="am-icon-star tpl-left-nav-content-ico am-fr am-margin-right"></i>
                            </a>
                        </#if>

                        <#if userInfo.duty?contains("用户列表")>
                            <a href="${base}/endSys/userList">
                                <i class="am-icon-angle-right"></i>
                                <span>用户列表</span>
                            </a>
                        </#if>
                        </li>
                    </ul>
                </li>
                    </#if>


                    <#if userInfo.duty?contains("资源管理")>
                <li class="tpl-left-nav-item">
                    <a href="javascript:" class="nav-link tpl-left-nav-link-list">
                        <i class="am-icon-file"></i>
                        <span>资源管理</span>
                        <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right tpl-left-nav-more-ico-rotate"></i>
                    </a>
                    <ul class="tpl-left-nav-sub-menu" style="display: none;">
                        <li>
                        <#if userInfo.duty?contains("添加资源")>
                            <a href="${base}/endSys/Resource/add">
                                <i class="am-icon-angle-right"></i>
                                <span>添加资源</span>
                            </a>
                        </#if>

                        <#if userInfo.duty?contains("资源列表")>
                            <a href="${base}/endSys/Resource/all">
                                <i class="am-icon-angle-right"></i>
                                <span>资源列表</span>
                            </a>
                        </#if>
                        </li>
                    </ul>
                </li></#if>

                    <#if userInfo.duty?contains("作品管理")>
                <li class="tpl-left-nav-item">
                    <a href="javascript:" class="nav-link tpl-left-nav-link-list">
                        <i class="am-icon-file"></i>
                        <span>作品管理</span>
                        <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right tpl-left-nav-more-ico-rotate"></i>
                    </a>
                    <ul class="tpl-left-nav-sub-menu" style="display: none;">
                        <li>
                        <#if userInfo.duty?contains("添加作品")>
                            <a href="${base}/endSys/work/add">
                                <i class="am-icon-angle-right"></i>
                                <span>添加作品</span>
                            </a>
                        </#if>

                        <#if userInfo.duty?contains("作品列表")>
                            <a href="${base}/endSys/work/all">
                                <i class="am-icon-angle-right"></i>
                                <span>作品列表</span>
                            </a>
                        </#if>
                        </li>
                    </ul>
                </li>
                    </#if>

                    <#if userInfo.duty?contains("审阅作品")>
                <li class="tpl-left-nav-item">
                    <a href="javascript:" class="nav-link tpl-left-nav-link-list">
                        <i class="am-icon-file"></i>
                        <span>审阅作品</span>
                        <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right tpl-left-nav-more-ico-rotate"></i>
                    </a>
                    <ul class="tpl-left-nav-sub-menu" style="display: none;">
                        <li>
                        <#if userInfo.duty?contains("未审阅")>
                            <a href="${base}/endSys/work/notRead">
                                <i class="am-icon-angle-right"></i>
                                <span>未审阅</span>
                            </a>
                        </#if>

                        <#if userInfo.duty?contains("已审阅")>
                            <a href="${base}/endSys/work/ReadOk">
                                <i class="am-icon-angle-right"></i>
                                <span>已审阅</span>
                            </a>
                        </#if>
                        </li>
                    </ul>
                </li>
                    </#if>

                </#if>
            </ul>
        </div>
    </div>


    <div class="tpl-content-wrapper">
        <div class="tpl-content-page-title">
            后台管理
        </div>
        <ol class="am-breadcrumb">
            <li><a href="#" class="am-icon-home">课程管理</a></li>
            <li><a href="#">课程查看</a></li>
            <li class="am-active">课程详情</li>
        </ol>
        <div class="tpl-content-scope">
                <#if clazz?exists>

                    <div class="tpl-portlet-components">
                        <div class="portlet-title">
                            <div class="caption font-green bold">
                                <span class="am-icon-code"></span> ${clazz.title!}
                            </div>
                        </div>

                        <div class="tpl-block ">

                            <div class="am-g tpl-amazeui-form">

                                <div class="am-u-sm-12 am-u-md-9">
                                    <div class="am-form-group">
                                        <label for="user-name" class="am-u-sm-3 am-form-label">发表时间 / Date</label>
                                        <div class="am-u-sm-9">
                                            <input type="text" value="${clazz.date!?string('yyyy-MM-dd hh:mm:ss')}"
                                                   readonly>
                                        </div>
                                    </div>
                                    <br>
                                    <#if teacher?exists>
                                    <div class="am-form-group">
                                        <label for="user-name" class="am-u-sm-3 am-form-label">执教设计师 / Designer</label>
                                        <div class="am-u-sm-9">
                                            <input type="text" value="${teacher.name!}（${teacher.sex!}）"
                                                   readonly>
                                        </div>
                                    </div>
                                    <br>
                                    </#if>
                                    <div class="am-form-group">
                                        <label for="user-name" class="am-u-sm-3 am-form-label">课程内容 / Content</label>
                                        <div class="am-u-sm-9">
                                            ${clazz.content!}
                                        </div>
                                    </div>
                                    <br>
                                    <#if clazz.video?exists>
                                    <div class="am-form-group">
                                        <label for="user-name" class="am-u-sm-3 am-form-label">课程视频 / Location</label>
                                    <#--<video src="${clazz.video!}" height="800" width="480" controls-->
                                    <#--autoplay></video>-->
                                        <video id="my-video" class="video-js" controls preload="auto" width="740"
                                               height="400" data-setup="{}">
                                            <source src="${clazz.video!}" type="video/mp4">
                                            <!--<p class="vjs-no-js">
                                            To view this video please enable JavaScript, and consider upgrading to a web browser that
                                            <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a>
                                            </p>-->
                                        </video>


                                    </div>
                                    <br>
                                    </#if >

                                </div>
                            </div>
                        </div>

                    </div>
                </#if>
        </div>

    </div>

</div>


<script src="${base}/static/js/jquery.min.js"></script>
<script src="${base}/static/js/amazeui.min.js"></script>
<script src="${base}/static/js/iscroll.js"></script>
<script src="${base}/static/js/app.js"></script>
<script src="${base}/static/js/video.min.js"></script>
<script type="text/javascript">
    var myPlayer = videojs('my-video');
    videojs("my-video").ready(function () {
        var myPlayer = this;
        myPlayer.play();
    });
</script>
</body>

</html>