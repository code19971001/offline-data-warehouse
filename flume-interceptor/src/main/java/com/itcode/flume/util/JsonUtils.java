package com.itcode.flume.util;

import com.alibaba.fastjson.JSON;

/**
 * @author code1997
 */
public class JsonUtils {
    private JsonUtils() {

    }

    public static boolean isJsonValidation(String log) {
        try {
            JSON.parse(log);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
