<!DOCTYPE html>

<html>

<head>
    <meta charset="utf-8"/>
    <title>可能发生了错误</title>
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
</html>