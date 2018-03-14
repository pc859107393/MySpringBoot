package acheng1314.cn.controller.admin

import org.springframework.http.MediaType
import org.springframework.stereotype.Controller
import org.springframework.ui.ModelMap
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestMapping


@Controller
@RequestMapping("/endSys/houseCon")
class SysHouseController {

    val addHouse: String
        @GetMapping(value = ["/add"], produces = [MediaType.TEXT_HTML_VALUE])
        get() = "end/house/addHouse"

    @PostMapping(value = ["/add"], produces = [MediaType.TEXT_HTML_VALUE])
    fun addHouse(modelMap: ModelMap): String {

        return addHouse
    }
}