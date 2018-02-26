package acheng1314.cn.domain

/**
 * 数据类，封装列表返回
 */
class ResponseList(var pageNum: Int?, var pageSize: Int?
                   , code: Int, msg: String?, data: Any?) : ResponseObj(code, msg!!, data!!)