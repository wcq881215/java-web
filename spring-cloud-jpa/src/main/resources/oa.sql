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

CREATE TABLE app_user (
  id         INT AUTO_INCREMENT,
  username   VARCHAR(15)  NOT NULL  COMMENT '用户名',
  password   VARCHAR(32) NOT NULL  COMMENT '密码',
  phone        VARCHAR(15) NOT NULL  COMMENT '手机',
  department   VARCHAR(15) NOT NULL  COMMENT '部门',
  position   VARCHAR(100) COMMENT '',
  state  BOOLEAN COMMENT '用户状态 0 不可用 1可用',
  PRIMARY KEY (id)
)ENGINE = InnoDB  DEFAULT CHARSET = utf8;

INSERT INTO app_user(username, password, phone, department, position, state) VALUES ('admin','admin','13524625212','管理员','系统管理员','1');

CREATE TABLE app_device (
  id         INT AUTO_INCREMENT,
  sn   VARCHAR(30)  NOT NULL  COMMENT 'sn',
  _name   VARCHAR(32) NOT NULL  COMMENT '设备名称',
  _desc        VARCHAR(15) NOT NULL  COMMENT '简介',
  type   VARCHAR(15) NOT NULL  COMMENT '类别',
  number   INT COMMENT '数量',
  price DOUBLE (12,2) COMMENT '单价',
  state  BOOLEAN COMMENT '状态 0 不可用 1可用',
  PRIMARY KEY (id)
)ENGINE = InnoDB  DEFAULT CHARSET = utf8;

INSERT  INTO  app_device (sn,_name,_desc,type,number,price,state) VALUES ('1111222333','机床螺丝','xxxxxx NB','螺丝',1000,0.1,1);

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

