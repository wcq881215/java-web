CREATE DATABASE IF NOT EXISTS oa  DEFAULT CHARSET utf8  COLLATE utf8_general_ci;

USE oa;

DROP TABLE IF EXISTS sys_config;
CREATE TABLE sys_config (
  id     INT AUTO_INCREMENT,
  _key   VARCHAR(20)  NOT NULL  COMMENT '数据字典key',
  name   VARCHAR(100) NOT NULL  COMMENT '数据字典名称',
  value  VARCHAR(100) COMMENT '数据字典值',
  state  BOOLEAN COMMENT '数据字典状态 0 不可用 1可用',
  comment VARCHAR(100) COMMENT '说明',
  PRIMARY KEY (id)
)ENGINE = InnoDB  DEFAULT CHARSET = utf8;

INSERT INTO sys_config(_key,name,value,state,comment) VALUES ('cfg_app_name','系统名称','移动OA','1','系统名称');

DROP TABLE IF EXISTS app_user;
CREATE TABLE app_user (
  id         INT AUTO_INCREMENT,
  username   VARCHAR(15)  NOT NULL  COMMENT '用户名',
  password   VARCHAR(32) NOT NULL  COMMENT '密码',
  mobno   VARCHAR(50) NOT NULL  COMMENT '手机识别号',
  phone        VARCHAR(15) NOT NULL  COMMENT '手机',
  role   VARCHAR(15) NOT NULL  COMMENT '部门',
  device   VARCHAR(100) COMMENT '购买设备号',
  s_time   DATE COMMENT '购买设备时间',
  state  BOOLEAN COMMENT '用户状态 0 不可用 1可用',
  PRIMARY KEY (id)
)ENGINE = InnoDB  DEFAULT CHARSET = utf8;

-- INSERT INTO app_user(username, password, phone,role, state) VALUES ('admin','123456','13524625212','管理员',1);
-- INSERT INTO app_user(username, password, phone,role, state) VALUES ('tech','123456','13524625212','技术员',1);
-- INSERT INTO app_user(username, password, phone,role, state) VALUES ('office','123456','13524625212','内勤',1);
-- INSERT INTO app_user(username, password, phone,role, state) VALUES ('service','123456','13524625212','售后服务',1);
-- INSERT INTO app_user(username, password, phone,role, state) VALUES ('produce','123456','13524625212','生产部',1);
-- INSERT INTO app_user(username, password, phone,role, state,device,s_time) VALUES ('custom','123456','13524625212','购机客户',1,'1111222333',now());

INSERT INTO `oa`.`app_user`(`id`, `username`, `password`, `mobno`, `phone`, `role`, `device`, `s_time`, `state`) VALUES (1, 'admin', '111111', 'adfdf-fdfe-fdf-erer-efd', '13524625212', '管理员', NULL, NULL, 1);
INSERT INTO `oa`.`app_user`(`id`, `username`, `password`, `mobno`, `phone`, `role`, `device`, `s_time`, `state`) VALUES (2, 'tech', '111111', 'adfdf-fdfe-fdf-erer-1111', '13524625212', '技术员', NULL, NULL, 1);
INSERT INTO `oa`.`app_user`(`id`, `username`, `password`, `mobno`, `phone`, `role`, `device`, `s_time`, `state`) VALUES (3, 'office', '111111', 'adfdf-fdfe-fdf-2222', '13524625212', '内勤', NULL, NULL, 1);
INSERT INTO `oa`.`app_user`(`id`, `username`, `password`, `mobno`, `phone`, `role`, `device`, `s_time`, `state`) VALUES (4, 'service', '111111', 'adfdf-fdfe-fdf-erer-333', '13524625212', '售后服务', NULL, NULL, 1);
INSERT INTO `oa`.`app_user`(`id`, `username`, `password`, `mobno`, `phone`, `role`, `device`, `s_time`, `state`) VALUES (5, 'produce', '111111', 'adfdf-fdfe-fdf-erer-444', '13524625212', '生产部', NULL, NULL, 1);
INSERT INTO `oa`.`app_user`(`id`, `username`, `password`, `mobno`, `phone`, `role`, `device`, `s_time`, `state`) VALUES (6, 'custom', '111111', 'adfdf-fdfe-fdf-erer-555', '13524625212', '购机客户', '1111222333', '2017-09-03', 1);


DROP TABLE IF EXISTS app_device;
CREATE TABLE app_device (
  id         INT AUTO_INCREMENT,
  sn   VARCHAR(30)  NOT NULL  COMMENT 'sn',
  _name   VARCHAR(32) NOT NULL  COMMENT '设备名称',
  _desc        text NOT NULL  COMMENT '简介',
  type   VARCHAR(30) NOT NULL  COMMENT '类别',
  number   INT COMMENT '数量',
  price DOUBLE (12,2) COMMENT '单价',
  state  BOOLEAN COMMENT '状态 0 不可用 1可用',
  time TIMESTAMP COMMENT '发布时间'
  PRIMARY KEY (id)
)ENGINE = InnoDB  DEFAULT CHARSET = utf8;

INSERT  INTO  app_device (sn,_name,_desc,type,number,price,state,time) VALUES ('1111222333','机床螺丝','xxxxxx NB','螺丝',1000,0.1,1,now());


DROP TABLE IF EXISTS app_device_img;
CREATE TABLE app_device_img (
  id         INT AUTO_INCREMENT,
  did   INT (30)  NOT NULL  COMMENT 'device id',
  src   VARCHAR(50) NOT NULL  COMMENT '图片路径',
  alt        VARCHAR(50)   COMMENT 'alt',
  upload   DATE COMMENT '上传时间',
  state  BOOLEAN COMMENT '状态 0 不可用 1可用',
  PRIMARY KEY (id)
)ENGINE = InnoDB  DEFAULT CHARSET = utf8;

INSERT  INTO  app_device_img(did,src,alt,upload,state) VALUES(1,'http://www.baidu.com/img/bd_logo1.png','baidu',now(),1);

DROP TABLE IF EXISTS app_location;
CREATE TABLE app_location (
  id         INT AUTO_INCREMENT,
  mid   VARCHAR (50)  NOT NULL  COMMENT 'mobile device id',
  longitude        DOUBLE (11,8)   COMMENT '经度',
  latitude   DOUBLE (11,8)   COMMENT '纬度',
  time   TIMESTAMP COMMENT '定位时间',
  PRIMARY KEY (id)
)ENGINE = InnoDB  DEFAULT CHARSET = utf8;

INSERT  INTO  app_location(mid,longitude,latitude,time) VALUES('adfdf-fdfe-fdf-erer-efd',121.628719618,31.1963795,now());

