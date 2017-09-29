package acheng1314.cn;

import acheng1314.cn.shiro.MyCredentialsMatcher;
import acheng1314.cn.shiro.ShiroRealm;
import org.apache.shiro.mgt.DefaultSecurityManager;
import org.apache.shiro.session.mgt.ExecutorServiceSessionValidationScheduler;
import org.apache.shiro.session.mgt.SessionManager;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.servlet.Cookie;
import org.apache.shiro.web.servlet.SimpleCookie;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.LinkedHashMap;
import java.util.Map;

@Configuration
public class ShiroConfig {

    @Bean
    public ShiroRealm realm() {
        ShiroRealm myShiroRealm = new ShiroRealm();
        MyCredentialsMatcher matcher = new MyCredentialsMatcher();
        myShiroRealm.setCredentialsMatcher(matcher); //设置解密规则
        return myShiroRealm;
    }


    //SecurityManager 是 Shiro 架构的核心，通过它来链接Realm和用户(文档中称之为Subject.)
    @Bean
    public DefaultSecurityManager securityManager() {
        DefaultSecurityManager securityManager = new DefaultWebSecurityManager();
        securityManager.setRealm(realm()); //将Realm注入到SecurityManager中。

        DefaultWebSessionManager sessionManager = new DefaultWebSessionManager();
        sessionManager.setGlobalSessionTimeout(1800000);   //默认三十分钟

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

        securityManager.setSessionManager(sessionManager);    //此处已经自动持有DefaultWebSessionManager

        return securityManager;
    }

    @Bean
    public ShiroFilterFactoryBean shiroFilterFactoryBean(DefaultSecurityManager securityManager) {

        ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
        shiroFilterFactoryBean.setSecurityManager(securityManager);

        Map<String, String> filterChainDefinitionMap = new LinkedHashMap<>();
        filterChainDefinitionMap.put("/logout", "logout");
        filterChainDefinitionMap.put("/favicon.ico", "anon");
        filterChainDefinitionMap.put("/static/*/**", "anon");

        //authc表示需要验证身份才能访问，还有一些比如anon表示不需要验证身份就能访问等。
        filterChainDefinitionMap.put("/druid/*/**", "authc");
        filterChainDefinitionMap.put("/endSys/*/**", "authc");
        filterChainDefinitionMap.put("/swagger*/**", "authc");


        shiroFilterFactoryBean.setLoginUrl("/login");
        shiroFilterFactoryBean.setSuccessUrl("/endSys/index");
//        shiroFilterFactoryBean.setUnauthorizedUrl("/403"); //这里设置403并不会起作用，参考http://www.jianshu.com/p/e03f5b54838c

        shiroFilterFactoryBean.setFilterChainDefinitionMap(filterChainDefinitionMap);
        return shiroFilterFactoryBean;
    }

}
