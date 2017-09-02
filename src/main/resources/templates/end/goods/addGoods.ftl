<!DOCTYPE html>

<html lang="en">
<head>
    <title>添加商品&更新库存</title>
<#include "../../_inc/_header.ftl"/>

</head>
<body>

<div class="page-content">

    <div class="page-header">
        <h1>
            商品添加
            <small>
                <i class="icon-double-angle-right"></i>
                添加商品
            </small>
        </h1>
    </div>
    <!-- /.page-header -->

    <div class="row">
        <div class="col-xs-12">

            <form class="form-horizontal" role="form" action="${base}/endSys/addGoods" method="post"
                  onsubmit="return checkAddGoodsInfo()">
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
                    <label class="col-sm-3 control-label no-padding-right" for="name"> 商品名称 </label>

                    <div class="col-sm-9">
                        <input type="text" id="name" name="name" placeholder="商品名称" class="col-xs-10 col-sm-5"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="code"> 商品编码 </label>

                    <div class="col-sm-9">
                        <input type="text" id="code" name="code" placeholder="商品编码" class="col-xs-10 col-sm-5"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="position"> 商品位置 </label>

                    <div class="col-sm-9">
                        <input type="text" id="position" name="position" placeholder="商品位置" class="col-xs-10 col-sm-5"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="position"> 商品单价(元￥) </label>

                    <div class="col-sm-9">
                        <input type="text" id="cost" name="cost" placeholder="商品单价" class="col-xs-10 col-sm-5"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right" for="type"> 商品标签 </label>

                    <div class="col-sm-9">
                        <input type="text" id="type" name="type" placeholder="商品标签" class="col-xs-10 col-sm-5"/>
                    </div>
                </div>

                <div class="form-group hidden">
                    <label class="col-sm-3 control-label no-padding-right hidden" for="position"> 商品库存(件) </label>

                    <div class="col-sm-9 hidden">
                        <input type="hidden" id="sum" name="sum" placeholder="商品库存" class="col-xs-10 col-sm-5"/>
                    </div>
                </div>

                <div class="clearfix form-actions">
                    <div class="col-md-offset-3 col-md-9">
                        <button class="btn btn-info" type="submit">
                            <i class="icon-ok bigger-110"></i>
                            Submit
                        </button>

                        &nbsp; &nbsp; &nbsp;
                        <button class="btn" type="reset">
                            <i class="icon-undo bigger-110"></i>
                            Reset
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
<#include "../../_inc/_addGoods.ftl"/>


</html>