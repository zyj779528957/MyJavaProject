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
values (1, '����');
insert into TOPIC (TID, TNAME)
values (2, '����');
insert into TOPIC (TID, TNAME)
values (3, '����');
insert into TOPIC (TID, TNAME)
values (4, '����');
insert into TOPIC (TID, TNAME)
values (5, '����');
insert into TOPIC (TID, TNAME)
values (6, '���');
insert into TOPIC (TID, TNAME)
values (7, '�ƾ�');
insert into TOPIC (TID, TNAME)
values (8, '�Ƽ�');
insert into TOPIC (TID, TNAME)
values (9, '����');
insert into TOPIC (TID, TNAME)
values (10, '����');
insert into TOPIC (TID, TNAME)
values (11, '����');
insert into TOPIC (TID, TNAME)
values (12, '����');
insert into TOPIC (TID, TNAME)
values (13, '�Ҿ�');
insert into TOPIC (TID, TNAME)
values (14, '����');
insert into TOPIC (TID, TNAME)
values (15, '�Ļ�');
insert into TOPIC (TID, TNAME)
values (16, '����');
insert into TOPIC (TID, TNAME)
values (28, '̽��');
insert into TOPIC (TID, TNAME)
values (29, '����');
insert into TOPIC (TID, TNAME)
values (31, '��ͼ');

commit;

