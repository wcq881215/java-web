CREATE DATABASE IF NOT EXISTS oa  DEFAULT CHARSET utf8  COLLATE utf8_general_ci;

USE oa;

-- 配置
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
INSERT INTO sys_config(_key,name,value,state,comment) VALUES ('cfg_dept','管理员','管理员','1','部门分类');
INSERT INTO sys_config(_key,name,value,state,comment) VALUES ('cfg_dept','技术员','技术员','1','部门分类');
INSERT INTO sys_config(_key,name,value,state,comment) VALUES ('cfg_dept','内勤','内勤','1','部门分类');
INSERT INTO sys_config(_key,name,value,state,comment) VALUES ('cfg_dept','售后服务','售后服务','1','部门分类');
INSERT INTO sys_config(_key,name,value,state,comment) VALUES ('cfg_dept','生产部','生产部','1','部门分类');


-- 用户
DROP TABLE IF EXISTS app_user;
CREATE TABLE app_user (
  id         INT AUTO_INCREMENT,
  username   VARCHAR(15)  NOT NULL  COMMENT '用户名',
  password   VARCHAR(32) NOT NULL  COMMENT '密码',
  name   VARCHAR(32) NOT NULL  COMMENT '姓名',
  mobno   VARCHAR(50) NOT NULL  COMMENT '手机识别号',
  phone        VARCHAR(15) NOT NULL  COMMENT '手机',
  role   VARCHAR(15) NOT NULL  COMMENT '角色',
  dept   VARCHAR(50) NOT NULL  COMMENT '部门',
  team   VARCHAR(50) NOT NULL  COMMENT '科室',
  device   VARCHAR(100) COMMENT '购买设备号',
  s_time   datetime COMMENT '购买设备时间',
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
INSERT INTO `oa`.`app_user`(`id`, `username`, `password`, `mobno`, `phone`, `role`, `device`, `s_time`, `state`) VALUES (5, 'manager', '111111', 'adfdf-fdfe-fdf-erer-444', '13524625212', '售后管理', NULL, NULL, 1);
INSERT INTO `oa`.`app_user`(`id`, `username`, `password`, `mobno`, `phone`, `role`, `device`, `s_time`, `state`) VALUES (6, 'custom', '111111', 'adfdf-fdfe-fdf-erer-555', '13524625212', '购机客户', '1111222333', '2017-09-03', 1);



-- 办事处信息
DROP TABLE IF EXISTS app_proxy;
CREATE TABLE app_proxy (
  id         INT AUTO_INCREMENT,
  pname   VARCHAR (300)  NOT NULL  COMMENT '办事处',
  address      VARCHAR(200)    COMMENT '地址',
  phone    VARCHAR(50)   COMMENT '联系电话',
  leader    VARCHAR(50)   COMMENT '负责人',
  lmobile    VARCHAR(50)   COMMENT '负责人电话',
  groups    VARCHAR(200)  DEFAULT '浙江正大集团有限公司'   COMMENT '所属公司',
  time   TIMESTAMP COMMENT '发布时间',
  state  tinyint DEFAULT 1 COMMENT '状态 0不可用 1可用',
  PRIMARY KEY (id)
)ENGINE = InnoDB  DEFAULT CHARSET = utf8;
INSERT INTO app_proxy(pname,address,phone,leader,lmobile,groups,state,time) VALUES ('临海办事处','浙江省临海市小芝镇虎山南路261号','0576-85771016','办事员','13524652541','浙江正大集团有限公司',1,now());
INSERT INTO app_proxy(pname,address,phone,leader,lmobile,groups,state,time) VALUES ('台州办事处','浙江省台州办事处','0576-85771017','办事员2','135246525xxx','浙江正大集团有限公司',1,now());



-- 设备
DROP TABLE IF EXISTS app_device;
CREATE TABLE app_device (
  id         INT AUTO_INCREMENT,
  sn   VARCHAR(50)  NOT NULL  COMMENT 'sn',
  _name   VARCHAR(200) NOT NULL  COMMENT '设备名称',
  _desc        text NOT NULL  COMMENT '简介',
  type   VARCHAR(100) NOT NULL  COMMENT '类别',
  `number`   INT COMMENT '数量',
  price DOUBLE (12,2) COMMENT '单价',
  state  BOOLEAN COMMENT '状态 0 不可用 1可用',
  time TIMESTAMP COMMENT '发布时间',
  PRIMARY KEY (id)
)ENGINE = InnoDB  DEFAULT CHARSET = utf8;

INSERT  INTO  app_device (sn,_name,_desc,type,`number`,price,state,time) VALUES ('1111222333','机床螺丝','xxxxxx NB','螺丝',1000,0.1,1,now());

-- 设备
DROP TABLE IF EXISTS app_device_detail;
CREATE TABLE app_device_detail (
  id         INT AUTO_INCREMENT,
  sn   VARCHAR(50)  NOT NULL  COMMENT 'sn',
  _name   VARCHAR(200) NOT NULL  COMMENT '设备名称',
  _desc        text NOT NULL  COMMENT '简介',
  type   VARCHAR(100) NOT NULL  COMMENT '类别',
  pid   INT (30)  NOT NULL  COMMENT 'proxy id',
  `number`   INT COMMENT '数量',
  price DOUBLE (12,2) COMMENT '单价',
  state  BOOLEAN COMMENT '状态 0 不可用 1可用',
  time TIMESTAMP COMMENT '发布时间',
  PRIMARY KEY (id)
)ENGINE = InnoDB  DEFAULT CHARSET = utf8;

INSERT  INTO  app_device_detail (sn,_name,_desc,type,pid,`number`,price,state,time) VALUES ('NH11222333','机床螺丝','xxxxxx NB','螺丝',1,1000,0.1,1,now());


-- 设备图片
DROP TABLE IF EXISTS app_device_img;
CREATE TABLE app_device_img (
  id         INT AUTO_INCREMENT,
  did   INT (30)  NOT NULL  COMMENT 'device id',
  src   VARCHAR(500) NOT NULL  COMMENT '图片url',
  path   VARCHAR(500) NOT NULL  COMMENT '图片路径',
  alt        VARCHAR(50)   COMMENT 'alt',
  upload   DATE COMMENT '上传时间',
  state  BOOLEAN COMMENT '状态 0 不可用 1可用',
  PRIMARY KEY (id)
)ENGINE = InnoDB  DEFAULT CHARSET = utf8;

INSERT INTO `oa`.`app_device_img`(`id`, `did`, `src`, `alt`, `upload`, `state`) VALUES (1, 1, '/images/p.png', '全自动切割机 ZDH-500', '2017-09-02', 1);
INSERT INTO `oa`.`app_device_img`(`id`, `did`, `src`, `alt`, `upload`, `state`) VALUES (2, 2, '/images/p1.png', '十四圆头抛光机 ZD-1200', '2017-10-02', 1);
INSERT INTO `oa`.`app_device_img`(`id`, `did`, `src`, `alt`, `upload`, `state`) VALUES (3, 3, '/images/p2.png', '瓷砖机 ZDC-1200 ', '2017-10-02', 1);
INSERT INTO `oa`.`app_device_img`(`id`, `did`, `src`, `alt`, `upload`, `state`) VALUES (4, 4, '/images/p3.png', '全自动切割机 ZDH-500', '2017-10-02', 1);
INSERT INTO `oa`.`app_device_img`(`id`, `did`, `src`, `alt`, `upload`, `state`) VALUES (5, 5, '/images/p3.png', '全自动切割机 ZDH-500', '2017-10-03', 1);

-- 定位信息
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

-- 消息
DROP TABLE IF EXISTS app_message;
CREATE TABLE app_message (
  id         INT AUTO_INCREMENT,
  pid        INT  NOT NULL  COMMENT '发布人',
  title      VARCHAR(100)    COMMENT '标题',
  content    text   COMMENT '内容',
  dept   VARCHAR (50)    COMMENT '部门',
  team   VARCHAR (50)    COMMENT '科室',
  uid    int  COMMENT '用户ID',
  time   TIMESTAMP COMMENT '发布时间',
  state  BOOLEAN COMMENT '状态 0 不可用 1可用',
  PRIMARY KEY (id)
)ENGINE = InnoDB  DEFAULT CHARSET = utf8;

INSERT  INTO  app_message(pid,title,content,time,state) VALUES(1,'关于国庆放假通知','本公司严格按照国务院规定，今年（2017年）从10月1日起到10月8号，共八天假期！请相关部门负责人做好工作安排',now(),1);
INSERT INTO app_message(pid,title,content,time,state) values (3,'订单编号13422101114客户李先生订购的设备已经发货','订单编号13422101114客户李先生订购的设备已经发货',now(),1);

DROP TABLE IF EXISTS app_order;
CREATE TABLE app_order (
  id         INT AUTO_INCREMENT,
  order_id   VARCHAR(20)    COMMENT '订单编号',
  pid        INT  NOT NULL  COMMENT '发布人',
  proxy        INT   COMMENT '办事处',
  buser     VARCHAR(200)    COMMENT '业务员',
  bphone     VARCHAR(200)    COMMENT '业务员联系方式',
  ext    VARCHAR(100)   COMMENT '定制信息',
  remark    VARCHAR(100)   COMMENT '补充说明',
  cust    VARCHAR (300)   COMMENT '客户',
  stime    VARCHAR (20)   COMMENT '下单时间',
  dtime    VARCHAR (20)   COMMENT '送货时间',
  address    VARCHAR (500)   COMMENT '送货地址',
  phone    VARCHAR (30)   COMMENT '联系电话',
  logistics    VARCHAR (20)   COMMENT '物流公司',
  iphone    VARCHAR (20)   COMMENT '物流公司联系方式',
  driver    VARCHAR (20)   COMMENT '物流司机',
  logphone    VARCHAR (20)   COMMENT '司机联系电话',
  delatime    VARCHAR (20)   COMMENT '发货时间',
  fqid       INT   COMMENT '废弃订单id',
  time   TIMESTAMP COMMENT '发布时间',
  srv        INT  COMMENT '服务派工',
  state  CHAR (2) DEFAULT '1'  COMMENT '状态 0 无效（废弃，重录） 1 - 2 -3 -4 -5 ... -> over  1:内勤录入等待发货，2已发货待安装  3 已完成',
  PRIMARY KEY (id)
)ENGINE = InnoDB auto_increment=20170000001  DEFAULT CHARSET = utf8;

DROP TABLE IF EXISTS app_order_device;
CREATE TABLE app_order_device (
  id         INT AUTO_INCREMENT,
  did   INT COMMENT '设备ID',
  oid      INT(10)    COMMENT '订单id',
  `numb`   int  COMMENT '数量',
  weight   double (8,2)    COMMENT '重量',
  PRIMARY KEY (id)
)ENGINE = InnoDB  DEFAULT CHARSET = utf8;


DROP TABLE IF EXISTS app_order_notify;
CREATE TABLE app_order_notify (
  id         INT AUTO_INCREMENT,
  order_id   INT COMMENT '工单ID',
  title      VARCHAR(100)    COMMENT '标题',
  content    text   COMMENT '内容',
  dept   VARCHAR (50)    COMMENT '部门',
  team   VARCHAR (50)    COMMENT '科室',
  uid    int  COMMENT '用户ID',
  time   TIMESTAMP COMMENT '发布时间',
  state  VARCHAR (10) DEFAULT '0' COMMENT '状态 0等待处理 1处理中 2处理完毕',
  PRIMARY KEY (id)
)ENGINE = InnoDB  DEFAULT CHARSET = utf8;

DROP TABLE IF EXISTS app_order_tech;
CREATE TABLE app_order_tech (
  id         INT AUTO_INCREMENT,
  order_id   INT COMMENT '工单ID',
  uid    INT   COMMENT '派遣人员',
  date   VARCHAR (20)    COMMENT '安装日期',
  pid    int  COMMENT '服务派公人员',
  time   TIMESTAMP COMMENT '发布时间',
  remark   VARCHAR (500)    COMMENT '备注',
  state  VARCHAR (10) DEFAULT '0' COMMENT '状态 0等待处理 1处理中 2处理完毕 -1 已拒绝',
  PRIMARY KEY (id)
)ENGINE = InnoDB  DEFAULT CHARSET = utf8;


DROP TABLE IF EXISTS app_maintain;
CREATE TABLE app_maintain (
  id         INT AUTO_INCREMENT,
  uid   INT (30)  NOT NULL  COMMENT 'submit user id',
  title      VARCHAR(100)    COMMENT '标题',
  `_desc`   VARCHAR (100)    COMMENT '简介',
  content    text   COMMENT '内容',
  time   TIMESTAMP COMMENT '发布时间',
  state  tinyint DEFAULT 1 COMMENT '状态 0不可用 1可用',
  PRIMARY KEY (id)
)ENGINE = InnoDB  DEFAULT CHARSET = utf8;

-- 技术方案
DROP TABLE IF EXISTS app_case;
CREATE TABLE app_case (
  id         INT AUTO_INCREMENT,
  uid   INT (30)  NOT NULL  COMMENT 'submit user id',
  title      VARCHAR(100)    COMMENT '标题',
  content    text   COMMENT '内容',
  time   TIMESTAMP COMMENT '发布时间',
  state  tinyint DEFAULT 1 COMMENT '状态 0不可用 1可用',
  PRIMARY KEY (id)
)ENGINE = InnoDB  DEFAULT CHARSET = utf8;

-- 技术方案
DROP TABLE IF EXISTS app_case_img;
CREATE TABLE app_case_img (
  id         INT AUTO_INCREMENT,
  cid   INT (30)  NOT NULL  COMMENT 'case id',
  src   VARCHAR(50) NOT NULL  COMMENT '图片url',
  path   VARCHAR(50) NOT NULL  COMMENT '图片路径',
  alt        VARCHAR(50)   COMMENT 'alt 原始文件名称',
  upload   DATE COMMENT '上传时间',
  state  BOOLEAN COMMENT '状态 0 不可用 1可用',
  PRIMARY KEY (id)
)ENGINE = InnoDB  DEFAULT CHARSET = utf8;

-- 反馈建议
DROP TABLE IF EXISTS app_advice;
CREATE TABLE app_advice (
  id         INT AUTO_INCREMENT,
  uid   INT (30)  NOT NULL  COMMENT 'submit user id',
  content        text   COMMENT '建议内容',
  time   DATE COMMENT '上传时间',
  state  BOOLEAN COMMENT '状态 0 不可用 1可用',
  PRIMARY KEY (id)
)ENGINE = InnoDB  DEFAULT CHARSET = utf8;

-- 公司动态
DROP TABLE IF EXISTS app_news;
CREATE TABLE app_news (
  id         INT AUTO_INCREMENT,
  uid   INT (30)  NOT NULL  COMMENT 'submit user id',
  title      VARCHAR(200)    COMMENT '标题',
  _desc      VARCHAR(200)    COMMENT '简介',
  content    text   COMMENT '内容',
  time   TIMESTAMP COMMENT '发布时间',
  state  tinyint DEFAULT 1 COMMENT '状态 0不可用 1可用',
  PRIMARY KEY (id)
)ENGINE = InnoDB  DEFAULT CHARSET = utf8;

-- 公司动态 图片
DROP TABLE IF EXISTS app_news_img;
CREATE TABLE app_news_img (
  id         INT AUTO_INCREMENT,
  cid   INT (30)  NOT NULL  COMMENT 'case id',
  src   VARCHAR(500) NOT NULL  COMMENT '图片url',
  path   VARCHAR(500) NOT NULL  COMMENT '图片路径',
  alt        VARCHAR(200)   COMMENT 'alt 原始文件名称',
  upload   DATE COMMENT '上传时间',
  state  BOOLEAN COMMENT '状态 0 不可用 1可用',
  PRIMARY KEY (id)
)ENGINE = InnoDB  DEFAULT CHARSET = utf8;

-- 安装视频教程
DROP TABLE IF EXISTS app_video;
CREATE TABLE app_video (
  id         INT AUTO_INCREMENT,
  uid   INT (30)  NOT NULL  COMMENT 'submit user id',
  title      VARCHAR(200)    COMMENT '标题',
  content    text   COMMENT '简介',
  time   TIMESTAMP COMMENT '发布时间',
  state  tinyint DEFAULT 1 COMMENT '状态 0不可用 1可用',
  PRIMARY KEY (id)
)ENGINE = InnoDB  DEFAULT CHARSET = utf8;

-- 安装视频教程 视频
DROP TABLE IF EXISTS app_video_src;
CREATE TABLE app_video_src (
  id         INT AUTO_INCREMENT,
  vid   INT (30)  NOT NULL  COMMENT 'video id',
  src   VARCHAR(500) NOT NULL  COMMENT '视频url',
  path   VARCHAR(500) NOT NULL  COMMENT '图片路径',
  alt        VARCHAR(200)   COMMENT 'alt 原始文件名称',
  upload   DATE COMMENT '上传时间',
  state  BOOLEAN COMMENT '状态 0 不可用 1可用',
  PRIMARY KEY (id)
)ENGINE = InnoDB  DEFAULT CHARSET = utf8;


-- 签到信息
DROP TABLE IF EXISTS app_sign;
CREATE TABLE app_sign (
  id         INT AUTO_INCREMENT,
  uid   INT (10)  NOT NULL  COMMENT 'user id',
  oid   INT (10)  NOT NULL  COMMENT 'order id',
  longitude        DOUBLE (11,8)   COMMENT '经度',
  latitude   DOUBLE (11,8)   COMMENT '纬度',
  address VARCHAR(2000) COMMENT '地址',
  TYPE  CHAR(1) COMMENT '类型 1： 出发签到，2：到达签到，3：离开签到 ',
  time   TIMESTAMP COMMENT '定位时间',
  PRIMARY KEY (id)
)ENGINE = InnoDB  DEFAULT CHARSET = utf8;
