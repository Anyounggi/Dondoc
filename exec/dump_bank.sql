-- MySQL dump 10.13  Distrib 8.0.34, for Linux (x86_64)
--
-- Host: localhost    Database: dondoc_bank_test
-- ------------------------------------------------------
-- Server version	8.0.34-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `account_name` varchar(20) NOT NULL,
  `account_number` varchar(50) NOT NULL,
  `balance` int NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(32) NOT NULL,
  `status` bit(1) NOT NULL,
  `wrong_count` int NOT NULL,
  `bank_code_id` bigint DEFAULT NULL,
  `owner_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1npgygv51ule3mx5dty97wcu3` (`bank_code_id`),
  KEY `FKc4c8kh7yojud2xjd1d6f6j61y` (`owner_id`),
  CONSTRAINT `FK1npgygv51ule3mx5dty97wcu3` FOREIGN KEY (`bank_code_id`) REFERENCES `bank_code` (`id`),
  CONSTRAINT `FKc4c8kh7yojud2xjd1d6f6j61y` FOREIGN KEY (`owner_id`) REFERENCES `owner` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'나라사랑국군장병통장','8694022788941',1410000,'7334f39daa61535bfdf324c1fc7c906b37258042d0f11d98dacb707937c66e39','be9924ab592e65ebbc352089e754a49e',_binary '',0,88,1),(2,'주택종합청약저축','9853232906767',1030000,'117d7f1148e569b978728929ada2b47704a12659c6ebd5a9b6e12adb1bbd7fc7','c4823abbb09226808945f711c5e37452',_binary '',0,88,1),(3,'청년도약적금','6959562638997',1000000,'92083591523c6c8630e9c18bceb6b91552f235db6585a8d4f95a76e568a221c9','991272c319431b686fefe90feb6e9aa2',_binary '',0,88,1),(4,'NH농협 생활비통장','4317744269177',1040000,'256913ebb9f74c53926bbf967d9bd2f23c154bd7991a7efb9c837c3a0f2bcc53','d53328503a20198d6e3693a14f28e69d',_binary '',0,11,3),(5,'KB국민 적금통장','0159992173834',1000000,'71fb36d00c9f83abd6d1dd566ba9531bdd8d61dfab3ce42696caa89f3df47020','150b1d911c2565feb35cd31d87e73f6d',_binary '',0,4,3),(6,'DGB대구 MZ통장','7098100904103',1000000,'08158d88c329a862079983ffbf2f1483225a14e350099ef7dece4fc3ee2adcab','880888bfd78eebc62636a734744be687',_binary '',0,31,3),(7,'Luca 가족','2039773068496',1000000,'6956c7da6cfdfe7a599e1df7e9b08a86a6ce720cba7c06b3a8faa0c0a1afd569','18d0b975ab64b27cc805bb3962a786d7',_binary '',0,108,4),(8,'D108 공용계좌','5548960834363',316877,'a9dbc2fe548a37aa711cd0d17db7ccd246fd425e57762af2bf41be353bc23ab2','2146e122557b8571597a25c692fd4f2e',_binary '',0,108,5),(9,'나라사랑카드','0124232008466',1550000,'7440cfe23b4c63ad3caf15c28ffec9a2d9aa7cbbe1c34ff5532f2b1d9de62b60','b9e35af92e0553f77b6b99e9074ce930',_binary '',0,3,6),(10,'하나은행 주거래 통장','1195397389690',1123123,'134035e1453b355af022426b3bd06e82892fce42539d3159bbc53d78bd72460f','25296d23e7d13c10bf935ceea796b9de',_binary '',0,81,7),(11,'KB국민ONE통장','6335111267307',1000000,'3537feecf6ca17c36ad4ee8a2cb6ec7a7378b2d6ee4b0bfe1af2ca509892e05f','92f4e9058e43b65eb622ad4768a9f131',_binary '',0,4,8),(12,'NH통장','7236048201172',1000000,'051b93cc115ff8036381b1d746ca0a73404bcaaa6611c9f21c26dd59233f5a2c','252974621f1b32631d9e48452b65d76e',_binary '',0,11,8),(13,'내일배움카드','0301057315232',950000,'734fedc11a47e5365301bce4363fcfbe1fd39a51956db482f16fe877b282d037','76ddba986b0a157340824b0e45c69f6f',_binary '',0,11,9),(14,'운동매일매일','5452886849634',990000,'a3f760c6c4262e5792ae89b09c137bc4ca612db68f75a4eeb72311bf6e3b163c','903a75e07ec9e7af7414d7bb3aece19e',_binary '',0,108,10),(15,'루카 가족','1724641821366',620000,'984ceff697b3da4619db18f7f082b7f3f30b48831bfb64a9c6d1ce7b85a82d85','f002bff0b0791928634107f059e76b7d',_binary '',0,108,11),(16,'우리모임','2186803338721',1000000,'62ce841dadce935fc98ca79b15a8ff19913c29120a818dc28086649fb5703932','3f1a8ddd5084278d49e777f8c9e9f584',_binary '',0,108,12),(17,'나라사랑카드','2057312297151',1000000,'703d7ea124bc260cc94fcba4207499ef03a396fe68d3a877396c66908ae2c385','7012b4e746264e1fc47b905d9391cce0',_binary '',0,3,9),(18,'싸피계좌','7832611041158',1000000,'b7fbf9bfcfb13635d858dbfd7a054540fbea1faf30e6dcfad496e6865b4154a1','6e08ba11d83ab3866de5f765eb48bc15',_binary '',0,88,9),(19,'내일배움카드','2433803876916',1030000,'a1e0e0969a9daa64976f6b8606e7240bd1f2f279ddcae0bd9713cf99d20c14db','35d7dfced6acde0e9969b1072022fcbd',_binary '',0,11,13),(20,'싸피계좌','8702603378487',1000000,'0283b3bcb5429b01c6c3b3bef88675747caec77a2b2691a4a63cccbeaa71ae45','07890e42469756b6c80b6698088d4256',_binary '',0,88,13),(21,'적금계좌','3929637492051',1320000,'48676b0b6882eb0a4b09b49e85c25258f96d20efc5269d718bcdf101f64c3021','704c6020b4c2ed0f355eb606e7aa3cfa',_binary '',0,20,14),(22,'카카오계좌','3120082658429',1000000,'9f1ff38fe601d72972b8fd305d1d35fbf41e814bbbb76076519f253e24e684e3','b1140e755e7e39a588c5fd5e8929ca8f',_binary '',0,90,14),(23,'우리모임','4170649277549',620000,'19d3bdc3fd273bf5a1049acf996f161a98985a3e1945abf4cd8f7321674476da','62fd82f2da531c1db64db50a128b2171',_binary '',0,108,15),(24,'우리 가족 계좌','4861493703070',1000000,'faa1e45218eac586607cfbf1fd92d2df49f8f8b9fc118ea158d1b2a99f9f082e','b73a0e8b938a1f8274f2c2c1ba0210de',_binary '',0,108,16);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_code`
--

DROP TABLE IF EXISTS `bank_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_code` (
  `id` bigint NOT NULL,
  `bank_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_code`
--

LOCK TABLES `bank_code` WRITE;
/*!40000 ALTER TABLE `bank_code` DISABLE KEYS */;
INSERT INTO `bank_code` VALUES (2,'KDB산업은행'),(3,'IBK기업은행'),(4,'KB국민은행'),(7,'Sh수협은행'),(11,'NH농협은행'),(12,'지역농축협'),(20,'우리은행'),(23,'SC제일은행'),(27,'씨티은행'),(31,'DGB대구은행'),(32,'부산은행'),(34,'광주은행'),(35,'제주은행'),(37,'전북은행'),(39,'경남은행'),(45,'새마을금고'),(48,'신협'),(50,'저축은행중앙회'),(64,'산림조합'),(71,'우체국예금보험'),(81,'하나은행'),(88,'신한은행'),(89,'케이뱅크'),(90,'카카오뱅크'),(92,'토스뱅크'),(108,'돈독은행');
/*!40000 ALTER TABLE `bank_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `after_balance` int NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `sign` varchar(255) DEFAULT NULL,
  `to_account` varchar(50) NOT NULL,
  `to_sign` varchar(255) DEFAULT NULL,
  `transfer_amount` int NOT NULL,
  `type` int NOT NULL,
  `account_id` bigint DEFAULT NULL,
  `bank_code_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2mpn4nxqqsu7euii4hwhbjeg8` (`account_id`),
  KEY `FKgtpyko3dl1dcepss1v5fglpw3` (`bank_code_id`),
  CONSTRAINT `FK2mpn4nxqqsu7euii4hwhbjeg8` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`),
  CONSTRAINT `FKgtpyko3dl1dcepss1v5fglpw3` FOREIGN KEY (`bank_code_id`) REFERENCES `bank_code` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` VALUES (1,860000,'2023-10-05 19:41:12.877001','D108 공용계좌','0124232008466','여가',140000,1,8,3),(2,1140000,'2023-10-05 19:41:12.899160','여가','5548960834363','D108 공용계좌',140000,2,9,108),(3,730000,'2023-10-05 19:41:25.273811','D108 공용계좌','0124232008466','식사',130000,1,8,3),(4,1270000,'2023-10-05 19:41:25.276315','식사','5548960834363','D108 공용계좌',130000,2,9,108),(5,610000,'2023-10-05 19:41:33.888997','D108 공용계좌','0124232008466','교육',120000,1,8,3),(6,1390000,'2023-10-05 19:41:33.891284','교육','5548960834363','D108 공용계좌',120000,2,9,108),(7,500000,'2023-10-05 19:41:40.973457','D108 공용계좌','0124232008466','쇼핑',110000,1,8,3),(8,1500000,'2023-10-05 19:41:40.975242','쇼핑','5548960834363','D108 공용계좌',110000,2,9,108),(9,700000,'2023-10-05 19:50:16.873335','루카 가족','8694022788941','병원비',300000,1,15,88),(10,1300000,'2023-10-05 19:50:16.875178','병원비','1724641821366','루카 가족',300000,2,1,108),(11,990000,'2023-10-05 20:00:24.830166','안영기','4317744269177','신제형',10000,1,10,11),(12,1010000,'2023-10-05 20:00:24.831876','신제형','1195397389690','안영기',10000,2,4,81),(13,376877,'2023-10-05 20:05:57.243273','D108 공용계좌','1195397389690','123123',123123,1,8,81),(14,1113123,'2023-10-05 20:05:57.245031','123123','5548960834363','D108 공용계좌',123123,2,10,108),(15,980000,'2023-10-05 20:28:31.595402','안영기','4317744269177','송민철',20000,1,13,11),(16,1030000,'2023-10-05 20:28:31.598156','송민철','0301057315232','안영기',20000,2,4,11),(17,950000,'2023-10-05 20:50:58.563287','강승현','8694022788941','송민철',30000,1,13,88),(18,1330000,'2023-10-05 20:50:58.565161','송민철','0301057315232','강승현',30000,2,1,11),(19,366877,'2023-10-05 20:53:50.416347','D108 공용계좌','4317744269177','돈이 가지고 싶어요',10000,1,8,11),(20,1040000,'2023-10-05 20:53:50.418001','돈이 가지고 싶어요','5548960834363','D108 공용계좌',10000,2,4,108),(21,920000,'2023-10-05 20:54:45.674691','강승현','8694022788941','송민철',30000,1,13,88),(22,1360000,'2023-10-05 20:54:45.676381','송민철','0301057315232','강승현',30000,2,1,11),(23,700000,'2023-10-05 20:56:37.171985','루카 가족','8694022788941','tt5',0,1,15,88),(24,1360000,'2023-10-05 20:56:37.173465','tt5','1724641821366','루카 가족',0,2,1,108),(25,1330000,'2023-10-05 21:27:01.277197','송민철','0301057315232','강승현',30000,1,1,11),(26,950000,'2023-10-05 21:27:01.278780','강승현','8694022788941','송민철',30000,2,13,88),(27,670000,'2023-10-05 21:28:00.084116','루카 가족','8694022788941','쇼핑할래',30000,1,15,88),(28,1360000,'2023-10-05 21:28:00.085607','쇼핑할래','1724641821366','루카 가족',30000,2,1,108),(29,620000,'2023-10-05 21:29:46.818038','루카 가족','8694022788941','강승현',50000,1,15,88),(30,1410000,'2023-10-05 21:29:46.819632','강승현','1724641821366','루카 가족',50000,2,1,108),(31,970000,'2023-10-06 00:45:14.441557','우리모임','9853232906767','쇼핑할래',30000,1,23,88),(32,1030000,'2023-10-06 00:45:14.443157','쇼핑할래','4170649277549','우리모임',30000,2,2,108),(33,990000,'2023-10-06 00:50:35.820378','운동매일매일','1195397389690','민철아 운동하자',10000,1,14,81),(34,1123123,'2023-10-06 00:50:35.821940','민철아 운동하자','5452886849634','운동매일매일',10000,2,10,108),(35,970000,'2023-10-06 01:39:37.582671','피터','2433803876916','칼리',30000,1,21,11),(36,1030000,'2023-10-06 01:39:37.584137','칼리','3929637492051','피터',30000,2,19,20),(37,670000,'2023-10-06 01:41:09.769339','우리모임','3929637492051','쇼핑할래요!',300000,1,23,20),(38,1270000,'2023-10-06 01:41:09.770791','쇼핑할래요!','4170649277549','우리모임',300000,2,21,108),(39,620000,'2023-10-06 01:42:21.343453','우리모임','3929637492051','칼리',50000,1,23,20),(40,1320000,'2023-10-06 01:42:21.344929','칼리','4170649277549','우리모임',50000,2,21,108),(41,316877,'2023-10-06 02:43:28.365968','D108 공용계좌','0124232008466','김동혁',50000,1,8,3),(42,1550000,'2023-10-06 02:43:28.367358','김동혁','5548960834363','D108 공용계좌',50000,2,9,108);
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `memo`
--

