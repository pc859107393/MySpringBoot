<!DOCTYPE html>

<html>
<head>
    <title>所有餐桌</title>
<#include "../../_inc/_header.ftl"/>
<#setting datetime_format="yyyy-MM-dd HH:mm:ss"/>
</head>
<body>

<div class="page-content">

    <div class="page-header">
        <h1>
            餐桌
            <small>
                <i class="icon-double-angle-right"></i>
                所有餐桌
            </small>
        </h1>
    </div>
    <!-- /.page-header -->

    <div class="row">
        <div class="col-xs-12 col-sm-6">
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
                        <th>序号</th>
                        <th class="center">
                            餐桌名称
                        </th>
                        <th>餐桌状态</th>
                        <th class="col-xs-12 col-sm-6">操作</th>

                    </tr>
                    </thead>

                    <tbody>

                    <#if desks?exists>
                        <#list desks.data as desk>
                        <tr>
                            <td>${desk.id!}</td>
                            <td class="center col-xs-12 col-sm-5">${desk.name!}</td>
                            <td class="col-xs-12 col-sm-3">
                                <#switch desk.status>
                                    <#case 0>已下架<#break >
                                    <#case 1>未使用<#break >
                                    <#case 2>使用中<#break >
                                    <#default>状态异常<#break >
                                </#switch>
                            </td>

                            <td class="col-xs-12 col-sm-4">
                                <div>
                                    <button class="btn btn-warning btn-xs" onclick="getUserInfo('${desk.id!}');">
                                        <i class="icon-wrench  bigger-110 icon-only"></i>
                                        修改
                                    </button>

                                    <button class="btn btn-error btn-xs" onclick="delUser('${desk.id!}');">
                                        <i class="icon-trash  bigger-110 icon-only"></i>
                                        删除
                                    </button>
                                </div>
                            </td>
                        </tr>
                        </#list>
                    <div class="modal-footer no-margin-top">

                        <div class="pagination pull-left no-margin">
                            <button class="btn btn-info btn-xs" onclick="addDeskCon();">
                                <i class="icon-arrow-up"></i>
                                添加餐桌
                            </button>
                        </div>

                        <ul class="pagination pull-right no-margin" id="location-menu">

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
                                <form class="form-horizontal" role="form" method="post">

                                    <input type="hidden" id="id" name="id" placeholder="id">

                                    <div class="form-group">
                                        <label class="col-sm-4 control-label no-padding-right" for="name">
                                            餐桌名称： </label>

                                        <div class="col-sm-8">
                                            <input type="text" id="name" name="name" placeholder="餐桌名称"
                                                   class="col-xs-10 col-sm-8"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-4 control-label no-padding-right" for="status">
                                            餐桌状态： </label>

                                        <div class="col-sm-8">
                                            <select name="status" id="status">
                                                <option value="0">已下架</option>
                                                <option value="1">未使用</option>
                                                <option value="2">使用中</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="clearfix form-actions">
                                        <button class="btn btn-info hidden" type="button" id="desk-con-bt-update"
                                                onclick="postChangeDesk()">
                                            <i class="icon-ok bigger-110"></i>
                                            修改
                                        </button>

                                        <button class="btn btn-info hidden" type="button" id="desk-con-bt-add"
                                                onclick="addDesk()">
                                            <i class="icon-ok bigger-110"></i>
                                            添加
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


    function postChangeDesk() {
        if (!beforeUpdateFoodType()) return;
        var name = $('#name').val();
        var id = $('#id').val();
        var status = $('#status').val();

        $.ajax({
            type: 'POST',
            url: '${base}/endSys/updateDesk',
            cache: false,
            data: {
                name: name,
                id: id,
                status: status
            },
            dataType: 'json',
            success: function (data) {  //请求成功，http状态码为200。返回的数据已经打包在data中了。
                alert(data.msg);    //弹出对话框，提示返回的错误信息
                if (data.code === 1) {
                    window.location.reload();
                }
            }
        });
    }

    function getUserInfo(id) {
        $("#desk-con-bt-update").removeClass('hidden');
        $.ajax({
            type: 'GET',
            url: '${base}/endSys/getOneDesk/' + id,
            cache: false,
            dataType: 'json',
            success: function (data) {  //请求成功，http状态码为200。返回的数据已经打包在data中了。
                if (data.code === 1) {
                    document.getElementById("id").value = data.data.id;
                    document.getElementById("name").value = data.data.name;
                    document.getElementById("status").value = data.data.status;
                    $("#dialog-confirm").removeClass('hide').dialog({
                        resizable: true,
                        modal: true,
                        title: "    修改餐桌！",
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
            url: '${base}/endSys/delDesk/' + id,
            cache: false,
            dataType: 'json',
            success: function (data) {  //请求成功，http状态码为200。返回的数据已经打包在data中了。
                alert(data.msg);    //弹出对话框，提示返回的错误信息
                window.location = '${base}/endSys/allDesk';
            }
        });
    }

    function beforeUpdateFoodType() {
        if ("" == $("#name").val()) {
            $("#name").tips({
                side: 2,
                msg: '餐桌名称不得为空',
                bg: '#AE81FF',
                time: 3
            });
            $("#name").focus();
            return false;
        }

        return true;
    }

    function addDesk() {
        if (!beforeUpdateFoodType()) return;
        var name = $('#name').val();
        var id = $('#id').val();
        var status = $('#status').val();

        $.ajax({
            type: 'POST',
            url: '${base}/endSys/addDesk',
            cache: false,
            data: {
                name: name,
                id: id,
                status: status
            },
            dataType: 'json',
            success: function (data) {  //请求成功，http状态码为200。返回的数据已经打包在data中了。
                alert(data.msg);    //弹出对话框，提示返回的错误信息
                if (data.code === 1) {
                    window.location.reload();
                }
            }
        });
    }

    function addDeskCon() {
        $("#desk-con-bt-add").removeClass('hidden');
        $("#dialog-confirm").removeClass('hide').dialog({
            resizable: true,
            modal: true,
            title: "    添加餐桌！",
            title_html: true
        });
    }
</script>
<script type="text/javascript">
    var pageSize = ${desks.pageSize!};
    var pageNum = ${desks.pageNum!};
    var totalNum = ${desks.totalNum!};
    var result = "<li class=\"prev\" id=\"prev-li\"><a onclick='goToPrev()'><i class=\"icon-double-angle-left\"></i></a></li>";
    result += "<li class=\"active\"><a href=\"#\">" + pageNum + "</a></li>";
    result += "<li class=\"next\"  id=\"next-li\"><a onclick='goToNext()'><i class=\"icon-double-angle-right\"></i></a></li>";
    document.getElementById("location-menu").innerHTML = result;
    if (pageNum === 1) {
        $("#prev-li").addClass("disabled");
    }
    if (pageNum === totalNum) {
        $("#next-li").addClass("disabled");
    }

    function goToPrev() {
        if (parseInt(pageNum) > 1)
            window.location = '${base}/endSys/allDesk?pageNum=' + (parseInt(pageNum) - 1) + '&pageSize=' + pageSize;
    }

    function goToNext() {
        if (parseInt(pageNum) < parseInt(totalNum))
            window.location = '${base}/endSys/allDesk?pageNum=' + (parseInt(pageNum) + 1) + '&pageSize=' + pageSize;
    }


</script>
</html>