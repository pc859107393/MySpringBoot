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
    public void findAll() throws Exception {
        List<acheng1314.cn.domain.User> all = userDao.findAll();
        all.forEach(user -> loge(user.toString()));
    }

    @Test
    public void findOneByKey() throws Exception {
        acheng1314.cn.domain.User user = userDao.findOneByKey("pc859107393");
        loge(user.toString());
    }

    @Test
    public void delUser() throws Exception {
        userDao.delUser("pc859107393");
        loge(userDao.findOneByKey("pc859107393").toString());
    }

    @Test
    public void addUser() throws Exception {
        Integer time = DateUtil.INSTANCE.getIntTime();
        String password = EncryptUtils.encryptPassword(CipherUtils.small32md5("laopo5201314")
                , time.toString());
        loge(time.toString());
        User user = new acheng1314.cn.domain.User("程"
                , "pc859922"
                , password
                , "炒鸡admin"
                , time);
        loge(user.toString());
        userDao.addUser(user);
        loge(user.toString());

    }

    @Test
    public void selectNotUsed() throws Exception {
        for (User user : userDao.selectNotUsed()) {
            loge(user.toString());
        }
    }
}