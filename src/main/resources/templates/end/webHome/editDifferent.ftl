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
                        <form class="form-horizontal" role="form" action="${base}/endSys/guard/save" method="post"
                              onsubmit="return beforeSubmitGuard()">
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
                                <label class="col-sm-1 control-label no-padding-right" for="title"> 标题 </label>

                                <div class="col-sm-11">
                                    <input type="text" id="title" name="title" placeholder="标题"
                                           class="col-xs-10 col-sm-5"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label no-padding-right" for="editor"> 内容 </label>

                                <div class="col-sm-11">
                                    <div id="editor">
                                        <p>请在此处 <b>编辑内容</b></p>
                                    </div>
                                    <input type="hidden" id="content" name="content" placeholder="内容"
                                           class="col-xs-10 col-sm-5"/>
                                </div>
                            </div>

                        <#--<div class="form-group">-->
                        <#--<label class="col-sm-1 control-label no-padding-right" for="cover1"> 图片1 </label>-->

                        <#--<div class="col-sm-11">-->
                        <#--<input type="file" id="cover1" name="cover1" placeholder="图片地址"-->
                        <#--class="col-xs-10 col-sm-5"/>-->
                        <#--</div>-->
                        <#--</div>-->

                        <#--<div class="form-group">-->
                        <#--<label class="col-sm-1 control-label no-padding-right" for="other"> 描述1 </label>-->

                        <#--<div class="col-sm-11">-->
                        <#--<input type="text" id="other" name="other" placeholder="描述1"-->
                        <#--class="col-xs-10 col-sm-5"/>-->
                        <#--</div>-->
                        <#--</div>-->

                        <#--<div class="form-group">-->
                        <#--<label class="col-sm-1 control-label no-padding-right" for="used"> 是否可用 </label>-->

                        <#--<div class="col-sm-11">-->
                        <#--<select id="used" name="used"-->
                        <#--class="col-xs-10 col-sm-5">-->
                        <#--<option value="true"> true</option>-->
                        <#--<option value="false"> false</option>-->
                        <#--</select>-->
                        <#--</div>-->
                        <#--</div>-->

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

                    </div>
                </div>
            </div>
        </div>
        <!-- /span -->
    </div>
    <!-- /row -->

</body>

<#include "../../_inc/_footer.ftl"/>
<script type="text/javascript" src="../../../static/js/wangEditor.min.js"></script>
<script type="text/javascript">
    var E = window.wangEditor;
    var editor = new E('#editor');
    // 或者 var editor = new E( document.getElementById('editor') )
    // 配置服务器端地址
    editor.customConfig.uploadImgServer = '${base}/endSys/api/file/save';
    // 限制一次最多上传 5 张图片
    editor.customConfig.uploadImgMaxLength = 5;
    editor.customConfig.uploadFileName = 'upfile';
    editor.create();

        <#if different?exists>
        <#--document.getElementById("id").value = '${different.id!}';-->
                document.getElementById("title").value = '${different.title!}';
                document.getElementById("content").value = '${different.content!}';
        </#if>

    function beforeSubmitGuard() {
        document.getElementById("content").value = editor.txt.html();
        return true;
    }
</script>

</html>