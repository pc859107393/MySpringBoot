<script src="../static/js/md5.js"></script>


<script type="text/javascript">
    function show_box(id) {
        jQuery('.widget-box.visible').removeClass('visible');
        jQuery('#' + id).addClass('visible');
    }

    function checkLoginInfo() {
        if ("" == $("#user-name").val()) {
            $("#user-name").tips({
                side: 2,
                msg: '用户名不得为空',
                bg: '#AE81FF',
                time: 3
            });
            $("#user-name").focus();
            return false;
        }

        if ($("#user-pwd").val() == "") {
            $("#user-pwd").tips({
                side: 2,
                msg: '密码不得为空',
                bg: '#AE81FF',
                time: 3
            });
            $("#user-pwd").focus();
            return false;
        }
        return true;
    }

    function beforeLogin() {
        if (!checkLoginInfo()) {
            return false;
        }

        document.getElementById("user-re-pwd").value = $("#user-pwd").val();

        var username = $("#user-name").val();
        var userpass = hex_md5($("#user-pwd").val());
        document.getElementById("user-pwd").value = userpass;
        console.info($("#user-pwd").val());
        return true;
    }
</script>