package acheng1314.cn.service;

import acheng1314.cn.dao.FoodTypeDao;
import acheng1314.cn.domain.FoodType;
import acheng1314.cn.domain.Page;
import acheng1314.cn.util.LogE;
import acheng1314.cn.util.StringUtils;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

@Service("foodTypeService")
public class FoodTypeServiceImpl extends ServiceImpl<FoodTypeDao, FoodType> {

    public Page<FoodType> selectList(Integer pageNum, Integer pageSize) {
        Page<FoodType> result = new Page<>(pageNum.hashCode(), pageSize.hashCode());
        pageNum -= 1;
        result.setData(baseMapper.selectList(pageNum * pageSize, pageSize));
        result.setTotalNum(getTotalNum(pageSize));
        LogE.getInstance(this.getClass()).logOutLittle(result.toString());
        return result;
    }

    public Integer getTotalNum(Integer pageSize) {
        int allCount = baseMapper.getCount();
        //在每页固定条数下能不能分页完成，有余则加一页码
        return allCount % pageSize > 0 ? allCount / pageSize + 1 : allCount / pageSize;
    }


    public void insertOne(FoodType entity) throws Exception {
        if (StringUtils.isEmpty(entity.getName())) throw new Exception("菜系名称不能为空!");
        super.insert(entity);
    }

    @Override
    public boolean updateById(FoodType entity) {
        return baseMapper.update(entity) > 0;
    }
}
