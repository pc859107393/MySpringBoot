package acheng1314.cn.service;

import acheng1314.cn.dao.TopDao;
import acheng1314.cn.domain.Top;
import acheng1314.cn.util.DateUtil;
import acheng1314.cn.util.okHi.OkHttpUtils;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import okhttp3.Response;
import org.springframework.stereotype.Service;


@Service("topService")
public class TopServiceImpl extends ServiceImpl<TopDao, Top> {

    public Top selectByDate() throws Exception {
        //寻找今日的记录 存在则不刷新  否则刷新
        Top data = baseMapper.findLast(DateUtil.INSTANCE.getDateDay());
        if (data == null) {
            Response response = OkHttpUtils.get("https://api.douban.com/v2/movie/top250")
                    .execute();
            data = new Top();
            data.setData(response.body().string());
            data.setDate(DateUtil.INSTANCE.getDateDay());
            baseMapper.insert(data);
            return data;
        }
        return data;
    }
}
