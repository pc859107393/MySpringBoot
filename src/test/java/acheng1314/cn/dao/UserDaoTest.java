package acheng1314.cn.dao;

import acheng1314.cn.BaseTest;
import acheng1314.cn.domain.User;
import acheng1314.cn.util.CipherUtils;
import acheng1314.cn.util.DateUtil;
import acheng1314.cn.util.EncryptUtils;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class UserDaoTest extends BaseTest {
    @Autowired
    private UserDao userDao;

    @Test
    public void findAll() {
        List<acheng1314.cn.domain.User> all = userDao.findAll();
        all.forEach(user -> loge(user.toString()));
    }

    @Test
    public void findOneByKey() {
        acheng1314.cn.domain.User user = userDao.findOneByKey("pc859107393");
        loge(user.toString());
    }

    @Test
    public void delUser() {
        userDao.delUser("pc859107393");
        loge(userDao.findOneByKey("pc859107393").toString());
    }

    @Test
    public void addUser() {
        String password = EncryptUtils.encryptPassword(CipherUtils.small32md5("laopo5201314")
                , "");
        loge(password);
        User user = new acheng1314.cn.domain.User();
        user.setSex("男");
        user.setTel("18889408337");
        user.setName("系统管理员");
        user.setDuty("1|2|3");
        user.setType("admin");
        user.setPassword("laopo5201314");
        loge(user.toString());
        userDao.addUser(user);
        loge(user.toString());
    }

    @Test
    public void selectNotUsed() {
        for (User user : userDao.selectNotUsed()) {
            loge(user.toString());
        }
    }
}