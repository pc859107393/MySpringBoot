package acheng1314.cn.controller.admin

import acheng1314.cn.domain.Banner
import acheng1314.cn.service.BannerServiceImpl
import io.swagger.annotations.Api
import io.swagger.annotations.ApiOperation
import io.swagger.annotations.ApiParam
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.MediaType
import org.springframework.stereotype.Controller
import org.springframework.ui.ModelMap
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestParam
import springfox.documentation.annotations.ApiIgnore

@Controller
@RequestMapping("/endSys/banner")
@Api(description = "轮播图控制器")
@ApiIgnore
class SysBannerController {
    @Autowired private lateinit var bannerService: BannerServiceImpl

    @PostMapping(value = ["/save"], produces = [MediaType.TEXT_HTML_VALUE])
    @ApiOperation(value = "编辑首页轮播图", notes = "首页轮播图编辑器")
    fun editBanner(@ApiParam(hidden = true) model: ModelMap, banner: Banner): String {
        try {
            if (this::bannerService.isInitialized) {
                val result = bannerService.insert(banner)
                if (result) model.addAttribute("msg", "保存成功！")
                else throw Exception("保存失败")
            } else throw Exception("组件初始化失败")
        } catch (e: Exception) {
            e.printStackTrace()
            model.addAttribute("msg", "保存失败！")
        }
        return "end/webHome/editBanner"
    }

    @GetMapping(value = ["/manager"], produces = [MediaType.TEXT_HTML_VALUE])
    @ApiOperation(value = "管理轮播图", notes = "管理轮播图")
    fun managerBanner(@ApiParam(hidden = true) model: ModelMap): String {
        model.addAttribute("banners", bannerService.findAll())
        return "end/webHome/managerBanner"
    }

    @GetMapping(value = ["/delete"], produces = [MediaType.TEXT_HTML_VALUE])
    @ApiOperation(value = "管理轮播图", notes = "管理轮播图")
    fun deleteBanner(@ApiParam(hidden = true) model: ModelMap
                     , @ApiParam(required = false, value = "轮播图id")
                     @RequestParam(required = false) id: Long?): String {
        try {
            if (this::bannerService.isInitialized)
                bannerService.deleteById(id ?: throw NullPointerException("该轮播图id不存在"))
            else throw Exception("组件初始化失败")
        } catch (e: Exception) {
            e.printStackTrace()
            model.addAttribute("msg", e.message)
        }
        return managerBanner(model)

    }


}