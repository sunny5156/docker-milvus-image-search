/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.3.22-MariaDB-log : Database - db_milvus_image_search
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_milvus_image_search` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_milvus_image_search`;

/*Table structure for table `Environment` */

DROP TABLE IF EXISTS `Environment`;

CREATE TABLE `Environment` (
  `global_lsn` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `Fields` */

DROP TABLE IF EXISTS `Fields`;

CREATE TABLE `Fields` (
  `collection_id` varchar(255) NOT NULL,
  `field_name` varchar(255) NOT NULL,
  `field_type` int(11) NOT NULL DEFAULT 0,
  `field_params` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `TableFiles` */

DROP TABLE IF EXISTS `TableFiles`;

CREATE TABLE `TableFiles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `table_id` varchar(255) NOT NULL,
  `segment_id` varchar(255) NOT NULL,
  `engine_type` int(11) NOT NULL DEFAULT 1,
  `file_id` varchar(255) NOT NULL,
  `file_type` int(11) NOT NULL DEFAULT 0,
  `file_size` bigint(20) NOT NULL DEFAULT 0,
  `row_count` bigint(20) NOT NULL DEFAULT 0,
  `updated_time` bigint(20) NOT NULL,
  `created_on` bigint(20) NOT NULL,
  `date` int(11) NOT NULL DEFAULT -1,
  `flush_lsn` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1075 DEFAULT CHARSET=utf8;

/*Table structure for table `Tables` */

DROP TABLE IF EXISTS `Tables`;

CREATE TABLE `Tables` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `table_id` varchar(255) NOT NULL,
  `state` int(11) NOT NULL,
  `dimension` smallint(6) NOT NULL,
  `created_on` bigint(20) NOT NULL,
  `flag` bigint(20) NOT NULL DEFAULT 0,
  `index_file_size` bigint(20) NOT NULL DEFAULT 1024,
  `engine_type` int(11) NOT NULL DEFAULT 1,
  `index_params` varchar(512) NOT NULL,
  `metric_type` int(11) NOT NULL DEFAULT 1,
  `owner_table` varchar(255) NOT NULL,
  `partition_tag` varchar(255) NOT NULL,
  `version` varchar(64) DEFAULT '1.1.0',
  `flush_lsn` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `table_id` (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
