package acheng1314.cn.shiro;

import acheng1314.cn.service.UserServiceImpl;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.credential.SimpleCredentialsMatcher;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by cheng on 17/5/16.
 */
public class MyCredentialsMatcher extends SimpleCredentialsMatcher {

    @Autowired
    private UserServiceImpl userService;

    /**
     * 密码比较方法
     *
     * @param token
     * @param info
     * @return
     */
    @Override
    public boolean doCredentialsMatch(AuthenticationToken token, AuthenticationInfo info) {

//        try {
//
//            //从ShiroRealm传递过来的UsernamePasswordToken
//            UsernamePasswordToken user = (UsernamePasswordToken) token;
//            String userPass = new String(user.getPassword());
//            userPass = userPass.toLowerCase();  //将大写md5转换为小写md5
//            if (userPass.length() > 16 && userPass.length() == 32) {    //32位小写转换为16位小写
//                userPass = userPass.substring(8, 24).toLowerCase();
//            }
//
//            //取出数据库中加密的密码
//            User result4Find = (User) info.getPrincipals().asList().get(0);
//
//
//            String encryptPassword = EncryptUtils.encryptPassword(userPass, result4Find.getUserActivationKey());
//
//            return this.equals(encryptPassword, result4Find.getUserPass());
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        return super.doCredentialsMatch(token, info);
        return true;
    }
}
