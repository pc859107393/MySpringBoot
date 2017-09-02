<!DOCTYPE html>

<html lang="en">
<head>
    <title>后端主页</title>
<#include "../../_inc/_header.ftl"/>

</head>
<body>

<div class="page-content">

    <div class="page-header">
        <h1>
            最近操作
            <small>
                <i class="icon-double-angle-right"></i>
                最近入库
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
                            <td class="center">${goods.name!}</td>
                            <td>${goods.code!}</td>
                            <td>${goods.position!}</td>
                            <td>${goods.cost!}</td>
                            <td>${goods.sum!}</td>
                            <td>${goods.type!}</td>
                        </tr>
                        </#list>
                    </#if>

                    <#---->

                    <#--<tr>-->
                    <#--<td class="center">-->
                    <#--<label>-->
                    <#--<input type="checkbox" class="ace"/>-->
                    <#--<span class="lbl"></span>-->
                    <#--</label>-->
                    <#--</td>-->

                    <#--<td>-->
                    <#--<a href="#">base.com</a>-->
                    <#--</td>-->
                    <#--<td>$35</td>-->
                    <#--<td class="hidden-480">2,595</td>-->
                    <#--<td>Feb 18</td>-->

                    <#--<td class="hidden-480">-->
                    <#--<span class="label label-sm label-success">Registered</span>-->
                    <#--</td>-->

                    <#--<td>-->
                    <#--<div class="visible-md visible-lg hidden-sm hidden-xs btn-group">-->
                    <#--<button class="btn btn-xs btn-success">-->
                    <#--<i class="icon-ok bigger-120"></i>-->
                    <#--</button>-->

                    <#--<button class="btn btn-xs btn-info">-->
                    <#--<i class="icon-edit bigger-120"></i>-->
                    <#--</button>-->

                    <#--<button class="btn btn-xs btn-danger">-->
                    <#--<i class="icon-trash bigger-120"></i>-->
                    <#--</button>-->

                    <#--<button class="btn btn-xs btn-warning">-->
                    <#--<i class="icon-flag bigger-120"></i>-->
                    <#--</button>-->
                    <#--</div>-->

                    <#--<div class="visible-xs visible-sm hidden-md hidden-lg">-->
                    <#--<div class="inline position-relative">-->
                    <#--<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown">-->
                    <#--<i class="icon-cog icon-only bigger-110"></i>-->
                    <#--</button>-->

                    <#--<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">-->
                    <#--<li>-->
                    <#--<a href="#" class="tooltip-info" data-rel="tooltip" title="View">-->
                    <#--<span class="blue">-->
                    <#--<i class="icon-zoom-in bigger-120"></i>-->
                    <#--</span>-->
                    <#--</a>-->
                    <#--</li>-->

                    <#--<li>-->
                    <#--<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">-->
                    <#--<span class="green">-->
                    <#--<i class="icon-edit bigger-120"></i>-->
                    <#--</span>-->
                    <#--</a>-->
                    <#--</li>-->

                    <#--<li>-->
                    <#--<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">-->
                    <#--<span class="red">-->
                    <#--<i class="icon-trash bigger-120"></i>-->
                    <#--</span>-->
                    <#--</a>-->
                    <#--</li>-->
                    <#--</ul>-->
                    <#--</div>-->
                    <#--</div>-->
                    <#--</td>-->
                    <#--</tr>-->

                    <#--<tr>-->
                    <#--<td class="center">-->
                    <#--<label>-->
                    <#--<input type="checkbox" class="ace"/>-->
                    <#--<span class="lbl"></span>-->
                    <#--</label>-->
                    <#--</td>-->

                    <#--<td>-->
                    <#--<a href="#">max.com</a>-->
                    <#--</td>-->
                    <#--<td>$60</td>-->
                    <#--<td class="hidden-480">4,400</td>-->
                    <#--<td>Mar 11</td>-->

                    <#--<td class="hidden-480">-->
                    <#--<span class="label label-sm label-warning">Expiring</span>-->
                    <#--</td>-->

                    <#--<td>-->
                    <#--<div class="visible-md visible-lg hidden-sm hidden-xs btn-group">-->
                    <#--<button class="btn btn-xs btn-success">-->
                    <#--<i class="icon-ok bigger-120"></i>-->
                    <#--</button>-->

                    <#--<button class="btn btn-xs btn-info">-->
                    <#--<i class="icon-edit bigger-120"></i>-->
                    <#--</button>-->

                    <#--<button class="btn btn-xs btn-danger">-->
                    <#--<i class="icon-trash bigger-120"></i>-->
                    <#--</button>-->

                    <#--<button class="btn btn-xs btn-warning">-->
                    <#--<i class="icon-flag bigger-120"></i>-->
                    <#--</button>-->
                    <#--</div>-->

                    <#--<div class="visible-xs visible-sm hidden-md hidden-lg">-->
                    <#--<div class="inline position-relative">-->
                    <#--<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown">-->
                    <#--<i class="icon-cog icon-only bigger-110"></i>-->
                    <#--</button>-->

                    <#--<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">-->
                    <#--<li>-->
                    <#--<a href="#" class="tooltip-info" data-rel="tooltip" title="View">-->
                    <#--<span class="blue">-->
                    <#--<i class="icon-zoom-in bigger-120"></i>-->
                    <#--</span>-->
                    <#--</a>-->
                    <#--</li>-->

                    <#--<li>-->
                    <#--<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">-->
                    <#--<span class="green">-->
                    <#--<i class="icon-edit bigger-120"></i>-->
                    <#--</span>-->
                    <#--</a>-->
                    <#--</li>-->

                    <#--<li>-->
                    <#--<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">-->
                    <#--<span class="red">-->
                    <#--<i class="icon-trash bigger-120"></i>-->
                    <#--</span>-->
                    <#--</a>-->
                    <#--</li>-->
                    <#--</ul>-->
                    <#--</div>-->
                    <#--</div>-->
                    <#--</td>-->
                    <#--</tr>-->

                    <#--<tr>-->
                    <#--<td class="center">-->
                    <#--<label>-->
                    <#--<input type="checkbox" class="ace"/>-->
                    <#--<span class="lbl"></span>-->
                    <#--</label>-->
                    <#--</td>-->

                    <#--<td>-->
                    <#--<a href="#">best.com</a>-->
                    <#--</td>-->
                    <#--<td>$75</td>-->
                    <#--<td class="hidden-480">6,500</td>-->
                    <#--<td>Apr 03</td>-->

                    <#--<td class="hidden-480">-->
                    <#--<span class="label label-sm label-inverse arrowed-in">Flagged</span>-->
                    <#--</td>-->

                    <#--<td>-->
                    <#--<div class="visible-md visible-lg hidden-sm hidden-xs btn-group">-->
                    <#--<button class="btn btn-xs btn-success">-->
                    <#--<i class="icon-ok bigger-120"></i>-->
                    <#--</button>-->

                    <#--<button class="btn btn-xs btn-info">-->
                    <#--<i class="icon-edit bigger-120"></i>-->
                    <#--</button>-->

                    <#--<button class="btn btn-xs btn-danger">-->
                    <#--<i class="icon-trash bigger-120"></i>-->
                    <#--</button>-->

                    <#--<button class="btn btn-xs btn-warning">-->
                    <#--<i class="icon-flag bigger-120"></i>-->
                    <#--</button>-->
                    <#--</div>-->

                    <#--<div class="visible-xs visible-sm hidden-md hidden-lg">-->
                    <#--<div class="inline position-relative">-->
                    <#--<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown">-->
                    <#--<i class="icon-cog icon-only bigger-110"></i>-->
                    <#--</button>-->

                    <#--<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">-->
                    <#--<li>-->
                    <#--<a href="#" class="tooltip-info" data-rel="tooltip" title="View">-->
                    <#--<span class="blue">-->
                    <#--<i class="icon-zoom-in bigger-120"></i>-->
                    <#--</span>-->
                    <#--</a>-->
                    <#--</li>-->

                    <#--<li>-->
                    <#--<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">-->
                    <#--<span class="green">-->
                    <#--<i class="icon-edit bigger-120"></i>-->
                    <#--</span>-->
                    <#--</a>-->
                    <#--</li>-->

                    <#--<li>-->
                    <#--<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">-->
                    <#--<span class="red">-->
                    <#--<i class="icon-trash bigger-120"></i>-->
                    <#--</span>-->
                    <#--</a>-->
                    <#--</li>-->
                    <#--</ul>-->
                    <#--</div>-->
                    <#--</div>-->
                    <#--</td>-->
                    <#--</tr>-->

                    <#--<tr>-->
                    <#--<td class="center">-->
                    <#--<label>-->
                    <#--<input type="checkbox" class="ace"/>-->
                    <#--<span class="lbl"></span>-->
                    <#--</label>-->
                    <#--</td>-->

                    <#--<td>-->
                    <#--<a href="#">pro.com</a>-->
                    <#--</td>-->
                    <#--<td>$55</td>-->
                    <#--<td class="hidden-480">4,250</td>-->
                    <#--<td>Jan 21</td>-->

                    <#--<td class="hidden-480">-->
                    <#--<span class="label label-sm label-success">Registered</span>-->
                    <#--</td>-->

                    <#--<td>-->
                    <#--<div class="visible-md visible-lg hidden-sm hidden-xs btn-group">-->
                    <#--<button class="btn btn-xs btn-success">-->
                    <#--<i class="icon-ok bigger-120"></i>-->
                    <#--</button>-->

                    <#--<button class="btn btn-xs btn-info">-->
                    <#--<i class="icon-edit bigger-120"></i>-->
                    <#--</button>-->

                    <#--<button class="btn btn-xs btn-danger">-->
                    <#--<i class="icon-trash bigger-120"></i>-->
                    <#--</button>-->

                    <#--<button class="btn btn-xs btn-warning">-->
                    <#--<i class="icon-flag bigger-120"></i>-->
                    <#--</button>-->
                    <#--</div>-->

                    <#--<div class="visible-xs visible-sm hidden-md hidden-lg">-->
                    <#--<div class="inline position-relative">-->
                    <#--<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown">-->
                    <#--<i class="icon-cog icon-only bigger-110"></i>-->
                    <#--</button>-->

                    <#--<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">-->
                    <#--<li>-->
                    <#--<a href="#" class="tooltip-info" data-rel="tooltip" title="View">-->
                    <#--<span class="blue">-->
                    <#--<i class="icon-zoom-in bigger-120"></i>-->
                    <#--</span>-->
                    <#--</a>-->
                    <#--</li>-->

                    <#--<li>-->
                    <#--<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">-->
                    <#--<span class="green">-->
                    <#--<i class="icon-edit bigger-120"></i>-->
                    <#--</span>-->
                    <#--</a>-->
                    <#--</li>-->

                    <#--<li>-->
                    <#--<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">-->
                    <#--<span class="red">-->
                    <#--<i class="icon-trash bigger-120"></i>-->
                    <#--</span>-->
                    <#--</a>-->
                    <#--</li>-->
                    <#--</ul>-->
                    <#--</div>-->
                    <#--</div>-->
                    <#--</td>-->
                    <#--</tr>-->
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

<script src="../static/js/myjs/index.js"/>

</html>