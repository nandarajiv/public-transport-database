-- MySQL dump 10.13  Distrib 8.0.31, for Linux (x86_64)
--
-- Host: localhost    Database: team47dna
-- ------------------------------------------------------
-- Server version	8.0.31-0ubuntu0.20.04.1

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
-- Table structure for table `ACCOMPANIES`
--

DROP TABLE IF EXISTS `ACCOMPANIES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACCOMPANIES` (
  `Pass1` bigint NOT NULL,
  `Pass2` bigint NOT NULL,
  PRIMARY KEY (`Pass1`,`Pass2`),
  KEY `Pass2` (`Pass2`),
  CONSTRAINT `ACCOMPANIES_ibfk_1` FOREIGN KEY (`Pass1`) REFERENCES `PASSENGER` (`Aadhar_Card_Number`) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT `ACCOMPANIES_ibfk_2` FOREIGN KEY (`Pass2`) REFERENCES `PASSENGER` (`Aadhar_Card_Number`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACCOMPANIES`
--

LOCK TABLES `ACCOMPANIES` WRITE;
/*!40000 ALTER TABLE `ACCOMPANIES` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACCOMPANIES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ADDRESSING_COMPLAINTS`
--

DROP TABLE IF EXISTS `ADDRESSING_COMPLAINTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ADDRESSING_COMPLAINTS` (
  `P_Aadhar` bigint NOT NULL,
  `Comp_ID` int NOT NULL,
  `V_State` varchar(20) NOT NULL,
  `V_Zone` varchar(20) NOT NULL,
  `V_Reg` int NOT NULL,
  `Admin_Aadhar` bigint NOT NULL,
  PRIMARY KEY (`P_Aadhar`,`Comp_ID`,`V_State`,`V_Zone`,`V_Reg`,`Admin_Aadhar`),
  KEY `Comp_ID` (`Comp_ID`),
  KEY `V_State` (`V_State`,`V_Zone`,`V_Reg`),
  KEY `Admin_Aadhar` (`Admin_Aadhar`),
  CONSTRAINT `ADDRESSING_COMPLAINTS_ibfk_1` FOREIGN KEY (`P_Aadhar`) REFERENCES `PASSENGER` (`Aadhar_Card_Number`) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT `ADDRESSING_COMPLAINTS_ibfk_2` FOREIGN KEY (`Comp_ID`) REFERENCES `COMPLAINT` (`Complaint_ID`) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT `ADDRESSING_COMPLAINTS_ibfk_3` FOREIGN KEY (`V_State`, `V_Zone`, `V_Reg`) REFERENCES `VEHICLE` (`State`, `Zone`, `Vehicle_Registration`) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT `ADDRESSING_COMPLAINTS_ibfk_4` FOREIGN KEY (`Admin_Aadhar`) REFERENCES `ADMIN_OFFICER` (`Aadhar_Card_Number`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADDRESSING_COMPLAINTS`
--

LOCK TABLES `ADDRESSING_COMPLAINTS` WRITE;
/*!40000 ALTER TABLE `ADDRESSING_COMPLAINTS` DISABLE KEYS */;
INSERT INTO `ADDRESSING_COMPLAINTS` VALUES (773234944528,35171,'Goa','Maldives',5643,149679238223),(978543512574,35233,'Telangana','India',1237,532127278562),(554441673123,36121,'Hyderabad','Pakistan',5852,149679238223),(415697139692,60217,'Telangana','India',1237,519035459916);
/*!40000 ALTER TABLE `ADDRESSING_COMPLAINTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ADMIN_OFFICER`
--

DROP TABLE IF EXISTS `ADMIN_OFFICER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ADMIN_OFFICER` (
  `First_Name` varchar(20) DEFAULT NULL,
  `Middle_Name` varchar(20) DEFAULT NULL,
  `Last_Name` varchar(20) DEFAULT NULL,
  `Aadhar_Card_Number` bigint NOT NULL,
  `Service_Start_Date` date DEFAULT NULL,
  `GENDER` varchar(1) DEFAULT NULL,
  `Sup_Admin` bigint DEFAULT NULL,
  PRIMARY KEY (`Aadhar_Card_Number`),
  KEY `Sup_Admin` (`Sup_Admin`),
  CONSTRAINT `ADMIN_OFFICER_ibfk_1` FOREIGN KEY (`Sup_Admin`) REFERENCES `ADMIN_OFFICER` (`Aadhar_Card_Number`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_OFFICER`
--

LOCK TABLES `ADMIN_OFFICER` WRITE;
/*!40000 ALTER TABLE `ADMIN_OFFICER` DISABLE KEYS */;
INSERT INTO `ADMIN_OFFICER` VALUES ('Nanda','','Bottle',149679238223,'2021-01-20','M',595259831953),('Chicken','Tikka','Masala',519035459916,'2018-02-14','M',904890478814),('Gray','Yellow','Workspace',532127278562,'2017-10-13','M',604840266186),('Peesa','','Trash',595259831953,'2020-02-20','F',NULL),('Mint','Chocolate','Chip',604840266186,'2019-05-03','F',NULL),('Trash','','Can',843091618551,'2019-04-30','M',604840266186),('Meet','Ideate','Hack',904890478814,'2018-09-14','F',604840266186);
/*!40000 ALTER TABLE `ADMIN_OFFICER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPLAINT`
--

DROP TABLE IF EXISTS `COMPLAINT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPLAINT` (
  `Complaint_ID` int NOT NULL,
  `First_Name` varchar(20) DEFAULT NULL,
  `Middle_Name` varchar(20) DEFAULT NULL,
  `Last_Name` varchar(20) DEFAULT NULL,
  `Assigned_Admin_Officer_Aadhar_Number` bigint DEFAULT NULL,
  `Transport` varchar(20) DEFAULT NULL,
  `Description` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`Complaint_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPLAINT`
--

LOCK TABLES `COMPLAINT` WRITE;
/*!40000 ALTER TABLE `COMPLAINT` DISABLE KEYS */;
INSERT INTO `COMPLAINT` VALUES (35171,'Orghoe','','Roy',149679238223,'Train','Why am I so stupid?'),(35233,'Raghav','Raj','Dwivedi',595259831953,'Bus','Argentina lost.'),(36121,'Anuhya','','Nallapati',149679238223,'Metro','Orgho isn\'t going to JC.'),(60217,'Nanda','','Rajiv',519035459916,'Bus','The ride was bumpy.');
/*!40000 ALTER TABLE `COMPLAINT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CONDUCTOR`
--

DROP TABLE IF EXISTS `CONDUCTOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CONDUCTOR` (
  `First_Name` varchar(20) DEFAULT NULL,
  `Middle_Name` varchar(20) DEFAULT NULL,
  `Last_Name` varchar(20) DEFAULT NULL,
  `Aadhar_Card_Number` bigint NOT NULL,
  `Service_Start_Date` date DEFAULT NULL,
  `Age` int DEFAULT NULL,
  `Gender` varchar(1) DEFAULT NULL,
  `Rep_Admin_Aadhar` bigint DEFAULT NULL,
  `Sal_Admin_Aadhar` bigint DEFAULT NULL,
  PRIMARY KEY (`Aadhar_Card_Number`),
  KEY `Rep_Admin_Aadhar` (`Rep_Admin_Aadhar`),
  KEY `Sal_Admin_Aadhar` (`Sal_Admin_Aadhar`),
  CONSTRAINT `CONDUCTOR_ibfk_1` FOREIGN KEY (`Rep_Admin_Aadhar`) REFERENCES `ADMIN_OFFICER` (`Aadhar_Card_Number`) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT `CONDUCTOR_ibfk_2` FOREIGN KEY (`Sal_Admin_Aadhar`) REFERENCES `ADMIN_OFFICER` (`Aadhar_Card_Number`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CONDUCTOR`
--

LOCK TABLES `CONDUCTOR` WRITE;
/*!40000 ALTER TABLE `CONDUCTOR` DISABLE KEYS */;
INSERT INTO `CONDUCTOR` VALUES ('Orgho','Go','JC',413007283401,'2015-10-09',30,'F',532127278562,843091618551),('Pringles','','Chip',534494226931,'2013-02-08',43,'M',149679238223,149679238223),('Sting','Is','Trash',709502931626,'2021-11-21',38,'F',595259831953,149679238223),('Light','Blue','Lays',722672224241,'2021-01-08',49,'F',595259831953,149679238223),('Sting','Is','Trash',854012895511,'2020-04-13',23,'M',149679238223,843091618551),('Dirty','Yellow','Teeth',896080796050,'2020-10-01',29,'F',519035459916,843091618551),('Nandoz','Wants','Sleep',941256965089,'2015-10-09',30,'M',904890478814,904890478814);
/*!40000 ALTER TABLE `CONDUCTOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DRIVER`
--

DROP TABLE IF EXISTS `DRIVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DRIVER` (
  `Aadhar_Card_Number` bigint DEFAULT NULL,
  `Drivers_License_ID_Number` int NOT NULL,
  `Rep_Admin_Aadhar` bigint DEFAULT NULL,
  `Sal_Admin_Aadhar` bigint DEFAULT NULL,
  PRIMARY KEY (`Drivers_License_ID_Number`),
  KEY `Aadhar_Card_Number` (`Aadhar_Card_Number`),
  KEY `Rep_Admin_Aadhar` (`Rep_Admin_Aadhar`),
  KEY `Sal_Admin_Aadhar` (`Sal_Admin_Aadhar`),
  CONSTRAINT `DRIVER_ibfk_1` FOREIGN KEY (`Aadhar_Card_Number`) REFERENCES `DRIVER_ALT` (`Aadhar_Card_Number`) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT `DRIVER_ibfk_2` FOREIGN KEY (`Rep_Admin_Aadhar`) REFERENCES `ADMIN_OFFICER` (`Aadhar_Card_Number`) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT `DRIVER_ibfk_3` FOREIGN KEY (`Sal_Admin_Aadhar`) REFERENCES `ADMIN_OFFICER` (`Aadhar_Card_Number`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DRIVER`
--

LOCK TABLES `DRIVER` WRITE;
/*!40000 ALTER TABLE `DRIVER` DISABLE KEYS */;
INSERT INTO `DRIVER` VALUES (517191809702,22431711,604840266186,149679238223),(341133900885,39647608,532127278562,843091618551),(397797725275,40449984,149679238223,604840266186),(648200269913,46340512,595259831953,595259831953),(656015906115,68522463,519035459916,149679238223),(607195275701,77663296,904890478814,519035459916);
/*!40000 ALTER TABLE `DRIVER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DRIVER_ALT`
--

DROP TABLE IF EXISTS `DRIVER_ALT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DRIVER_ALT` (
  `Aadhar_Card_Number` bigint NOT NULL,
  `First_Name` varchar(20) DEFAULT NULL,
  `Middle_Name` varchar(20) DEFAULT NULL,
  `Last_Name` varchar(20) DEFAULT NULL,
  `Service_Start_Date` date DEFAULT NULL,
  `Age` int DEFAULT NULL,
  `Gender` char(1) DEFAULT NULL,
  PRIMARY KEY (`Aadhar_Card_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DRIVER_ALT`
--

LOCK TABLES `DRIVER_ALT` WRITE;
/*!40000 ALTER TABLE `DRIVER_ALT` DISABLE KEYS */;
INSERT INTO `DRIVER_ALT` VALUES (213034659770,'Billie','','Eilish','2010-11-12',43,'F'),(284763400464,'Bruno','','Mars','2020-04-13',30,'M'),(341133900885,'Ramu','','Anna','2022-11-26',33,'M'),(397797725275,'Camille','','Preaker','2020-04-13',37,'F'),(517191809702,'Justin','','Bieber','2011-06-22',43,'M'),(607195275701,'John','','Legend','2000-12-11',76,'M'),(648200269913,'Taylor','','Swift','2022-05-24',13,'F'),(653526909822,'Martin','Luther','King','1989-01-01',56,'M'),(656015906115,'Katy','','Perry','2012-02-26',43,'F'),(720354948230,'Stevie','','Wonder','2000-07-13',50,'M'),(782897481330,'Bob','The','Builder','2009-08-12',23,'M');
/*!40000 ALTER TABLE `DRIVER_ALT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DRIVES`
--

DROP TABLE IF EXISTS `DRIVES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DRIVES` (
  `V_State` varchar(20) NOT NULL,
  `V_Zone` varchar(20) NOT NULL,
  `V_Reg` int NOT NULL,
  `MOT_mode` varchar(20) NOT NULL,
  `D_ID` int NOT NULL,
  PRIMARY KEY (`V_State`,`V_Zone`,`V_Reg`,`MOT_mode`,`D_ID`),
  KEY `D_ID` (`D_ID`),
  CONSTRAINT `DRIVES_ibfk_1` FOREIGN KEY (`V_State`, `V_Zone`, `V_Reg`) REFERENCES `VEHICLE` (`State`, `Zone`, `Vehicle_Registration`) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT `DRIVES_ibfk_2` FOREIGN KEY (`D_ID`) REFERENCES `DRIVER` (`Drivers_License_ID_Number`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DRIVES`
--

LOCK TABLES `DRIVES` WRITE;
/*!40000 ALTER TABLE `DRIVES` DISABLE KEYS */;
INSERT INTO `DRIVES` VALUES ('Telangana','India',1237,'Bus',22431711),('Goa','Maldives',5643,'Train',40449984),('Goa','Maldives',1562,'Bus',68522463),('West Bengal','Bangladesh',5485,'Metro',77663296);
/*!40000 ALTER TABLE `DRIVES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IS_NEAR`
--

DROP TABLE IF EXISTS `IS_NEAR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IS_NEAR` (
  `S_Name` varchar(30) NOT NULL,
  `L_Name` varchar(30) NOT NULL,
  PRIMARY KEY (`S_Name`,`L_Name`),
  KEY `L_Name` (`L_Name`),
  CONSTRAINT `IS_NEAR_ibfk_1` FOREIGN KEY (`S_Name`) REFERENCES `STATION` (`Name`) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT `IS_NEAR_ibfk_2` FOREIGN KEY (`L_Name`) REFERENCES `LANDMARK` (`Name`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IS_NEAR`
--

LOCK TABLES `IS_NEAR` WRITE;
/*!40000 ALTER TABLE `IS_NEAR` DISABLE KEYS */;
/*!40000 ALTER TABLE `IS_NEAR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JOURNEY`
--

DROP TABLE IF EXISTS `JOURNEY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JOURNEY` (
  `V_State` varchar(20) NOT NULL,
  `V_Zone` varchar(20) NOT NULL,
  `V_Reg` int NOT NULL,
  `St_Start` varchar(30) NOT NULL,
  `St_End` varchar(30) NOT NULL,
  PRIMARY KEY (`V_State`,`V_Zone`,`V_Reg`,`St_Start`,`St_End`),
  KEY `St_Start` (`St_Start`),
  KEY `St_End` (`St_End`),
  CONSTRAINT `JOURNEY_ibfk_1` FOREIGN KEY (`V_State`, `V_Zone`, `V_Reg`) REFERENCES `VEHICLE` (`State`, `Zone`, `Vehicle_Registration`) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT `JOURNEY_ibfk_2` FOREIGN KEY (`St_Start`) REFERENCES `STATION` (`Name`) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT `JOURNEY_ibfk_3` FOREIGN KEY (`St_End`) REFERENCES `STATION` (`Name`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JOURNEY`
--

LOCK TABLES `JOURNEY` WRITE;
/*!40000 ALTER TABLE `JOURNEY` DISABLE KEYS */;
INSERT INTO `JOURNEY` VALUES ('Goa','Maldives',1562,'IKEA','RGI Airport'),('Telangana','India',1237,'Inorbit','RGI Airport'),('Karnataka','Canada',3842,'Kaifs','OBH'),('Goa','Maldives',5643,'OBH','RGI Airport');
/*!40000 ALTER TABLE `JOURNEY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LANDMARK`
--

DROP TABLE IF EXISTS `LANDMARK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LANDMARK` (
  `Name` varchar(30) NOT NULL,
  `Nearest_Station_Name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LANDMARK`
--

LOCK TABLES `LANDMARK` WRITE;
/*!40000 ALTER TABLE `LANDMARK` DISABLE KEYS */;
INSERT INTO `LANDMARK` VALUES ('DLF','Kaifs'),('Durgam Cheruvu','Inorbit'),('Indira Nagar','Kaifs'),('ISB','OBH'),('JC','OBH'),('Novotel','RGI Airport');
/*!40000 ALTER TABLE `LANDMARK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LUGGAGE`
--

DROP TABLE IF EXISTS `LUGGAGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LUGGAGE` (
  `P_Aadhar` bigint DEFAULT NULL,
  `C_Aadhar` bigint DEFAULT NULL,
  `V_State` varchar(20) DEFAULT NULL,
  `V_Zone` varchar(20) DEFAULT NULL,
  `V_RegNo` int DEFAULT NULL,
  `Colour` varchar(20) NOT NULL,
  `Shape` varchar(20) NOT NULL,
  `Size` varchar(20) NOT NULL,
  PRIMARY KEY (`Colour`,`Shape`,`Size`),
  KEY `P_Aadhar` (`P_Aadhar`),
  KEY `C_Aadhar` (`C_Aadhar`),
  KEY `V_State` (`V_State`,`V_Zone`,`V_RegNo`),
  CONSTRAINT `LUGGAGE_ibfk_1` FOREIGN KEY (`P_Aadhar`) REFERENCES `PASSENGER` (`Aadhar_Card_Number`) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT `LUGGAGE_ibfk_2` FOREIGN KEY (`C_Aadhar`) REFERENCES `CONDUCTOR` (`Aadhar_Card_Number`) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT `LUGGAGE_ibfk_3` FOREIGN KEY (`V_State`, `V_Zone`, `V_RegNo`) REFERENCES `VEHICLE` (`State`, `Zone`, `Vehicle_Registration`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LUGGAGE`
--

LOCK TABLES `LUGGAGE` WRITE;
/*!40000 ALTER TABLE `LUGGAGE` DISABLE KEYS */;
INSERT INTO `LUGGAGE` VALUES (554441673123,722672224241,'Telangana','India',1237,'Blue','Sphere','Large'),(197717906207,709502931626,'West Bengal','Bangladesh',5485,'Pink','Spherical','Small'),(554441673123,709502931626,'Karnataka','Canada',3842,'Red','Cuboidal','Large'),(197717906207,896080796050,'Goa','Maldives',5643,'Red','Cuboidal','Medium');
/*!40000 ALTER TABLE `LUGGAGE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MAINTAINS`
--

DROP TABLE IF EXISTS `MAINTAINS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MAINTAINS` (
  `V_State` varchar(20) NOT NULL,
  `V_Zone` varchar(20) NOT NULL,
  `V_Reg` int NOT NULL,
  `S_Aadhar` bigint NOT NULL,
  PRIMARY KEY (`V_State`,`V_Zone`,`V_Reg`,`S_Aadhar`),
  KEY `S_Aadhar` (`S_Aadhar`),
  CONSTRAINT `MAINTAINS_ibfk_1` FOREIGN KEY (`V_State`, `V_Zone`, `V_Reg`) REFERENCES `VEHICLE` (`State`, `Zone`, `Vehicle_Registration`) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT `MAINTAINS_ibfk_2` FOREIGN KEY (`S_Aadhar`) REFERENCES `SERVICE_STAFF` (`Aadhar_Card_Number`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MAINTAINS`
--

LOCK TABLES `MAINTAINS` WRITE;
/*!40000 ALTER TABLE `MAINTAINS` DISABLE KEYS */;
INSERT INTO `MAINTAINS` VALUES ('Goa','Maldives',1562,493558319199),('Hyderabad','Pakistan',5852,541565568820),('Karnataka','Canada',3842,541565568820);
/*!40000 ALTER TABLE `MAINTAINS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MODE_OF_TRANSPORT`
--

DROP TABLE IF EXISTS `MODE_OF_TRANSPORT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MODE_OF_TRANSPORT` (
  `Mode_name` varchar(20) NOT NULL,
  `Number_of_vehicles` int DEFAULT NULL,
  PRIMARY KEY (`Mode_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MODE_OF_TRANSPORT`
--

LOCK TABLES `MODE_OF_TRANSPORT` WRITE;
/*!40000 ALTER TABLE `MODE_OF_TRANSPORT` DISABLE KEYS */;
INSERT INTO `MODE_OF_TRANSPORT` VALUES ('Bus',10),('Metro',8),('Train',5);
/*!40000 ALTER TABLE `MODE_OF_TRANSPORT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PASSENGER`
--

DROP TABLE IF EXISTS `PASSENGER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PASSENGER` (
  `First_Name` varchar(20) DEFAULT NULL,
  `Middle_Name` varchar(20) DEFAULT NULL,
  `Last_Name` varchar(20) DEFAULT NULL,
  `Aadhar_Card_Number` bigint NOT NULL,
  `Age` int DEFAULT NULL,
  `Gender` char(1) DEFAULT NULL,
  `Disabilities` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Aadhar_Card_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PASSENGER`
--

LOCK TABLES `PASSENGER` WRITE;
/*!40000 ALTER TABLE `PASSENGER` DISABLE KEYS */;
INSERT INTO `PASSENGER` VALUES ('Moo','Scan','Raina',197717906207,13,'F',0),('Nanda','','Rajiv',415697139692,47,'M',0),('Nandini','Maa','Roo',417590322048,50,'F',0),('Ashok','Kumar','Das',436436416007,169,'F',1),('Anuhya','','Nallapati',554441673123,19,'F',1),('Abhijeeth','Abhihara','Singam',678711864674,99,'M',0),('Doing','Your','Mom',705033851846,300,'M',0),('Orghoe','','Roy',773234944528,13,'F',1),('Jaikar','Sai','Muppidi',969934494597,69,'F',1),('Raghav','Raj','Dwivedi',978543512574,98,'F',1);
/*!40000 ALTER TABLE `PASSENGER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PASS_PREF`
--

DROP TABLE IF EXISTS `PASS_PREF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PASS_PREF` (
  `P_Aadhar` bigint NOT NULL,
  `MOT_Pref` varchar(20) NOT NULL,
  PRIMARY KEY (`P_Aadhar`,`MOT_Pref`),
  CONSTRAINT `PASS_PREF_ibfk_1` FOREIGN KEY (`P_Aadhar`) REFERENCES `PASSENGER` (`Aadhar_Card_Number`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PASS_PREF`
--

LOCK TABLES `PASS_PREF` WRITE;
/*!40000 ALTER TABLE `PASS_PREF` DISABLE KEYS */;
INSERT INTO `PASS_PREF` VALUES (197717906207,'Metro'),(417590322048,'Metro'),(436436416007,'Bus'),(773234944528,'Bus'),(978543512574,'Train');
/*!40000 ALTER TABLE `PASS_PREF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SERVICE_STAFF`
--

DROP TABLE IF EXISTS `SERVICE_STAFF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SERVICE_STAFF` (
  `First_Name` varchar(20) DEFAULT NULL,
  `Middle_Name` varchar(20) DEFAULT NULL,
  `Last_Name` varchar(20) DEFAULT NULL,
  `Aadhar_Card_Number` bigint NOT NULL,
  `Service_Start_Date` date DEFAULT NULL,
  `Gender` char(1) DEFAULT NULL,
  `Responsibility` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Aadhar_Card_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SERVICE_STAFF`
--

LOCK TABLES `SERVICE_STAFF` WRITE;
/*!40000 ALTER TABLE `SERVICE_STAFF` DISABLE KEYS */;
INSERT INTO `SERVICE_STAFF` VALUES ('Abhinav','','Marri',449047835384,'2004-02-19','F','Cleaning'),('Revanth','Kumar','Gundam',493558319199,'2000-09-09','M','Cleaning'),('Pari','Tea','Prasad',541565568820,'2010-03-15','F','Repair'),('Mom','Being','Done',828781738881,'2000-03-05','M','Routine Checkup'),('Oggy','And','Cockroach',833907098770,'2020-08-08','F','Routine Checkup'),('Pranav','Sai','Muppidi',936290338338,'2022-12-06','M','Cleaning'),('P','K','Giri',939827769745,'2022-12-09','M','Repair'),('Dor','E','Tos',999999999999,'2021-11-11','F','Cleaning');
/*!40000 ALTER TABLE `SERVICE_STAFF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SS_VEHICLE_TYPE`
--

DROP TABLE IF EXISTS `SS_VEHICLE_TYPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SS_VEHICLE_TYPE` (
  `SS_Aadhar` bigint NOT NULL,
  `Vehicle_Type` varchar(20) NOT NULL,
  PRIMARY KEY (`SS_Aadhar`,`Vehicle_Type`),
  CONSTRAINT `SS_VEHICLE_TYPE_ibfk_1` FOREIGN KEY (`SS_Aadhar`) REFERENCES `SERVICE_STAFF` (`Aadhar_Card_Number`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SS_VEHICLE_TYPE`
--

LOCK TABLES `SS_VEHICLE_TYPE` WRITE;
/*!40000 ALTER TABLE `SS_VEHICLE_TYPE` DISABLE KEYS */;
INSERT INTO `SS_VEHICLE_TYPE` VALUES (493558319199,'Bus'),(541565568820,'Metro'),(541565568820,'Train'),(936290338338,'Bus'),(999999999999,'Metro');
/*!40000 ALTER TABLE `SS_VEHICLE_TYPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STATION`
--

DROP TABLE IF EXISTS `STATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `STATION` (
  `Name` varchar(30) NOT NULL,
  `Nearest_Landmark` varchar(30) DEFAULT NULL,
  `Type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STATION`
--

LOCK TABLES `STATION` WRITE;
/*!40000 ALTER TABLE `STATION` DISABLE KEYS */;
INSERT INTO `STATION` VALUES ('IKEA','Durgam Cheruvu','Metro'),('Inorbit','Durgam Cheruvu','Bus'),('Kaifs','DLF','Bus'),('OBH','DLF','Bus'),('RGI Airport','Novotel','Train');
/*!40000 ALTER TABLE `STATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TICKET`
--

DROP TABLE IF EXISTS `TICKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TICKET` (
  `Seat_Number` int NOT NULL,
  `Mode_of_Transport` varchar(20) DEFAULT NULL,
  `Vehicle_Registration_Number` int DEFAULT NULL,
  `Start_Point_Station` varchar(30) DEFAULT NULL,
  `End_Point_Station` varchar(30) DEFAULT NULL,
  `Time` timestamp NULL DEFAULT NULL,
  `Price` int DEFAULT NULL,
  `C_Aadhar` bigint DEFAULT NULL,
  `P_Aadhar` bigint DEFAULT NULL,
  PRIMARY KEY (`Seat_Number`),
  KEY `P_Aadhar` (`P_Aadhar`),
  KEY `C_Aadhar` (`C_Aadhar`),
  CONSTRAINT `TICKET_ibfk_1` FOREIGN KEY (`P_Aadhar`) REFERENCES `PASSENGER` (`Aadhar_Card_Number`) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT `TICKET_ibfk_2` FOREIGN KEY (`C_Aadhar`) REFERENCES `CONDUCTOR` (`Aadhar_Card_Number`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TICKET`
--

LOCK TABLES `TICKET` WRITE;
/*!40000 ALTER TABLE `TICKET` DISABLE KEYS */;
INSERT INTO `TICKET` VALUES (13,'Bus',1237,'Inorbit','RGI Airport','2021-03-03 05:41:11',23,854012895511,436436416007),(23,'Bus',1237,'Inorbit','RGI Airport','2022-12-28 18:45:00',35,722672224241,554441673123),(31,'Train',5643,'OBH','RGI Airport','2022-12-09 08:50:00',300,896080796050,197717906207),(32,'Train',3842,'Kaifs','OBH','2022-10-18 20:45:00',12,709502931626,554441673123),(40,'Bus',1562,'IKEA','RGI Airport','2022-11-26 19:25:26',15,413007283401,197717906207);
/*!40000 ALTER TABLE `TICKET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VEHICLE`
--

DROP TABLE IF EXISTS `VEHICLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VEHICLE` (
  `Transport_Type` varchar(20) DEFAULT NULL,
  `Max_Speed` int DEFAULT NULL,
  `State` varchar(20) NOT NULL,
  `Zone` varchar(20) NOT NULL,
  `Vehicle_Registration` int NOT NULL,
  `Number_of_seats_for_general_category` int DEFAULT NULL,
  `Number_of_seats_for_women` int DEFAULT NULL,
  `Number_of_seats_for_people_with_disabilities` int DEFAULT NULL,
  PRIMARY KEY (`State`,`Zone`,`Vehicle_Registration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VEHICLE`
--

LOCK TABLES `VEHICLE` WRITE;
/*!40000 ALTER TABLE `VEHICLE` DISABLE KEYS */;
INSERT INTO `VEHICLE` VALUES ('Bus',69,'Goa','Maldives',1562,50,10,5),('Train',4858,'Goa','Maldives',5643,200,50,10),('Metro',696,'Hyderabad','Pakistan',5852,100,0,0),('Bus',89,'Karnataka','Canada',3453,25,5,1),('Train',77,'Karnataka','Canada',3842,100,0,0),('Bus',143,'Telangana','India',1237,30,10,2),('Metro',410,'West Bengal','Bangladesh',5485,250,10,10);
/*!40000 ALTER TABLE `VEHICLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WORKS_WITH`
--

DROP TABLE IF EXISTS `WORKS_WITH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WORKS_WITH` (
  `D_ID` int NOT NULL,
  `C_ID` bigint NOT NULL,
  PRIMARY KEY (`C_ID`,`D_ID`),
  KEY `D_ID` (`D_ID`),
  CONSTRAINT `WORKS_WITH_ibfk_1` FOREIGN KEY (`D_ID`) REFERENCES `DRIVER` (`Drivers_License_ID_Number`) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT `WORKS_WITH_ibfk_2` FOREIGN KEY (`C_ID`) REFERENCES `CONDUCTOR` (`Aadhar_Card_Number`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WORKS_WITH`
--

LOCK TABLES `WORKS_WITH` WRITE;
/*!40000 ALTER TABLE `WORKS_WITH` DISABLE KEYS */;
INSERT INTO `WORKS_WITH` VALUES (22431711,709502931626),(22431711,896080796050),(40449984,534494226931),(46340512,854012895511),(77663296,854012895511);
/*!40000 ALTER TABLE `WORKS_WITH` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-27 12:51:51
