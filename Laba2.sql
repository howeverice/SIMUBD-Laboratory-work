-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: polyclinicdb
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `departament`
--

DROP TABLE IF EXISTS `departament`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departament` (
  `iddepartament` int NOT NULL,
  `departament_name` varchar(45) NOT NULL,
  `floor` varchar(45) NOT NULL,
  `room_number` varchar(45) NOT NULL,
  `full_name_head` varchar(45) NOT NULL,
  PRIMARY KEY (`iddepartament`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departament`
--

LOCK TABLES `departament` WRITE;
/*!40000 ALTER TABLE `departament` DISABLE KEYS */;
INSERT INTO `departament` VALUES (1,'городская клиническая больница','4','422','хирургрия'),(2,'городская клиничская больница ','5','501','нервология'),(3,'городская клиничская больница','4','412','хирургия'),(4,'районная клиничская больница','3','303','физиотерапическое'),(5,'районная клиничская больница','2','222','приемное отделение');
/*!40000 ALTER TABLE `departament` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `iddoctor` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `patronymic` varchar(45) NOT NULL,
  `post` varchar(45) NOT NULL,
  `work_experience` int NOT NULL,
  `scientific_title` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `deparment` int NOT NULL,
  PRIMARY KEY (`iddoctor`),
  KEY `fk_doctor_departament1_idx` (`deparment`),
  CONSTRAINT `fk_doctor_departament1` FOREIGN KEY (`deparment`) REFERENCES `departament` (`iddepartament`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,'Виктор','Бабуркин','Васильевич','главный врач',7,' кандидаты наук','Гошкевича, 21',1),(2,'Арсений','Бердюгин','Игоревич','заведующий отделением',8,'профессор','Замковая, 24',2),(3,'Мксим','Козлов','Степнович','главный врач',5,' кандидаты наук','Жукова, 5 ',3),(4,'Иван','Сабуров','Владимирович','заведующим отделением ',4,'профессор','Ильянская, 11',2),(5,'Александр','Симэнь','Сергеевич','главный врач',2,'профессор','Кнорина, 8',5),(6,'рома','бубуркин','андреевич','врач',7,'кандидат наук','Гошкевича 21',1);
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_has_medical history`
--

DROP TABLE IF EXISTS `doctor_has_medical history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_has_medical history` (
  `doctor_iddoctor` int NOT NULL,
  `medical history_idmedical_history` int NOT NULL,
  PRIMARY KEY (`doctor_iddoctor`,`medical history_idmedical_history`),
  KEY `fk_doctor_has_medical history_medical history1_idx` (`medical history_idmedical_history`),
  KEY `fk_doctor_has_medical history_doctor1_idx` (`doctor_iddoctor`),
  CONSTRAINT `fk_doctor_has_medical history_doctor1` FOREIGN KEY (`doctor_iddoctor`) REFERENCES `doctor` (`iddoctor`),
  CONSTRAINT `fk_doctor_has_medical history_medical history1` FOREIGN KEY (`medical history_idmedical_history`) REFERENCES `medical_history` (`idmedical_history`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_has_medical history`
--

LOCK TABLES `doctor_has_medical history` WRITE;
/*!40000 ALTER TABLE `doctor_has_medical history` DISABLE KEYS */;
INSERT INTO `doctor_has_medical history` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `doctor_has_medical history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical_history`
--

DROP TABLE IF EXISTS `medical_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_history` (
  `idmedical_history` int NOT NULL,
  `patient` int NOT NULL,
  `diagnosis` int NOT NULL,
  `treatment` varchar(45) NOT NULL,
  `date_disease` varchar(45) NOT NULL,
  `cure_date` varchar(45) NOT NULL,
  `type_of_treatment` varchar(45) NOT NULL,
  PRIMARY KEY (`idmedical_history`),
  KEY `fk_medical history_patients_idx` (`patient`),
  KEY `fk_medical history_service staff1_idx` (`diagnosis`),
  CONSTRAINT `fk_medical history_patients` FOREIGN KEY (`patient`) REFERENCES `patients` (`idpatients`),
  CONSTRAINT `fk_medical history_service staff1` FOREIGN KEY (`diagnosis`) REFERENCES `service_staff` (`idservice_staff`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_history`
--

LOCK TABLES `medical_history` WRITE;
/*!40000 ALTER TABLE `medical_history` DISABLE KEYS */;
INSERT INTO `medical_history` VALUES (1,2,1,'уацуа','2012-08-20','2012-08-20',' stationary'),(2,3,2,'купукп','2012-08-20','2012-08-20',' stationary');
/*!40000 ALTER TABLE `medical_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `idpatients` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `patronymic` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `age` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  PRIMARY KEY (`idpatients`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,'Витя','Евтушевский','Сергеевич','Колесникова','Минск','21','мужской'),(2,'Вова','Грошевский','Александрович','Пушкина','Минск','22','мужской'),(3,'Святик','Данилов','Федорович','Неманская','Минск','21','мужской'),(4,'Владосик','Хребтович','Иванович','Стебенева','Минск','24','мужской'),(5,'Витя','Евт','Серг','Кол','Мск','20','муж'),(6,'Витя','Евт','Серг','Кол','Мск','20','муж'),(7,'Витя','Евт','Серг','Кол','Мск','20','муж');
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_staff`
--

DROP TABLE IF EXISTS `service_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_staff` (
  `idservice_staff` int NOT NULL,
  `disease_name` varchar(45) NOT NULL,
  `signs_of_illness` varchar(45) NOT NULL,
  `treatment_period` varchar(45) NOT NULL,
  `appointment` varchar(45) NOT NULL,
  PRIMARY KEY (`idservice_staff`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_staff`
--

LOCK TABLES `service_staff` WRITE;
/*!40000 ALTER TABLE `service_staff` DISABLE KEYS */;
INSERT INTO `service_staff` VALUES (1,'рак горла','пухлость в области шеи','год','фторурацил'),(2,'алкоголизм','провалы в памяти','год','эспираль'),(3,'склероз','провалы в памяти','4 года ','копаксон'),(4,'сколеоз','искривление позвонков','5 года ','ибупрофен'),(5,'грип','боль в горле','две недели ','травокорт нео');
/*!40000 ALTER TABLE `service_staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-13 21:05:34
