package acheng1314.cn.controller.endWeb


import acheng1314.cn.domain.ResponseCode
import acheng1314.cn.domain.User
import acheng1314.cn.service.UserServiceImpl
import acheng1314.cn.util.GsonUtil
import acheng1314.cn.util.StringUtils
import io.swagger.annotations.Api
import io.swagger.annotations.ApiOperation
import io.swagger.annotations.ApiParam
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.MediaType
import org.springframework.stereotype.Controller
import org.springframework.ui.ModelMap
import org.springframework.web.bind.annotation.*

@Controller
@RequestMapping("/endSys")
@Api(description = "用户控制器，控制后台访问用户信息相关")
class SysUserController {

    @Autowired
    private val userService: UserServiceImpl? = null

    @GetMapping(value = ["/userList"], produces = [(MediaType.TEXT_HTML_VALUE)])
    fun userList(@ApiParam(hidden = true) map: ModelMap): String {
        val users = userService!!.selectList()
        map.addAttribute("users", users)
        return "end/user/userList"
    }

    @GetMapping(value = ["/addUser"], produces = [(MediaType.TEXT_HTML_VALUE)])
    fun addUser(): String {
        return "end/user/addUser"
    }

    @PostMapping(path = ["/addUser"], produces = [(MediaType.TEXT_HTML_VALUE)])
    @ApiOperation(value = "添加用户", notes = "添加用户")
    fun addUser(user: User, @ApiParam(hidden = true) map: ModelMap): Any {
        try {
            userService!!.addOneUser(user)
            map.addAttribute("msg", "添加用户成功！")
        } catch (e: Exception) {
            e.printStackTrace()
            map.addAttribute("msg", "添加用户失败！原因：" + e.message)
        }

        return "end/user/addUser"
    }

    @PostMapping(path = ["/updateUser"], produces = [(MediaType.TEXT_HTML_VALUE)])
    @ApiOperation(value = "更新用户", notes = "根据ID更新用户")
    fun updateUser(user: User, @ApiParam(hidden = true) map: ModelMap): String {
        if (null == user.loginName || StringUtils.isEmpty(user.loginName))
            map.addAttribute("msg", "更新用户失败！原因：用户登录ID不能为空")
        try {
            userService!!.updateUser(user)
            map.addAttribute("msg", "更新用户成功！")
        } catch (e: Exception) {
            e.printStackTrace()
            map.addAttribute("msg", "更新用户失败！原因" + e.message)
        }

        return userList(map)
    }

    @GetMapping(path = ["/delUser/{loginName}"], produces = [(MediaType.APPLICATION_JSON_UTF8_VALUE)])
    @ApiOperation(value = "删除用户", notes = "根据登录名禁用用户")
    @ResponseBody
    fun delUser(@PathVariable("loginName") loginName: String): Any {
        try {
            userService!!.delUser(loginName)
            return GsonUtil.toJsonObjStr(null, ResponseCode.OK, "禁用用户成功！")
        } catch (e: Exception) {
            e.printStackTrace()
            return GsonUtil.toJsonObjStr(null, ResponseCode.FAILED, "禁用用户失败！原因：" + e.message)
        }

    }

    @GetMapping(path = ["/getUserInfo/{loginName}"], produces = [(MediaType.APPLICATION_JSON_UTF8_VALUE)])
    @ApiOperation(value = "查找用户", notes = "根据登录名查找用户")
    @ResponseBody
    fun getUserInfo(@PathVariable("loginName") loginName: String): Any {
        try {
            val oneByLoginName = userService!!.findOneByLoginName(loginName)
            return GsonUtil.toJsonObjStr(oneByLoginName, ResponseCode.OK, "查找用户成功！")
        } catch (e: Exception) {
            e.printStackTrace()
            return GsonUtil.toJsonObjStr(null, ResponseCode.FAILED, "查找用户失败！原因：" + e.message)
        }

    }

}
