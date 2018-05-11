<#assign base=request.contextPath />
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>作品列表</title>
    <meta name="description" content="这是一个 index 页面">
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

<body data-type="generalComponents">


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
                <ul class="am-dropdown-content">
                    <li><a href="#"><span class="am-icon-bell-o"></span> 资料</a></li>
                    <li><a href="#"><span class="am-icon-cog"></span> 设置</a></li>
                    <li><a href="#"><span class="am-icon-power-off"></span> 退出</a></li>
                </ul>
            </li>
            <li><a href="###" class="tpl-header-list-link"><span
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
                    <a href="javascript:" class="nav-link tpl-left-nav-link-list active">
                        <i class="am-icon-file"></i>
                        <span>审阅作品</span>
                        <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right tpl-left-nav-more-ico-rotate"></i>
                    </a>
                    <ul class="tpl-left-nav-sub-menu" style="display: block;">
                        <li>
                        <#if userInfo.duty?contains("未审阅")>
                            <a href="${base}/endSys/work/notRead">
                                <i class="am-icon-angle-right"></i>
                                <span>未审阅</span>
                            </a>
                        </#if>

                        <#if userInfo.duty?contains("已审阅")>
                            <a href="${base}/endSys/work/ReadOk" class="active">
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
            设计师培训后台管理系统
        </div>
        <ol class="am-breadcrumb">
            <li><a href="#" class="am-icon-home">后台管理</a></li>
            <li><a href="#">审阅作品</a></li>
            <li class="am-active">未审阅</li>
        </ol>
        <div class="tpl-portlet-components">
            <div class="portlet-title">
                <div class="caption font-green bold">
                    <span class="am-icon-users"></span>未审阅作品列表
                </div>
            </div>
            <div class="tpl-block">
                <div class="am-g">
                    <div class="am-u-sm-12">
                        <form class="am-form">
                            <table class="am-table am-table-striped am-table-hover table-main">
                                <thead>
                                <tr>
                                    <th class="table-title">作品名称</th>
                                    <th class="table-date">提交时间</th>
                                    <th class="table-main">作品作者</th>
                                </tr>
                                </thead>

                                <tbody>

                    <#if data?exists>
                        <#list data as work>
                        <tr>

                            <td><a href="${base}/endSys/work/${work.id!}">${work.name!}</a></td>
                            <td>${work.date!?string('yyyy-MM-dd hh:mm:ss')}</td>
                            <td>${work.userId!}</td>

                        </tr>
                        </#list>
                    </#if>

                            </table>

                        </form>
                    </div>

                </div>
            </div>
            <div class="tpl-alert"></div>
        </div>
    </div>
</div>


<script src="${base}/static/js/jquery.min.js"></script>
<script src="${base}/static/js/amazeui.min.js"></script>
<script src="${base}/static/js/app.js"></script>
</body>

</html>