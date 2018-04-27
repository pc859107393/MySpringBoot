package acheng1314.cn.service;

import acheng1314.cn.dao.SearchDao;
import acheng1314.cn.domain.Search;
import acheng1314.cn.util.DateUtil;
import acheng1314.cn.util.okHi.OkHttpUtils;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import okhttp3.Response;
import org.springframework.stereotype.Service;

@Service("searchService")
public class SearchServiceImpl extends ServiceImpl<SearchDao, Search> {

    public Search selectByKeyword(String keyword, String Type) throws Exception {
        Search result = null;
        if (Type.equals("q")) {
            result = baseMapper.findLastQ(keyword, DateUtil.INSTANCE.getDateDay());
        } else {
            result = baseMapper.findLastTag(keyword, DateUtil.INSTANCE.getDateDay());
        }

        if (null == result) {
            result = new Search();
            Response execute;
            if (Type.equals("q")) {
                result.setType("q");
                execute = OkHttpUtils.get("https://api.douban.com//v2/movie/search?q=" + keyword).execute();
            } else {
                result.setType("tag");
                execute = OkHttpUtils.get("https://api.douban.com//v2/movie/search?tag=" + keyword).execute();
            }
            result.setData(execute.body().string());
            result.setDate(DateUtil.INSTANCE.getDateDay());
            result.setKeyword(keyword);
            baseMapper.insert(result);
            return result;
        }
        return result;
    }
}
