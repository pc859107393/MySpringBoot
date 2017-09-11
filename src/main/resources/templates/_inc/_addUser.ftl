<script type="text/javascript">
    function checkAddUserInfo() {
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

        if ($("#password").val() == "") {
            $("#password").tips({
                side: 2,
                msg: '登录密码不得为空',
                bg: '#AE81FF',
                time: 3
            });
            $("#password").focus();
            return false;
        }

        return true;
    }

</script>