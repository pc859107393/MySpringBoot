package acheng1314.cn.shiro;

import acheng1314.cn.domain.Duty;
import acheng1314.cn.domain.User;
import acheng1314.cn.service.DutyServiceImpl;
import acheng1314.cn.service.UserServiceImpl;
import acheng1314.cn.util.LogE;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;


/**
 * created by 程 2016/11/25
 */
public class ShiroRealm extends AuthorizingRealm {

    @Autowired
    private UserServiceImpl userService;

    @Autowired
    private DutyServiceImpl dutyService;

    /*
     * 登录信息和用户验证信息验证(non-Javadoc)
     * @see org.apache.shiro.realm.AuthenticatingRealm#doGetAuthenticationInfo(org.apache.shiro.authc.AuthenticationToken)
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        UsernamePasswordToken user = (UsernamePasswordToken) token;
        LogE.getInstance(ShiroRealm.class).logOutLittle("开始登录====>\n用户为：" + user.getUsername());

        String userLogin = user.getUsername();
        char[] password = user.getPassword();

        User loginResult = null;
        try {
            loginResult = userService.login(userLogin, new String(password));
        } catch (Exception e) {
            e.printStackTrace();
            LogE.getInstance(ShiroRealm.class).logOutLittle("登录异常结束====>\n用户为：" + user.getUsername());
            throw new AuthenticationException(e.getMessage());
        }
        LogE.getInstance(ShiroRealm.class).logOutLittle("登录成功====>\n用户为：" + user.getUsername());
        return new SimpleAuthenticationInfo(loginResult, user.getPassword(), this.getName());
//        User result4Find;
//
//        try {
//            result4Find = userService.findOneById(userLogin);
//        } catch (NotFoundException e) {
//            throw new AuthenticationException(e.getMessage());
//        }
//        return new SimpleAuthenticationInfo(result4Find, result4Find.getUserPass(), this.getName());

    }

    /*
     * 授权查询回调函数, 进行鉴权但缓存中无用户的授权信息时调用,负责在应用程序中决定用户的访问控制的方法(non-Javadoc)
     * @see org.apache.shiro.realm.AuthorizingRealm#doGetAuthorizationInfo(org.apache.shiro.subject.PrincipalCollection)
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection pc) {
        List<Duty> duties = dutyService.selectAll();
        ArrayList<String> dutyResult = new ArrayList<>();
        duties.forEach(duty -> dutyResult.add(duty.getTitle()));

        SimpleAuthorizationInfo perList = new SimpleAuthorizationInfo();
        perList.addStringPermissions(dutyResult);
        return perList;
    }

}
