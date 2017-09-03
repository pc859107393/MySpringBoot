package acheng1314.cn.service;

import acheng1314.cn.dao.GoodsDao;
import acheng1314.cn.domain.Goods;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("goodsService")
public class GoodsServiceImpl extends ServiceImpl<GoodsDao, Goods> {

    @Autowired
    private GoodsDao goodsDao;

    @Override
    public Page<Goods> selectPage(Page<Goods> page) {
        return super.selectPage(page);
    }

    @Override
    public boolean insertOrUpdate(Goods entity) {
        return super.insertOrUpdate(entity);
    }

    @Transactional
    public void addOneGoods(Goods entity) {
        goodsDao.addOneGoods(entity);
    }

    public List<Goods> findByKeyword(String keyword) {
        return goodsDao.selectByKeyword(keyword);
    }
}
