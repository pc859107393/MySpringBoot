package acheng1314.cn

import acheng1314.cn.shiro.MyCredentialsMatcher
import acheng1314.cn.shiro.ShiroRealm
import org.apache.shiro.mgt.DefaultSecurityManager
import org.apache.shiro.spring.web.ShiroFilterFactoryBean
import org.apache.shiro.web.mgt.DefaultWebSecurityManager
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import java.util.*

@Configuration
open class ShiroConfig {

    @Bean
    open fun realm(): ShiroRealm {
        val myShiroRealm = ShiroRealm()
        val matcher = MyCredentialsMatcher()
        myShiroRealm.credentialsMatcher = matcher //设置解密规则
        return myShiroRealm
    }


    //SecurityManager 是 Shiro 架构的核心，通过它来链接Realm和用户(文档中称之为Subject.)
    @Bean
    open fun securityManager(): DefaultSecurityManager {
        val securityManager = DefaultWebSecurityManager()
        securityManager.setRealm(realm()) //将Realm注入到SecurityManager中。

        val sessionManager = DefaultWebSessionManager()
        sessionManager.globalSessionTimeout = 1800000   //默认三十分钟

        //        Cookie cookie = new SimpleCookie();     //设置cookie
        //        cookie.setName("sid");  //java默认值是JSESSIONID
        //        cookie.setDomain("acheng1314.cn");  //cookie作用域
        //        cookie.setMaxAge(1800); //cookie超时时间30分钟
        //        cookie.setHttpOnly(true);
        //
        //        sessionManager.setSessionIdCookie(cookie);
        //        sessionManager.setSessionIdCookieEnabled(true);

        //session会话验证
        //        ExecutorServiceSessionValidationScheduler sessionValidationScheduler = new ExecutorServiceSessionValidationScheduler();
        //        sessionValidationScheduler.setInterval(3600000);
        //        sessionValidationScheduler.setSessionManager(sessionManager);
        //
        //        sessionManager.setSessionValidationScheduler(sessionValidationScheduler);
        //        sessionManager.setSessionValidationSchedulerEnabled(true);

        securityManager.sessionManager = sessionManager    //此处已经自动持有DefaultWebSessionManager

        return securityManager
    }

    @Bean
    open fun shiroFilterFactoryBean(securityManager: DefaultSecurityManager): ShiroFilterFactoryBean {

        val shiroFilterFactoryBean = ShiroFilterFactoryBean()
        shiroFilterFactoryBean.securityManager = securityManager

        val filterChainDefinitionMap = LinkedHashMap<String, String>()
        filterChainDefinitionMap.put("/logout", "logout")
        filterChainDefinitionMap.put("/favicon.ico", "anon")
        filterChainDefinitionMap.put("/static/*/**", "anon")

        //authc表示需要验证身份才能访问，还有一些比如anon表示不需要验证身份就能访问等。
        filterChainDefinitionMap.put("/druid/*/**", "authc")
        filterChainDefinitionMap.put("/endSys/*/**", "authc")
        filterChainDefinitionMap.put("/swagger*/**", "authc")


        shiroFilterFactoryBean.loginUrl = "/login"
        shiroFilterFactoryBean.successUrl = "/endSys/index"
        //        shiroFilterFactoryBean.setUnauthorizedUrl("/403"); //这里设置403并不会起作用，参考http://www.jianshu.com/p/e03f5b54838c

        shiroFilterFactoryBean.filterChainDefinitionMap = filterChainDefinitionMap
        return shiroFilterFactoryBean
    }

}
