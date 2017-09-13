package acheng1314.cn.controller.endWeb;


import acheng1314.cn.domain.Food;
import acheng1314.cn.domain.FoodType;
import acheng1314.cn.domain.ResponseCode;
import acheng1314.cn.service.FoodServiceImpl;
import acheng1314.cn.service.FoodTypeServiceImpl;
import acheng1314.cn.util.GsonUtils;
import com.baomidou.mybatisplus.mapper.Wrapper;
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

    @PostMapping(value = "/addFoods", produces = MediaType.TEXT_HTML_VALUE)
    @ApiOperation(value = "上传菜品", notes = "上传菜品到服务器")
    public String addFoods(@ApiParam(hidden = true) ModelMap map, Food food) {
        try {
            foodService.insertOne(food);
            map.addAttribute("msg", "菜品添加成功!");
        } catch (Exception e) {
            e.printStackTrace();
            map.addAttribute("msg", "菜品添加失败！原因：" + e.getMessage());
        }
        map.addAttribute("food", food);
        return addFood(map);
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

}
