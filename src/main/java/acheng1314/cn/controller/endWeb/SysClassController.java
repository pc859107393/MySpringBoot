package acheng1314.cn.controller.endWeb;

import acheng1314.cn.domain.Clazz;
import acheng1314.cn.domain.User;
import acheng1314.cn.service.ClassServiceImpl;
import acheng1314.cn.service.UserServiceImpl;
import acheng1314.cn.validate.BeanValidator;
import io.swagger.annotations.ApiParam;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

@RequestMapping("/endSys/class")
@Controller
public class SysClassController {

    @Autowired
    private ClassServiceImpl classService;

    @Autowired
    private UserServiceImpl userService;

    @GetMapping(path = "/add", produces = MediaType.TEXT_HTML_VALUE)
    public String addClass(ModelMap map) {
        return "end/clazz/add";
    }

    @PostMapping(path = "/add", produces = MediaType.TEXT_HTML_VALUE)
    public String addClass(ModelMap map, Clazz clazz) {
        try {
            BeanValidator.validate(clazz);
            //1.得到Subject
            Subject subject = SecurityUtils.getSubject();
            User userInfo = (User) subject.getSession().getAttribute("userInfo");
            clazz.setUserId(userInfo.getId());
            classService.insert(clazz);
            map.addAttribute("msg", "添加课程成功");
        } catch (Exception e) {
            e.printStackTrace();
            map.addAttribute("msg", "添加课程失败：" + e.getMessage());
        }
        return addClass(map);
    }

    @GetMapping(path = "/all", produces = MediaType.TEXT_HTML_VALUE)
    public String allClass(ModelMap modelMap, @ApiParam(required = false, value = "页码")
    @RequestParam(required = false) Integer pageNum
            , @ApiParam(required = false, value = "每页大小")
                           @RequestParam(required = false) Integer pageSize) {
        if (pageNum == null) return allClass(modelMap, 1, pageSize);
        if (pageSize == null) return allClass(modelMap, pageNum, 15);
        modelMap.addAttribute("clazz", classService.findByPage(pageNum, pageSize));
        modelMap.addAttribute("pageSize", pageSize);
        modelMap.addAttribute("pageNum", pageNum);
        modelMap.addAttribute("total", classService.getTotal());
        return "end/clazz/classList";
    }

    @GetMapping(path = "/{id}", produces = MediaType.TEXT_HTML_VALUE)
    public String findOne(@PathVariable(name = "id") Integer id, ModelMap map) {
        Clazz clazz = classService.selectById(id);
        if (clazz == null) {
            map.addAttribute("exception", "未找到相关课程!");
            return "redirect:/404";
        }
        map.put("clazz", clazz);
        map.put("teacher", userService.findOneByTel(clazz.getUserId().toString()));
        return "end/clazz/one";
    }
}
