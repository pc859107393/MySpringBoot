<!DOCTYPE html>

<html>
<head>
    <title>添加房源</title>
<#include "../../_inc/_header.ftl"/>

</head>
<body>

<div class="page-content">

    <div class="page-header">
        <h1>
            房源管理
            <small>
                <i class="icon-double-angle-right"></i>
                添加房源
            </small>
        </h1>
    </div>
    <!-- /.page-header -->

    <div class="row">
        <div class="col-xs-12">

            <form class="form-horizontal" role="form" action="${base}/endSys/houseCon/add" method="post"
                  onsubmit="return checkAddHouseInfo()">
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
                    <label class="col-sm-1 control-label no-padding-right" for="name"> 房源名称 </label>

                    <div class="col-sm-11">
                        <input type="text" id="name" name="name" placeholder="房源名称" class="col-xs-10 col-sm-5"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-1 control-label no-padding-right" for="houseType"> 房屋户型 </label>

                    <div class="col-sm-11">
                        <input type="text" id="houseType" name="houseType" placeholder="房屋户型"
                               class="col-xs-10 col-sm-5"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-1 control-label no-padding-right" for="password"> 登录密码 </label>

                    <div class="col-sm-11">
                        <input type="password" id="password" name="password" placeholder="登录密码"
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

        <#if goods?exists>
            <script type="application/javascript">
                document.getElementById("id").value = '${goods.id!}';
                document.getElementById("name").value = '${goods.name!}';
                document.getElementById("code").value = '${goods.code!}';
                document.getElementById("position").value = '${goods.position!}';
                document.getElementById("cost").value = '${goods.cost!}';
                document.getElementById("sum").value = '${goods.sum!}';
                document.getElementById("type").value = '${goods.type!}';

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
    function checkAddHouseInfo() {
        if ("" == $("#name").val()) {
            $("#name").tips({
                side: 2,
                msg: '昵称不得为空',
                bg: '#AE81FF',
                time: 3
            });
            $("#name").focus();
            return false;
        }

        if ($("#loginName").val() == "") {
            $("#loginName").tips({
                side: 2,
                msg: '登录名称不得为空',
                bg: '#AE81FF',
                time: 3
            });
            $("#loginName").focus();
            return false;
        }

        if ($("#password").val() == "") {
            $("#password").tips({
                side: 2,
                msg: '登录密码不得为空',
                bg: '#AE81FF',
                time: 3
            });
            $("#password").focus();
            return false;
        }

        return true;
    }

</script>


</html>