DROP TABLE IF EXISTS `memo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `memo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `history_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8vlvpwtfgpl01ml25i1wkospk` (`history_id`),
  CONSTRAINT `FK8vlvpwtfgpl01ml25i1wkospk` FOREIGN KEY (`history_id`) REFERENCES `history` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `memo`
--

LOCK TABLES `memo` WRITE;
/*!40000 ALTER TABLE `memo` DISABLE KEYS */;
/*!40000 ALTER TABLE `memo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owner` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `identification_number` varchar(255) NOT NULL,
  `owner_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owner`
--

LOCK TABLES `owner` WRITE;
/*!40000 ALTER TABLE `owner` DISABLE KEYS */;
INSERT INTO `owner` VALUES (1,'f19c614463d91f6e66dd2c5508c55142e6ccb4e98614b2138e5d5f85104bd0b9','강승현'),(2,'0912ba05b944ab582876404b05d411970be623dea225ebec693683d0e421d3a5','Luca 가족'),(3,'fb7e551e724bbe2fe2c4e0da08f5b6a75142dae6fe06f3cd419fa83557aae404','안영기'),(4,'f14936bfb59c7be62f152277bfe9a77cd5e0ee43db62f90b944c358791e5fb18','Luca 가족'),(5,'d562c3a66b5f89d586f3b43094727f347f01217acb75145b1248a5e24cb8a140','D108 공용계좌'),(6,'fdb37a54bc0ea62d5fcf494390629332c821b1bc93d269615b64e157e1bb89d5','김동혁'),(7,'4855b999b684ed6fb671100d78838042dd9cc8feadcf7ca55e34599c3ec735ff','신제형'),(8,'5b779715b8e99655d0f9be5b2189502c04e4497d6e5c8409cb39cb7349b51082','유영서'),(9,'421c5ed398807435a27a729f2553ad87facac391010903266c80ec89291d30cb','송민철'),(10,'9a0a17b1f4bc813990b77475cc9572e3ab40c233a748d8552dfc79b8de805b99','운동매일매일'),(11,'39c1e24cf7769d2f8e6383178c298ffd0c216e78688c019cb74dd82458b10cf7','루카 가족'),(12,'ff136288df315505f5b177e02dd3261ada820eb688798c1e829d1aeb64b020b7','우리모임'),(13,'5e8791e34356da2b84bd409b21725e18a80c467b64fa4b4badd0d914f109584f','피터'),(14,'2574855cb69afb2365eafba51e91975d977b7a00fafbfb2d347dc49628258d52','칼리'),(15,'2b5774a37143c768b47b79073603136e93c815c329f911a9dfc48a0b6f4e6488','우리모임'),(16,'ec272d2373b1c2cac53c669ff3cd11655be945761cc6cba4f470a0d597c5a428','우리 가족 계좌');
/*!40000 ALTER TABLE `owner` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-06 12:08:29