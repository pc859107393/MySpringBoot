package acheng1314.cn.controller.api;

import acheng1314.cn.domain.ResponseCode;
import acheng1314.cn.domain.User;
import acheng1314.cn.service.UserServiceImpl;
import acheng1314.cn.util.GsonUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Api(description = "后台获取用户信息的API接口，需要用户登录权限！")
@RestController
@RequestMapping("/endSys/api/user")
public class SysUserApi {
    @Autowired
    private UserServiceImpl userService;

    @ApiOperation(value = "获取用户信息的集合", notes = "用户信息分页查询")
    @GetMapping(value = "/all", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public Object getGoodsList() {
        List<User> userList = userService.selectList();
        if (null != userList && userList.isEmpty()) return GsonUtils.toJsonObjStr(null, ResponseCode.EMPTY, null);
        return GsonUtils.toJsonObjStr(userList, ResponseCode.OK, "获取数据成功!");
    }


}
