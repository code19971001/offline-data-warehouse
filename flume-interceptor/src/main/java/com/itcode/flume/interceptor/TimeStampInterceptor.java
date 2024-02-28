package com.itcode.flume.interceptor;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.apache.flume.Context;
import org.apache.flume.Event;
import org.apache.flume.interceptor.Interceptor;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author code1997
 */
public class TimeStampInterceptor implements Interceptor {

    private final ArrayList<Event> events = new ArrayList<>();

    @Override
    public void initialize() {

    }

    /**
     * set event ts
     */
    @Override
    public Event intercept(Event event) {
        Map<String, String> headers = event.getHeaders();
        String body = new String(event.getBody(), StandardCharsets.UTF_8);
        JSONObject jsonObject = JSON.parseObject(body);
        String ts = jsonObject.getString("ts");
        headers.put("timestamp", ts);
        event.setHeaders(headers);
        return event;

    }

    /**
     * 提前进行一遍json格式化校验.
     */
    @Override
    public List<Event> intercept(List<Event> list) {
        events.clear();
        list.forEach(event -> events.add(intercept(event)));
        return events;
    }

    @Override
    public void close() {

    }

    public static class Builder implements Interceptor.Builder {

        @Override
        public Interceptor build() {
            return new TimeStampInterceptor();
        }

        @Override
        public void configure(Context context) {

        }
    }
}
