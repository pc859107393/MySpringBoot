package acheng1314.cn.controller;

import io.swagger.annotations.ApiOperation;

import io.swagger.annotations.ApiParam;
import org.springframework.http.MediaType;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
public class HelloWorldController {

    @GetMapping(value = "/appCon/{appName}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ApiOperation(
            value = "app控制器"
            , notes = "输入包名控制app，暂未适配")
    public Object sayHello(@PathVariable("appName") @ApiParam(value = "app包名") String appName) {
        Map<String, Object> map = new HashMap<>();
        map.put("appName", appName);
        map.put("used", true);
        return map;
    }

}
