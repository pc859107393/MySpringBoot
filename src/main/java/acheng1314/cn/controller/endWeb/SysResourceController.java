package acheng1314.cn.controller.endWeb;

import acheng1314.cn.domain.Resource;
import acheng1314.cn.domain.User;
import acheng1314.cn.service.ResourceServiceImpl;
import acheng1314.cn.util.DateUtil;
import io.swagger.annotations.ApiParam;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

@RequestMapping("/endSys/Resource")
@Controller
public class SysResourceController {

    @Autowired
    private ResourceServiceImpl resourceService;

    @Autowired
    private SysMainController mainController;

    @GetMapping(path = "/add", produces = MediaType.TEXT_HTML_VALUE)
    public String addResource(ModelMap map) {
        return "end/resource/add";
    }

    @PostMapping(path = "/add", produces = MediaType.TEXT_HTML_VALUE)
    public String addResource(ModelMap map, Resource resource
            , @RequestParam(value = "upfile", required = false) MultipartFile file
            , HttpServletRequest request) {
        try {
            HashMap<String, Object> upload = (HashMap<String, Object>) mainController.upload(file, request);
            //1.得到Subject
            Subject subject = SecurityUtils.getSubject();
            User userInfo = (User) subject.getSession().getAttribute("userInfo");
            resource.setUserId(userInfo.getId());
            resource.setName(upload.get("url").toString());
            resource.setDate(DateUtil.getDate());
            resourceService.insert(resource);
            map.addAttribute("msg", "添加学习资源成功");
        } catch (Exception e) {
            e.printStackTrace();
            map.addAttribute("msg", "添加学习资源失败：" + e.getMessage());
        }
        return addResource(map);
    }

    @GetMapping(path = "/all", produces = MediaType.TEXT_HTML_VALUE)
    public String allClass(ModelMap modelMap, @ApiParam(required = false, value = "页码")
    @RequestParam(required = false) Integer pageNum
            , @ApiParam(required = false, value = "每页大小")
                           @RequestParam(required = false) Integer pageSize) {
        if (pageNum == null) return allClass(modelMap, 1, pageSize);
        if (pageSize == null) return allClass(modelMap, pageNum, 15);
        modelMap.addAttribute("resources", resourceService.findByPage(pageNum, pageSize));
        modelMap.addAttribute("pageSize", pageSize);
        modelMap.addAttribute("pageNum", pageNum);
        modelMap.addAttribute("total", resourceService.getTotal());
        return "end/resource/resourceList";
    }

//    @GetMapping(path = "/{id}", produces = MediaType.TEXT_HTML_VALUE)
//    public String findOne(@PathVariable(name = "id") Integer id, ModelMap map) {
//        Clazz clazz = classService.selectById(id);
//        if (clazz == null) {
//            map.addAttribute("exception", "未找到相关课程!");
//            return "redirect:/404";
//        }
//        map.put("clazz", clazz);
//        map.put("teacher", userService.findOneByTel(clazz.getUserId().toString()));
//        return "end/clazz/one";
//    }

}
