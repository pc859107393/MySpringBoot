package acheng1314.cn.controller.admin

import acheng1314.cn.data.DataGuard
import acheng1314.cn.service.GuardServiceImpl
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.MediaType
import org.springframework.stereotype.Controller
import org.springframework.ui.ModelMap
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestMapping

@Controller
@RequestMapping("/endSys/guard")
class SysGuardController {

    @Autowired lateinit var guardService: GuardServiceImpl

    @PostMapping(value = ["/save"], produces = [MediaType.TEXT_HTML_VALUE])
    fun save(data: DataGuard, modelMap: ModelMap): String {
        try {
            guardService.insert(data.convert2Guard)
            modelMap.addAttribute("msg", "添加成功")
        } catch (e: Exception) {
            modelMap.addAttribute("msg", e.message)
        } finally {
            return "end/webHome/editDifferent"
        }
    }
}