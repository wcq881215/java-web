insert into app_order_delivery(did,oid,numb,state) select did,oid,numb,0 from app_order_device;
insert into app_order_delivery(logistics,iphone,numb,state) select logistics,iphone,numb,0 from app_order_device;
