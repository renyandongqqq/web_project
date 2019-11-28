package com.mnkj.utils;

import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.io.IOException;
import java.util.*;

public abstract class JsonUtils {
    private static final Logger logger = LoggerFactory.getLogger(JsonUtils.class);

    private static final ObjectMapper mapper = new ObjectMapper();

    private static JavaType getCollectionType(Class<?> collectionClass, Class<?>... elementClasses) {
        return mapper.getTypeFactory().constructParametricType(collectionClass, elementClasses);
    }

    public static boolean isJson(String content) {
        try {
            JSONObject.parseObject(content);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @SuppressWarnings("unchecked")
    public static Map<String, Object> toMap(String json) {
        try {
            Map<String, Object> map = mapper.readValue(json, Map.class);
            return map;
        } catch (IOException e) {
            logger.error(e.getMessage(), e);
        }
        return null;
    }

    /**
     * JSON转对象
     *
     * @param json  JSON字符串
     * @param clazz 泛型类
     */
    public static <E> E toObject(String json, Class<E> clazz) {
        E obj = null;
        try {
            obj = (E) mapper.readValue(json, clazz);
        } catch (IOException e) {
            logger.error(e.getMessage(), e);
        }
        return obj;
    }

    /**
     * JSON转List
     *
     * @param json  JSON字符串
     * @param clazz 泛型类
     */
    @SuppressWarnings("unchecked")
    public static <E> List<E> toObjectList(String json, Class<E> clazz) {
        JavaType javaType = getCollectionType(ArrayList.class, clazz);
        List<E> list = null;
        try {
            list = (List<E>) mapper.readValue(json, javaType);
        } catch (IOException e) {
            logger.error(e.getMessage(), e);
        }
        return list;
    }

    /**
     * JSON转Set
     *
     * @param json  JSON字符串
     * @param clazz 泛型类
     */
    @SuppressWarnings("unchecked")
    public static <E> Set<E> toObjectSet(String json, Class<E> clazz) {
        JavaType javaType = getCollectionType(LinkedHashSet.class, clazz);
        Set<E> list = null;
        try {
            list = (Set<E>) mapper.readValue(json, javaType);
        } catch (IOException e) {
            logger.error(e.getMessage(), e);
        }
        return list;
    }

    /**
     * 对象转JSON
     */
    public static String toJSONString(Object obj) {
        try {
            return mapper.writeValueAsString(obj);
        } catch (JsonProcessingException e) {
            logger.error(e.getMessage(), e);
        }
        return null;
    }


    /**
     * 一个String字符串转换为json格式
     *
     * @param s
     * @return
     * @descript
     * @author lijianning
     * @date 2015年6月15日
     * @version 1.0v
     */
    public static String stringToJson(String s) {
        if (s == null) {
            return nullToJson();
        }
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < s.length(); i++) {
            char ch = s.charAt(i);
            switch (ch) {
                case '"':
                    sb.append("\\\"");
                    break;
                case '\\':
                    sb.append("\\\\");
                    break;
                case '\b':
                    sb.append("\\b");
                    break;
                case '\f':
                    sb.append("\\f");
                    break;
                case '\n':
                    sb.append("\\n");
                    break;
                case '\r':
                    sb.append("\\r");
                    break;
                case '\t':
                    sb.append("\\t");
                    break;
                case '/':
                    sb.append("\\/");
                    break;
                default:
                    if (ch >= '\u0000' && ch <= '\u001F') {
                        String ss = Integer.toHexString(ch);
                        sb.append("\\u");
                        for (int k = 0; k < 4 - ss.length(); k++) {
                            sb.append('0');
                        }
                        sb.append(ss.toUpperCase());
                    } else {
                        sb.append(ch);
                    }
            }
        }
        return sb.toString();
    }

    public static String nullToJson() {
        return "";
    }

    /**
     * 一个obj对象转换为json格式
     *
     * @param obj
     * @return
     * @descript
     * @author lijianning
     * @date 2015年6月15日
     * @version 1.0v
     */
    public static String objectToJson(Object obj) {
        StringBuilder json = new StringBuilder();
        if (obj == null) {
            json.append("\"\"");
        } else if (obj instanceof Number) {
            json.append(numberToJson((Number) obj));
        } else if (obj instanceof Boolean) {
            json.append(booleanToJson((Boolean) obj));
        } else if (obj instanceof String) {
            json.append("\"").append(stringToJson(obj.toString())).append("\"");
        } else if (obj instanceof Object[]) {
            json.append(arrayToJson((Object[]) obj));
        } else if (obj instanceof List) {
            json.append(listToJson((List<?>) obj));
        } else if (obj instanceof Map) {
            json.append(mapToJson((Map<?, ?>) obj));
        } else if (obj instanceof Set) {
            json.append(setToJson((Set<?>) obj));
        } else {
            json.append(beanToJson(obj));
        }
        return json.toString();
    }

    public static String numberToJson(Number number) {
        return number.toString();
    }

    public static String booleanToJson(Boolean bool) {
        return bool.toString();
    }

    /**
     * 一个bean对象转换为json格式
     *
     * @param bean
     * @return
     * @descript
     * @author lijianning
     * @date 2015年6月15日
     * @version 1.0v
     */
    public static String beanToJson(Object bean) {
        StringBuilder json = new StringBuilder();
        json.append("{");
        PropertyDescriptor[] props = null;
        try {
            props = Introspector.getBeanInfo(bean.getClass(), Object.class)
                    .getPropertyDescriptors();
        } catch (IntrospectionException e) {
        }
        if (props != null) {
            for (int i = 0; i < props.length; i++) {
                try {
                    String name = objectToJson(props[i].getName());
                    String value = objectToJson(props[i].getReadMethod()
                            .invoke(bean));
                    json.append(name);
                    json.append(":");
                    json.append(value);
                    json.append(",");
                } catch (Exception e) {
                }
            }
            json.setCharAt(json.length() - 1, '}');
        } else {
            json.append("}");
        }
        return json.toString();
    }

    /**
     * @param list
     * @return
     * @descript
     * @author lijianning
     * @date 2015年6月15日
     * @version 1.0v
     */
    public static String listToJson(List<?> list) {
        StringBuilder json = new StringBuilder();
        json.append("[");
        if (list != null && list.size() > 0) {
            for (Object obj : list) {
                json.append(objectToJson(obj));
                json.append(",");
            }
            json.setCharAt(json.length() - 1, ']');
        } else {
            json.append("]");
        }
        return json.toString();
    }

    /**
     * 一个数组集合转换为json格式
     *
     * @param array
     * @return
     * @descript
     * @author lijianning
     * @date 2015年6月15日
     * @version 1.0v
     */
    public static String arrayToJson(Object[] array) {
        StringBuilder json = new StringBuilder();
        json.append("[");
        if (array != null && array.length > 0) {
            for (Object obj : array) {
                json.append(objectToJson(obj));
                json.append(",");
            }
            json.setCharAt(json.length() - 1, ']');
        } else {
            json.append("]");
        }
        return json.toString();
    }

    /**
     * 一个Map集合转换为json格式
     *
     * @param map
     * @return
     * @descript
     * @author lijianning
     * @date 2015年6月15日
     * @version 1.0v
     */
    public static String mapToJson(Map<?, ?> map) {
        StringBuilder json = new StringBuilder();
        json.append("{");
        if (map != null && map.size() > 0) {
            for (Object key : map.keySet()) {
                json.append(objectToJson(key));
                json.append(":");
                json.append(objectToJson(map.get(key)));
                json.append(",");
            }
            json.setCharAt(json.length() - 1, '}');
        } else {
            json.append("}");
        }
        return json.toString();
    }

    /**
     * 一个Set集合转换为json格式
     *
     * @param set
     * @return
     * @descript
     * @author lijianning
     * @date 2015年6月15日
     * @version 1.0v
     */
    public static String setToJson(Set<?> set) {
        StringBuilder json = new StringBuilder();
        json.append("[");
        if (set != null && set.size() > 0) {
            for (Object obj : set) {
                json.append(objectToJson(obj));
                json.append(",");
            }
            json.setCharAt(json.length() - 1, ']');
        } else {
            json.append("]");
        }
        return json.toString();
    }
}