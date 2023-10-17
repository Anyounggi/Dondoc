-- MySQL dump 10.13  Distrib 8.0.34, for Linux (x86_64)
--
-- Host: localhost    Database: dondoc_test
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
  `account_id` bigint NOT NULL,
  `account_number` varchar(50) NOT NULL,
  `bank_code` bigint NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKra7xoi9wtlcq07tmoxxe5jrh4` (`user_id`),
  CONSTRAINT `FKra7xoi9wtlcq07tmoxxe5jrh4` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,1,'8694022788941',88,'신한은행',1),(2,2,'9853232906767',88,'신한은행',1),(3,3,'6959562638997',88,'신한은행',1),(4,4,'4317744269177',11,'NH농협은행',2),(5,5,'0159992173834',4,'KB국민은행',2),(6,6,'7098100904103',31,'DGB대구은행',2),(7,10,'1195397389690',81,'하나은행',3),(8,11,'6335111267307',4,'KB국민은행',6),(9,12,'7236048201172',11,'NH농협은행',6),(10,13,'0301057315232',11,'NH농협은행',5),(11,9,'0124232008466',3,'IBK기업은행',4),(12,17,'2057312297151',3,'IBK기업은행',5),(13,18,'7832611041158',88,'신한은행',5),(14,21,'3929637492051',20,'우리은행',8),(15,22,'3120082658429',90,'카카오뱅크',8),(16,19,'2433803876916',11,'NH농협은행',7),(17,20,'8702603378487',88,'신한은행',7);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `allow_request`
--

DROP TABLE IF EXISTS `allow_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allow_request` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `moim_member_id` bigint DEFAULT NULL,
  `request_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKlc4bvfsi7m15cmwoy9vhweuhq` (`moim_member_id`),
  KEY `FKcrey0hmxgso11hlf5d1vrvsfk` (`request_id`),
  CONSTRAINT `FKcrey0hmxgso11hlf5d1vrvsfk` FOREIGN KEY (`request_id`) REFERENCES `withdraw_request` (`id`),
  CONSTRAINT `FKlc4bvfsi7m15cmwoy9vhweuhq` FOREIGN KEY (`moim_member_id`) REFERENCES `moim_member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allow_request`
--

LOCK TABLES `allow_request` WRITE;
/*!40000 ALTER TABLE `allow_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `allow_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` bigint NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (0,'쇼핑'),(1,'교육'),(2,'식사'),(3,'여가'),(4,'의료'),(5,'기타');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend`
--

DROP TABLE IF EXISTS `friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `friend_id` bigint NOT NULL,
  `status` int NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKeab81424e9dtc4a8hjlq4xiew` (`user_id`),
  CONSTRAINT `FKeab81424e9dtc4a8hjlq4xiew` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend`
--

