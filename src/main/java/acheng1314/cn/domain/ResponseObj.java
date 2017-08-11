package acheng1314.cn.domain;

public class ResponseObj<T> {
	public final static int OK = 1, FAILED = 0, EMPUTY = -1;
	public final static String OK_STR = "success", FAILED_STR = "failed", EMPUTY_STR = "empty";

	private int code; // 状态码,0成功;1空数据;-1请求失败
	private String msg;
	private Object data;

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

}
