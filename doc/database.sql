/*
MySQL - 5.1.41-community : Database - blog
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`blog` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `blog`;

/*Table structure for table `bg_article` 文章表*/

DROP TABLE IF EXISTS `bg_article`;

CREATE TABLE `bg_article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT, /*文章ID*/
  `title` char(30) NOT NULL, /*文章标题标签*/
  `keywords` char(60), /*文章关键词标签*/
  `description` char(120), /*文章描述标签*/
  `content` text NOT NULL, /*文章内容*/
  `sortid` int(11) unsigned NOT NULL, /*文章分类ID*/
  `status` tinyint(1) DEFAULT '1' NOT NULL, /*显示状态(1:显示,0:不显示)*/
  `showtime` datetime DEFAULT NULL, /*显示时间*/
  `uid` int(11) unsigned NOT NULL, /*添加文章用户ID*/
  `addtime` datetime DEFAULT NULL, /*添加时间*/
  `addip` char(15) DEFAULT NULL, /*IP*/
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `bg_articleupdate` 文章修改记录*/

DROP TABLE IF EXISTS `bg_articleupdate`;

CREATE TABLE `bg_articleupdate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT, /*ID*/
  `articleid` int(11) unsigned NOT NULL, /*文章ID*/
  `title` char(30) NOT NULL, /*修改前的文章标题标签*/
  `keywords` char(60), /*修改前的文章关键词标签*/
  `description` char(120), /*修改前的文章描述标签*/
  `content` text NOT NULL, /*修改前的文章内容*/
  `sortid` int(11) unsigned NOT NULL, /*修改前的文章分类ID*/
  `status` tinyint(1) NOT NULL, /*修改前的显示状态*/
  `showtime` datetime DEFAULT NULL, /*修改前的显示时间*/
  `uid` int(11) unsigned NOT NULL, /*修改记录的用户ID*/
  `addtime` datetime DEFAULT NULL, /*添加时间*/
  `addip` char(15) DEFAULT NULL, /*IP*/
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `bg_sort` 文章分类表*/

DROP TABLE IF EXISTS `bg_sort`;

CREATE TABLE `bg_sort` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT, /*ID*/
  `content` char(10) NOT NULL, /*分类名称*/
  `title` char(30) NOT NULL, /*分类标题标签*/
  `keywords` char(60), /*分类关键词标签*/
  `description` char(120), /*分类描述标签*/
  `parentid` int(11) unsigned NOT NULL DEFAULT '0', /*分类父ID*/
  `uid` int(11) unsigned NOT NULL, /*添加分类的用户ID*/
  `status` tinyint(1) DEFAULT '1' NOT NULL, /*显示状态(1:显示,0:不显示)*/
  `addtime` datetime DEFAULT NULL, /*添加时间*/
  `addip` char(15) DEFAULT NULL, /*IP*/
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `bg_sortupdate` 文章分类修改记录表*/

DROP TABLE IF EXISTS `bg_sortupdate`;

CREATE TABLE `bg_sortupdate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT, /*ID*/
  `sortid` int(11) unsigned NOT NULL, /*分类ID*/
  `content` char(10) NOT NULL, /*修改前的分类名称*/
  `title` char(30) NOT NULL, /*修改前的分类标题标签*/
  `keywords` char(60), /*修改前的分类关键词标签*/
  `description` char(120), /*修改前的分类描述标签*/
  `parentid` int(11) unsigned NOT NULL, /*修改前的分类父ID*/
  `status` tinyint(1) NOT NULL, /*修改前的显示状态*/
  `uid` int(11) unsigned NOT NULL, /*修改记录的用户ID*/
  `addtime` datetime DEFAULT NULL, /*添加时间*/
  `addip` char(15) DEFAULT NULL, /*IP*/
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `bg_user` 用户表*/

DROP TABLE IF EXISTS `bg_user`;

CREATE TABLE `bg_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT, /*ID*/
  `username` char(10) NOT NULL, /*用户名*/
  `password` char(32) NOT NULL, /*密码*/
  `addtime` datetime DEFAULT NULL, /*添加时间*/
  `addip` char(15) DEFAULT NULL, /*IP*/
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `bg_userlogin` 用户登录记录表*/

DROP TABLE IF EXISTS `bg_userlogin`;

CREATE TABLE `bg_userlogin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT, /*ID*/
  `uid` int(11) unsigned NOT NULL, /*用户ID*/
  `addtime` datetime DEFAULT NULL, /*添加时间*/
  `addip` char(15) DEFAULT NULL, /*IP*/
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
