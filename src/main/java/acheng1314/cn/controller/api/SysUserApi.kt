package acheng1314.cn.controller.api


import acheng1314.cn.domain.ResponseCode
import acheng1314.cn.exception.NotFoundException
import acheng1314.cn.service.UserServiceImpl
import acheng1314.cn.util.GsonUtil
import io.swagger.annotations.Api
import io.swagger.annotations.ApiOperation
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.MediaType
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.ResponseBody
import org.springframework.web.bind.annotation.RestController
import javax.annotation.Resource

@Api(description = "后台获取用户信息的API接口，需要用户登录权限！")
@RestController
@RequestMapping("/endSys/api/user")
open class SysUserApi {

    @Autowired
    private lateinit var userService: UserServiceImpl

    val goodsList: Any
        @ApiOperation(value = "获取用户信息的集合", notes = "用户信息分页查询")
        @GetMapping(value = ["/all"], produces = [(MediaType.APPLICATION_JSON_UTF8_VALUE)])
        @ResponseBody
        get() {
            return try {
                val userList = userService.selectList()
                if (userList != null) {
                    if (userList.isNotEmpty())
                        GsonUtil.toJsonObjStr(userList, ResponseCode.OK, "获取数据成功!")
                    else
                        GsonUtil.toJsonObjStr(null, ResponseCode.EMPTY, null)
                } else throw NotFoundException("出现问题了？！！！")
            } catch (e: Exception) {
                e.printStackTrace()
                GsonUtil.toJsonObjStr(null, ResponseCode.EMPTY, e.message!!)
            }
        }


}
