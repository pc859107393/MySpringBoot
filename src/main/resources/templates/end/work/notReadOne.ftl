<#assign base=request.contextPath />
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>设计师培训系统首页-未审阅</title>
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
                    <a href="javascript:" class="nav-link tpl-left-nav-link-list active">
                        <i class="am-icon-file"></i>
                        <span>审阅作品</span>
                        <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right tpl-left-nav-more-ico-rotate"></i>
                    </a>
                    <ul class="tpl-left-nav-sub-menu" style="display: block;">
                        <li>
                        <#if userInfo.duty?contains("未审阅")>
                            <a href="${base}/endSys/work/notRead" class="active">
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
            <li><a href="#" class="am-icon-home">作品管理</a></li>
            <li><a href="#">作品查看</a></li>
            <li class="am-active">作品详情</li>
        </ol>
        <div class="tpl-content-scope">

                <#if msg?exists>
                    <div class="am-form-group">
                        <div class="am-alert am-alert-danger">
                            ${msg}
                        </div>
                    </div>
                </#if>

                <#if bean?exists>

                    <div class="tpl-portlet-components">
                        <div class="portlet-title">
                            <div class="caption font-green bold">
                                <span class="am-icon-code"></span> ${bean.name!}
                            </div>
                        </div>

                        <div class="tpl-block ">

                            <div class="am-g tpl-amazeui-form">

                                <div class="am-u-sm-12 am-u-md-9">
                                    <div class="am-form-group">
                                        <label for="user-name" class="am-u-sm-3 am-form-label">提交名称 / Date</label>
                                        <div class="am-u-sm-9">
                                            <input type="text" value="${bean.date!?string('yyyy-MM-dd hh:mm:ss')}"
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
                                        <label for="user-name" class="am-u-sm-3 am-form-label">作品介绍 / Content</label>
                                        <div class="am-u-sm-9">${bean.content!}
                                        </div>
                                    </div>
                                    <br>
                                    <div class="am-form-group">
                                        <label for="user-name" class="am-u-sm-3 am-form-label">下载作品 / Download</label>
                                        <div class="am-u-sm-9">
                                            <a href="${bean.url!}">
                                                <button type="button" class="am-btn am-btn-default am-btn-success"><span
                                                        class="am-icon-download"></span> 下载
                                                </button>
                                            </a>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>

                    </div>


                    <div class="tpl-portlet-components">
                        <div class="portlet-title">
                            <div class="caption font-green bold">
                                <span class="am-icon-code"></span> 选择打分
                            </div>
                        </div>

                        <div class="tpl-block ">

                            <form class="am-form tpl-form-line-form" action="/endSys/work/addSocre" method="post"
                                  onsubmit="return checkAddScoreContent()">
                                <div class="am-g tpl-amazeui-form">

                                    <div class="am-u-sm-12 am-u-md-9">
                                        <input type="hidden" class="am-form-field tpl-form-no-bg"
                                               id="id"
                                               value="${bean.id}"
                                               name="id"/>

                                        <div class="am-form-group">
                                            <label for="user-name" class="am-u-sm-3 am-form-label">分数 / Score</label>
                                            <div class="am-u-sm-9">
                                                <input type="number" name="score" placeholder="输入分数">
                                            </div>
                                        </div>
                                        <br>

                                        <div class="am-form-group">
                                            <label for="user-email" class="am-u-sm-3 am-form-label">详细评论 <span
                                                    class="tpl-form-line-small-title">Comment</span></label>
                                            <div class="am-u-sm-9">
                                                <div id="editor">
                                                    <p>请在此处 <b>编辑评论</b></p>
                                                </div>
                                                <input type="hidden" class="am-form-field tpl-form-no-bg"
                                                       placeholder="作品评论"
                                                       id="comment"
                                                       name="comment"/>
                                            </div>
                                        </div>

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


                </#if>
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

    $('#datetimepicker').datetimepicker({
        format: 'yyyy-mm-dd hh:mm:ss'
    });

    function checkAddScoreContent() {
        document.getElementById("comment").value = editor.txt.html();
        return true;
    }


</script>
</body>

</html>