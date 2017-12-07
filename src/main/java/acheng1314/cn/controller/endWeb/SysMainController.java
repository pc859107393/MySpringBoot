package acheng1314.cn.controller.endWeb;

import acheng1314.cn.util.DateUtil;
import acheng1314.cn.util.FileUpload;
import acheng1314.cn.util.MySiteMap;
import acheng1314.cn.util.StringUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.apache.shiro.web.servlet.ShiroHttpServletRequest;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;


@Controller()
@RequestMapping("/endSys")
@Api(description = "控制后端页面导航，后端文件上传控制")
public class SysMainController {

    @GetMapping(value = "/index", produces = MediaType.TEXT_HTML_VALUE)
    @ApiOperation(value = "后端主页框架", notes = "后端主页框架")
    public String endMain(@ApiParam(hidden = true) ModelMap map
            , @ApiParam(hidden = true) ShiroHttpServletRequest request) {
        Object user = request.getSession().getAttribute("userInfo");
        map.put("user", user);
        return "end/index";
    }

    @GetMapping(value = "/default", produces = MediaType.TEXT_HTML_VALUE)
    @ApiOperation(value = "后端主页", notes = "后端主页")
    public String endDefault(@ApiParam(hidden = true) ModelMap map
            , @ApiParam(hidden = true) ShiroHttpServletRequest request) {
        Object user = request.getSession().getAttribute("userInfo");
        map.put("user", user);
        return "end/myDefault";
    }

    @GetMapping(value = "/uploadFile", produces = MediaType.TEXT_HTML_VALUE)
    @ApiOperation(value = "后端上传资源页面", notes = "后端上传资源页面")
    public String endUpload(@ApiParam(hidden = true) ModelMap map
            , @ApiParam(hidden = true) ShiroHttpServletRequest request) {
        Object user = request.getSession().getAttribute("userInfo");
        map.put("user", user);
        return "end/uploadFile";
    }

    @PostMapping(value = "/uploadFile", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ApiOperation(value = "后端上传文件。兼容Ueditor", notes = "后端上传文件。兼容Ueditor")
    @ResponseBody
    public Object upload(@RequestParam(value = "upfile", required = false) MultipartFile file
            , HttpServletRequest request) {
        Map<String, String> resultMap = new HashMap<>();    //返回结果

        try {
            //服务器地址
            StringBuilder serverPath = new StringBuilder();
            serverPath.append("http://");
            serverPath.append(request.getServerName());
            if (request.getServerPort() != 80) serverPath.append(":").append(request.getServerPort());
            serverPath.append(request.getContextPath());
            if (null == file || file.isEmpty()) {
                resultMap.put("state", "上传失败");
                return resultMap;
            }
            String usrHome = System.getProperty("user.home");

            String fileRename = DateUtil.INSTANCE.getDays();//按照日期分类的目录
            String filePath = usrHome + MySiteMap.FILE_PATH + fileRename;        //文件上传路径
            String fileResultName = FileUpload.fileUp(file, filePath, StringUtils.get32UUID());//执行上传
            //分装百度上传信息
            resultMap.put("state", "SUCCESS");
            resultMap.put("url", serverPath + MySiteMap.FILE_PATH + fileRename + "/" + fileResultName);
            resultMap.put("title", "");
            resultMap.put("original", file.getOriginalFilename());
        } catch (Exception e) {
            resultMap.put("state", "上传失败");
        }
        return resultMap;
    }

    @GetMapping(value = "/tab", produces = MediaType.TEXT_HTML_VALUE)
    @ApiOperation(value = "web页面标签", notes = "web页面内部导航标签")
    public String tab() {
        return "tab";
    }
}
