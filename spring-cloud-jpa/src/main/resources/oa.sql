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

