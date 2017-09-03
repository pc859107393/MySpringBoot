package acheng1314.cn.controller.api;

import acheng1314.cn.domain.Goods;
import acheng1314.cn.domain.ResponseCode;
import acheng1314.cn.service.GoodsServiceImpl;
import acheng1314.cn.util.GsonUtils;
import com.baomidou.mybatisplus.plugins.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/endSys/api/goods")
public class SysGoodsApi {
    @Autowired
    private GoodsServiceImpl goodsService;

    @GetMapping(value = "/{pageNum}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public Object getGoodsList(@PathVariable(value = "pageNum", required = false) Integer pageNum) {
        if (null == pageNum) pageNum = 1;
        List<Goods> goodsList = goodsService.selectPage(new Page<Goods>(pageNum, 25)).getRecords();
        if (null != goodsList && goodsList.isEmpty()) return GsonUtils.toJsonObjStr(null, ResponseCode.EMPTY, null);
        return GsonUtils.toJsonObjStr(goodsList, ResponseCode.OK, "获取数据成功!");
    }

    @GetMapping(path = "/findByKeyword/{keyword}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public Object findByKeyword(@PathVariable("keyword") String keyword) {
        List<Goods> goodsList = goodsService.findByKeyword(keyword);
        if (null == goodsList || goodsList.isEmpty()) return GsonUtils.toJsonObjStr(null, ResponseCode.FAILED, null);
        return GsonUtils.toJsonObjStr(goodsList, ResponseCode.OK, "获取数据成功!");
    }

}
