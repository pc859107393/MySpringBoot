package acheng1314.cn.domain

import com.baomidou.mybatisplus.activerecord.Model
import com.baomidou.mybatisplus.annotations.TableName
import io.swagger.annotations.ApiParam
import java.io.Serializable

/**
 * 轮播图<br/>
 * @param id 自增主键
 * @param title 轮播图标题
 * @param url 跳转链接
 * @param pic 图片地址
 * @param other 备注
 * @param used 是否可用
 */
@TableName(value = "cc_banner")
class Banner : Model<Banner>() {
    @ApiParam(required = false, value = "id插入时为空")
    var id: Long? = null

    @ApiParam(required = true, value = "标题")
    var title: String? = null

    @ApiParam(required = true, value = "目标网址")
    var url: String? = null

    @ApiParam(required = true, value = "图片地址")
    var pic: String? = null

    @ApiParam(required = false, value = "备注")
    var other: String? = null

    @ApiParam(required = true, value = "是否可用")
    var used: Boolean? = true

    override fun pkVal(): Serializable = this.id!!
    override fun toString(): String {
        return "Banner(id=$id, title=$title, url=$url, pic=$pic, other=$other, used=$used)"
    }

}