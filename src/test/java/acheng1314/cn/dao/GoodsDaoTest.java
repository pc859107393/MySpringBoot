package acheng1314.cn.dao;

import acheng1314.cn.BaseTest;
import acheng1314.cn.domain.Goods;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static org.junit.Assert.*;

public class GoodsDaoTest extends BaseTest {

    @Autowired
    private GoodsDao goodsDao;

    @Test
    public void addOneGoods() throws Exception {
        Goods goods = new Goods();
        goods.setName("考研政治马原专项突破");
        goods.setCode("9787121309789");
//        goods.setPosition("B区13库房131货架A13");
//        goods.setCost(48.00F);
//        goods.setSum(50000);
//        goods.setType("书籍-考研-计算机-王道论坛");
        goodsDao.addOneGoods(goods);
    }

    @Test
    public void updateSum() throws Exception {

    }

    @Test
    public void updateCost() throws Exception {

    }

    @Test
    public void selectByKeyword() throws Exception {
        List<Goods> goodsList = goodsDao.selectByKeyword("计算机");
        goodsList.forEach(goods -> loge(goods.toString()));
    }

}