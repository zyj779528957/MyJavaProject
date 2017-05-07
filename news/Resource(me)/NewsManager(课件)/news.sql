----create table
-----------------------------------------------------------

create table NEWS_USERS
(
  USID  INTEGER not null,
  UNAME VARCHAR2(20) not null,
  UPWD  VARCHAR2(20) not null
);

-- Create/Recreate primary, unique and foreign key constraints 
alter table NEWS_USERS
  add primary key (USID);
  
---------------------------------------------------------

create table TOPIC
(
  TID   INTEGER not null,
  TNAME VARCHAR2(50) not null
);

-- Create/Recreate primary, unique and foreign key constraints 
alter table TOPIC
  add constraint TID primary key (TID);
  
---------------------------------------------------------

create table NEWS
(
  NID         INTEGER not null,
  NTID        INTEGER not null,
  NTITLE      VARCHAR2(200) not null,
  NAUTHOR     VARCHAR2(50) not null,
  NCREATEDATE DATE,
  NPICPATH    VARCHAR2(1000),
  NCONTENT    LONG not null,
  NMODIFYDATE DATE,
  NSUMMARY    VARCHAR2(500) not null
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table NEWS
  add constraint NID primary key (NID);
alter table NEWS
  add constraint NEWS_TOPIC foreign key (NTID)
  references TOPIC (TID) on delete cascade;

------------------------------------------------------------------------

create table COMMENTS
(
  CID      INTEGER not null,
  CNID     INTEGER not null,
  CCONTENT VARCHAR2(3000) not null,
  CDATE    DATE,
  CIP      VARCHAR2(100) not null,
  CAUTHOR  VARCHAR2(100) not null
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table COMMENTS
  add constraint CID primary key (CID);
alter table COMMENTS
  add constraint CIN_NID foreign key (CNID)
  references NEWS (NID) on delete cascade;
  
commit;

----insert data
-----------------------------------------------------------  
insert into NEWS_USERS (USID, UNAME, UPWD)
values (1, 'admin', 'admin');
insert into NEWS_USERS (USID, UNAME, UPWD)
values (2, 'tom', '123');

commit;

-----------------------------------------------------------
insert into TOPIC (TID, TNAME)
values (1, '国内');
insert into TOPIC (TID, TNAME)
values (2, '国际');
insert into TOPIC (TID, TNAME)
values (3, '军事');
insert into TOPIC (TID, TNAME)
values (4, '体育');
insert into TOPIC (TID, TNAME)
values (5, '娱乐');
insert into TOPIC (TID, TNAME)
values (6, '社会');
insert into TOPIC (TID, TNAME)
values (7, '财经');
insert into TOPIC (TID, TNAME)
values (8, '科技');
insert into TOPIC (TID, TNAME)
values (9, '健康');
insert into TOPIC (TID, TNAME)
values (10, '汽车');
insert into TOPIC (TID, TNAME)
values (11, '教育');
insert into TOPIC (TID, TNAME)
values (12, '房产');
insert into TOPIC (TID, TNAME)
values (13, '家居');
insert into TOPIC (TID, TNAME)
values (14, '旅游');
insert into TOPIC (TID, TNAME)
values (15, '文化');
insert into TOPIC (TID, TNAME)
values (16, '其它');
insert into TOPIC (TID, TNAME)
values (28, '探索');
insert into TOPIC (TID, TNAME)
values (29, '另类');
insert into TOPIC (TID, TNAME)
values (31, '地图');

commit;

---------------------------------------------------------------
insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('47', '7', '百余名遭上海钓鱼执法车主要求退还罚款', 'news                                              ', to_date('28-10-2009 10:43:06', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '上海浦东新区政府承认孙中界的确是被“钓鱼”后，众多被“钓鱼”车主大受鼓舞，昨日， 100多名中招者聚集在原南汇区城市管理交通行政执法大队，要求还车或退回罚款。');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('48', '1', '重庆涉黑富豪黎强夫妇庭审答辩言辞相互矛盾', 'news                                              ', to_date('28-10-2009 10:46:39', 'dd-mm-yyyy hh24:mi:ss'), 'upload\2009102810463912.JPG', '<Long>', null, '重庆涉黑富豪黎强夫妇庭审答辩言辞相互矛盾');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('49', '1', '发改委：4万亿投资计划不会挤占民间投资空间', 'news                                              ', to_date('28-10-2009 10:47:12', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '发改委：4万亿投资计划不会挤占民间投资空间');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('50', '2', '日本首相鸠山首次全面阐述新政府外交政策', 'out                                               ', to_date('28-10-2009 10:47:48', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '日本首相鸠山首次全面阐述新政府外交政策');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('51', '5', '施瓦辛格启动影视业回迁计划 推进加州经济复苏', 'pastime                                           ', to_date('28-10-2009 10:49:48', 'dd-mm-yyyy hh24:mi:ss'), 'upload\2009102810494881.JPG', '<Long>', null, '施瓦辛格启动影视业回迁计划 推进加州经济复苏');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('52', '5', '《沧海》导演回应观众质疑 自信能超越《亮剑》', 'pastime                                           ', to_date('28-10-2009 10:50:21', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '《沧海》导演回应观众质疑 自信能超越《亮剑》');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('53', '5', '《海角七号》导演新片开机 吴宇森等出席', 'pastime                                           ', to_date('28-10-2009 10:51:12', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '《海角七号》导演新片开机 吴宇森等出席');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('54', '5', '《四大名捕》敦煌热拍 八主演飙戏火花四溅', 'pastime                                           ', to_date('28-10-2009 10:51:38', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '《四大名捕》敦煌热拍 八主演飙戏火花四溅');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('55', '5', '《风云2》入魔造型曝光 郑伊健戴高级眼镜', 'pastime                                           ', to_date('28-10-2009 10:52:01', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '《风云2》入魔造型曝光 郑伊健戴高级眼镜');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('56', '4', '莫雷：低姿态总比被高估好 进攻端利器新添三分雨', 'sport                                             ', to_date('28-10-2009 10:52:26', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '莫雷：低姿态总比被高估好 进攻端利器新添三分雨');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('57', '1', '河南2个乡镇政绩报告内容完全一致引关注', 'news                                              ', to_date('28-10-2009 10:53:44', 'dd-mm-yyyy hh24:mi:ss'), 'upload\2009102810534470.JPG', '<Long>', null, '河南2个乡镇政绩报告内容完全一致引关注');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('58', '2', '黎巴嫩以色列再次交火互射炮弹', 'out                                               ', to_date('28-10-2009 10:54:15', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '黎巴嫩以色列再次交火互射炮弹');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('59', '2', '伊朗将于30日前就核燃料供应方案作出答复', 'out                                               ', to_date('28-10-2009 10:54:54', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '伊朗将于30日前就核燃料供应方案作出答复');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('60', '2', '与基地有关组织宣称对巴格达连环爆炸负责', 'out                                               ', to_date('28-10-2009 10:55:14', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '与基地有关组织宣称对巴格达连环爆炸负责');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('61', '2', '8名美军士兵在阿富汗遭路边炸弹袭击身亡', 'out                                               ', to_date('28-10-2009 10:55:38', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '8名美军士兵在阿富汗遭路边炸弹袭击身亡');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('62', '5', '皮特车祸之后仍然开朗 轻松改驾四轮车(图)', 'pastime                                           ', to_date('28-10-2009 10:56:43', 'dd-mm-yyyy hh24:mi:ss'), 'upload\2009102810564344.JPG', '<Long>', null, '皮特车祸之后仍然开朗 轻松改驾四轮车(图)');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('63', '4', '美媒体称小布乃火箭新核心 一大缺陷令阿帅很担心', 'sport                                             ', to_date('28-10-2009 10:57:11', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '美媒体称小布乃火箭新核心 一大缺陷令阿帅很担心');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('64', '4', '无姚新赛季落寞油然而生 周遭一种改变正悄悄开始', 'sport                                             ', to_date('28-10-2009 10:57:49', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '无姚新赛季落寞油然而生 周遭一种改变正悄悄开始');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('65', '4', '时过境迁火箭优势变劣势 对抗双塔阿帅只一计可施', 'sport                                             ', to_date('28-10-2009 10:58:11', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '时过境迁火箭优势变劣势 对抗双塔阿帅只一计可施');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('66', '4', '火箭揭幕战是试金石摸底测验 五号位二选一有玄机', 'sport                                             ', to_date('28-10-2009 10:58:36', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '火箭揭幕战是试金石摸底测验 五号位二选一有玄机');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('69', '2', '美国一名外交官辞职抗议美对阿富汗政策', 'out                                               ', to_date('28-10-2009 11:00:02', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '美国一名外交官辞职抗议美对阿富汗政策');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('67', '4', '无姚时代如何关注内线比拼 新赛季中锋PK五岳崛起', 'sport                                             ', to_date('28-10-2009 10:59:07', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '无姚时代如何关注内线比拼 新赛季中锋PK五岳崛起');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('68', '2', '埃及交通部长因致18死火车相撞事故辞职', 'out                                               ', to_date('28-10-2009 10:59:38', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '埃及交通部长因致18死火车相撞事故辞职');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('70', '1', '重庆警方否认被围殴致死吸毒者曾针刺民众', 'news                                              ', to_date('28-10-2009 11:00:25', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '重庆警方否认被围殴致死吸毒者曾针刺民众');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('71', '1', '人保部将首次就同工同酬做出规定', 'news                                              ', to_date('28-10-2009 11:00:45', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '人保部将首次就同工同酬做出规定');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('73', '1', '国台办介绍大陆高校加大对台招生力度情况', 'news                                              ', to_date('28-10-2009 12:55:07', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '国台办介绍大陆高校加大对台招生力度情况');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('74', '2', '喀布尔市中心传出爆炸和枪声 目前原因不明', 'out                                               ', to_date('28-10-2009 12:56:24', 'dd-mm-yyyy hh24:mi:ss'), 'upload\2009102812562482.JPG', '<Long>', null, '喀布尔市中心传出爆炸和枪声 目前原因不明');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('75', '2', '俄数百所幼儿园和学校因流感停课', 'news                                              ', to_date('28-10-2009 12:56:51', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '俄数百所幼儿园和学校因流感停课');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('76', '7', '国内成品油价格上调几成定局', 'news                                              ', to_date('28-10-2009 12:57:18', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', to_date('28-10-2009 12:59:18', 'dd-mm-yyyy hh24:mi:ss'), '                　　国内成品油价格上调几成定局
              ');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('77', '1', '“持械抢劫，当场击毙” 浙江永康现超雷人标语', 'news                                              ', to_date('28-10-2009 12:58:20', 'dd-mm-yyyy hh24:mi:ss'), 'upload\200910281258209.JPG', '<Long>', null, '“持械抢劫，当场击毙” 浙江永康现超雷人标语');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('78', '2', '伊朗称放弃美元作为外储地位 人民币或上位', 'out                                               ', to_date('28-10-2009 12:58:42', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '伊朗称放弃美元作为外储地位 人民币或上位');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('79', '1', '迟福林：“十二五”改革应向消费大国转型', 'news                                              ', to_date('28-10-2009 12:59:45', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '迟福林：“十二五”改革应向消费大国转型');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('80', '1', '商贸联委会在杭州开会 中美对贸易争端态度低调', 'news                                              ', to_date('28-10-2009 01:00:11', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '商贸联委会在杭州开会 中美对贸易争端态度低调');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('81', '2', '气候变化导致海平面上升 ', '                                                  ', to_date('28-10-2009 01:00:37', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '气候变化导致海平面上升 
澳洲沿海71万栋房子可能遭水淹
');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('82', '4', '一纸传真暗含申花处理态度 国足征调杜威突生悬疑', 'sport                                             ', to_date('28-10-2009 01:01:47', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '一纸传真暗含申花处理态度 国足征调杜威突生悬疑');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('83', '4', '临界冠军京城夺票总动员 球迷:夺冠!让所有人闭嘴', 'sport                                             ', to_date('28-10-2009 01:02:17', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '临界冠军京城夺票总动员 球迷:夺冠!让所有人闭嘴');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('84', '4', '洪元硕：北京人的脸就看你们了 最后一哆嗦看着办', 'sport                                             ', to_date('28-10-2009 01:02:56', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '洪元硕：北京人的脸就看你们了 最后一哆嗦看着办');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('85', '4', '省政府500万悬赏建业登顶 球员:遗憾主场放跑国安', 'sport                                             ', to_date('28-10-2009 01:03:19', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '省政府500万悬赏建业登顶 球员:遗憾主场放跑国安');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('86', '4', '深足教练组：说我们买球是侮辱 朱广沪常暗中支招', 'sport                                             ', to_date('28-10-2009 01:03:51', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '深足教练组：说我们买球是侮辱 朱广沪常暗中支招');

commit;

----------------------------------------------------------------------------------
insert into COMMENTS (CID, CNID, CCONTENT, CDATE, CIP, CAUTHOR)
values (22, 82, '评论一下 我是admin', to_date('23-11-2009 03:57:58', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'admin');
insert into COMMENTS (CID, CNID, CCONTENT, CDATE, CIP, CAUTHOR)
values (23, 81, '低碳生活', to_date('30-03-2010 03:00:55', 'dd-mm-yyyy hh24:mi:ss'), '10.0.0.35', '这家伙很懒什么也没留下');
insert into COMMENTS (CID, CNID, CCONTENT, CDATE, CIP, CAUTHOR)
values (26, 86, '隔岸观火吃鸡腿~！', to_date('30-09-2010 01:55:38', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'admin');
insert into COMMENTS (CID, CNID, CCONTENT, CDATE, CIP, CAUTHOR)
values (32, 73, '无聊！！', to_date('08-10-2010 13:43:53', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', '这家伙很懒什么也没留下');
insert into COMMENTS (CID, CNID, CCONTENT, CDATE, CIP, CAUTHOR)
values (34, 79, '支持祖国！！', to_date('12-01-2011 13:21:29', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', '这家伙很懒什么也没留下');

commit;

----------------------------------------------------------------------------------------------------------------
