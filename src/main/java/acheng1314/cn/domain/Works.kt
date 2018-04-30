package acheng1314.cn.domain

import com.baomidou.mybatisplus.activerecord.Model
import com.baomidou.mybatisplus.annotations.TableName
import java.util.*
import javax.validation.constraints.NotNull

@TableName("works")
open class Works : Model<Works>() {
    var id: Long? = null
    var userId: Long? = null
    var date: Date? = null
    @NotNull(message = "作品名称不能为空")
    var name: String? = null
    @NotNull(message = "作品描述不能为空")
    var content: String? = null
    var url: String? = null
    var comment: String? = null
    var score: Int? = null
    override fun pkVal() = id
}