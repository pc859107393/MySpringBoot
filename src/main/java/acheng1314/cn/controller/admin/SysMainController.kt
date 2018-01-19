package acheng1314.cn.controller.admin


import acheng1314.cn.util.DateUtil
import acheng1314.cn.util.FileUpload
import acheng1314.cn.util.MySiteMap
import acheng1314.cn.util.StringUtils
import io.swagger.annotations.Api
import io.swagger.annotations.ApiOperation
import io.swagger.annotations.ApiParam
import org.apache.shiro.web.servlet.ShiroHttpServletRequest
import org.springframework.http.MediaType
import org.springframework.stereotype.Controller
import org.springframework.ui.ModelMap
import org.springframework.web.bind.annotation.*
import org.springframework.web.multipart.MultipartFile

import javax.servlet.http.HttpServletRequest
import java.util.ArrayList
import java.util.HashMap


@Controller
@RequestMapping("/endSys")
@Api(description = "控制后端页面导航，后端文件上传控制")
open class SysMainController {

    @GetMapping(value = ["/index"], produces = [(MediaType.TEXT_HTML_VALUE)])
    @ApiOperation(value = "后端主页框架", notes = "后端主页框架")
    fun endMain(@ApiParam(hidden = true) map: ModelMap, @ApiParam(hidden = true) request: ShiroHttpServletRequest): String {
        val user = request.session.getAttribute("userInfo")
        map.put("user", user)
        return "end/index"
    }

    @GetMapping(value = ["/default"], produces = [(MediaType.TEXT_HTML_VALUE)])
    @ApiOperation(value = "后端主页", notes = "后端主页")
    fun endDefault(@ApiParam(hidden = true) map: ModelMap, @ApiParam(hidden = true) request: ShiroHttpServletRequest): String {
        val user = request.session.getAttribute("userInfo")
        map.put("user", user)
        return "end/myDefault"
    }

    @GetMapping(value = ["/uploadFile"], produces = [(MediaType.TEXT_HTML_VALUE)])
    @ApiOperation(value = "后端上传资源页面", notes = "后端上传资源页面")
    fun endUpload(@ApiParam(hidden = true) map: ModelMap, @ApiParam(hidden = true) request: ShiroHttpServletRequest): String {
        val user = request.session.getAttribute("userInfo")
        map.put("user", user)
        return "end/uploadFile"
    }

    @PostMapping(value = ["/uploadFile"], produces = [(MediaType.APPLICATION_JSON_UTF8_VALUE)])
    @ApiOperation(value = "后端上传文件。兼容Ueditor、wangEditor", notes = "后端上传文件。兼容Ueditor、wangEditor")
    @ResponseBody
    fun upload(@RequestParam(value = "upfile", required = false) file: MultipartFile?, request: HttpServletRequest): Any {
        val resultMap = HashMap<String, Any>()    //返回结果

        try {
            //服务器地址
            val serverPath = StringBuilder()
            serverPath.append("http://")
            serverPath.append(request.serverName)
            if (request.serverPort != 80) serverPath.append(":").append(request.serverPort)
            serverPath.append(request.contextPath)
            if (null == file || file.isEmpty) {
                resultMap.put("state", "上传失败")
                resultMap.put("errno", -1)
                return resultMap
            }
            val usrHome = System.getProperty("user.home")

            val fileRename = DateUtil.getDays()//按照日期分类的目录
            val filePath = usrHome + MySiteMap.FILE_PATH + fileRename        //文件上传路径
            val fileResultName = FileUpload.fileUp(file, filePath, StringUtils.get32UUID())//执行上传
            //分装百度上传信息
            resultMap.put("state", "SUCCESS")
            //兼容wangEditor必须返回errno和data数组
            resultMap.put("errno", 0)
            val resultList = ArrayList<String>()
            resultList.add(serverPath.toString() + MySiteMap.FILE_PATH + fileRename + "/" + fileResultName)
            resultMap.put("data", resultList)
            resultMap.put("url", serverPath.toString() + MySiteMap.FILE_PATH + fileRename + "/" + fileResultName)
            resultMap.put("title", "")
            resultMap.put("original", file.originalFilename)
        } catch (e: Exception) {
            resultMap.put("state", "上传失败")
            resultMap.put("errno", -1)
        }

        return resultMap
    }


    @GetMapping(value = ["/tab"], produces = [(MediaType.TEXT_HTML_VALUE)])
    @ApiOperation(value = "web页面标签", notes = "web页面内部导航标签")
    fun tab(): String {
        return "tab"
    }
}
