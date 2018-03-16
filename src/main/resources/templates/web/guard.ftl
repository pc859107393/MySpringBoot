<#assign base=request.contextPath />
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>我们的保障</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, initial-scale=1,maximum-scale=1.0, user-scalable=0,user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>

    <link rel="alternate icon" type="img/hengwang-1.png" href="../../static/web/img/hengwang-1.png">
    <link rel="stylesheet" href="../../static/web/css/amazeui.css"/>
    <link rel="stylesheet" href="../../static/web/css/style.css"/>
</head>


<body>
<header class="am-topbar header">
    <div class="am-container-1">
        <div class="left hw-logo">
            <img class=" logo" src="../../static/web/img/HENGWANG.png"/>
            <img class="word" src="../../static/web/img/hw-word.png"/>
        </div>
        <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only"
                data-am-collapse="{target: '#doc-topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span
                class="am-icon-bars"></span></button>

        <div class="am-collapse am-topbar-collapse right" id="doc-topbar-collapse">


            <div class=" am-topbar-left am-form-inline am-topbar-right" role="search">
                <ul class="am-nav am-nav-pills am-topbar-nav hw-menu">
                    <li class="hw-menu-active"><a href="${base}">首页</a></li>
                    <li><a href="solutions.html">登录/注册</a></li>
                    <li><a href="product-show.html">成为房东 </a></li>
                    <li><a href="customer-case.html">微信小程序</a></li>
                    <li><a href="service-center.html">成为房东</a></li>
                    <li><a href="about-us.html">关于我们</a></li>
                </ul>
            </div>

        </div>
    </div>
</header>
<#if guard?exists>
<div class=" am-container-1">
    <div class="part-title part-title-mar">
        <a href="customer-case.html">
            <i class=" am-icon-paper-plane part-title-i"></i>
            <span class="part-title-span">关于${guard.title!}</span>
        </a>
    </div>
    <div class="company-intro">
        ${guard.content!}
    </div>
</div>
<div class="gray-li company-thought-all">
    <div class="am-container-1">
        <ul class="company-thought">
            <#list guard.description ?split(",") as name>
            <li>
                <div class="thought-all">
                    <i class="am-icon-hand-o-right"></i>
                    <span>${name!}</span>
                    <div class="thought-all-none">
                        <h5>${name!}</h5>
                    </div>
                </div>
            </li>
            </#list>
            <#list guard.cover ?split(",") as name>
            <li>
                <div class="thought-all">
                    <div class="cam-u-lg-3 am-u-md-3 am-u-sm-6">
                        <img src="${name!}"/>
                    </div>
                </div>
            </li>
            </#list>
            <div class="clear"></div>
        </ul>
    </div>
</div>

</#if>

<div class=" am-container-1">
    <div class="part-title part-title-mar">
        <a href="customer-case.html">
            <i class=" am-icon-comments-o part-title-i"></i>
            <span class="part-title-span">联系我们</span>
            <p>Contact Us</p>
        </a>
    </div>
</div>
<div class="gray-li">
    <div class=" am-container-1">
        <div class="contact-us">
            <div class="am-u-lg-6 am-u-md-6 am-u-sm-12">
                <img src="img/map.png"/>
            </div>
            <div class="am-u-lg-6 am-u-md-6 am-u-sm-12">
                <ul class="contact-add">
                    <li>
                        <div><i class=" am-icon-map-marker"></i><span class="contact-add-1">海南省三亚市金鸡岭街四号</span>
                        </div>
                    </li>
                    <li>
                        <div><i class=" am-icon-mobile mobile"></i><span>18089818940</span></div>
                    </li>
                    <li>
                        <div><i class=" am-icon-envelope-o"></i><span>859107393@qq.com</span></div>
                    </li>
                </ul>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>
<footer class="footer ">
    <ul>
        <li class="am-u-lg-4 am-u-md-4 am-u-sm-12 ">
            <div class="part-5-title">相关链接</div>
            <div class="part-5-words2">
                <ul class="part-5-words2-ul">
                    <li class="am-u-lg-4 am-u-md-6 am-u-sm-4"><a href="solutions.html">解决方案</a></li>
                    <li class="am-u-lg-4 am-u-md-6 am-u-sm-4"><a href="product-show.html">产品展示</a></li>
                    <li class="am-u-lg-4 am-u-md-6 am-u-sm-4"><a href="customer-case.html">客户案例</a></li>
                    <li class="am-u-lg-4 am-u-md-6 am-u-sm-4"><a href="service-center.html">服务中心</a></li>
                    <li class="am-u-lg-4 am-u-md-6 am-u-sm-4"><a href="about-us.html">关于我们</a></li>
                    <li class="am-u-lg-4 am-u-md-6 am-u-sm-4"><a href="recruit.html">招贤纳士</a></li>
                    <div class="clear"></div>
                </ul>
            </div>
        </li>
        <div class="clear"></div>
    </ul>

</footer>


</body>
<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="../../static/web/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="../../static/web/js/jquery.min.js"></script>
<!--<![endif]-->
<script src="../../static/web/js/amazeui.min.js"></script>
<script src="../../static/web/js/scroll.js"></script>
<script type="text/javascript">

</script>
</html>