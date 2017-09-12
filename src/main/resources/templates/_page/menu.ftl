<div class="navbar navbar-default" id="navbar">
    <script type="text/javascript">
        try {
            ace.settings.check('navbar', 'fixed')
        } catch (e) {
        }
    </script>

    <div class="navbar-container" id="navbar-container">
        <div class="navbar-header pull-left">
            <a href="#" class="navbar-brand">
                <small>
                    <i class="icon-leaf"></i>
                    ACE后台管理系统
                </small>
            </a><!-- /.brand -->
        </div><!-- /.navbar-header -->

        <div class="navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">


                <li class="light-blue">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                        <img class="nav-user-photo" src="../static/avatars/user.jpg" alt="Jason's Photo"/>
                        <span class="user-info">
									<small>欢迎光临,</small>
                        ${user.name!}
								</span>

                        <i class="icon-caret-down"></i>
                    </a>

                    <ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <li>
                            <a href="#">
                                <i class="icon-cog"></i>
                                设置
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                <i class="icon-user"></i>
                                个人资料
                            </a>
                        </li>

                        <li class="divider"></li>

                        <li>
                            <a href="../logOut">
                                <i class="icon-off"></i>
                                退出
                            </a>
                        </li>
                    </ul>
                </li>
            </ul><!-- /.ace-nav -->
        </div><!-- /.navbar-header -->
    </div><!-- /.container -->
