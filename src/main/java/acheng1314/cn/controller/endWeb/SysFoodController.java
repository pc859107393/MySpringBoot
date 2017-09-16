package acheng1314.cn.controller.endWeb;


import acheng1314.cn.domain.Desk;
import acheng1314.cn.domain.Food;
import acheng1314.cn.domain.FoodType;
import acheng1314.cn.domain.ResponseCode;
import acheng1314.cn.service.DeskServiceImpl;
import acheng1314.cn.service.FoodServiceImpl;
import acheng1314.cn.service.FoodTypeServiceImpl;
import acheng1314.cn.util.GsonUtils;
import com.baomidou.mybatisplus.plugins.Page;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/endSys")
@Api(description = "点餐 → 后台管理系统")
public class SysFoodController {

    @Autowired
    private FoodTypeServiceImpl foodTypeService;

    @GetMapping(value = "/getOneFoodType/{id}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ApiOperation(value = "获取一个菜系信息", notes = "获取一个菜系信息")
    @ResponseBody
    public Object getFoodType(@PathVariable("id") Integer id) {
        FoodType result = foodTypeService.selectById(id);
        if (null == result) return GsonUtils.toJsonObjStr(null, ResponseCode.FAILED, "找不到对应菜系!");
        return GsonUtils.toJsonObjStr(result, ResponseCode.OK, "菜系成功找到！");
    }

    @GetMapping(value = "/addFoodType", produces = MediaType.TEXT_HTML_VALUE)
    @ApiOperation(value = "添加菜系", notes = "添加菜系")
    public String addFoodType(@ApiParam(hidden = true) ModelMap map) {
        return "end/food/addFoodType";
    }

    @PostMapping(value = "/addFoodType", produces = MediaType.TEXT_HTML_VALUE)
    @ApiOperation(value = "菜系提交", notes = "提交菜系，返回信息到页面")
    public String addFoodType(@ApiParam(hidden = true) ModelMap map, FoodType foodType) {
        try {
            foodTypeService.insertOne(foodType);
            map.addAttribute("msg", "菜系添加成功!");
        } catch (Exception e) {
            e.printStackTrace();
            map.addAttribute("msg", "菜系添加失败！原因：" + e.getMessage());
        }
        map.addAttribute("foodType", foodType);
        return addFoodType(map);
    }

    @PostMapping(value = "/updateFoodType", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ApiOperation(value = "菜系更新", notes = "更新菜系信息")
    public String updateFoodType(@ApiParam(hidden = true) ModelMap map, FoodType foodType) {
        try {
            foodTypeService.updateById(foodType);
            map.addAttribute("msg", "菜系更新成功!");
        } catch (Exception e) {
            e.printStackTrace();
            map.addAttribute("msg", "菜系更新失败！原因：" + e.getMessage());
        }
        return allFoodType(map, 1, 25);
    }

    @GetMapping(value = "/allFoodType", produces = MediaType.TEXT_HTML_VALUE)
    @ApiOperation(value = "所有菜系", notes = "所有菜系")
    public String allFoodType(@ApiParam(hidden = true) ModelMap map
            , @ApiParam(value = "当前页码,默认不能为空，否则为1",
            //参数默认值为1
            defaultValue = "1") @RequestParam(required = false) Integer pageNum
            , @ApiParam(value = "当前页面数量,默认不能为空，否则为25",
            //参数默认值为1
            defaultValue = "25") @RequestParam(required = false) Integer pageSize) {

        if (null == pageNum || pageNum <= 0) {
            pageNum = 1;
        }
        if (null == pageSize || pageSize == 0) {
            pageSize = 25;
            return "redirect:/endSys/allFoodType?pageNum=" + pageNum + "&pageSize=" + pageSize;
        }
        map.addAttribute("foodTypes", foodTypeService.selectList(pageNum, pageSize));
        return "end/food/allFoodType";
    }

    @GetMapping(value = "/delFoodType/{id}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ApiOperation(value = "删除菜系", notes = "删除菜系")
    @ResponseBody
    public Object delFoodType(@PathVariable("id") Integer id) {
        try {
            foodTypeService.deleteById(id);
            return GsonUtils.toJsonObjStr(null, ResponseCode.OK, "成功删除！");
        } catch (Exception e) {
            e.printStackTrace();
            return GsonUtils.toJsonObjStr(null, ResponseCode.FAILED, "删除失败！");
        }
    }

    @Autowired
    private FoodServiceImpl foodService;

    @GetMapping(value = "/addFoods", produces = MediaType.TEXT_HTML_VALUE)
    @ApiOperation(value = "添加菜品", notes = "添加菜品")
    public String addFood(@ApiParam(hidden = true) ModelMap map) {
        //菜系可能会很多，直接巴拉巴拉的来500个，应该够了吧
        map.addAttribute("foodType", foodTypeService.selectPage(new Page<FoodType>(1, 500)).getRecords());
        return "end/food/addFood";
    }

    @PostMapping(value = "/addFoods", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ApiOperation(value = "上传菜品", notes = "上传菜品到服务器")
    @ResponseBody
    public String addFoods(@ApiParam(hidden = true) ModelMap map, Food food) {
        try {
            foodService.insertOne(food);
            return GsonUtils.toJsonObjStr(null, ResponseCode.OK, "菜品添加成功!");
        } catch (Exception e) {
            e.printStackTrace();
            return GsonUtils.toJsonObjStr(null, ResponseCode.FAILED, "菜品添加失败!原因：" + e.getMessage());
        }
    }

    @GetMapping(value = "/allFoods", produces = MediaType.TEXT_HTML_VALUE)
    @ApiOperation(value = "所有菜品", notes = "所有菜品")
    public String allFoods(@ApiParam(hidden = true) ModelMap map
            , @ApiParam(value = "当前页码,默认不能为空，否则为1",
            //参数默认值为1
            defaultValue = "1") @RequestParam(required = false) Integer pageNum
            , @ApiParam(value = "当前页面数量,默认不能为空，否则为25",
            //参数默认值为1
            defaultValue = "25") @RequestParam(required = false) Integer pageSize) {

        if (null == pageNum || pageNum <= 0) {
            pageNum = 1;
        }
        if (null == pageSize || pageSize == 0) {
            pageSize = 25;
            return "redirect:/endSys/allFoods?pageNum=" + pageNum + "&pageSize=" + pageSize;
        }

        map.addAttribute("foods", foodService.selectList(pageNum, pageSize));
        return "end/food/allFoods";
    }

    @GetMapping(value = "/delFoods/{id}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ApiOperation(value = "删除菜品", notes = "删除菜品")
    @ResponseBody
    public Object delFoods(@PathVariable("id") Integer id) {
        try {
            foodService.deleteById(id);
            return GsonUtils.toJsonObjStr(null, ResponseCode.OK, "成功删除！");
        } catch (Exception e) {
            e.printStackTrace();
            return GsonUtils.toJsonObjStr(null, ResponseCode.FAILED, "删除失败！");
        }
    }

    @GetMapping(value = "/changeFoods/{id}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ApiOperation(value = "修改菜品", notes = "修改菜品")
    public String changeFoods(@PathVariable("id") Integer id, @ApiParam(hidden = true) ModelMap map) {
        try {
            map.addAttribute("food", foodService.selectById(id));
            map.addAttribute("foodType", foodTypeService.selectPage(new Page<FoodType>(1, 500)).getRecords());
            return "/end/food/changeFood";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/error";
        }
    }

    @PostMapping(value = "/changeFoods", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ApiOperation(value = "修改菜品", notes = "修改菜品到服务器")
    @ResponseBody
    public Object changeFoods(@ApiParam(hidden = true) ModelMap map, Food food) {
        try {
            foodService.updateById(food);
            return GsonUtils.toJsonObjStr(null, ResponseCode.OK, "菜品修改成功!");
        } catch (Exception e) {
            e.printStackTrace();
            return GsonUtils.toJsonObjStr(null, ResponseCode.FAILED, "菜品修改失败!原因：" + e.getMessage());
        }
    }

    @Autowired
    private DeskServiceImpl deskService;

    @GetMapping(value = "/allDesk", produces = MediaType.TEXT_HTML_VALUE)
    @ApiOperation(value = "所有餐桌界面", notes = "所有餐桌")
    public String allDeskGet(@ApiParam(hidden = true) ModelMap map
            , @ApiParam(value = "当前页码,默认不能为空，否则为1",
            //参数默认值为1
            defaultValue = "1") @RequestParam(required = false) Integer pageNum
            , @ApiParam(value = "当前页面数量,默认不能为空，否则为25",
            //参数默认值为1
            defaultValue = "25") @RequestParam(required = false) Integer pageSize) {

        if (null == pageNum || pageNum <= 0) {
            pageNum = 1;
        }
        if (null == pageSize || pageSize == 0) {
            pageSize = 25;
            return "redirect:/endSys/allDesk?pageNum=" + pageNum + "&pageSize=" + pageSize;
        }
        map.addAttribute("desks", deskService.selectList(pageNum, pageSize));
        return "end/food/allDesk";
    }

    @PostMapping(value = "/addDesk", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ApiOperation(value = "添加桌子", notes = "添加餐桌")
    @ResponseBody
    public Object addDesk(Desk desk) {
        try {
            deskService.insert(desk);
            return GsonUtils.toJsonObjStr(desk
                    , ResponseCode.OK
                    , "添加餐桌成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return GsonUtils.toJsonObjStr(null
                    , ResponseCode.FAILED
                    , "添加餐桌失败！原因：" + e.getMessage());
        }
    }

    @PostMapping(value = "/updateDesk", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ApiOperation(value = "更新桌子", notes = "更新餐桌")
    @ResponseBody
    public Object updateDesk(Desk desk) {
        try {
            deskService.update(desk);
            return GsonUtils.toJsonObjStr(desk
                    , ResponseCode.OK
                    , "更新餐桌成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return GsonUtils.toJsonObjStr(null
                    , ResponseCode.FAILED
                    , "更新餐桌失败！原因：" + e.getMessage());
        }
    }

    @GetMapping(value = "/delDesk/{id}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ApiOperation(value = "删除菜品", notes = "删除菜品")
    @ResponseBody
    public Object delDesk(@PathVariable("id") Integer id) {
        try {
            deskService.delDesk4Id(id);
            return GsonUtils.toJsonObjStr(null, ResponseCode.OK, "删除餐桌成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return GsonUtils.toJsonObjStr(null, ResponseCode.FAILED, "删除餐桌失败！原因：" + e.getMessage());
        }
    }

    @GetMapping(value = "/getOneDesk/{id}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ApiOperation(value = "查找桌子", notes = "查找桌子")
    @ResponseBody
    public Object getOneDesk(@PathVariable("id") Integer id) {
        try {
            return GsonUtils.toJsonObjStr(deskService.selectById(id), ResponseCode.OK, "查找桌子成功！");
        } catch (Exception e) {
            e.printStackTrace();
            return GsonUtils.toJsonObjStr(null, ResponseCode.FAILED, "查找桌子失败！");
        }
    }


}
