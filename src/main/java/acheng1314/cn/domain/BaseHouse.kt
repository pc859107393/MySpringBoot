package acheng1314.cn.domain

import com.baomidou.mybatisplus.activerecord.Model

/**
 * 房屋的基本信息
 * @see <a herf="https://www.muniao.com/shanghai/#chat@723302"/>
 */
class BaseHouse : Model<BaseHouse>() {
    override fun pkVal() = id

    var id: Long? = null    //主键

    var title: String? = null   //标题

    var houseType: String? = null   //户型

    var rentType: String? = null    //租售类型

    var liveNum: Int? = null    //居住人数

    var address: String? = null //地址

    var longitude: Double? = null    //经度

    var latitude: Double? = null //纬度

    var householdId: Long? = null    //户主ID


}