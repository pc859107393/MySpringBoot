#### 说明

项目采用SpringBoot整合，预期为下：

- springboot
- springMvc
- mybatis
- Druid
- redis+mysql

----

本项目github仓库：https://github.com/pc859107393/MySpringBoot.git

本项目国内码云仓库：https://git.oschina.net/859107393/MySpringBoot.git

----

本系列为连载文章。当然如果你没有spring基础，建议你先看看[我的java手把手教程](http://acheng1314.cn/front/postMap/%E6%89%8B%E6%8A%8A%E6%89%8B)

----

> 17-09-02

增加了页面的基本路径.

```
<#assign base=request.contextPath />

//freemarker 处理null对象
${goods.id!}
```

> 17-08-31

在框架中加入了shiro控制，在[登录登出](https://github.com/pc859107393/MySpringBoot/blob/master/src/main/java/acheng1314/cn/controller/MainController.java)中完全使用了shiro控制。

同时，我们可以在任意地方使用Shiro提供的session、Request和response。

在后台页面中，我们使用了多tab切换技术，引入了[tab控制器](https://github.com/pc859107393/MySpringBoot/blob/master/src/main/resources/templates/tab.ftl)这个页面是具体的写法，用法请参照后端主页。

本次设置了上传文件大小为1G。

> 17-08-16

acheng 整合基本框架，springboot+mybatis+mvc+mybatis plus+springbootFreemarker,暂时无有加入缓存控制，同时值得注意的是一些细节骚操作.

1.@SuppressWarnings("unchecked")

2.gradle构建命令中的check添加参数：-s -i -x test --debug，完整输出检查日志的同时规避test

3.同时其他的相关的检测工具中都可以使用 -x test屏蔽Test相关的检测

![gradle构建细节骚操作](http://acheng1314.cn/static/uploadFiles/20170816/59f2402d73fe4e37a7d763ab6b9c51ef.png)

有兴趣交流springboot进行快速开发的同学可以加一下下面的企鹅群。

![行走的java全栈](https://acheng1314.cn/wp-content/uploads/2016/10/行走的java全栈群二维码.png)

如果你认可我所做的事情，并且认为我做的事对你有一定的帮助，希望你也能打赏我一杯咖啡，谢谢。

![支付宝捐赠](http://acheng1314.cn:80/static/uploadFiles/20170803/342f888f1ae842aa90041e492f82890e.jpg)

