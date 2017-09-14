package acheng1314.cn.service;

import acheng1314.cn.dao.FoodDao;
import acheng1314.cn.domain.Food;
import acheng1314.cn.domain.Page;
import acheng1314.cn.util.StringUtils;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("foodService")
public class FoodServiceImpl extends ServiceImpl<FoodDao, Food> {

    private final FoodDao foodDao;

    @Autowired
    public FoodServiceImpl(FoodDao foodDao) {
        this.foodDao = foodDao;
    }

    public Integer getTotalNum(Integer pageSize) {
        int allCount = baseMapper.getCount();
        //在每页固定条数下能不能分页完成，有余则加一页码
        return allCount % pageSize > 0 ? allCount / pageSize + 1 : allCount / pageSize;
    }

    public Page<Food> selectList(int pageNum, int pageSize) {
        Page<Food> result = new Page<>(pageNum, pageSize);
        pageNum -= 1;
        result.setData(baseMapper.selectList(pageNum * pageSize, pageSize));
        result.setTotalNum(getTotalNum(pageSize));
        return result;
    }

    public void insertOne(Food food) throws Exception {
        if (StringUtils.isEmpty(food.getName())) throw new Exception("菜品名称不能为空！");
        super.baseMapper.insert(food);
    }


    public void deleteById(Integer id) {
        baseMapper.deleteOneById(id);
    }
}
