package acheng1314.cn.domain

import java.io.Serializable


open class ResponseObj : Serializable {
    open var code: Int = 0 // 状态码,1成功;-1空数据;0请求失败

    open var msg: String? = null

    open var data: Any? = null

    companion object {
        val OK = 1
        val FAILED = 0
        val EMPUTY = -1
        val OK_STR = "success"
        val FAILED_STR = "failed"
        val EMPUTY_STR = "empty"
    }

    constructor()

    constructor(code: Int, msg: String, data: Any) {
        this.code = code
        this.msg = msg
        this.data = data
    }

}
