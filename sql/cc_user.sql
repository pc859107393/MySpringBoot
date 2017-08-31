CREATE TABLE cc_user
(
  id          INT AUTO_INCREMENT
    PRIMARY KEY,
  name        VARCHAR(50)               NULL
  COMMENT '用户昵称',
  login_name  VARCHAR(25) DEFAULT '-1'  NOT NULL
  COMMENT '用户登录名称',
  password    VARCHAR(256) DEFAULT '-1' NOT NULL
  COMMENT '用户密码，建议算法：sha256(MD5(明文)+salt)',
  duty        VARCHAR(50)               NULL
  COMMENT '用户职位',
  create_date INT                       NOT NULL
  COMMENT '创建时间',
  used        TINYINT(1) DEFAULT '1'    NOT NULL
  COMMENT '账户是否可用',
  CONSTRAINT login_name
  UNIQUE (login_name)
)
  COMMENT '用户表';
