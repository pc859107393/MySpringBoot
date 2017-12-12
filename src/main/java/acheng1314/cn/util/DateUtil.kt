package acheng1314.cn.util

import java.text.ParseException
import java.text.SimpleDateFormat
import java.util.*


/**
 * 时间工具类
 * Created by cheng on 2017/12/1.
 */
object DateUtil {

    private val dateFormater = object : ThreadLocal<SimpleDateFormat>() {
        override fun initialValue(): SimpleDateFormat {
            return SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
        }
    }

    private val dateFormater2 = object : ThreadLocal<SimpleDateFormat>() {
        override fun initialValue(): SimpleDateFormat {
            return SimpleDateFormat("yyyy-MM-dd")
        }
    }

    fun int2Date(timestampString: String): String {
        val timestamp = java.lang.Long.parseLong(timestampString) * 1000
        return SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Date(timestamp))
    }

    fun int2Time(timestampString: String): String {
        val timestamp = java.lang.Long.parseLong(timestampString) * 1000
        return SimpleDateFormat("HH:mm:ss").format(Date(timestamp))
    }


    /**
     * 将字符串转位日期类型
     *
     * @param sdate
     * @return
     */
    fun toDate(sdate: String): Date? {
        return toDate(sdate, dateFormater.get())
    }

    fun toDate(sdate: String, dateFormater: SimpleDateFormat): Date? {
        try {
            return dateFormater.parse(sdate)
        } catch (e: ParseException) {
            return null
        }

    }

    /**
     * 判断用户的设备时区是否为东八区（中国） 2014年7月31日
     *
     * @return
     */
    fun isInEasternEightZones(): Boolean {
        return TimeZone.getDefault() === TimeZone.getTimeZone("GMT+08")
    }

    /**
     * 根据不同时区，转换时间 2014年7月31日
     */
    fun transformTime(date: Date?, oldZone: TimeZone,
                      newZone: TimeZone): Date? {
        var finalDate: Date? = null
        if (date != null) {
            val timeOffset = oldZone.getOffset(date.time) - newZone.getOffset(date.time)
            finalDate = Date(date.time - timeOffset)
        }
        return finalDate
    }


    /**
     * 以友好的方式显示时间
     *
     * @param sdate
     * @return
     */
    fun friendlyTime(sdate: String): String {
        var time: Date?

        if (isInEasternEightZones()) {
            time = toDate(sdate)
        } else {
            time = transformTime(toDate(sdate), TimeZone.getTimeZone("GMT+08"),
                    TimeZone.getDefault())
        }

        if (time == null) {
            return "Unknown"
        }
        val ftime: String
        val cal = Calendar.getInstance()

        // 判断是否是同一天
        val curDate = dateFormater2.get().format(cal.time)
        val paramDate = dateFormater2.get().format(time)
        if (curDate == paramDate) {
            val hour = ((cal.timeInMillis - time.time) / 3600000).toInt()
            if (hour == 0)
                ftime = Math.max(
                        (cal.timeInMillis - time.time) / 60000, 1).toString() + "分钟前"
            else
                ftime = hour.toString() + "小时前"
            return ftime
        }

        val lt = time.time / 86400000
        val ct = cal.timeInMillis / 86400000
        val days = (ct - lt).toInt()
        if (days == 0) {
            val hour = ((cal.timeInMillis - time.time) / 3600000).toInt()
            if (hour == 0)
                ftime = Math.max(
                        (cal.timeInMillis - time.time) / 60000, 1).toString() + "分钟前"
            else
                ftime = hour.toString() + "小时前"
        } else if (days == 1) {
            ftime = "昨天"
        } else if (days == 2) {
            ftime = "前天 "
        } else if (days in 3..30) {
            ftime = days.toString() + "天前"
        } else if (days >= 31 && days <= 2 * 31) {
            ftime = "一个月前"
        } else if (days > 2 * 31 && days <= 3 * 31) {
            ftime = "2个月前"
        } else if (days > 3 * 31 && days <= 4 * 31) {
            ftime = "3个月前"
        } else {
            ftime = dateFormater2.get().format(time)
        }
        return ftime
    }

    private val sdfYear = SimpleDateFormat("yyyy")

    private val sdfDay = SimpleDateFormat("yyyy-MM-dd")

    private val sdfDays = SimpleDateFormat("yyyyMMdd")

    private val sdfTime = SimpleDateFormat("yyyy-MM-dd HH:mm:ss")

    /**
     * 获取YYYY格式
     *
     * @return
     */
    fun getYear(): String {
        return sdfYear.format(Date())
    }

    /**
     * 获取YYYY-MM-DD格式
     *
     * @return
     */
    fun getDay(): String {
        return sdfDay.format(Date())
    }

    /**
     * 获取YYYYMMDD格式
     *
     * @return
     */
    fun getDays(): String {
        return sdfDays.format(Date())
    }

    /**
     * 获取YYYY-MM-DD HH:mm:ss格式
     *
     * @return
     */
    fun getTime(): String {
        return sdfTime.format(Date())
    }


    /**
     * 格式化日期
     *
     * @return
     */
    fun fomatDate(date: String): Date? {
        val fmt = SimpleDateFormat("yyyy-MM-dd")
        try {
            return fmt.parse(date)
        } catch (e: ParseException) {
            e.printStackTrace()
            return null
        }

    }

    /**
     * 返回格式化的日期
     *
     * @return
     */
    fun getDate(): Date {
        val date = Date()
        val fmt = SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
        fmt.format(date)
        return date
    }

    /**
     * 校验日期是否合法
     *
     * @return
     */
    fun isValidDate(s: String): Boolean {
        val fmt = SimpleDateFormat("yyyy-MM-dd")
        try {
            fmt.parse(s)
            return true
        } catch (e: Exception) {
            // 如果throw java.text.ParseException或者NullPointerException，就说明格式不对
            return false
        }

    }

    fun getDiffYear(startTime: String, endTime: String): Int {
        val fmt = SimpleDateFormat("yyyy-MM-dd")
        return try {
            ((fmt.parse(endTime).time - fmt.parse(startTime).time) / (1000 * 60 * 60 * 24) / 365).toInt()
        } catch (e: Exception) {
            // 如果throw java.text.ParseException或者NullPointerException，就说明格式不对
            0
        }

    }

    /**
     *  * 功能描述：时间相减得到天数
     *
     * @param beginDateStr
     * @param endDateStr
     * @return long
     * @author Administrator
     */
    fun getDaySub(beginDateStr: String, endDateStr: String): Long {
        val day: Long
        val format = java.text.SimpleDateFormat("yyyy-MM-dd")
        var beginDate: java.util.Date? = null
        var endDate: java.util.Date? = null

        try {
            beginDate = format.parse(beginDateStr)
            endDate = format.parse(endDateStr)
        } catch (e: ParseException) {
            e.printStackTrace()
        }

        day = (endDate!!.time - beginDate!!.time) / (24 * 60 * 60 * 1000)
        //System.out.println("相隔的天数="+day);

        return day
    }

    /**
     * 获取整形的时间
     * @return
     */
    fun getIntTime(): Int? {
        return (System.currentTimeMillis() / 1000).toInt()
    }

    /**
     * 得到n天之后的日期
     *
     * @param days
     * @return
     */
    fun getAfterDayDate(days: String): String {
        val daysInt = Integer.parseInt(days)

        val canlendar = Calendar.getInstance() // java.util包
        canlendar.add(Calendar.DATE, daysInt) // 日期减 如果不够减会将月变动
        val date = canlendar.time

        val sdfd = SimpleDateFormat("yyyy-MM-dd HH:mm:ss")

        return sdfd.format(date)
    }

    /**
     * 得到n天之后是周几
     *
     * @param days
     * @return
     */
    fun getAfterDayWeek(days: String): String {
        val daysInt = Integer.parseInt(days)

        val canlendar = Calendar.getInstance() // java.util包
        canlendar.add(Calendar.DATE, daysInt) // 日期减 如果不够减会将月变动
        val date = canlendar.time

        val sdf = SimpleDateFormat("E")

        return sdf.format(date)
    }


}