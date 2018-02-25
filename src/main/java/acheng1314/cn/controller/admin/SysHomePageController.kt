package acheng1314.cn.controller.admin

import acheng1314.cn.service.BannerServiceImpl
import io.swagger.annotations.Api
import io.swagger.annotations.ApiOperation
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.MediaType
import org.springframework.stereotype.Controller
import org.springframework.ui.ModelMap
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping

@Controller
@RequestMapping("/endSys/homePage")
@Api(description = "网站首页控制器", hidden = true)
class SysHomePageController {

    @Autowired lateinit var bannerService: BannerServiceImpl

    @GetMapping(value = ["/banner"], produces = [MediaType.TEXT_HTML_VALUE])
    @ApiOperation(value = "编辑首页轮播图", notes = "首页轮播图编辑器")
    fun editBanner(model: ModelMap): String {
        try {
            model.addAttribute("banners", bannerService.findPublish())
        } catch (e: Exception) {
            e.printStackTrace()
            model.addAttribute("msg", e.message)
        } finally {
            return "end/webHome/editBanner"
        }
    }


}