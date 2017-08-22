package acheng1314.cn.shiro;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by cheng on 17/5/18.
 */
public class PermissionUtil {
    private final static String POST_CENTER = "文章中心"
            , MSG_CENTER = "留言管理"
            , MEDIA_CENTER = "多媒体管理"
            , API_CENTER = "API系统"
            , USER_CENTER = "用户管理"
            , WEXIN_CENTER = "微信管理"
            , SYSTEM_CENTER = "服务器中心";

    /**
     * 获取管理员权限
     * @return  返回管理员权限集合
     */
    public static List<String> getAdminPer(){
        List<String> list = new ArrayList<>();
        list.add(POST_CENTER);
        list.add(MSG_CENTER);
        list.add(MEDIA_CENTER);
        list.add(API_CENTER);
        list.add(USER_CENTER);
        list.add(WEXIN_CENTER);
        list.add(SYSTEM_CENTER);
        return list;
    }

    public static List<String> getOtherPer(){
        List<String> list = new ArrayList<>();
        list.add(POST_CENTER);
        list.add(MSG_CENTER);
        list.add(MEDIA_CENTER);
        return list;
    }
}
