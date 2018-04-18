package acheng1314.cn.shiro;

import com.jagregory.shiro.freemarker.ShiroTags;
import freemarker.template.TemplateException;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.autoconfigure.condition.ConditionalOnWebApplication;
import org.springframework.boot.autoconfigure.freemarker.FreeMarkerAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfig;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import javax.servlet.Servlet;
import java.io.IOException;

@Configuration
@ConditionalOnClass(Servlet.class)
@ConditionalOnWebApplication
public class ShiroTagFreeMarkerConfigurer extends FreeMarkerAutoConfiguration.FreeMarkerWebConfiguration {

    @Bean
    @Override
    @ConditionalOnMissingBean(FreeMarkerConfig.class)
    public FreeMarkerConfigurer freeMarkerConfigurer() {
        FreeMarkerConfigurer configurer = new ShiroTagsCon();
        applyProperties(configurer);
        return configurer;
    }

    class ShiroTagsCon extends FreeMarkerConfigurer {
        @Override
        public void afterPropertiesSet() throws IOException, TemplateException {
            super.afterPropertiesSet();
            this.getConfiguration().setSharedVariable("shiro", new ShiroTags());
            this.getConfiguration().setNumberFormat("#");
        }
    }
}
