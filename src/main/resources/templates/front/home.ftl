<!DOCTYPE html>

<html>
<head>
    <title>欢迎点餐</title>
<#include "../_inc/_header.ftl"/>

</head>
<body>

<div class="main-container" id="main-container">
    <script type="text/javascript">
        try {
            ace.settings.check('main-container', 'fixed')
        } catch (e) {
        }
    </script>

    <div class="main-container-inner">
        <a class="menu-toggler" id="menu-toggler" href="#">
            <span class="menu-text"></span>
        </a>

        <div class="sidebar" id="sidebar">
            <script type="text/javascript">
                try {
                    ace.settings.check('sidebar', 'fixed')
                } catch (e) {
                }
            </script>

            <div class="sidebar-shortcuts" id="sidebar-shortcuts">

            </div>
            <!-- #sidebar-shortcuts -->

            <ul class="nav nav-list">
            <#if foodTypes?exists>
                <#list foodTypes.data as foodType>
                    <li>
                        <a href="#foodType-${foodType.id!}">
                            <i class="icon-text-width"></i>
                            <span class="menu-text"> ${foodType.name!} </span>
                        </a>
                    </li>
                </#list>
            </#if>

                <li>
                    <a href="#foodType-car">
                        <i class="icon-text-width"></i>
                        <span class="menu-text"> 我的订单 </span>
                    </a>
                </li>

            </ul>
            <!-- /.nav-list -->

            <div class="sidebar-collapse" id="sidebar-collapse">
                <i class="icon-double-angle-left" data-icon1="icon-double-angle-left"
                   data-icon2="icon-double-angle-right"></i>
            </div>

            <script type="text/javascript">
                try {
                    ace.settings.check('sidebar', 'collapsed')
                } catch (e) {
                }
            </script>
        </div>

        <div class="main-content">
            <div class="breadcrumbs" id="breadcrumbs">
                <script type="text/javascript">
                    try {
                        ace.settings.check('breadcrumbs', 'fixed')
                    } catch (e) {
                    }
                </script>

                <ul class="breadcrumb">
                    <li>
                        <i class="icon-home home-icon"></i>
                        <a href="#">欢迎使用点餐系统</a>
                    </li>

                </ul>
                <!-- .breadcrumb -->

            </div>

            <div class="page-content">

                <!-- /.page-header -->

                <div class="row">
                <#if foodTypes?exists>
                    <#list foodTypes.data as foodType>

                        <div class="row">
                            <a name="foodType-${foodType.id!}">
                                <div class="page-header">
                                    <h1>${foodType.name!}
                                    </h1>
                                </div>
                            </a>

                            <div class="col-xs-12 col-sm-9">
                                <div class="widget-box">
                                    <div class="widget-header">
                                        <h4> ${foodType.name!}</h4>


                                        <div class="widget-toolbar">
                                            <a href="#" data-action="collapse">
                                                <i class="icon-chevron-up"></i>
                                            </a>

                                        </div>
                                    </div>

                                    <div class="widget-body">
                                        <div class="widget-main">
                                            <table class="table table-striped table-bordered table-hover">
                                                <thead>
                                                <tr>
                                                    <th></th>
                                                    <th>菜名</th>
                                                    <th class="center">
                                                        口味
                                                    </th>
                                                    <th>原价&nbsp;/&nbsp;会员价(￥)</th>
                                                    <th>&nbsp; &nbsp; &nbsp;</th>

                                                </tr>
                                                </thead>

                                                <tbody>
                                                    <#if foods?exists>
                                                        <#list foods.data as food>
                                                        <tr>
                                                            <#if food.type! == foodType.name!>
                                                                <td class="center">
                                                                    <img class="" src="${food.avatar!}" height="55" width="55">
                                                                </td>
                                                                <td>
                                                                ${food.name!}
                                                                </td>
                                                                <td>
                                                                ${food.style!}
                                                                </td>
                                                                <td>
                                                                ${food.cost!}&nbsp;/&nbsp;${food.costVip!}
                                                                </td>
                                                                <td class="center">
                                                                    <div>
                                                                        <button class="btn btn-warning btn-xs"
                                                                                onclick="">
                                                                            <i class="icon-arrow-right  bigger-110 icon-only"></i>
                                                                            添加到点菜单
                                                                        </button>
                                                                    </div>
                                                                </td>
                                                            </#if>
                                                        </tr>
                                                        </#list>
                                                    </#if>
                                                </tbody>
                                            </table>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /span -->

                    </#list>
                </#if>

                    <div class="row">
                        <a name="foodType-car">
                            <div class="page-header">
                                <h1>我的订单
                                </h1>
                            </div>
                        </a>

                        <div class="col-xs-12 col-sm-9">
                            <div class="widget-box">
                                <div class="widget-header">
                                    <h4> 我的订单</h4>


                                    <div class="widget-toolbar">
                                        <a href="#" data-action="collapse">
                                            <i class="icon-chevron-up"></i>
                                        </a>

                                    </div>
                                </div>

                                <div class="widget-body">
                                    <div class="widget-main">
                                        <table class="table table-striped table-bordered table-hover">
                                            <thead>
                                            <tr>
                                                <th>菜名</th>
                                                <th class="center">
                                                    口味
                                                </th>
                                                <th>原价&nbsp;/&nbsp;会员价(￥)</th>
                                                <th>&nbsp; &nbsp; &nbsp;</th>

                                            </tr>
                                            </thead>

                                            <tbody>
                                            <#--<#if foods?exists>-->
                                                <#--<#list foods.data as food>-->
                                                <#--<tr>-->
                                                    <#--<#if food.type! == foodType.name!>-->
                                                        <#--<td>-->
                                                        <#--${food.name!}-->
                                                        <#--</td>-->
                                                        <#--<td>-->
                                                        <#--${food.style!}-->
                                                        <#--</td>-->
                                                        <#--<td>-->
                                                        <#--${food.cost!}&nbsp;/&nbsp;${food.costVip!}-->
                                                        <#--</td>-->
                                                        <#--<td class="center">-->
                                                            <#--<div>-->
                                                                <#--<button class="btn btn-warning btn-xs"-->
                                                                        <#--onclick="">-->
                                                                    <#--<i class="icon-arrow-right  bigger-110 icon-only"></i>-->
                                                                    <#--添加到点菜单-->
                                                                <#--</button>-->
                                                            <#--</div>-->
                                                        <#--</td>-->
                                                    <#--</#if>-->
                                                <#--</tr>-->
                                                <#--</#list>-->
                                            <#--</#if>-->
                                            </tbody>
                                        </table>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.page-content -->
        </div>
        <!-- /.main-content -->
    </div>
    <!-- /.main-container-inner -->

    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="icon-double-angle-up icon-only bigger-110"></i>
    </a>
</div>


</body>

<#include "../_inc/_footer.ftl"/>


</html>