package acheng1314.cn.service;

import acheng1314.cn.BaseTest;
import acheng1314.cn.domain.User;
import acheng1314.cn.exception.EnterInfoErrorException;
import acheng1314.cn.exception.NotFoundException;
import acheng1314.cn.util.CipherUtils;
import acheng1314.cn.util.DateUtil;
import acheng1314.cn.util.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.*;

public class UserServiceImplTest extends BaseTest {
    @Autowired
    private UserServiceImpl userService;

    @Test
    public void addOneUser() throws Exception {
        User u = new User("程打野", "pc859107393", "laopo5201314", "admin", DateUtil.getIntTime());
        u.setPassword(CipherUtils.small16md5(u.getPassword()));
        System.out.println(u.getId() + "\n" + u.toString() + "\n" + CipherUtils.small16md5("laopo5201314"));
        userService.addOneUser(u);
    }

    @Test
    public void login() {
        try {
            User user = userService.login("9564564110", "asdasd");
            loge(user.toString());
        } catch (EnterInfoErrorException | NotFoundException e) {
            e.printStackTrace();
            loge(e.getMessage());
        }

        //1.得到Subject
        Subject subject = SecurityUtils.getSubject();
        //2.调用登录方法
        UsernamePasswordToken token = new UsernamePasswordToken("pc859107393", "laopo5201314");
        subject.login(token);//当这一代码执行时，就会自动跳入到AuthRealm中认证方法
        User result = (User) subject.getPrincipal();
        loge(result.toString());
    }


}