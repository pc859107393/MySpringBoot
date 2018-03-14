package acheng1314.cn.data

import acheng1314.cn.domain.Guard
import acheng1314.cn.util.StringUtils
import java.io.Serializable

data class DataGuard(val title: String?
                     , val content: String?
                     , val cover1: String?
                     , val cover2: String?
                     , val cover3: String?
                     , val cover4: String?
                     , val description1: String?
                     , val description2: String?
                     , val description3: String?
                     , val description4: String?) : Serializable {

    val convert2Guard: Guard
        get() {
            val result = Guard()
            result.title = title
            result.content = content
            result.cover = StringBuffer()
                    .append(if (!StringUtils.isEmpty(cover1)) cover1!! + "," else "")
                    .append(if (!StringUtils.isEmpty(cover2)) cover2!! + "," else "")
                    .append(if (!StringUtils.isEmpty(cover3)) cover3!! + "," else "")
                    .append(if (!StringUtils.isEmpty(cover4)) cover4!! else "")
                    .toString()

            result.description = StringBuffer()
                    .append(if (!StringUtils.isEmpty(description1)) description1!! + "," else "")
                    .append(if (!StringUtils.isEmpty(description2)) description2!! + "," else "")
                    .append(if (!StringUtils.isEmpty(description3)) description3!! + "," else "")
                    .append(if (!StringUtils.isEmpty(description4)) description4!! else "")
                    .toString()

            return result
        }
}