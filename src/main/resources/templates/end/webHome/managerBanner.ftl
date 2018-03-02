<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8"/>
    <title>轮播图管理</title>

    <!-- basic styles -->

    <link href="../../../static/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="../../../static/css/font-awesome.min.css"/>

    <!--[if IE 7]>
    <link rel="stylesheet" href="../../../static/css/font-awesome-ie7.min.css"/><![endif]-->

    <!-- page specific plugin styles -->

    <link rel="stylesheet" href="../../../static/css/colorbox.css"/>

    <!-- fonts -->

    <link rel="stylesheet" href="../../../static/css/googleapis-css.css"/>

    <!-- ace styles -->

    <link rel="stylesheet" href="../../../static/css/ace.min.css"/>
    <link rel="stylesheet" href="../../../static/css/ace-rtl.min.css"/>
    <link rel="stylesheet" href="../../../static/css/ace-skins.min.css"/>

    <!--[if lte IE 8]>
    <link rel="stylesheet" href="../../../static/css/ace-ie.min.css"/>
    <![endif]-->

    <!-- inline styles related to this page -->

    <!-- ace settings handler -->

    <script src="../../../static/js/ace-extra.min.js"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

    <!--[if lt IE 9]>
    <script src="../../../static/js/html5shiv.js"></script>
    <script src="../../../static/js/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<div class="page-header">
    <h1>
        轮播图管理
        <small>
            <i class="icon-double-angle-right"></i>
            在这里可以修改、禁用、启用轮播图
        </small>
    </h1>
</div>
<#--<div class="main-container" id="main-container">-->
<#--<div class="main-container-inner">-->
<#--<div class="main-content">-->

<div class="page-content">
    <div class="row">
        <div class="col-xs-12">
            <!-- PAGE CONTENT BEGINS -->

            <div class="row-fluid">
                <ul class="ace-thumbnails">
                <#if banners?exists>
                    <#list banners as banner>
                        <li>
                            <a href="${banner.pic}" title="${banner.title}" data-rel="colorbox">
                                <img alt="150x150" src="${banner.pic}" width="150" height="150"/>
                                <div class="tags">
                                    <span class="label-holder">
                                        <span class="label label-info">${banner.title}</span>
                                    </span>
                                    <span class="label-holder">
                                        <span class="label label-danger">${banner.used?string("启用","禁用")}
                                        </span>
                                    </span>
                                    <#if banner.other?exists>
                                        <span class="label-holder">
                                            <span class="label label-success">${banner.other}</span>
                                        </span>
                                    </#if>

                                </div>
                            </a>

                            <div class="tools">
                                <a href="#">
                                    <i class="icon-link"></i>
                                </a>

                                <a href="#">
                                    <i class="icon-paper-clip"></i>
                                </a>

                                <a href="#">
                                    <i class="icon-pencil"></i>
                                </a>

                                <a href="#">
                                    <i class="icon-remove red"></i>
                                </a>
                            </div>
                        </li>
                    </#list>
                </#if>
                </ul>
            </div>
            <!-- PAGE CONTENT ENDS -->
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->
<#--</div>-->
<#--<!-- /.page-content &ndash;&gt;-->
<#--</div>-->
<#--<!-- /.main-content &ndash;&gt;-->

<#--</div>-->
    <!-- /.main-container-inner -->

    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="icon-double-angle-up icon-only bigger-110"></i>
    </a>
</div>
<!-- /.main-container -->

<!-- basic scripts -->

<!--[if !IE]> -->

<script src="../../../static/js/jquery-2.0.3.min.js"></script>

<!-- <![endif]-->

<!--[if IE]>
<script src="../../../static/js/jquery-1.10.2.min.js"></script>
<![endif]-->

<!--[if !IE]> -->

<script type="text/javascript">
    window.jQuery || document.write("<script src='../../../static/js/jquery-2.0.3.min.js'>" + "<" + "/script>");
</script>

<!-- <![endif]-->

<!--[if IE]>
<script type="text/javascript">
    window.jQuery || document.write("<script src='../../../static/js/jquery-1.10.2.min.js'>" + "<" + "/script>");
</script>
<![endif]-->

<script type="text/javascript">
    if ("ontouchend" in document) document.write("<script src='../../../static/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
</script>
<script src="../../../static/js/bootstrap.min.js"></script>
<script src="../../../static/js/typeahead-bs2.min.js"></script>

<!-- page specific plugin scripts -->

<script src="../../../static/js/jquery.colorbox-min.js"></script>

<!-- ace scripts -->

<script src="../../../static/js/ace-elements.min.js"></script>
<script src="../../../static/js/ace.min.js"></script>

<!-- inline scripts related to this page -->

<script type="text/javascript">
    jQuery(function ($) {
        var colorbox_params = {
            reposition: true,
            scalePhotos: true,
            scrolling: false,
            previous: '<i class="icon-arrow-left"></i>',
            next: '<i class="icon-arrow-right"></i>',
            close: '&times;',
            current: '{current} of {total}',
            maxWidth: '100%',
            maxHeight: '100%',
            onOpen: function () {
                document.body.style.overflow = 'hidden';
            },
            onClosed: function () {
                document.body.style.overflow = 'auto';
            },
            onComplete: function () {
                $.colorbox.resize();
            }
        };

        $('.ace-thumbnails [data-rel="colorbox"]').colorbox(colorbox_params);
        $("#cboxLoadingGraphic").append("<i class='icon-spinner orange'></i>"); //let's add a custom loading icon

        /**$(window).on('resize.colorbox', function() {
					try {
						//this function has been changed in recent versions of colorbox, so it won't work
						$.fn.colorbox.load();//to redraw the current frame
					} catch(e){}
				});*/
    })
</script>

</body>

</html>