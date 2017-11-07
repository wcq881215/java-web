package com.csf.web.exception;

import com.csf.web.dto.BaseDto;
import com.csf.web.rest.APIService;
import com.csf.web.util.JsonUtils;
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

    @ExceptionHandler(value = Exception.class)
    @ResponseBody
    public BaseDto jsonErrorHandler(HttpServletRequest request, Exception e) throws Exception {
        e.printStackTrace();
//        return JsonUtils.toJson(APIService.ajaxFailure());
        return APIService.ajaxFailure();
    }


//    @ExceptionHandler(value = Exception.class)
//    public ModelAndView htmlErrorHandler(HttpServletRequest request, Exception e) throws Exception {
//        ModelAndView mav = new ModelAndView();
//        mav.addObject("exception", e);
//        mav.addObject("url", request.getRequestURL());
//        mav.setViewName(APIService.error_page);
//        return mav;
//    }
}