package acheng1314.cn.domain

import com.baomidou.mybatisplus.activerecord.Model
import com.baomidou.mybatisplus.annotations.TableName
import org.hibernate.validator.constraints.NotEmpty
import java.util.*
import javax.validation.constraints.NotNull

/**
 * 房屋的基本信息
 * @see <a herf="https://www.muniao.com/shanghai/#chat@723302"/>
 */
@TableName("cc_base_house")
class BaseHouse : Model<BaseHouse>() {
    override fun pkVal() = id

    var id: Long? = null    //主键

    @NotEmpty(message = "房源名称不能为空!")
    var name: String? = null   //标题

    @NotEmpty(message = "户型不能为空")
    var houseType: String? = null   //户型

    var rentType: String? = null    //租售类型

    var liveNum: Int? = null    //居住人数

    @NotEmpty(message = "地址不能为空！")
    var address: String? = null //地址

    var longitude: Double? = null    //经度

    var latitude: Double? = null //纬度

    @NotNull(message = "房屋归属人不能为空！")
    var householdId: Long? = null    //户主ID

    var used: Boolean? = false

    var status: Int? = null

    @NotNull(message = "创建时间不能为空")
    var date: Date? = null

}