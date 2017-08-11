package acheng1314.cn.domain;

/**
 * Created by cheng on 17/5/5.
 */
public enum ResponseCode {

    OK(1,"success"),FAILED(0,"failed"),EMPTY(-1,"empty");

    private final int code;
    private final String msg;

    ResponseCode(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public int getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }
}
