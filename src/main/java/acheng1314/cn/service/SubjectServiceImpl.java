package acheng1314.cn.service;

import acheng1314.cn.dao.SubjectDao;
import acheng1314.cn.domain.Subject;
import acheng1314.cn.util.okHi.OkHttpUtils;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import okhttp3.Response;
import org.springframework.stereotype.Service;

@Service("subjectService")
public class SubjectServiceImpl extends ServiceImpl<SubjectDao, Subject> {

    public Subject findById(Long id) throws Exception {
        Subject subject = baseMapper.selectById(id);
        Response response = OkHttpUtils.get("https://api.douban.com/v2/movie/subject/" + id)
                .execute();
        if (null == subject) {
            subject = new Subject();
            subject.setId(id);
            subject.setData(response.body().string());
            baseMapper.insert(id, subject.getData());
        } else {
            subject.setData(response.body().string());
            baseMapper.updateById(subject);
        }
        return subject;
    }
}
