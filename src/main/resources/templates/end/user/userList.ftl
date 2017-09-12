<!DOCTYPE html>

<html>
<head>
    <title>后端主页</title>
<#include "../../_inc/_header.ftl"/>
<#setting datetime_format="yyyy-MM-dd HH:mm:ss"/>
</head>
<body>

<div class="page-content">

    <div class="page-header">
        <h1>
            用户管理
            <small>
                <i class="icon-double-angle-right"></i>
                所有用户
            </small>
        </h1>
    </div>
    <!-- /.page-header -->

    <div class="row">
        <div class="col-xs-12">
        <#if msg?exists>
            <div class="alert alert-block alert-success">

                <i class="icon-ok green"></i>
                <strong class="green">
                ${msg}
                </strong>
            </div>

        </#if>

            <div class="table-responsive">
                <table id="sample-table-goods" class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr>
                        <th class="center">
                            用户昵称
                        </th>
                        <th>登录名</th>
                        <th>职务</th>
                        <th>创建时间</th>
                        <th>是否可用</th>
                        <th>操作</th>

                    </tr>
                    </thead>

                    <tbody>

                    <#if users?exists>
                        <#list users as user>
                        <tr>
                            <td class="center">${user.name!}</td>
                            <td>${user.loginName!}</td>
                            <td>${user.duty!}</td>
                            <td>${user.createDate!?number_to_datetime}</td>
                        <#--<#if -->
                            <td>${user.used!?string("可用","已禁用")}</td>
                            <td>
                                <div>
                                    <button class="btn btn-warning btn-xs" onclick="getUserInfo('${user.loginName!}');">
                                        <i class="icon-wrench  bigger-110 icon-only"></i>
                                        修改
                                    </button>

                                    <button class="btn btn-error btn-xs" onclick="delUser('${user.loginName!}');">
                                        <i class="icon-trash  bigger-110 icon-only"></i>
                                        删除
                                    </button>
                                </div>
                            </td>
                        </tr>
                        </#list>
                    </#if>

                    </tbody>
                </table>
            </div>
            <!-- /.table-responsive -->
        </div>
        <!-- /span -->
    </div>

    <div class="row">
        <div class="col-xs-12">
            <div class="row">
                <div class="col-sm-6">
                    <div id="dialog-confirm" class="hide">
                        <div class="row">
                            <div class="col-xs-12">

                                <form class="form-horizontal" role="form" action="/endSys/updateUser" method="post"
                                      onsubmit="return beforeUpdateUser()">

                                    <input type="hidden" id="id" name="id" placeholder="id">

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="name"> 用户昵称 </label>

                                        <div class="col-sm-9">
                                            <input type="text" id="name" name="name" placeholder="用户昵称"
                                                   class="col-xs-10 col-sm-8"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="loginName">
                                            登录账号 </label>

                                        <div class="col-sm-9">
                                            <input type="text" id="loginName" name="loginName" placeholder="登录账号"
                                                   class="col-xs-10 col-sm-8" readonly="readonly"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="password">
                                            登录密码 </label>

                                        <div class="col-sm-9">
                                            <input type="password" id="password" name="password" placeholder="登录密码"
                                                   class="col-xs-10 col-sm-8"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="duty">
                                            用户职务 </label>

                                        <div class="col-sm-9">
                                            <input type="text" id="duty" name="duty" placeholder="用户职务"
                                                   class="col-xs-10 col-sm-8">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="used"> 是否可用 </label>

                                        <div class="col-xs-3">
                                            <label>
                                            <#--<input name="used" id="used" class="ace ace-switch ace-switch-7"-->
                                            <#--type="checkbox">-->
                                            <#--<span class="lbl"></span>-->

                                                <select id="used" name="used">
                                                    <option value="true">可用</option>
                                                    <option value="false">禁用</option>
                                                </select>

                                            </label>
                                        </div>
                                    </div>

                                    <div class="clearfix form-actions">
                                        <button class="btn btn-info" type="submit">
                                            <i class="icon-ok bigger-110"></i>
                                            修改
                                        </button>

                                        &nbsp;
                                        <button class="btn" type="reset">
                                            <i class="icon-undo bigger-110"></i>
                                            清除
                                        </button>
                                    </div>

                                </form>


                            </div>
                            <!-- /span -->
                        </div>
                    </div><!-- #dialog-confirm -->
                </div>
            </div>
        </div>
    </div>
    <!-- /row -->

</div><!-- /.page-content -->

</body>

<#include "../../_inc/_footer.ftl"/>
<script src="${base}/static/js/md5.js"></script>
<script type="text/javascript">

    function getUserInfo(userLoginName) {
        $.ajax({
            type: 'GET',
            url: '${base}/endSys/getUserInfo/' + userLoginName,
            cache: false,
            dataType: 'json',
            success: function (data) {  //请求成功，http状态码为200。返回的数据已经打包在data中了。
                if (data.code === 1) {
                    document.getElementById("id").value = data.data.id;
                    document.getElementById("name").value = data.data.name;
                    document.getElementById("loginName").value = data.data.loginName;
//                    document.getElementById("password").value = data.data.password;
                    document.getElementById("duty").value = data.data.duty;
//                    document.getElementById("used").value = data.data.used;
                    $("#dialog-confirm").removeClass('hide').dialog({
                        resizable: true,
                        modal: true,
                        title: "    修改用户！",
                        title_html: true
                    });
                } else {
                    alert(data.msg);    //弹出对话框，提示返回的错误信息
                }
            }
        });
    }

    function delUser(userLoginName) {
        $.ajax({
            type: 'GET',
            url: '${base}/endSys/delUser/' + userLoginName,
            cache: false,
            dataType: 'json',
            success: function (data) {  //请求成功，http状态码为200。返回的数据已经打包在data中了。
                alert(data.msg);    //弹出对话框，提示返回的错误信息
                window.location = '${base}/endSys/userList';
            }
        });
    }

    function checkUpdateUserInfo() {
        if ("" == $("#name").val()) {
            $("#name").tips({
                side: 2,
                msg: '昵称不得为空',
                bg: '#AE81FF',
                time: 3
            });
            $("#name").focus();
            return false;
        }

        if ($("#loginName").val() == "") {
            $("#loginName").tips({
                side: 2,
                msg: '登录名称不得为空',
                bg: '#AE81FF',
                time: 3
            });
            $("#loginName").focus();
            return false;
        }
//
//        if ($("#password").val() == "") {
//            $("#password").tips({
//                side: 2,
//                msg: '登录密码不得为空',
//                bg: '#AE81FF',
//                time: 3
//            });
//            $("#password").focus();
//            return false;
//        }
        return true;
    }


    function beforeUpdateUser() {
        if (!checkUpdateUserInfo()) {
            return false;
        }

        var userpass = hex_md5($("#password").val());
        document.getElementById("password").value = userpass;
        console.info($("#password").val());
        return true;
    }


</script>

</html>