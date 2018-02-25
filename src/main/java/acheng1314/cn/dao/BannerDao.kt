package acheng1314.cn.dao

import acheng1314.cn.domain.Banner
import com.baomidou.mybatisplus.mapper.BaseMapper
import org.apache.ibatis.annotations.Select
import org.springframework.stereotype.Repository

@Repository(value = "bannerDao")
interface BannerDao : BaseMapper<Banner> {

    @Select("SELECT * FROM `cc_banner` ORDER BY `id` DESC")
    fun findAll(): ArrayList<Banner>


    @Select("SELECT * FROM `cc_banner` WHERE `used` = 1 ORDER BY `id` DESC")
    fun findPublish(): ArrayList<Banner>
}