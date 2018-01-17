package acheng1314.cn.domain

import java.io.Serializable


class ResponseObj<T> : Serializable {

    var code: Int = 0 // 状态码,0成功;1空数据;-1请求失败
    var msg: String? = null
    var data: T? = null

    companion object {
        val OK = 1
        val FAILED = 0
        val EMPUTY = -1
        val OK_STR = "success"
        val FAILED_STR = "failed"
        val EMPUTY_STR = "empty"
    }

}
