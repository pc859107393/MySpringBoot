<!DOCTYPE html>

<html lang="en">
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
                    入库操作
                    <small>
                        <i class="icon-double-angle-right"></i>
                        商品入库
                    </small>
                </h1>
            </div>
            <!-- /.page-header -->

            <div class="row">
                <div class="col-xs-12">
                    <!-- PAGE CONTENT BEGINS -->

                    <div class="alert alert-info">
                        <i class="icon-hand-right"></i> 商品入库前必须保证商品已经录入系统中。
                        <button class="close" data-dismiss="alert">
                            <i class="icon-remove"></i>
                        </button>
                    </div>

                    <table id="grid-table"></table>

                    <div id="grid-pager"></div>

                    <div id="dialog-message" class="hide">
                        <p>
                            这是查找对话框。
                        </p>

                        <div class="hr hr-12 hr-double"></div>

                        <p>
                            Currently using
                            <b>36% of your storage space</b>
                            .
                        </p>
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
    var grid_data = [
        {
            "id": 1,
            "name": "2018年计算机组成原理考研复习指导",
            "code": "B区13库房131货架A11",
            "position": "489498",
            "cost": 48,
            "sum": 50000,
            "type": "书籍-考研-计算机-王道论坛"
        },
        {
            "id": 3,
            "name": "2018年计算机组成原理考研复习指导",
            "code": "9787121309762",
            "position": "B区13库房131货架A11",
            "cost": 48,
            "sum": 50000,
            "type": "书籍-考研-计算机-王道论坛"
        },
        {
            "id": 4,
            "name": "考研政治马原专项突破",
            "code": "9787121309789"
        },
        {
            "id": 5,
            "name": "考研政治早知道——马原专项突破",
            "code": "9787502278595"
        },
        {
            "id": 6,
            "name": "考研政治早知道——西瓜皮",
            "code": "9787502278595999",
            "position": "",
            "type": ""
        },
        {
            "id": 7,
            "name": "考研政治早知道——茄子",
            "code": "9787502299999999",
            "position": "",
            "type": ""
        },
        {
            "id": 8,
            "name": "考研政治早知道——西瓜皮999",
            "code": "9787502299999999999",
            "position": "",
            "type": ""
        },
        {
            "id": 9,
            "name": "考研政治早知道——西瓜皮888",
            "code": "9787502299999999888",
            "position": "没有位置不给吗？",
            "type": ""
        },
        {
            "id": 10,
            "name": "就是要发发发",
            "code": "888888",
            "position": "",
            "type": ""
        }
    ];

    jQuery(function ($) {
        var grid_selector = "#grid-table";
        var pager_selector = "#grid-pager";

        jQuery(grid_selector).jqGrid({
            //direction: "rtl",

            data: grid_data,
            datatype: "local",
            height: 300,
            colNames: [' ', 'ID', '商品名称', '商品编码', '位置', '单价', '数量'],
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
                {
                    name: 'id',
                    index: 'id',
                    width: 20,
                    sorttype: "int",
                    editable: false
                },
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

            editurl: $path_base + "/dummy.html", //nothing is saved
            caption: "商品入库表",

            autowidth: true

        });

        //enable search/filter toolbar
        //jQuery(grid_selector).jqGrid('filterToolbar',{defaultSearch:true,stringResult:true})

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
                    //edit record form
                    //closeAfterEdit: true,
                    recreateForm: true,
                    beforeShowForm: function (e) {
                        var form = $(e[0]);
                        form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
                        style_edit_form(form);
                    }
                }
                , {
                    //new record form
                    closeAfterAdd: true,
                    recreateForm: true,
                    viewPagerButtons: false,
                    beforeShowForm: function (e) {
                        var form = $(e[0]);
                        form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
                        style_edit_form(form);
                    }
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
                    title: "添加商品",
                    title_html: true,
                    buttons: [
                        {
                            text: "Cancel",
                            "class": "btn btn-xs",
                            click: function () {
                                $(this).dialog("close");
                            }
                        },
                        {
                            text: "OK",
                            "class": "btn btn-primary btn-xs",
                            click: function () {
                                $(this).dialog("close");
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