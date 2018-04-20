package com.zhiyou.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class CommonInterceptor implements HandlerInterceptor  {

    private final String ADMINSESSION = "user";
    //拦截钱处理
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object obj) throws Exception {
        Object sessionObj = request.getSession().getAttribute(ADMINSESSION);
        if(sessionObj!=null) {
            System.out.println("放行....");
            return true;
        }
        System.out.println("拦截成功.....");
        response.sendRedirect("/user/login.do");
        return false;
    }
    //拦截后处理
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object obj, ModelAndView mav) throws Exception { }
    //全部完成后处理
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object obj, Exception e) throws Exception { }
}  