<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>添加商品&更新库存</title>
<#include "../../_inc/_header.ftl"/>
    <link rel="stylesheet" href="${base}/static/css/ui.jqgrid.css"/>
</head>
<body>

<div class="main-container" id="main-container">
    <div class="main-container-inner">
        <div class="page-content">
            <div class="page-header">
                <h1>
                    化妆品管理中心
                    <small>
                        <i class="icon-double-angle-right"></i>
                        商品出库
                    </small>
                </h1>
            </div>
            <!-- /.page-header -->

            <div class="row">
                <div class="col-xs-12">
                    <!-- PAGE CONTENT BEGINS -->

                    <div class="alert alert-info">
                        <i class="icon-hand-right"></i> 商品出库前必须保证商品已经录入系统中。
                        <button class="close" data-dismiss="alert">
                            <i class="icon-remove"></i>
                        </button>
                    </div>

                    <table id="grid-table"></table>

                    <div id="grid-pager"></div>
                    <br/>
                    <div class="col-xs-12 col-sm-12 center">
                        <button class="btn btn-white btn-info btn-bold" onclick="submitGoodsIn()">
                            <i class="ace-icon fa fa-floppy-o bigger-120 blue"></i>
                            提交
                        </button>
                    </div>

                    <div id="dialog-message" class="hide">
                    <#--<div class="col-xs-12">-->
                    <#--<label class="col-sm-2 control-label no-padding-right" for="name">关键字</label>-->

                    <#--<div class="col-sm-5">-->
                    <#--<input type="text" id="name" name="name" placeholder="商品关键字" class="col-xs-15 col-sm-7">-->
                    <#--</div>-->
                    <#--<button class="col-sm-2 btn btn-sm btn-primary">搜索</button>-->
                    <#--</div>-->


                        <div class="col-xs-12 col-sm-12 ">
                            <div class="input-group">
                                <input type="text" class="form-control search-query"
                                       placeholder="化妆品关键字" id="goods-val">
                                <span class="input-group-btn">
                                    <button type="button" class="btn btn-purple btn-sm" onclick="searchGoods()">
                                        查找
                                        <i class="icon-search icon-on-right bigger-110"></i>
                                    </button>

                                </span>
                            </div>
                        </div>

                        <div class="col-xs-12">
                            <div class="table-responsive">
                                <div class="alert alert-info hidden" id="goods-result-msg">
                                    <i class="icon-hand-right"></i> 暂未找到对应关键字的化妆品！
                                    <button class="close" data-dismiss="alert">
                                        <i class="icon-remove"></i></button>
                                </div>
                                <table id="sample-table-1-goods-result"
                                       class="table table-striped table-bordered table-hover hidden">
                                    <thead>
                                    <tr>
                                        <th class="center">
                                            <label>
                                                选择
                                                <span class="lbl"></span>
                                            </label>
                                        </th>
                                        <th class="hidden">ID</th>
                                        <th>化妆品名字</th>
                                        <th>化妆品编码</th>
                                        <th class="hidden-480">库存</th>

                                        <th>
                                            <i class=""></i> 单价
                                        </th>
                                        <th class="hidden-480">位置</th>

                                        <th>类型</th>
                                    </tr>
                                    </thead>
                                    <tbody class="" id="sample-table-1-goods-result-body">
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>

                    </div><!-- #dialog-message -->

                    <script type="text/javascript">
                        var $path_base = "/"; //this will be used in gritter alerts containing images
                    </script>

                    <!-- PAGE CONTENT ENDS -->
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.page-content -->
    </div>
    <!-- /.main-content -->

</div>
<!-- /.main-container-inner -->

</body>

<#include "../../_inc/_footer.ftl"/>

