package acheng1314.cn.service;

import acheng1314.cn.dao.DutyDao;
import acheng1314.cn.domain.Duty;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service("dutyService")
public class DutyServiceImpl extends ServiceImpl<DutyDao, Duty> {
    @Autowired private DutyDao dutyDao;
    public ArrayList<Duty> selectAll() {
        return  dutyDao.selectAll();
    }
}
