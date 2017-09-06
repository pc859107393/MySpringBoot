package acheng1314.cn.controller.api;

import acheng1314.cn.domain.Goods;
import acheng1314.cn.domain.ResponseCode;
import acheng1314.cn.domain.User;
import acheng1314.cn.service.GoodsServiceImpl;
import acheng1314.cn.util.GsonUtils;
import com.baomidou.mybatisplus.plugins.Page;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Api(description = "后台获取商品信息的API接口，需要用户登录权限！")
@RestController
@RequestMapping("/endSys/api/goods")
public class SysGoodsApi {
    @Autowired
    private GoodsServiceImpl goodsService;

    @ApiOperation(value = "获取商品的集合", notes = "商品信息分页查询")
    @GetMapping(value = "/{pageNum}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public Object getGoodsList(@PathVariable(value = "pageNum", required = false) Integer pageNum) {
        if (null == pageNum) pageNum = 1;
        List<Goods> goodsList = goodsService.selectPage(new Page<Goods>(pageNum, 25)).getRecords();
        if (null != goodsList && goodsList.isEmpty()) return GsonUtils.toJsonObjStr(null, ResponseCode.EMPTY, null);
        return GsonUtils.toJsonObjStr(goodsList, ResponseCode.OK, "获取数据成功!");
    }

    @ApiOperation(value = "根据关键字获取商品集合", notes = "关键字可以为商品名、商品编码、商品类型中的任意一段")
    @GetMapping(path = "/findByKeyword/{keyword}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public Object findByKeyword(@PathVariable("keyword") String keyword) {
        List<Goods> goodsList = goodsService.findByKeyword(keyword);
        if (null == goodsList || goodsList.isEmpty()) return GsonUtils.toJsonObjStr(null, ResponseCode.FAILED, null);
        return GsonUtils.toJsonObjStr(goodsList, ResponseCode.OK, "获取数据成功!");
    }

    @ApiOperation(value = "商品入库", notes = "商品入库，直接post商品集合的Json")
    @PostMapping(value = "/inHouse", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public Object postList(@RequestBody List<Goods> goodsList) {
        Map<String, Object> result = new HashMap<>();
        result.put("data", goodsList);
        return result;
    }

    @ApiOperation(value = "根据ID获取商品信息", notes = "获取商品信息，ID为商品主键")
    @GetMapping(value = "/getById/{id}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public Object getById(@PathVariable("id") Integer id) {
        Goods goods = goodsService.selectById(id);
        if (null == goods) return GsonUtils.toJsonObjStr(null, ResponseCode.FAILED, null);
        return GsonUtils.toJsonObjStr(goods, ResponseCode.OK, "获取数据成功！");
    }

}
