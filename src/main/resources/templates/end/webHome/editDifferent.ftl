<!DOCTYPE html>

<html>
<head>
    <title>我们的保障管理</title>
<#include "../../_inc/_header.ftl"/>

</head>
<body>

<div class="page-content">

    <div class="page-header">
        <li class="next">
            <h1><i class="icon-double-angle-right">我们的保障管理</i></h1>
        </li>

    </div>
    <!-- /.page-header -->

    <div class="row">
        <div class="col-xs-7">

            <div class="widget-box">
                <div class="widget-header">
                    <h4 class="widget-title">编辑我们的保障</h4>

                    <div class="widget-toolbar">
                        <a href="#" data-action="collapse">
                            <i class="icon-chevron-up"></i>
                        </a>
                    </div>
                </div>

                <div class="widget-body" style="display: block;">
                    <div class="widget-main">
                        <form class="form-horizontal" role="form" action="${base}/endSys/guard/save" method="post">
            <#if msg?exists>
                <div class="alert alert-block alert-success">

                    <i class="icon-ok green"></i>
                    <strong class="green">
                        ${msg}
                    </strong>
                </div>

            </#if>

                            <input type="hidden" id="id" name="id" placeholder="id">

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right" for="title"> 轮播图标题 </label>

                                <div class="col-sm-9">
                                    <input type="text" id="title" name="title" placeholder="轮播图标题"
                                           class="col-xs-10 col-sm-5"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right" for="url"> 访问地址 </label>

                                <div class="col-sm-9">
                                    <input type="text" id="url" name="url" placeholder="访问地址"
                                           class="col-xs-10 col-sm-5"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right" for="pic"> 图片地址 </label>

                                <div class="col-sm-9">
                                    <input type="text" id="pic" name="pic" placeholder="图片地址"
                                           class="col-xs-10 col-sm-5"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right" for="other"> 备注 </label>

                                <div class="col-sm-9">
                                    <input type="text" id="other" name="other" placeholder="备注"
                                           class="col-xs-10 col-sm-5"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right" for="used"> 是否可用 </label>

                                <div class="col-sm-9">
                                    <select id="used" name="used"
                                            class="col-xs-10 col-sm-5">
                                        <option value="true"> true</option>
                                        <option value="false"> false</option>
                                    </select>
                                </div>
                            </div>

                            <div class="clearfix form-actions">
                                <div class="col-md-offset-3 col-md-9">
                                    <button class="btn btn-info" type="submit">
                                        <i class="icon-ok bigger-110"></i>
                                        提交
                                    </button>

                                    &nbsp; &nbsp; &nbsp;
                                    <button class="btn" type="reset">
                                        <i class="icon-undo bigger-110"></i>
                                        清除
                                    </button>
                                </div>
                            </div>

                        </form>

        <#if banner?exists>
            <script type="application/javascript">
                document.getElementById("id").value = '${banner.id!}';
                document.getElementById("title").value = '${banner.title!}';
                document.getElementById("url").value = '${banner.url!}';
                document.getElementById("pic").value = '${banner.pic!}';
                document.getElementById("other").value = '${banner.other!}';
                document.getElementById("used").value = '${banner.used!}';

            </script>
        </#if>
                    </div>
                </div>
            </div>
        </div>
        <!-- /span -->
    </div>
    <!-- /row -->

    <div class="row">
        <div class="col-sm-7">

            <div class="page-header">
            </div>
            <div class="widget-box">
                <div class="widget-header">
                    <h4 class="widget-title">轮播图预览</h4>

                    <div class="widget-toolbar">
                        <a href="#" data-action="collapse">
                            <i class="icon-chevron-up"></i>
                        </a>
                        <a href="#" data-action="reload">
                            <i class="icon-refresh"></i>
                        </a>
                    </div>
                </div>

                <div class="widget-body" style="display: block;">
                    <div class="widget-main">

                    </div>
                </div>
            </div>
        </div>
    </div>

</body>

<#include "../../_inc/_footer.ftl"/>


</html>