<!DOCTYPE html>

<html lang="en">
<head>
    <title>所有库存商品</title>
<#include "../../_inc/_header.ftl"/>

</head>
<body>

<div class="page-content">

    <div class="page-header">
        <h1>
            库存商品
            <small>
                <i class="icon-double-angle-right"></i>
                剩余库存
            </small>
        </h1>
    </div>
    <!-- /.page-header -->

    <div class="row">
        <div class="col-xs-12">

            <div class="table-responsive">
                <table id="sample-table-goods" class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr>
                        <th class="center">
                            品名
                        </th>
                        <th>产品条码</th>
                        <th>存放位置</th>
                        <th>单价</th>

                        <th>
                            库存
                        </th>
                        <th>类型</th>

                    </tr>
                    </thead>

                    <tbody>

                    <#if list?exists>
                        <#list list as goods>
                        <tr>
                            <td class="center">${goods.name}</td>
                            <td>${goods.code}</td>
                            <td>${goods.position}</td>
                            <td>${goods.cost}</td>
                            <td>${goods.sum}</td>
                            <td>${goods.type}</td>
                        </tr>
                        </#list>
                    </#if>


                    <div class="modal-footer no-margin-top">
                        <button class="btn btn-sm btn-danger pull-left" data-dismiss="modal">
                            <i class="icon-remove"></i>
                            Close
                        </button>

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
                    </tbody>
                </table>
            </div>
            <!-- /.table-responsive -->
        </div>
        <!-- /span -->
    </div>
    <!-- /row -->

</div><!-- /.page-content -->

</body>

<#include "../../_inc/_footer.ftl"/>

<script src="../static/js/jquery.easy-pie-chart.min.js"></script>
<script src="../static/js/jquery.sparkline.min.js"></script>
<script src="../static/js/flot/jquery.flot.min.js"></script>
<script src="../static/js/flot/jquery.flot.pie.min.js"></script>
<script src="../static/js/flot/jquery.flot.resize.min.js"></script>

<script src="../static/js/myjs/index.js"/>

</html>