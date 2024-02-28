package com.itcode.flume.interceptor;


import com.itcode.flume.util.JsonUtils;
import org.apache.flume.Context;
import org.apache.flume.Event;
import org.apache.flume.interceptor.Interceptor;

import java.nio.charset.StandardCharsets;
import java.util.List;

/**
 * @author : code1997
 * @date : 2021/10/14 22:35
 */
public class LogInterceptor implements Interceptor {
    @Override
    public void initialize() {
        //don`t need init
    }

    @Override
    public Event intercept(Event event) {
        byte[] body = event.getBody();
        String log = new String(body, StandardCharsets.UTF_8);

        if (JsonUtils.isJsonValidation(log)) {
            return event;
        } else {
            return null;
        }
    }

    @Override
    public List<Event> intercept(List<Event> list) {
        //用于去除json校验失败的数据.
        list.removeIf(next -> intercept(next) == null);
        return list;
    }

    @Override
    public void close() {

    }

    /**
     * 工厂设计模式来创建拦截器.
     */
    public static class Builder implements Interceptor.Builder {

        @Override
        public Interceptor build() {
            return new LogInterceptor();
        }

        @Override
        public void configure(Context context) {

        }

    }

}
