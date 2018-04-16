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
                  onsubmit="return beforeSubmitGuard()">
            <#if msg?exists>
                <div class="alert alert-block alert-success">

                    <i class="icon-ok green"></i>
                    <strong class="green">
                        ${msg}
                    </strong>
                </div>

            </#if>
            <#if id?exists>
                <input type="hidden" id="houseId" name="houseId" placeholder="houseId" value="${id}">
            <#else >
            <#--<script type="text/javascript">-->
            <#--window.location.href = "${base}/endSys/houseCon/add";-->
            <#--</script>-->
            </#if>

                <div class="form-group">
                    <label class="col-sm-1 control-label no-padding-right" for="name"> 详细描述 </label>

                    <div class="col-sm-11">
                        <div id="editor">
                            <p>请在此处 <b>编辑内容</b></p>
                        </div>
                        <input type="hidden" id="content" name="content" placeholder="内容"
                               class="col-xs-10 col-sm-5"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-1 control-label no-padding-right" for="houseType"> 交易规则 </label>

                    <div class="col-xs-11 col-sm-4">
                        <select id="houseType" name="houseType"
                                class="form-control">
                            <option value="灵活">灵活：</option>
                            <option value="中等">中等</option>
                            <option value="严格">严格</option>
                            <option value="不可退">不可退</option>
                        </select>
                    </div>
                </div>
                <h3 class="header smaller lighter blue">
                    房屋设施选择
                    <small>常见配套设施</small>
                </h3>
                <div class="form-group">
                    <div class="col-xs-2">
                        <label>
                            宽带上网
                            <input name="network" class="ace ace-switch ace-switch-6" type="checkbox"/>
                            <span class="lbl"></span>
                        </label>
                    </div>
                    <div class="col-xs-2">
                        <label>
                            无线WIFI
                            <input name="wifi" class="ace ace-switch ace-switch-6" type="checkbox"/>
                            <span class="lbl"></span>
                        </label>
                    </div>
                    <div class="col-xs-2">
                        <label>
                            电视
                            <input name="tv" class="ace ace-switch ace-switch-6" type="checkbox"/>
                            <span class="lbl"></span>
                        </label>
                    </div>
                    <div class="col-xs-2">
                        <label>
                            浴室
                            <input name="bathroom" class="ace ace-switch ace-switch-6" type="checkbox"/>
                            <span class="lbl"></span>
                        </label>
                    </div>
                    <div class="col-xs-2">
                        <label>
                            空调
                            <input name="air" class="ace ace-switch ace-switch-6" type="checkbox"/>
                            <span class="lbl"></span>
                        </label>
                    </div>
                    <div class="col-xs-2">
                        <label>
                            暖气
                            <input name="warmAir" class="ace ace-switch ace-switch-6" type="checkbox"/>
                            <span class="lbl"></span>
                        </label>
                    </div>
                    <div class="col-xs-2">
                        <label>
                            洗衣机
                            <input name="washer" class="ace ace-switch ace-switch-6" type="checkbox"/>
                            <span class="lbl"></span>
                        </label>
                    </div>
                    <div class="col-xs-2">
                        <label>
                            电冰箱
                            <input name="refrigerator" class="ace ace-switch ace-switch-6" type="checkbox"/>
                            <span class="lbl"></span>
                        </label>
                    </div>
                    <div class="col-xs-2">
                        <label>
                            被子
                            <input name="quilt" class="ace ace-switch ace-switch-6" type="checkbox"/>
                            <span class="lbl"></span>
                        </label>
                    </div>
                </div>

                <h3 class="header smaller lighter blue">
                    房屋设施选择
                    <small>其他便利设施</small>
                </h3>
                <div class="form-group">
                    <div class="col-xs-2">
                        <label>
                            热水
                            <input name="hotWater" class="ace ace-switch ace-switch-6" type="checkbox"/>
                            <span class="lbl"></span>
                        </label>
                    </div>
                    <div class="col-xs-2">
                        <label>
                            厨房
                            <input name="kitchen" class="ace ace-switch ace-switch-6" type="checkbox"/>
                            <span class="lbl"></span>
                        </label>
                    </div>
                    <div class="col-xs-2">
                        <label>
                            电脑
                            <input name="computer" class="ace ace-switch ace-switch-6" type="checkbox"/>
                            <span class="lbl"></span>
                        </label>
                    </div>
                    <div class="col-xs-2">
                        <label>
                            毛巾
                            <input name="towel" class="ace ace-switch ace-switch-6" type="checkbox"/>
                            <span class="lbl"></span>
                        </label>
                    </div>
                    <div class="col-xs-2">
                        <label>
                            拖鞋
                            <input name="slipper" class="ace ace-switch ace-switch-6" type="checkbox"/>
                            <span class="lbl"></span>
                        </label>
                    </div>
                    <div class="col-xs-2">
                        <label>
                            电热水壶
                            <input name="kettle" class="ace ace-switch ace-switch-6" type="checkbox"/>
                            <span class="lbl"></span>
                        </label>
                    </div>
                    <div class="col-xs-2">
                        <label>
                            电梯
                            <input name="elevator" class="ace ace-switch ace-switch-6" type="checkbox"/>
                            <span class="lbl"></span>
                        </label>
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
<script type="text/javascript" src="../../../static/js/wangEditor.min.js"></script>
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