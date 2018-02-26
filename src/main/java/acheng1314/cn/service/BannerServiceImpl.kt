package acheng1314.cn.service

import acheng1314.cn.dao.BannerDao
import acheng1314.cn.domain.Banner
import acheng1314.cn.util.StringUtils
import com.baomidou.mybatisplus.mapper.EntityWrapper
import com.baomidou.mybatisplus.mapper.Wrapper
import com.baomidou.mybatisplus.plugins.pagination.Pagination
import com.baomidou.mybatisplus.service.impl.ServiceImpl
import org.springframework.stereotype.Service
import java.io.Serializable

/**
 * 轮播图服务
 */
@Service(value = "bannerService")
class BannerServiceImpl : ServiceImpl<BannerDao, Banner>() {

    fun findAll(): ArrayList<Banner> = baseMapper.findAll()

    @Throws(Exception::class)
    override fun updateById(banner: Banner): Boolean {
        if (StringUtils.isEmpty(banner.title, banner.url, banner.pic)) {
            throw Exception("标题、网址和图片地址不能为空！")
        }
        if (null == banner.id || banner.id!! < 1) {
            throw Exception("未找到对应轮播图！")
        }
        return super.updateById(banner)
    }

    @Throws(Exception::class)
    override fun deleteById(id: Serializable): Boolean {
        val banner = baseMapper.selectById(id) ?: throw Exception("未找到该轮播图")
        banner.used = false
        return super.updateById(banner)
    }

    @Throws(Exception::class)
    fun findPublish(): ArrayList<Banner> {
        val result: ArrayList<Banner> = baseMapper.findPublish()
        if (result.isNotEmpty()) return result
        else throw Exception("暂无轮播图！")
    }

    @Throws(Exception::class)
    fun findallByPage(pageSize: Int, pageNum: Int) = try {
        baseMapper.findAllByPage(Pagination(pageNum, pageSize))
    } catch (e: Exception) {
        arrayListOf<Banner>()
    }
}