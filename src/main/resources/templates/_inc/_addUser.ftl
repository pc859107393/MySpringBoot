<script type="text/javascript">
    function checkAddUserInfo() {
        if ("" == $("#tel").val()) {
            $("#tel").tips({
                side: 2,
                msg: '手机号不得为空',
                bg: '#AE81FF',
                time: 3
            });
            $("#tel").focus();
            return false;
        }

        if ($("#name").val() == "") {
            $("#name").tips({
                side: 2,
                msg: '姓名',
                bg: '#AE81FF',
                time: 3
            });
            $("#name").focus();
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