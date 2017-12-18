package com.csf.web.repository;

import com.csf.web.entity.OrderDevice;
import org.springframework.data.repository.CrudRepository;

/**
 * Created by changqi.wu on 17-11-10.
 */
public interface OrderDeviceDao extends CrudRepository<OrderDevice, Long> {

    void deleteByOid(Long oid);

}
