package acheng1314.cn.controller.endWeb;

import acheng1314.cn.domain.User;
import acheng1314.cn.domain.Works;
import acheng1314.cn.service.WorkServiceImpl;
import acheng1314.cn.util.DateUtil;
import acheng1314.cn.validate.BeanValidator;
import io.swagger.annotations.ApiParam;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

@RequestMapping("/endSys/work")
@Controller
public class SysWorkController {

    @Autowired
    private SysMainController mainController;

    @Autowired
    private WorkServiceImpl workService;

    @GetMapping(path = "add", produces = MediaType.TEXT_HTML_VALUE)
    public String add(ModelMap map) {
        return "end/work/add";
    }

    @PostMapping(path = "add", produces = MediaType.TEXT_HTML_VALUE)
    public String add(ModelMap map
            , Works works
            , @RequestParam(value = "upfile", required = false) MultipartFile file
            , HttpServletRequest request) {
        try {
            BeanValidator.validate(works);
            HashMap<String, Object> upload = (HashMap<String, Object>) mainController.upload(file, request);
            //1.得到Subject
            Subject subject = SecurityUtils.getSubject();
            User userInfo = (User) subject.getSession().getAttribute("userInfo");
            works.setDate(DateUtil.getDate());
            works.setUrl(upload.get("url").toString());
            works.setUserId(userInfo.getId());
            workService.insert(works);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("msg", "添加失败，原因：" + e.getMessage());
        }
        return add(map);
    }

    @GetMapping(path = "/all", produces = MediaType.TEXT_HTML_VALUE)
    public String allClass(ModelMap modelMap, @ApiParam(required = false, value = "页码")
    @RequestParam(required = false) Integer pageNum
            , @ApiParam(required = false, value = "每页大小")
                           @RequestParam(required = false) Integer pageSize) {
        if (pageNum == null) return allClass(modelMap, 1, pageSize);
        if (pageSize == null) return allClass(modelMap, pageNum, 15);
        //1.得到Subject
        Subject subject = SecurityUtils.getSubject();
        User userInfo = (User) subject.getSession().getAttribute("userInfo");
        modelMap.addAttribute("all", workService.findByPage(pageNum, pageSize, userInfo));
        modelMap.addAttribute("pageSize", pageSize);
        modelMap.addAttribute("pageNum", pageNum);
        modelMap.addAttribute("total", workService.getTotal());
        return "end/work/workList";
    }

    @GetMapping(path = "/{id}", produces = MediaType.TEXT_HTML_VALUE)
    public String getOne(ModelMap map, @PathVariable(value = "id") Long id) {
        map.put("bean", workService.selectById(id));
        return "end/work/one";
    }

    @GetMapping(path = "/notRead", produces = MediaType.TEXT_HTML_VALUE)
    public String getNotRead(ModelMap map) {
        map.put("data", workService.findNotRead());
        return "end/work/notReadList";
    }

    @GetMapping(path = "/notReadOne/{id}", produces = MediaType.TEXT_HTML_VALUE)
    public String getNotRead(ModelMap map, @PathVariable("id") Long id) {
        map.put("bean", workService.selectById(id));
        return "end/work/notReadOne";
    }

    @PostMapping(path = "/addSocre", produces = MediaType.TEXT_HTML_VALUE)
    public String addScore(ModelMap map, Works works) {
        try {
            workService.addScore(works);
            map.put("msg", "评分成功");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("msg", e.getMessage());
        }
        return getNotRead(map, works.getId());
    }

    @GetMapping(path = "/ReadOk", produces = MediaType.TEXT_HTML_VALUE)
    public String getReadOk(ModelMap map) {
        map.put("data", workService.findRead());
        return "end/work/ReadList";
    }
}
