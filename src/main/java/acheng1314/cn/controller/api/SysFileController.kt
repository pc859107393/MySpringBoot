package acheng1314.cn.controller.api

import acheng1314.cn.controller.admin.SysMainController
import io.swagger.annotations.ApiOperation
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.MediaType
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.ResponseBody
import org.springframework.web.multipart.MultipartFile
import javax.servlet.http.HttpServletRequest

@Controller
@RequestMapping("/endSys/api/file")
class SysFileController {

    @Autowired private lateinit var main: SysMainController

    @PostMapping(value = ["/save"], produces = [(MediaType.APPLICATION_JSON_UTF8_VALUE)])
    @ApiOperation(value = "后端上传文件。兼容Ueditor、wangEditor", notes = "后端上传文件。兼容Ueditor、wangEditor")
    @ResponseBody
    fun fileSave(@RequestParam(value = "upfile", required = false) file: MultipartFile?
                 , request: HttpServletRequest)
            : Any = main.upload(file, request)

}