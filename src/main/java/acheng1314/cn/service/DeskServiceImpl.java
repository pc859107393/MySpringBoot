package acheng1314.cn.service;

import acheng1314.cn.dao.DeskDao;
import acheng1314.cn.domain.Desk;
import acheng1314.cn.domain.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("deskService")
public class DeskServiceImpl extends ServiceImpl<DeskDao, Desk> {

    @Autowired
    private DeskDao deskDao;

    public int insertSelective(Desk pojo) {
        return deskDao.insertSelective(pojo);
    }

    public int insertList(List<Desk> pojos) {
        return deskDao.insertList(pojos);
    }

    public int update(Desk pojo) {
        return deskDao.update(pojo);
    }

    protected Integer getTotalNum(Integer pageSize) {
        int allCount = baseMapper.getCount();
        //在每页固定条数下能不能分页完成，有余则加一页码
        return allCount % pageSize > 0 ? allCount / pageSize + 1 : allCount / pageSize;
    }

    public Page<Desk> selectList(int pageNum, int pageSize) {
        Page<Desk> result = new Page<>(pageNum, pageSize);
        pageNum -= 1;
        result.setData(baseMapper.selectList(pageNum * pageSize, pageSize));
        result.setTotalNum(getTotalNum(pageSize));
        return result;
    }

}
