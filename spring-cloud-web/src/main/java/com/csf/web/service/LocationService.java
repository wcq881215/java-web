package com.csf.web.service;

import com.csf.web.entity.Location;
import com.csf.web.entity.User;
import com.csf.web.repository.LocationDao;
import com.csf.web.repository.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by changqi.wu on 2017/8/8.
 */

@Service
@Transactional
public class LocationService {

    @Autowired
    private LocationDao locationDao;

    public void saveUserLocation(Location location) {
        locationDao.save(location);
    }

    public Location getUserLocation(User u) {
        Location location = new Location();
        location.setMid(u.getMobno());
        Example<Location> ex =Example.of(location);
        location = locationDao.findOne(ex);
        return location;
    }


}