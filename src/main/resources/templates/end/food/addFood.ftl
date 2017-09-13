<!DOCTYPE html>

<html>
<head>
    <title>添加菜系</title>
<#include "../../_inc/_header.ftl"/>

</head>
<body>

<div class="page-content">

    <div class="page-header">
        <h1>
            菜系管理
            <small>
                <i class="icon-double-angle-right"></i>
                添加菜系
            </small>
        </h1>
    </div>
    <!-- /.page-header -->

    <div class="row">
        <div class="col-xs-12">

            <form class="form-horizontal" role="form" action="${base}/endSys/addFoodType" method="post"
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
                    <label class="col-sm-3 control-label no-padding-right" for="name"> 菜系名称： </label>

                    <div class="col-sm-9">
                        <input type="text" id="name" name="name" placeholder="菜系名称" class="col-xs-10 col-sm-5"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="description"> 菜系描述： </label>

                    <div class="col-sm-9">
                        <input type="text" id="description" name="description" placeholder="菜系描述"
                               class="col-xs-10 col-sm-5"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="other"> 菜系备注： </label>

                    <div class="col-sm-9">
                        <input type="text" id="other" name="other" placeholder="菜系备注"
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
                document.getElementById("name").value = '${foodType.name!}';
                document.getElementById("description").value = '${foodType.description!}';
                document.getElementById("other").value = '${foodType.other!}';
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