package acheng1314.cn.service;

import acheng1314.cn.dao.ClassDao;
import acheng1314.cn.domain.Clazz;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service("classService")
public class ClassServiceImpl extends ServiceImpl<ClassDao, Clazz> {
    private Integer total = 0;

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public ArrayList<Clazz> findByPage(Integer pageNum, Integer pageSize) {
        Pagination pagination = new Pagination(pageNum, pageSize);
        setTotal(pagination.getPages());
        return baseMapper.findAllByPage(pagination);
    }
}
