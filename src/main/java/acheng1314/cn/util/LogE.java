package acheng1314.cn.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by pc on 2017/3/30.
 */
public final class LogE {

    private static Logger logger = null;

    private LogE(Class clazz) {
        logger = LoggerFactory.getLogger(clazz.getClass());
    }

    public static LogE getInstance(Class<? extends Object> clazz) {
        return new LogE(clazz);
    }


    public void beforeLog() {
        logger.info("======> start <======");
    }

    public void logOut(String s) {
        logger.info("======> " + s + " <======");
    }

    public void afterLog() {
        logger.info("======> end <======");
    }

    public void logOutLittle(String s) {
        beforeLog();
        logOut(s);
        afterLog();
        System.err.println("======>\n" + s + "\n");
    }
}
