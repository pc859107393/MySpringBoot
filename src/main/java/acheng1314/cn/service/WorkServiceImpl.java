package acheng1314.cn.service;

import acheng1314.cn.dao.WorkDao;
import acheng1314.cn.domain.Works;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service("workService")
public class WorkServiceImpl extends ServiceImpl<WorkDao, Works> {
    private Integer total;

    public ArrayList<Works> findByPage(Integer pageNum, Integer pageSize) {
        Pagination pagination = new Pagination(pageNum, pageSize);
        total = pagination.getPages();
        return baseMapper.findAllByPage(pagination);
    }

    public Integer getTotal() {
        return total;
    }
}
