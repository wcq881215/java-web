package com.csf.web.rest;

import com.csf.web.dto.APIStatus;
import com.csf.web.dto.BaseDto;
import com.csf.web.entity.Location;
import com.csf.web.entity.SysConfig;
import com.csf.web.entity.User;
import com.csf.web.service.LocationService;
import com.csf.web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * Created by changqi.wu on 2017/8/8.
 */
@RestController
@RequestMapping("/user")
public class UserController extends APIService {

    @Autowired
    private UserService userService;

    @Autowired
    private LocationService locationService;

    @RequestMapping("/list")
    public BaseDto list() {
        return BaseDto.newDto(userService.findAll());
    }

    @RequestMapping("/login")
    public BaseDto login(String username, String password) {
        return BaseDto.newDto(userService.login(username, password));
    }

    @RequestMapping("/query")
    public BaseDto query(String username) {
        return BaseDto.newDto(userService.findByName(username));
    }

//    @RequestMapping(value = "/location/post",method = RequestMethod.POST)
    @RequestMapping(value = "/location/post")
    public BaseDto postLocation(String mid,Double longitude,Double latitude) {
        Location location = new Location();
        location.setLatitude(latitude);
        location.setLongitude(longitude);
        location.setMid(mid);
        locationService.saveUserLocation(location);
        return BaseDto.newDto(APIStatus.success);
    }

    @RequestMapping("/location/query")
    public BaseDto queryLocation(String mid) {
        User u = new User();
        u.setMobno(mid);
        return BaseDto.newDto(locationService.getUserLocation(u));
    }

//    @RequestMapping("/save")
//    public String save() {
//        SysConfig conf = new SysConfig();
//        conf.setName("test");
//        conf.set_key("cfg_key");
//        conf.setComment("test");
//        conf.setState(true);
//        conf.setValue("-- val --");
//        userService.saveUser(conf);
//        System.out.println("================success============");
//        return "success";
//    }

}
