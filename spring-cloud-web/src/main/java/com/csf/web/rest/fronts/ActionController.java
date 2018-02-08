package com.csf.web.rest.fronts;

import com.csf.web.constants.OAConstants;
import com.csf.web.dto.BaseDto;
import com.csf.web.entity.*;
import com.csf.web.rest.APIService;
import com.csf.web.rest.AttacheService;
import com.csf.web.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2018/1/6.
 */
@Controller
@RequestMapping("/fronts")
public class ActionController extends APIService {


    @Autowired
    private UserService userService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private AttacheService attacheService;

    @Autowired
    private NewsService newsService;

    @Autowired
    private MaintenanceService maintenanceService;

    @Autowired
    private VideoService videoService;

    @Autowired
    private ProxyService proxyService;

    @Autowired
    private DeviceService deviceService;

    @Autowired
    private AdviceService adviceService;

    @RequestMapping("/user/login")
    public String login(String username, String password) {
        System.out.println(String.format(" user %s ,password %s", username, password));
        User user = userService.login(username, password);
        if (user == null) {
            return webFailure("400", "用户或密码错误");
        }
        if (!UserRole.ADMIN.getName().equals(user.getRole())) {
            return webFailure("400", "管理员才能登陆");
        }
        request.getSession().setAttribute(OAConstants.SESSION_USER,user);
        return "/facade/home";
    }

    @RequestMapping("/logout")
    public String logout() {
        HttpSession session = request.getSession();
        if(session !=null){
            session.invalidate();
        }
        return "/facade/login";
    }


