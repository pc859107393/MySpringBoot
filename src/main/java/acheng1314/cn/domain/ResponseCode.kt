package acheng1314.cn.domain


/**
 * Created by cheng on 17/5/5.
 */
enum class ResponseCode(val code: Int, val msg: String) {

    OK(1, "success"), FAILED(0, "failed"), EMPTY(-1, "empty")
}
