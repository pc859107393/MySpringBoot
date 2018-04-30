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
            <#--<li class="tpl-left-nav-item">-->
            <#--<a href="chart.html" class="nav-link tpl-left-nav-link-list">-->
            <#--<i class="am-icon-bar-chart"></i>-->
            <#--<span>最新课程&最新学习资源</span>-->
            <#--&lt;#&ndash;<i class="tpl-left-nav-content tpl-badge-danger">&ndash;&gt;-->
            <#--&lt;#&ndash;12&ndash;&gt;-->
            <#--&lt;#&ndash;</i>&ndash;&gt;-->
            <#--</a>-->
            <#--</li>-->

                <li class="tpl-left-nav-item">
                    <a href="javascript:" class="nav-link tpl-left-nav-link-list">
                        <i class="am-icon-cloud"></i>
                        <span>课程管理</span>
                        <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
                    </a>
                    <ul class="tpl-left-nav-sub-menu">
                        <li>
                            <a href="${base}/endSys/class/add">
                                <i class="am-icon-angle-right"></i>
                                <span>添加课程</span>
                            <#--<i class="am-icon-star tpl-left-nav-content-ico am-fr am-margin-right"></i>-->
                            </a>

                            <a href="${base}/endSys/class/all">
                                <i class="am-icon-angle-right"></i>
                                <span>所有课程</span>
                            <#--<i class="tpl-left-nav-content tpl-badge-success">-->
                            <#--18-->
                            <#--</i>-->
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="tpl-left-nav-item">
                    <a href="javascript:" class="nav-link tpl-left-nav-link-list">
                        <i class="am-icon-user"></i>
                        <span>用户管理</span>
                        <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
                    </a>
                    <ul class="tpl-left-nav-sub-menu">
                        <li>
                            <a href="${base}/endSys/addUser">
                                <i class="am-icon-angle-right"></i>
                                <span>添加用户</span>
                                <i class="am-icon-star tpl-left-nav-content-ico am-fr am-margin-right"></i>
                            </a>

                            <a href="${base}/endSys/userList">
                                <i class="am-icon-angle-right"></i>
                                <span>用户列表</span>
                            </a>
                        </li>
                    </ul>
                </li>

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

                <li class="tpl-left-nav-item">
                    <a href="javascript:" class="nav-link tpl-left-nav-link-list">
                        <i class="am-icon-file"></i>
                        <span>作品管理</span>
                        <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right tpl-left-nav-more-ico-rotate"></i>
                    </a>
                    <ul class="tpl-left-nav-sub-menu" style="display: none;">
                        <li>
                            <a href="${base}/endSys/work/add">
                                <i class="am-icon-angle-right"></i>
                                <span>添加作品</span>
                            </a>

                            <a href="${base}/endSys/work/all">
                                <i class="am-icon-angle-right"></i>
                                <span>作品列表</span>
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
            <li><a href="${base}" class="am-icon-home">首页</a></li>
            <li><a href="#">作品管理</a></li>
            <li class="am-active">添加作品</li>
        </ol>
        <div class="tpl-portlet-components">
            <div class="portlet-title">
                <div class="caption font-green bold">
                    <span class="am-icon-user"></span> 添加资源
                </div>
            </div>

            <div class="tpl-block">

                <div class="am-g">
                    <div class="tpl-form-body tpl-form-line">
                <#if msg?exists>
                    <div class="am-form-group">
                        <div class="am-alert am-alert-danger">
                            ${msg}
                        </div>
                    </div>
                </#if>
                        <form class="am-form tpl-form-line-form" action="${base}/endSys/work/add" method="post"
                              enctype="multipart/form-data" onsubmit="checkAddContent()">
                            <div class="am-form-group">
                                <label for="user-name" class="am-u-sm-3 am-form-label">作品标题 <span
                                        class="tpl-form-line-small-title">Resource Title</span></label>
                                <div class="am-u-sm-9">
                                    <input type="text" class="tpl-form-input" name="name" id="title"
                                           placeholder="请输入作品标题">
                                </div>
                            </div>

                            <div class="am-form-group">
                                <label for="user-phone" class="am-u-sm-3 am-form-label">作品选择 <span
                                        class="tpl-form-line-small-title">Choose</span></label>
                                <div class="am-u-sm-9">
                                    <div class="am-form-group am-form-file">
                                        <button type="button" class="am-btn am-btn-danger am-btn-sm">
                                            <i class="am-icon-cloud-upload"></i> 添加作品文件
                                        </button>
                                        <input id="doc-form-file" type="file" name="upfile" multiple>
                                        <br>
                                    <#--<input readonly value="">-->
                                    </div>

                                </div>
                            </div>

                            <div class="am-form-group">
                                <label for="user-email" class="am-u-sm-3 am-form-label">作品内容描述 <span
                                        class="tpl-form-line-small-title">Resource Content</span></label>
                                <div class="am-u-sm-9">
                                    <div id="editor">
                                        <p>请在此处 <b>编辑作品内容</b></p>
                                    </div>
                                    <input type="hidden" class="am-form-field tpl-form-no-bg" placeholder="作品内容"
                                           id="content"
                                           name="content"/>
                                </div>
                            </div>

                            <div class="am-form-group">
                                <div class="am-u-sm-3 am-u-sm-push-3">
                                    <button type="submit" class="am-btn am-btn-primary tpl-btn-bg-color-success ">提交
                                    </button>
                                </div>
                                <div class="am-u-sm-3">
                                    <button type="reset" class="am-btn am-btn-primary tpl-btn-bg-color-success ">清除
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>

    </div>

</div>


<script src="${base}/static/js/jquery.min.js"></script>
<script src="${base}/static/js/amazeui.min.js"></script>
<script src="${base}/static/js/iscroll.js"></script>
<script src="${base}/static/js/app.js"></script>
<script src="../../../static/js/wangEditor.min.js"></script>
<script type="text/javascript">
    var E = window.wangEditor;
    var editor = new E('#editor');
    // 或者 var editor = new E( document.getElementById('editor') )
    // 配置服务器端地址
    editor.customConfig.uploadImgServer = '${base}/endSys/uploadFile';
    // 限制一次最多上传 5 张图片
    editor.customConfig.uploadImgMaxLength = 5;
    editor.customConfig.uploadFileName = 'upfile';
    editor.create();

    function checkAddContent() {
        document.getElementById("content").value = editor.txt.html();
        return true;
    }


</script>
</body>

</html>