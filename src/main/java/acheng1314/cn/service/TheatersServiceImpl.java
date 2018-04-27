package acheng1314.cn.service;

import acheng1314.cn.dao.TheatersDao;
import acheng1314.cn.domain.Theaters;
import acheng1314.cn.util.DateUtil;
import acheng1314.cn.util.okHi.OkHttpUtils;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import okhttp3.Response;
import org.springframework.stereotype.Service;

import java.io.IOException;


@Service("theatersService")
public class TheatersServiceImpl extends ServiceImpl<TheatersDao, Theaters> {

    public Theaters selectByCity(String city) throws Exception {
        //查找某个城市最近的数据，没有数据或者数据日期不同则拉取
        Theaters data = baseMapper.findLastData(city, DateUtil.INSTANCE.getDateDay());
        if (data == null) {
            Response response = OkHttpUtils.get("https://api.douban.com/v2/movie/in_theaters")
                    .params("city", city)
                    .execute();
            data = new Theaters();
            data.setData(response.body().string());
            data.setDate(DateUtil.INSTANCE.getDateDay());
            data.setCity(city);
            baseMapper.insert(data);
            return data;
        }
        return data;

    }
}