<script src="${base}/static/js/date-time/bootstrap-datepicker.min.js"></script>
<script src="${base}/static/js/jqGrid/jquery.jqGrid.min.js"></script>
<script src="${base}/static/js/jqGrid/i18n/grid.locale-en.js"></script>
<script type="text/javascript">
    var selectGoodsResult = null;

    function selectGoods(goodsID) {
        $.ajax({
            type: "GET",
            url: '${base}/endSys/api/goods/getById/' + goodsID,
            dataType: 'json', //当这里指定为json的时候，获取到了数据后会自己解析的，只需要 返回值.字段名称 就能使用了
            cache: false,
            success: function (data) {
                if (data.code === 1) {
                    selectGoodsResult = data.data;
                } else {

                }
            }
        });
    }

    function searchGoods() {
        $.ajax({
            type: "GET",
            url: '${base}/endSys/api/goods/findByKeyword/' + $("#goods-val").val(),
            dataType: 'json', //当这里指定为json的时候，获取到了数据后会自己解析的，只需要 返回值.字段名称 就能使用了
            cache: false,
            success: function (data) {
                if (data.code === 1) {
                    $("#sample-table-1-goods-result").removeClass("hidden");
                    var resultStr = "";
                    for (var i = 0; i < data.data.length; i++) {
                        resultStr += '<tr><td class="center"><input type="radio" name="goods-result-id" onclick="selectGoods(' + data.data[i].id + ')"/></td>';
                        resultStr += '<td class="hidden">' + data.data[i].id + '</td><td>' + data.data[i].name + '</td><td>' + data.data[i].code + '</td>';
                        resultStr += '<td>' + data.data[i].sum + '</td><td>' + data.data[i].cost + '</td><td>' + data.data[i].position + '</td><td>' + data.data[i].type + '</td>';
                        resultStr += '</tr>';
                    }
                    document.getElementById("sample-table-1-goods-result-body").innerHTML = resultStr;
                } else {
                    $("#goods-result-msg").removeClass("hidden");

                }
            }
        });
    }

    function submitGoodsIn() {

    }

