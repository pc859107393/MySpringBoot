package acheng1314.cn.util;

import com.google.gson.*;
import com.google.gson.internal.ConstructorConstructor;
import com.google.gson.internal.bind.CollectionTypeAdapterFactory;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.JsonWriter;

import java.io.IOException;
import java.io.Reader;
import java.lang.reflect.Field;
import java.lang.reflect.Type;
import java.util.Map;

/**
 * Created by linjizong on 15/7/20.
 */
@SuppressWarnings("unchecked")
public class GsonUtils {

    private static Gson gson;


    /**
     * 自定义TypeAdapter ,null对象将被解析成空字符串
     */
    private static final TypeAdapter<String> STRING = new TypeAdapter<String>() {
        public String read(JsonReader reader) {
            try {
                if (reader.peek() == JsonToken.NULL) {
                    reader.nextNull();
                    return "";//原先是返回Null，这里改为返回空字符串
                }
                return reader.nextString();
            } catch (Exception e) {
                e.printStackTrace();
            }
            return "";
        }

        public void write(JsonWriter writer, String value) {
            try {
                if (value == null) {
                    writer.nullValue();
                    return;
                }
                writer.value(value);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    };

    /**
     * 自定义adapter，解决由于数据类型为Int,实际传过来的值为Float，导致解析出错的问题
     * 目前的解决方案为将所有Int类型当成Double解析，再强制转换为Int
     */
    private static final TypeAdapter<Number> INTEGER = new TypeAdapter<Number>() {
        @Override
        public Number read(JsonReader in) throws IOException {
            if (in.peek() == JsonToken.NULL) {
                in.nextNull();
                return 0;
            }
            try {
                double i = in.nextDouble();
                return (int) i;
            } catch (NumberFormatException e) {
                throw new JsonSyntaxException(e);
            }
        }

        @Override
        public void write(JsonWriter out, Number value) throws IOException {
            out.value(value);
        }
    };

    static {
        GsonBuilder gsonBulder = new GsonBuilder();
        gsonBulder.registerTypeAdapter(String.class, STRING);   //所有String类型null替换为字符串“”
        gsonBulder.registerTypeAdapter(int.class, INTEGER); //int类型对float做兼容
        gsonBulder.setDateFormat("yyyy-MM-dd HH:mm:ss");
        //通过反射获取instanceCreators属性
        try {
            Class builder = gsonBulder.getClass();
            Field f = builder.getDeclaredField("instanceCreators");
            f.setAccessible(true);
            //注册数组的处理器
            gsonBulder.registerTypeAdapterFactory(new CollectionTypeAdapterFactory(new ConstructorConstructor((Map<Type, InstanceCreator<?>>) f.get(gsonBulder))));
        } catch (Exception e) {
            e.printStackTrace();
        }
        gson = gsonBulder.create();
    }

    /**
     * Json字符串 转为指定对象
     *
     * @param json json字符串
     * @param type 对象类型
     * @param <T>  对象类型
     * @return
     * @throws JsonSyntaxException
     */
    public static <T> T toBean(String json, Class<T> type) throws JsonSyntaxException {
        return gson.fromJson(json, type);
    }

    /**
     * 将jsonStr转换为javaBean
     *
     * @param object
     * @return json string
     */
    public static String toJson(Object object) {
        return gson.toJson(object);
    }

    /**
     * 将jsonStr转换为javaBean
     *
     * @param json
     * @param type
     * @return instance of type
     */
    public static <V> V fromJson(String json, Class<V> type) {
        return gson.fromJson(json, type);
    }

    /**
     * 将jsonStr转换为javaBean
     *
     * @param json
     * @param type
     * @return instance of type
     */
    public static <V> V fromJson(String json, Type type) {
        return gson.fromJson(json, type);
    }

    /**
     * 将reader转换为javaBean
     *
     * @param reader
     * @param type
     * @return instance of type
     */
    public static <V> V fromJson(Reader reader, Class<V> type) {
        return gson.fromJson(reader, type);
    }

    /**
     * 将reader转换为javaBean
     *
     * @param reader
     * @param type
     * @return instance of type
     */
    public static <V> V fromJson(Reader reader, Type type) {
        return gson.fromJson(reader, type);
    }


}