</div>

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

    <ul class="nav nav-list">
        <li class="active">
            <a href="index.html">
                <i class="icon-dashboard"></i>
                <span class="menu-text"> 控制台 </span>
            </a>
        </li>

        <li>
            <a onclick="menuOnclick('zSwagger','在线APIDocs','../swagger-ui.html')">
                <i class="icon-desktop"></i>
                <span class="menu-text"> 在线APIDocs </span>
            </a>
        </li>

        <li>
            <a onclick="menuOnclick('zDruid','服务器中心','../druid/index.html')">
                <i class="icon-desktop"></i>
                <span class="menu-text"> 服务器中心 </span>
            </a>
        </li>

    <#--<li class="hidden">-->
    <#--<a href="#" class="dropdown-toggle">-->
    <#--<i class="icon-desktop"></i>-->
    <#--<span class="menu-text"> UI 组件 </span>-->

    <#--<b class="arrow icon-angle-down"></b>-->
    <#--</a>-->

    <#--<ul class="submenu">-->
    <#--<li>-->
    <#--<a href="elements.html">-->
    <#--<i class="icon-double-angle-right"></i>-->
    <#--组件-->
    <#--</a>-->
    <#--</li>-->

    <#--<li>-->
    <#--<a href="buttons.html">-->
    <#--<i class="icon-double-angle-right"></i>-->
    <#--按钮 &amp; 图表-->
    <#--</a>-->
    <#--</li>-->

    <#--<li>-->
    <#--<a href="treeview.html">-->
    <#--<i class="icon-double-angle-right"></i>-->
    <#--树菜单-->
    <#--</a>-->
    <#--</li>-->

    <#--<li>-->
    <#--<a href="jquery-ui.html">-->
    <#--<i class="icon-double-angle-right"></i>-->
    <#--jQuery UI-->
    <#--</a>-->
    <#--</li>-->

    <#--<li>-->
    <#--<a href="nestable-list.html">-->
    <#--<i class="icon-double-angle-right"></i>-->
    <#--可拖拽列表-->
    <#--</a>-->
    <#--</li>-->

    <#--<li>-->
    <#--<a href="#" class="dropdown-toggle">-->
    <#--<i class="icon-double-angle-right"></i>-->

    <#--三级菜单-->
    <#--<b class="arrow icon-angle-down"></b>-->
    <#--</a>-->

    <#--<ul class="submenu">-->
    <#--<li>-->
    <#--<a href="#">-->
    <#--<i class="icon-leaf"></i>-->
    <#--第一级-->
    <#--</a>-->
    <#--</li>-->

    <#--<li>-->
    <#--<a href="#" class="dropdown-toggle">-->
    <#--<i class="icon-pencil"></i>-->

    <#--第四级-->
    <#--<b class="arrow icon-angle-down"></b>-->
    <#--</a>-->

    <#--<ul class="submenu">-->
    <#--<li>-->
    <#--<a href="#">-->
    <#--<i class="icon-plus"></i>-->
    <#--添加产品-->
    <#--</a>-->
    <#--</li>-->

    <#--<li>-->
    <#--<a href="#">-->
    <#--<i class="icon-eye-open"></i>-->
    <#--查看商品-->
    <#--</a>-->
    <#--</li>-->
    <#--</ul>-->
    <#--</li>-->
    <#--</ul>-->
    <#--</li>-->
    <#--</ul>-->
    <#--</li>-->

    <#--<li class="hidden">-->
    <#--<a href="#" class="dropdown-toggle">-->
    <#--<i class="icon-list"></i>-->
    <#--<span class="menu-text"> 表格 </span>-->

    <#--<b class="arrow icon-angle-down"></b>-->
    <#--</a>-->

    <#--<ul class="submenu">-->
    <#--<li>-->
    <#--<a href="tables.html">-->
    <#--<i class="icon-double-angle-right"></i>-->
    <#--简单 &amp; 动态-->
    <#--</a>-->
    <#--</li>-->

    <#--<li>-->
    <#--<a href="jqgrid.html">-->
    <#--<i class="icon-double-angle-right"></i>-->
    <#--jqGrid plugin-->
    <#--</a>-->
    <#--</li>-->
    <#--</ul>-->
    <#--</li>-->

    <#--<li class="hidden">-->
    <#--<a href="#" class="dropdown-toggle">-->
    <#--<i class="icon-edit"></i>-->
    <#--<span class="menu-text"> 表单 </span>-->

    <#--<b class="arrow icon-angle-down"></b>-->
    <#--</a>-->

    <#--<ul class="submenu">-->
    <#--<li>-->
    <#--<a href="form-elements.html">-->
    <#--<i class="icon-double-angle-right"></i>-->
    <#--表单组件-->
    <#--</a>-->
    <#--</li>-->

    <#--<li>-->
    <#--<a href="form-wizard.html">-->
    <#--<i class="icon-double-angle-right"></i>-->
    <#--向导提示 &amp; 验证-->
    <#--</a>-->
    <#--</li>-->

    <#--<li>-->
    <#--<a href="wysiwyg.html">-->
    <#--<i class="icon-double-angle-right"></i>-->
    <#--编辑器-->
    <#--</a>-->
    <#--</li>-->

    <#--<li>-->
    <#--<a onclick="menuOnclick('zUpload','资源上传','../endSys/uploadFile')">-->
    <#--<i class="icon-double-angle-right"></i>-->
    <#--文件上传-->
    <#--</a>-->
    <#--</li>-->
    <#--</ul>-->
    <#--</li>-->

    <#--<li class="hidden">-->
    <#--<a href="widgets.html">-->
    <#--<i class="icon-list-alt"></i>-->
    <#--<span class="menu-text"> 插件 </span>-->
    <#--</a>-->
    <#--</li>-->

    <#--<li class="hidden">-->
    <#--<a href="calendar.html">-->
    <#--<i class="icon-calendar"></i>-->

    <#--<span class="menu-text">-->
    <#--日历-->
    <#--<span class="badge badge-transparent tooltip-error"-->
    <#--title="2&nbsp;Important&nbsp;Events">-->
    <#--<i class="icon-warning-sign red bigger-130"></i>-->
    <#--</span>-->
    <#--</span>-->
    <#--</a>-->
    <#--</li>-->

    <#--<li class="hidden">-->
    <#--<a href="gallery.html">-->
    <#--<i class="icon-picture"></i>-->
    <#--<span class="menu-text"> 相册 </span>-->
    <#--</a>-->
    <#--</li>-->

        <li>
            <a href="#" class="dropdown-toggle">
                <i class="icon-tag"></i>
                <span class="menu-text"> 化妆品管理中心 </span>

                <b class="arrow icon-angle-down"></b>
            </a>

            <ul class="submenu">

                <li>
                    <a onclick="menuOnclick('zAddGoods','添加商品','../endSys/addGoods/0')">
                        <i class="icon-text-width"></i>
                        <span class="menu-text"> 添加商品 </span>
                    </a>
                </li>

                <li>
                    <a onclick="menuOnclick('zAllGoods','所有库存商品','../endSys/goodsAll')">
                        <i class="icon-text-width"></i>
                        <span class="menu-text"> 所有库存商品 </span>
                    </a>
                </li>

                <li>
                    <a onclick="menuOnclick('zInHouse','入库操作','../endSys/inHouse')">
                        <i class="icon-text-width"></i>
                        <span class="menu-text"> 商品入库 </span>
                    </a>
                </li>

                <li>
                    <a onclick="menuOnclick('zOutHouse','出库操作','../endSys/outHouse')">
                        <i class="icon-text-width"></i>
                        <span class="menu-text"> 商品出库 </span>
                    </a>
                </li>

                <li>
                    <a onclick="menuOnclick('zHouseForm','台账查看','../endSys/formHouse')">
                        <i class="icon-text-width"></i>
                        <span class="menu-text"> 台账查看 </span>
                    </a>
                </li>


            </ul>
        </li>

        <li>
            <a href="#" class="dropdown-toggle">
                <i class="icon-tag"></i>
                <span class="menu-text"> 用户管理与维护 </span>

                <b class="arrow icon-angle-down"></b>
            </a>

            <ul class="submenu">

                <li>
                    <a onclick="menuOnclick('zUserIndex','用户列表','../endSys/userList')">
                        <i class="icon-text-width"></i>
                        <span class="menu-text"> 用户列表 </span>
                    </a>
                </li>

                <li>
                    <a onclick="menuOnclick('zAddUser','添加用户','../endSys/addUser')">
                        <i class="icon-text-width"></i>
                        <span class="menu-text"> 添加用户 </span>
                    </a>
                </li>


            </ul>
        </li>

    <#--<li class="hidden">-->
    <#--<a href="#" class="dropdown-toggle">-->
    <#--<i class="icon-file-alt"></i>-->

    <#--<span class="menu-text">-->
    <#--其他页面-->
    <#--<span class="badge badge-primary ">5</span>-->
    <#--</span>-->

    <#--<b class="arrow icon-angle-down"></b>-->
    <#--</a>-->

    <#--<ul class="submenu">-->
    <#--<li>-->
    <#--<a href="faq.html">-->
    <#--<i class="icon-double-angle-right"></i>-->
    <#--帮助-->
    <#--</a>-->
    <#--</li>-->

    <#--<li>-->
    <#--<a href="error-404.html">-->
    <#--<i class="icon-double-angle-right"></i>-->
    <#--404错误页面-->
    <#--</a>-->
    <#--</li>-->

    <#--<li>-->
    <#--<a onclick="menuOnclick('zError500','错误500页面','../error')">-->
    <#--<i class="icon-double-angle-right"></i>-->
    <#--500错误页面-->
    <#--</a>-->
    <#--</li>-->

    <#--<li>-->
    <#--<a href="grid.html">-->
    <#--<i class="icon-double-angle-right"></i>-->
    <#--网格-->
    <#--</a>-->
    <#--</li>-->

    <#--<li>-->
    <#--<a href="blank.html">-->
    <#--<i class="icon-double-angle-right"></i>-->
    <#--空白页面-->
    <#--</a>-->
    <#--</li>-->
    <#--</ul>-->
    <#--</li>-->
    </ul><!-- /.nav-list -->
    <div class="sidebar-collapse" id="sidebar-collapse">
        <i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
    </div>

    <script type="text/javascript">
        try {
            ace.settings.check('sidebar', 'collapsed')
        } catch (e) {
        }
    </script>
</div>
