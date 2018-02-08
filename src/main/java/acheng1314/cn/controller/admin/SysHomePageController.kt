package acheng1314.cn.controller.admin

import io.swagger.annotations.Api
import io.swagger.annotations.ApiOperation
import org.springframework.http.MediaType
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping

@Controller
@RequestMapping("/endSys/homePage")
@Api(description = "网站首页控制器")
class SysHomePageController {
    @GetMapping(value = ["/banner"], produces = [MediaType.TEXT_HTML_VALUE])
    @ApiOperation(value = "编辑首页轮播图", notes = "首页轮播图编辑器")
    fun editBanner() = "end/webHome/editBanner"
}