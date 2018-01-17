package acheng1314.cn.service


import acheng1314.cn.dao.UserDao
import acheng1314.cn.domain.User
import acheng1314.cn.exception.EnterInfoErrorException
import acheng1314.cn.exception.NotFoundException
import acheng1314.cn.util.DateUtil
import acheng1314.cn.util.EncryptUtils
import acheng1314.cn.util.LogE
import acheng1314.cn.util.StringUtils
import com.baomidou.mybatisplus.service.impl.ServiceImpl
import org.aspectj.lang.annotation.Aspect
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional


/**
 * Created by pc on 2017/8/11.
 */
@Service("userService")
@Aspect
open class UserServiceImpl : ServiceImpl<UserDao, User>() {

    @Transactional
    @Throws(Exception::class)
    open fun addOneUser(entity: User) {
        if (StringUtils.isEmpty(entity.loginName, entity.password))
            throw Exception("用户名或密码不能为空！")
        //创建插入时间
        val createTime = DateUtil.getIntTime()
        entity.createDate = createTime
        //MD5密码加盐后再sha256加密
        entity.password = EncryptUtils.encryptPassword(entity.password!!.toLowerCase(), createTime!!.toString())
        entity.isUsed = true   //默认可用
        baseMapper.addUser(entity)
    }

    @Transactional
    @Throws(EnterInfoErrorException::class, NotFoundException::class)
    open fun login(userLogin: String, userPass: String): User {
        var userPass = userPass
        if (StringUtils.isEmpty(userLogin) || StringUtils.isEmpty(userPass)) {
            throw EnterInfoErrorException("用户名和密码不能为空！请检查！")
        }
        var result: User? = null
        result = findOneById(userLogin)
        if (null == result) throw NotFoundException("用户未找到！")
        else LogE.getInstance(this.javaClass).logOutLittle("用户：" + result.toString())
        if (!result.isUsed) throw EnterInfoErrorException("用户禁止登陆！")
        try {
            userPass = userPass.toLowerCase()  //将大写md5转换为小写md5
            if (userPass.length > 16 && userPass.length == 32) {    //32位小写转换为16位小写
                userPass = userPass.substring(8, 24).toLowerCase()
            }
        } catch (e: Exception) {
            e.printStackTrace()
            throw EnterInfoErrorException("密码错误！")
        }

        val encryptPassword = EncryptUtils.encryptPassword(userPass, result.createDate!!.toString())

        if (encryptPassword != result.password) {
            throw EnterInfoErrorException("用户名和密码不匹配！")
        }
        return result
    }

    @Transactional
    open fun findOneById(userLogin: String): User? {
        return baseMapper.findOneByKey(userLogin)
    }

    fun selectList(): List<User>? {
        return baseMapper.findAll()
    }

    fun delUser(loginName: String) {
        baseMapper.delUser(loginName)
    }

    fun findOneByLoginName(loginName: String): User? {
        return baseMapper.findOneByKey(loginName)
    }

    @Transactional
    @Throws(Exception::class)
    open fun updateUser(user: User) {
        val tmpSwap = findOneByLoginName(user.loginName!!)
        if (tmpSwap != null) {
            var notDo = 0
            //交换昵称
            if (!StringUtils.isEmpty(user.name) || tmpSwap.name != user.name)
                tmpSwap.name = user.name
            else
                notDo++
            //交换职务
            if (!StringUtils.isEmpty(user.duty) || tmpSwap.duty != user.duty)
                tmpSwap.duty = user.duty
            else
                notDo++
            //交换密码
            if (!StringUtils.isEmpty(user.password)) {
                //32位小写转换为16位小写
                if (user.password!!.length > 16 && user.password!!.length == 32) {
                    user.password = user.password!!
                            .substring(8, 24)
                            .toLowerCase()
                }
                tmpSwap.password = EncryptUtils.encryptPassword(user.password!!.toLowerCase(), tmpSwap.createDate!!.toString())
            } else
                notDo++
            //交换可否使用
            if (user.isUsed == tmpSwap.isUsed) notDo++

            if (notDo == 4) throw Exception("什么都没做！不需要更新哦！")

            tmpSwap.isUsed = user.isUsed

            baseMapper.updateById(tmpSwap)
        }

    }
}
