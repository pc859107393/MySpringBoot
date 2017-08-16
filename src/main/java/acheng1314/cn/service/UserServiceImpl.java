package acheng1314.cn.service;

import acheng1314.cn.dao.UserDao;
import acheng1314.cn.domain.User;
import acheng1314.cn.util.CipherUtils;
import acheng1314.cn.util.DateUtil;
import acheng1314.cn.util.EncryptUtils;
import acheng1314.cn.util.StringUtils;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * Created by pc on 2017/8/11.
 */
@Service("userService")
@Aspect
//@Pointcut()
public class UserServiceImpl extends ServiceImpl<UserDao, User> {

    //    @Transactional
    public void addOneUser(User entity) throws Exception {
        if (StringUtils.isEmpty(entity.getLoginName(), entity.getPassword()))
            throw new Exception("用户名或密码不能为空！");
        //创建插入时间
        Integer createTime = DateUtil.getIntTime();
        entity.setCreateDate(createTime);
        //MD5密码加盐后再sha256加密
        entity.setPassword(EncryptUtils.encryptPassword(entity.getPassword()
                , createTime.toString()));
        baseMapper.addUser(entity);
    }
}
