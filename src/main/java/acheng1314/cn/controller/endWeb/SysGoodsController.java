package acheng1314.cn.controller.endWeb;

import acheng1314.cn.domain.Goods;
import acheng1314.cn.service.GoodsServiceImpl;
import acheng1314.cn.util.StringUtils;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
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
@Api(description = "商品控制器，控制后台访问商品信息相关")
public class SysGoodsController {

    @Autowired
    private GoodsServiceImpl goodsService;

    @GetMapping(path = "/goodsIndex", produces = MediaType.TEXT_HTML_VALUE)
    @ApiOperation(value = "仓库系统主页", notes = "仓库系统主页")
    public String goodsIndex(@ApiParam(value = "页码") @RequestParam(value = "pageNum", required = false) Integer pageNum
            , @ApiParam(hidden = true) ModelMap map) {
        if (null == pageNum) pageNum = 1;
        map.addAttribute("list", goodsService.selectPage(new Page<Goods>(pageNum, 25)).getRecords());
        return "end/goods/home";
    }

    @GetMapping(path = "/goodsAll", produces = MediaType.TEXT_HTML_VALUE)
    @ApiOperation(value = "库存商品", notes = "库存商品查看")
    public String goodsAll(@ApiParam(value = "页码") @RequestParam(value = "pageNum", required = false) Integer pageNum
            , @ApiParam(hidden = true) ModelMap map) {
        if (null == pageNum) pageNum = 1;
        map.addAttribute("list", goodsService.selectPage(new Page<>(pageNum, 25)).getRecords());
        map.addAttribute("pageNum", pageNum);
//        map.addAttribute("pageTotal", goodsService.selectCount(new EntityWrapper<>()));
        return "end/goods/allGoods";
    }

    @GetMapping(path = "/addGoods/{id}", produces = MediaType.TEXT_HTML_VALUE)
    @ApiOperation(value = "添加商品页面", notes = "添加商品,商品ID不存在则是添加和入库，否则只有入库")
    public String addGoods(@ApiParam(value = "商品id") @PathVariable(value = "id", required = false) Long id
            , @ApiParam(hidden = true) ModelMap map) {
        if (null != id && id > 0) map.addAttribute("goods", goodsService.selectById(id));
        return "end/goods/addGoods";
    }

    @PostMapping(path = "/addGoods", produces = MediaType.TEXT_HTML_VALUE)
    @ApiOperation(value = "添加商品", notes = "添加商品")
    public String addGoods(@ApiParam(value = "商品") Goods goods
            , @ApiParam(hidden = true) ModelMap map) {
        try {
            if (null == goods || StringUtils.isEmpty(goods.getName(), goods.getCode())) {
                map.addAttribute("msg", "商品名称和编码不能为空!");
                return addGoods(0L, map);
            }
            goodsService.addOneGoods(goods); //添加商品
            map.addAttribute("msg", "添加商品成功!");
        } catch (Exception e) {
            e.printStackTrace();
            map.addAttribute("msg", "添加商品失败，已经有该编码!");
        }
        return addGoods(goods.getId(), map);
    }

    @ApiOperation(value = "入库主页", notes = "入库主页，必须存在商品才能入库。入库改变库存和单价")
    @GetMapping(path = "/inHouse", produces = MediaType.TEXT_HTML_VALUE)
    public String inHouse(@ApiParam(hidden = true) ModelMap map) {
        return "end/goods/inHouse";
    }



}