---------------------------------------------------------------
insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('47', '7', '���������Ϻ�����ִ������Ҫ���˻�����', 'news                                              ', to_date('28-10-2009 10:43:06', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '�Ϻ��ֶ����������������н��ȷ�Ǳ������㡱���ڶ౻�����㡱�������ܹ��裬���գ� 100���������߾ۼ���ԭ�ϻ������й���ͨ����ִ����ӣ�Ҫ�󻹳����˻ط��');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('48', '1', '������ڸ�����ǿ��ͥ�����Դ��໥ì��', 'news                                              ', to_date('28-10-2009 10:46:39', 'dd-mm-yyyy hh24:mi:ss'), 'upload\2009102810463912.JPG', '<Long>', null, '������ڸ�����ǿ��ͥ�����Դ��໥ì��');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('49', '1', '����ί��4����Ͷ�ʼƻ����ἷռ���Ͷ�ʿռ�', 'news                                              ', to_date('28-10-2009 10:47:12', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '����ί��4����Ͷ�ʼƻ����ἷռ���Ͷ�ʿռ�');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('50', '2', '�ձ������ɽ�״�ȫ������������⽻����', 'out                                               ', to_date('28-10-2009 10:47:48', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '�ձ������ɽ�״�ȫ������������⽻����');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('51', '5', 'ʩ����������Ӱ��ҵ��Ǩ�ƻ� �ƽ����ݾ��ø���', 'pastime                                           ', to_date('28-10-2009 10:49:48', 'dd-mm-yyyy hh24:mi:ss'), 'upload\2009102810494881.JPG', '<Long>', null, 'ʩ����������Ӱ��ҵ��Ǩ�ƻ� �ƽ����ݾ��ø���');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('52', '5', '���׺������ݻ�Ӧ�������� �����ܳ�Խ��������', 'pastime                                           ', to_date('28-10-2009 10:50:21', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '���׺������ݻ�Ӧ�������� �����ܳ�Խ��������');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('53', '5', '�������ߺš�������Ƭ���� ����ɭ�ȳ�ϯ', 'pastime                                           ', to_date('28-10-2009 10:51:12', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '�������ߺš�������Ƭ���� ����ɭ�ȳ�ϯ');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('54', '5', '���Ĵ��������ػ����� �������Ϸ���Ľ�', 'pastime                                           ', to_date('28-10-2009 10:51:38', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '���Ĵ��������ػ����� �������Ϸ���Ľ�');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('55', '5', '������2����ħ�����ع� ֣�������߼��۾�', 'pastime                                           ', to_date('28-10-2009 10:52:01', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '������2����ħ�����ع� ֣�������߼��۾�');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('56', '4', 'Ī�ף�����̬�ܱȱ��߹��� ��������������������', 'sport                                             ', to_date('28-10-2009 10:52:26', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, 'Ī�ף�����̬�ܱȱ��߹��� ��������������������');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('57', '1', '����2��������������������ȫһ������ע', 'news                                              ', to_date('28-10-2009 10:53:44', 'dd-mm-yyyy hh24:mi:ss'), 'upload\2009102810534470.JPG', '<Long>', null, '����2��������������������ȫһ������ע');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('58', '2', '�������ɫ���ٴν������ڵ�', 'out                                               ', to_date('28-10-2009 10:54:15', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '�������ɫ���ٴν������ڵ�');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('59', '2', '���ʽ���30��ǰ�ͺ�ȼ�Ϲ�Ӧ����������', 'out                                               ', to_date('28-10-2009 10:54:54', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '���ʽ���30��ǰ�ͺ�ȼ�Ϲ�Ӧ����������');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('60', '2', '������й���֯���ƶ԰͸��������ը����', 'out                                               ', to_date('28-10-2009 10:55:14', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '������й���֯���ƶ԰͸��������ը����');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('61', '2', '8������ʿ���ڰ�������·��ը��Ϯ������', 'out                                               ', to_date('28-10-2009 10:55:38', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '8������ʿ���ڰ�������·��ը��Ϯ������');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('62', '5', 'Ƥ�س���֮����Ȼ���� ���ɸļ����ֳ�(ͼ)', 'pastime                                           ', to_date('28-10-2009 10:56:43', 'dd-mm-yyyy hh24:mi:ss'), 'upload\2009102810564344.JPG', '<Long>', null, 'Ƥ�س���֮����Ȼ���� ���ɸļ����ֳ�(ͼ)');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('63', '4', '��ý���С���˻���º��� һ��ȱ���˧�ܵ���', 'sport                                             ', to_date('28-10-2009 10:57:11', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '��ý���С���˻���º��� һ��ȱ���˧�ܵ���');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('64', '4', '��Ҧ��������į��Ȼ���� ����һ�ָı������Ŀ�ʼ', 'sport                                             ', to_date('28-10-2009 10:57:49', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '��Ҧ��������į��Ȼ���� ����һ�ָı������Ŀ�ʼ');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('65', '4', 'ʱ����Ǩ������Ʊ����� �Կ�˫����˧ֻһ�ƿ�ʩ', 'sport                                             ', to_date('28-10-2009 10:58:11', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, 'ʱ����Ǩ������Ʊ����� �Կ�˫����˧ֻһ�ƿ�ʩ');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('66', '4', '�����Ļս���Խ�ʯ���ײ��� ���λ��ѡһ������', 'sport                                             ', to_date('28-10-2009 10:58:36', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '�����Ļս���Խ�ʯ���ײ��� ���λ��ѡһ������');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('69', '2', '����һ���⽻�ٴ�ְ�������԰���������', 'out                                               ', to_date('28-10-2009 11:00:02', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '����һ���⽻�ٴ�ְ�������԰���������');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('67', '4', '��Ҧʱ����ι�ע���߱�ƴ �������з�PK��������', 'sport                                             ', to_date('28-10-2009 10:59:07', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '��Ҧʱ����ι�ע���߱�ƴ �������з�PK��������');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('68', '2', '������ͨ��������18������ײ�¹ʴ�ְ', 'out                                               ', to_date('28-10-2009 10:59:38', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '������ͨ��������18������ײ�¹ʴ�ְ');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('70', '1', '���쾯�����ϱ�ΧŹ�������������������', 'news                                              ', to_date('28-10-2009 11:00:25', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '���쾯�����ϱ�ΧŹ�������������������');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('71', '1', '�˱������״ξ�ͬ��ͬ�������涨', 'news                                              ', to_date('28-10-2009 11:00:45', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '�˱������״ξ�ͬ��ͬ�������涨');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('73', '1', '��̨����ܴ�½��У�Ӵ��̨�����������', 'news                                              ', to_date('28-10-2009 12:55:07', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '��̨����ܴ�½��У�Ӵ��̨�����������');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('74', '2', '�����������Ĵ�����ը��ǹ�� Ŀǰԭ����', 'out                                               ', to_date('28-10-2009 12:56:24', 'dd-mm-yyyy hh24:mi:ss'), 'upload\2009102812562482.JPG', '<Long>', null, '�����������Ĵ�����ը��ǹ�� Ŀǰԭ����');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('75', '2', '���������׶�԰��ѧУ������ͣ��', 'news                                              ', to_date('28-10-2009 12:56:51', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '���������׶�԰��ѧУ������ͣ��');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('76', '7', '���ڳ�Ʒ�ͼ۸��ϵ����ɶ���', 'news                                              ', to_date('28-10-2009 12:57:18', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', to_date('28-10-2009 12:59:18', 'dd-mm-yyyy hh24:mi:ss'), '                �������ڳ�Ʒ�ͼ۸��ϵ����ɶ���
              ');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('77', '1', '����е���٣��������С� �㽭�����ֳ����˱���', 'news                                              ', to_date('28-10-2009 12:58:20', 'dd-mm-yyyy hh24:mi:ss'), 'upload\200910281258209.JPG', '<Long>', null, '����е���٣��������С� �㽭�����ֳ����˱���');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('78', '2', '���ʳƷ�����Ԫ��Ϊ�ⴢ��λ ����һ���λ', 'out                                               ', to_date('28-10-2009 12:58:42', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '���ʳƷ�����Ԫ��Ϊ�ⴢ��λ ����һ���λ');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('79', '1', '�ٸ��֣���ʮ���塱�ĸ�Ӧ�����Ѵ��ת��', 'news                                              ', to_date('28-10-2009 12:59:45', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '�ٸ��֣���ʮ���塱�ĸ�Ӧ�����Ѵ��ת��');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('80', '1', '��ó��ί���ں��ݿ��� ������ó������̬�ȵ͵�', 'news                                              ', to_date('28-10-2009 01:00:11', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '��ó��ί���ں��ݿ��� ������ó������̬�ȵ͵�');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('81', '2', '����仯���º�ƽ������ ', '                                                  ', to_date('28-10-2009 01:00:37', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '����仯���º�ƽ������ 
�����غ�71�򶰷��ӿ�����ˮ��
');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('82', '4', 'һֽ���氵���껨����̬�� ������������ͻ������', 'sport                                             ', to_date('28-10-2009 01:01:47', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, 'һֽ���氵���껨����̬�� ������������ͻ������');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('83', '4', '�ٽ�ھ����Ƕ�Ʊ�ܶ�Ա ����:���!�������˱���', 'sport                                             ', to_date('28-10-2009 01:02:17', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '�ٽ�ھ����Ƕ�Ʊ�ܶ�Ա ����:���!�������˱���');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('84', '4', '��Ԫ˶�������˵����Ϳ������� ���һ���¿��Ű�', 'sport                                             ', to_date('28-10-2009 01:02:56', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '��Ԫ˶�������˵����Ϳ������� ���һ���¿��Ű�');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('85', '4', 'ʡ����500�����ͽ�ҵ�Ƕ� ��Ա:�ź��������ܹ���', 'sport                                             ', to_date('28-10-2009 01:03:19', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, 'ʡ����500�����ͽ�ҵ�Ƕ� ��Ա:�ź��������ܹ���');

insert into news (NID, NTID, NTITLE, NAUTHOR, NCREATEDATE, NPICPATH, NCONTENT, NMODIFYDATE, NSUMMARY)
values ('86', '4', '��������飺˵�������������� ��㻦������֧��', 'sport                                             ', to_date('28-10-2009 01:03:51', 'dd-mm-yyyy hh24:mi:ss'), '', '<Long>', null, '��������飺˵�������������� ��㻦������֧��');

commit;

----------------------------------------------------------------------------------
insert into COMMENTS (CID, CNID, CCONTENT, CDATE, CIP, CAUTHOR)
values (22, 82, '����һ�� ����admin', to_date('23-11-2009 03:57:58', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'admin');
insert into COMMENTS (CID, CNID, CCONTENT, CDATE, CIP, CAUTHOR)
values (23, 81, '��̼����', to_date('30-03-2010 03:00:55', 'dd-mm-yyyy hh24:mi:ss'), '10.0.0.35', '��һ����ʲôҲû����');
insert into COMMENTS (CID, CNID, CCONTENT, CDATE, CIP, CAUTHOR)
values (26, 86, '�����ۻ�Լ���~��', to_date('30-09-2010 01:55:38', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 'admin');
insert into COMMENTS (CID, CNID, CCONTENT, CDATE, CIP, CAUTHOR)
values (32, 73, '���ģ���', to_date('08-10-2010 13:43:53', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', '��һ����ʲôҲû����');
insert into COMMENTS (CID, CNID, CCONTENT, CDATE, CIP, CAUTHOR)
values (34, 79, '֧���������', to_date('12-01-2011 13:21:29', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', '��һ����ʲôҲû����');

commit;

----------------------------------------------------------------------------------------------------------------
