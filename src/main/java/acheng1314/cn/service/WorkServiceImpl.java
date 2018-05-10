package acheng1314.cn.service;

import acheng1314.cn.dao.WorkDao;
import acheng1314.cn.domain.User;
import acheng1314.cn.domain.Works;
import acheng1314.cn.util.StringUtils;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service("workService")
public class WorkServiceImpl extends ServiceImpl<WorkDao, Works> {
    private Integer total;

    public ArrayList<Works> findByPage(Integer pageNum, Integer pageSize, User userInfo) {
        Pagination pagination = new Pagination(pageNum, pageSize);
        total = pagination.getPages();
        //管理员可以查看所有人的作品，其他人只能看自己的作品
        if (userInfo.getType().equals("admin"))
            return baseMapper.findAll(pagination);
        else return baseMapper.findAllByPage(pagination, userInfo.getId());
    }

    public Integer getTotal() {
        return total;
    }

    public ArrayList<Works> findNotRead() {
        return baseMapper.findNotRead();
    }

    public ArrayList<Works> findRead() {
        return baseMapper.findRead();
    }

    public void addScore(Works works) throws Exception {
        if (StringUtils.isEmpty(works.getComment())) {
            throw new Exception("评论不能为空！");
        }
        if (null == works.getScore())
            throw new Exception("分数不能为空！");
        try {
            Works select = baseMapper.selectById(works.getId());
            select.setComment(works.getComment());
            select.setScore(works.getScore());
            baseMapper.updateById(select);
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
    }
}