    @RequestMapping("/user/list")
    public String userList(String name, String mobile, String area, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "30") Integer pageSize) {
        page = page - 1; //实际下标  ： 页码 -1
        System.out.println(String.format(" user name %s ,mobile %s", name, mobile));
        Page<User> data = userService.findUser(name, mobile, area, page, pageSize);
        attr("data", data);
        return "/facade/userListAjax";
    }

    @RequestMapping("/user/list/ajax")
    @ResponseBody
    public Page userListAjax(String name, String mobile, String area, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "30") Integer pageSize) {
        System.out.println(String.format(" user name %s ,mobile %s", name, mobile));
        Page<User> data = userService.findUser(name, mobile, area, page, pageSize);
        return data;
    }

    @RequestMapping("/order/list")
    public String orderList(String name, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "30") Integer pageSize) {
        System.out.println(String.format(" user %s ，", name));
        page = page - 1; //实际下标  ： 页码 -1
        Page<Order> data = orderService.queryMgrOrder(page, pageSize);
        attr("data", data);
        return "/facade/orderListAjax";
    }

    @RequestMapping("/attach/list")
    public String attachList(String name, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "30") Integer pageSize) {
        System.out.println(String.format(" user %s , ", name));
        page = page - 1; //实际下标  ： 页码 -1
        Sort sort = new Sort(Sort.Direction.DESC, "time");
        Pageable pageable = new PageRequest(page, pageSize, sort);
        Page<Attach> data = attacheService.searchAttach(name, pageable);
        attr("data", data);
        return "/facade/attachListAjax";
    }

    @RequestMapping("/order/detail/{id}")
    public String orderDetail(@PathVariable("id") Long id) {
        Order data = orderService.findById(id);
        attr("data", data);
        return "/facade/order_detail";
    }

    @RequestMapping("/attach/detail//{id}")
    public String attachDetail(@PathVariable("id") Long id) {
        Attach data = attacheService.findById(id);
        attr("data", data);
        return "/facade/attach_detail";
    }

    @RequestMapping("/news/list")
    public String newsList(String key, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "30") Integer pageSize) {
        System.out.println(String.format(" user %s , ", key));
        page = page - 1; //实际下标  ： 页码 -1
        Sort sort = new Sort(Sort.Direction.DESC, "time");
        Pageable pageable = new PageRequest(page, pageSize, sort);
        Page<News> data = newsService.searchNews(key, pageable);
//        if (!CollectionUtils.isEmpty(data.getContent())){
//            for(News news : data.getContent()){
//                news.getContent();
//            }
//        }
        attr("data", data);
        return "/facade/newsListAjax";
    }

    @RequestMapping("/news/detail/{id}")
    public String newsDetail(@PathVariable("id") Long id) {
        News data = newsService.findById(id);
        attr("data", data);
        return "/facade/news_detail";
    }

    @RequestMapping("/maintain/list")
    public String maintainList(String key, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "30") Integer pageSize) {
        System.out.println(String.format(" user %s , ", key));
        page = page - 1; //实际下标  ： 页码 -1
        Sort sort = new Sort(Sort.Direction.DESC, "time");
        Pageable pageable = new PageRequest(page, pageSize, sort);
        Page<Maintenance> data = maintenanceService.search(key, pageable);
        if (!CollectionUtils.isEmpty(data.getContent())) {
            for (Maintenance maintenance : data.getContent()) {
                String desc = maintenance.getContent();
                if (desc != null && desc.length() > 20) {
                    maintenance.setContent(desc.substring(0, 20));
                }
            }
        }
        attr("data", data);
        return "/facade/maintainListAjax";
    }

    @RequestMapping("/maintain/detail/{id}")
    public String maintainDetail(@PathVariable("id") Long id) {
        Maintenance data = maintenanceService.findById(id);
        attr("data", data);
        return "/facade/maintain_detail";
    }

    @RequestMapping("/video/list")
    public String videoinList(String key, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "30") Integer pageSize) {
        System.out.println(String.format(" user %s , ", key));
        page = page - 1; //实际下标  ： 页码 -1
        Sort sort = new Sort(Sort.Direction.DESC, "time");
        Pageable pageable = new PageRequest(page, pageSize, sort);
        Page<Video> data = videoService.search(key, pageable);
        attr("data", data);
        return "/facade/videoListAjax";
    }

    @RequestMapping("/video/detail/{id}")
    public String videoDetail(@PathVariable("id") Long id) {
        Video data = videoService.findById(id);
        attr("data", data);
        return "/facade/video_detail";
    }

    @RequestMapping("/proxy/list")
    public String proxyList(String key, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "30") Integer pageSize) {
        System.out.println(String.format(" key %s , ", key));
        page = page - 1; //实际下标  ： 页码 -1
        Sort sort = new Sort(Sort.Direction.DESC, "time");
        Pageable pageable = new PageRequest(page, pageSize, sort);
        Page<Proxy> data = proxyService.search(key, pageable);
        attr("data", data);
        return "/facade/proxyListAjax";
    }

    @RequestMapping("/proxy/detail/{id}")
    public String proxyDetail(@PathVariable("id") Long id) {
        Proxy data = proxyService.findOne(id);
        attr("data", data);
        return "/facade/proxy_detail";
    }

    @RequestMapping("/device/list")
    public String deviceList(String key, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "30") Integer pageSize) {
        System.out.println(String.format(" key %s , ", key));
        page = page - 1; //实际下标  ： 页码 -1
        Sort sort = new Sort(Sort.Direction.DESC, "time");
        Pageable pageable = new PageRequest(page, pageSize, sort);
        Page<Device> data = deviceService.search(key, pageable);
        attr("data", data);
        return "/facade/deviceListAjax";
    }

    @RequestMapping("/device/detail/{id}")
    public String deviceDetail(@PathVariable("id") Long id) {
        Device data = deviceService.findById(id);
        attr("data", data);
        return "/facade/device_detail";
    }

    @RequestMapping("/advice/list")
    public String adviceList(String kword, @RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "30") Integer pageSize) {
        System.out.println(String.format(" key %s , ", kword));
        page = page - 1; //实际下标  ： 页码 -1
        Sort sort = new Sort(Sort.Direction.DESC, "time");
        Pageable pageable = new PageRequest(page, pageSize, sort);
        Page<Advice> data = adviceService.search(kword, pageable);
        attr("data", data);
        return "/facade/adviceListAjax";
    }

    @RequestMapping("/advice/delete")
    @ResponseBody
    public BaseDto updateDevice(Long id) {
        adviceService.deleteAdvice(id);
        return BaseDto.newDto("");
    }

}
