package acheng1314.cn;

import org.springframework.context.annotation.Bean;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@EnableSwagger2
public class SwaggerConfiguration {
    @Bean
    public Docket createRestApi() {
        return new Docket(DocumentationType.SWAGGER_2)  //Docket，Springfox的私有API设置初始化为Swagger2
                .select()
                .paths(PathSelectors.any())
                .build()
                .apiInfo(new ApiInfoBuilder()   //设置API文档的主体说明
                        .title("acheng的SpringBoot探索之路ApiDocs")
                        .description("acheng的SpringBoot探索之路")
                        .version("v1.01")
                        .termsOfServiceUrl("http://acheng1314.cn/")
                        .build());

    }
}
