package acheng1314.cn.domain

import com.baomidou.mybatisplus.activerecord.Model
import com.baomidou.mybatisplus.annotations.TableName
import io.swagger.annotations.ApiParam
import java.io.Serializable
import java.util.*

@TableName(value = "cc_guard")
class Guard : Model<Guard>() {
    @ApiParam(required = false, value = "id插入时为空")
    var id: Long? = null

    @ApiParam(required = true, value = "标题")
    var title: String? = null

    @ApiParam(required = true, value = "创建时间")
    var date: Date? = null

    @ApiParam(required = true, value = "内容")
    var content: String? = null

    @ApiParam(required = false, value = "特色图片地址，使用\",\"分割")
    var cover: String? = null

    @ApiParam(required = true, value = "简单特色总结，使用\",\"分割")
    var description: String? = null

    override fun pkVal(): Serializable = this.id!!

    override fun toString(): String {
        return "Guard(id=$id, title=$title, date=$date, content=$content, cover=$cover, description=$description)"
    }


}