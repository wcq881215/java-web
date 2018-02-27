package com.csf.json;

import com.csf.date.DateUtil;
import com.google.gson.*;
import com.google.gson.internal.$Gson$Types;
import com.google.gson.reflect.TypeToken;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.text.ParseException;
import java.util.*;

public class JSONUtil {

    private static final Logger logger = Logger.getLogger("JSONUtil.class");

    public static final String EMPTY_JSON = "{}";
    public static final String EMPTY_JSON_ARRAY = "[]";

    private JSONUtil() {
    }

    // private static final GsonBuilder builder = new
    // GsonBuilder().disableHtmlEscaping();
    private static final GsonBuilder builder = new GsonBuilder();

    private static final Gson gson = builder
            .setDateFormat(DateUtil.ISO_TIMESTAMP_PATTERN)
            .serializeNulls()
            .serializeSpecialFloatingPointValues()
            .registerTypeAdapter(Date.class, new JSONUtil().new IJsonDateDeserializer() {
                @Override
                Date parse(String s) throws ParseException {
                    return DateUtil.parseDate(DateUtil.ISO_TIMESTAMP_PATTERN, s);
                }
            })
            .create();

    /**
     * by default,this method allows serialize null-value properties
     *
     * @param src
     * @return
     */
    public static String toJson(Object src) {
        if (src == null) {
            return EMPTY_JSON;
        }
        return gson.toJson(src);
    }

    /**
     * default is medium : Mar 8, 2013 12:00:00 AM
     *
     * @param obj
     * @param dateFormat Note that this pattern must abide by the convention provided
     *                   by SimpleDateFormat class.
     * @return
     */
    public static String toJson(Object obj, String dateFormat) {
        if (obj == null) {
            return EMPTY_JSON;
        } else if (StringUtils.isBlank(dateFormat)) {
            return gson.toJson(obj);
        }

        try {
            return builder.setDateFormat(dateFormat).serializeSpecialFloatingPointValues().create().toJson(obj);
        } catch (Exception e) {

            logger.error("Exception for toJson(obj, dateFormat) : " + e.getMessage());
            return gson.toJson(obj);
        }
    }

    public static String toJson(Object target, Type targetType) {

        String result = EMPTY_JSON;

        if (target == null)
            return result;

        try {
            if (targetType != null) {
                result = gson.toJson(target, targetType);
            } else {
                result = gson.toJson(target);
            }
        } catch (Exception ex) {
            logger.error("JSONUtil.toJson(target, targetType) exception, return empty json, exception for "
                    + target.toString() + " : " + ex.getMessage());
            if (target instanceof Collection || target instanceof Iterator || target instanceof Enumeration
                    || target.getClass().isArray()) {
                result = EMPTY_JSON_ARRAY;
            } else
                result = EMPTY_JSON;
        }
        return result;
    }

    /**
     * to covert a string to a class
     *
     * @param json
     * @param classOfT
     * @return
     */
    public static <T> T fromJson(String json, Class<T> classOfT) {
        return gson.fromJson(json, classOfT);
    }

    /**
     * to covert a string to a class
     *
     * @param json
     * @param classOfT
     * @return
     */
    public static <T> T fromJson(String json, Class<T> classOfT, final String dateFormat) {
        return (dateFormat == null ? gson : gson(dateFormat)).fromJson(json, classOfT);
    }

    public static <T> T fromJson(String json, Type type) {
        return gson.fromJson(json, type);
    }

    /**
     * to covert a JsonElement to a class
     *
     * @param jsonElem
     * @param classOfT
     * @return
     */
    public static <T> T fromJson(JsonElement jsonElem, Class<T> classOfT) {
        return gson.fromJson(jsonElem, classOfT);
    }

    /**
     * convert json string to list
     *
     * @param json
     * @param listType new TypeToken<List<Class>>(){}.getType()
     * @return
     */
    public static List<?> jsonToList(String json, Type listType) {
        List<?> objList = gson.fromJson(json, listType);
        return objList;
    }

    /**
     * convert json string to list
     *
     * @param json
     * @return
     */
    public static <T> List<T> jsonToList2(String json, Type type) {
        return jsonToList(json, type, null);
    }

    /**
     * convert json string to list
     *
     * @param json
     * @return
     */
    public static <T> List<T> jsonToList(String json, Type classType, final String dateFormat) {
        ParameterizedType t = $Gson$Types.newParameterizedTypeWithOwner(null, ArrayList.class, classType);
        return (dateFormat == null ? gson : gson(dateFormat)).fromJson(json, t);
    }

    /**
     * convert json to map
     *
     * @param json
     * @return
     */
    public static Map<?, ?> jsonToMap(String json) {
        Type type = new TypeToken<Map<?, ?>>() {
        }.getType();
        Map<?, ?> objMap = gson.fromJson(json, type);
        return objMap;
    }

    public static void main(String[] args) {
        Map<String, Object> obj = new HashMap<String, Object>();
        obj.put("k1", "k1v");
        obj.put("k2", 2);
        try {
            obj.put("k3", DateUtil.parseDate("03/08/2013"));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        System.out.println(JSONUtil.toJson(obj));
        System.out.println(JSONUtil.toJson(obj, "yyyy-MM-dd"));
        System.out.println(JSONUtil.toJson(obj));

    }

    public static Gson gson(final String dateFormat) {
        if (dateFormat == null) {
            return gson;
        }
        return builder
                .serializeNulls()
                .serializeSpecialFloatingPointValues()
                .registerTypeAdapter(Date.class, new JSONUtil().new IJsonDateDeserializer() {
                    @Override
                    Date parse(String s) throws ParseException {
                        return DateUtil.parseDate(dateFormat, s);
                    }
                })
                .create();
    }

    @Deprecated
    public class JsonDateDeserializer implements JsonDeserializer<Date> {
        public Date deserialize(JsonElement json, Type typeOfT, JsonDeserializationContext context)
                throws JsonParseException {
            String s = json.getAsJsonPrimitive().getAsString();
            try {
                return DateUtil.parseDate(s);
            } catch (ParseException e) {
                throw new JsonParseException(e);
            }
        }
    }

    private abstract class IJsonDateDeserializer implements JsonDeserializer<Date> {
        public Date deserialize(JsonElement json, Type typeOfT, JsonDeserializationContext context)
                throws JsonParseException {
            String s = json.getAsJsonPrimitive().getAsString();
            try {
                return parse(s);
            } catch (ParseException e) {
                throw new JsonParseException(e);
            }
        }

        abstract Date parse(String s) throws ParseException;
    }

}