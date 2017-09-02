
<script type="text/javascript">
    function checkAddGoodsInfo() {
        if ("" == $("#name").val()) {
            $("#name").tips({
                side: 2,
                msg: '商品名不得为空',
                bg: '#AE81FF',
                time: 3
            });
            $("#name").focus();
            return false;
        }

        if ($("#code").val() == "") {
            $("#code").tips({
                side: 2,
                msg: '编码不得为空',
                bg: '#AE81FF',
                time: 3
            });
            $("#code").focus();
            return false;
        }
        return true;
    }

</script>