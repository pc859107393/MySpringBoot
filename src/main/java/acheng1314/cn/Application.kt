package acheng1314.cn


import org.mybatis.spring.annotation.MapperScan
import org.springframework.aop.framework.autoproxy.BeanNameAutoProxyCreator
import org.springframework.boot.SpringApplication
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Import
import org.springframework.transaction.PlatformTransactionManager
import org.springframework.transaction.interceptor.TransactionInterceptor
import org.springframework.web.servlet.config.annotation.EnableWebMvc
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter

import java.util.Properties

/**
 * Spring Boot 应用启动类
 *
 * @author acheng
 */
@SpringBootApplication
@MapperScan("acheng1314.cn")
@EnableWebMvc
@Import(SwaggerConfiguration::class)
open class Application : WebMvcConfigurerAdapter() {

    override fun addResourceHandlers(registry: ResourceHandlerRegistry) {
        registry.addResourceHandler("swagger-ui.html")
                .addResourceLocations("classpath:/META-INF/resources/")

        registry.addResourceHandler("/webjars/**")
                .addResourceLocations("classpath:/META-INF/resources/webjars/")

        registry.addResourceHandler("/static/**")
                .addResourceLocations("classpath:/static/")
    }

    @Bean(name = ["transactionInterceptor"])
    open fun transactionInterceptor(
            platformTransactionManager: PlatformTransactionManager): TransactionInterceptor {
        val transactionInterceptor = TransactionInterceptor()
        // 事物管理器
        transactionInterceptor.transactionManager = platformTransactionManager
        val transactionAttributes = Properties()

        // 新增
        transactionAttributes.setProperty("insert*",
                "PROPAGATION_REQUIRED,-Throwable")
        transactionAttributes.setProperty("add*",
                "PROPAGATION_REQUIRED,-Throwable")
        // 修改

        transactionAttributes.setProperty("update*",
                "PROPAGATION_REQUIRED,-Throwable")
        // 删除
        transactionAttributes.setProperty("delete*",
                "PROPAGATION_REQUIRED,-Throwable")
        //查询
        transactionAttributes.setProperty("select*",
                "PROPAGATION_REQUIRED,-Throwable,readOnly")
        transactionAttributes.setProperty("find*",
                "PROPAGATION_REQUIRED,-Throwable,readOnly")
        transactionAttributes.setProperty("get*",
                "PROPAGATION_REQUIRED,-Throwable,readOnly")

        transactionInterceptor.setTransactionAttributes(transactionAttributes)
        return transactionInterceptor
    }

    //代理到ServiceImpl的Bean
    @Bean
    open fun transactionAutoProxy(): BeanNameAutoProxyCreator {
        val transactionAutoProxy = BeanNameAutoProxyCreator()
        transactionAutoProxy.isProxyTargetClass = true
        transactionAutoProxy.setBeanNames("acheng1314.cn.service.*ServiceImpl.*(..)")
        transactionAutoProxy.setInterceptorNames("transactionInterceptor")
        return transactionAutoProxy
    }

    companion object {

        @JvmStatic
        fun main(args: Array<String>) {
            // 程序启动入口
            // 启动嵌入式的 Tomcat 并初始化 Spring 环境及其各 Spring 组件
            SpringApplication.run(Application::class.java, *args)
        }
    }
}
