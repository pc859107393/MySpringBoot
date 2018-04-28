package acheng1314.cn.service;

import acheng1314.cn.dao.CelebrityDao;
import acheng1314.cn.domain.Celebrity;
import acheng1314.cn.util.okHi.OkHttpUtils;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import okhttp3.Response;
import org.springframework.stereotype.Service;

@Service("celebrityService")
public class CelebrityServiceImpl extends ServiceImpl<CelebrityDao, Celebrity> {

    public Celebrity findById(Long id) throws Exception {
        Celebrity celebrity = baseMapper.selectById(id);
        Response response = OkHttpUtils.get("https://api.douban.com/v2/movie/celebrity/" + id)
                .execute();
        if (null == celebrity) {
            celebrity = new Celebrity();
            celebrity.setId(id);
            celebrity.setData(response.body().string());
            baseMapper.insert(id, celebrity.getData());
        } else {
            celebrity.setData(response.body().string());
            baseMapper.updateById(celebrity);
        }
        return celebrity;
    }
}
