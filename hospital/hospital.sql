-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `admin` (
  `account` char(16) NOT NULL,
  `password` char(16) DEFAULT NULL,
  `name` char(16) DEFAULT NULL,
  PRIMARY KEY (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('admin','admin','管理员');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apply`
--

DROP TABLE IF EXISTS `apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `apply` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `did` int(11) DEFAULT NULL COMMENT '医生id',
  `dname` char(16) DEFAULT NULL,
  `wid` int(11) DEFAULT NULL,
  `reason` char(32) DEFAULT NULL COMMENT '原因',
  `applytime` datetime DEFAULT NULL COMMENT '医生这天上午或下午的号源数',
  `request` char(8) DEFAULT NULL COMMENT '状态：申请出诊，申请停诊',
  `state` char(8) DEFAULT NULL COMMENT '状态：等待处理，同意，拒绝',
  PRIMARY KEY (`aid`),
  KEY `wid` (`wid`),
  KEY `did` (`did`),
  CONSTRAINT `apply_ibfk_1` FOREIGN KEY (`wid`) REFERENCES `workday` (`wid`),
  CONSTRAINT `apply_ibfk_2` FOREIGN KEY (`did`) REFERENCES `doctor` (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apply`
--

LOCK TABLES `apply` WRITE;
/*!40000 ALTER TABLE `apply` DISABLE KEYS */;
INSERT INTO `apply` VALUES (1,9,'徐玉秀',121,'','2019-01-16 10:40:56','申请停诊','取消'),(2,9,'徐玉秀',123,'','2019-01-16 10:41:44','申请停诊','取消'),(3,1,'王坤根',9,'','2019-01-16 10:57:56','申请出诊','等待处理');
/*!40000 ALTER TABLE `apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `doctor` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `account` char(16) DEFAULT NULL,
  `password` char(16) DEFAULT NULL,
  `dname` char(16) DEFAULT NULL,
  `fee` int(11) DEFAULT NULL COMMENT '医生出诊费',
  `gender` char(2) DEFAULT NULL,
  `age` tinyint(4) DEFAULT NULL,
  `office` char(16) DEFAULT NULL,
  `room` char(16) DEFAULT NULL,
  `career` char(8) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `picpath` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,'00001','123456','王坤根',50,'男',35,'中内科','中内科诊室1','主任中医师','历任浙江省中医管理局局长，浙江中医学院副院长、中医系主任，浙江中医学院附属第一医院（浙江省中医院）院长、书记。现任浙江省中医学会顾问。','/hospital/images/docpic/1.png'),(2,'00002','123456','骆英',100,'女',31,'中内科','中内科诊室1','科主任','教授、主任医师 中华口腔医学会正畸专委会委员, 浙江省口腔医学会正畸专委会委员, 浙江省口腔正畸指导中心专家委员会委员, 浙江省医学会鉴定专家库成员, 浙江省特色学科带头人。《中华口腔正畸学杂志》通讯编委，省级刊物《健康研究》审稿专家。','/hospital/images/docpic/2.png'),(3,'00003','123456','吴生元',150,'男',65,'中内科','中内科诊室2','中医内科专家','中国中医药学会理事、云南中医药学会副会长兼内科专业委员会主任委员、云南省新药评委会副主任','/hospital/images/docpic/3.png'),(4,'00004','123456','钟南山',150,'男',51,'中内科','中内科诊室2','中医内科专家','中国工程院院士，著名呼吸病学专家，中国抗击非典型肺炎的领军人物，曾任广州医学院院长、党委书记，广州市呼吸疾病研究所所长、广州呼吸疾病国家重点实验室主任、广州医科大学附属第一医院国家呼吸系统疾病临床医学研究中心主任、广东省老科学技术工作者协会会长','/hospital/images/docpic/4.png'),(5,'00005','123456','纪立农',100,'男',45,'内分泌科','内分泌科诊室1','内分泌科主任','现任北京人民医院内分泌科主任、主任医师、博士生导师、兼任中华医学会糖尿病学会现任主任委员、北京糖尿病防治协会副理事长。《中国糖尿病教育与管理杂志》名誉主编、《中华内分泌代谢杂志》、《中华糖尿病杂志》、《临床药物治疗》等杂志编委。发表科研论文60余篇，参编医学专著11部。获卫生部优秀中青年临床医学奖','/hospital/images/docpic/5.png'),(6,'00006','123456','邢小平',100,'女',45,'内分泌科','内分泌科诊室1','内分泌科专家','现任北京协和医院内分泌科主任，中国医师协会内分泌代谢科医师分会副会长,中华医学会内分泌学分会委员兼学术秘书，中华医学会北京分会骨质疏松专业委员会委员兼学术秘书','/hospital/images/docpic/6.png'),(7,'00007','123456','杨宗于',150,'女',40,'内分泌科','内分泌科诊室2','内分泌科副主任','现任副主任医师、教授、曾任核医学科主任。现获政府特殊津贴。 重点研究甲状腺疾病、糖尿病及核医学体外放射配体结合分析临床应用等，单独及协作发表论文10余篇','/hospital/images/docpic/7.png'),(8,'00008','123456','吴问汉',150,'男',35,'外科','外科诊室1','外科主任','师从我国著名外科专家黄延庭教授，专门从事肝胆膜肿瘤、肝硬化等肝脏疾病的治疗和器官移植细胞免疫基础的研究。最早开始在北京大学第一医院开始肝脏移植工作。曾于2000年和2001年先后赴美国和香港学习肝脏移植和肝胆膜外科手术技术','/hospital/images/docpic/8.png'),(9,'00009','123456','徐玉秀',150,'女',45,'外科','外科诊室1','外科专家','教授，从事普通外科临床工作40余年，擅长乳腺、甲状腺良恶性疾病的诊治','/hospital/images/docpic/9.png'),(10,'00010','123456','史继荣',150,'男',30,'外科','外科诊室2','主治医师','在北京大学第一医院普通外科工作至今，历任住院医师、总住院医师、主治医师，2010年7月获医学博士学位。主要临床工作及研究方向为肝胆外科疾病、肿瘤外科疾病的诊断和治疗，包括肝脏疾病的外科治疗、胆道良恶性疾病的外科治疗','/hospital/images/docpic/10.png'),(11,'00011','123456','周正飞',150,'男',33,'外科','外科诊室2','主治医师','曾在德国Ulm大学外科医院访问学习一年余。擅长普通外科肝胆、胰腺良恶性疾病的诊治','/hospital/images/docpic/11.png'),(12,'00012','123456','李洁',150,'女',31,'新生儿科','新生儿科诊室1','主治医师','擅长新生儿相关疾病、小儿血液病，小儿感冒，发烧，腹泻，咳嗽，以及婴幼儿喂养，生长发育辅导及小儿常见病、多发病的诊断及治疗，同时作为一个小女娃的妈妈，支持科学育儿，希望和宝妈们分享更科学的育儿方法。','/hospital/images/docpic/12.png'),(13,'00013','123456','温春玲',150,'女',34,'新生儿科','新生儿科诊室1','副主任医师','从事儿科临床、教学、科研工作20余年。在新生儿及婴幼儿常见病，如发热，急性呼吸道感染，急/慢性咳嗽，鼻炎，呕吐，腹泻，肠绞痛，尿布疹，湿疹等方面积累了丰富的经验。同时，在新生儿及婴幼儿保健，如疾病预防，营养评估及补充，早期干预训练，智力开发等方面同样经验丰富','/hospital/images/docpic/13.png'),(14,'00014','123456','沈天阳',100,'男',31,'新生儿科','新生儿科诊室2','主治医师','擅长各类儿科疾病，尤其是呼吸道相关疾病，消化道疾病，比如发热、咳嗽、腹泻、呕吐等。新生儿肠绞痛，蛋白过敏，新生儿肺炎','/hospital/images/docpic/14.png'),(15,'00015','123456','贾炜',100,'男',28,'新生儿科','新生儿科诊室2','主任医师','儿内科各种常见疾病的诊治。尤其擅长新生儿包括早产儿、新生儿的各种问题如黄疸、感染、肠绞痛、营养以及脑发育，常见儿童的发热、感冒、咳嗽、消化不良、拉肚子（腹泻）、哮喘等疾病诊断和治疗','/hospital/images/docpic/15.png'),(16,'00016','123456','刘若卓',150,'男',31,'神经内科','神经内科诊室1','主治医师','各种神经内科常见疾病，尤其是:1.头面痛（偏头痛、紧张型头痛、丛集性头痛、药物性头痛等）和失眠，痴呆，帕金森病，重症肌无力、吉兰巴雷综合征、脱髓鞘病（多发性硬化，视神经脊髓炎）的诊治','/hospital/images/docpic/16.png'),(17,'00017','123456','国红',150,'女',35,'神经内科','神经内科诊室2','主治医师',' 脑血管病、头痛、头晕、睡眠障碍、高血压病、高脂血症、痴呆、帕金森病、焦虑抑郁状态、重症肌无力、吉兰巴雷综合症、多发性硬化、视神经脊髓炎谱系疾病、癫痫、脑炎、运动神经元病、肌病、昏迷','/hospital/images/docpic/17.png'),(18,'00018','123456','胡洋',150,'男',31,'呼吸内科','呼吸内科诊室1','主治医师',' 间质性肺病，胸内结节病，弥漫性泛细支气管炎，慢性支气管炎，慢性阻塞性肺病，支气管扩张，肺部结节，哮喘，肺癌，长期慢性不明原因咳嗽等肺部疾病','/hospital/images/docpic/18.png'),(19,'00019','123456','顾海彤',150,'女',41,'呼吸内科','呼吸内科诊室1','主治医师',' 间质性肺病，胸内结节病，弥漫性泛细支气管炎，慢性支气管炎，慢性阻塞性肺病，支气管扩张，肺部结节，哮喘，肺癌，长期慢性不明原因咳嗽等肺部疾病','/hospital/images/docpic/19.png'),(20,'00020','123456','钟文',150,'男',35,'呼吸内科','呼吸内科诊室2','主任医师','呼吸系统疾病及糖尿病，肺癌的诊断及治疗，肿瘤的靶向治疗，糖尿病常见并发症的诊断及治疗','/hospital/images/docpic/20.png'),(21,'00021','123456','许亚宁',150,'男',25,'心血管内科','心血管内科诊室1','主治医师','长期工作在部队医疗一线，积累了丰富的临床工作经验，擅长高血压，冠心病，心力衰竭，房颤等疾病的诊断与治疗','/hospital/images/docpic/21.png'),(22,'00022','123456','孙大龙',150,'男',35,'心血管内科','心血管内科诊室1','主治医师','擅长冠心病，心衰，心律失常，高血压，糖尿病，脂代谢异常、胃肠道疾病，肝胆疾病，胰腺疾病及消化内镜下早癌诊断及治疗。特别是老年多系统慢性病个体化治疗、精准治疗及长期管理','/hospital/images/docpic/22.png'),(23,'00026','123456','张冲林',100,'男',39,'儿童哮喘专科','儿童哮喘专科诊室1','儿童哮喘专科主任','徐州医学院兼职讲师，省医学会儿科呼吸学组委员、徐州市医学会儿科专业委员会委员。1987年毕业于徐州医学院医学系，一直从事儿内科临床、教学工作','/hospital/images/docpic/26.png'),(24,'00028','123456','李振华',100,'女',38,'儿童康复专科','儿童康复专科诊室1','儿童康复专科主任','擅长儿童康复相关疾病治疗。','/hospital/images/docpic/28.png'),(25,'1111','123456','涨五',12,'男',18,'外科','外科诊室1','主任医师','111111','/hospital/images/docpic/default.jpg');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = gbk */ ;
/*!50003 SET character_set_results = gbk */ ;
/*!50003 SET collation_connection  = gbk_chinese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `scheduling` AFTER INSERT ON `doctor` FOR EACH ROW begin
    update office set doctornum=doctornum+1 where officename=new.office;
    update room set doctornum=doctornum+1 where roomname=new.room;
    set @i=0;
    lp : loop
       insert into workday values (null,new.did,@i,'上午',10,'预约');
      insert into workday values (null,new.did,@i,'下午',0,'停诊');
      set @i=@i+1;
      if @i>6 then
        leave lp;
      end if;
    end loop;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `integrity`
--

DROP TABLE IF EXISTS `integrity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `integrity` (
  `integrityid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL COMMENT '病人id',
  `dname` char(16) DEFAULT NULL COMMENT '医生名字',
  `office` char(16) DEFAULT NULL COMMENT '科室名字',
  `time` datetime DEFAULT NULL COMMENT '诚信记录的时间',
  `reason` char(32) DEFAULT NULL COMMENT '原因',
  `score` tinyint(4) DEFAULT NULL COMMENT '分值',
  PRIMARY KEY (`integrityid`),
  KEY `pid` (`pid`),
  CONSTRAINT `integrity_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `patient` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `integrity`
--

LOCK TABLES `integrity` WRITE;
/*!40000 ALTER TABLE `integrity` DISABLE KEYS */;
INSERT INTO `integrity` VALUES (1,1,'徐玉秀','外科','2019-01-15 22:16:10','完成预约',10),(2,1,'史继荣','外科','2019-01-16 13:50:23','爽约',-10),(3,4,'钟文','呼吸内科','2019-01-16 13:54:24','爽约',-10);
/*!40000 ALTER TABLE `integrity` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = gbk */ ;
/*!50003 SET character_set_results = gbk */ ;
/*!50003 SET collation_connection  = gbk_chinese_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `setintegrity` AFTER INSERT ON `integrity` FOR EACH ROW begin
    declare s1 int;
    declare s2 int;
    set s1 = (select integrity from patient where pid=new.pid);
    set s2= s1+new.score;
    if s2>=100 then
      set s2=100;
    end if;
    update patient set integrity=s2 where pid =new.pid;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `office`
--

DROP TABLE IF EXISTS `office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `office` (
  `officename` char(16) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `doctornum` int(11) DEFAULT NULL,
  PRIMARY KEY (`officename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office`
--

LOCK TABLES `office` WRITE;
/*!40000 ALTER TABLE `office` DISABLE KEYS */;
INSERT INTO `office` VALUES ('不孕不育科','不孕不育作为医院的重点科室，率先引进世界高成功率技术！',0),('中内科','暂无描述',4),('中医妇科',' 汇集全城妇科专家，帮您解决疑难杂症！',0),('儿科泌尿专科','暂无描述',0),('儿科神经内科','暂无描述',0),('内分泌科','暂无描述',3),('口腔科','种植中心、正畸中心、修复等是特色专科。',0),('呼吸内科','暂无描述',3),('外科','暂无描述',5),('心血管内科','暂无描述',2),('新生儿科','暂无描述',4),('眼科','专业眼科，帮助您更好的恢复视力，有一双明亮的眼！',0),('神经内科','暂无描述',2),('骨外科','暂无描述',0);
/*!40000 ALTER TABLE `office` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `patient` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `account` char(16) DEFAULT NULL,
  `email` char(32) DEFAULT NULL,
  `password` char(32) DEFAULT NULL,
  `name` char(16) DEFAULT NULL,
  `integrity` tinyint(4) DEFAULT NULL,
  `idcard` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;


/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'123456','208094973@qq.com','111','123456',100),(2,'1234567','208094973@qq.com','123456','123456',100),(3,'12345','208094973@qq.com','123456','123456',100),(4,'1','208094973@qq.com','1','患者1',90);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recode`
--

DROP TABLE IF EXISTS `recode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `recode` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL COMMENT '病人id',
  `wid` int(11) DEFAULT NULL COMMENT '工作日id',
  `did` int(11) DEFAULT NULL COMMENT '医生id',
  `serialnumber` int(11) DEFAULT NULL COMMENT '就诊序号',
  `visitdate` date DEFAULT NULL COMMENT '就诊日期',
  `visitnoon` char(4) DEFAULT NULL COMMENT '就诊上午或下午',
  `visittime` time DEFAULT NULL COMMENT '就诊时间',
  `ordertime` datetime DEFAULT NULL COMMENT '预约记录的时间',
  `state` char(8) DEFAULT NULL COMMENT '预约状态：成功，取消，完成，爽约',
  PRIMARY KEY (`rid`),
  KEY `pid` (`pid`),
  KEY `did` (`did`),
  KEY `wid` (`wid`),
  CONSTRAINT `recode_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `patient` (`pid`),
  CONSTRAINT `recode_ibfk_2` FOREIGN KEY (`did`) REFERENCES `doctor` (`did`),
  CONSTRAINT `recode_ibfk_3` FOREIGN KEY (`wid`) REFERENCES `workday` (`wid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recode`
--

LOCK TABLES `recode` WRITE;
/*!40000 ALTER TABLE `recode` DISABLE KEYS */;
INSERT INTO `recode` VALUES (1,1,119,9,5,'2019-01-16','上午','10:06:00','2019-01-15 11:27:13','完成'),(2,1,135,10,7,'2019-01-17','上午','10:54:00','2019-01-15 11:27:33','爽约'),(3,1,119,9,7,'2019-01-16','上午','10:54:00','2019-01-15 16:28:59','完成'),(4,1,77,6,5,'2019-01-16','上午','10:06:00','2019-01-15 20:30:51','取消'),(5,4,217,16,7,'2019-01-16','上午','10:54:00','2019-01-15 20:40:20','成功'),(6,4,301,22,8,'2019-01-16','上午','11:18:00','2019-01-15 20:40:43','成功'),(7,4,263,19,8,'2019-01-18','上午','11:18:00','2019-01-15 20:41:14','成功'),(8,4,267,20,9,'2019-01-20','上午','11:42:00','2019-01-15 20:50:48','成功'),(9,4,277,20,5,'2019-01-18','上午','10:06:00','2019-01-15 20:51:03','爽约'),(10,4,217,16,6,'2019-01-16','上午','10:30:00','2019-01-15 20:58:26','成功'),(11,4,177,13,10,'2019-01-17','上午','12:06:00','2019-01-15 20:58:52','成功'),(12,4,73,6,5,'2019-01-21','上午','10:06:00','2019-01-15 20:59:24','成功'),(13,4,125,9,10,'2019-01-19','上午','12:06:00','2019-01-15 21:00:46','爽约'),(14,4,153,11,8,'2019-01-19','上午','11:18:00','2019-01-15 21:04:59','成功'),(15,1,75,6,8,'2019-01-22','上午','11:18:00','2019-01-16 13:47:41','成功'),(16,1,9,1,6,'2019-01-17','上午','10:30:00','2019-01-16 15:20:39','取消'),(17,1,21,2,8,'2019-01-23','上午','11:18:00','2019-01-17 20:52:04','成功');
/*!40000 ALTER TABLE `recode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `officename` char(16) DEFAULT NULL,
  `roomname` char(16) DEFAULT NULL,
  `doctornum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `officename` (`officename`),
  CONSTRAINT `room_ibfk_1` FOREIGN KEY (`officename`) REFERENCES `office` (`officename`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,'中内科','中内科诊室1',2),(2,'中内科','中内科诊室2',2),(3,'内分泌科','内分泌诊室1',0),(4,'内分泌科','内分泌诊室2',0),(5,'外科','外科诊室1',3),(6,'外科','外科诊室2',2),(7,'新生儿科','新生儿科诊室1',2),(8,'新生儿科','新生儿科诊室2',2),(9,'神经内科','神经内科诊室1',1),(10,'神经内科','神经科诊室2',0),(11,'呼吸内科','呼吸内科诊室1',2),(12,'呼吸内科','呼吸内科诊室2',1),(13,'心血管内科','心血管内科诊室1',2);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workday`
--

DROP TABLE IF EXISTS `workday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `workday` (
  `wid` int(11) NOT NULL AUTO_INCREMENT,
  `did` int(11) DEFAULT NULL COMMENT '医生id',
  `worktime` char(4) DEFAULT NULL COMMENT '医生工作日，星期几',
  `ampm` char(4) DEFAULT NULL COMMENT '医生工作日的上午或下午',
  `nsnum` int(11) DEFAULT NULL COMMENT '医生这天上午或下午的号源数',
  `state` char(8) DEFAULT NULL COMMENT '状态：已满，预约，停诊',
  PRIMARY KEY (`wid`),
  KEY `did` (`did`),
  CONSTRAINT `workday_ibfk_1` FOREIGN KEY (`did`) REFERENCES `doctor` (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=351 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workday`
--

LOCK TABLES `workday` WRITE;
/*!40000 ALTER TABLE `workday` DISABLE KEYS */;
INSERT INTO `workday` VALUES (1,1,'0','上午',10,'预约'),(2,1,'0','下午',0,'停诊'),(3,1,'1','上午',10,'预约'),(4,1,'1','下午',0,'停诊'),(5,1,'2','上午',0,'停诊'),(6,1,'2','下午',11,'预约'),(7,1,'3','上午',10,'预约'),(8,1,'3','下午',0,'停诊'),(9,1,'4','上午',0,'停诊'),(10,1,'4','下午',7,'预约'),(11,1,'5','上午',10,'预约'),(12,1,'5','下午',0,'停诊'),(13,1,'6','上午',0,'停诊'),(14,1,'6','下午',12,'预约'),(15,2,'0','上午',10,'预约'),(16,2,'0','下午',0,'停诊'),(17,2,'1','上午',10,'预约'),(18,2,'1','下午',0,'停诊'),(19,2,'2','上午',10,'预约'),(20,2,'2','下午',0,'停诊'),(21,2,'3','上午',10,'预约'),(22,2,'3','下午',0,'停诊'),(23,2,'4','上午',10,'预约'),(24,2,'4','下午',0,'停诊'),(25,2,'5','上午',10,'预约'),(26,2,'5','下午',0,'停诊'),(27,2,'6','上午',10,'预约'),(28,2,'6','下午',0,'停诊'),(29,3,'0','上午',10,'预约'),(30,3,'0','下午',0,'停诊'),(31,3,'1','上午',10,'预约'),(32,3,'1','下午',0,'停诊'),(33,3,'2','上午',10,'预约'),(34,3,'2','下午',0,'停诊'),(35,3,'3','上午',10,'预约'),(36,3,'3','下午',0,'停诊'),(37,3,'4','上午',10,'预约'),(38,3,'4','下午',0,'停诊'),(39,3,'5','上午',10,'预约'),(40,3,'5','下午',0,'停诊'),(41,3,'6','上午',10,'预约'),(42,3,'6','下午',0,'停诊'),(43,4,'0','上午',10,'预约'),(44,4,'0','下午',0,'停诊'),(45,4,'1','上午',10,'预约'),(46,4,'1','下午',0,'停诊'),(47,4,'2','上午',10,'预约'),(48,4,'2','下午',0,'停诊'),(49,4,'3','上午',10,'预约'),(50,4,'3','下午',0,'停诊'),(51,4,'4','上午',10,'预约'),(52,4,'4','下午',0,'停诊'),(53,4,'5','上午',10,'预约'),(54,4,'5','下午',0,'停诊'),(55,4,'6','上午',10,'预约'),(56,4,'6','下午',0,'停诊'),(57,5,'0','上午',10,'预约'),(58,5,'0','下午',0,'停诊'),(59,5,'1','上午',10,'预约'),(60,5,'1','下午',0,'停诊'),(61,5,'2','上午',10,'预约'),(62,5,'2','下午',0,'停诊'),(63,5,'3','上午',10,'预约'),(64,5,'3','下午',0,'停诊'),(65,5,'4','上午',10,'预约'),(66,5,'4','下午',0,'停诊'),(67,5,'5','上午',10,'预约'),(68,5,'5','下午',0,'停诊'),(69,5,'6','上午',10,'预约'),(70,5,'6','下午',0,'停诊'),(71,6,'0','上午',10,'预约'),(72,6,'0','下午',0,'停诊'),(73,6,'1','上午',10,'预约'),(74,6,'1','下午',0,'停诊'),(75,6,'2','上午',10,'预约'),(76,6,'2','下午',0,'停诊'),(77,6,'3','上午',10,'预约'),(78,6,'3','下午',0,'停诊'),(79,6,'4','上午',10,'预约'),(80,6,'4','下午',0,'停诊'),(81,6,'5','上午',10,'预约'),(82,6,'5','下午',0,'停诊'),(83,6,'6','上午',10,'预约'),(84,6,'6','下午',0,'停诊'),(85,7,'0','上午',10,'预约'),(86,7,'0','下午',0,'停诊'),(87,7,'1','上午',10,'预约'),(88,7,'1','下午',0,'停诊'),(89,7,'2','上午',10,'预约'),(90,7,'2','下午',0,'停诊'),(91,7,'3','上午',10,'预约'),(92,7,'3','下午',0,'停诊'),(93,7,'4','上午',10,'预约'),(94,7,'4','下午',0,'停诊'),(95,7,'5','上午',10,'预约'),(96,7,'5','下午',0,'停诊'),(97,7,'6','上午',10,'预约'),(98,7,'6','下午',0,'停诊'),(99,8,'0','上午',10,'预约'),(100,8,'0','下午',0,'停诊'),(101,8,'1','上午',10,'预约'),(102,8,'1','下午',0,'停诊'),(103,8,'2','上午',10,'预约'),(104,8,'2','下午',0,'停诊'),(105,8,'3','上午',10,'预约'),(106,8,'3','下午',0,'停诊'),(107,8,'4','上午',10,'预约'),(108,8,'4','下午',0,'停诊'),(109,8,'5','上午',10,'预约'),(110,8,'5','下午',0,'停诊'),(111,8,'6','上午',10,'预约'),(112,8,'6','下午',0,'停诊'),(113,9,'0','上午',10,'预约'),(114,9,'0','下午',0,'停诊'),(115,9,'1','上午',10,'预约'),(116,9,'1','下午',0,'停诊'),(117,9,'2','上午',10,'预约'),(118,9,'2','下午',0,'停诊'),(119,9,'3','上午',10,'预约'),(120,9,'3','下午',0,'停诊'),(121,9,'4','上午',10,'预约'),(122,9,'4','下午',0,'停诊'),(123,9,'5','上午',10,'预约'),(124,9,'5','下午',0,'停诊'),(125,9,'6','上午',10,'预约'),(126,9,'6','下午',0,'停诊'),(127,10,'0','上午',10,'预约'),(128,10,'0','下午',0,'停诊'),(129,10,'1','上午',10,'预约'),(130,10,'1','下午',0,'停诊'),(131,10,'2','上午',10,'预约'),(132,10,'2','下午',0,'停诊'),(133,10,'3','上午',10,'预约'),(134,10,'3','下午',0,'停诊'),(135,10,'4','上午',10,'预约'),(136,10,'4','下午',0,'停诊'),(137,10,'5','上午',10,'预约'),(138,10,'5','下午',0,'停诊'),(139,10,'6','上午',10,'预约'),(140,10,'6','下午',0,'停诊'),(141,11,'0','上午',10,'预约'),(142,11,'0','下午',0,'停诊'),(143,11,'1','上午',10,'预约'),(144,11,'1','下午',0,'停诊'),(145,11,'2','上午',10,'预约'),(146,11,'2','下午',0,'停诊'),(147,11,'3','上午',10,'预约'),(148,11,'3','下午',0,'停诊'),(149,11,'4','上午',10,'预约'),(150,11,'4','下午',0,'停诊'),(151,11,'5','上午',10,'预约'),(152,11,'5','下午',0,'停诊'),(153,11,'6','上午',10,'预约'),(154,11,'6','下午',0,'停诊'),(155,12,'0','上午',10,'预约'),(156,12,'0','下午',0,'停诊'),(157,12,'1','上午',10,'预约'),(158,12,'1','下午',0,'停诊'),(159,12,'2','上午',10,'预约'),(160,12,'2','下午',0,'停诊'),(161,12,'3','上午',10,'预约'),(162,12,'3','下午',0,'停诊'),(163,12,'4','上午',10,'预约'),(164,12,'4','下午',0,'停诊'),(165,12,'5','上午',10,'预约'),(166,12,'5','下午',0,'停诊'),(167,12,'6','上午',10,'预约'),(168,12,'6','下午',0,'停诊'),(169,13,'0','上午',10,'预约'),(170,13,'0','下午',0,'停诊'),(171,13,'1','上午',10,'预约'),(172,13,'1','下午',0,'停诊'),(173,13,'2','上午',10,'预约'),(174,13,'2','下午',0,'停诊'),(175,13,'3','上午',10,'预约'),(176,13,'3','下午',0,'停诊'),(177,13,'4','上午',10,'预约'),(178,13,'4','下午',0,'停诊'),(179,13,'5','上午',10,'预约'),(180,13,'5','下午',0,'停诊'),(181,13,'6','上午',10,'预约'),(182,13,'6','下午',0,'停诊'),(183,14,'0','上午',10,'预约'),(184,14,'0','下午',0,'停诊'),(185,14,'1','上午',10,'预约'),(186,14,'1','下午',0,'停诊'),(187,14,'2','上午',10,'预约'),(188,14,'2','下午',0,'停诊'),(189,14,'3','上午',10,'预约'),(190,14,'3','下午',0,'停诊'),(191,14,'4','上午',10,'预约'),(192,14,'4','下午',0,'停诊'),(193,14,'5','上午',10,'预约'),(194,14,'5','下午',0,'停诊'),(195,14,'6','上午',10,'预约'),(196,14,'6','下午',0,'停诊'),(197,15,'0','上午',10,'预约'),(198,15,'0','下午',0,'停诊'),(199,15,'1','上午',10,'预约'),(200,15,'1','下午',0,'停诊'),(201,15,'2','上午',10,'预约'),(202,15,'2','下午',0,'停诊'),(203,15,'3','上午',10,'预约'),(204,15,'3','下午',0,'停诊'),(205,15,'4','上午',10,'预约'),(206,15,'4','下午',0,'停诊'),(207,15,'5','上午',10,'预约'),(208,15,'5','下午',0,'停诊'),(209,15,'6','上午',10,'预约'),(210,15,'6','下午',0,'停诊'),(211,16,'0','上午',10,'预约'),(212,16,'0','下午',0,'停诊'),(213,16,'1','上午',10,'预约'),(214,16,'1','下午',0,'停诊'),(215,16,'2','上午',10,'预约'),(216,16,'2','下午',0,'停诊'),(217,16,'3','上午',10,'预约'),(218,16,'3','下午',0,'停诊'),(219,16,'4','上午',10,'预约'),(220,16,'4','下午',0,'停诊'),(221,16,'5','上午',10,'预约'),(222,16,'5','下午',0,'停诊'),(223,16,'6','上午',10,'预约'),(224,16,'6','下午',0,'停诊'),(225,17,'0','上午',10,'预约'),(226,17,'0','下午',0,'停诊'),(227,17,'1','上午',10,'预约'),(228,17,'1','下午',0,'停诊'),(229,17,'2','上午',10,'预约'),(230,17,'2','下午',0,'停诊'),(231,17,'3','上午',10,'预约'),(232,17,'3','下午',0,'停诊'),(233,17,'4','上午',10,'预约'),(234,17,'4','下午',0,'停诊'),(235,17,'5','上午',10,'预约'),(236,17,'5','下午',0,'停诊'),(237,17,'6','上午',10,'预约'),(238,17,'6','下午',0,'停诊'),(239,18,'0','上午',10,'预约'),(240,18,'0','下午',0,'停诊'),(241,18,'1','上午',10,'预约'),(242,18,'1','下午',0,'停诊'),(243,18,'2','上午',10,'预约'),(244,18,'2','下午',0,'停诊'),(245,18,'3','上午',10,'预约'),(246,18,'3','下午',0,'停诊'),(247,18,'4','上午',10,'预约'),(248,18,'4','下午',0,'停诊'),(249,18,'5','上午',10,'预约'),(250,18,'5','下午',0,'停诊'),(251,18,'6','上午',10,'预约'),(252,18,'6','下午',0,'停诊'),(253,19,'0','上午',10,'预约'),(254,19,'0','下午',0,'停诊'),(255,19,'1','上午',10,'预约'),(256,19,'1','下午',0,'停诊'),(257,19,'2','上午',10,'预约'),(258,19,'2','下午',0,'停诊'),(259,19,'3','上午',10,'预约'),(260,19,'3','下午',0,'停诊'),(261,19,'4','上午',10,'预约'),(262,19,'4','下午',0,'停诊'),(263,19,'5','上午',10,'预约'),(264,19,'5','下午',0,'停诊'),(265,19,'6','上午',10,'预约'),(266,19,'6','下午',0,'停诊'),(267,20,'0','上午',10,'预约'),(268,20,'0','下午',0,'停诊'),(269,20,'1','上午',10,'预约'),(270,20,'1','下午',0,'停诊'),(271,20,'2','上午',10,'预约'),(272,20,'2','下午',0,'停诊'),(273,20,'3','上午',10,'预约'),(274,20,'3','下午',0,'停诊'),(275,20,'4','上午',10,'预约'),(276,20,'4','下午',0,'停诊'),(277,20,'5','上午',10,'预约'),(278,20,'5','下午',0,'停诊'),(279,20,'6','上午',10,'预约'),(280,20,'6','下午',0,'停诊'),(281,21,'0','上午',10,'预约'),(282,21,'0','下午',0,'停诊'),(283,21,'1','上午',10,'预约'),(284,21,'1','下午',0,'停诊'),(285,21,'2','上午',10,'预约'),(286,21,'2','下午',0,'停诊'),(287,21,'3','上午',10,'预约'),(288,21,'3','下午',0,'停诊'),(289,21,'4','上午',10,'预约'),(290,21,'4','下午',0,'停诊'),(291,21,'5','上午',10,'预约'),(292,21,'5','下午',0,'停诊'),(293,21,'6','上午',10,'预约'),(294,21,'6','下午',0,'停诊'),(295,22,'0','上午',10,'预约'),(296,22,'0','下午',0,'停诊'),(297,22,'1','上午',10,'预约'),(298,22,'1','下午',0,'停诊'),(299,22,'2','上午',10,'预约'),(300,22,'2','下午',0,'停诊'),(301,22,'3','上午',10,'预约'),(302,22,'3','下午',0,'停诊'),(303,22,'4','上午',10,'预约'),(304,22,'4','下午',0,'停诊'),(305,22,'5','上午',10,'预约'),(306,22,'5','下午',0,'停诊'),(307,22,'6','上午',10,'预约'),(308,22,'6','下午',0,'停诊'),(309,23,'0','上午',10,'预约'),(310,23,'0','下午',0,'停诊'),(311,23,'1','上午',10,'预约'),(312,23,'1','下午',0,'停诊'),(313,23,'2','上午',10,'预约'),(314,23,'2','下午',0,'停诊'),(315,23,'3','上午',10,'预约'),(316,23,'3','下午',0,'停诊'),(317,23,'4','上午',10,'预约'),(318,23,'4','下午',0,'停诊'),(319,23,'5','上午',10,'预约'),(320,23,'5','下午',0,'停诊'),(321,23,'6','上午',10,'预约'),(322,23,'6','下午',0,'停诊'),(323,24,'0','上午',10,'预约'),(324,24,'0','下午',0,'停诊'),(325,24,'1','上午',10,'预约'),(326,24,'1','下午',0,'停诊'),(327,24,'2','上午',10,'预约'),(328,24,'2','下午',0,'停诊'),(329,24,'3','上午',10,'预约'),(330,24,'3','下午',0,'停诊'),(331,24,'4','上午',10,'预约'),(332,24,'4','下午',0,'停诊'),(333,24,'5','上午',10,'预约'),(334,24,'5','下午',0,'停诊'),(335,24,'6','上午',10,'预约'),(336,24,'6','下午',0,'停诊'),(337,25,'0','上午',10,'预约'),(338,25,'0','下午',0,'停诊'),(339,25,'1','上午',10,'预约'),(340,25,'1','下午',0,'停诊'),(341,25,'2','上午',10,'预约'),(342,25,'2','下午',0,'停诊'),(343,25,'3','上午',0,'停诊'),(344,25,'3','下午',0,'停诊'),(345,25,'4','上午',10,'预约'),(346,25,'4','下午',11,'预约'),(347,25,'5','上午',10,'预约'),(348,25,'5','下午',0,'停诊'),(349,25,'6','上午',10,'预约'),(350,25,'6','下午',0,'停诊');
/*!40000 ALTER TABLE `workday` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-18 14:31:27
