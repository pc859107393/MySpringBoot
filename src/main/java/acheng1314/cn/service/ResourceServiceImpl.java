package acheng1314.cn.service;

import acheng1314.cn.dao.ResourceDao;
import acheng1314.cn.domain.Resource;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service("resourceService")
public class ResourceServiceImpl extends ServiceImpl<ResourceDao, Resource> {
    private Integer total = 0;

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public ArrayList<Resource> findByPage(Integer pageNum, Integer pageSize) {
        Pagination pagination = new Pagination(pageNum, pageSize);
        setTotal(pagination.getPages());
        return baseMapper.findAllByPage(pagination);
    }
}
