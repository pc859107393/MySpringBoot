<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="utf-8"/>
    <title>可能发生了错误</title>
    <meta name="keywords" content="Bootstrap"/>
    <meta name="description" content="ace-admin"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <!-- basic styles -->

    <link href="./static/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="./static/css/font-awesome.min.css"/>

    <!--[if IE 7]>
    <link rel="stylesheet" href="./static/css/font-awesome-ie7.min.css"/>
    <![endif]-->

    <!-- page specific plugin styles -->

    <!-- fonts -->

<#--<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300"/>-->

    <!-- ace styles -->

    <link rel="stylesheet" href="./static/css/ace.min.css"/>
    <link rel="stylesheet" href="./static/css/ace-rtl.min.css"/>

    <!--[if lte IE 8]>
    <link rel="stylesheet" href="./static/css/ace-ie.min.css"/>
    <![endif]-->

    <!-- inline styles related to this page -->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

    <!--[if lt IE 9]>
    <script src="./static/js/html5shiv.js"></script>
    <script src="./static/js/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="row">
    <div class="col-xs-12">
        <!-- PAGE CONTENT BEGINS -->

        <div class="error-container">
            <div class="well">
                <h1 class="grey lighter smaller">
											<span class="blue bigger-125">
												<i class="ace-icon fa fa-random"></i>
												500
											</span>
                    可能在这里发生了错误！
                </h1>

                <hr>
                <h3 class="lighter smaller">
                    但是我希望他是正常工作的！

                </h3>

                <div class="space"></div>

                <div>
                    <h4 class="lighter smaller">或许，你需要返回上一页！</h4>

                    <ul class="list-unstyled spaced inline bigger-110 margin-15">
                        <li>
                            <i class="ace-icon fa fa-hand-o-right blue"></i>
                        <#if url?exists>
                        ${url}
                        </#if>
                        </li>

                        <li>
                            <i class="ace-icon fa fa-hand-o-right blue"></i>
                        <#if exception?exists>
                        ${exception}
                        </#if>
                        </li>
                    </ul>
                </div>

                <hr>
                <div class="space"></div>

                <div class="center">
                    <a href="javascript:history.back()" class="btn btn-grey">
                        <i class="ace-icon fa fa-arrow-left"></i>
                        Go Back
                    </a>

                <#--<a href="#" class="btn btn-primary">-->
                <#--<i class="ace-icon fa fa-tachometer"></i>-->
                <#--Dashboard-->
                <#--</a>-->
                </div>
            </div>
        </div>

        <!-- PAGE CONTENT ENDS -->
    </div><!-- /.col -->
</div>
</body>

<!-- basic scripts -->

<!--[if !IE]> -->

<script src="./static/js/jquery_2_0_3.min.js"></script>

<!-- <![endif]-->

<!--[if IE]>
<script src="./static/js/jquery_1_10_2.min.js"></script>
<![endif]-->

<!--[if !IE]> -->

<script type="text/javascript">
    window.jQuery || document.write("<script src='./static/js/jquery-2.0.3.min.js'>" + "<" + "/script>");
</script>

<!-- <![endif]-->

<!--[if IE]>
<script type="text/javascript">
    window.jQuery || document.write("<script src='./static/js/jquery-1.10.2.min.js'>" + "<" + "/script>");
</script>
<![endif]-->

<script type="text/javascript">
    if ("ontouchend" in document) document.write("<script src='./static/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
</script>
</html>