</script>
<script type="text/javascript">

    var grid_data = [];

    jQuery(function ($) {
        var grid_selector = "#grid-table";
        var pager_selector = "#grid-pager";

        jQuery(grid_selector).jqGrid({
            //direction: "rtl",

            data: grid_data,
            datatype: "local",
            height: 300,
            colNames: [' ', '商品名称', '商品编码', '位置', '单价', '数量'],
            colModel: [{
                name: 'myac',
                index: '',
                width: 80,
                fixed: true,
                sortable: false,
                resize: false,
                formatter: 'actions',
                formatoptions: {
                    keys: true,
                    delOptions: {
                        recreateForm: true,
                        beforeShowForm: beforeDeleteCallback
                    },
                    //editformbutton:true, editOptions:{recreateForm: true, beforeShowForm:beforeEditCallback}
                }
            },
//                {
//                    name: 'id',
//                    index: 'id',
//                    width: 20,
//                    sorttype: "string",
//                    editable: false,
//                    key: true,
//                    editoptions: {
//                        size: "20",
//                        maxlength: "30"
//                    }
//                },
                {
                    name: 'name',
                    index: 'name',
                    width: 140,
                    editable: false
//                    sorttype: "string",
//                    unformat: pickDate
                },
                {
                    name: 'code',
                    index: 'code',
                    width: 120,
                    editable: false,
                    editoptions: {
                        size: "20",
                        maxlength: "30"
                    }
                },
                {
                    name: 'position',
                    index: 'position',
                    width: 180,
                    editable: true,
                    edittype: "textarea"
//                    edittype: "checkbox",
//                    editoptions: {
//                        value: "Yes:No"
//                    },
//                    unformat: aceSwitch
                },
                {
                    name: 'cost',
                    index: 'cost',
                    width: 50,
                    editable: true,
//                    edittype: "select",
//                    editoptions: {
//                        value: "FE:FedEx;IN:InTime;TN:TNT;AR:ARAMEX"
//                    }
                },
                {
                    name: 'sum',
                    index: 'sum',
                    width: 90,
                    sortable: false,
                    editable: true
                }
            ],

            viewrecords: true,
            rowNum: 20,
            pager: pager_selector,
            altRows: true,
            //toppager: true,

            multiselect: true,
            //multikey: "ctrlKey",
            multiboxonly: true,

            loadComplete: function () {
                var table = this;
                setTimeout(function () {
                    styleCheckbox(table);

                    updateActionIcons(table);
                    updatePagerIcons(table);
                    enableTooltips(table);
                }, 0);
            },

            caption: "商品入库表",

            autowidth: true

        });

        //enable search/filter toolbar
//        $('div').find('.ui-jqgrid-sortable').style('padding-bottom: 25px;');

        //switch element when editing inline
        function aceSwitch(cellvalue, options, cell) {
            setTimeout(function () {
                $(cell).find('input[type=checkbox]')
                        .wrap('<label class="inline" />')
                        .addClass('ace ace-switch ace-switch-5')
                        .after('<span class="lbl"></span>');
            }, 0);
        }

        //enable datepicker
        function pickDate(cellvalue, options, cell) {
            setTimeout(function () {
                $(cell).find('input[type=text]')
                        .datepicker({
                            format: 'yyyy-mm-dd',
                            autoclose: true
                        });
            }, 0);
        }


        //navButtons
        jQuery(grid_selector).jqGrid('navGrid', pager_selector, { //navbar options
                    edit: false,
                    editicon: 'icon-pencil blue',
                    add: false,
                    addicon: 'icon-plus-sign purple',
                    del: true,
                    delicon: 'icon-trash red',
                    search: true,
                    searchicon: 'icon-search orange',
                    refresh: true,
                    refreshicon: 'icon-refresh green',
                    view: false,
                    viewicon: 'icon-zoom-in grey'
                }
                , {
                    //delete record form
                    recreateForm: true,
                    beforeShowForm: function (e) {
                        var form = $(e[0]);
                        if (form.data('styled')) return false;

                        form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
                        style_delete_form(form);

                        form.data('styled', true);
                    },
                    onClick: function (e) {
                        alert(1);
                    }
                }
                , {
                    //search form
                    recreateForm: true,
                    afterShowSearch: function (e) {
                        var form = $(e[0]);
                        form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
                        style_search_form(form);
                    },
                    afterRedraw: function () {
                        style_search_filters($(this));
                    },
                    multipleSearch: true,
                    /**
                     multipleGroup:true,
                     showQuery: true
                     */
                }
                , {
                    //view record form
                    recreateForm: true,
                    beforeShowForm: function (e) {
                        var form = $(e[0]);
                        form.closest('.ui-jqdialog').find('.ui-jqdialog-title').wrap('<div class="widget-header" />')
                    }
                });

        jQuery(grid_selector).navButtonAdd(pager_selector, {
            caption: "添加商品",
            buttonicon: "icon-plus-sign purple",
            title: '添加商品',
            onClickButton: function () {
                var dialog = $("#dialog-message").removeClass('hide').dialog({
                    modal: true,
                    title: '--->添加化妆品',
                    title_html: true,
                    width: 900,
                    height: 450,
                    buttons: [
                        {
                            text: "取消",
                            "class": "btn btn-xs",
                            click: function () {
                                $(this).dialog("close");
                            }
                        },
                        {
                            text: "添加",
                            "class": "btn btn-primary btn-xs",
                            click: function () {
                                $(this).dialog("close");
                                var selectedId = jQuery(grid_selector).jqGrid("getGridParam", "selrow");
                                var ids = jQuery(grid_selector).jqGrid('getDataIDs');
                                var rowid = Math.max.apply(Math, ids) + 1;

                                if (selectedId) {
                                    jQuery(grid_selector).jqGrid("addRowData", rowid, selectGoodsResult, "after", selectedId);
                                } else {
                                    jQuery(grid_selector).jqGrid("addRowData", rowid, selectGoodsResult, "last");
                                }

                                //将新添加的行插入到第一列
//                                jQuery(grid_selector).jqGrid("addRowData", rowid + 1, selectGoodsResult, "first");

                            }
                        }
                    ]
                });

            },
            position: "last"
        });


        function style_edit_form(form) {
            //enable datepicker on "sdate" field and switches for "stock" field
            form.find('input[name=sdate]').datepicker({
                format: 'yyyy-mm-dd',
                autoclose: true
            }).end()
                    .find('input[name=stock]')
                    .addClass('ace ace-switch ace-switch-5')
                    .wrap('<label class="inline" />')
                    .after('<span class="lbl"></span>');

            //update buttons classes
            var buttons = form.next().find('.EditButton .fm-button');
            buttons.addClass('btn btn-sm').find('[class*="-icon"]').remove(); //ui-icon, s-icon
            buttons.eq(0).addClass('btn-primary').prepend('<i class="icon-ok"></i>');
            buttons.eq(1).prepend('<i class="icon-remove"></i>')

            buttons = form.next().find('.navButton a');
            buttons.find('.ui-icon').remove();
            buttons.eq(0).append('<i class="icon-chevron-left"></i>');
            buttons.eq(1).append('<i class="icon-chevron-right"></i>');
        }

        function style_delete_form(form) {
            var buttons = form.next().find('.EditButton .fm-button');
            buttons.addClass('btn btn-sm').find('[class*="-icon"]').remove(); //ui-icon, s-icon
            buttons.eq(0).addClass('btn-danger').prepend('<i class="icon-trash"></i>');
            buttons.eq(1).prepend('<i class="icon-remove"></i>')
        }

        function style_search_filters(form) {
            form.find('.delete-rule').val('X');
            form.find('.add-rule').addClass('btn btn-xs btn-primary');
            form.find('.add-group').addClass('btn btn-xs btn-success');
            form.find('.delete-group').addClass('btn btn-xs btn-danger');
        }

        function style_search_form(form) {
            var dialog = form.closest('.ui-jqdialog');
            var buttons = dialog.find('.EditTable')
            buttons.find('.EditButton a[id*="_reset"]').addClass('btn btn-sm btn-info').find('.ui-icon').attr('class', 'icon-retweet');
            buttons.find('.EditButton a[id*="_query"]').addClass('btn btn-sm btn-inverse').find('.ui-icon').attr('class', 'icon-comment-alt');
            buttons.find('.EditButton a[id*="_search"]').addClass('btn btn-sm btn-purple').find('.ui-icon').attr('class', 'icon-search');
        }

        function beforeDeleteCallback(e) {
            var form = $(e[0]);
            if (form.data('styled')) return false;

            form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
            style_delete_form(form);

            form.data('styled', true);
        }

        function beforeEditCallback(e) {
            var form = $(e[0]);
            form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
            style_edit_form(form);
        }

        //it causes some flicker when reloading or navigating grid
        //it may be possible to have some custom formatter to do this as the grid is being created to prevent this
        //or go back to default browser checkbox styles for the grid
        function styleCheckbox(table) {
            /**
             $(table).find('input:checkbox').addClass('ace')
             .wrap('<label />')
             .after('<span class="lbl align-top" />')


             $('.ui-jqgrid-labels th[id*="_cb"]:first-child')
             .find('input.cbox[type=checkbox]').addClass('ace')
             .wrap('<label />').after('<span class="lbl align-top" />');
             */
        }

        //unlike navButtons icons, action icons in rows seem to be hard-coded
        //you can change them like this in here if you want
        function updateActionIcons(table) {
            /**
             var replacement =
             {
                 'ui-icon-pencil' : 'icon-pencil blue',
                 'ui-icon-trash' : 'icon-trash red',
                 'ui-icon-disk' : 'icon-ok green',
                 'ui-icon-cancel' : 'icon-remove red'
             };
             $(table).find('.ui-pg-div span.ui-icon').each(function(){
						var icon = $(this);
						var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
						if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
					})
             */
        }

        //replace icons with FontAwesome icons like above
        function updatePagerIcons(table) {
            var replacement = {
                'ui-icon-seek-first': 'icon-double-angle-left bigger-140',
                'ui-icon-seek-prev': 'icon-angle-left bigger-140',
                'ui-icon-seek-next': 'icon-angle-right bigger-140',
                'ui-icon-seek-end': 'icon-double-angle-right bigger-140'
            };
            $('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function () {
                var icon = $(this);
                var $class = $.trim(icon.attr('class').replace('ui-icon', ''));

                if ($class in replacement) icon.attr('class', 'ui-icon ' + replacement[$class]);
            })
        }

        function enableTooltips(table) {
            $('.navtable .ui-pg-button').tooltip({
                container: 'body'
            });
            $(table).find('.ui-pg-div').tooltip({
                container: 'body'
            });
        }

        //var selr = jQuery(grid_selector).jqGrid('getGridParam','selrow');
        document.getElementById("grid-pager").style.height = 51 + 'px';
    });

</script>


</html>