<!DOCTYPE html>

<html>
<head>
    <title>后端主页</title>
<#include "../_inc/_header.ftl"/>

</head>
<body>
<div class="main-container" id="main-container"
     style="margin:0 auto;width:100%;height: 1000px;">
    <script type="text/javascript">
        try {
            ace.settings.check('main-container', 'fixed')
        } catch (e) {
        }
    </script>

    <div class="main-container-inner" style="height: 1000px;">
        <a class="menu-toggler" id="menu-toggler" href="#">
            <span class="menu-text"></span>
        </a>

    <#include "../_page/menu.ftl"/>
        <div class="main-content">
            <div>
                <iframe name="mainFrame" id="mainFrame" frameborder="0" src="../endSys/tab"
                        style="margin:0 auto;width:100%;height:1000px;"></iframe>
            </div>
            <div class="ace-settings-container" id="ace-settings-container">
                <div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
                    <i class="icon-cog bigger-150"></i>
                </div>

                <div class="ace-settings-box" id="ace-settings-box">
                    <div>
                        <div class="pull-left">
                            <select id="skin-colorpicker" class="hide">
                                <option data-skin="default" value="#438EB9">#438EB9</option>
                                <option data-skin="skin-1" value="#222A2D">#222A2D</option>
                                <option data-skin="skin-2" value="#C6487E">#C6487E</option>
                                <option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
                            </select>
                        </div>
                        <span>&nbsp; 选择皮肤</span>
                    </div>

                    <div>
                        <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-navbar"/>
                        <label class="lbl" for="ace-settings-navbar"> 固定导航条</label>
                    </div>

                    <div>
                        <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar"/>
                        <label class="lbl" for="ace-settings-sidebar"> 固定滑动条</label>
                    </div>

                    <div>
                        <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-breadcrumbs"/>
                        <label class="lbl" for="ace-settings-breadcrumbs">固定面包屑</label>
                    </div>

                    <div>
                        <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl"/>
                        <label class="lbl" for="ace-settings-rtl">切换到左边</label>
                    </div>

                    <div>
                        <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-add-container"/>
                        <label class="lbl" for="ace-settings-add-container">
                            切换窄屏
                            <b></b>
                        </label>
                    </div>
                </div>
            </div>
        </div><!-- /#ace-settings-container -->
    </div><!-- /.main-content -->
</div>
</body>

<#include "../_inc/_footer.ftl"/>
<script src="../static/js/myjs/index.js"/>

<script src="../static/js/jquery.easy-pie-chart.min.js"></script>
<script src="../static/js/jquery.sparkline.min.js"></script>
<script src="../static/js/flot/jquery.flot.min.js"></script>
<script src="../static/js/flot/jquery.flot.pie.min.js"></script>
<script src="../static/js/flot/jquery.flot.resize.min.js"></script>

</html>