package acheng1314.cn.controller.endWeb;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.apache.shiro.web.servlet.ShiroHttpServletRequest;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller()
@RequestMapping("/endSys")
@Api(value = "后端页面控制器")
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

    @GetMapping(value = "/tab", produces = MediaType.TEXT_HTML_VALUE)
    @ApiOperation(value = "web页面标签", notes = "web页面内部导航标签")
    public String tab() {
        return "tab";
    }
}
