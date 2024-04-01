-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: db5
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addictive`
--

DROP TABLE IF EXISTS `addictive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addictive` (
  `addictiveId` int NOT NULL AUTO_INCREMENT,
  `smoking` enum('สูบ','ไม่สูบ','เคยสูบ') NOT NULL,
  `smokingPeriod` int DEFAULT NULL,
  `cigaretteNumber` int DEFAULT NULL,
  `cigaretteButt` enum('มีก้นกรอง','ไม่มีก้นกรอง') DEFAULT NULL,
  `alcohol` enum('ไม่ดื่ม','ดื่ม') NOT NULL,
  `typeAlcohol` varchar(255) DEFAULT NULL,
  `alcoholGlass` int DEFAULT NULL,
  `nut` enum('ไม่เคย','เคย') NOT NULL,
  `nutPeriod` int DEFAULT NULL,
  `alcoholPeriod` int DEFAULT NULL,
  `HN` varchar(6) NOT NULL,
  PRIMARY KEY (`addictiveId`),
  KEY `fk_addictive_patient1_idx` (`HN`),
  CONSTRAINT `fk_addictive_patient1` FOREIGN KEY (`HN`) REFERENCES `patient` (`HN`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addictive`
--

LOCK TABLES `addictive` WRITE;
/*!40000 ALTER TABLE `addictive` DISABLE KEYS */;
INSERT INTO `addictive` VALUES (1,'สูบ',1,1,'มีก้นกรอง','ดื่ม','qwer',1,'เคย',1,1,'000001'),(2,'ไม่สูบ',NULL,NULL,NULL,'ไม่ดื่ม',NULL,NULL,'เคย',3,NULL,'000002'),(3,'ไม่สูบ',NULL,NULL,NULL,'ไม่ดื่ม',NULL,NULL,'ไม่เคย',NULL,NULL,'000003'),(4,'ไม่สูบ',NULL,NULL,NULL,'ไม่ดื่ม',NULL,NULL,'ไม่เคย',NULL,NULL,'000004'),(5,'ไม่สูบ',NULL,NULL,NULL,'ไม่ดื่ม',NULL,NULL,'ไม่เคย',NULL,NULL,'000005');
/*!40000 ALTER TABLE `addictive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `allergy`
--

DROP TABLE IF EXISTS `allergy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allergy` (
  `allergyId` int NOT NULL AUTO_INCREMENT,
  `allergyDetail` longtext NOT NULL,
  `HN` varchar(6) NOT NULL,
  PRIMARY KEY (`allergyId`),
  KEY `fk_allergy_patient1_idx` (`HN`),
  CONSTRAINT `fk_allergy_patient1` FOREIGN KEY (`HN`) REFERENCES `patient` (`HN`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allergy`
--

LOCK TABLES `allergy` WRITE;
/*!40000 ALTER TABLE `allergy` DISABLE KEYS */;
INSERT INTO `allergy` VALUES (1,'กุ้ง ยาบูโรเฟน','000001'),(2,'testest','000002');
/*!40000 ALTER TABLE `allergy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `appointId` int NOT NULL AUTO_INCREMENT,
  `appointDate` datetime NOT NULL,
  `appoint_no` int NOT NULL,
  `note` longtext,
  `medGiver` varchar(255) DEFAULT NULL,
  `HN` varchar(6) NOT NULL,
  `treatmentId` int NOT NULL,
  PRIMARY KEY (`appointId`),
  KEY `fk_appointment_patient1_idx` (`HN`),
  CONSTRAINT `fk_appointment_patient1` FOREIGN KEY (`HN`) REFERENCES `patient` (`HN`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (1,'2024-04-01 09:00:00',1,NULL,'นักคมี1 สกุลเคมี1','000001',1),(2,'2024-04-08 09:00:00',2,NULL,'นักเคมี4 สกุลเคมี4','000001',1),(3,'2024-04-15 09:00:00',3,NULL,'นักคมี1 สกุลเคมี1','000001',1),(4,'2024-04-22 09:00:00',4,'test','นักเคมี3 สกุลเคมี3','000001',1),(5,'2024-04-29 09:00:00',5,NULL,'นักคมี1 สกุลเคมี1','000001',1),(6,'2024-05-06 09:00:00',6,NULL,'นักคมี1 สกุลเคมี1','000001',1),(7,'2024-04-03 10:00:00',1,NULL,'นักคมี1 สกุลเคมี1','000002',2),(8,'2024-04-10 10:00:00',2,NULL,'นักเคมี2 สกุลเคมี2','000002',2),(9,'2024-03-26 10:00:00',3,NULL,NULL,'000002',2),(10,'2024-03-10 10:00:00',1,NULL,NULL,'000001',5),(11,'2024-03-04 15:30:00',1,NULL,'นักคมี1 สกุลเคมี1','000003',3),(12,'2024-04-11 13:00:00',2,NULL,'นักเคมี4 สกุลเคมี4','000003',3);
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bloodresult`
--

DROP TABLE IF EXISTS `bloodresult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bloodresult` (
  `brId` int NOT NULL AUTO_INCREMENT,
  `picture` longtext,
  `date` timestamp NULL DEFAULT NULL,
  `suggestion` longtext,
  `status` enum('ยังไม่ส่งผลเลือด','รออนุมัติผลเลือด','อนุมัติผลเลือด','ส่งผลเลือดอีกครั้ง') NOT NULL,
  `doctorId` int NOT NULL,
  `treatmentId` int NOT NULL,
  PRIMARY KEY (`brId`),
  KEY `fk_bloodresult_doctor1_idx` (`doctorId`),
  KEY `fk_bloodresult_treatment2_idx` (`treatmentId`),
  CONSTRAINT `fk_bloodresult_doctor1` FOREIGN KEY (`doctorId`) REFERENCES `doctor` (`doctorId`),
  CONSTRAINT `fk_bloodresult_treatment2` FOREIGN KEY (`treatmentId`) REFERENCES `treatment` (`treatmentId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bloodresult`
--

LOCK TABLES `bloodresult` WRITE;
/*!40000 ALTER TABLE `bloodresult` DISABLE KEYS */;
INSERT INTO `bloodresult` VALUES (1,'images/1711720273693_.png','2024-03-29 13:51:37','ส่งรูปผิด','ส่งผลเลือดอีกครั้ง',19,1),(2,'images/1711792906868_.png','2024-03-30 10:02:08','test','อนุมัติผลเลือด',21,2),(3,'images/1711906698528_.jpg','2024-03-31 17:39:31',NULL,'อนุมัติผลเลือด',21,3),(10,'images/1711720797506_.png','2024-03-30 04:55:35',NULL,'ส่งผลเลือดอีกครั้ง',19,1),(11,'images/1711774964467_.png','2024-03-30 05:03:30','นัดหมายคนไข้ได้','อนุมัติผลเลือด',19,1),(13,'images/1711866135597_.jpg','2024-03-31 15:24:11',NULL,'อนุมัติผลเลือด',18,5);
/*!40000 ALTER TABLE `bloodresult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `commentId` int NOT NULL AUTO_INCREMENT,
  `note` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `doctorId` int NOT NULL,
  `brId` int NOT NULL,
  PRIMARY KEY (`commentId`),
  KEY `fk_comment_doctor1_idx` (`doctorId`),
  KEY `fk_comment_bloodresult1_idx` (`brId`),
  CONSTRAINT `fk_comment_bloodresult1` FOREIGN KEY (`brId`) REFERENCES `bloodresult` (`brId`) ON UPDATE CASCADE,
  CONSTRAINT `fk_comment_doctor1` FOREIGN KEY (`doctorId`) REFERENCES `doctor` (`doctorId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diseases`
--

DROP TABLE IF EXISTS `diseases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diseases` (
  `diseasesId` int NOT NULL AUTO_INCREMENT,
  `disease` longtext,
  `usualMed` longtext,
  `otherTreatment` longtext,
  `HN` varchar(6) NOT NULL,
  PRIMARY KEY (`diseasesId`),
  KEY `fk_diseases_patient1_idx` (`HN`),
  CONSTRAINT `fk_diseases_patient1` FOREIGN KEY (`HN`) REFERENCES `patient` (`HN`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diseases`
--

LOCK TABLES `diseases` WRITE;
/*!40000 ALTER TABLE `diseases` DISABLE KEYS */;
INSERT INTO `diseases` VALUES (2,'เบาหวาน ความดัน','test',NULL,'000001'),(3,'หัวใจ ตับ','testtest1234',NULL,'000002'),(4,'','',NULL,'000003'),(5,'','',NULL,'000004'),(6,'','',NULL,'000005');
/*!40000 ALTER TABLE `diseases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `doctorId` int NOT NULL,
  PRIMARY KEY (`doctorId`),
  CONSTRAINT `fk_doctor_user` FOREIGN KEY (`doctorId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (18),(19),(20),(21),(22),(23),(24),(25),(26),(27);
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `feedbackId` int NOT NULL AUTO_INCREMENT,
  `patientSideEffect` longtext,
  `sideEfflevel` varchar(255) DEFAULT NULL,
  `appointId` int NOT NULL,
  `sendAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`feedbackId`),
  KEY `fk_feedback_appointment2_idx` (`appointId`),
  CONSTRAINT `fk_feedback_appointment2` FOREIGN KEY (`appointId`) REFERENCES `appointment` (`appointId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,NULL,'3',1,NULL),(2,NULL,'2',2,NULL),(3,NULL,NULL,3,NULL),(4,NULL,NULL,4,NULL),(5,NULL,NULL,5,NULL),(6,'ผมร่วง / บางลง อ่อนเพลีย / ครั่นเนื้อครั่นตัว ',NULL,6,NULL),(7,'ผิวหนังสีเข้มขึ้น ใจสั่น / หอบเหนื่อยง่าย ','1',7,'2024-03-31 16:20:21'),(8,NULL,NULL,8,NULL),(9,NULL,NULL,9,NULL),(10,NULL,NULL,10,NULL),(11,'ผิวหนังสีเข้มขึ้น ใจสั่น / หอบเหนื่อยง่าย ','1',11,'2024-03-31 18:01:51'),(12,'กดการทำงานของไขกระดูก หรือภูมิต้านทานต่ำ เยื่อบุปากอักเสบ เกิดแผลร้อนในในปาก ',NULL,12,'2024-03-31 18:05:26');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formula`
--

DROP TABLE IF EXISTS `formula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formula` (
  `formulaId` int NOT NULL AUTO_INCREMENT,
  `formulaName` varchar(255) NOT NULL,
  `numberOfRound` int NOT NULL,
  `period` int NOT NULL,
  PRIMARY KEY (`formulaId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formula`
--

LOCK TABLES `formula` WRITE;
/*!40000 ALTER TABLE `formula` DISABLE KEYS */;
INSERT INTO `formula` VALUES (1,'AC',6,7),(2,'FAC',6,7),(3,'Cis CCRT Cervix',6,7),(4,'Carbo CCRT Cervix',6,7),(5,'5FU-Leucovorin',6,7),(6,'Pac-Carbo',6,7);
/*!40000 ALTER TABLE `formula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formula_medicine`
--

DROP TABLE IF EXISTS `formula_medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formula_medicine` (
  `medId` int NOT NULL,
  `formulaId` int NOT NULL,
  PRIMARY KEY (`medId`,`formulaId`),
  KEY `fk_medicine_has_formula_formula1_idx` (`formulaId`),
  KEY `fk_medicine_has_formula_medicine1_idx` (`medId`),
  CONSTRAINT `fk_medicine_has_formula_formula1` FOREIGN KEY (`formulaId`) REFERENCES `formula` (`formulaId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_medicine_has_formula_medicine1` FOREIGN KEY (`medId`) REFERENCES `medicine` (`medId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formula_medicine`
--

LOCK TABLES `formula_medicine` WRITE;
/*!40000 ALTER TABLE `formula_medicine` DISABLE KEYS */;
INSERT INTO `formula_medicine` VALUES (1,1),(2,1),(1,2),(2,2),(3,2),(4,3),(5,4),(3,5),(6,5),(5,6),(7,6);
/*!40000 ALTER TABLE `formula_medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `givemed`
--

DROP TABLE IF EXISTS `givemed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `givemed` (
  `giveMedId` int NOT NULL AUTO_INCREMENT,
  `medType` enum('รับประทาน','ฉีดเข้าเส้นเลือด') NOT NULL,
  `unit` float NOT NULL,
  `tablet` int DEFAULT NULL,
  `medId` int NOT NULL,
  `formulaId` int NOT NULL,
  `treatmentId` int NOT NULL,
  PRIMARY KEY (`giveMedId`),
  KEY `fk_giveMed_formula_medicine1_idx` (`medId`,`formulaId`),
  KEY `fk_giveMed_treatment1_idx` (`treatmentId`),
  CONSTRAINT `fk_giveMed_formula_medicine1` FOREIGN KEY (`medId`, `formulaId`) REFERENCES `formula_medicine` (`medId`, `formulaId`),
  CONSTRAINT `fk_giveMed_treatment1` FOREIGN KEY (`treatmentId`) REFERENCES `treatment` (`treatmentId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `givemed`
--

LOCK TABLES `givemed` WRITE;
/*!40000 ALTER TABLE `givemed` DISABLE KEYS */;
INSERT INTO `givemed` VALUES (1,'ฉีดเข้าเส้นเลือด',100,NULL,1,2,1),(2,'ฉีดเข้าเส้นเลือด',100,NULL,2,2,1),(3,'ฉีดเข้าเส้นเลือด',100,NULL,3,2,1),(4,'ฉีดเข้าเส้นเลือด',100,NULL,1,2,2),(5,'ฉีดเข้าเส้นเลือด',200,NULL,2,2,2),(6,'ฉีดเข้าเส้นเลือด',300,NULL,3,2,2),(7,'ฉีดเข้าเส้นเลือด',100,NULL,3,5,5),(8,'ฉีดเข้าเส้นเลือด',100,NULL,6,5,5),(9,'ฉีดเข้าเส้นเลือด',300,NULL,4,3,3);
/*!40000 ALTER TABLE `givemed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guidebook`
--

DROP TABLE IF EXISTS `guidebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guidebook` (
  `guidebookId` int NOT NULL AUTO_INCREMENT,
  `formulaId` int NOT NULL,
  `pdf` longtext,
  `QRcode` longtext,
  PRIMARY KEY (`guidebookId`),
  KEY `fk_guidebook_formula1_idx` (`formulaId`),
  CONSTRAINT `fk_guidebook_formula1` FOREIGN KEY (`formulaId`) REFERENCES `formula` (`formulaId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guidebook`
--

LOCK TABLES `guidebook` WRITE;
/*!40000 ALTER TABLE `guidebook` DISABLE KEYS */;
INSERT INTO `guidebook` VALUES (1,1,'images/1711718164840_.pdf','images/1711718011731_.jpg'),(2,2,'images/1711718331808_.pdf','images/1711718265079_.jpg'),(3,3,NULL,'images/1711718314002_.jpg'),(4,4,NULL,NULL),(5,5,'images/1711893073698_.pdf','images/1711893054671_.jpg'),(6,6,NULL,'images/1711862082767_.jpg');
/*!40000 ALTER TABLE `guidebook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `history` (
  `historyId` int NOT NULL AUTO_INCREMENT,
  `HN` varchar(6) NOT NULL,
  `fatherName` varchar(255) DEFAULT NULL,
  `motherName` varchar(255) DEFAULT NULL,
  `contactPerson` varchar(255) NOT NULL,
  `spouseName` varchar(255) DEFAULT NULL,
  `relatedAs` varchar(255) NOT NULL,
  `IDcardAddress` longtext NOT NULL,
  `currentAddress` longtext NOT NULL,
  `contactAddress` longtext NOT NULL,
  `nationality` varchar(255) NOT NULL,
  `occupation` varchar(255) NOT NULL,
  `education` varchar(255) NOT NULL,
  `marriageStatus` varchar(255) NOT NULL,
  `bloodGroup` varchar(255) NOT NULL,
  `religious` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`historyId`),
  KEY `fk_history_patient2_idx` (`HN`),
  CONSTRAINT `fk_history_patient2` FOREIGN KEY (`HN`) REFERENCES `patient` (`HN`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` VALUES (1,'000001','','','ชื่อญาติ','','น้องชาย','บ้านเลขที่ xxxx หมู่ xx ซอย xx ถนน xxx ตำบล/แขวง xxx อำเภอ/เขต xx จังหวัด กรุงเทพมหานคร โทร. -','บ้านเลขที่ xxx หมู่ x ซอย x ถนน x ตำบล/แขวง x อำเภอ/เขต x จังหวัด ฉะเชิงเทรา โทร. -','บ้านเลขที่ xxx หมู่ xx ซอย xxx ถนน xxx ตำบล/แขวง xx อำเภอ/เขต xx จังหวัด ฉะเชิงเทรา โทร. -','ไทย','รับราชการ','ปริญญาเอก','หย่าร้าง','B (บี)','คริสต์'),(2,'000002','','','ชื่อญาติ','','พี่น้อง','บ้านเลขที่ xxx หมู่ xx ซอย xx ถนน xxx ตำบล/แขวง xxx อำเภอ/เขต xxx จังหวัด ตาก โทร. -','บ้านเลขที่ xxx หมู่ xxx ซอย xxx ถนน xx ตำบล/แขวง xx อำเภอ/เขต xx จังหวัด ตรัง โทร. -','บ้านเลขที่ xxx หมู่ x ซอย xx ถนน xx ตำบล/แขวง xxx อำเภอ/เขต xxx จังหวัด ตาก โทร. -','ไทย','รับจ้าง','ปวช.','โสด','B (บี)','พุทธ'),(3,'000003','','','ชื่อญาติ','','ญาติ','บ้านเลขที่ xxx หมู่ xxx ซอย xxx ถนน xxx ตำบล/แขวง xxx อำเภอ/เขต xxx จังหวัด กำแพงเพชร โทร. -','บ้านเลขที่ xxx หมู่ xxx ซอย xxx ถนน xxx ตำบล/แขวง xx อำเภอ/เขต xxx จังหวัด กรุงเทพมหานคร โทร. xxx','บ้านเลขที่ xxx หมู่ xx ซอย xx ถนน xx ตำบล/แขวง xx อำเภอ/เขต xx จังหวัด กรุงเทพมหานคร โทร. -','ไทย','ธุรกิจส่วนตัว','ปริญญาโท','หย่าร้าง','B (บี)','อิสลาม'),(4,'000004','','','ชื่อญาติ','','ญาติ','บ้านเลขที่ xxxx หมู่ xx ซอย xx ถนน xxx ตำบล/แขวง xxxx อำเภอ/เขต xxx จังหวัด กรุงเทพมหานคร โทร. -','บ้านเลขที่ cxxxxx หมู่ xxx ซอย xxx ถนน xx ตำบล/แขวง xxx อำเภอ/เขต xx จังหวัด กรุงเทพมหานคร โทร. -','บ้านเลขที่ xxxx หมู่ xxx ซอย xxx ถนน xx ตำบล/แขวง xx อำเภอ/เขต xxx จังหวัด กรุงเทพมหานคร โทร. -','ไทย','ธุรกิจส่วนตัว','ปริญญาเอก','โสด','A (เอ)','พราหมณ์-ฮินดู'),(5,'000005','','','ชื่อคู่สมรส','ชื่อคู่สมรส','สามี','บ้านเลขที่ xxx หมู่ xxx ซอย xx ถนน xx ตำบล/แขวง xx อำเภอ/เขต xx จังหวัด กรุงเทพมหานคร โทร. -','บ้านเลขที่ xxx หมู่ xxx ซอย xxx ถนน xxx ตำบล/แขวง xxx อำเภอ/เขต xxxx จังหวัด กรุงเทพมหานคร โทร. -','บ้านเลขที่ xxx หมู่ xx ซอย xxx ถนน xx ตำบล/แขวง xxx อำเภอ/เขต xxx จังหวัด กรุงเทพมหานคร โทร. -','ไทย','รับจ้าง','ปริญญาตรี','สมรส','O (โอ)','พุทธ');
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicine`
--

DROP TABLE IF EXISTS `medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicine` (
  `medId` int NOT NULL AUTO_INCREMENT,
  `medName` varchar(255) NOT NULL,
  PRIMARY KEY (`medId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine`
--

LOCK TABLES `medicine` WRITE;
/*!40000 ALTER TABLE `medicine` DISABLE KEYS */;
INSERT INTO `medicine` VALUES (1,'Adriamycin'),(2,'Cyclophosphamine'),(3,'Fluorouracil'),(4,'Cisplatin'),(5,'Carboplatin'),(6,'Leucovorin'),(7,'Paciltaxel');
/*!40000 ALTER TABLE `medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `note`
--

DROP TABLE IF EXISTS `note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `note` (
  `noteId` int NOT NULL AUTO_INCREMENT,
  `sideEffLevel` int NOT NULL,
  `note` longtext NOT NULL,
  `feedbackId` int NOT NULL,
  PRIMARY KEY (`noteId`),
  KEY `fk_note_feedback1_idx` (`feedbackId`),
  CONSTRAINT `fk_note_feedback1` FOREIGN KEY (`feedbackId`) REFERENCES `feedback` (`feedbackId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `note`
--

LOCK TABLES `note` WRITE;
/*!40000 ALTER TABLE `note` DISABLE KEYS */;
/*!40000 ALTER TABLE `note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `notiId` int NOT NULL AUTO_INCREMENT,
  `notify` varchar(255) NOT NULL,
  `createAt` timestamp NOT NULL,
  `notiStatus` enum('อ่านแล้ว','ยังไม่อ่าน') NOT NULL,
  `userId` int NOT NULL,
  PRIMARY KEY (`notiId`),
  KEY `fk_notification_user1_idx` (`userId`),
  CONSTRAINT `fk_notification_user1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `HN` varchar(6) NOT NULL,
  `prefix` varchar(255) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `birthDate` date NOT NULL,
  `phoneNumber` varchar(10) NOT NULL,
  `IDcard` varchar(13) NOT NULL,
  `gender` enum('ชาย','หญิง') NOT NULL,
  `doctorId` int DEFAULT NULL,
  `allergy` enum('ไม่เคยแพ้','แพ้') NOT NULL,
  PRIMARY KEY (`HN`),
  KEY `fk_patient_doctor2_idx` (`doctorId`),
  CONSTRAINT `fk_patient_doctor2` FOREIGN KEY (`doctorId`) REFERENCES `doctor` (`doctorId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES ('000001','นาย','ชื่อสมมติ1','นามสกุลสมมติ','1967-04-16','xxxxxxxxxx','0000000000001','ชาย',22,'แพ้'),('000002','นาย','ชื่อสมมติ2','นามสกุลสมมติ2','1978-11-16','xxxxxxxxxx','0000000000002','ชาย',21,'แพ้'),('000003','นางสาว','ชื่อสมมติ3','นามสกุลสมมติ3','1979-05-18','xxxxxxxxx','0000000000003','หญิง',21,'ไม่เคยแพ้'),('000004','นางสาว','ชื่อสมมติ4','นามสกุลสมมติ4','2005-07-19','xxxxxxxxxx','0000000000004','หญิง',NULL,'ไม่เคยแพ้'),('000005','นาง','ชื่อสมมติ5','นามสกุลสมมติ5','1990-10-30','xxxxxxxxxx','0000000000005','หญิง',NULL,'ไม่เคยแพ้');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientnoti`
--

DROP TABLE IF EXISTS `patientnoti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patientnoti` (
  `patientNotiId` int NOT NULL AUTO_INCREMENT,
  `createAt` timestamp NOT NULL,
  `alertSideEffect` date DEFAULT NULL,
  `alertBlood` varchar(255) DEFAULT NULL,
  `HN` varchar(6) NOT NULL,
  `appointId` int DEFAULT NULL,
  PRIMARY KEY (`patientNotiId`),
  KEY `fk_patientNoti_patient1_idx` (`HN`),
  CONSTRAINT `fk_patientNoti_patient1` FOREIGN KEY (`HN`) REFERENCES `patient` (`HN`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientnoti`
--

LOCK TABLES `patientnoti` WRITE;
/*!40000 ALTER TABLE `patientnoti` DISABLE KEYS */;
/*!40000 ALTER TABLE `patientnoti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `request` (
  `requestId` int NOT NULL AUTO_INCREMENT,
  `newAppointDate` datetime NOT NULL,
  `reason` longtext NOT NULL,
  `requestPhone` varchar(10) NOT NULL,
  `requestStatus` enum('เลื่อนนัดหมายสำเร็จ','รอดำเนินการเลื่อนนัดหมาย','ไม่สามารถเลื่อนนัดหมายได้') NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `appointId` int NOT NULL,
  `requestStamp` timestamp NOT NULL,
  PRIMARY KEY (`requestId`),
  KEY `fk_request_appointment1_idx` (`appointId`),
  CONSTRAINT `fk_request_appointment1` FOREIGN KEY (`appointId`) REFERENCES `appointment` (`appointId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
INSERT INTO `request` VALUES (1,'2024-04-24 10:00:00','ไม่สะดวกไปรับยาที่โรงพยาบาล เนื่องจากติดธุระ','xxxxxxxxxx','เลื่อนนัดหมายสำเร็จ',NULL,9,'2024-03-31 05:12:42'),(2,'2024-03-10 10:00:00','dfghj','0000000000','เลื่อนนัดหมายสำเร็จ',NULL,10,'2024-03-31 15:43:58'),(3,'2024-03-12 10:00:00','hjklfdxcvbn','0000000000','เลื่อนนัดหมายสำเร็จ','zscvcbn',10,'2024-03-31 15:50:25'),(4,'2024-03-26 10:00:00','dfghjkl','0000000000','เลื่อนนัดหมายสำเร็จ','sdfghjk',9,'2024-03-31 16:16:40'),(5,'2024-03-04 15:30:00','drfghjkl','0000000000','เลื่อนนัดหมายสำเร็จ','dfggygjg',11,'2024-03-31 17:49:29'),(6,'2024-03-05 15:30:00','grghthyjyukuikuilil','0000000000','ไม่สามารถเลื่อนนัดหมายได้','fghjkl;o',11,'2024-03-31 17:58:14');
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treatment`
--

DROP TABLE IF EXISTS `treatment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treatment` (
  `treatmentId` int NOT NULL AUTO_INCREMENT,
  `cancerType` varchar(255) NOT NULL,
  `cancerState` varchar(255) NOT NULL,
  `HN` varchar(6) NOT NULL,
  `formulaId` int NOT NULL,
  `treatmentStatus` enum('อยู่ระหว่างการรักษา','สิ้นสุดแผนการรักษา') NOT NULL,
  `doctorId` int NOT NULL,
  PRIMARY KEY (`treatmentId`),
  KEY `fk_treatment_patient2_idx` (`HN`),
  KEY `fk_treatment_formula2_idx` (`formulaId`),
  CONSTRAINT `fk_treatment_formula2` FOREIGN KEY (`formulaId`) REFERENCES `formula` (`formulaId`) ON UPDATE CASCADE,
  CONSTRAINT `fk_treatment_patient2` FOREIGN KEY (`HN`) REFERENCES `patient` (`HN`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatment`
--

LOCK TABLES `treatment` WRITE;
/*!40000 ALTER TABLE `treatment` DISABLE KEYS */;
INSERT INTO `treatment` VALUES (1,'มะเร็งปอด','2','000001',2,'สิ้นสุดแผนการรักษา',19),(2,'มะเร็งตับ','2','000002',2,'อยู่ระหว่างการรักษา',21),(3,'มะเร็งลำไส้ใหญ่','3','000003',3,'อยู่ระหว่างการรักษา',21),(5,'มะเร็งปอด','2','000001',5,'อยู่ระหว่างการรักษา',18);
/*!40000 ALTER TABLE `treatment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) NOT NULL,
  `psw` varchar(255) DEFAULT NULL,
  `type` enum('doctor','nurse','chemist','patient') NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `userName_UNIQUE` (`userName`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'0000000000001','555555','patient','ชื่อสมมติ1','นามสกุลสมมติ'),(4,'0000000000002','123123','patient','ชื่อสมมติ2','นามสกุลสมมติ2'),(6,'0000000000003','456456','patient','ชื่อสมมติ3','นามสกุลสมมติ3'),(7,'0000000000004',NULL,'patient','ชื่อสมมติ4','นามสกุลสมมติ4'),(10,'0000000000005',NULL,'patient','ชื่อสมมติ5','นามสกุลสมมติ5'),(11,'chemist','$2b$10$OrGSe3bl74MF1H8Jnj77MukwsoinEyKaOSGMvol6h5XyngGy0Ri2m','chemist','นักคมี1','สกุลเคมี1'),(12,'chemist2','$2b$10$ZlB3CXWkrspszKzb9OkXPej3kNJgEpBdMOGiAGJ6.TpIujFvDCx/6','chemist','นักเคมี2','สกุลเคมี2'),(13,'chemist3','$2b$10$rBTqxkCPQRx.cXBgtU3jRuL7rkqVkRGiVKIjkmqR4RGxaqCywPTU.','chemist','นักเคมี3','สกุลเคมี3'),(14,'chemist4','$2b$10$sw1bdJNAqHKZZFTCX3SFjepQvxnrXFcOT88kkLqZXGTvY9YxYvSUy','chemist','นักเคมี4','สกุลเคมี4'),(15,'chemist5','$2b$10$.3sbQI20SptWcBhZBNOiNePwSdybudBHgUc/5piXjDKV9aRRZu7RG','chemist','นักเคมี5','สกุลเคมี5'),(16,'nurse1','$2b$10$syEcTrESr0wJfijI2m06uetJjgY/fnPRfr/q4ph3HP6GRUxJ6XZDS','nurse','พยาบาล1','สกุลพยาบาล1'),(17,'nurse2','$2b$10$qBAaUcFR5ZgWXezI5YSm5eu64sQqt.RNvrex1W6JNs1V2854ckIX.','nurse','พยาบาล2','สกุลพยาบาล2'),(18,'doctor1','$2b$10$lM4/uWpVDhc9rK47ytBdu.hf8ihhGAnlnN7D5SizpVKsqCoEq/QNy','doctor','แพทย์หนึ่ง','สกุลแพทย์หนึ่ง'),(19,'doctor2','$2b$10$0bJtqRYStzXZn5AZoca3beaAMxC/zpluEf11fz88Z5S3BaBGyK4am','doctor','แพทย์สอง','สกุลแพทย์สอง'),(20,'doctor3','$2b$10$TDmMT1qvZwYD1WDmP9OQHeCJmZDLbJU584Bc7jx7BWFBUcR/oGiXi','doctor','แพทย์สาม','สกุลแพทย์สาม'),(21,'doctor4','$2b$10$00PzGFwFwXKc5RguUnyIde0y0vTknmHWryvLHMkCEPFfYTRkgselK','doctor','แพทย์สี่','สกุลแพทย์สี่'),(22,'doctor5','$2b$10$M92tB81mOuBZKG051GDnAuKDxy2VFY6V9QpwGmkfOEmlQaZuHllAK','doctor','แพทย์ห้า','สกุลแพทย์ห้า'),(23,'doctor6','$2b$10$hWMHqN9xhUUtMzgkjB1KjuV1BTM9horqfy/LhX3a8Dze8hIoH9Qim','doctor','แพทย์หก','สกุลแพทย์หก'),(24,'doctor7','$2b$10$nlRHP5mPZDFPJ.BggfbKSenl/BKuvSlK3zE4QiuPZh37mudfLWwFO','doctor','แพทย์เจ็ด','สกุลแพทย์เจ็ด'),(25,'doctor8','$2b$10$d./jbR5uaf44BO9tuekl5uPMEoxK3Y/qGz7zsQB6bOKuzPBCH724i','doctor','แพทย์แปด','สกุลแพทย์แปด'),(26,'doctor9','$2b$10$TcTXg0Ds1T2I7bYOJJY/zu26438VYQYpCt9YIJ3.uAsuAlUlPiRSG','doctor','แพทย์เก้า','สกุลแพทย์เก้า'),(27,'doctor10','$2b$10$qWh.WxxLTbC4F3AXA9uEqe2wY2URdcwVxU2u/Ga3RKLrZreqOEdc.','doctor','แพทย์สิบ','สกุลแพทย์สิบ'),(28,'chemist6','$2b$10$EsD8wkAM78Kl07Te/WhkS.teBYl7RoZDyqps2dhALXpt5kmZhAuYi','chemist','นักเคมี6','สกุลเคมี6');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-01 11:04:19
