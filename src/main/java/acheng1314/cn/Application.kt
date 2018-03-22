package acheng1314.cn


import com.baomidou.mybatisplus.plugins.PaginationInterceptor
import org.mybatis.spring.annotation.MapperScan
import org.springframework.aop.framework.autoproxy.BeanNameAutoProxyCreator
import org.springframework.boot.SpringApplication
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.ComponentScan
import org.springframework.context.annotation.Configuration
import org.springframework.transaction.PlatformTransactionManager
import org.springframework.transaction.annotation.EnableTransactionManagement
import org.springframework.transaction.interceptor.TransactionInterceptor
import org.springframework.validation.beanvalidation.BeanValidationPostProcessor
import org.springframework.validation.beanvalidation.MethodValidationPostProcessor
import org.springframework.web.servlet.config.annotation.EnableWebMvc
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter
import springfox.documentation.builders.ApiInfoBuilder
import springfox.documentation.builders.PathSelectors
import springfox.documentation.builders.RequestHandlerSelectors
import springfox.documentation.spi.DocumentationType
import springfox.documentation.spring.web.plugins.Docket
import springfox.documentation.swagger2.annotations.EnableSwagger2
import java.util.*


/**
 * Spring Boot 应用启动类
 *
 * @author acheng
 */
@SpringBootApplication
@EnableTransactionManagement
@MapperScan("acheng1314.cn")
@EnableWebMvc
@EnableSwagger2
@ComponentScan(basePackages = ["acheng1314.cn"])
@Configuration
class Application : WebMvcConfigurerAdapter() {

    override fun addResourceHandlers(registry: ResourceHandlerRegistry) {
        registry.addResourceHandler("swagger-ui.html")
                .addResourceLocations("classpath:/META-INF/resources/")
        registry.addResourceHandler("doc.html")
                .addResourceLocations("classpath:/META-INF/resources/")

        registry.addResourceHandler("/webjars/**")
                .addResourceLocations("classpath:/META-INF/resources/webjars/")

        registry.addResourceHandler("/static/**")
                .addResourceLocations("classpath:/static/")
    }

    @Bean(name = ["transactionInterceptor"])
    fun transactionInterceptor(
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
    fun transactionAutoProxy(): BeanNameAutoProxyCreator {
        val transactionAutoProxy = BeanNameAutoProxyCreator()
        transactionAutoProxy.isProxyTargetClass = true
        transactionAutoProxy.setBeanNames("acheng1314.cn.service.*ServiceImpl.*(..)")
        transactionAutoProxy.setInterceptorNames("transactionInterceptor")
        return transactionAutoProxy
    }

    val SWAGGER_SCAN_BASE_PACKAGE = "acheng1314.cn.controller.api"
    @Bean(name = ["defaultApi"])
    fun createRestApi(): Docket {
        return Docket(DocumentationType.SWAGGER_2)  //Docket，Springfox的私有API设置初始化为Swagger2
                .select()
                .apis(RequestHandlerSelectors.basePackage(SWAGGER_SCAN_BASE_PACKAGE))
                .paths(PathSelectors.any())
                .build()
//                .pathMapping(null)
                .apiInfo(ApiInfoBuilder()   //设置API文档的主体说明
                        .title("acheng的SpringBoot探索之路ApiDocs")
                        .description("acheng的SpringBoot探索之路")
                        .version("v1.01")
                        .termsOfServiceUrl("http://acheng1314.cn/")
                        .build())
                .groupName("默认接口")
    }

    /**
     * 分页插件
     */
    @Bean
    fun paginationInterceptor() = PaginationInterceptor()


    @Bean
    fun methodValidationPostProcessor() = MethodValidationPostProcessor()

    companion object {

        @JvmStatic
        fun main(args: Array<String>) {
            // 程序启动入口
            // 启动嵌入式的 Tomcat 并初始化 Spring 环境及其各 Spring 组件
            SpringApplication.run(Application::class.java, *args)
        }
    }
}
