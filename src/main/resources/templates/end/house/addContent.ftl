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
                ②、添加房源描述信息
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

                    <div class="col-xs-11 col-sm-4">
                        <select id="houseType" name="houseType"
                                class="form-control">
                            <option value="一室一厅">一室一厅</option>
                            <option value="二室一厅">二室一厅</option>
                            <option value="三室二厅">三室二厅</option>
                            <option value="三室以上">三室以上</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-1 control-label no-padding-right" for="rentType"> 租售类型 </label>

                    <div class="col-xs-11 col-sm-4">
                        <select id="rentType" name="rentType"
                                class="form-control">
                            <option value="1">短租</option>
                            <option value="2">长租</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-1 control-label no-padding-right" for="used"> 是否可用 </label>

                    <div class="col-xs-11 col-sm-4">
                        <select id="used" name="used"
                                class="form-control">
                            <option value="false">不可用</option>
                            <option value="true">可用</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-1 control-label no-padding-right" for="liveNum"> 宜居人数 </label>

                    <div class="col-sm-11">
                        <input type="number" id="liveNum" name="liveNum" placeholder="宜居人数" class="col-xs-10 col-sm-5"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-1 control-label no-padding-right" for="address"> 房屋地址 </label>

                    <div class="col-sm-11">
                        <input type="text" id="address" name="address" placeholder="房屋地址（越详细越好）"
                               class="col-xs-10 col-sm-5"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-1 control-label no-padding-right" for="householdId"> 户主ID </label>

                    <div class="col-sm-11">
                        <input type="text" id="householdId" name="householdId" placeholder="户主ID"
                               class="col-xs-10 col-sm-5"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-1 control-label no-padding-right" for="longitude"> 经度 </label>

                    <div class="col-sm-11">
                        <input type="text" id="longitude" name="longitude" placeholder="经度" class="col-xs-10 col-sm-5"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-1 control-label no-padding-right" for="latitude"> 纬度 </label>

                    <div class="col-sm-11">

                        <input type="text" id="latitude" name="latitude" placeholder="纬度" class="col-xs-10 col-sm-5"/>
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
                msg: '房源名称不得为空',
                bg: '#AE81FF',
                time: 3
            });
            $("#name").focus();
            return false;
        }

        if ($("#houseType").val() == "") {
            $("#houseType").tips({
                side: 2,
                msg: '房屋户型不得为空',
                bg: '#AE81FF',
                time: 3
            });
            $("#houseType").focus();
            return false;
        }

        if ($("#address").val() == "") {
            $("#address").tips({
                side: 2,
                msg: '房屋详细地址不得为空',
                bg: '#AE81FF',
                time: 3
            });
            $("#address").focus();
            return false;
        }

        if ($("#householdId").val() == "") {
            $("#householdId").tips({
                side: 2,
                msg: '房屋所有人ID不得为空',
                bg: '#AE81FF',
                time: 3
            });
            $("#householdId").focus();
            return false;
        }

        return true;
    }

</script>


</html>