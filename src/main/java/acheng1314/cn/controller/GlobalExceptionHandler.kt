package acheng1314.cn.controller


import org.springframework.web.bind.annotation.ControllerAdvice
import org.springframework.web.bind.annotation.ExceptionHandler
import org.springframework.web.servlet.ModelAndView

import javax.servlet.http.HttpServletRequest

@ControllerAdvice
class GlobalExceptionHandler {

    @ExceptionHandler(value = [(Exception::class)])
    @Throws(Exception::class)
    fun defaultErrorHandler(req: HttpServletRequest, e: Exception): ModelAndView {
        val mav = ModelAndView()
        mav.addObject("exception", e)
        mav.addObject("url", req.requestURL)
        mav.viewName = DEFAULT_ERROR_VIEW
        return mav
    }

    companion object {
        val DEFAULT_ERROR_VIEW = "error"
    }
}