package acheng1314.cn.controller.admin

import acheng1314.cn.domain.BaseHouse
import acheng1314.cn.service.HouseServiceImpl
import io.swagger.annotations.ApiParam
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.MediaType
import org.springframework.stereotype.Controller
import org.springframework.ui.ModelMap
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestParam


@Controller
@RequestMapping("/endSys/houseCon")
class SysHouseController {

    @Autowired lateinit var houseService: HouseServiceImpl

    val addHouse: String
        @GetMapping(value = ["/add"], produces = [MediaType.TEXT_HTML_VALUE])
        get() = "end/house/addHouse"

    @PostMapping(value = ["/add"], produces = [MediaType.TEXT_HTML_VALUE])
    fun addHouse(modelMap: ModelMap, baseHouse: BaseHouse): String {
        try {
            houseService.saveBaseHouse(baseHouse)
            modelMap.addAttribute("msg", "添加成功")
        } catch (e: Exception) {
            modelMap.addAttribute("msg", e.message)
        }
        return addHouse
    }

    @GetMapping(value = ["/all"], produces = [MediaType.TEXT_HTML_VALUE])
    fun getAllHouse(modelMap: ModelMap, @ApiParam(required = false, value = "页码")
    @RequestParam(required = false) pageNum: Int?
                    , @ApiParam(required = false, value = "每页大小")
                    @RequestParam(required = false) pageSize: Int? = 20): String {
        modelMap.addAttribute("all", houseService.findAllByPage(pageNum ?: 1, pageSize ?: 20))
        modelMap.addAttribute("pageNum", pageNum)
        modelMap.addAttribute("pageTotal", houseService.totalPage)
        return "end/house/all"
    }
}