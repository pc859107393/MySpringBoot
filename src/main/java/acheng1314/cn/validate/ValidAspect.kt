package acheng1314.cn.validate

import acheng1314.cn.validate.annotation.BeanValid
import org.aspectj.lang.ProceedingJoinPoint
import org.slf4j.LoggerFactory
import org.springframework.stereotype.Component
import org.aspectj.lang.JoinPoint
import org.aspectj.lang.annotation.*


//@Aspect
@Component
class ValidAspect {

    var logger = LoggerFactory.getLogger(this.javaClass)

    @Pointcut(value = "@annotation(acheng1314.cn.validate.annotation.BeanValid) && (args(..))")
    fun checkParam() {
    }

    @Before("checkParam()")
    fun doBefore(joinPoint: JoinPoint) {
    }

    /**
     * 在切入点return内容之后切入内容（可以用来对处理返回值做一些加工处理）
     *
     * @param joinPoint
     */
    @AfterReturning("checkParam()")
    fun doAfterReturning(joinPoint: JoinPoint) {
    }

    @Around(value = "checkParam()")
    @Throws(Exception::class)
    fun checkArgs(join: ProceedingJoinPoint, valid: BeanValid): Any {
        val args = join.args
        println("进入了切面")
        args.forEach { any: Any? ->
            if (any != null) {
                BeanValidator.validate(any)
            }
        }
        return join.proceed()
    }

}