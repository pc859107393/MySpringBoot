<!DOCTYPE html>

<html>
<head>
    <title>所有房源</title>
<#include "../../_inc/_header.ftl"/>
</head>
<body>

<div class="page-content">

    <div class="page-header">
        <h1>
            房源管理
            <small>
                <i class="icon-double-angle-right"></i>
                所有房源
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
                            房源名称
                        </th>
                        <th>房源户型</th>
                        <th>宜居人数</th>
                        <th>地址&nbsp;/&nbsp;定位</th>
                        <th>创建时间</th>
                        <th>操&nbsp;&nbsp;作</th>

                    </tr>
                    </thead>

                    <tbody>

                    <#if all?exists>
                        <#list all as house>
                        <tr>
                            <td class="center">
                                <img class="" src="${house.name!}" height="55" width="55">
                            </td>
                            <td>${house.houseType!}</td>
                            <td>${house.liveNum!}</td>
                            <td>${house.address!}&nbsp;/&nbsp;</td>
                            <td>${house.date!}</td>

                            <td class="center">
                                <div>
                                    <button class="btn btn-warning btn-xs"
                                            onclick="openMyFoodChange('../endSys/changeFoods/${house.id!}');">
                                        <i class="icon-wrench  bigger-110 icon-only"></i>
                                        修改
                                    </button>
                                    &nbsp;
                                    <button class="btn btn-error btn-xs" onclick="delUser('${house.id!}');">
                                        <i class="icon-trash  bigger-110 icon-only"></i>
                                        删除
                                    </button>
                                </div>
                            </td>
                        </tr>
                        </#list>
                    <div class="modal-footer no-margin-top">

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

</div><!-- /.page-content -->

</body>

<#include "../../_inc/_footer.ftl"/>
<script src="${base}/static/js/md5.js"></script>
<script type="text/javascript">

    function delUser(id) {
        $.ajax({
            type: 'GET',
            url: '${base}/endSys/delFoods/' + id,
            cache: false,
            dataType: 'json',
            success: function (data) {  //请求成功，http状态码为200。返回的数据已经打包在data中了。
                alert(data.msg);    //弹出对话框，提示返回的错误信息
                window.location = '${base}/endSys/allFoods';
            }
        });
    }

    function beforeUpdateFoodType() {
        if ("" == $("#name").val()) {
            $("#name").tips({
                side: 2,
                msg: '菜品名称不得为空',
                bg: '#AE81FF',
                time: 3
            });
            $("#name").focus();
            return false;
        }

        return true;
    }

    function openMyFoodChange(id) {
        window.open(id);
    }

</script>

<script type="text/javascript">
    var pageSize = 20;
    var pageNum = ${pageNum!};
    var totalNum = ${pageTotal!};
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
            window.location = '${base}/endSys/houseCon/all?pageNum=' + (parseInt(pageNum) - 1) + '&pageSize=' + pageSize;
    }

    function goToNext() {
        if (parseInt(pageNum) < parseInt(totalNum))
            window.location = '${base}/endSys/houseCon/all?pageNum=' + (parseInt(pageNum) + 1) + '&pageSize=' + pageSize;
    }


</script>

</html>