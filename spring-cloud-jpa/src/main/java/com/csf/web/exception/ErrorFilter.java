package com.csf.web.exception;

import com.csf.web.rest.APIService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by changqi.wu on 17-9-5.
 */
@ControllerAdvice
public class ErrorFilter {
    public static final String DEFAULT_ERROR_VIEW = "error";


    @ExceptionHandler(value = Exception.class)
    @ResponseBody
    public String jsonErrorHandler(HttpServletRequest request, Exception e) throws Exception {
//        return ResponseEntity.ok("ok");
        return APIService.failure();
    }

//
//    @ExceptionHandler(value = Exception.class)
//    public ModelAndView htmlErrorHandler(HttpServletRequest request, Exception e) throws Exception {
//        ModelAndView mav = new ModelAndView();
//        mav.addObject("exception", e);
//        mav.addObject("url", request.getRequestURL());
//        mav.setViewName(DEFAULT_ERROR_VIEW);
//        return mav;
//    }
}
