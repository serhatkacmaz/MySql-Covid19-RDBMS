-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ncovid19
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `adresler`
--

DROP TABLE IF EXISTS `adresler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adresler` (
  `adres_id` int NOT NULL,
  `sokak` varchar(45) DEFAULT NULL,
  `mahalle` varchar(45) DEFAULT NULL,
  `cadde` varchar(45) DEFAULT NULL,
  `bina_no` varchar(5) DEFAULT NULL,
  `daire_no` varchar(5) DEFAULT NULL,
  `il` varchar(20) DEFAULT NULL,
  `ilce` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`adres_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adresler`
--

LOCK TABLES `adresler` WRITE;
/*!40000 ALTER TABLE `adresler` DISABLE KEYS */;
INSERT INTO `adresler` VALUES (1,'Hayat','Akın','Atatürk','6','10','İstanbul','Kartal'),(2,'Cennet','Akın','Hayat','68','2','İstanbul','Maltepe'),(3,'Cennet','Hayat','Cemal','10','11','İstambul','Kadıköy'),(4,'Cemal','Cennet','Atatürk','12','4','İstanbul','Kartal'),(5,'Atatürk','Cennet','Hayat','15','7','Ankara','Kızılay'),(6,'Gül','Bulut','Cennet','91','8','Ankara','Mamak'),(7,'Kaldırım','Yangın','Atatürk','84','16','Ankara','Keçiören'),(8,'Bahadır','Manço','Işık','64','10','Adana','Çukurova'),(9,'Hayat','Atatürk','Atatürk','78','3','Adana','Cukurova'),(10,'Hastane','Hastane','İçerenköy','1A','18','İstanbul','Ataşehir'),(11,'Güney','Cevizli','D-100','47','-','İstanbul','Kartal'),(12,'Kemal Türkler','Yenibaraj','Osman Gazi','23/A','3478','Adana','Seyhan'),(13,'Bilkent','Üniversiteler','1604','9','106','Ankara','Çankaya');
/*!40000 ALTER TABLE `adresler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `belirtiler`
--

DROP TABLE IF EXISTS `belirtiler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `belirtiler` (
  `belirti_id` int NOT NULL,
  `belirti_adi` varchar(45) NOT NULL,
  PRIMARY KEY (`belirti_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `belirtiler`
--

LOCK TABLES `belirtiler` WRITE;
/*!40000 ALTER TABLE `belirtiler` DISABLE KEYS */;
INSERT INTO `belirtiler` VALUES (1,'Ateş'),(2,'Kuru öksürük'),(3,'Yorgunluk'),(4,'Boğaz ağrısı'),(5,'İshal'),(6,'Ağrı ve sızı'),(7,'Baş ağrısı'),(8,'Solunum güçlüğü veya nefes darlığı'),(9,'Göğüs ağrısı veya göğüste baskı'),(10,'Konuşma veya hareket kaybı');
/*!40000 ALTER TABLE `belirtiler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hastabelirtileri`
--

DROP TABLE IF EXISTS `hastabelirtileri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hastabelirtileri` (
  `hasta_no` int NOT NULL,
  `belirti_id` int NOT NULL,
  KEY `FK_BelirtiHastabelirti` (`belirti_id`),
  KEY `FK_HastaHastabelirti` (`hasta_no`),
  CONSTRAINT `FK_BelirtiHastabelirti` FOREIGN KEY (`belirti_id`) REFERENCES `belirtiler` (`belirti_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_HastaHastabelirti` FOREIGN KEY (`hasta_no`) REFERENCES `hastalar` (`hasta_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hastabelirtileri`
--

LOCK TABLES `hastabelirtileri` WRITE;
/*!40000 ALTER TABLE `hastabelirtileri` DISABLE KEYS */;
INSERT INTO `hastabelirtileri` VALUES (1,4),(1,5),(1,6),(2,1),(2,7),(1,9),(3,2),(3,4),(4,9),(5,2),(5,4),(6,2),(6,3),(7,8),(7,2),(7,7),(9,6),(9,2),(9,4),(2,5);
/*!40000 ALTER TABLE `hastabelirtileri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hastailaclari`
--

DROP TABLE IF EXISTS `hastailaclari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hastailaclari` (
  `hasta_no` int NOT NULL,
  `ilac_kodu` varchar(3) NOT NULL,
  KEY `FK_ilaclarHastailac` (`ilac_kodu`),
  KEY `FK_HastalarHastailac` (`hasta_no`),
  CONSTRAINT `FK_HastalarHastailac` FOREIGN KEY (`hasta_no`) REFERENCES `hastalar` (`hasta_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ilaclarHastailac` FOREIGN KEY (`ilac_kodu`) REFERENCES `ilaclar` (`ilac_kodu`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hastailaclari`
--

LOCK TABLES `hastailaclari` WRITE;
/*!40000 ALTER TABLE `hastailaclari` DISABLE KEYS */;
INSERT INTO `hastailaclari` VALUES (1,'Fvp'),(2,'Hdr'),(2,'Prl'),(3,'Rdx'),(4,'Ocv'),(7,'Fvp'),(9,'Lpn'),(9,'Prl');
/*!40000 ALTER TABLE `hastailaclari` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hastalar`
--

DROP TABLE IF EXISTS `hastalar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hastalar` (
  `hasta_no` int NOT NULL,
  `ad` varchar(20) NOT NULL,
  `soyad` varchar(25) NOT NULL,
  `tc_no` varchar(11) NOT NULL,
  `yas` int NOT NULL,
  `telefon` varchar(11) NOT NULL,
  `cinsiyet` varchar(1) NOT NULL,
  `adres_id` int NOT NULL,
  `hastane_id` int NOT NULL,
  `tedavidurum_id` int NOT NULL,
  PRIMARY KEY (`hasta_no`),
  UNIQUE KEY `tc_no` (`tc_no`),
  UNIQUE KEY `telefon` (`telefon`),
  KEY `FK_AdresHasta` (`adres_id`),
  KEY `Fk_TedaviHasta` (`tedavidurum_id`),
  KEY `FK_HasteneHasta` (`hastane_id`),
  CONSTRAINT `FK_AdresHasta` FOREIGN KEY (`adres_id`) REFERENCES `adresler` (`adres_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_HasteneHasta` FOREIGN KEY (`hastane_id`) REFERENCES `hastaneler` (`hastane_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk_TedaviHasta` FOREIGN KEY (`tedavidurum_id`) REFERENCES `tedavidurumlari` (`tedavidurum_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hastalar`
--

LOCK TABLES `hastalar` WRITE;
/*!40000 ALTER TABLE `hastalar` DISABLE KEYS */;
INSERT INTO `hastalar` VALUES (1,'Kemal','Alık','11111111111',25,'5078891245','e',1,1,2),(2,'Barış','Yanar','11111111112',50,'5078856225','e',2,2,2),(3,'Ayşe','Karpuz','11111111113',17,'5078891136','k',3,1,3),(4,'Fatma','Kabak','11111111118',15,'5656891245','k',4,2,2),(5,'Tarık','Öz','11111111114',44,'5079894655','e',5,4,1),(6,'İbrahim','Tekin','11111111115',29,'5078812366','e',6,4,1),(7,'Ömer','Bacak','11111111116',35,'5078845678','e',7,4,1),(9,'Semih','Yalan','11111111119',33,'5075669954','e',9,3,3);
/*!40000 ALTER TABLE `hastalar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hastaneler`
--

DROP TABLE IF EXISTS `hastaneler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hastaneler` (
  `hastane_id` int NOT NULL,
  `adi` varchar(45) NOT NULL,
  `telefon` varchar(11) NOT NULL,
  `adres_id` int NOT NULL,
  PRIMARY KEY (`hastane_id`),
  UNIQUE KEY `adres_id` (`adres_id`),
  CONSTRAINT `FK_AdresHastane` FOREIGN KEY (`adres_id`) REFERENCES `adresler` (`adres_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hastaneler`
--

LOCK TABLES `hastaneler` WRITE;
/*!40000 ALTER TABLE `hastaneler` DISABLE KEYS */;
INSERT INTO `hastaneler` VALUES (1,'Fatih Sultan Mehmet Hastanesi','02164478941',10),(2,'Kartal Araştırma Hastanesi','02164447535',11),(3,'Çukurova Üniversitesi Tıp Fakültesi Hastanesi','02164447535',12),(4,'Ankara Şehir Hastanesi','02164445685',13);
/*!40000 ALTER TABLE `hastaneler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hastatestleri`
--

DROP TABLE IF EXISTS `hastatestleri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hastatestleri` (
  `hastatest_id` int NOT NULL,
  `hasta_no` int NOT NULL,
  `test_id` int NOT NULL,
  `test_tarihi` date NOT NULL,
  PRIMARY KEY (`hastatest_id`),
  KEY `FK_TestlerHastatesler` (`test_id`),
  KEY `FK_HastaHastatestler` (`hasta_no`),
  CONSTRAINT `FK_HastaHastatestler` FOREIGN KEY (`hasta_no`) REFERENCES `hastalar` (`hasta_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TestlerHastatesler` FOREIGN KEY (`test_id`) REFERENCES `testler` (`test_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hastatestleri`
--

LOCK TABLES `hastatestleri` WRITE;
/*!40000 ALTER TABLE `hastatestleri` DISABLE KEYS */;
INSERT INTO `hastatestleri` VALUES (1,1,1,'2021-04-10'),(2,2,1,'2021-04-10'),(3,3,1,'2021-04-11'),(4,4,1,'2021-04-11'),(5,4,3,'2021-04-11'),(6,5,1,'2021-04-09'),(7,6,1,'2021-04-09'),(8,7,1,'2021-04-09'),(9,7,2,'2021-04-09'),(11,9,2,'2021-04-10'),(12,9,3,'2021-04-10');
/*!40000 ALTER TABLE `hastatestleri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ilaclar`
--

DROP TABLE IF EXISTS `ilaclar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ilaclar` (
  `ilac_kodu` varchar(3) NOT NULL,
  `ilac_adi` varchar(60) NOT NULL,
  PRIMARY KEY (`ilac_kodu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ilaclar`
--

LOCK TABLES `ilaclar` WRITE;
/*!40000 ALTER TABLE `ilaclar` DISABLE KEYS */;
INSERT INTO `ilaclar` VALUES ('Fvp','Favipiravir 200 mg Tablet'),('Hdr','Hı̇droksı̇klorokı̇n Sülfat 200 mg Film Tablet'),('Lpn','Lopı̇navı̇r 200 mg/Rı̇tonavı̇r 50 mg Fı̇lm Tablet'),('Ocv','Ocean'),('Osl','Oseltamivir 75 mg Sert Kapsül'),('Prl','Parol (parasetamol)'),('Rdx','Redoxon');
/*!40000 ALTER TABLE `ilaclar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tedavidurumlari`
--

DROP TABLE IF EXISTS `tedavidurumlari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tedavidurumlari` (
  `tedavidurum_id` int NOT NULL,
  `durum_adi` varchar(30) NOT NULL,
  PRIMARY KEY (`tedavidurum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tedavidurumlari`
--

LOCK TABLES `tedavidurumlari` WRITE;
/*!40000 ALTER TABLE `tedavidurumlari` DISABLE KEYS */;
INSERT INTO `tedavidurumlari` VALUES (1,'Covid Değil'),(2,'İyileşti'),(3,'Vefat Etti'),(4,'Tedavi Devam Ediyor'),(5,'Test Devam Ediyor');
/*!40000 ALTER TABLE `tedavidurumlari` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testler`
--

DROP TABLE IF EXISTS `testler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testler` (
  `test_id` int NOT NULL,
  `test_adi` varchar(15) NOT NULL,
  PRIMARY KEY (`test_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testler`
--

LOCK TABLES `testler` WRITE;
/*!40000 ALTER TABLE `testler` DISABLE KEYS */;
INSERT INTO `testler` VALUES (1,'PCR Testi'),(2,'Antikor Testi'),(3,'Akciğer Testi');
/*!40000 ALTER TABLE `testler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testsonuclar`
--

DROP TABLE IF EXISTS `testsonuclar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testsonuclar` (
  `sonuc_id` int NOT NULL,
  `test_sonuc` varchar(7) NOT NULL,
  `hastatest_id` int NOT NULL,
  PRIMARY KEY (`sonuc_id`),
  KEY `FK_HastatestlerTestSonuc` (`hastatest_id`),
  CONSTRAINT `FK_HastatestlerTestSonuc` FOREIGN KEY (`hastatest_id`) REFERENCES `hastatestleri` (`hastatest_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testsonuclar`
--

LOCK TABLES `testsonuclar` WRITE;
/*!40000 ALTER TABLE `testsonuclar` DISABLE KEYS */;
INSERT INTO `testsonuclar` VALUES (1,'pozitif',1),(2,'pozitif',2),(3,'pozitif',3),(4,'pozitif',4),(5,'pozitif',5),(6,'negatif',6),(7,'negatif',7),(8,'pozitif',8),(9,'negatif',9),(11,'negatif',11),(12,'pozitif',12);
/*!40000 ALTER TABLE `testsonuclar` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-16 18:07:39
