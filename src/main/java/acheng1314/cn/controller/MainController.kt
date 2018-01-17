package acheng1314.cn.controller


import acheng1314.cn.domain.User
import acheng1314.cn.util.FileDownload
import acheng1314.cn.util.LogE
import acheng1314.cn.util.MySiteMap
import acheng1314.cn.util.StringUtils
import io.swagger.annotations.Api
import io.swagger.annotations.ApiOperation
import io.swagger.annotations.ApiParam
import org.apache.shiro.SecurityUtils
import org.apache.shiro.authc.UsernamePasswordToken
import org.apache.shiro.web.servlet.ShiroHttpServletRequest
import org.springframework.http.MediaType
import org.springframework.stereotype.Controller
import org.springframework.ui.ModelMap
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestParam
import java.io.IOException
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

@Controller
@Api(description = "外层信息，无需Shiro接管，集成文件下载控制器")
class MainController {

    @GetMapping(value = ["/"])
    @ApiOperation(value = "主页")
    fun home(): String {
        return apiDocs()
    }

    @GetMapping(value = ["/apiDocs"])
    @ApiOperation(value = "在线api文档")
    fun apiDocs(): String {
        return "redirect:/swagger-ui.html"
    }

    @GetMapping(value = ["login"], produces = [(MediaType.TEXT_HTML_VALUE)])
    fun login(): String {
        //如果用户已经登录跳转到系统首页
        val userInfo = SecurityUtils.getSubject().session.getAttribute("userInfo")
        return if (userInfo != null) "redirect:/endSys/index" else "login"
    }

    @PostMapping(value = ["/login"], produces = [(MediaType.TEXT_HTML_VALUE)])
    @ApiOperation(value = "/login", notes = "登录后台系统")
    fun login(@ApiParam(hidden = true) map: ModelMap,
              @ApiParam(hidden = true) request: ShiroHttpServletRequest,
              @ApiParam(value = "用户名不能为空，否则不允许登录", required = true)
              @RequestParam(value = "userLogin", required = false)
              userLogin: String,
              @ApiParam(value = "用户密码不能为空且必须为16位小写MD5，否则不允许登录", required = true)
              @RequestParam(value = "userPass", required = false)
              userPass: String): String {
        var result: User? = null
        try {
            //1.得到Subject
            val subject = SecurityUtils.getSubject()
            //2.调用登录方法
            val token = UsernamePasswordToken(userLogin, userPass)
            subject.login(token)//当这一代码执行时，就会自动跳入到AuthRealm中认证方法
            result = subject.principal as User
            subject.session.setAttribute("userInfo", result)
            return "redirect:/endSys/index"
        } catch (e: Exception) {
            e.printStackTrace()
            LogE.getInstance(this.javaClass).logOutLittle(e.message)
            map.addAttribute("msg", e.message)
            return "login"
        }

    }

    @GetMapping(path = ["logOut"], produces = [(MediaType.TEXT_HTML_VALUE)])
    @ApiOperation(value = "退出登录", notes = "退出登录，清空session")
    fun logOut(): String {
        val subject = SecurityUtils.getSubject()
        if (subject.isAuthenticated) {
            subject.session.removeAttribute("userInfo")
            subject.logout() // session 会销毁，在SessionListener监听session销毁，清理权限缓存
        }
        return "redirect:/"
    }

    @GetMapping(path = [(MySiteMap.FILE_PATH + "/{path}/{fileName}")])
    fun getFile(@PathVariable("fileName") fileName: String, @PathVariable("path") path: String, request: HttpServletRequest, response: HttpServletResponse) {
        var fileName = fileName
        val usrHome = System.getProperty("user.home")
        if (StringUtils.isEmpty(path, fileName))
            try {
                response.sendRedirect("../error")
            } catch (e: IOException) {
                e.printStackTrace()
            }

        val strings = request.requestURL.toString().split("\\.".toRegex()).dropLastWhile { it.isEmpty() }.toTypedArray()
        if (!StringUtils.isEmpty(strings[1])) fileName += "." + strings[1]
        val filePath = usrHome + MySiteMap.FILE_PATH + path + "/" + fileName

        try {
            FileDownload.fileDownload(response, filePath, fileName)
        } catch (e: Exception) {
            e.printStackTrace()
        }

    }

}