LOCK TABLES `friend` WRITE;
/*!40000 ALTER TABLE `friend` DISABLE KEYS */;
INSERT INTO `friend` VALUES (2,'2023-10-05 19:20:52.275907',4,1,2),(3,'2023-10-05 19:21:07.979470',1,1,2),(4,'2023-10-05 19:22:33.722264',5,1,2),(5,'2023-10-05 19:24:06.413232',6,1,2),(7,'2023-10-05 19:29:51.642290',6,1,1),(8,'2023-10-05 19:29:59.213483',1,1,5),(10,'2023-10-05 19:30:07.936233',6,1,5),(11,'2023-10-05 23:07:58.798656',3,1,4),(12,'2023-10-05 23:09:23.123334',5,1,3),(13,'2023-10-05 23:09:26.433063',6,1,3),(14,'2023-10-06 00:01:05.494879',7,1,8),(15,'2023-10-06 00:30:17.430909',3,1,2);
/*!40000 ALTER TABLE `friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mission`
--

DROP TABLE IF EXISTS `mission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mission` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount` int NOT NULL,
  `content` longtext NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_date` datetime(6) DEFAULT NULL,
  `status` int NOT NULL,
  `title` longtext NOT NULL,
  `moim_member_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqn0u0ttrcyg5lyt6mo8i9p57i` (`moim_member_id`),
  CONSTRAINT `FKqn0u0ttrcyg5lyt6mo8i9p57i` FOREIGN KEY (`moim_member_id`) REFERENCES `moim_member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mission`
--

LOCK TABLES `mission` WRITE;
/*!40000 ALTER TABLE `mission` DISABLE KEYS */;
INSERT INTO `mission` VALUES (1,50000,'이번 기말고사 평균 90점 받아오면 용돈준다 !','2023-10-05 20:10:18.259036','2023-10-31',NULL,1,'기말고사 평균 90점',13),(2,50000,'기말고사 평균 90점 넘으면 5만원~!','2023-10-05 20:25:10.792947','2023-10-31',NULL,1,'기말고사 평균 90점',13),(3,50000,'내용','2023-10-05 21:28:30.718527','2023-10-31',NULL,4,'미션명',13),(4,50000,'미션내용','2023-10-06 01:41:45.791805','2023-10-31','2023-10-06 01:41:45.791502',4,'미션명',22),(5,50000,'시험치기','2023-10-06 02:18:00.047244','2023-10-07',NULL,4,'시험치기',3);
/*!40000 ALTER TABLE `mission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moim`
--

DROP TABLE IF EXISTS `moim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `moim` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `identification_number` varchar(255) NOT NULL,
  `introduce` longtext NOT NULL,
  `is_active` int NOT NULL,
  `limited` int NOT NULL,
  `moim_account_id` bigint NOT NULL,
  `moim_account_number` varchar(50) NOT NULL,
  `moim_name` varchar(20) NOT NULL,
  `moim_type` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moim`
--

LOCK TABLES `moim` WRITE;
/*!40000 ALTER TABLE `moim` DISABLE KEYS */;
INSERT INTO `moim` VALUES (1,'2023-10-05 19:15:03.137537','90987791863','안녕하세요',1,0,7,'2039773068496','Luca 가족',1),(2,'2023-10-05 19:15:56.559534','10254448455','특화프로젝트 D108팀 공용계좌입니다!',1,0,8,'5548960834363','D108 공용계좌',3),(3,'2023-10-05 19:38:58.750760','81025540699','우리는 매일매일 운동을해요',1,0,14,'5452886849634','운동매일매일',1),(4,'2023-10-05 19:41:39.729045','52797236548','가족 모임 ^^',1,100000,15,'1724641821366','루카 가족',2),(5,'2023-10-05 21:08:44.105866','42715297703','모임',1,0,16,'2186803338721','우리모임',1),(6,'2023-10-06 00:20:41.778253','60720008485','돈독한 모임이에요~',1,-50000,23,'4170649277549','우리모임',1),(7,'2023-10-06 02:22:01.509119','84929045210','우리 가족 계좌',1,0,24,'4861493703070','우리 가족 계좌',1);
/*!40000 ALTER TABLE `moim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moim_member`
--

DROP TABLE IF EXISTS `moim_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `moim_member` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `invited_at` datetime(6) DEFAULT NULL,
  `inviter_name` varchar(20) DEFAULT NULL,
  `signed_at` datetime(6) DEFAULT NULL,
  `status` int NOT NULL,
  `user_type` int NOT NULL,
  `account_id` bigint DEFAULT NULL,
  `moim_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbnga40e3dhmqwl7p1cimktcnr` (`account_id`),
  KEY `FKqx13g72c77g2wrq53bsf17pal` (`moim_id`),
  KEY `FKqj1xo2b6ya0vmkuqo3ds3dmod` (`user_id`),
  CONSTRAINT `FKbnga40e3dhmqwl7p1cimktcnr` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`),
  CONSTRAINT `FKqj1xo2b6ya0vmkuqo3ds3dmod` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKqx13g72c77g2wrq53bsf17pal` FOREIGN KEY (`moim_id`) REFERENCES `moim` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moim_member`
--

LOCK TABLES `moim_member` WRITE;
/*!40000 ALTER TABLE `moim_member` DISABLE KEYS */;
INSERT INTO `moim_member` VALUES (1,'2023-10-05 19:15:03.164676',NULL,'2023-10-05 19:15:03.164676',1,0,1,1,1),(2,'2023-10-05 19:15:56.564303',NULL,'2023-10-05 19:15:56.564303',1,0,4,2,2),(3,'2023-10-05 19:28:51.864438','안영기','2023-10-05 19:30:12.170485',1,0,11,2,4),(4,'2023-10-05 19:28:51.868468','안영기','2023-10-05 19:42:43.662075',1,0,1,2,1),(5,'2023-10-05 19:28:51.872681','안영기','2023-10-05 19:30:58.340600',1,0,10,2,5),(6,'2023-10-05 19:28:51.876535','안영기','2023-10-05 19:30:27.698230',1,0,8,2,6),(7,'2023-10-05 19:28:51.880419','안영기','2023-10-05 19:29:07.117910',1,0,7,2,3),(8,'2023-10-05 19:30:48.615491','강승현','2023-10-05 19:31:07.475976',1,1,10,1,5),(9,'2023-10-05 19:38:58.757920',NULL,'2023-10-05 19:38:58.757920',1,0,7,3,3),(10,'2023-10-05 19:39:22.783287','신제형','2023-10-05 19:39:32.406877',1,1,10,3,5),(11,'2023-10-05 19:41:39.731844',NULL,'2023-10-05 19:41:39.731844',1,0,10,4,5),(12,'2023-10-05 19:41:39.733976','송민철','2023-10-05 19:42:41.248276',1,0,8,4,6),(13,'2023-10-05 19:42:56.068709','송민철','2023-10-05 19:43:14.288398',1,1,1,4,1),(14,'2023-10-05 21:04:04.422131','유영서','2023-10-05 21:26:13.473239',1,1,7,4,3),(15,'2023-10-05 21:08:44.108575',NULL,'2023-10-05 21:08:44.108575',1,0,10,5,5),(16,'2023-10-05 21:09:16.224973','송민철','2023-10-05 21:27:15.447535',1,1,1,5,1),(17,'2023-10-05 21:25:31.692489','유영서','2023-10-05 23:38:40.089022',1,1,4,4,2),(18,'2023-10-06 00:20:41.780955',NULL,'2023-10-06 00:20:41.780955',1,0,16,6,7),(20,'2023-10-06 00:21:25.536879','피터','2023-10-06 00:23:53.292261',1,1,2,6,1),(21,'2023-10-06 00:23:54.733445','피터','2023-10-06 00:24:53.359014',1,1,13,6,5),(22,'2023-10-06 01:39:58.924743','피터','2023-10-06 01:40:27.891147',1,1,14,6,8),(23,'2023-10-06 02:22:01.511757',NULL,'2023-10-06 02:22:01.511757',1,0,11,7,4),(24,'2023-10-06 02:22:16.015349','김동혁','2023-10-06 02:23:42.733446',1,1,5,7,2),(25,'2023-10-06 02:22:16.018229','김동혁','2023-10-06 02:22:16.018229',0,1,NULL,7,3);
/*!40000 ALTER TABLE `moim_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notify`
--

DROP TABLE IF EXISTS `notify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notify` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `notify_type` int NOT NULL,
  `title` varchar(100) NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbxjvlvchwp0xwj7m97bsmajcb` (`user_id`),
  CONSTRAINT `FKbxjvlvchwp0xwj7m97bsmajcb` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notify`
--

LOCK TABLES `notify` WRITE;
/*!40000 ALTER TABLE `notify` DISABLE KEYS */;
/*!40000 ALTER TABLE `notify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `birth` date DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `image_number` int NOT NULL,
  `introduce` longtext,
  `main_account` bigint DEFAULT NULL,
  `name` varchar(20) NOT NULL,
  `nick_name` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `refresh_token` longtext,
  `salt` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,NULL,'2023-10-05 19:08:53.287979',6,NULL,1,'강승현','강승현','$2a$10$Li2puu.oYumgzdn1W4Hjie9Fc8Bt8.scpgiNbmSBjkSwfdtTqLg.S','01026807453','eyJhbGciOiJIUzI1NiJ9.eyJuYW1lIjoi6rCV7Iq57ZiEIiwidXNlcm5hbWUiOiIwMTAyNjgwNzQ1MyIsInN1YiI6IjEiLCJpYXQiOjE2OTY1NTE3ODcsImV4cCI6MTY5NzE1NjU4N30._FZPW6IzSt81pwRdrAdB-ctzhMez2joBLHu433CsthE','a182b7f6f5b8d58a965ba6ca68bb521a'),(2,NULL,'2023-10-05 19:13:36.353779',18,'',4,'안영기','제이든','$2a$10$j3G8CP1V7ls3gtdWjfQqbe7edxyNB3quDSf4UuGqlHTwirlaMVxFe','01085799281','eyJhbGciOiJIUzI1NiJ9.eyJuYW1lIjoi7JWI7JiB6riwIiwidXNlcm5hbWUiOiIwMTA4NTc5OTI4MSIsInN1YiI6IjIiLCJpYXQiOjE2OTY1NjAxODAsImV4cCI6MTY5NzE2NDk4MH0.MamYuxRACkgbyM6oMkPZw0EMTxH14tZ5RxLpMzejrK0','efa861d83d01526b3ba975535af672fa'),(3,NULL,'2023-10-05 19:17:02.530204',4,'반갑습니다. 27세 신제형입니다.',10,'신제형','라이스','$2a$10$qQ5q1oGepiUN0/C9zCAwVuOmlbEAP9rbN.wxy5KRIQEZ2cASqLoD6','01020505050','eyJhbGciOiJIUzI1NiJ9.eyJuYW1lIjoi7Iug7KCc7ZiVIiwidXNlcm5hbWUiOiIwMTAyMDUwNTA1MCIsInN1YiI6IjMiLCJpYXQiOjE2OTY1NTMzOTIsImV4cCI6MTY5NzE1ODE5Mn0.8IMl_Z-_OdOypVxhXpwEY5jFE53j8TX_pb9rteBju9w','b144c253acc305672b89e9c0e7fd6d04'),(4,NULL,'2023-10-05 19:17:20.966225',11,NULL,NULL,'김동혁','Duran','$2a$10$ljDjoh77inO38YgJEjaAKeWkJKLfVBtf6U9BFAQQlVBm5WzxWEqj2','01084145653','eyJhbGciOiJIUzI1NiJ9.eyJuYW1lIjoi6rmA64-Z7ZiBIiwidXNlcm5hbWUiOiIwMTA4NDE0NTY1MyIsInN1YiI6IjQiLCJpYXQiOjE2OTY1NTg2NTMsImV4cCI6MTY5NzE2MzQ1M30.sKUG8bkayUnvypIlKgDnoK40dFHecoH_fmdDKEOXa-I','ecda8837cfd3743f8c790d71bff90e10'),(5,NULL,'2023-10-05 19:22:26.687541',22,'ㅎㅎ',13,'송민철','송민철','$2a$10$mcc4vb1eNsLNcYjW7mXFZOqdtfZc1Sni7QZCe72NhVRfJ0Fu7n4r.','01095530160','eyJhbGciOiJIUzI1NiJ9.eyJuYW1lIjoi7Iah66-87LKgIiwidXNlcm5hbWUiOiIwMTA5NTUzMDE2MCIsInN1YiI6IjUiLCJpYXQiOjE2OTY1NTE5NjQsImV4cCI6MTY5NzE1Njc2NH0.mM0KcchyxjZZw4gh_I50SLmL2tfDlW8-rBDTevwQ6Eo','c24f9af9349fa531e1f0aa0e425c34c8'),(6,NULL,'2023-10-05 19:24:04.344325',7,'할룽 ~',11,'유영서','Kallie','$2a$10$XyXsXS5KZEcdXIstSHjfeOF4Tq0nmEgj7BD0ffuc3M6Ofw7vQASIa','01041762878','eyJhbGciOiJIUzI1NiJ9.eyJuYW1lIjoi7Jyg7JiB7IScIiwidXNlcm5hbWUiOiIwMTA0MTc2Mjg3OCIsInN1YiI6IjYiLCJpYXQiOjE2OTY1NTIyMjMsImV4cCI6MTY5NzE1NzAyM30.M_0p0a45iF49m3TF1aBkPkbMuzlW9PpQQUeMIGRCF5o','d41ae61befb240e238876ed7cdaf2025'),(7,NULL,'2023-10-05 23:52:41.483302',7,NULL,19,'피터','피터','$2a$10$skM61fkQnacNYCnJM7W6BeMoVAtR5L/NYFvlxz0rTH3GGGLPn8Ciq','01012345678','eyJhbGciOiJIUzI1NiJ9.eyJuYW1lIjoi7ZS87YSwIiwidXNlcm5hbWUiOiIwMTAxMjM0NTY3OCIsInN1YiI6IjciLCJpYXQiOjE2OTY1NTU4NzksImV4cCI6MTY5NzE2MDY3OX0.k0vzUtG6deUfeMkcuYpNE6p-a3gbMbvfY3_6ZTEVjxI','034a5c60cbeb699ddc695369b51df26e'),(8,NULL,'2023-10-05 23:55:11.302548',2,NULL,21,'칼리','칼리','$2a$10$RdTnQTbTp9kaBBYwybg9ze5wvoPDUl3ZNuuTRQyIckamEy/3qVP5O','01011111111','eyJhbGciOiJIUzI1NiJ9.eyJuYW1lIjoi7Lm866asIiwidXNlcm5hbWUiOiIwMTAxMTExMTExMSIsInN1YiI6IjgiLCJpYXQiOjE2OTY1NTU1NzEsImV4cCI6MTY5NzE2MDM3MX0.g580iMLmN0Z2uvMVtXqUrk9XWZQISsDkuRHC1iur7No','690ed4c119860342a8cdd5800180d3ea');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `withdraw_request`
--

DROP TABLE IF EXISTS `withdraw_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `withdraw_request` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount` int NOT NULL,
  `content` longtext NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `status` int NOT NULL,
  `title` longtext NOT NULL,
  `category_id` bigint DEFAULT NULL,
  `moim_member_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5jqccs25qoh9kjuh4xobgxfil` (`category_id`),
  KEY `FK78tiaforaberjw0dek5mh1vks` (`moim_member_id`),
  CONSTRAINT `FK5jqccs25qoh9kjuh4xobgxfil` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `FK78tiaforaberjw0dek5mh1vks` FOREIGN KEY (`moim_member_id`) REFERENCES `moim_member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `withdraw_request`
--

LOCK TABLES `withdraw_request` WRITE;
/*!40000 ALTER TABLE `withdraw_request` DISABLE KEYS */;
INSERT INTO `withdraw_request` VALUES (1,110000,'쇼핑','2023-10-05 19:37:58.309845',1,'쇼핑',0,3),(2,120000,'교육','2023-10-05 19:38:17.646226',1,'교육',1,3),(3,130000,'식사','2023-10-05 19:39:52.978240',1,'식사',2,3),(4,140000,'여가','2023-10-05 19:40:19.251240',1,'여가',3,3),(5,300000,'축구하다 발목 부상으로 병원비','2023-10-05 19:47:42.950310',1,'병원비',5,13),(6,300000,'축구하다 발목 부상으로 병원비 요청','2023-10-05 19:53:41.718353',0,'병원비',5,13),(7,123123,'123123','2023-10-05 20:04:40.518950',1,'123123',0,7),(8,10000,'돈 가지고 싶다!','2023-10-05 20:53:37.965460',1,'돈이 가지고 싶어요',0,2),(9,0,'tt','2023-10-05 20:56:16.264637',1,'tt5',0,13),(10,30000,'옷사고싶어요 !!\n','2023-10-05 21:27:41.972723',1,'쇼핑할래',0,13),(11,30000,'옷 사고 싶어요','2023-10-06 00:45:03.353849',1,'쇼핑할래',0,20),(12,10000,'운동하자 민철아','2023-10-06 00:50:25.271242',1,'민철아 운동하자',3,9),(13,300000,'가을 맨투맨 서고싶어요 !!','2023-10-06 01:40:52.099352',1,'쇼핑할래요!',0,22);
/*!40000 ALTER TABLE `withdraw_request` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-06 12:08:14
