-- MySQL dump 10.13  Distrib 5.7.10, for Win64 (x86_64)
--
-- Host: localhost    Database: freelanzers
-- ------------------------------------------------------
-- Server version	5.7.10-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ad`
--

DROP TABLE IF EXISTS `ad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ad` (
  `adid` int(5) NOT NULL AUTO_INCREMENT,
  `eid` int(5) DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `field` int(3) DEFAULT NULL,
  `title` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`adid`),
  KEY `fk1` (`eid`),
  KEY `fk2` (`field`),
  CONSTRAINT `fk1` FOREIGN KEY (`eid`) REFERENCES `hirer` (`eid`),
  CONSTRAINT `fk2` FOREIGN KEY (`field`) REFERENCES `work fields` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad`
--

LOCK TABLES `ad` WRITE;
/*!40000 ALTER TABLE `ad` DISABLE KEYS */;
INSERT INTO `ad` VALUES (1,1,'2016-02-13','2016-04-01','Intern for our company',3,'Intern'),(2,1,'2016-02-13','2016-04-01','GR for our company',1,'job'),(3,1,'2016-03-02','2016-03-30','for our tema in indore',6,'management'),(4,1,'2016-03-01','2016-03-24','a cook is needed as soon as possible',4,'help needed'),(5,1,'2016-03-22','2016-06-22','cook at home',4,'job'),(6,1,'2016-05-13','2016-05-29','need a java programmer',1,'needed');
/*!40000 ALTER TABLE `ad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applied_ads`
--

DROP TABLE IF EXISTS `applied_ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applied_ads` (
  `adid` int(5) DEFAULT NULL,
  `eid` int(5) DEFAULT NULL,
  `rid` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applied_ads`
--

LOCK TABLES `applied_ads` WRITE;
/*!40000 ALTER TABLE `applied_ads` DISABLE KEYS */;
INSERT INTO `applied_ads` VALUES (1,1,1),(2,1,1),(1,1,2),(1,1,3),(3,1,1),(4,1,1),(5,1,1),(4,1,1),(1,1,1),(6,1,1),(1,1,1);
/*!40000 ALTER TABLE `applied_ads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates`
--

DROP TABLE IF EXISTS `certificates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificates` (
  `rid` int(5) DEFAULT NULL,
  `description` varchar(60) DEFAULT NULL,
  `certified_by` varchar(50) DEFAULT NULL,
  KEY `rid` (`rid`),
  CONSTRAINT `certificates_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `resource` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates`
--

LOCK TABLES `certificates` WRITE;
/*!40000 ALTER TABLE `certificates` DISABLE KEYS */;
INSERT INTO `certificates` VALUES (1,'hacker','lucideus');
/*!40000 ALTER TABLE `certificates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employer`
--

DROP TABLE IF EXISTS `employer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employer` (
  `eid` int(5) NOT NULL AUTO_INCREMENT,
  `ename` varchar(50) DEFAULT NULL,
  `contact` varchar(12) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employer`
--

LOCK TABLES `employer` WRITE;
/*!40000 ALTER TABLE `employer` DISABLE KEYS */;
INSERT INTO `employer` VALUES (1,'ayushi vijayvargi','8889','58,Brijeshwari','ayu','1234','aweesome','ayu.2050@gmaail.com'),(2,'BJ Films','7869681506','Kandhivali,Mumbai','bjfilms','bjfilms','bjfilms@gmail.com',NULL),(3,'Rajaram','7869681986','Indore,India','hareram','hareram','rajaram@gmail.com',NULL),(4,'Humserve Solutions','7869681901','Bhopal','humserve','humserve','humsserve@gmail.com',NULL),(5,'Humserve Solutions','7869681901','Bhopal','humserve','humserve','humsserve@gmail.com',NULL),(6,'wewew','54334','erwe','maya','maya','m@gmail.com',NULL),(7,'Nakulesh','8989895544','brijeshwari','nakul','nakul123','nakul@gmail.com',NULL),(8,'Megha Agrawal','9893314294','kalani nagar','megha','agrawal','megha@gmail.com',NULL);
/*!40000 ALTER TABLE `employer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `freelancer`
--

DROP TABLE IF EXISTS `freelancer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `freelancer` (
  `rid` int(5) NOT NULL AUTO_INCREMENT,
  `rname` varchar(50) DEFAULT NULL,
  `rcontact` varchar(12) DEFAULT NULL,
  `raddress` varchar(100) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `work field` varchar(30) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `freelancer`
--

LOCK TABLES `freelancer` WRITE;
/*!40000 ALTER TABLE `freelancer` DISABLE KEYS */;
INSERT INTO `freelancer` VALUES (1,'Mayank Vijayvargiya','9893152964','bilavali','mayank7','mayank7','1995-12-14','indore','Programmer','mayank@gmail.com'),(2,'Krutika Joshi','9575760930','shalimar','groot','groot','1995-07-14','indore','Cook','krutika@gmail.com'),(3,'Megha Agrawal','9893314294','Aerodrum road','megha','mugs','1995-09-13','indore','Radio Jockey','megha@gmail.com'),(4,'Suresh Kala','9827314294','kila maidan','Suresh','suresh bhai','1987-05-15','khandwa','gardener',NULL),(5,'Rajesh Patel','9826544294','Lokmanya nagar','Patol Babu','kalakepremi','1980-11-19','Mhow','Actor','kalakaar@gmail.com'),(6,'Ritik Goswami','7879883367','Kolar road','ritik','7879','1985-06-17','Bhopal','Driver',NULL),(7,'Ram Singh','9899883367','Bhanwar Kuan','Ram','ram3367','1978-07-12','Indore','Carpenter',NULL),(8,'Anuj Mehta','9894563367','M.G. Road','Anuj','ahem264','1993-01-16','Pune','Marketing Associate','anuj@gmail.com'),(9,'Rahul Agrawal','7760267456','64,Maulana Road','Rahul','rahuliit27','1992-08-12','Hyderabad','Software Engineer','rahul@gmail.com'),(10,'Divyansh Sharma','7760569456','sector 74','Divyansh','5678','1988-02-12','Gwalior','Property dealer','divyansh@gmail.com'),(11,'Kavita Diwan','7898561236','Dhamtari Road','Kavita','Diwank','1996-05-14','Raipur','Animation Designer','diwan@gmail.com'),(12,'Kabir Thapar','9856412345','Udyog Bhavan ','Kabira','Bunny','1992-06-25','Gujarat','Hospitality Manager','diwan@gmail.com'),(13,'Dr. Suneel Malpani','7760278945','Basant vihar ','Suneel','Ethereal','1970-03-21','Indore','Dermatologist','suneel@gmail.com'),(14,'Sagar Kukreja','8564532894','Daulatganj ','Sunny','jai mahankal','1995-09-15','Ujjain','Electronics Engineer','sagar@gmail.com'),(15,'Anita Gupta','9425014956','Shankar Bagh ','Anita','vinita','1990-06-28','Bhopal','Fitness Expert','anita@gmail.com'),(16,'Arjun Kapoor','7756289564','Kandoli ','Arjun','gantavya','1988-07-16','Dehradun','Radio Jockey','arjun@gmail.com'),(17,'Aman Gupta','9893614296','Kora Mangala','Aman','ak47','1995-08-12','Bengaluru','Dancer','aman@gmail.com'),(18,'Reena Dsouza','8889945612','Gomti Nagar ','Reena','blessall','1989-04-18','Lucknow','Nurse','reena@gmail.com'),(19,'Mohit Akhtar','926033656','Dehmi Kalan','Mohit','chouhan','1994-12-31','Jaipur','Pathologist','mohit@gmail.com'),(20,'Malini Gandhi','7777865234','Nepean Sea Road','Malini','Gandhi','1987-10-09','Bombay','Website Designer','malini@gmail.com');
/*!40000 ALTER TABLE `freelancer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hirer`
--

DROP TABLE IF EXISTS `hirer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hirer` (
  `eid` int(5) NOT NULL AUTO_INCREMENT,
  `ename` varchar(50) DEFAULT NULL,
  `contact` varchar(12) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hirer`
--

LOCK TABLES `hirer` WRITE;
/*!40000 ALTER TABLE `hirer` DISABLE KEYS */;
INSERT INTO `hirer` VALUES (1,'Ayushi Vijayvargiya','8889956456','58,Brijeshwari','ayu','1234567','ayu.2050@gmail.com','Need a carpenter'),(2,'BJ Films','7869681506','Kandhivali,Mumbai','bjfilms','bjfilms','bjfilms@gmail.com','Need actors'),(3,'Rajaram','7869681986','Indore,India','hareram','hareram','rajaram@gmail.com','Need programmer'),(4,'Humserve Solutions','7869681901','Bhopal','humserve','humserve','humsserve@gmail.com','Need a marketing staff'),(5,'Parth Jain','7895658964','87,Pricanco Colony','Parth','jain456','parth.jain@gmail.com','need a cook urgently'),(6,'Kinsage Education','9827012345','Palasia,Indore','Kinsage','Kingsman','info@kinsage.com','Hiring computer and foreign language experts'),(7,'Mukta Infotech','8287012345','Puna','MuktaInfo','Crystal125','mukta@crystalpuna.co','Summer Internships Offered for Engineers'),(8,'ZICA Institute','9985012345','Noida','ZICA','Z_creative','design@zica.com','Photoshop trainers and Excellent designing trainers'),(9,'Suyash Shrivastav','8265312345','Bangalore','Su','Sushrivas','su.shrivastav@gmail.','Need a driver'),(10,'Lions Club','9893365412','Gwalior','LClub','Lion','info.lclub@gmail.com','Need a hall for an event every month.Anybody with luxurious farm house or anything of that sort leave a mail.'),(11,'Chandra Kumar Jain','9827085642','265,Aerodrum road,Indore','ckjain','akhil','jain.ck@gmail.com','need a personal assistant for a civil engineer'),(12,'Allen Career Institute','9827056942','65,park road,Kota','Allen','we_are_the_best','info@allen.com','hiring teachers and management staff for new centres across the country'),(13,'Raj Motwani','9827256942','6 Bungalows,Hyderabad','Raj','cricket_forever','rmotwani@gmail.com','a personal trainer and coach for cricket needed.'),(14,'Apollo Hospitals','9827212342','Bypass Indore','Apollo','mission','indore@apollo.com','hiring well informed and trained personnels for all sorts of hospital staff'),(15,'Radisson Blue','9427215642','Bangalore','RadBanglore','Blu','indore@blu.com','vacancy for the post of management staff and gardener'),(16,'Radio Mirchi','8982215642','Mumbai','Mirchi','ItsHot','mumbai@mirchi.com','Hiring Rjs'),(17,'PVR Cinemas','8982656789','Ujjain','PVRujjain','jaimahankal','ujjain@pvr.com','specialists and engineers apply for jobs pertaining to reel application and projector handling'),(18,'Maruti Suzuki','8889445612','Jabalpur','Suzuki','go for suzuki','amit@maruti.co.in','customer care and enquiry officer posts are vacant for application'),(19,'Barbarian Gym','8459445612','Indore','Barbarian','health=wealth','indore@barbarian.com','Aerobics and Zumba trainer required'),(20,'Prachi Agrawal','9899445612','Delhi','Prachi','LondonDreams','prachi@gmail.com','Computer expert needed for repairing jobs');
/*!40000 ALTER TABLE `hirer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource`
--

DROP TABLE IF EXISTS `resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource` (
  `rid` int(5) NOT NULL AUTO_INCREMENT,
  `rname` varchar(50) DEFAULT NULL,
  `rcontact` varchar(12) DEFAULT NULL,
  `raddress` varchar(100) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `work field` varchar(30) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource`
--

LOCK TABLES `resource` WRITE;
/*!40000 ALTER TABLE `resource` DISABLE KEYS */;
INSERT INTO `resource` VALUES (1,'Mayank','9893152964','bilavali','mayank7','mayank7','1995-12-14','indore','Programmer','mayank@gmail.com'),(2,'Krutika','9575760930','shalimar','groot','groot','1995-07-14','indore','Cook','krutika@gmail.com'),(3,'mustu','9897969594','navlakha','mustu','mustu','1995-01-12','indore','Programmer','mustafa@gmail.com'),(4,'Mayank Vijayvargiya','8989895544','58,Brijeshwari Extension,Pipliahana','mayank','mayank',NULL,NULL,NULL,'mayank7@gmail.com'),(5,'krutika','9876543210','paris','krutika14','krutika14',NULL,NULL,NULL,'krutika@sgsits.com');
/*!40000 ALTER TABLE `resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill`
--

DROP TABLE IF EXISTS `skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skill` (
  `rid` int(5) DEFAULT NULL,
  `skills` varchar(40) DEFAULT NULL,
  KEY `rid` (`rid`),
  CONSTRAINT `skill_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `resource` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill`
--

LOCK TABLES `skill` WRITE;
/*!40000 ALTER TABLE `skill` DISABLE KEYS */;
INSERT INTO `skill` VALUES (1,'C++');
/*!40000 ALTER TABLE `skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work fields`
--

DROP TABLE IF EXISTS `work fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work fields` (
  `id` int(3) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work fields`
--

LOCK TABLES `work fields` WRITE;
/*!40000 ALTER TABLE `work fields` DISABLE KEYS */;
INSERT INTO `work fields` VALUES (0,'No Particular Field'),(1,'Programmer'),(2,'Android App developer'),(3,'Website designer'),(4,'Cook'),(5,'Maid'),(6,'Analyst'),(7,'carpenter'),(8,'actor'),(9,'Civil Engineer'),(10,'Driver'),(11,'Property Broker'),(12,'Researcher'),(13,'Hardware expert'),(14,'Ethical Hacker'),(15,'Marketing assosiate'),(16,'Property Dealer'),(17,'Software engineer'),(18,'Animation Designer'),(19,'Fashion Designer'),(20,'Photographer'),(21,'Theatre Artist'),(22,'assistant civil engineer'),(23,'Teacher'),(24,'Manager'),(25,'Cricket Coach'),(26,'Doctor'),(27,'Nurse'),(28,'Receptionist'),(29,'Pathologist'),(30,'Hospitality Manager'),(31,'Gardener'),(32,'Radio Jockey'),(33,'Fitness Expert'),(34,'Dancer');
/*!40000 ALTER TABLE `work fields` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-24 21:36:21
