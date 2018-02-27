package com.csf.common;

import com.csf.json.JSONUtil;
import com.google.gson.*;
import org.apache.commons.lang3.StringUtils;

import java.util.*;

public class JsonCommonUtils {

    public static <T> T getObjectFromJsonResponse(String content, Class<T> clazz) {
        JsonElement message = getMessageAsJsonElementFromJson(content);
        if (message.isJsonNull()) return null;
        return JSONUtil.fromJson(message, clazz);

    }

    public static <T> List<T> getObjectListFromJson(String content, Class<T> clazz) {
        JsonElement message = getMessageAsJsonElementFromJson(content);
        if (message.isJsonNull()) return null;
        JsonArray array = message.getAsJsonArray();
        List<T> result = new ArrayList<>();
        for (int i = 0; i < array.size(); i++) {
            result.add(JSONUtil.fromJson(array.get(i), clazz));
        }
        return result;
    }

    public static <T> List<T> getObjectListFromJson2(String content, Class<T> clazz) {
        JsonParser jsonParser = new JsonParser();
        String code = jsonParser.parse(content).getAsJsonObject().get("code").getAsString();
        List<T> result = new ArrayList<>();
        if (StringUtils.equals(code, "200")) {
            JsonElement msg = jsonParser.parse(content).getAsJsonObject().get("message");
            if (Objects.nonNull(msg) && msg.isJsonArray()) {
                msg.getAsJsonArray().forEach(k -> result.add(JSONUtil.fromJson(k, clazz)));
            }
        }
        return result;
    }

    public static List<JsonObject> getJsonObjectsFromJson(String content) {

        if (StringUtils.isBlank(content)) {
            return Collections.emptyList();
        }

        JsonParser jsonParser = new JsonParser();
        JsonElement element = jsonParser.parse(content);
        if (element == null) {
            return Collections.emptyList();
        }

        JsonObject object = element.getAsJsonObject();
        if (object == null || object.get("code") == null) {
            return Collections.emptyList();
        }

        String code = object.get("code").getAsString();
        List<JsonObject> result = new ArrayList<>();
        if ("200".equals(code)) {
            JsonElement msg = jsonParser.parse(content).getAsJsonObject().get("message");
            if (Objects.nonNull(msg) && msg.isJsonArray()) {
                msg.getAsJsonArray().forEach(v -> {
                    result.add(v.getAsJsonObject());
                });
            }
        }

        return result;
    }

    private static JsonElement getMessageAsJsonElementFromJson(String content) {
        JsonParser jsonParser = new JsonParser();
        JsonObject jsonObject = jsonParser.parse(content).getAsJsonObject();
        String code = jsonObject.get("code").getAsString();
        JsonElement message = null;
        if (StringUtils.equals(code, "200")) {
            // fix bug for open api add 2016-06-29 by betty.huang start
            JsonElement body = jsonObject.get("message"); // 取响应报文中的message内容，外部code，type由控制器统一管理
            if (null == body || "null".equals(body.toString())) {
                return JsonNull.INSTANCE;
            }
            if (null == body.getAsJsonObject().get("content")
                    || "null".equals(body.getAsJsonObject().get("content").toString())) {// 返回实际内容为空
                return JsonNull.INSTANCE;
            }
            // fix bug for open api add 2016-06-29 by betty.huang end
            message = jsonObject.get("message").getAsJsonObject().get("content");
        } else {
            // TODO 待考虑
            return JsonNull.INSTANCE;
        }
        return message;
    }

    public static String fmtJson(String content) {
        JsonParser jsonParser = new JsonParser();
        JsonObject jsonObject = jsonParser.parse(content).getAsJsonObject();
        JsonElement body = jsonObject.get("message"); //
        if (body != null && !"null".equals(body.toString())) {
            JsonElement result = body.getAsJsonObject().getAsJsonObject().get("result");
            jsonObject.getAsJsonObject().remove("message");
            jsonObject.add("message", result);// 只保留result部分
            return jsonObject.toString();
        }
        return content;
    }

    public static Long getTotalElements(String content) {
        JsonParser jsonParser = new JsonParser();
        JsonObject jsonObject = jsonParser.parse(content).getAsJsonObject();
        JsonElement body = jsonObject.get("message"); // 取响应报文中的message内容
        if (body == null || "null".equals(body.toString())) {
            return null;
        }
        if (body.getAsJsonObject().get("totalElements") == null
                || "null".equals(body.getAsJsonObject().get("totalElements").toString())) {
            return null;
        }

        return body.getAsJsonObject().get("totalElements").getAsLong();
    }

    public static String getJsonBody(String content) {
        JsonParser jsonParser = new JsonParser();
        JsonObject jsonObject = jsonParser.parse(content).getAsJsonObject();
        JsonElement body = jsonObject.get("message"); // 取响应报文中的message内容
        if (body == null || "null".equals(body.toString())) {
            return null;
        }
        if (body.getAsJsonObject().get("content") == null
                || "null".equals(body.getAsJsonObject().get("content").toString())) {// 返回实际内容为空
            return null;
        }

        return body.getAsJsonObject().get("content").toString();
    }

    public static String getJsonMessage(String content) {
        JsonParser jsonParser = new JsonParser();
        JsonObject jsonObject = jsonParser.parse(content).getAsJsonObject();
        JsonElement body = jsonObject.get("message"); // 取响应报文中的message内容
        if (body == null || "null".equals(body.toString())) {
            return null;
        }
        return body.toString();
    }

    public static <T> T getObjectFromJsonResponse2(String content, Class<T> clazz) {
        T dto = null;
        if (StringUtils.isBlank(content)) {
            return dto;
        }
        JsonParser jsonParser = new JsonParser();
        String code = jsonParser.parse(content).getAsJsonObject().get("code").getAsString();
        if (StringUtils.equals(code, "200")) {
            JsonElement message = jsonParser.parse(content).getAsJsonObject().get("message");
            if (null == message) {
                return dto;
            }
            dto = JSONUtil.fromJson(message, clazz);
        }
        return dto;
    }

    public static <T> Map<String, List<T>> toJsonMap(String data, Class<T> type) {
        JsonParser jsonParser = new JsonParser();
        String msg = getJsonMessage(data);
        Map<String, List<T>> map = new HashMap<>();
        if (StringUtils.isNotBlank(msg)) {
            JsonObject jsonObject = jsonParser.parse(msg).getAsJsonObject();
            for (String k : jsonObject.keySet()) {
                map.put(k, JSONUtil.jsonToList2(jsonObject.getAsJsonArray(k).toString(), type));
            }
        }
        return map;
    }

    public static void main(String[] args) {
        String content =
                "{\"code\":200,\"type\":\"SUCCESS\",\"message\":[{\"aa\":11,\"bb\":22},{\"aa\":22,\"bb\":33}]}";
        System.out.println(JsonCommonUtils.getJsonObjectsFromJson(content));
    }
}
