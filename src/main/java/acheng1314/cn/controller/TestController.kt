package acheng1314.cn.controller


import io.swagger.annotations.Api
import io.swagger.annotations.ApiOperation
import org.springframework.stereotype.Controller
import org.springframework.ui.ModelMap
import org.springframework.web.bind.annotation.GetMapping

/**
 * Created by pc on 2017/8/13.
 */
@Controller
@Api(description = "主要的测试控制器")
class TestController {

    @GetMapping(value = ["/testPath"])
    @ApiOperation(value = "测试页面解析器", notes = "这个到底是那个路径呢？")
    fun testPath(map: ModelMap): String {
        map.addAttribute("test", "我的天老爷")
        return "test"
    }

    @GetMapping(value = ["/testReload"])
    @ApiOperation(value = "测试页面解析器", notes = "这个到底是那个路径呢？")
    fun testReload(map: ModelMap): String {
        map.addAttribute("test", "重启成功")
        return "test"
    }

    @GetMapping("/testError")
    @ApiOperation(value = "测试错误页面", notes = "测试错误页面")
    @Throws(Exception::class)
    fun testError() {
        throw Exception("哈哈哈")
    }
}
