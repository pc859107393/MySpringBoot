package acheng1314.cn.controller.endWeb;

import acheng1314.cn.domain.ResponseCode;
import acheng1314.cn.domain.User;
import acheng1314.cn.service.UserServiceImpl;
import acheng1314.cn.util.GsonUtils;
import acheng1314.cn.util.StringUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/endSys")
@Api(description = "用户控制器，控制后台访问用户信息相关")
public class SysUserController {

    @Autowired
    private UserServiceImpl userService;

    @GetMapping(value = "/userList", produces = MediaType.TEXT_HTML_VALUE)
    public String userList(@ApiParam(hidden = true) ModelMap map) {
        List<User> users = userService.selectList();
        map.addAttribute("users", users);
        return "end/user/userList";
    }

    @GetMapping(value = "/addUser", produces = MediaType.TEXT_HTML_VALUE)
    public String addUser() {
        return "end/user/addUser";
    }

    @PostMapping(path = "/addUser", produces = MediaType.TEXT_HTML_VALUE)
    @ApiOperation(value = "添加用户", notes = "添加用户")
    public Object addUser(User user, @ApiParam(hidden = true) ModelMap map) {
        try {
            userService.addOneUser(user);
            map.addAttribute("msg", "添加用户成功！");
        } catch (Exception e) {
            e.printStackTrace();
            map.addAttribute("msg", "添加用户失败！原因：" + e.getMessage());
        }
        return "end/user/addUser";
    }

    @PostMapping(path = "/updateUser", produces = MediaType.TEXT_HTML_VALUE)
    @ApiOperation(value = "更新用户", notes = "根据ID更新用户")
    public String updateUser(User user, @ApiParam(hidden = true) ModelMap map) {
        if (null == user.getId() || StringUtils.isEmpty(user.getId().toString()))
            map.addAttribute("msg", "更新用户失败！原因：用户ID不能为空");
        try {
            userService.updateById(user);
            map.addAttribute("msg", "更新用户成功！");
        } catch (Exception e) {
            e.printStackTrace();
            map.addAttribute("msg", "更新用户失败！原因" + e.getMessage());
        }
        return userList(map);
    }

    @GetMapping(path = "/delUser/{loginName}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ApiOperation(value = "删除用户", notes = "根据登录名禁用用户")
    @ResponseBody
    public Object delUser(@PathVariable("loginName") String loginName) {
        try {
            userService.delUser(loginName);
            return GsonUtils.toJsonObjStr(null, ResponseCode.OK, "禁用用户成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return GsonUtils.toJsonObjStr(null, ResponseCode.FAILED, "禁用用户失败！原因：" + e.getMessage());
        }
    }

    @GetMapping(path = "/getUserInfo/{loginName}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ApiOperation(value = "查找用户", notes = "根据登录名查找用户")
    @ResponseBody
    public Object getUserInfo(@PathVariable("loginName") String loginName) {
        try {
            User oneByLoginName = userService.findOneByLoginName(loginName);
            return GsonUtils.toJsonObjStr(oneByLoginName, ResponseCode.OK, "查找用户成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return GsonUtils.toJsonObjStr(null, ResponseCode.FAILED, "查找用户失败！原因：" + e.getMessage());
        }
    }

}
