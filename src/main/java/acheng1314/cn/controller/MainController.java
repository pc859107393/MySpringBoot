package acheng1314.cn.controller;

import acheng1314.cn.domain.User;
import acheng1314.cn.util.FileDownload;
import acheng1314.cn.util.LogE;
import acheng1314.cn.util.MySiteMap;
import acheng1314.cn.util.StringUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.servlet.ShiroHttpServletRequest;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;

@Controller
@Api(description = "外层信息，无需Shiro接管，集成文件下载控制器")
public class MainController {

    @GetMapping(value = "/")
    @ApiOperation(value = "主页")
    public String home() {
        return login();
    }

    @GetMapping(value = "/apiDocs")
    @ApiOperation(value = "在线api文档")
    public String apiDocs() {
        return "redirect:/swagger-ui.html";
    }

    @GetMapping(value = "login", produces = MediaType.TEXT_HTML_VALUE)
    public String login() {
        //如果用户已经登录跳转到系统首页
        Object userInfo = SecurityUtils.getSubject().getSession().getAttribute("userInfo");
        if (userInfo != null) return "redirect:/endSys/index";
        return "login";
    }

    @PostMapping(value = "/login", produces = MediaType.TEXT_HTML_VALUE)
    @ApiOperation(value = "/login", notes = "登录后台系统")
    public String login(@ApiParam(hidden = true) ModelMap map,
                        @ApiParam(hidden = true) ShiroHttpServletRequest request,
                        @ApiParam(value = "用户名不能为空，否则不允许登录"
                                , required = true) @RequestParam(value = "tel", required = false) String tel,
                        @ApiParam(value = "用户密码不能为空且必须为16位小写MD5，否则不允许登录"
                                , required = true) @RequestParam(value = "password", required = false) String password) {
        User result = null;
        try {
            //1.得到Subject
            Subject subject = SecurityUtils.getSubject();
            //2.调用登录方法
            UsernamePasswordToken token = new UsernamePasswordToken(tel, password);
            subject.login(token);//当这一代码执行时，就会自动跳入到AuthRealm中认证方法
            result = (User) subject.getPrincipal();
            subject.getSession().setAttribute("userInfo", result);
            return "redirect:/endSys/index";
        } catch (Exception e) {
            e.printStackTrace();
            LogE.getInstance(this.getClass()).logOutLittle(e.getMessage());
            map.addAttribute("msg", e.getMessage());
            return "login";
        }

    }

    @GetMapping(path = "logOut", produces = MediaType.TEXT_HTML_VALUE)
    @ApiOperation(value = "退出登录", notes = "退出登录，清空session")
    public String logOut() {
        Subject subject = SecurityUtils.getSubject();
        if (subject.isAuthenticated()) {
            subject.getSession().removeAttribute("userInfo");
            subject.logout(); // session 会销毁，在SessionListener监听session销毁，清理权限缓存
        }
        return "redirect:/";
    }

    @GetMapping(path = MySiteMap.FILE_PATH + "/{path}/{fileName}")
    public void getFile(@PathVariable("fileName") String fileName
            , @PathVariable("path") String path, HttpServletRequest request
            , HttpServletResponse response) {
        String usrHome = System.getProperty("user.home");
        if (StringUtils.isEmpty(path, fileName)) try {
            response.sendRedirect("../error");
        } catch (IOException e) {
            e.printStackTrace();
        }
        String[] strings = request.getRequestURL().toString().split("\\.");
        if (!StringUtils.isEmpty(strings[1])) fileName += ("." + strings[1]);
        String filePath = usrHome + MySiteMap.FILE_PATH + path + "/" + fileName;

        try {
            FileDownload.fileDownload(response, filePath, fileName);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
