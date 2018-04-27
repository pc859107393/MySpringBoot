package acheng1314.cn.service;

import acheng1314.cn.dao.ComingDao;
import acheng1314.cn.domain.ComeSoon;
import acheng1314.cn.util.DateUtil;
import acheng1314.cn.util.okHi.OkHttpUtils;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import okhttp3.Response;
import org.springframework.stereotype.Service;


@Service("comingService")
public class ComingServiceImpl extends ServiceImpl<ComingDao, ComeSoon> {

    public ComeSoon selectByDate() throws Exception {
        //寻找今日的记录 存在则不刷新  否则刷新
        ComeSoon data = baseMapper.findLast(DateUtil.INSTANCE.getDateDay());
        if (data == null) {
            Response response = OkHttpUtils.get("https://api.douban.com/v2/movie/coming_soon")
                    .execute();
            data = new ComeSoon();
            data.setData(response.body().string());
            data.setDate(DateUtil.INSTANCE.getDateDay());
            baseMapper.insert(data);
            return data;
        }
        return data;
    }
}
