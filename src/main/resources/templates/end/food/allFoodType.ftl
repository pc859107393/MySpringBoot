<!DOCTYPE html>

<html>
<head>
    <title>所有菜系</title>
<#include "../../_inc/_header.ftl"/>
<#setting datetime_format="yyyy-MM-dd HH:mm:ss"/>
</head>
<body>

<div class="page-content">

    <div class="page-header">
        <h1>
            菜系管理
            <small>
                <i class="icon-double-angle-right"></i>
                所有菜系
            </small>
        </h1>
    </div>
    <!-- /.page-header -->

    <div class="row">
        <div class="col-xs-12">
        <#if msg?exists>
            <div class="alert alert-block alert-success">

                <i class="icon-ok green"></i>
                <strong class="green">
                ${msg}
                </strong>
            </div>

        </#if>

            <div class="table-responsive">
                <table id="sample-table-goods" class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr>
                        <th class="center">
                            菜系名称
                        </th>
                        <th>菜系描述</th>
                        <th>菜系备注</th>
                        <th>操作</th>

                    </tr>
                    </thead>

                    <tbody>

                    <#if foodTypes?exists>
                        <#list foodTypes.data as foodType>
                        <tr>
                            <td class="center">${foodType.name!}</td>
                            <td>${foodType.description!}</td>
                            <td>${foodType.other!}</td>

                            <td>
                                <div>
                                    <button class="btn btn-warning btn-xs" onclick="getUserInfo('${foodType.id!}');">
                                        <i class="icon-wrench  bigger-110 icon-only"></i>
                                        修改
                                    </button>

                                    <button class="btn btn-error btn-xs" onclick="delUser('${foodType.id!}');">
                                        <i class="icon-trash  bigger-110 icon-only"></i>
                                        删除
                                    </button>
                                </div>
                            </td>
                        </tr>
                        </#list>
                    <div class="modal-footer no-margin-top">

                        <ul class="pagination pull-right no-margin">
                            <li class="prev disabled">
                                <a href="#">
                                    <i class="icon-double-angle-left"></i>
                                </a>
                            </li>

                            <li class="active">
                                <a href="#">1</a>
                            </li>

                            <li class="next">
                                <a href="#">
                                    <i class="icon-double-angle-right"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                    </#if>

                    </tbody>
                </table>
            </div>
            <!-- /.table-responsive -->
        </div>
        <!-- /span -->
    </div>

    <div class="row">
        <div class="col-xs-12">
            <div class="row">
                <div class="col-sm-6">
                    <div id="dialog-confirm" class="hide">
                        <div class="row">
                            <div class="col-xs-12">

                                <form class="form-horizontal" role="form" action="/endSys/updateFoodType" method="post"
                                      onsubmit="return beforeUpdateFoodType()">

                                    <input type="hidden" id="id" name="id" placeholder="id">

                                    <div class="form-group">
                                        <label class="col-sm-4 control-label no-padding-right" for="name">
                                            菜系名称： </label>

                                        <div class="col-sm-8">
                                            <input type="text" id="name" name="name" placeholder="菜系名称"
                                                   class="col-xs-10 col-sm-8"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-4 control-label no-padding-right" for="description">
                                            菜系描述： </label>

                                        <div class="col-sm-8">
                                            <input type="text" id="description" name="description" placeholder="菜系描述"
                                                   class="col-xs-10 col-sm-8"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-4 control-label no-padding-right" for="other">
                                            菜系备注： </label>

                                        <div class="col-sm-8">
                                            <input type="text" id="other" name="other" placeholder="菜系备注"
                                                   class="col-xs-10 col-sm-8"/>
                                        </div>
                                    </div>

                                    <div class="clearfix form-actions">
                                        <button class="btn btn-info" type="submit">
                                            <i class="icon-ok bigger-110"></i>
                                            修改
                                        </button>

                                        &nbsp;
                                        <button class="btn" type="reset">
                                            <i class="icon-undo bigger-110"></i>
                                            清除
                                        </button>
                                    </div>

                                </form>


                            </div>
                            <!-- /span -->
                        </div>
                    </div><!-- #dialog-confirm -->
                </div>
            </div>
        </div>
    </div>
    <!-- /row -->

</div><!-- /.page-content -->

</body>

<#include "../../_inc/_footer.ftl"/>
<script src="${base}/static/js/md5.js"></script>
<script type="text/javascript">

    function getUserInfo(id) {
        $.ajax({
            type: 'GET',
            url: '${base}/endSys/getOneFoodType/' + id,
            cache: false,
            dataType: 'json',
            success: function (data) {  //请求成功，http状态码为200。返回的数据已经打包在data中了。
                if (data.code === 1) {
                    document.getElementById("id").value = data.data.id;
                    document.getElementById("name").value = data.data.name;
                    document.getElementById("description").value = data.data.description;
                    document.getElementById("other").value = data.data.other;
                    $("#dialog-confirm").removeClass('hide').dialog({
                        resizable: true,
                        modal: true,
                        title: "    修改菜系！",
                        title_html: true
                    });
                } else {
                    alert(data.msg);    //弹出对话框，提示返回的错误信息
                }
            }
        });
    }

    function delUser(id) {
        $.ajax({
            type: 'GET',
            url: '${base}/endSys/delFoodType/' + id,
            cache: false,
            dataType: 'json',
            success: function (data) {  //请求成功，http状态码为200。返回的数据已经打包在data中了。
                alert(data.msg);    //弹出对话框，提示返回的错误信息
                window.location = '${base}/endSys/allFoodType';
            }
        });
    }

    function beforeUpdateFoodType() {
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