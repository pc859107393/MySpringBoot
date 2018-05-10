<#assign base=request.contextPath />
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>用户列表</title>
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

                <li class="tpl-left-nav-item">
                    <a href="javascript:" class="nav-link tpl-left-nav-link-list active">
                        <i class="am-icon-cloud"></i>
                        <span>课程管理</span>
                        <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
                    </a>
                    <ul class="tpl-left-nav-sub-menu" style="display: block;">
                        <li>
                            <a href="${base}/endSys/class/add">
                                <i class="am-icon-angle-right"></i>
                                <span>添加课程</span>
                            </a>

                            <a href="${base}/endSys/class/all" class="active">
                                <i class="am-icon-angle-right"></i>
                                <span>所有课程</span>
                            </a>
                        </li>
                    </ul>
                </li>

                <shiro:hasPermission name="用户管理">
                    <li class="tpl-left-nav-item">
                        <a href="javascript:" class="nav-link tpl-left-nav-link-list">
                            <i class="am-icon-user"></i>
                            <span>用户管理</span>
                            <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right tpl-left-nav-more-ico-rotate"></i>
                        </a>
                        <ul class="tpl-left-nav-sub-menu">
                            <li>
                                <a href="${base}/endSys/addUser">
                                    <i class="am-icon-angle-right"></i>
                                    <span>添加用户</span>
                                </a>

                                <a href="${base}/endSys/userList">
                                    <i class="am-icon-angle-right"></i>
                                    <span>用户列表</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                </shiro:hasPermission>

                <li class="tpl-left-nav-item">
                    <a href="javascript:" class="nav-link tpl-left-nav-link-list">
                        <i class="am-icon-file"></i>
                        <span>资源管理</span>
                        <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right tpl-left-nav-more-ico-rotate"></i>
                    </a>
                    <ul class="tpl-left-nav-sub-menu" style="display: none;">
                        <li>
                            <a href="${base}/endSys/Resource/add">
                                <i class="am-icon-angle-right"></i>
                                <span>添加资源</span>
                            </a>

                            <a href="${base}/endSys/Resource/all">
                                <i class="am-icon-angle-right"></i>
                                <span>资源列表</span>
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>

    <div class="tpl-content-wrapper">
        <div class="tpl-content-page-title">
            设计师培训后台管理系统
        </div>
        <ol class="am-breadcrumb">
            <li><a href="#" class="am-icon-home">后台管理</a></li>
            <li><a href="#">课程管理</a></li>
            <li class="am-active">所有课程</li>
        </ol>
        <div class="tpl-portlet-components">
            <div class="portlet-title">
                <div class="caption font-green bold">
                    <span class="am-icon-users"></span>所有课程
                </div>
            </div>
            <div class="tpl-block">
                <div class="am-g">
                    <div class="am-u-sm-12">
                        <form class="am-form">
                            <table class="am-table am-table-striped am-table-hover table-main">
                                <thead>
                                <tr>
                                    <th class="table-title">课程名称</th>
                                    <th class="table-date">上课时间</th>
                                    <th class="table-main">资源预览</th>
                                </tr>
                                </thead>

                                <tbody>

                    <#if clazz?exists>
                        <#list clazz as class>
                        <tr>

                            <td><a href="${base}/endSys/class/${class.id!}">${class.title!}</a></td>
                            <td>${class.date!?string('yyyy-MM-dd hh:mm:ss')}</td>
                            <td>${class.video!}</td>

                        </tr>
                        </#list>
                    </#if>

                            </table>
                            <div class="am-cf">

                                <div class="am-fr">
                                    <ul class="am-pagination tpl-pagination">
                                        <li class="am-disabled">上一页</li>
                                        <li class="am-active">${pageNum}</li>
                                        <li <#if (pageNum>=total)> class="am-disabled" </#if>>下一页</li>
                                    </ul>
                                    <small>当前总计${total}页，每页${pageSize}个课程！</small>
                                </div>
                            </div>
                            <hr>

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