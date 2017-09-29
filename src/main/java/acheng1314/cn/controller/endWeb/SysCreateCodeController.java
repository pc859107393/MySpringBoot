package acheng1314.cn.controller.endWeb;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@RequestMapping("/endSys")
@Controller
@Api(description = "代码生成器控制器")
public class SysCreateCodeController {

    @GetMapping(path = "/createCode",produces = MediaType.TEXT_HTML_VALUE)
    @ApiOperation(notes = "浏览器打开代码生成器网页",value = "浏览器访问代码生成器页面")
    public String createCode(){
        return "end/createCode/index";
    }

    @PostMapping(path = "/createCode")
    @ApiOperation(notes = "post提交实体信息，生成对应的代码下载",value = "生成代码压缩包下载")
    public void createCode(HttpServletRequest request){}
}
