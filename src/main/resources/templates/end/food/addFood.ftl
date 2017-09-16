<!DOCTYPE html>

<html>
<head>
    <title>添加菜品</title>
<#include "../../_inc/_header.ftl"/>

</head>
<body>

<div class="page-content">

    <div class="page-header">
        <h1>
            菜品管理
            <small>
                <i class="icon-double-angle-right"></i>
                添加菜品
            </small>
        </h1>
    </div>
    <!-- /.page-header -->

    <div class="row">
        <div class="col-xs-12">

            <form class="form-horizontal" role="form" action="#" method="post"
                  onsubmit="return checkFoodTypeInfo()">
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
                    <label class="col-sm-3 control-label no-padding-right" for="name"> 菜品名称： </label>

                    <div class="col-sm-9">
                        <input type="text" id="name" name="name" placeholder="菜品名称" class="col-xs-10 col-sm-5"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="cost"> 菜品单价(￥)： </label>

                    <div class="col-sm-9">
                        <input type="text" id="cost" name="cost" placeholder="菜品单价" class="col-xs-10 col-sm-5"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="costVip"> 菜品会员价(￥)： </label>

                    <div class="col-sm-9">
                        <input type="text" id="costVip" name="costVip" placeholder="菜品会员价" class="col-xs-10 col-sm-5"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="avatar"> 封面图片： </label>

                    <div class="col-sm-9">
                        <input type="text" id="avatar" name="avatar" placeholder="封面图片"
                               class="col-xs-10 col-sm-5 hidden"/>
                    </div>

                    <div class="col-xs-10 col-sm-8" id="food-avatar-img">
                        <input type="file" id="upfile" name="upfile">
                        <input type="button" id="upJQuery" value="上传封面">
                    </div>

                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="style"> 菜品口味： </label>

                    <div class="col-sm-9">
                        <input type="text" id="style" name="style" placeholder="菜品口味"
                               class="col-xs-10 col-sm-5"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="type"> 所属菜系： </label>
                    <div class="col-xs-3">
                        <select id="type" name="type" class="col-xs-10 col-sm-5">
                        <#if foodType?exists>
                            <#list foodType as type>
                                <option value="${type.name}">${type.name}</option>
                            </#list>

                        </#if>
                        </select>
                    </div>

                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="content"> 菜品详情： </label>
                    <div class="col-sm-9">
                        <div id="content" name="content" class="wysiwyg-editor"></div>
                    </div>
                </div>

                <div class="clearfix form-actions">
                    <div class="col-md-offset-3 col-md-9">
                        <button class="btn btn-info" type="button" onclick="postFoodInfo()">
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

        <#if food?exists>
            <script type="application/javascript">
                document.getElementById("name").value = '${food.name!}';
                document.getElementById("cost").value = '${food.cost!}';
                document.getElementById("costVip").value = '${food.costVip!}';
                document.getElementById("avatar").value = '${food.avatar!}';
                document.getElementById("style").value = '${food.style!}';
                document.getElementById("type").value = '${food.type!}';
                document.getElementById("content").value = '${food.content!}';
            </script>
        </#if>

        </div>
        <!-- /span -->
    </div>
    <!-- /row -->

</div><!-- /.page-content -->

</body>

<#include "../../_inc/_footer.ftl"/>

<script src="${base}/static/js/wangEditor.min.js"></script>

<script type="text/javascript">

    var E = window.wangEditor;
    var editor = new E('#content');
    editor.customConfig.uploadImgServer = '/endSys/uploadFile';
    editor.customConfig.uploadFileName = 'upfile';
    editor.create();

    function checkFoodTypeInfo() {
        if ("" == $("#name").val()) {
            $("#name").tips({
                side: 2,
                msg: '菜系名称不得为空',
                bg: '#AE81FF',
                time: 3
            });
            $("#name").focus();
            return false;
        }


        return true;
    }


    function postFoodInfo() {
        if (!checkFoodTypeInfo()) return;
        var name = $('#name').val();
        var costVip = $('#costVip').val();
        var cost = $('#cost').val();
        var avatar = $('#avatar').val();
        var style = $('#style').val();
        var type = $('#type').val();
        var content = editor.txt.html();

        $.ajax({
            type: 'POST',
            url: '${base}/endSys/addFoods',
            cache: false,
            data: {
                name: name,
                avatar: avatar,
                style: style,
                type: type,
                content: content,
                cost: cost,
                costVip: costVip
            },
            dataType: 'json',
            success: function (data) {  //请求成功，http状态码为200。返回的数据已经打包在data中了。
                alert(data.msg);    //弹出对话框，提示返回的错误信息
                if (data.code === 1) {

                }
            }
        });

    }

</script>


<script type="text/javascript">
    $('#upJQuery').on('click', function () {
        var fd = new FormData();
        fd.append("upload", 1);
        fd.append("upfile", $("#upfile").get(0).files[0]);
        $.ajax({
            url: "../endSys/uploadFile",
            type: "POST",
            processData: false,
            contentType: false,
            data: fd,
            dataType: 'json',
            success: function (d) {
                console.log(d.url);
                document.getElementById("avatar").value = d.url;
            }
        });
    });
</script>

</html>