package acheng1314.cn.service;

import acheng1314.cn.BaseTest;
import acheng1314.cn.domain.User;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.*;

public class UserServiceImplTest extends BaseTest {
    @Autowired
    private UserServiceImpl userService;

    @Test
    public void addOneUser() throws Exception {
        User u = new User("qqq", "9564564110", "asdasd", "zxczxcz", 10001);
        userService.addOneUser(u);
        System.out.println(u.getId() + "\n" + u.toString());
    }

}