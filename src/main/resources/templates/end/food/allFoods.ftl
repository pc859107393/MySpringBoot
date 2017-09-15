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
            菜品管理
            <small>
                <i class="icon-double-angle-right"></i>
                所有菜品
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
                            菜品封面
                        </th>
                        <th>菜品名称</th>
                        <th>菜品口味</th>
                        <th>所属菜系</th>
                        <th>原价&nbsp;/&nbsp;会员价(￥)</th>
                        <th>&nbsp; &nbsp; &nbsp;</th>

                    </tr>
                    </thead>

                    <tbody>

                    <#if foods?exists>
                        <#list foods.data as food>
                        <tr>
                            <td class="center">${food.avatar!}</td>
                            <td>${food.name!}</td>
                            <td>${food.style!}</td>
                            <td>${food.type!}</td>
                            <td>${food.cost!}&nbsp;/&nbsp;${food.costVip!}</td>

                            <td class="center">
                                <div>
                                    <button class="btn btn-warning btn-xs"
                                            onclick="openMyFoodChange('../endSys/changeFoods/${food.id!}');">
                                        <i class="icon-wrench  bigger-110 icon-only"></i>
                                        修改
                                    </button>
                                    &nbsp;
                                    <button class="btn btn-error btn-xs" onclick="delUser('${food.id!}');">
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
    var pageSize = ${foods.pageSize!};
    var pageNum = ${foods.pageNum!};
    var totalNum = ${foods.totalNum!};
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
            window.location = '${base}/endSys/allFoods?pageNum=' + (parseInt(pageNum) - 1) + '&pageSize=' + pageSize;
    }

    function goToNext() {
        if (parseInt(pageNum) < parseInt(totalNum))
            window.location = '${base}/endSys/allFoods?pageNum=' + (parseInt(pageNum) + 1) + '&pageSize=' + pageSize;
    }


</script>

</html>