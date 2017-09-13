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

            <form class="form-horizontal" role="form" action="${base}/endSys/addFoods" method="post"
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
                    <label class="col-sm-3 control-label no-padding-right" for="avatar"> 封面图片： </label>

                    <div class="col-sm-9">
                        <input type="text" id="avatar" name="avatar" placeholder="封面图片"
                               class="col-xs-10 col-sm-5"/>
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
                        <input type="text" id="content" name="content" placeholder="菜品详情"
                               class="col-xs-10 col-sm-5"/>
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

        <#if foodType?exists>
            <script type="application/javascript">
                document.getElementById("name").value = '${food.name!}';
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

<script type="text/javascript">
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
</script>

</html>