package acheng1314.cn.controller.web

import acheng1314.cn.service.GuardServiceImpl
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.MediaType
import org.springframework.stereotype.Controller
import org.springframework.ui.ModelMap
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping


@Controller
@RequestMapping("/help")
class WebHelpController {

    @Autowired private lateinit var guardService: GuardServiceImpl

    @GetMapping(value = ["/guard"], produces = [MediaType.TEXT_HTML_VALUE])
    fun getGuard(modelMap: ModelMap): String {
        modelMap.addAttribute("guard", guardService.findLast)
        return "web/guard"
    }


}