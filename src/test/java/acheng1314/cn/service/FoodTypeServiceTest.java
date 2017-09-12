package acheng1314.cn.service;

import acheng1314.cn.BaseTest;
import acheng1314.cn.domain.FoodType;
import acheng1314.cn.domain.Page;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.*;

public class FoodTypeServiceTest extends BaseTest {

    @Autowired
    private FoodTypeService foodTypeService;

    @Test
    public void selectList() throws Exception {
        Page<FoodType> foodTypePage = foodTypeService.selectList(1, 20);
        loge("查询菜系的结果为：" + foodTypePage.toString());
    }

    @Test
    public void addFoodType() {
        FoodType foodType = new FoodType();
        foodType.setName("粤菜");
        foodType.setDescription("粤菜");
        foodType.setOther("据说广东人喜欢吃胡建人");
        foodTypeService.insert(foodType);
        loge("添加的菜系为：\t" + foodType.toString());
    }

}