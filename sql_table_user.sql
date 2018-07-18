/*
SQLyog v10.2 
MySQL - 5.5.37 : Database - test
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`test` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `test`;

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) DEFAULT NULL,
  `user_tel` varchar(20) DEFAULT NULL,
  `user_sex` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`user_id`,`user_name`,`user_tel`,`user_sex`) values (1,'lewis','12345','男'),(7,'zhanggong','35435','man'),(8,'zhanggong','12345678','man'),(9,'125','21421441','man'),(10,'dsfa','2313','woman'),(11,'ffa','231','a'),(12,'2313','11','男'),(13,'二手房',NULL,'男'),(14,'奇热网群','32342','男'),(15,'123','32342','男'),(16,'123','3234212','男'),(17,'宏观经济控股','98','男'),(18,'宏观经济控股','98','男'),(19,'而我却若','4234','男'),(20,'12','12','男'),(21,'二手房','2133','男'),(22,'zhanggong','23424','男'),(23,'刘国庆','1234','男'),(24,'二手房','sfa ','男'),(25,'grg','ewrg','男'),(26,'wer','qweq','男');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
