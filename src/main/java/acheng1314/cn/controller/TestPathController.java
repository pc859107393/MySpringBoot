package acheng1314.cn.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * Created by pc on 2017/8/13.
 */
@Controller
@Api(description = "页面测试器")
public class TestPathController {

    @GetMapping(value = "/testPath")
    @ApiOperation(value = "测试页面解析器", notes = "这个到底是那个路径呢？")
    public String testPath(ModelMap map) {
        map.addAttribute("test", "我的天老爷");
        return "test";
    }

    @GetMapping(value = "/testReload")
    @ApiOperation(value = "测试页面解析器", notes = "这个到底是那个路径呢？")
    public String testReload(ModelMap map) {
        map.addAttribute("test", "重启成功");
        return "test";
    }

    @GetMapping("/testError")
    @ApiOperation(value = "测试错误页面", notes = "测试错误页面")
    public void testError() throws Exception {
        throw new Exception("哈哈哈");
    }
}
