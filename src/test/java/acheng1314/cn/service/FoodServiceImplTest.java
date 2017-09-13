package acheng1314.cn.service;

import acheng1314.cn.BaseTest;
import acheng1314.cn.domain.Food;
import acheng1314.cn.domain.FoodType;
import acheng1314.cn.domain.Page;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.*;

public class FoodServiceImplTest extends BaseTest {
    @Autowired
    private FoodServiceImpl foodService;

    @Test
    public void selectList() {
        Page<Food> foodTypePage = foodService.selectList(1, 25);
        loge("检查我的分页工具是否成功：" + foodTypePage.toString());
    }

    @Test
    public void getPageNum() {
        loge("页码：" + foodService.getTotalNum(10));
    }
}