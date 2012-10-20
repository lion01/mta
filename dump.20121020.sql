CREATE DATABASE  IF NOT EXISTS `mta` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mta`;
-- MySQL dump 10.13  Distrib 5.5.24, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: mta
-- ------------------------------------------------------
-- Server version	5.5.24-0ubuntu0.12.04.1

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
-- Table structure for table `bk078_finder_filters`
--

DROP TABLE IF EXISTS `bk078_finder_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_finder_filters` (
  `filter_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `map_count` int(10) unsigned NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `params` mediumtext,
  PRIMARY KEY (`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_finder_filters`
--

LOCK TABLES `bk078_finder_filters` WRITE;
/*!40000 ALTER TABLE `bk078_finder_filters` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_finder_filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_qunipay_paymentmethod_parameters`
--

DROP TABLE IF EXISTS `bk078_qunipay_paymentmethod_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_qunipay_paymentmethod_parameters` (
  `paymentmethodid` int(11) NOT NULL,
  `key` varchar(32) NOT NULL,
  `value` text NOT NULL,
  UNIQUE KEY `paymentmethodid` (`paymentmethodid`,`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_qunipay_paymentmethod_parameters`
--

LOCK TABLES `bk078_qunipay_paymentmethod_parameters` WRITE;
/*!40000 ALTER TABLE `bk078_qunipay_paymentmethod_parameters` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_qunipay_paymentmethod_parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_travel_withdrawitems`
--

DROP TABLE IF EXISTS `bk078_travel_withdrawitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_travel_withdrawitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `params` text NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `withdraw_id` int(11) DEFAULT NULL,
  `total_comission` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_travel_withdrawitems`
--

LOCK TABLES `bk078_travel_withdrawitems` WRITE;
/*!40000 ALTER TABLE `bk078_travel_withdrawitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_travel_withdrawitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_modules`
--

DROP TABLE IF EXISTS `bk078_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) NOT NULL DEFAULT '',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) DEFAULT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`),
  KEY `idx_language` (`language`)
) ENGINE=MyISAM AUTO_INCREMENT=130 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_modules`
--

LOCK TABLES `bk078_modules` WRITE;
/*!40000 ALTER TABLE `bk078_modules` DISABLE KEYS */;
INSERT INTO `bk078_modules` VALUES (2,'Login','','',1,'login',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_login',1,1,'',1,'*'),(3,'Popular Articles','','',3,'cpanel',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_popular',3,1,'{\"count\":\"5\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\",\"automatic_title\":\"1\"}',1,'*'),(4,'Recently Added Articles','','',4,'cpanel',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_latest',3,1,'{\"count\":\"5\",\"ordering\":\"c_dsc\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\",\"automatic_title\":\"1\"}',1,'*'),(8,'Toolbar','','',1,'toolbar',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_toolbar',3,1,'',1,'*'),(9,'Quick Icons','','',1,'icon',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_quickicon',3,1,'{\"context\":\"mod_quickicon\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"automatic_title\":\"0\"}',1,'*'),(10,'Logged-in Users','','',2,'cpanel',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_logged',3,1,'{\"count\":\"5\",\"name\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\",\"automatic_title\":\"1\"}',1,'*'),(12,'Admin Menu','','',1,'menu',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_menu',3,1,'{\"layout\":\"\",\"moduleclass_sfx\":\"\",\"shownew\":\"1\",\"showhelp\":\"1\",\"cache\":\"0\"}',1,'*'),(13,'Admin Submenu','','',1,'submenu',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_submenu',3,1,'',1,'*'),(14,'User Status','','',2,'status',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_status',3,1,'',1,'*'),(15,'Title','','',1,'title',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_title',3,1,'',1,'*'),(79,'Multilanguage status','','',1,'status',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'mod_multilangstatus',3,1,'{\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}',1,'*'),(80,'Recent Comments','','',1,'sidebar-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_k2_comments',1,1,'{\"moduleclass_sfx\":\"\",\"module_usage\":\"0\",\"catfilter\":\"0\",\"comments_limit\":\"5\",\"comments_word_limit\":\"10\",\"commenterName\":\"1\",\"commentAvatar\":\"1\",\"commentAvatarWidthSelect\":\"custom\",\"commentAvatarWidth\":\"50\",\"commentDate\":\"1\",\"commentDateFormat\":\"absolute\",\"commentLink\":\"0\",\"itemTitle\":\"0\",\"itemCategory\":\"0\",\"feed\":\"0\",\"commenters_limit\":\"5\",\"commenterNameOrUsername\":\"1\",\"commenterAvatar\":\"0\",\"commenterAvatarWidthSelect\":\"custom\",\"commenterAvatarWidth\":\"50\",\"commenterLink\":\"0\",\"commenterCommentsCounter\":\"0\",\"commenterLatestComment\":\"0\",\"cache\":\"1\",\"cache_time\":\"900\"}',0,'*'),(81,'Accordion. jQuery UI','','',1,'sidebar-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_k2_content',1,1,'{\"moduleclass_sfx\":\"accordion\",\"getTemplate\":\"accordion_vert\",\"source\":\"filter\",\"catfilter\":\"1\",\"category_id\":[\"16\"],\"getChildren\":\"0\",\"itemCount\":\"3\",\"itemsOrdering\":\"order\",\"FeaturedItems\":\"1\",\"popularityRange\":\"\",\"videosOnly\":\"0\",\"item\":\"0\",\"itemTitle\":\"1\",\"itemAuthor\":\"0\",\"itemAuthorAvatar\":\"0\",\"itemAuthorAvatarWidthSelect\":\"custom\",\"itemAuthorAvatarWidth\":\"50\",\"userDescription\":\"0\",\"itemIntroText\":\"1\",\"itemIntroTextWordLimit\":\"\",\"itemImage\":\"0\",\"itemImgSize\":\"Small\",\"itemVideo\":\"0\",\"itemVideoCaption\":\"0\",\"itemVideoCredits\":\"0\",\"itemAttachments\":\"0\",\"itemTags\":\"0\",\"itemCategory\":\"0\",\"itemDateCreated\":\"0\",\"itemHits\":\"0\",\"itemReadMore\":\"1\",\"itemExtraFields\":\"0\",\"itemCommentsCounter\":\"0\",\"feed\":\"0\",\"itemPreText\":\"\",\"itemCustomLink\":\"0\",\"itemCustomLinkTitle\":\"\",\"itemCustomLinkURL\":\"http:\\/\\/\",\"itemCustomLinkMenuItem\":\"\",\"K2Plugins\":\"1\",\"JPlugins\":\"1\",\"cache\":\"1\",\"cache_time\":\"900\"}',0,'*'),(83,'Categories','','',1,'content-top-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_k2_tools',1,1,'{\"moduleclass_sfx\":\"\",\"module_usage\":\"4\",\"archiveItemsCounter\":\"0\",\"archiveCategory\":\"0\",\"authors_module_category\":\"0\",\"authorItemsCounter\":\"1\",\"authorAvatar\":\"1\",\"authorAvatarWidthSelect\":\"custom\",\"authorAvatarWidth\":\"50\",\"authorLatestItem\":\"1\",\"calendarCategory\":\"0\",\"home\":\"\",\"seperator\":\"\",\"root_id\":\"4\",\"end_level\":\"\",\"categoriesListOrdering\":\"\",\"categoriesListItemsCounter\":\"0\",\"root_id2\":\"0\",\"catfilter\":\"0\",\"getChildren\":\"0\",\"liveSearch\":\"\",\"width\":\"20\",\"text\":\"\",\"button\":\"\",\"imagebutton\":\"\",\"button_text\":\"\",\"min_size\":\"75\",\"max_size\":\"300\",\"cloud_limit\":\"30\",\"cloud_category\":[\"0\"],\"cloud_category_recursive\":\"0\",\"customCode\":\"\",\"parsePhp\":\"0\",\"K2Plugins\":\"0\",\"JPlugins\":\"0\",\"cache\":\"1\",\"cache_time\":\"900\"}',0,'*'),(85,'User Login','','',1,'popup',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_k2_user',1,1,'{\"moduleclass_sfx\":\"\",\"pretext\":\"\",\"posttext\":\"\",\"userGreetingText\":\"\",\"name\":\"1\",\"userAvatar\":\"1\",\"userAvatarWidthSelect\":\"custom\",\"userAvatarWidth\":\"50\",\"menu\":\"\",\"login\":\"\",\"logout\":\"\",\"usesecure\":\"0\",\"cache\":\"0\",\"cache_time\":\"900\"}',0,'*'),(86,'K2 Quick Icons (admin)','','',99,'icon',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_k2_quickicons',3,1,'',1,'*'),(87,'K2 Stats (admin)','','',0,'cpanel',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_k2_stats',3,1,'',1,'*'),(90,'Archives','','',1,'sidebar-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_k2_tools',1,1,'{\"moduleclass_sfx\":\"\",\"module_usage\":\"0\",\"archiveItemsCounter\":\"0\",\"archiveCategory\":\"0\",\"authors_module_category\":\"0\",\"authorItemsCounter\":\"1\",\"authorAvatar\":\"1\",\"authorAvatarWidthSelect\":\"custom\",\"authorAvatarWidth\":\"50\",\"authorLatestItem\":\"1\",\"calendarCategory\":\"0\",\"home\":\"\",\"seperator\":\"\",\"root_id\":\"0\",\"end_level\":\"\",\"categoriesListOrdering\":\"\",\"categoriesListItemsCounter\":\"1\",\"root_id2\":\"0\",\"catfilter\":\"0\",\"getChildren\":\"0\",\"liveSearch\":\"\",\"width\":\"20\",\"text\":\"\",\"button\":\"\",\"imagebutton\":\"\",\"button_text\":\"\",\"min_size\":\"75\",\"max_size\":\"300\",\"cloud_limit\":\"30\",\"cloud_category\":[\"0\"],\"cloud_category_recursive\":\"0\",\"customCode\":\"\",\"parsePhp\":\"0\",\"K2Plugins\":\"0\",\"JPlugins\":\"0\",\"cache\":\"1\",\"cache_time\":\"900\"}',0,'*'),(91,'JGMap - Google Map ','','',1,'map',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_JGMap',1,0,'{\"width\":\"400\",\"height\":\"260\",\"mapName\":\"map\",\"mapType\":\"ROADMAP\",\"smallmap\":\"1\",\"static\":\"0\",\"lat\":\"40.683529054021975\",\"lng\":\"-73.99617004394531\",\"zoom\":\"13\",\"marker\":\"1\",\"marker_lat\":\"40.681576407044474\",\"marker_lng\":\"-73.99634170532227\",\"marker_title\":\"\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*'),(94,'Tabs. jQuery UI','','',1,'content-bottom-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_k2_content',1,1,'{\"moduleclass_sfx\":\"tabs\",\"getTemplate\":\"jquery_ui_tabs\",\"source\":\"filter\",\"catfilter\":\"1\",\"category_id\":[\"2\"],\"getChildren\":\"0\",\"itemCount\":\"3\",\"itemsOrdering\":\"order\",\"FeaturedItems\":\"1\",\"popularityRange\":\"\",\"videosOnly\":\"0\",\"item\":\"0\",\"itemTitle\":\"1\",\"itemAuthor\":\"0\",\"itemAuthorAvatar\":\"0\",\"itemAuthorAvatarWidthSelect\":\"custom\",\"itemAuthorAvatarWidth\":\"50\",\"userDescription\":\"0\",\"itemIntroText\":\"1\",\"itemIntroTextWordLimit\":\"\",\"itemImage\":\"1\",\"itemImgSize\":\"Small\",\"itemVideo\":\"0\",\"itemVideoCaption\":\"0\",\"itemVideoCredits\":\"0\",\"itemAttachments\":\"0\",\"itemTags\":\"0\",\"itemCategory\":\"0\",\"itemDateCreated\":\"0\",\"itemHits\":\"0\",\"itemReadMore\":\"1\",\"itemExtraFields\":\"0\",\"itemCommentsCounter\":\"0\",\"feed\":\"0\",\"itemPreText\":\"\",\"itemCustomLink\":\"0\",\"itemCustomLinkTitle\":\"\",\"itemCustomLinkURL\":\"http:\\/\\/\",\"itemCustomLinkMenuItem\":\"\",\"K2Plugins\":\"1\",\"JPlugins\":\"1\",\"cache\":\"1\",\"cache_time\":\"900\"}',0,'*'),(96,'User Login','','',1,'popup',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'mod_k2_user',1,1,'{\"moduleclass_sfx\":\"\",\"pretext\":\"\",\"posttext\":\"\",\"userGreetingText\":\"\",\"name\":\"1\",\"userAvatar\":\"1\",\"userAvatarWidthSelect\":\"custom\",\"userAvatarWidth\":\"50\",\"menu\":\"\",\"login\":\"\",\"logout\":\"\",\"usesecure\":\"0\",\"cache\":\"0\",\"cache_time\":\"900\"}',0,'*'),(97,'Search','','',1,'content-top-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'mod_search',1,1,'{\"label\":\" \",\"width\":\"20\",\"text\":\" \",\"button\":\"1\",\"button_pos\":\"right\",\"imagebutton\":\"\",\"button_text\":\"\",\"opensearch\":\"1\",\"opensearch_title\":\"\",\"set_itemid\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\"}',0,'*'),(98,'Joomla! Version Information','','',1,'footer',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_version',1,1,'{\"format\":\"short\",\"product\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}',1,'*'),(99,'Quick Icons','','',0,'icon',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_quickicon',1,1,'{\"context\":\"mod_quickicon\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"automatic_title\":\"0\"}',1,'*'),(100,'Joomla Version','','',1,'footer',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_version',3,1,'{\"format\":\"short\",\"product\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}',1,'*'),(103,'404 Page Search','','',1,'error404',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_search',1,0,'{\"label\":\" \",\"width\":\"20\",\"text\":\" \",\"button\":\"1\",\"button_pos\":\"right\",\"imagebutton\":\"\",\"button_text\":\"\",\"opensearch\":\"1\",\"opensearch_title\":\"\",\"set_itemid\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\"}',0,'*'),(118,'Sidelist 1','','',1,'sidebar-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',-2,'mod_menu',1,0,'{\"menutype\":\"about-us\",\"startLevel\":\"1\",\"endLevel\":\"0\",\"showAllChildren\":\"0\",\"tag_id\":\"\",\"class_sfx\":\"-side\",\"window_open\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\"}',0,'*'),(129,'Login','','',0,'popup',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_login',1,1,'{\"pretext\":\"\",\"posttext\":\"\",\"login\":\"\",\"logout\":\"\",\"greeting\":\"1\",\"name\":\"0\",\"usesecure\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}',0,'*'),(128,'User Login','','',1,'popup',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'mod_cblogin',1,1,'{\"moduleclass_sfx\":\"\",\"horizontal\":\"0\",\"compact\":\"0\",\"pretext\":\"\",\"posttext\":\"\",\"logoutpretext\":\"\",\"logoutposttext\":\"\",\"login\":\"\",\"logout\":\"index.php\",\"show_lostpass\":\"1\",\"show_newaccount\":\"1\",\"show_username_pass_icons\":\"0\",\"name_lenght\":\"14\",\"pass_lenght\":\"14\",\"show_buttons_icons\":\"0\",\"show_remind_register_icons\":\"0\",\"login_message\":\"0\",\"logout_message\":\"0\",\"remember_enabled\":\"1\",\"greeting\":\"1\",\"name\":\"0\",\"show_avatar\":\"0\",\"avatar_position\":\"default\",\"text_show_profile\":\"\",\"text_edit_profile\":\"\",\"pms_type\":\"0\",\"show_pms\":\"0\",\"show_connection_notifications\":\"0\",\"https_post\":\"0\",\"cb_plugins\":\"0\"}',0,'*'),(113,'Welcome Message','','',1,'content-top-b',367,'2012-10-18 05:21:26','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_k2_jcarousel',1,1,'{\"moduleclass_sfx\":\"carousel\",\"getTemplate\":\"Default\",\"source\":\"filter\",\"catfilter\":\"1\",\"category_id\":[\"15\"],\"getChildren\":\"0\",\"itemCount\":\"6\",\"itemsOrdering\":\"order\",\"FeaturedItems\":\"1\",\"popularityRange\":\"\",\"videosOnly\":\"0\",\"item\":\"0\",\"itemTitle\":\"1\",\"itemAuthor\":\"0\",\"itemAuthorAvatar\":\"0\",\"itemAuthorAvatarWidthSelect\":\"custom\",\"itemAuthorAvatarWidth\":\"50\",\"userDescription\":\"0\",\"itemIntroText\":\"1\",\"itemIntroTextWordLimit\":\"\",\"itemImage\":\"1\",\"itemImgSize\":\"Medium\",\"itemVideo\":\"0\",\"itemVideoCaption\":\"0\",\"itemVideoCredits\":\"0\",\"itemAttachments\":\"0\",\"itemTags\":\"0\",\"itemCategory\":\"0\",\"itemDateCreated\":\"0\",\"itemHits\":\"0\",\"itemReadMore\":\"0\",\"itemExtraFields\":\"0\",\"itemCommentsCounter\":\"0\",\"feed\":\"0\",\"itemPreText\":\"\",\"itemCustomLink\":\"0\",\"itemCustomLinkTitle\":\"\",\"itemCustomLinkURL\":\"http:\\/\\/\",\"itemCustomLinkMenuItem\":\"\",\"theme\":\"custom\",\"vertical\":\"true\",\"start\":\"1\",\"offset\":\"1\",\"scroll\":\"1\",\"visible\":\"1\",\"animation\":\"slow\",\"auto\":\"0\",\"wrap\":\"\'circular\'\",\"script\":\"minified\",\"K2Plugins\":\"1\",\"JPlugins\":\"1\",\"cache\":\"1\",\"cache_time\":\"900\"}',0,'*'),(123,'Services','','',1,'content-top-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_k2_content',1,1,'{\"moduleclass_sfx\":\"services\",\"getTemplate\":\"Default\",\"source\":\"filter\",\"catfilter\":\"1\",\"category_id\":[\"29\"],\"getChildren\":\"0\",\"itemCount\":\"11\",\"itemsOrdering\":\"order\",\"FeaturedItems\":\"1\",\"popularityRange\":\"\",\"videosOnly\":\"0\",\"item\":\"0\",\"itemTitle\":\"1\",\"itemAuthor\":\"0\",\"itemAuthorAvatar\":\"0\",\"itemAuthorAvatarWidthSelect\":\"custom\",\"itemAuthorAvatarWidth\":\"50\",\"userDescription\":\"0\",\"itemIntroText\":\"0\",\"itemIntroTextWordLimit\":\"\",\"itemImage\":\"0\",\"itemImgSize\":\"Small\",\"itemVideo\":\"0\",\"itemVideoCaption\":\"0\",\"itemVideoCredits\":\"0\",\"itemAttachments\":\"0\",\"itemTags\":\"0\",\"itemCategory\":\"0\",\"itemDateCreated\":\"0\",\"itemHits\":\"0\",\"itemReadMore\":\"0\",\"itemExtraFields\":\"0\",\"itemCommentsCounter\":\"0\",\"feed\":\"0\",\"itemPreText\":\"\",\"itemCustomLink\":\"1\",\"itemCustomLinkTitle\":\"Learn More\",\"itemCustomLinkURL\":\"index.php\\/services\\/columns-4\",\"itemCustomLinkMenuItem\":\"\",\"K2Plugins\":\"1\",\"JPlugins\":\"1\",\"cache\":\"1\",\"cache_time\":\"900\"}',0,'*'),(115,'BgMax','','',1,'header-a',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_bgmax',1,0,'{\"bgmaxDebug\":\"0\",\"image_path\":\"\",\"RandomFolder\":\"IMAGES\",\"bodyColor\":\"\",\"bodyColorAuto\":\"1\",\"mode\":\"max\",\"enlarge\":\"1\",\"reduce\":\"1\",\"position\":\"fixed\",\"align\":\"center\",\"vertAlign\":\"top\",\"zIndex\":\"-1\",\"ffHack\":\"0px\",\"fadeActive\":\"1\",\"fadeAfter\":\"300\",\"fadeDuration\":\"1000\",\"fadeFrameRate\":\"1\",\"contentSelector\":\"\",\"contentColor\":\"\",\"contentOpacity\":\"100%\",\"contentWidth\":\"\",\"contentAlign\":\"center\",\"headOther\":\"\",\"headFile\":\"-1\",\"filterContent\":\"\",\"debDate\":\"\",\"debTime\":\"\",\"endDate\":\"\",\"endTime\":\"\"}',0,'*');
/*!40000 ALTER TABLE `bk078_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_qunilicense_licenses`
--

DROP TABLE IF EXISTS `bk078_qunilicense_licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_qunilicense_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `expirydaterelative` int(11) NOT NULL,
  `expirytype` enum('NEVER','FIXEDDATE','RELATIVE') NOT NULL,
  `expirydateabsolute` datetime NOT NULL,
  `price` float NOT NULL,
  `renewalPrice` float NOT NULL,
  `type` enum('SINGLE','SHARED') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_qunilicense_licenses`
--

LOCK TABLES `bk078_qunilicense_licenses` WRITE;
/*!40000 ALTER TABLE `bk078_qunilicense_licenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_qunilicense_licenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_osmembership_configs`
--

DROP TABLE IF EXISTS `bk078_osmembership_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_osmembership_configs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config_key` varchar(50) DEFAULT NULL,
  `config_value` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_osmembership_configs`
--

LOCK TABLES `bk078_osmembership_configs` WRITE;
/*!40000 ALTER TABLE `bk078_osmembership_configs` DISABLE KEYS */;
INSERT INTO `bk078_osmembership_configs` VALUES (1,'registration_integration','1'),(2,'auto_generate_membership_id','0'),(3,'membership_id_start_number','1000'),(4,'show_login_box_on_subscribe_page','1'),(5,'cb_integration','1'),(6,'enable_captcha','0'),(7,'enable_tax','0'),(8,'enable_coupon','0'),(9,'enable_cardtypes','Visa,MasterCard,Discover,Amex'),(10,'tax_rate','0'),(11,'use_https','0'),(12,'accept_term','0'),(13,'article_id','0'),(14,'date_format','m-d-Y'),(15,'currency_symbol','RM '),(16,'decimals','2'),(17,'dec_point','.'),(18,'thousands_sep',','),(19,'currency_position','0'),(20,'number_columns','3'),(21,'default_country','Malaysia'),(22,'from_name',''),(23,'from_email',''),(24,'notification_emails',''),(25,'admin_email_subject','New subscription for [PLAN_TITLE]'),(26,'admin_email_body','<p>Dear Admin</p>\r\n<p>User <strong>[FIRST_NAME] [LAST_NAME]</strong> has just subscribed for subscription plan <strong>[PLAN_TITLE]</strong>. The subscription detail is as follow:</p>\r\n<p>[SUBSCRIPTION_DETAIL]</p>'),(27,'user_email_subject','Subscription for [PLAN_TITLE] plan confirmation'),(28,'user_email_body','<p>Dear <strong>[FIRST_NAME] [LAST_NAME]</strong></p>\r\n<p>Thanks for subscribing to our subscription plan <strong>[PLAN_TITLE].</strong></p>'),(29,'user_email_body_offline','<p>Dear <strong>[FIRST_NAME] [LAST_NAME]</strong></p>\r\n<p>Thanks for subscribing to our subscription plan</p>'),(30,'subscription_approved_email_subject','Your subscription for [PLAN_TITLE] approved'),(31,'subscription_approved_email_body','<p>Dear <strong>[FIRST_NAME] [LAST_NAME]</strong></p>\r\n<p>Your subscription for <strong>[PLAN_TITLE]</strong> has just been approved by administrator. Your subscription detail is as follow:</p>\r\n<p>[SUBSCRIPTION_DETAIL]</p>\r\n<p>You can now login to your account to access to allowed resources on our site.</p>\r\n<p>Regards,</p>\r\n<p>Compnay Name</p>'),(32,'subscription_form_msg','<p>Please enter information on the form below to process subscription for <strong>[PLAN_TITLE]</strong>. The price you have to pay is <strong>[AMOUNT]</strong>.</p>'),(33,'subscription_confirmation_message','<p>Please review the subscription information for <strong>[PLAN_TITLE]</strong>. If they are correct, please click on Process button to process the subscription. If there are any information in-correct, you can click on Back button to edit it.</p>'),(34,'thanks_message','<p>Thanks <strong>[FIRST_NAME] [LAST_NAME]</strong> for subscribing to <strong>[PLAN_TITLE]</strong> subscription plan. Your subscription detail is as follow:</p>\r\n<p>[SUBSCRIPTION_DETAIL]</p>\r\n<p>You can now login to your account to access to the allowed resources on our site.</p>\r\n<p>Regards,</p>\r\n<p>Company Name</p>'),(35,'thanks_message_offline','<p>Thanks <strong>[FIRST_NAME] [LAST_NAME]</strong> for subscribing to <strong>[PLAN_TITLE]</strong> subscription plan. Your subscription detail is as follow:</p>\r\n<p>[SUBSCRIPTION_DETAIL]</p>\r\n<p>Please send payment to our financial department ASAP. After receiving your payment, we will activate your subscription and you can login to access to allowed resources on our site.</p>\r\n<p>Regards,</p>\r\n<p>Company Name</p>'),(36,'cancel_message','<p>You cancelled your subscription.</p>'),(37,'failure_message','<p>Your payment for subscribing to <strong>[PLAN_TITLE]</strong> as failure. Please see the error message below, then go back and try again.</p>'),(38,'subscription_renew_form_msg','<p>Please enter information on the form below to process renew subscription for <strong>[PLAN_TITLE] </strong>for <strong>[NUMBER_DAYS] days</strong>. The price you have to pay is <strong>[AMOUNT].</strong></p>'),(39,'subscription_renew_confirmation_message','<p>Please review the information below. If they are correct, please click on Process Button to renew your subscription for</p>'),(40,'admin_renw_email_subject','New subscription renewal for [PLAN_TITLE]'),(41,'admin_renew_email_body','<p>Dear Administrator</p>\r\n<p>User <strong>[FIRST_NAME] [LAST_NAME]</strong> just completed renew his subscription for <strong>[PLAN_TITLE]</strong></p>'),(42,'user_renew_email_subject','Subscription for [PLAN_TITLE] plan confirmation'),(43,'user_renew_email_body','<p>Dear <strong>[FIRST_NAME] [LAST_NAME]</strong></p>\r\n<p>Thank you for renewing your subscription for <strong>[PLAN_TITLE]</strong>. Your new subscription expire date is <strong>[END_DATE].</strong></p>'),(44,'renew_thanks_message','<p>Thanks for renewing your subscription for subscription</p>'),(45,'subscription_upgrade_form_msg','<p>Please enter information on the form below to process upgrade your subscription from <strong>[FROM_PLAN_TITLE]</strong> To <strong>[PLAN_TITLE]</strong></p>'),(46,'subscription_upgrade_confirmation_message','<p>Please review the upgrade subscription information in the form below. If they are correct, please click on <strong>Process</strong> button to process upgrade your subscription from <strong>[PLAN_TITLE]</strong> to <strong>[TO_PLAN_TITLE]</strong>.</p>'),(47,'admin_upgrade_email_subject','New subscription upgrade from [PLAN_TITLE] to [TO_PLAN_TITLE]'),(48,'admin_upgrade_email_body','<p>Dear Administrator</p>\r\n<p>User <strong>[FIRST_NAME] [LAST_NAME]</strong> has just upgrade his subscription from <strong>[PLAN_TITLE]</strong> to <strong>[TO_PLAN_TITLE]</strong>.</p>\r\n<p>Regards,</p>\r\n<p>Website administrator team</p>'),(49,'user_upgrade_email_subject','Subscription upgrade Confirmation'),(50,'user_upgrade_email_body','<p>Dear <strong>[FIRST_NAME] [LAST_NAME]</strong></p>\r\n<p>You just completed upgrade your subscription from <strong>[PLAN_TITLE]</strong> to <strong>[TO_PLAN_TITLE]</strong>. The subscription for <strong>[PLAN_TITLE]</strong></p>'),(51,'upgrade_thanks_message','<p>Dear <strong>[FIRST_NAME] [LAST_NAME]</strong></p>\r\n<p>You have just completed upgrade your subscription from <strong>[PLAN_TITLE]</strong> to <strong>[TO_PLAN_TITLE]</strong>. Your subscription for <strong>[PLAN_TITLE]</strong> is now expired and you are now active subscriber of subscription plan <strong>[TO_PLAN_TITLE]</strong>. The subscription detail is as follow:</p>\r\n<p>[SUBSCRIPTION_DETAIL]</p>\r\n<p>Regards,</p>\r\n<p>Website administrator team</p>'),(52,'first_reminder_email_subject','Your subscription for plan [PLAN_TITLE] will be expired in [NUMBER_DAYS] days'),(53,'first_reminder_email_body','<p>Dear <strong>[FIRST_NAME] [LAST_NAME]</strong></p>\r\n<p>Your subscription for plan <strong>[PLAN_TITLE]</strong> on our site will be expired on <strong>[EXPIRE_DATE]</strong> (which is in <strong>[NUMBER_DAYS]</strong> from now).</p>'),(54,'second_reminder_email_subject','Your subscription for plan [PLAN_TITLE] will be expired in [NUMBER_DAYS] days'),(55,'second_reminder_email_body','<p>Dear <strong>[FIRST_NAME] [LAST_NAME]</strong></p>\r\n<p>Your subscription for plan <strong>[PLAN_TITLE]</strong> on our site will be expired on <strong>[EXPIRE_DATE]</strong> (which is in [NUMBER_DAYS] from now).</p>'),(56,'option','com_osmembership'),(57,'task','save');
/*!40000 ALTER TABLE `bk078_osmembership_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_travel_packages`
--

DROP TABLE IF EXISTS `bk078_travel_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_travel_packages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `params` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text,
  `commission_type` varchar(255) NOT NULL DEFAULT '0',
  `comisssion_rate` decimal(10,2) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `value` decimal(10,2) NOT NULL,
  `ordering` int(11) DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  `modification_date` date DEFAULT NULL,
  `published` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_travel_packages`
--

LOCK TABLES `bk078_travel_packages` WRITE;
/*!40000 ALTER TABLE `bk078_travel_packages` DISABLE KEYS */;
INSERT INTO `bk078_travel_packages` VALUES (1,'','Digital pressure cooker + Free 2 person china ground travel inclusive','<p>Inclusive meals, hotel, sightseeing, oversea airport transfer with tour guide (9 red logo destination for your choice)</p>','0',200.00,798.00,2400.00,1,'2012-10-18','2012-10-18',1);
/*!40000 ALTER TABLE `bk078_travel_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_messages_cfg`
--

DROP TABLE IF EXISTS `bk078_messages_cfg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) NOT NULL DEFAULT '',
  `cfg_value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_messages_cfg`
--

LOCK TABLES `bk078_messages_cfg` WRITE;
/*!40000 ALTER TABLE `bk078_messages_cfg` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_messages_cfg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_comprofiler_field_values`
--

DROP TABLE IF EXISTS `bk078_comprofiler_field_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_comprofiler_field_values` (
  `fieldvalueid` int(11) NOT NULL AUTO_INCREMENT,
  `fieldid` int(11) NOT NULL DEFAULT '0',
  `fieldtitle` varchar(255) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `sys` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fieldvalueid`),
  KEY `fieldid_ordering` (`fieldid`,`ordering`),
  KEY `fieldtitle_id` (`fieldtitle`,`fieldid`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_comprofiler_field_values`
--

LOCK TABLES `bk078_comprofiler_field_values` WRITE;
/*!40000 ALTER TABLE `bk078_comprofiler_field_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_comprofiler_field_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_qunilicense_required_licenses`
--

DROP TABLE IF EXISTS `bk078_qunilicense_required_licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_qunilicense_required_licenses` (
  `identifier` int(11) NOT NULL AUTO_INCREMENT,
  `resourceid` int(11) NOT NULL,
  `type` enum('license','otherresource') NOT NULL,
  `licenseid` int(11) NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_qunilicense_required_licenses`
--

LOCK TABLES `bk078_qunilicense_required_licenses` WRITE;
/*!40000 ALTER TABLE `bk078_qunilicense_required_licenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_qunilicense_required_licenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_finder_tokens_aggregate`
--

DROP TABLE IF EXISTS `bk078_finder_tokens_aggregate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_finder_tokens_aggregate` (
  `term_id` int(10) unsigned NOT NULL,
  `map_suffix` char(1) NOT NULL,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `term_weight` float unsigned NOT NULL,
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `context_weight` float unsigned NOT NULL,
  `total_weight` float unsigned NOT NULL,
  KEY `token` (`term`),
  KEY `keyword_id` (`term_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_finder_tokens_aggregate`
--

LOCK TABLES `bk078_finder_tokens_aggregate` WRITE;
/*!40000 ALTER TABLE `bk078_finder_tokens_aggregate` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_finder_tokens_aggregate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_osmembership_countries`
--

DROP TABLE IF EXISTS `bk078_osmembership_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_osmembership_countries` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_id` int(11) NOT NULL DEFAULT '1',
  `name` varchar(64) DEFAULT NULL,
  `country_3_code` char(3) DEFAULT NULL,
  `country_2_code` char(2) DEFAULT NULL,
  `published` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`country_id`),
  KEY `idx_country_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_osmembership_countries`
--

LOCK TABLES `bk078_osmembership_countries` WRITE;
/*!40000 ALTER TABLE `bk078_osmembership_countries` DISABLE KEYS */;
INSERT INTO `bk078_osmembership_countries` VALUES (1,1,'Afghanistan','AFG','AF',1),(2,1,'Albania','ALB','AL',1),(3,1,'Algeria','DZA','DZ',1),(4,1,'American Samoa','ASM','AS',1),(5,1,'Andorra','AND','AD',1),(6,1,'Angola','AGO','AO',1),(7,1,'Anguilla','AIA','AI',1),(8,1,'Antarctica','ATA','AQ',1),(9,1,'Antigua and Barbuda','ATG','AG',1),(10,1,'Argentina','ARG','AR',1),(11,1,'Armenia','ARM','AM',1),(12,1,'Aruba','ABW','AW',1),(13,1,'Australia','AUS','AU',1),(14,1,'Austria','AUT','AT',1),(15,1,'Azerbaijan','AZE','AZ',1),(16,1,'Bahamas','BHS','BS',1),(17,1,'Bahrain','BHR','BH',1),(18,1,'Bangladesh','BGD','BD',1),(19,1,'Barbados','BRB','BB',1),(20,1,'Belarus','BLR','BY',1),(21,1,'Belgium','BEL','BE',1),(22,1,'Belize','BLZ','BZ',1),(23,1,'Benin','BEN','BJ',1),(24,1,'Bermuda','BMU','BM',1),(25,1,'Bhutan','BTN','BT',1),(26,1,'Bolivia','BOL','BO',1),(27,1,'Bosnia and Herzegowina','BIH','BA',1),(28,1,'Botswana','BWA','BW',1),(29,1,'Bouvet Island','BVT','BV',1),(30,1,'Brazil','BRA','BR',1),(31,1,'British Indian Ocean Territory','IOT','IO',1),(32,1,'Brunei Darussalam','BRN','BN',1),(33,1,'Bulgaria','BGR','BG',1),(34,1,'Burkina Faso','BFA','BF',1),(35,1,'Burundi','BDI','BI',1),(36,1,'Cambodia','KHM','KH',1),(37,1,'Cameroon','CMR','CM',1),(38,1,'Canada','CAN','CA',1),(39,1,'Cape Verde','CPV','CV',1),(40,1,'Cayman Islands','CYM','KY',1),(41,1,'Central African Republic','CAF','CF',1),(42,1,'Chad','TCD','TD',1),(43,1,'Chile','CHL','CL',1),(44,1,'China','CHN','CN',1),(45,1,'Christmas Island','CXR','CX',1),(46,1,'Cocos (Keeling) Islands','CCK','CC',1),(47,1,'Colombia','COL','CO',1),(48,1,'Comoros','COM','KM',1),(49,1,'Congo','COG','CG',1),(50,1,'Cook Islands','COK','CK',1),(51,1,'Costa Rica','CRI','CR',1),(52,1,'Cote D\'Ivoire','CIV','CI',1),(53,1,'Croatia','HRV','HR',1),(54,1,'Cuba','CUB','CU',1),(55,1,'Cyprus','CYP','CY',1),(56,1,'Czech Republic','CZE','CZ',1),(57,1,'Denmark','DNK','DK',1),(58,1,'Djibouti','DJI','DJ',1),(59,1,'Dominica','DMA','DM',1),(60,1,'Dominican Republic','DOM','DO',1),(61,1,'East Timor','TMP','TP',1),(62,1,'Ecuador','ECU','EC',1),(63,1,'Egypt','EGY','EG',1),(64,1,'El Salvador','SLV','SV',1),(65,1,'Equatorial Guinea','GNQ','GQ',1),(66,1,'Eritrea','ERI','ER',1),(67,1,'Estonia','EST','EE',1),(68,1,'Ethiopia','ETH','ET',1),(69,1,'Falkland Islands (Malvinas)','FLK','FK',1),(70,1,'Faroe Islands','FRO','FO',1),(71,1,'Fiji','FJI','FJ',1),(72,1,'Finland','FIN','FI',1),(73,1,'France','FRA','FR',1),(74,1,'France, Metropolitan','FXX','FX',1),(75,1,'French Guiana','GUF','GF',1),(76,1,'French Polynesia','PYF','PF',1),(77,1,'French Southern Territories','ATF','TF',1),(78,1,'Gabon','GAB','GA',1),(79,1,'Gambia','GMB','GM',1),(80,1,'Georgia','GEO','GE',1),(81,1,'Germany','DEU','DE',1),(82,1,'Ghana','GHA','GH',1),(83,1,'Gibraltar','GIB','GI',1),(84,1,'Greece','GRC','GR',1),(85,1,'Greenland','GRL','GL',1),(86,1,'Grenada','GRD','GD',1),(87,1,'Guadeloupe','GLP','GP',1),(88,1,'Guam','GUM','GU',1),(89,1,'Guatemala','GTM','GT',1),(90,1,'Guinea','GIN','GN',1),(91,1,'Guinea-bissau','GNB','GW',1),(92,1,'Guyana','GUY','GY',1),(93,1,'Haiti','HTI','HT',1),(94,1,'Heard and Mc Donald Islands','HMD','HM',1),(95,1,'Honduras','HND','HN',1),(96,1,'Hong Kong','HKG','HK',1),(97,1,'Hungary','HUN','HU',1),(98,1,'Iceland','ISL','IS',1),(99,1,'India','IND','IN',1),(100,1,'Indonesia','IDN','ID',1),(101,1,'Iran (Islamic Republic of)','IRN','IR',1),(102,1,'Iraq','IRQ','IQ',1),(103,1,'Ireland','IRL','IE',1),(104,1,'Israel','ISR','IL',1),(105,1,'Italy','ITA','IT',1),(106,1,'Jamaica','JAM','JM',1),(107,1,'Japan','JPN','JP',1),(108,1,'Jordan','JOR','JO',1),(109,1,'Kazakhstan','KAZ','KZ',1),(110,1,'Kenya','KEN','KE',1),(111,1,'Kiribati','KIR','KI',1),(112,1,'Korea, Democratic People\'s Republic of','PRK','KP',1),(113,1,'Korea, Republic of','KOR','KR',1),(114,1,'Kuwait','KWT','KW',1),(115,1,'Kyrgyzstan','KGZ','KG',1),(116,1,'Lao People\'s Democratic Republic','LAO','LA',1),(117,1,'Latvia','LVA','LV',1),(118,1,'Lebanon','LBN','LB',1),(119,1,'Lesotho','LSO','LS',1),(120,1,'Liberia','LBR','LR',1),(121,1,'Libyan Arab Jamahiriya','LBY','LY',1),(122,1,'Liechtenstein','LIE','LI',1),(123,1,'Lithuania','LTU','LT',1),(124,1,'Luxembourg','LUX','LU',1),(125,1,'Macau','MAC','MO',1),(126,1,'Macedonia, The Former Yugoslav Republic of','MKD','MK',1),(127,1,'Madagascar','MDG','MG',1),(128,1,'Malawi','MWI','MW',1),(129,1,'Malaysia','MYS','MY',1),(130,1,'Maldives','MDV','MV',1),(131,1,'Mali','MLI','ML',1),(132,1,'Malta','MLT','MT',1),(133,1,'Marshall Islands','MHL','MH',1),(134,1,'Martinique','MTQ','MQ',1),(135,1,'Mauritania','MRT','MR',1),(136,1,'Mauritius','MUS','MU',1),(137,1,'Mayotte','MYT','YT',1),(138,1,'Mexico','MEX','MX',1),(139,1,'Micronesia, Federated States of','FSM','FM',1),(140,1,'Moldova, Republic of','MDA','MD',1),(141,1,'Monaco','MCO','MC',1),(142,1,'Mongolia','MNG','MN',1),(143,1,'Montserrat','MSR','MS',1),(144,1,'Morocco','MAR','MA',1),(145,1,'Mozambique','MOZ','MZ',1),(146,1,'Myanmar','MMR','MM',1),(147,1,'Namibia','NAM','NA',1),(148,1,'Nauru','NRU','NR',1),(149,1,'Nepal','NPL','NP',1),(150,1,'Netherlands','NLD','NL',1),(151,1,'Netherlands Antilles','ANT','AN',1),(152,1,'New Caledonia','NCL','NC',1),(153,1,'New Zealand','NZL','NZ',1),(154,1,'Nicaragua','NIC','NI',1),(155,1,'Niger','NER','NE',1),(156,1,'Nigeria','NGA','NG',1),(157,1,'Niue','NIU','NU',1),(158,1,'Norfolk Island','NFK','NF',1),(159,1,'Northern Mariana Islands','MNP','MP',1),(160,1,'Norway','NOR','NO',1),(161,1,'Oman','OMN','OM',1),(162,1,'Pakistan','PAK','PK',1),(163,1,'Palau','PLW','PW',1),(164,1,'Panama','PAN','PA',1),(165,1,'Papua New Guinea','PNG','PG',1),(166,1,'Paraguay','PRY','PY',1),(167,1,'Peru','PER','PE',1),(168,1,'Philippines','PHL','PH',1),(169,1,'Pitcairn','PCN','PN',1),(170,1,'Poland','POL','PL',1),(171,1,'Portugal','PRT','PT',1),(172,1,'Puerto Rico','PRI','PR',1),(173,1,'Qatar','QAT','QA',1),(174,1,'Reunion','REU','RE',1),(175,1,'Romania','ROM','RO',1),(176,1,'Russian Federation','RUS','RU',1),(177,1,'Rwanda','RWA','RW',1),(178,1,'Saint Kitts and Nevis','KNA','KN',1),(179,1,'Saint Lucia','LCA','LC',1),(180,1,'Saint Vincent and the Grenadines','VCT','VC',1),(181,1,'Samoa','WSM','WS',1),(182,1,'San Marino','SMR','SM',1),(183,1,'Sao Tome and Principe','STP','ST',1),(184,1,'Saudi Arabia','SAU','SA',1),(185,1,'Senegal','SEN','SN',1),(186,1,'Seychelles','SYC','SC',1),(187,1,'Sierra Leone','SLE','SL',1),(188,1,'Singapore','SGP','SG',1),(189,1,'Slovakia (Slovak Republic)','SVK','SK',1),(190,1,'Slovenia','SVN','SI',1),(191,1,'Solomon Islands','SLB','SB',1),(192,1,'Somalia','SOM','SO',1),(193,1,'South Africa','ZAF','ZA',1),(194,1,'South Georgia and the South Sandwich Islands','SGS','GS',1),(195,1,'Spain','ESP','ES',1),(196,1,'Sri Lanka','LKA','LK',1),(197,1,'St. Helena','SHN','SH',1),(198,1,'St. Pierre and Miquelon','SPM','PM',1),(199,1,'Sudan','SDN','SD',1),(200,1,'Suriname','SUR','SR',1),(201,1,'Svalbard and Jan Mayen Islands','SJM','SJ',1),(202,1,'Swaziland','SWZ','SZ',1),(203,1,'Sweden','SWE','SE',1),(204,1,'Switzerland','CHE','CH',1),(205,1,'Syrian Arab Republic','SYR','SY',1),(206,1,'Taiwan','TWN','TW',1),(207,1,'Tajikistan','TJK','TJ',1),(208,1,'Tanzania, United Republic of','TZA','TZ',1),(209,1,'Thailand','THA','TH',1),(210,1,'Togo','TGO','TG',1),(211,1,'Tokelau','TKL','TK',1),(212,1,'Tonga','TON','TO',1),(213,1,'Trinidad and Tobago','TTO','TT',1),(214,1,'Tunisia','TUN','TN',1),(215,1,'Turkey','TUR','TR',1),(216,1,'Turkmenistan','TKM','TM',1),(217,1,'Turks and Caicos Islands','TCA','TC',1),(218,1,'Tuvalu','TUV','TV',1),(219,1,'Uganda','UGA','UG',1),(220,1,'Ukraine','UKR','UA',1),(221,1,'United Arab Emirates','ARE','AE',1),(222,1,'United Kingdom','GBR','GB',1),(223,1,'United States','USA','US',1),(224,1,'United States Minor Outlying Islands','UMI','UM',1),(225,1,'Uruguay','URY','UY',1),(226,1,'Uzbekistan','UZB','UZ',1),(227,1,'Vanuatu','VUT','VU',1),(228,1,'Vatican City State (Holy See)','VAT','VA',1),(229,1,'Venezuela','VEN','VE',1),(230,1,'Viet Nam','VNM','VN',1),(231,1,'Virgin Islands (British)','VGB','VG',1),(232,1,'Virgin Islands (U.S.)','VIR','VI',1),(233,1,'Wallis and Futuna Islands','WLF','WF',1),(234,1,'Western Sahara','ESH','EH',1),(235,1,'Yemen','YEM','YE',1),(236,1,'Serbia','SRB','RS',1),(237,1,'The Democratic Republic of Congo','DRC','DC',1),(238,1,'Zambia','ZMB','ZM',1),(239,1,'Zimbabwe','ZWE','ZW',1),(240,1,'East Timor','XET','XE',1),(241,1,'Jersey','XJE','XJ',1),(242,1,'St. Barthelemy','XSB','XB',1),(243,1,'St. Eustatius','XSE','XU',1),(244,1,'Canary Islands','XCA','XC',1),(245,1,'Montenegro','MNE','ME',1);
/*!40000 ALTER TABLE `bk078_osmembership_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_k2_attachments`
--

DROP TABLE IF EXISTS `bk078_k2_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_k2_attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemID` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `titleAttribute` text NOT NULL,
  `hits` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `itemID` (`itemID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_k2_attachments`
--

LOCK TABLES `bk078_k2_attachments` WRITE;
/*!40000 ALTER TABLE `bk078_k2_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_k2_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_osmembership_urls`
--

DROP TABLE IF EXISTS `bk078_osmembership_urls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_osmembership_urls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_id` int(11) DEFAULT NULL,
  `url` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_osmembership_urls`
--

LOCK TABLES `bk078_osmembership_urls` WRITE;
/*!40000 ALTER TABLE `bk078_osmembership_urls` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_osmembership_urls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_content`
--

DROP TABLE IF EXISTS `bk078_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__#__ table.',
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `title_alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Deprecated in Joomla! 3.0',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `sectionid` int(10) unsigned NOT NULL DEFAULT '0',
  `mask` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` varchar(5120) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `parentid` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `language` char(7) NOT NULL COMMENT 'The language code for the article.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_content`
--

LOCK TABLES `bk078_content` WRITE;
/*!40000 ALTER TABLE `bk078_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_comprofiler_members`
--

DROP TABLE IF EXISTS `bk078_comprofiler_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_comprofiler_members` (
  `referenceid` int(11) NOT NULL DEFAULT '0',
  `memberid` int(11) NOT NULL DEFAULT '0',
  `accepted` tinyint(1) NOT NULL DEFAULT '1',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `membersince` date NOT NULL DEFAULT '0000-00-00',
  `reason` mediumtext,
  `description` varchar(255) DEFAULT NULL,
  `type` mediumtext,
  PRIMARY KEY (`referenceid`,`memberid`),
  KEY `pamr` (`pending`,`accepted`,`memberid`,`referenceid`),
  KEY `aprm` (`accepted`,`pending`,`referenceid`,`memberid`),
  KEY `membrefid` (`memberid`,`referenceid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_comprofiler_members`
--

LOCK TABLES `bk078_comprofiler_members` WRITE;
/*!40000 ALTER TABLE `bk078_comprofiler_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_comprofiler_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_k2_rating`
--

DROP TABLE IF EXISTS `bk078_k2_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_k2_rating` (
  `itemID` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(11) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(11) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`itemID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_k2_rating`
--

LOCK TABLES `bk078_k2_rating` WRITE;
/*!40000 ALTER TABLE `bk078_k2_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_k2_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_k2_tags`
--

DROP TABLE IF EXISTS `bk078_k2_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_k2_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `published` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `published` (`published`),
  FULLTEXT KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_k2_tags`
--

LOCK TABLES `bk078_k2_tags` WRITE;
/*!40000 ALTER TABLE `bk078_k2_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_k2_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_finder_links_termsf`
--

DROP TABLE IF EXISTS `bk078_finder_links_termsf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_finder_links_termsf` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_finder_links_termsf`
--

LOCK TABLES `bk078_finder_links_termsf` WRITE;
/*!40000 ALTER TABLE `bk078_finder_links_termsf` DISABLE KEYS */;
INSERT INTO `bk078_finder_links_termsf` VALUES (65,4307,0.04662),(65,4308,0.88669),(65,4309,0.95669),(65,4310,0.88669),(65,4311,0.95669),(67,4307,0.56007),(67,4310,0.88669),(67,4985,0.14),(67,4986,0.93331),(67,4987,1.14331),(67,4988,0.42),(67,4989,1.00331),(67,4990,1.07331),(67,4991,0.91),(67,4992,0.98),(67,4993,0.88669),(67,4994,1.12),(67,4995,0.09331),(67,4996,0.84),(67,4997,0.98),(67,4998,0.18669),(67,4999,0.86331),(67,5000,1.00331),(67,5001,0.18669),(67,5002,1.07331),(67,5003,1.23669),(67,5004,0.18669),(67,5005,0.88669),(67,5006,1.09669),(67,5007,0.23331),(67,5008,1.02669),(67,5009,1.21331),(67,5010,0.14),(67,5011,0.86331),(67,5012,0.98),(67,5013,0.91),(67,5014,1.09669),(67,5015,1.05),(67,5016,0.91),(67,5017,1.12),(67,5018,0.18669),(67,5019,0.91),(67,5020,1.00331),(67,5026,0.42),(67,5027,1.00331),(67,5028,1.16669),(67,5029,0.46669),(67,5030,1.21331),(67,5031,1.33);
/*!40000 ALTER TABLE `bk078_finder_links_termsf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_finder_terms`
--

DROP TABLE IF EXISTS `bk078_finder_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_finder_terms` (
  `term_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '0',
  `soundex` varchar(75) NOT NULL,
  `links` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `idx_term` (`term`),
  KEY `idx_term_phrase` (`term`,`phrase`),
  KEY `idx_stem_phrase` (`stem`,`phrase`),
  KEY `idx_soundex_phrase` (`soundex`,`phrase`)
) ENGINE=MyISAM AUTO_INCREMENT=5035 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_finder_terms`
--

LOCK TABLES `bk078_finder_terms` WRITE;
/*!40000 ALTER TABLE `bk078_finder_terms` DISABLE KEYS */;
INSERT INTO `bk078_finder_terms` VALUES (1,'','',0,0,0,'',134),(2,'1','1',0,0,0.1,'',10),(4,'index','index',0,0,0.3333,'I532',135),(5,'loadposition','loadposit',0,0,0.8,'L31235',2),(11,'super','super',0,0,0.3333,'S160',25),(12,'super user','super user',0,1,1.3333,'S1626',25),(14,'user','user',0,0,0.2667,'U260',120),(15,'43','43',0,0,0.2,'',3),(16,'ac','ac',0,0,0.1333,'A200',104),(17,'ac condimentum','ac condimentum',0,1,1.4667,'A253535',75),(18,'ac condimentum non','ac condimentum non',0,1,1.6,'A253535',75),(19,'ac lacinia','ac lacinia',0,1,1.3333,'A2425',75),(20,'ac lacinia at','ac lacinia at',0,1,1.4333,'A24253',75),(21,'ac nulla','ac nulla',0,1,1.2667,'A254',75),(22,'ac nulla donec','ac nulla donec',0,1,1.4667,'A254352',75),(23,'ac pulvinar','ac pulvinar',0,1,1.3667,'A214156',75),(24,'ac pulvinar integer','ac pulvinar integer',0,1,1.6333,'A2141565326',75),(25,'accumsan','accumsan',0,0,0.5333,'A2525',93),(26,'accumsan posuere','accumsan posuere',0,1,1.5333,'A2525126',75),(27,'accumsan posuere quam','accumsan posuere quam',0,1,1.7,'A252512625',75),(28,'ad','ad',0,0,0.1333,'A300',75),(29,'ad litora','ad litora',0,1,1.3,'A3436',75),(30,'ad litora torquent','ad litora torquent',0,1,1.6,'A343636253',75),(31,'adipiscing','adipisc',0,0,0.6667,'A31252',94),(32,'adipiscing suscipit','adipisc suscipit',0,1,1.6333,'A3125213',77),(33,'adipiscing suscipit neque','adipisc suscipit neque',0,1,1.8333,'A312521352',77),(34,'aenean','aenean',0,0,0.4,'A500',78),(35,'aenean orci','aenean orci',0,1,1.3667,'A562',77),(36,'aenean orci mauris','aenean orci mauris',0,1,1.6,'A562562',77),(37,'aliquet','aliquet',0,0,0.4667,'A423',83),(38,'aliquet eu','aliquet eu',0,1,1.3333,'A423',75),(39,'aliquet eu in','aliquet eu in',0,1,1.4333,'A4235',75),(40,'aliquet iaculis','aliquet iaculis',0,1,1.5,'A423242',75),(41,'aliquet iaculis nulla','aliquet iaculis nulla',0,1,1.7,'A42324254',75),(42,'amet','amet',0,0,0.2667,'A530',95),(43,'amet dapibus','amet dapibus',0,1,1.4,'A5312',75),(44,'amet dapibus pretium','amet dapibus pretium',0,1,1.6667,'A53121635',75),(45,'amet dictum','amet dictum',0,1,1.3667,'A53235',75),(46,'amet dictum viverra','amet dictum viverra',0,1,1.6333,'A5323516',75),(47,'amet elementum','amet elementum',0,1,1.4667,'A534535',81),(48,'amet elementum nibh','amet elementum nibh',0,1,1.6333,'A5345351',75),(49,'amet hendrerit','amet hendrerit',0,1,1.4667,'A535363',75),(50,'amet hendrerit sit','amet hendrerit sit',0,1,1.6,'A53536323',75),(51,'amet neque','amet neque',0,1,1.3333,'A5352',75),(52,'amet neque cras','amet neque cras',0,1,1.5,'A535262',75),(53,'amet nulla','amet nulla',0,1,1.3333,'A5354',75),(54,'amet nulla id','amet nulla id',0,1,1.4333,'A53543',75),(55,'amet tincidunt','amet tincidunt',0,1,1.4667,'A5352353',77),(56,'amet tincidunt eget','amet tincidunt eget',0,1,1.6333,'A535235323',77),(57,'ante','ant',0,0,0.2667,'A530',95),(58,'ante aliquet','ant aliquet',0,1,1.4,'A53423',83),(59,'ante aliquet eu','ant aliquet eu',0,1,1.5,'A53423',75),(60,'ante iaculis','ant iaculis',0,1,1.4,'A53242',75),(61,'ante iaculis fermentum','ant iaculis fermentum',0,1,1.7333,'A5324216535',75),(62,'aptent','aptent',0,0,0.4,'A1353',75),(63,'aptent taciti','aptent taciti',0,1,1.4333,'A135323',75),(64,'aptent taciti sociosqu','aptent taciti sociosqu',0,1,1.7333,'A1353232',75),(65,'arcu','arcu',0,0,0.2667,'A620',85),(66,'arcu eros','arcu eros',0,1,1.3,'A6262',75),(67,'arcu eros at','arcu eros at',0,1,1.4,'A62623',75),(68,'arcu phasellus','arcu phasellus',0,1,1.4667,'A621242',75),(69,'arcu phasellus magna','arcu phasellus magna',0,1,1.6667,'A621242525',75),(70,'at','at',0,0,0.1333,'A300',86),(71,'at diam','at diam',0,1,1.2333,'A350',75),(72,'at diam tempus','at diam tempus',0,1,1.4667,'A353512',75),(73,'at imperdiet','at imperdiet',0,1,1.4,'A35163',75),(74,'at imperdiet lacus','at imperdiet lacus',0,1,1.6,'A3516342',75),(75,'at massa','at massa',0,1,1.2667,'A352',75),(76,'at massa arcu','at massa arcu',0,1,1.4333,'A35262',75),(77,'at pellentesque','at pellentesque',0,1,1.5,'A314532',75),(78,'at pellentesque ac','at pellentesque ac',0,1,1.6,'A314532',75),(79,'at pretium','at pretium',0,1,1.3333,'A31635',77),(80,'at pretium morbi','at pretium morbi',0,1,1.5333,'A3163561',75),(81,'at vestibulum','at vestibulum',0,1,1.4333,'A3123145',75),(82,'at vestibulum metus','at vestibulum metus',0,1,1.6333,'A312314532',75),(83,'auctor','auctor',0,0,0.4,'A236',92),(84,'auctor non','auctor non',0,1,1.3333,'A2365',75),(85,'auctor non cursus','auctor non cursus',0,1,1.5667,'A2365262',75),(86,'bibendum','bibendum',0,0,0.5333,'B535',83),(87,'bibendum eleifend','bibendum eleifend',0,1,1.5667,'B5354153',75),(88,'bibendum eleifend id','bibendum eleifend id',0,1,1.6667,'B5354153',75),(89,'carousel','carousel',0,0,0.5333,'C624',11),(90,'carousel item','carousel item',0,1,1.4333,'C62435',5),(91,'carousel item 1','carousel item 1',0,1,1.5,'C62435',2),(92,'class','class',0,0,0.3333,'C420',75),(93,'class aptent','class aptent',0,1,1.4,'C421353',75),(94,'class aptent taciti','class aptent taciti',0,1,1.6333,'C42135323',75),(95,'commodo','commodo',0,0,0.4667,'C530',83),(96,'commodo sapien','commodo sapien',0,1,1.4667,'C53215',75),(97,'commodo sapien eget','commodo sapien eget',0,1,1.6333,'C5321523',75),(98,'condimentum','condimentum',0,0,0.7333,'C53535',84),(99,'condimentum eu','condimentum eu',0,1,1.4667,'C53535',75),(100,'condimentum interdum','condimentum interdum',0,1,1.6667,'C535353635',75),(101,'condimentum interdum diam','condimentum interdum diam',0,1,1.8333,'C53535363535',75),(102,'condimentum non','condimentum non',0,1,1.5,'C53535',75),(103,'condimentum non imperdiet','condimentum non imperdiet',0,1,1.8333,'C53535163',75),(104,'condimentum ullamcorper','condimentum ullamcorper',0,1,1.7667,'C53535452616',75),(105,'condimentum ullamcorper nisi','condimentum ullamcorper nisi',0,1,1.9333,'C5353545261652',75),(106,'consectetur','consectetur',0,0,0.7333,'C5236',94),(107,'consectetur morbi','consectetur morbi',0,1,1.5667,'C5236561',75),(108,'consectetur morbi vitae','consectetur morbi vitae',0,1,1.7667,'C52365613',75),(109,'consectetur sapien','consectetur sapien',0,1,1.6,'C5236215',75),(110,'consectetur sapien nec','consectetur sapien nec',0,1,1.7333,'C52362152',75),(111,'consectetur vel','consectetur vel',0,1,1.5,'C523614',75),(112,'consectetur vel risus','consectetur vel risus',0,1,1.7,'C52361462',75),(113,'consequat','consequat',0,0,0.6,'C523',95),(114,'consequat mi','consequat mi',0,1,1.4,'C5235',77),(115,'consequat mi aenean','consequat mi aenean',0,1,1.6333,'C5235',77),(116,'conubia','conubia',0,0,0.4667,'C510',75),(117,'conubia nostra','conubia nostra',0,1,1.4667,'C515236',75),(118,'conubia nostra per','conubia nostra per',0,1,1.6,'C51523616',75),(119,'convallis','conval',0,0,0.6,'C5142',92),(120,'convallis semper','conval semper',0,1,1.5333,'C5142516',75),(121,'convallis semper cursus','conval semper cursus',0,1,1.7667,'C5142516262',75),(122,'cras','cra',0,0,0.2667,'C620',93),(123,'cras condimentum','cra condimentum',0,1,1.5333,'C6253535',75),(124,'cras condimentum ullamcorper','cra condimentum ullamcorper',0,1,1.9333,'C6253535452616',75),(125,'curabitur','curabitur',0,0,0.6,'C6136',87),(126,'curabitur interdum','curabitur interdum',0,1,1.6,'C613653635',81),(127,'curabitur interdum euismod','curabitur interdum euismod',0,1,1.8667,'C613653635253',75),(128,'curabitur sollicitudin','curabitur sollicitudin',0,1,1.7333,'C613624235',77),(129,'curabitur sollicitudin ornare','curabitur sollicitudin ornare',0,1,1.9667,'C613624235656',77),(130,'cursus','cursu',0,0,0.4,'C620',92),(131,'cursus sed','cursu sed',0,1,1.3333,'C623',75),(132,'cursus sed elementum','cursu sed elementum',0,1,1.6667,'C6234535',75),(133,'cursus ut','cursu ut',0,1,1.3,'C623',75),(134,'cursus ut mauris','cursu ut mauris',0,1,1.5333,'C623562',75),(135,'dapibus','dapibu',0,0,0.4667,'D120',101),(136,'dapibus pretium','dapibu pretium',0,1,1.5,'D121635',75),(137,'dapibus pretium dui','dapibu pretium dui',0,1,1.6333,'D1216353',75),(138,'dapibus turpis','dapibu turpis',0,1,1.4667,'D123612',75),(139,'dapibus turpis semper','dapibu turpis semper',0,1,1.7,'D123612516',75),(140,'diam','diam',0,0,0.2667,'D500',91),(141,'diam eu','diam eu',0,1,1.2333,'D500',76),(142,'diam eu quam','diam eu quam',0,1,1.4,'D525',75),(143,'diam malesuada','diam malesuada',0,1,1.4667,'D5423',81),(144,'diam malesuada sit','diam malesuada sit',0,1,1.6,'D542323',75),(145,'diam quis','diam quis',0,1,1.3,'D520',75),(146,'diam quis imperdiet','diam quis imperdiet',0,1,1.6333,'D525163',75),(147,'diam tempus','diam tempus',0,1,1.3667,'D53512',75),(148,'diam tempus luctus','diam tempus luctus',0,1,1.6,'D535124232',75),(149,'dictum','dictum',0,0,0.4,'D235',91),(150,'dictum lorem','dictum lorem',0,1,1.4,'D235465',75),(151,'dictum lorem at','dictum lorem at',0,1,1.5,'D2354653',75),(152,'dictum viverra','dictum viverra',0,1,1.4667,'D23516',75),(153,'dictum viverra metus','dictum viverra metus',0,1,1.6667,'D23516532',75),(154,'dignissim','dignissim',0,0,0.6,'D2525',103),(155,'dignissim nulla','dignissim nulla',0,1,1.5,'D25254',75),(156,'dignissim nulla condimentum','dignissim nulla condimentum',0,1,1.9,'D25254253535',75),(157,'dignissim velit','dignissim velit',0,1,1.5,'D2525143',76),(158,'dignissim velit accumsan','dignissim velit accumsan',0,1,1.8,'D25251432525',75),(159,'dolor','dolor',0,0,0.3333,'D460',104),(160,'dolor eget','dolor eget',0,1,1.3333,'D4623',83),(161,'dolor eget dui','dolor eget dui',0,1,1.4667,'D4623',75),(162,'dolor tempus','dolor tempus',0,1,1.4,'D463512',58),(163,'dolor tempus ac','dolor tempus ac',0,1,1.5,'D463512',58),(164,'donec','donec',0,0,0.3333,'D520',83),(165,'donec eros','donec eros',0,1,1.3333,'D5262',75),(166,'donec eros odio','donec eros odio',0,1,1.5,'D52623',75),(167,'donec imperdiet','donec imperdiet',0,1,1.5,'D525163',75),(168,'donec imperdiet nisl','donec imperdiet nisl',0,1,1.6667,'D525163524',75),(169,'donec tempus','donec tempus',0,1,1.4,'D523512',75),(170,'donec tempus diam','donec tempus diam',0,1,1.5667,'D52351235',75),(171,'dui','dui',0,0,0.2,'D000',84),(172,'dui bibendum','dui bibendum',0,1,1.4,'D1535',75),(173,'dui bibendum eleifend','dui bibendum eleifend',0,1,1.7,'D15354153',75),(174,'dui metus','dui metus',0,1,1.3,'D532',75),(175,'dui metus dapibus','dui metus dapibus',0,1,1.5667,'D532312',75),(176,'egestas','egesta',0,0,0.4667,'E232',94),(177,'egestas consequat','egesta consequat',0,1,1.5667,'E232523',77),(178,'egestas consequat mi','egesta consequat mi',0,1,1.6667,'E2325235',77),(179,'eget','eget',0,0,0.2667,'E230',105),(180,'eget consectetur','eget consectetur',0,1,1.5333,'E2325236',75),(181,'eget consectetur vel','eget consectetur vel',0,1,1.6667,'E232523614',75),(182,'eget dui','eget dui',0,1,1.2667,'E230',75),(183,'eget dui bibendum','eget dui bibendum',0,1,1.5667,'E231535',75),(184,'eget facilisis','eget facilisis',0,1,1.4667,'E231242',78),(185,'eget facilisis id','eget facilisis id',0,1,1.5667,'E2312423',77),(186,'eget justo','eget justo',0,1,1.3333,'E2323',83),(187,'eget justo aliquet','eget justo aliquet',0,1,1.6,'E2323423',75),(188,'eget lacinia','eget lacinia',0,1,1.4,'E23425',75),(189,'eget lacinia nullam','eget lacinia nullam',0,1,1.6333,'E2342545',75),(190,'eget ligula','eget ligula',0,1,1.3667,'E23424',75),(191,'eget ligula cras','eget ligula cras',0,1,1.5333,'E23424262',75),(192,'eleifend','eleifend',0,0,0.5333,'E4153',75),(193,'eleifend consectetur','eleifend consectetur',0,1,1.6667,'E415325236',75),(194,'eleifend consectetur sapien','eleifend consectetur sapien',0,1,1.9,'E415325236215',75),(195,'eleifend dignissim','eleifend dignissim',0,1,1.6,'E41532525',75),(196,'eleifend dignissim velit','eleifend dignissim velit',0,1,1.8,'E41532525143',75),(197,'eleifend id','eleifend id',0,1,1.3667,'E4153',75),(198,'eleifend id eu','eleifend id eu',0,1,1.4667,'E4153',75),(199,'elementum','elementum',0,0,0.6,'E4535',93),(200,'elementum nibh','elementum nibh',0,1,1.4667,'E45351',75),(201,'elementum nibh laoreet','elementum nibh laoreet',0,1,1.7333,'E45351463',75),(202,'elementum sit','elementum sit',0,1,1.4333,'E453523',76),(203,'elementum sit amet','elementum sit amet',0,1,1.6,'E45352353',76),(204,'elementum vel','elementum vel',0,1,1.4333,'E453514',75),(205,'elementum vel fringilla','elementum vel fringilla',0,1,1.7667,'E45351416524',75),(206,'erat','erat',0,0,0.2667,'E630',94),(207,'erat at','erat at',0,1,1.2333,'E630',75),(208,'erat at vestibulum','erat at vestibulum',0,1,1.6,'E63123145',75),(209,'erat orci','erat orci',0,1,1.3,'E6362',75),(210,'erat orci elementum','erat orci elementum',0,1,1.6333,'E63624535',75),(211,'erat sit','erat sit',0,1,1.2667,'E6323',75),(212,'erat sit amet','erat sit amet',0,1,1.4333,'E632353',75),(213,'erat tempus','erat tempus',0,1,1.3667,'E63512',75),(214,'erat tempus morbi','erat tempus morbi',0,1,1.5667,'E63512561',75),(215,'eros','ero',0,0,0.2667,'E620',92),(216,'eros at','ero at',0,1,1.2333,'E623',75),(217,'eros at imperdiet','ero at imperdiet',0,1,1.5667,'E6235163',75),(218,'eros id','ero id',0,1,1.2333,'E623',75),(219,'eros id venenatis','ero id venenatis',0,1,1.5667,'E6231532',75),(220,'eros odio','ero odio',0,1,1.3,'E623',75),(221,'eros odio sagittis','ero odio sagittis',0,1,1.6,'E623232',75),(222,'eros ut','ero ut',0,1,1.2333,'E623',81),(223,'eros ut ante','ero ut ante',0,1,1.4,'E62353',75),(224,'et','et',0,0,0.1333,'E300',93),(225,'et curabitur','et curabitur',0,1,1.4,'E326136',81),(226,'et curabitur interdum','et curabitur interdum',0,1,1.7,'E32613653635',81),(227,'et in','et in',0,1,1.1667,'E350',75),(228,'et in venenatis','et in venenatis',0,1,1.5,'E351532',75),(229,'et mauris','et mauris',0,1,1.3,'E3562',75),(230,'et mauris quisque','et mauris quisque',0,1,1.5667,'E3562',75),(231,'etiam','etiam',0,0,0.3333,'E350',84),(232,'etiam sed','etiam sed',0,1,1.3,'E3523',75),(233,'etiam sed magna','etiam sed magna',0,1,1.5,'E3523525',75),(234,'etiam tortor','etiam tortor',0,1,1.4,'E353636',75),(235,'etiam tortor massa','etiam tortor massa',0,1,1.6,'E35363652',75),(236,'eu','eu',0,0,0.1333,'E000',85),(237,'eu auctor','eu auctor',0,1,1.3,'E236',75),(238,'eu auctor non','eu auctor non',0,1,1.4333,'E2365',75),(239,'eu in','eu in',0,1,1.1667,'E500',75),(240,'eu in varius','eu in varius',0,1,1.4,'E5162',75),(241,'eu nisi','eu nisi',0,1,1.2333,'E520',75),(242,'eu nisi sed','eu nisi sed',0,1,1.3667,'E523',75),(243,'eu quam','eu quam',0,1,1.2333,'E250',75),(244,'eu quam pulvinar','eu quam pulvinar',0,1,1.5333,'E2514156',75),(245,'eu sem','eu sem',0,1,1.2,'E250',75),(246,'eu sem donec','eu sem donec',0,1,1.4,'E25352',75),(247,'euismod','euismod',0,0,0.4667,'E253',90),(248,'euismod consectetur','euismod consectetur',0,1,1.6333,'E25325236',75),(249,'euismod consectetur morbi','euismod consectetur morbi',0,1,1.8333,'E25325236561',75),(250,'euismod faucibus','euismod faucibus',0,1,1.5333,'E2531212',75),(251,'euismod faucibus sed','euismod faucibus sed',0,1,1.6667,'E25312123',75),(252,'facilisis','facilisi',0,0,0.6,'F242',93),(253,'facilisis erat','facilisi erat',0,1,1.4667,'F24263',75),(254,'facilisis erat tempus','facilisi erat tempus',0,1,1.7,'F24263512',75),(255,'facilisis id','facilisi id',0,1,1.4,'F2423',77),(256,'facilisis id ligula','facilisi id ligula',0,1,1.6333,'F2423424',77),(257,'faucibus','faucibu',0,0,0.5333,'F212',84),(258,'faucibus sed','faucibu sed',0,1,1.4,'F2123',75),(259,'faucibus sed commodo','faucibu sed commodo',0,1,1.6667,'F2123253',75),(260,'felis','feli',0,0,0.3333,'F420',90),(261,'felis nunc','feli nunc',0,1,1.3333,'F4252',75),(262,'felis nunc in','feli nunc in',0,1,1.4333,'F42525',75),(263,'fermentum','fermentum',0,0,0.6,'F6535',86),(264,'fermentum gravida','fermentum gravida',0,1,1.5667,'F65352613',75),(265,'fermentum gravida eu','fermentum gravida eu',0,1,1.6667,'F65352613',75),(266,'fringilla','fringilla',0,0,0.6,'F6524',84),(267,'fringilla eget','fringilla eget',0,1,1.4667,'F652423',81),(268,'fringilla eget consectetur','fringilla eget consectetur',0,1,1.8667,'F65242325236',75),(269,'fringilla sagittis','fringilla sagittis',0,1,1.6,'F6524232',75),(270,'fringilla sagittis mi','fringilla sagittis mi',0,1,1.7,'F65242325',75),(271,'fusce','fusc',0,0,0.3333,'F200',85),(272,'fusce in','fusc in',0,1,1.2667,'F250',75),(273,'fusce in dolor','fusc in dolor',0,1,1.4667,'F25346',75),(274,'gravida','gravida',0,0,0.4667,'G613',92),(275,'gravida eu','gravida eu',0,1,1.3333,'G613',75),(276,'gravida eu nisi','gravida eu nisi',0,1,1.5,'G61352',75),(277,'hendrerit','hendrerit',0,0,0.6,'H5363',92),(278,'hendrerit sit','hendrerit sit',0,1,1.4333,'H536323',75),(279,'hendrerit sit amet','hendrerit sit amet',0,1,1.6,'H53632353',75),(280,'himenaeos','himenaeo',0,0,0.6,'H520',75),(281,'himenaeos maecenas','himenaeo maecenas',0,1,1.6,'H525252',75),(282,'himenaeos maecenas venenatis','himenaeo maecenas venenatis',0,1,1.9333,'H5252521532',75),(283,'iaculis','iaculi',0,0,0.4667,'I242',82),(284,'iaculis fermentum','iaculi fermentum',0,1,1.5667,'I24216535',75),(285,'iaculis fermentum gravida','iaculi fermentum gravida',0,1,1.8333,'I242165352613',75),(286,'iaculis nulla','iaculi nulla',0,1,1.4333,'I24254',75),(287,'iaculis nulla condimentum','iaculi nulla condimentum',0,1,1.8333,'I24254253535',75),(288,'id','id',0,0,0.1333,'I300',86),(289,'id eu','id eu',0,1,1.1667,'I300',75),(290,'id eu sem','id eu sem',0,1,1.3,'I325',75),(291,'id ligula','id ligula',0,1,1.3,'I3424',77),(292,'id ligula curabitur','id ligula curabitur',0,1,1.6333,'I342426136',77),(293,'id sed','id sed',0,1,1.2,'I323',75),(294,'id sed eleifend','id sed eleifend',0,1,1.5,'I3234153',75),(295,'id venenatis','id venenatis',0,1,1.4,'I31532',75),(296,'id venenatis quisque','id venenatis quisque',0,1,1.6667,'I31532',75),(297,'id vestibulum','id vestibulum',0,1,1.4333,'I3123145',75),(298,'id vestibulum felis','id vestibulum felis',0,1,1.6333,'I3123145142',75),(299,'imperdiet','imperdiet',0,0,0.6,'I5163',76),(300,'imperdiet ante','imperdiet ante',0,1,1.4667,'I516353',75),(301,'imperdiet ante aliquet','imperdiet ante aliquet',0,1,1.7333,'I516353423',75),(302,'imperdiet eget','imperdiet eget',0,1,1.4667,'I516323',75),(303,'imperdiet eget ligula','imperdiet eget ligula',0,1,1.7,'I516323424',75),(304,'imperdiet etiam','imperdiet etiam',0,1,1.5,'I51635',75),(305,'imperdiet etiam sed','imperdiet etiam sed',0,1,1.6333,'I5163523',75),(306,'imperdiet lacus','imperdiet lacus',0,1,1.5,'I516342',75),(307,'imperdiet lacus vivamus','imperdiet lacus vivamus',0,1,1.7667,'I516342152',75),(308,'imperdiet nisl','imperdiet nisl',0,1,1.4667,'I5163524',75),(309,'imperdiet nisl sit','imperdiet nisl sit',0,1,1.6,'I516352423',75),(310,'in','in',0,0,0.1333,'I500',101),(311,'in arcu','in arcu',0,1,1.2333,'I562',75),(312,'in arcu eros','in arcu eros',0,1,1.4,'I56262',75),(313,'in dolor','in dolor',0,1,1.2667,'I5346',75),(314,'in dolor eget','in dolor eget',0,1,1.4333,'I534623',75),(315,'in fusce','in fusce',0,1,1.2667,'I512',75),(316,'in fusce in','in fusce in',0,1,1.3667,'I5125',75),(317,'in libero','in libero',0,1,1.3,'I5416',83),(318,'in libero ipsum','in libero ipsum',0,1,1.5,'I5416125',83),(319,'in semper','in semper',0,1,1.3,'I52516',75),(320,'in semper diam','in semper diam',0,1,1.4667,'I5251635',75),(321,'in varius','in varius',0,1,1.3,'I5162',75),(322,'in varius molestie','in varius molestie',0,1,1.6,'I51625423',75),(323,'in venenatis','in venenatis',0,1,1.4,'I51532',75),(324,'in venenatis malesuada','in venenatis malesuada',0,1,1.7333,'I515325423',75),(325,'inceptos','incepto',0,0,0.5333,'I52132',75),(326,'inceptos himenaeos','incepto himenaeos',0,1,1.6,'I5213252',75),(327,'inceptos himenaeos maecenas','incepto himenaeos maecenas',0,1,1.9,'I52132525252',75),(328,'integer','integ',0,0,0.4667,'I5326',92),(329,'integer dictum','integ dictum',0,1,1.4667,'I53263235',75),(330,'integer dictum lorem','integ dictum lorem',0,1,1.6667,'I53263235465',75),(331,'integer ullamcorper','integ ullamcorper',0,1,1.6333,'I5326452616',75),(332,'integer ullamcorper viverra','integ ullamcorper viverra',0,1,1.9,'I532645261616',75),(333,'interdum','interdum',0,0,0.5333,'I53635',90),(334,'interdum diam','interdum diam',0,1,1.4333,'I5363535',75),(335,'interdum diam quis','interdum diam quis',0,1,1.6,'I53635352',75),(336,'interdum euismod','interdum euismod',0,1,1.5333,'I53635253',75),(337,'interdum euismod faucibus','interdum euismod faucibus',0,1,1.8333,'I536352531212',75),(338,'ipsum','ipsum',0,0,0.3333,'I125',93),(339,'ipsum malesuada','ipsum malesuada',0,1,1.5,'I125423',75),(340,'ipsum malesuada eu','ipsum malesuada eu',0,1,1.6,'I125423',75),(341,'item','item',0,0,0.2667,'I350',127),(342,'item 1','item 1',0,1,1.2,'I350',2),(343,'justo','justo',0,0,0.3333,'J300',104),(344,'justo aliquet','justo aliquet',0,1,1.4333,'J3423',75),(345,'justo aliquet iaculis','justo aliquet iaculis',0,1,1.7,'J3423242',75),(346,'justo vel','justo vel',0,1,1.3,'J314',77),(347,'justo vel pretium','justo vel pretium',0,1,1.5667,'J3141635',77),(348,'k2','k2',0,0,0.1333,'K000',127),(349,'k2 item','k2 item',0,1,1.2333,'K350',127),(350,'lacinia','lacinia',0,0,0.4667,'L250',83),(351,'lacinia at','lacinia at',0,1,1.3333,'L253',75),(352,'lacinia at pellentesque','lacinia at pellentesque',0,1,1.7667,'L25314532',75),(353,'lacinia nullam','lacinia nullam',0,1,1.4667,'L2545',75),(354,'lacinia nullam varius','lacinia nullam varius',0,1,1.7,'L2545162',75),(355,'lacus','lacu',0,0,0.3333,'L200',83),(356,'lacus vivamus','lacu vivamus',0,1,1.4333,'L2152',75),(357,'lacus vivamus lectus','lacu vivamus lectus',0,1,1.6667,'L21524232',75),(358,'laoreet','laoreet',0,0,0.4667,'L630',84),(359,'laoreet in','laoreet in',0,1,1.3333,'L635',75),(360,'laoreet in fusce','laoreet in fusce',0,1,1.5333,'L63512',75),(361,'lectus','lectu',0,0,0.4,'L232',82),(362,'lectus nisl','lectu nisl',0,1,1.3667,'L232524',75),(363,'lectus nisl rhoncus','lectu nisl rhoncus',0,1,1.6333,'L232524652',75),(364,'lectus proin','lectu proin',0,1,1.4,'L232165',75),(365,'lectus proin vestibulum','lectu proin vestibulum',0,1,1.7667,'L232165123145',75),(366,'libero','libero',0,0,0.4,'L160',86),(367,'libero et','libero et',0,1,1.3,'L163',75),(368,'libero et mauris','libero et mauris',0,1,1.5333,'L163562',75),(369,'libero ipsum','libero ipsum',0,1,1.4,'L16125',83),(370,'libero ipsum malesuada','libero ipsum malesuada',0,1,1.7333,'L16125423',75),(371,'ligula','ligula',0,0,0.4,'L240',92),(372,'ligula cras','ligula cras',0,1,1.3667,'L24262',75),(373,'ligula curabitur','ligula curabitur',0,1,1.5333,'L2426136',77),(374,'ligula curabitur sollicitudin','ligula curabitur sollicitudin',0,1,1.9667,'L242613624235',77),(375,'litora','litora',0,0,0.4,'L360',75),(376,'litora torquent','litora torquent',0,1,1.5,'L3636253',75),(377,'litora torquent per','litora torquent per',0,1,1.6333,'L363625316',75),(378,'lobortis','loborti',0,0,0.5333,'L1632',101),(379,'lobortis sagittis','loborti sagittis',0,1,1.5667,'L163232',75),(380,'lobortis sagittis metus','loborti sagittis metus',0,1,1.7667,'L163232532',75),(381,'lorem','lorem',0,0,0.3333,'L650',97),(382,'lorem at','lorem at',0,1,1.2667,'L653',75),(383,'lorem at diam','lorem at diam',0,1,1.4333,'L6535',75),(384,'lorem vel','lorem vel',0,1,1.3,'L6514',75),(385,'lorem vel massa','lorem vel massa',0,1,1.5,'L651452',75),(386,'luctus','luctu',0,0,0.4,'L232',93),(387,'luctus nisl','luctu nisl',0,1,1.3667,'L232524',75),(388,'luctus nisl libero','luctu nisl libero',0,1,1.6,'L23252416',75),(389,'luctus phasellus','luctu phasellus',0,1,1.5333,'L2321242',75),(390,'luctus phasellus non','luctu phasellus non',0,1,1.6667,'L23212425',75),(391,'maecenas','maecena',0,0,0.5333,'M252',83),(392,'maecenas venenatis','maecena venenatis',0,1,1.6,'M2521532',75),(393,'maecenas venenatis sollicitudin','maecena venenatis sollicitudin',0,1,2,'M25215324235',75),(394,'magna','magna',0,0,0.3333,'M250',104),(395,'magna dolor','magna dolor',0,1,1.3667,'M25346',75),(396,'magna dolor tempus','magna dolor tempus',0,1,1.6,'M253463512',58),(397,'magna nunc','magna nunc',0,1,1.3333,'M252',75),(398,'magna nunc etiam','magna nunc etiam',0,1,1.5333,'M25235',75),(399,'malesuada','malesuada',0,0,0.6,'M423',84),(400,'malesuada eu','malesuada eu',0,1,1.4,'M423',75),(401,'malesuada eu auctor','malesuada eu auctor',0,1,1.6333,'M423236',75),(402,'malesuada odio','malesuada odio',0,1,1.4667,'M423',75),(403,'malesuada odio ut','malesuada odio ut',0,1,1.5667,'M423',75),(404,'malesuada sit','malesuada sit',0,1,1.4333,'M42323',75),(405,'malesuada sit amet','malesuada sit amet',0,1,1.6,'M4232353',75),(406,'massa','massa',0,0,0.3333,'M200',91),(407,'massa arcu','massa arcu',0,1,1.3333,'M262',75),(408,'massa arcu phasellus','massa arcu phasellus',0,1,1.6667,'M2621242',75),(409,'massa convallis','massa convallis',0,1,1.5,'M25142',75),(410,'massa convallis semper','massa convallis semper',0,1,1.7333,'M25142516',75),(411,'massa viverra','massa viverra',0,1,1.4333,'M216',75),(412,'massa viverra volutpat','massa viverra volutpat',0,1,1.7333,'M21614313',75),(413,'mauris','mauri',0,0,0.4,'M620',95),(414,'mauris donec','mauri donec',0,1,1.4,'M62352',75),(415,'mauris donec eros','mauri donec eros',0,1,1.5667,'M6235262',75),(416,'mauris quisque','mauri quisque',0,1,1.4667,'M620',75),(417,'mauris quisque egestas','mauri quisque egestas',0,1,1.7333,'M6232',75),(418,'mauris viverra','mauri viverra',0,1,1.4667,'M6216',77),(419,'mauris viverra sit','mauri viverra sit',0,1,1.6,'M621623',77),(420,'metus','metu',0,0,0.3333,'M320',91),(421,'metus dapibus','metu dapibus',0,1,1.4333,'M32312',75),(422,'metus dapibus turpis','metu dapibus turpis',0,1,1.6667,'M323123612',75),(423,'metus eget','metu eget',0,1,1.3333,'M323',75),(424,'metus eget lacinia','metu eget lacinia',0,1,1.6,'M323425',75),(425,'metus sagittis','metu sagittis',0,1,1.4667,'M3232',75),(426,'metus sagittis et','metu sagittis et',0,1,1.5667,'M32323',75),(427,'metus ut','metu ut',0,1,1.2667,'M323',75),(428,'metus ut lobortis','metu ut lobortis',0,1,1.5667,'M32341632',75),(429,'mi','mi',0,0,0.1333,'M000',95),(430,'mi aenean','mi aenean',0,1,1.3,'M000',77),(431,'mi aenean orci','mi aenean orci',0,1,1.4667,'M620',77),(432,'mi in','mi in',0,1,1.1667,'M000',75),(433,'mi in semper','mi in semper',0,1,1.4,'M2516',75),(434,'molestie','molesti',0,0,0.5333,'M423',90),(435,'molestie erat','molesti erat',0,1,1.4333,'M42363',75),(436,'molestie erat sit','molesti erat sit',0,1,1.5667,'M4236323',75),(437,'morbi','morbi',0,0,0.3333,'M610',82),(438,'morbi fringilla','morbi fringilla',0,1,1.5,'M616524',75),(439,'morbi fringilla sagittis','morbi fringilla sagittis',0,1,1.8,'M616524232',75),(440,'morbi vitae','morbi vitae',0,1,1.3667,'M613',75),(441,'morbi vitae porta','morbi vitae porta',0,1,1.5667,'M613163',75),(442,'morbi viverra','morbi viverra',0,1,1.4333,'M616',75),(443,'morbi viverra placerat','morbi viverra placerat',0,1,1.7333,'M61614263',75),(444,'nec','nec',0,0,0.2,'N200',94),(445,'nec dignissim','nec dignissim',0,1,1.4333,'N232525',75),(446,'nec dignissim nulla','nec dignissim nulla',0,1,1.6333,'N2325254',75),(447,'neque','nequ',0,0,0.3333,'N200',87),(448,'neque at','nequ at',0,1,1.2667,'N230',77),(449,'neque at pretium','nequ at pretium',0,1,1.5333,'N231635',77),(450,'neque cras','nequ cras',0,1,1.3333,'N262',75),(451,'neque cras condimentum','nequ cras condimentum',0,1,1.7333,'N26253535',75),(452,'neque vel','nequ vel',0,1,1.3,'N214',75),(453,'neque vel rhoncus','nequ vel rhoncus',0,1,1.5667,'N214652',75),(454,'nibh','nibh',0,0,0.2667,'N100',93),(455,'nibh ac','nibh ac',0,1,1.2333,'N120',75),(456,'nibh ac pulvinar','nibh ac pulvinar',0,1,1.5333,'N1214156',75),(457,'nibh laoreet','nibh laoreet',0,1,1.4,'N1463',75),(458,'nibh laoreet in','nibh laoreet in',0,1,1.5,'N14635',75),(459,'nisi','nisi',0,0,0.2667,'N200',84),(460,'nisi euismod','nisi euismod',0,1,1.4,'N253',75),(461,'nisi euismod consectetur','nisi euismod consectetur',0,1,1.8,'N25325236',75),(462,'nisi sed','nisi sed',0,1,1.2667,'N230',75),(463,'nisi sed ut','nisi sed ut',0,1,1.3667,'N230',75),(464,'nisl','nisl',0,0,0.2667,'N240',87),(465,'nisl libero','nisl libero',0,1,1.3667,'N2416',75),(466,'nisl libero et','nisl libero et',0,1,1.4667,'N24163',75),(467,'nisl rhoncus','nisl rhoncus',0,1,1.4,'N24652',75),(468,'nisl rhoncus ac','nisl rhoncus ac',0,1,1.5,'N24652',75),(469,'nisl sit','nisl sit',0,1,1.2667,'N2423',75),(470,'nisl sit amet','nisl sit amet',0,1,1.4333,'N242353',75),(471,'non','non',0,0,0.2,'N000',93),(472,'non cursus','non cursus',0,1,1.3333,'N262',75),(473,'non cursus ut','non cursus ut',0,1,1.4333,'N2623',75),(474,'non eros','non eros',0,1,1.2667,'N620',75),(475,'non eros ut','non eros ut',0,1,1.3667,'N623',75),(476,'non facilisis','non facilisis',0,1,1.4333,'N1242',75),(477,'non facilisis erat','non facilisis erat',0,1,1.6,'N124263',75),(478,'non imperdiet','non imperdiet',0,1,1.4333,'N163',75),(479,'non imperdiet eget','non imperdiet eget',0,1,1.6,'N16323',75),(480,'nostra','nostra',0,0,0.4,'N236',75),(481,'nostra per','nostra per',0,1,1.3333,'N23616',75),(482,'nostra per inceptos','nostra per inceptos',0,1,1.6333,'N2361652132',75),(483,'nulla','nulla',0,0,0.3333,'N400',86),(484,'nulla condimentum','nulla condimentum',0,1,1.5667,'N4253535',75),(485,'nulla condimentum eu','nulla condimentum eu',0,1,1.6667,'N4253535',75),(486,'nulla condimentum interdum','nulla condimentum interdum',0,1,1.8667,'N42535353635',75),(487,'nulla donec','nulla donec',0,1,1.3667,'N4352',75),(488,'nulla donec imperdiet','nulla donec imperdiet',0,1,1.7,'N43525163',75),(489,'nulla id','nulla id',0,1,1.2667,'N430',81),(490,'nulla id vestibulum','nulla id vestibulum',0,1,1.6333,'N43123145',75),(491,'nullam','nullam',0,0,0.4,'N450',78),(492,'nullam varius','nullam varius',0,1,1.4333,'N45162',75),(493,'nullam varius lorem','nullam varius lorem',0,1,1.6333,'N45162465',75),(494,'nunc','nunc',0,0,0.2667,'N200',92),(495,'nunc etiam','nunc etiam',0,1,1.3333,'N235',75),(496,'nunc etiam tortor','nunc etiam tortor',0,1,1.5667,'N2353636',75),(497,'nunc in','nunc in',0,1,1.2333,'N250',75),(498,'nunc in arcu','nunc in arcu',0,1,1.4,'N2562',75),(499,'odio','odio',0,0,0.2667,'O300',85),(500,'odio sagittis','odio sagittis',0,1,1.4333,'O3232',75),(501,'odio sagittis sit','odio sagittis sit',0,1,1.5667,'O32323',75),(502,'odio ut','odio ut',0,1,1.2333,'O300',75),(503,'odio ut imperdiet','odio ut imperdiet',0,1,1.5667,'O35163',75),(504,'orci','orci',0,0,0.2667,'O620',92),(505,'orci elementum','orci elementum',0,1,1.4667,'O624535',75),(506,'orci elementum vel','orci elementum vel',0,1,1.6,'O62453514',75),(507,'orci mauris','orci mauris',0,1,1.3667,'O62562',77),(508,'orci mauris viverra','orci mauris viverra',0,1,1.6333,'O6256216',77),(509,'ornare','ornar',0,0,0.4,'O656',93),(510,'ornare justo','ornar justo',0,1,1.4,'O65623',77),(511,'ornare justo vel','ornar justo vel',0,1,1.5333,'O6562314',77),(512,'pellentesque','pellentesqu',0,0,0.8,'P4532',87),(513,'pellentesque ac','pellentesqu ac',0,1,1.5,'P4532',75),(514,'pellentesque ac nulla','pellentesqu ac nulla',0,1,1.7,'P453254',75),(515,'pellentesque adipiscing','pellentesqu adipiscing',0,1,1.7667,'P453231252',77),(516,'pellentesque adipiscing suscipit','pellentesqu adipiscing suscipit',0,1,2,'P45323125213',77),(517,'pellentesque erat','pellentesqu erat',0,1,1.5667,'P453263',75),(518,'pellentesque erat orci','pellentesqu erat orci',0,1,1.7333,'P45326362',75),(519,'per','per',0,0,0.2,'P600',75),(520,'per conubia','per conubia',0,1,1.3667,'P6251',75),(521,'per conubia nostra','per conubia nostra',0,1,1.6,'P62515236',75),(522,'per inceptos','per inceptos',0,1,1.4,'P652132',75),(523,'per inceptos himenaeos','per inceptos himenaeos',0,1,1.7333,'P65213252',75),(524,'pharetra','pharetra',0,0,0.5333,'P636',93),(525,'pharetra et','pharetra et',0,1,1.3667,'P6363',75),(526,'pharetra et curabitur','pharetra et curabitur',0,1,1.7,'P636326136',75),(527,'phasellus','phasellu',0,0,0.6,'P242',83),(528,'phasellus magna','phasellu magna',0,1,1.5,'P242525',75),(529,'phasellus magna dolor','phasellu magna dolor',0,1,1.7,'P242525346',75),(530,'phasellus non','phasellu non',0,1,1.4333,'P2425',75),(531,'phasellus non eros','phasellu non eros',0,1,1.6,'P242562',75),(532,'placerat','placerat',0,0,0.5333,'P4263',84),(533,'placerat eros','placerat eros',0,1,1.4333,'P426362',75),(534,'placerat eros id','placerat eros id',0,1,1.5333,'P4263623',75),(535,'porta','porta',0,0,0.3333,'P630',84),(536,'porta purus','porta purus',0,1,1.3667,'P63162',75),(537,'porta purus pellentesque','porta purus pellentesque',0,1,1.8,'P6316214532',75),(538,'posuere','posuer',0,0,0.4667,'P260',82),(539,'posuere lectus','posuer lectus',0,1,1.4667,'P264232',75),(540,'posuere lectus proin','posuer lectus proin',0,1,1.6667,'P264232165',75),(541,'posuere quam','posuer quam',0,1,1.4,'P2625',75),(542,'posuere quam pharetra','posuer quam pharetra',0,1,1.7,'P26251636',75),(543,'pretium','pretium',0,0,0.4667,'P635',88),(544,'pretium dui','pretium dui',0,1,1.3667,'P6353',75),(545,'pretium dui metus','pretium dui metus',0,1,1.5667,'P6353532',75),(546,'pretium morbi','pretium morbi',0,1,1.4333,'P63561',75),(547,'pretium morbi viverra','pretium morbi viverra',0,1,1.7,'P635616',75),(548,'pretium pellentesque','pretium pellentesque',0,1,1.6667,'P63514532',77),(549,'pretium pellentesque adipiscing','pretium pellentesque adipiscing',0,1,2,'P6351453231252',77),(550,'proin','proin',0,0,0.3333,'P650',90),(551,'proin vestibulum','proin vestibulum',0,1,1.5333,'P65123145',75),(552,'proin vestibulum sollicitudin','proin vestibulum sollicitudin',0,1,1.9667,'P6512314524235',75),(553,'pulvinar','pulvinar',0,0,0.5333,'P4156',93),(554,'pulvinar integer','pulvinar integer',0,1,1.5333,'P41565326',75),(555,'pulvinar integer dictum','pulvinar integer dictum',0,1,1.7667,'P415653263235',75),(556,'pulvinar non','pulvinar non',0,1,1.4,'P41565',75),(557,'pulvinar non facilisis','pulvinar non facilisis',0,1,1.7333,'P415651242',75),(558,'purus','puru',0,0,0.3333,'P620',91),(559,'purus pellentesque','puru pellentesque',0,1,1.6,'P6214532',75),(560,'purus pellentesque erat','puru pellentesque erat',0,1,1.7667,'P621453263',75),(561,'quam','quam',0,0,0.2667,'Q500',91),(562,'quam pharetra','quam pharetra',0,1,1.4333,'Q51636',75),(563,'quam pharetra et','quam pharetra et',0,1,1.5333,'Q516363',75),(564,'quam pulvinar','quam pulvinar',0,1,1.4333,'Q514156',75),(565,'quam pulvinar non','quam pulvinar non',0,1,1.5667,'Q5141565',75),(566,'quis','qui',0,0,0.2667,'Q000',105),(567,'quis imperdiet','qui imperdiet',0,1,1.4667,'Q5163',75),(568,'quis imperdiet etiam','qui imperdiet etiam',0,1,1.6667,'Q51635',75),(569,'quisque','quisqu',0,0,0.4667,'Q000',84),(570,'quisque at','quisqu at',0,1,1.3333,'Q300',75),(571,'quisque at massa','quisqu at massa',0,1,1.5333,'Q352',75),(572,'quisque egestas','quisqu egestas',0,1,1.5,'Q320',77),(573,'quisque egestas consequat','quisqu egestas consequat',0,1,1.8333,'Q32523',77),(574,'rhoncus','rhoncu',0,0,0.4667,'R520',84),(575,'rhoncus ac','rhoncu ac',0,1,1.3333,'R520',76),(576,'rhoncus ac lacinia','rhoncu ac lacinia',0,1,1.6,'R52425',75),(577,'rhoncus sem','rhoncu sem',0,1,1.3667,'R525',75),(578,'rhoncus sem suscipit','rhoncu sem suscipit',0,1,1.6667,'R525213',75),(579,'risus','risu',0,0,0.3333,'R200',80),(580,'risus in','risu in',0,1,1.2667,'R250',75),(581,'risus in libero','risu in libero',0,1,1.5,'R25416',75),(582,'sagittis','sagitti',0,0,0.5333,'S320',90),(583,'sagittis et','sagitti et',0,1,1.3667,'S323',75),(584,'sagittis et in','sagitti et in',0,1,1.4667,'S3235',75),(585,'sagittis metus','sagitti metus',0,1,1.4667,'S32532',75),(586,'sagittis metus eget','sagitti metus eget',0,1,1.6333,'S325323',75),(587,'sagittis mi','sagitti mi',0,1,1.3667,'S325',76),(588,'sagittis mi in','sagitti mi in',0,1,1.4667,'S325',75),(589,'sagittis sit','sagitti sit',0,1,1.4,'S323',75),(590,'sagittis sit amet','sagitti sit amet',0,1,1.5667,'S32353',75),(591,'sapien','sapien',0,0,0.4,'S150',91),(592,'sapien eget','sapien eget',0,1,1.3667,'S1523',75),(593,'sapien eget justo','sapien eget justo',0,1,1.5667,'S152323',75),(594,'sapien nec','sapien nec',0,1,1.3333,'S152',75),(595,'sapien nec dignissim','sapien nec dignissim',0,1,1.6667,'S15232525',75),(596,'sed','sed',0,0,0.2,'S300',96),(597,'sed commodo','sed commodo',0,1,1.3667,'S3253',75),(598,'sed commodo sapien','sed commodo sapien',0,1,1.6,'S3253215',75),(599,'sed eleifend','sed eleifend',0,1,1.4,'S34153',75),(600,'sed eleifend dignissim','sed eleifend dignissim',0,1,1.7333,'S341532525',75),(601,'sed elementum','sed elementum',0,1,1.4333,'S34535',75),(602,'sed elementum sit','sed elementum sit',0,1,1.5667,'S3453523',75),(603,'sed magna','sed magna',0,1,1.3,'S3525',75),(604,'sed magna nunc','sed magna nunc',0,1,1.4667,'S35252',75),(605,'sed ut','sed ut',0,1,1.2,'S300',75),(606,'sed ut posuere','sed ut posuere',0,1,1.4667,'S3126',75),(607,'sem','sem',0,0,0.2,'S500',91),(608,'sem donec','sem donec',0,1,1.3,'S5352',75),(609,'sem donec tempus','sem donec tempus',0,1,1.5333,'S53523512',75),(610,'sem suscipit','sem suscipit',0,1,1.4,'S5213',75),(611,'sem suscipit id','sem suscipit id',0,1,1.5,'S5213',75),(612,'semper','semper',0,0,0.4,'S516',77),(613,'semper cursus','semper cursus',0,1,1.4333,'S516262',75),(614,'semper cursus sed','semper cursus sed',0,1,1.5667,'S5162623',75),(615,'semper diam','semper diam',0,1,1.3667,'S51635',75),(616,'semper diam malesuada','semper diam malesuada',0,1,1.7,'S51635423',75),(617,'semper luctus','semper luctus',0,1,1.4333,'S5164232',75),(618,'semper luctus nisl','semper luctus nisl',0,1,1.6,'S5164232524',75),(619,'sit','sit',0,0,0.2,'S300',95),(620,'sit amet','sit amet',0,1,1.2667,'S353',95),(621,'sit amet dapibus','sit amet dapibus',0,1,1.5333,'S35312',75),(622,'sit amet dictum','sit amet dictum',0,1,1.5,'S353235',75),(623,'sit amet elementum','sit amet elementum',0,1,1.6,'S3534535',81),(624,'sit amet hendrerit','sit amet hendrerit',0,1,1.6,'S3535363',75),(625,'sit amet neque','sit amet neque',0,1,1.4667,'S35352',75),(626,'sit amet nulla','sit amet nulla',0,1,1.4667,'S35354',75),(627,'sit amet tincidunt','sit amet tincidunt',0,1,1.6,'S35352353',77),(628,'sociosqu','sociosqu',0,0,0.5333,'S000',75),(629,'sociosqu ad','sociosqu ad',0,1,1.3667,'S300',75),(630,'sociosqu ad litora','sociosqu ad litora',0,1,1.6,'S3436',75),(631,'sollicitudin','sollicitudin',0,0,0.8,'S4235',80),(632,'sollicitudin erat','sollicitudin erat',0,1,1.5667,'S423563',75),(633,'sollicitudin erat at','sollicitudin erat at',0,1,1.6667,'S423563',75),(634,'sollicitudin neque','sollicitudin neque',0,1,1.6,'S42352',75),(635,'sollicitudin neque vel','sollicitudin neque vel',0,1,1.7333,'S4235214',75),(636,'sollicitudin ornare','sollicitudin ornare',0,1,1.6333,'S4235656',77),(637,'sollicitudin ornare justo','sollicitudin ornare justo',0,1,1.8333,'S423565623',77),(638,'suscipit','suscipit',0,0,0.5333,'S130',85),(639,'suscipit id','suscipit id',0,1,1.3667,'S130',81),(640,'suscipit id sed','suscipit id sed',0,1,1.5,'S1323',75),(641,'suscipit neque','suscipit neque',0,1,1.4667,'S1352',77),(642,'suscipit neque at','suscipit neque at',0,1,1.5667,'S13523',77),(643,'taciti','taciti',0,0,0.4,'T230',75),(644,'taciti sociosqu','taciti sociosqu',0,1,1.5,'T232',75),(645,'taciti sociosqu ad','taciti sociosqu ad',0,1,1.6,'T2323',75),(646,'tempus','tempu',0,0,0.4,'T512',85),(647,'tempus ac','tempu ac',0,1,1.3,'T512',76),(648,'tempus ac condimentum','tempu ac condimentum',0,1,1.7,'T51253535',75),(649,'tempus diam','tempu diam',0,1,1.3667,'T51235',75),(650,'tempus diam eu','tempu diam eu',0,1,1.4667,'T51235',75),(651,'tempus luctus','tempu luctus',0,1,1.4333,'T5124232',76),(652,'tempus luctus phasellus','tempu luctus phasellus',0,1,1.7667,'T51242321242',75),(653,'tempus morbi','tempu morbi',0,1,1.4,'T512561',75),(654,'tempus morbi fringilla','tempu morbi fringilla',0,1,1.7333,'T5125616524',75),(655,'tincidunt','tincidunt',0,0,0.6,'T52353',94),(656,'tincidunt eget','tincidunt eget',0,1,1.4667,'T5235323',83),(657,'tincidunt eget facilisis','tincidunt eget facilisis',0,1,1.8,'T52353231242',77),(658,'torquent','torquent',0,0,0.5333,'T6253',75),(659,'torquent per','torquent per',0,1,1.4,'T625316',75),(660,'torquent per conubia','torquent per conubia',0,1,1.6667,'T625316251',75),(661,'tortor','tortor',0,0,0.4,'T636',84),(662,'tortor massa','tortor massa',0,1,1.4,'T63652',75),(663,'tortor massa convallis','tortor massa convallis',0,1,1.7333,'T636525142',75),(664,'turpis','turpi',0,0,0.4,'T612',92),(665,'turpis semper','turpi semper',0,1,1.4333,'T612516',75),(666,'turpis semper luctus','turpi semper luctus',0,1,1.6667,'T6125164232',75),(667,'ullamcorper','ullamcorp',0,0,0.7333,'U452616',90),(668,'ullamcorper nisi','ullamcorp nisi',0,1,1.5333,'U45261652',75),(669,'ullamcorper nisi euismod','ullamcorp nisi euismod',0,1,1.8,'U4526165253',75),(670,'ullamcorper viverra','ullamcorp viverra',0,1,1.6333,'U45261616',75),(671,'ullamcorper viverra nibh','ullamcorp viverra nibh',0,1,1.8,'U4526161651',75),(672,'ut','ut',0,0,0.1333,'U300',94),(673,'ut ante','ut ante',0,1,1.2333,'U353',75),(674,'ut ante iaculis','ut ante iaculis',0,1,1.5,'U353242',75),(675,'ut imperdiet','ut imperdiet',0,1,1.4,'U35163',76),(676,'ut imperdiet ante','ut imperdiet ante',0,1,1.5667,'U3516353',75),(677,'ut lobortis','ut lobortis',0,1,1.3667,'U341632',75),(678,'ut lobortis sagittis','ut lobortis sagittis',0,1,1.6667,'U34163232',75),(679,'ut mauris','ut mauris',0,1,1.3,'U3562',75),(680,'ut mauris donec','ut mauris donec',0,1,1.5,'U3562352',75),(681,'ut posuere','ut posuere',0,1,1.3333,'U3126',75),(682,'ut posuere lectus','ut posuere lectus',0,1,1.5667,'U31264232',75),(683,'varius','variu',0,0,0.4,'V620',90),(684,'varius lorem','variu lorem',0,1,1.4,'V62465',75),(685,'varius lorem vel','variu lorem vel',0,1,1.5333,'V6246514',75),(686,'varius molestie','variu molestie',0,1,1.5,'V625423',75),(687,'varius molestie erat','variu molestie erat',0,1,1.6667,'V62542363',75),(688,'vel','vel',0,0,0.2,'V400',85),(689,'vel fringilla','vel fringilla',0,1,1.4333,'V416524',75),(690,'vel fringilla eget','vel fringilla eget',0,1,1.6,'V41652423',75),(691,'vel massa','vel massa',0,1,1.3,'V452',75),(692,'vel massa viverra','vel massa viverra',0,1,1.5667,'V45216',75),(693,'vel pretium','vel pretium',0,1,1.3667,'V41635',77),(694,'vel pretium pellentesque','vel pretium pellentesque',0,1,1.8,'V4163514532',77),(695,'vel rhoncus','vel rhoncus',0,1,1.3667,'V4652',75),(696,'vel rhoncus sem','vel rhoncus sem',0,1,1.5,'V46525',75),(697,'vel risus','vel risus',0,1,1.3,'V462',75),(698,'vel risus in','vel risus in',0,1,1.4,'V4625',75),(699,'velit','velit',0,0,0.3333,'V430',94),(700,'velit accumsan','velit accumsan',0,1,1.4667,'V432525',75),(701,'velit accumsan posuere','velit accumsan posuere',0,1,1.7333,'V432525126',75),(702,'venenatis','venenati',0,0,0.6,'V532',84),(703,'venenatis malesuada','venenati malesuada',0,1,1.6333,'V5325423',75),(704,'venenatis malesuada odio','venenati malesuada odio',0,1,1.8,'V5325423',75),(705,'venenatis quisque','venenati quisque',0,1,1.5667,'V532',75),(706,'venenatis quisque at','venenati quisque at',0,1,1.6667,'V5323',75),(707,'venenatis sollicitudin','venenati sollicitudin',0,1,1.7333,'V5324235',75),(708,'venenatis sollicitudin neque','venenati sollicitudin neque',0,1,1.9333,'V53242352',75),(709,'vestibulum','vestibulum',0,0,0.6667,'V23145',87),(710,'vestibulum felis','vestibulum felis',0,1,1.5333,'V23145142',75),(711,'vestibulum felis nunc','vestibulum felis nunc',0,1,1.7,'V2314514252',75),(712,'vestibulum metus','vestibulum metus',0,1,1.5333,'V2314532',75),(713,'vestibulum metus sagittis','vestibulum metus sagittis',0,1,1.8333,'V231453232',75),(714,'vestibulum sollicitudin','vestibulum sollicitudin',0,1,1.7667,'V2314524235',75),(715,'vestibulum sollicitudin erat','vestibulum sollicitudin erat',0,1,1.9333,'V231452423563',75),(716,'vitae','vita',0,0,0.3333,'V300',93),(717,'vitae porta','vita porta',0,1,1.3667,'V3163',75),(718,'vitae porta purus','vita porta purus',0,1,1.5667,'V3163162',75),(719,'vivamus','vivamu',0,0,0.4667,'V520',91),(720,'vivamus lectus','vivamu lectus',0,1,1.4667,'V524232',75),(721,'vivamus lectus nisl','vivamu lectus nisl',0,1,1.6333,'V524232524',75),(722,'viverra','viverra',0,0,0.4667,'V600',86),(723,'viverra metus','viverra metus',0,1,1.4333,'V6532',75),(724,'viverra metus ut','viverra metus ut',0,1,1.5333,'V65323',75),(725,'viverra nibh','viverra nibh',0,1,1.4,'V651',75),(726,'viverra nibh ac','viverra nibh ac',0,1,1.5,'V6512',75),(727,'viverra placerat','viverra placerat',0,1,1.5333,'V614263',75),(728,'viverra placerat eros','viverra placerat eros',0,1,1.7,'V61426362',75),(729,'viverra sit','viverra sit',0,1,1.3667,'V623',77),(730,'viverra sit amet','viverra sit amet',0,1,1.5333,'V62353',77),(731,'viverra volutpat','viverra volutpat',0,1,1.5333,'V614313',75),(732,'viverra volutpat integer','viverra volutpat integer',0,1,1.8,'V6143135326',75),(733,'volutpat','volutpat',0,0,0.5333,'V4313',82),(734,'volutpat integer','volutpat integer',0,1,1.5333,'V43135326',76),(735,'volutpat integer ullamcorper','volutpat integer ullamcorper',0,1,1.9333,'V43135326452616',75),(736,'2','2',0,0,0.1,'',2),(737,'44','44',0,0,0.2,'',2),(738,'carousel item 2','carousel item 2',0,1,1.5,'C62435',1),(739,'cras eleifend','cra eleifend',0,1,1.4333,'C624153',17),(740,'cras eleifend consectetur','cra eleifend consectetur',0,1,1.8333,'C62415325236',17),(741,'item 2','item 2',0,1,1.2,'I350',1),(742,'ligula cras eleifend','ligula cras eleifend',0,1,1.6667,'L242624153',17),(743,'3','3',0,0,0.1,'',2),(744,'45','45',0,0,0.2,'',2),(745,'carousel item 3','carousel item 3',0,1,1.5,'C62435',1),(746,'item 3','item 3',0,1,1.2,'I350',1),(747,'4','4',0,0,0.1,'',2),(748,'46','46',0,0,0.2,'',1),(749,'carousel item 4','carousel item 4',0,1,1.5,'C62435',1),(750,'item 4','item 4',0,1,1.2,'I350',1),(751,'5','5',0,0,0.1,'',3),(752,'66','66',0,0,0.2,'',3),(753,'a','a',0,0,0.0667,'A000',21),(754,'a condimentum','a condimentum',0,1,1.4333,'A253535',6),(755,'a condimentum in','a condimentum in',0,1,1.5333,'A253535',6),(756,'a consequat','a consequat',0,1,1.3667,'A2523',6),(757,'a consequat eget','a consequat eget',0,1,1.5333,'A252323',6),(758,'a nibh','a nibh',0,1,1.2,'A510',6),(759,'a nibh fringilla','a nibh fringilla',0,1,1.5333,'A516524',6),(760,'a ornare','a ornare',0,1,1.2667,'A656',6),(761,'a ornare lectus','a ornare lectus',0,1,1.5,'A6564232',6),(762,'ac iaculis','ac iaculis',0,1,1.3333,'A242',6),(763,'ac iaculis blandit','ac iaculis blandit',0,1,1.6,'A2421453',6),(764,'ac malesuada','ac malesuada',0,1,1.4,'A25423',6),(765,'ac malesuada sem','ac malesuada sem',0,1,1.5333,'A2542325',6),(766,'ac odio','ac odio',0,1,1.2333,'A230',6),(767,'ac odio lorem','ac odio lorem',0,1,1.4333,'A23465',6),(768,'ac purus','ac purus',0,1,1.2667,'A2162',6),(769,'ac purus euismod','ac purus euismod',0,1,1.5333,'A216253',6),(770,'ac tempus','ac tempus',0,1,1.3,'A23512',6),(771,'ac tempus sem','ac tempus sem',0,1,1.4333,'A235125',6),(772,'ac tincidunt','ac tincidunt',0,1,1.4,'A2352353',6),(773,'ac tincidunt enim','ac tincidunt enim',0,1,1.5667,'A23523535',6),(774,'accumsan turpis','accumsan turpis',0,1,1.5,'A25253612',6),(775,'accumsan turpis in','accumsan turpis in',0,1,1.6,'A252536125',6),(776,'adipiscing duis','adipisc duis',0,1,1.5,'A3125232',6),(777,'adipiscing duis id','adipisc duis id',0,1,1.6,'A31252323',6),(778,'adipiscing elit','adipisc elit',0,1,1.5,'A3125243',10),(779,'adipiscing elit pellentesque','adipisc elit pellentesque',0,1,1.9333,'A312524314532',6),(780,'adipiscing elit phasellus','adipisc elit phasellus',0,1,1.8333,'A31252431242',6),(781,'adipiscing elit vivamus','adipisc elit vivamus',0,1,1.7667,'A3125243152',6),(782,'adipiscing tortor','adipisc tortor',0,1,1.5667,'A312523636',6),(783,'adipiscing tortor ac','adipisc tortor ac',0,1,1.6667,'A3125236362',6),(784,'aliquam','aliquam',0,0,0.4667,'A425',17),(785,'aliquam felis','aliquam felis',0,1,1.4333,'A425142',6),(786,'aliquam felis quis','aliquam felis quis',0,1,1.6,'A425142',6),(787,'aliquam hendrerit','aliquam hendrerit',0,1,1.5667,'A425363',6),(788,'aliquam hendrerit varius','aliquam hendrerit varius',0,1,1.8,'A425363162',6),(789,'aliquam scelerisque','aliquam scelerisque',0,1,1.6333,'A4252462',6),(790,'aliquam scelerisque odio','aliquam scelerisque odio',0,1,1.8,'A42524623',6),(791,'amet condimentum','amet condimentum',0,1,1.5333,'A53253535',6),(792,'amet condimentum mauris','amet condimentum mauris',0,1,1.7667,'A5325353562',6),(793,'amet consectetur','amet consectetur',0,1,1.5333,'A5325236',10),(794,'amet consectetur adipiscing','amet consectetur adipiscing',0,1,1.9,'A532523631252',10),(795,'amet elementum mattis','amet elementum mattis',0,1,1.7,'A53453532',6),(796,'amet lobortis','amet lobortis',0,1,1.4333,'A5341632',6),(797,'amet lobortis sem','amet lobortis sem',0,1,1.5667,'A53416325',6),(798,'amet mollis','amet mollis',0,1,1.3667,'A53542',6),(799,'amet mollis in','amet mollis in',0,1,1.4667,'A535425',6),(800,'amet praesent','amet praesent',0,1,1.4333,'A5316253',6),(801,'amet praesent in','amet praesent in',0,1,1.5333,'A53162535',6),(802,'amet sagittis','amet sagittis',0,1,1.4333,'A53232',6),(803,'amet sagittis vel','amet sagittis vel',0,1,1.5667,'A5323214',6),(804,'amet sed','amet sed',0,1,1.2667,'A5323',6),(805,'amet sed nibh','amet sed nibh',0,1,1.4333,'A532351',6),(806,'ante ipsum','ant ipsum',0,1,1.3333,'A53125',7),(807,'ante ipsum primis','ant ipsum primis',0,1,1.5667,'A531251652',7),(808,'arcu cursus','arcu cursus',0,1,1.3667,'A6262',6),(809,'arcu cursus eu','arcu cursus eu',0,1,1.4667,'A6262',6),(810,'arcu dictum','arcu dictum',0,1,1.3667,'A623235',6),(811,'arcu dictum ultrices','arcu dictum ultrices',0,1,1.6667,'A6232354362',6),(812,'arcu iaculis','arcu iaculis',0,1,1.4,'A6242',6),(813,'arcu iaculis eget','arcu iaculis eget',0,1,1.5667,'A62423',6),(814,'arcu id','arcu id',0,1,1.2333,'A623',6),(815,'arcu id tincidunt','arcu id tincidunt',0,1,1.5667,'A62352353',6),(816,'arcu pellentesque','arcu pellentesque',0,1,1.5667,'A6214532',6),(817,'arcu pellentesque faucibus','arcu pellentesque faucibus',0,1,1.8667,'A62145321212',6),(818,'arcu vitae','arcu vitae',0,1,1.3333,'A6213',6),(819,'arcu vitae elit','arcu vitae elit',0,1,1.5,'A621343',6),(820,'at ante','at ante',0,1,1.2333,'A353',3),(821,'at egestas','at egestas',0,1,1.3333,'A3232',6),(822,'at egestas eget','at egestas eget',0,1,1.5,'A32323',6),(823,'at ligula','at ligula',0,1,1.3,'A3424',6),(824,'at ligula praesent','at ligula praesent',0,1,1.6,'A342416253',6),(825,'at nulla','at nulla',0,1,1.2667,'A354',7),(826,'at nulla ultricies','at nulla ultricies',0,1,1.6,'A354362',6),(827,'auctor maecenas','auctor maecenas',0,1,1.5,'A2365252',6),(828,'auctor maecenas nisi','auctor maecenas nisi',0,1,1.6667,'A236525252',6),(829,'auctor nulla','auctor nulla',0,1,1.4,'A23654',6),(830,'auctor nulla id','auctor nulla id',0,1,1.5,'A236543',6),(831,'auctor volutpat','auctor volutpat',0,1,1.5,'A23614313',6),(832,'auctor volutpat suspendisse','auctor volutpat suspendisse',0,1,1.9,'A2361431321532',6),(833,'augue','augu',0,0,0.3333,'A200',18),(834,'augue a','augu a',0,1,1.2333,'A200',6),(835,'augue a nibh','augu a nibh',0,1,1.4,'A251',6),(836,'augue cursus','augu cursus',0,1,1.4,'A262',6),(837,'augue cursus et','augu cursus et',0,1,1.5,'A2623',6),(838,'augue iaculis','augu iaculis',0,1,1.4333,'A242',6),(839,'augue iaculis lorem','augu iaculis lorem',0,1,1.6333,'A242465',6),(840,'augue ultrices','augu ultrices',0,1,1.4667,'A24362',6),(841,'augue ultrices arcu','augu ultrices arcu',0,1,1.6333,'A2436262',6),(842,'bibendum arcu','bibendum arcu',0,1,1.4333,'B53562',6),(843,'bibendum arcu iaculis','bibendum arcu iaculis',0,1,1.7,'B5356242',6),(844,'bibendum convallis','bibendum convallis',0,1,1.6,'B53525142',6),(845,'bibendum convallis turpis','bibendum convallis turpis',0,1,1.8333,'B535251423612',6),(846,'bibendum urna','bibendum urna',0,1,1.4333,'B53565',6),(847,'bibendum urna ligula','bibendum urna ligula',0,1,1.6667,'B53565424',6),(848,'blandit','blandit',0,0,0.4667,'B453',11),(849,'blandit eros','blandit eros',0,1,1.4,'B45362',6),(850,'blandit eros est','blandit eros est',0,1,1.5333,'B453623',6),(851,'blandit interdum','blandit interdum',0,1,1.5333,'B45353635',6),(852,'blandit interdum sit','blandit interdum sit',0,1,1.6667,'B4535363523',6),(853,'blandit leo','blandit leo',0,1,1.3667,'B4534',6),(854,'blandit leo id','blandit leo id',0,1,1.4667,'B45343',6),(855,'blog','blog',0,0,0.2667,'B420',6),(856,'blog item','blog item',0,1,1.3,'B4235',6),(857,'blog item 5','blog item 5',0,1,1.3667,'B4235',2),(858,'condimentum in','condimentum in',0,1,1.4667,'C53535',6),(859,'condimentum in hac','condimentum in hac',0,1,1.6,'C535352',6),(860,'condimentum mauris','condimentum mauris',0,1,1.6,'C5353562',6),(861,'condimentum mauris varius','condimentum mauris varius',0,1,1.8333,'C5353562162',6),(862,'condimentum urna','condimentum urna',0,1,1.5333,'C5353565',6),(863,'condimentum urna quis','condimentum urna quis',0,1,1.7,'C53535652',6),(864,'congue','congu',0,0,0.4,'C520',18),(865,'congue donec','congu donec',0,1,1.4,'C52352',6),(866,'congue donec euismod','congu donec euismod',0,1,1.6667,'C5235253',6),(867,'consectetur adipiscing','consectetur adipiscing',0,1,1.7333,'C523631252',10),(868,'consectetur adipiscing elit','consectetur adipiscing elit',0,1,1.9,'C52363125243',10),(869,'consectetur magna','consectetur magna',0,1,1.5667,'C5236525',6),(870,'consectetur magna adipiscing','consectetur magna adipiscing',0,1,1.9333,'C523652531252',6),(871,'consequat eget','consequat eget',0,1,1.4667,'C52323',6),(872,'consequat eget tincidunt','consequat eget tincidunt',0,1,1.8,'C5232352353',6),(873,'convallis proin','conval proin',0,1,1.5,'C5142165',6),(874,'convallis proin euismod','conval proin euismod',0,1,1.7667,'C5142165253',6),(875,'convallis turpis','conval turpis',0,1,1.5333,'C51423612',6),(876,'convallis turpis eget','conval turpis eget',0,1,1.7,'C514236123',6),(877,'cras aliquam','cra aliquam',0,1,1.4,'C62425',6),(878,'cras aliquam felis','cra aliquam felis',0,1,1.6,'C62425142',6),(879,'cubilia','cubilia',0,0,0.4667,'C140',7),(880,'cubilia curae','cubilia curae',0,1,1.4333,'C1426',7),(881,'cubilia curae etiam','cubilia curae etiam',0,1,1.6333,'C142635',6),(882,'curabitur bibendum','curabitur bibendum',0,1,1.6,'C61361535',6),(883,'curabitur bibendum urna','curabitur bibendum urna',0,1,1.7667,'C6136153565',6),(884,'curabitur interdum velit','curabitur interdum velit',0,1,1.8,'C613653635143',6),(885,'curae','cura',0,0,0.3333,'C600',7),(886,'curae etiam','cura etiam',0,1,1.3667,'C635',6),(887,'curae etiam auctor','cura etiam auctor',0,1,1.6,'C635236',6),(888,'cursus aliquam','cursu aliquam',0,1,1.4667,'C62425',6),(889,'cursus aliquam scelerisque','cursu aliquam scelerisque',0,1,1.8667,'C624252462',6),(890,'cursus et','cursu et',0,1,1.3,'C623',6),(891,'cursus et tincidunt','cursu et tincidunt',0,1,1.6333,'C62352353',6),(892,'cursus eu','cursu eu',0,1,1.3,'C620',6),(893,'cursus eu consectetur','cursu eu consectetur',0,1,1.7,'C625236',6),(894,'cursus laoreet','cursu laoreet',0,1,1.4667,'C62463',6),(895,'cursus laoreet odio','cursu laoreet odio',0,1,1.6333,'C62463',6),(896,'cursus posuere','cursu posuere',0,1,1.4667,'C62126',6),(897,'cursus posuere vitae','cursu posuere vitae',0,1,1.6667,'C6212613',6),(898,'dapibus at','dapibu at',0,1,1.3333,'D123',6),(899,'dapibus at egestas','dapibu at egestas',0,1,1.6,'D123232',6),(900,'diam malesuada ultrices','diam malesuada ultrices',0,1,1.7667,'D54234362',6),(901,'diam mauris','diam mauris',0,1,1.3667,'D562',6),(902,'diam mauris dignissim','diam mauris dignissim',0,1,1.7,'D56232525',6),(903,'dictum rhoncus','dictum rhoncus',0,1,1.4667,'D235652',6),(904,'dictum rhoncus velit','dictum rhoncus velit',0,1,1.6667,'D235652143',6),(905,'dictum ultrices','dictum ultrices',0,1,1.5,'D2354362',6),(906,'dictum ultrices sed','dictum ultrices sed',0,1,1.6333,'D23543623',6),(907,'dictumst','dictumst',0,0,0.5333,'D23523',6),(908,'dictumst donec','dictumst donec',0,1,1.4667,'D2352352',6),(909,'dictumst donec eu','dictumst donec eu',0,1,1.5667,'D2352352',6),(910,'dictumst ut','dictumst ut',0,1,1.3667,'D23523',6),(911,'dictumst ut elit','dictumst ut elit',0,1,1.5333,'D2352343',6),(912,'dignissim a','dignissim a',0,1,1.3667,'D2525',6),(913,'dignissim a consequat','dignissim a consequat',0,1,1.7,'D25252523',6),(914,'dolor sit','dolor sit',0,1,1.3,'D4623',10),(915,'dolor sit amet','dolor sit amet',0,1,1.4667,'D462353',10),(916,'donec eu','donec eu',0,1,1.2667,'D520',6),(917,'donec eu elit','donec eu elit',0,1,1.4333,'D5243',6),(918,'donec euismod','donec euismod',0,1,1.4333,'D5253',6),(919,'donec euismod ultricies','donec euismod ultricies',0,1,1.7667,'D52534362',6),(920,'donec ut','donec ut',0,1,1.2667,'D523',6),(921,'donec ut rutrum','donec ut rutrum',0,1,1.5,'D5236365',6),(922,'duis','dui',0,0,0.2667,'D200',24),(923,'duis bibendum','dui bibendum',0,1,1.4333,'D21535',6),(924,'duis bibendum convallis','dui bibendum convallis',0,1,1.7667,'D2153525142',6),(925,'duis diam','dui diam',0,1,1.3,'D235',6),(926,'duis diam mauris','dui diam mauris',0,1,1.5333,'D23562',6),(927,'duis id','dui id',0,1,1.2333,'D230',6),(928,'duis id turpis','dui id turpis',0,1,1.4667,'D23612',6),(929,'egestas eget','egesta eget',0,1,1.4,'E2323',6),(930,'egestas eget feugiat','egesta eget feugiat',0,1,1.6667,'E2323123',6),(931,'egestas eget ipsum','egesta eget ipsum',0,1,1.6,'E2323125',6),(932,'eget congue','eget congue',0,1,1.3667,'E23252',6),(933,'eget congue donec','eget congue donec',0,1,1.5667,'E23252352',6),(934,'eget donec','eget donec',0,1,1.3333,'E2352',6),(935,'eget donec ut','eget donec ut',0,1,1.4333,'E23523',6),(936,'eget duis','eget duis',0,1,1.3,'E232',6),(937,'eget duis bibendum','eget duis bibendum',0,1,1.6,'E2321535',6),(938,'eget enim','eget enim',0,1,1.3,'E235',6),(939,'eget enim integer','eget enim integer',0,1,1.5667,'E235326',6),(940,'eget feugiat','eget feugiat',0,1,1.4,'E23123',6),(941,'eget feugiat sit','eget feugiat sit',0,1,1.5333,'E2312323',6),(942,'eget gravida','eget gravida',0,1,1.4,'E232613',6),(943,'eget gravida augue','eget gravida augue',0,1,1.6,'E2326132',6),(944,'eget ipsum','eget ipsum',0,1,1.3333,'E23125',6),(945,'eget ipsum integer','eget ipsum integer',0,1,1.6,'E23125326',6),(946,'eget mauris','eget mauris',0,1,1.3667,'E23562',6),(947,'eget mauris integer','eget mauris integer',0,1,1.6333,'E235625326',6),(948,'eget tincidunt','eget tincidunt',0,1,1.4667,'E2352353',8),(949,'eget tincidunt eget','eget tincidunt eget',0,1,1.6333,'E235235323',6),(950,'elementum mattis','elementum mattis',0,1,1.5333,'E453532',6),(951,'elementum mattis felis','elementum mattis felis',0,1,1.7333,'E453532142',6),(952,'elementum ut','elementum ut',0,1,1.4,'E45353',6),(953,'elementum ut dapibus','elementum ut dapibus',0,1,1.6667,'E4535312',6),(954,'elit','elit',0,0,0.2667,'E430',53),(955,'elit cursus','elit cursus',0,1,1.3667,'E43262',6),(956,'elit cursus posuere','elit cursus posuere',0,1,1.6333,'E43262126',6),(957,'elit nisi','elit nisi',0,1,1.3,'E4352',6),(958,'elit nisi vehicula','elit nisi vehicula',0,1,1.6,'E4352124',6),(959,'elit orci','elit orci',0,1,1.3,'E4362',6),(960,'elit orci duis','elit orci duis',0,1,1.4667,'E436232',6),(961,'elit pellentesque','elit pellentesque',0,1,1.5667,'E4314532',6),(962,'elit pellentesque tellus','elit pellentesque tellus',0,1,1.8,'E4314532342',6),(963,'elit phasellus','elit phasellus',0,1,1.4667,'E431242',6),(964,'elit phasellus vehicula','elit phasellus vehicula',0,1,1.7667,'E431242124',6),(965,'elit vivamus','elit vivamus',0,1,1.4,'E43152',6),(966,'elit vivamus vel','elit vivamus vel',0,1,1.5333,'E4315214',6),(967,'enim','enim',0,0,0.2667,'E500',17),(968,'enim ac','enim ac',0,1,1.2333,'E520',6),(969,'enim ac malesuada','enim ac malesuada',0,1,1.5667,'E525423',6),(970,'enim integer','enim integer',0,1,1.4,'E5326',6),(971,'enim integer faucibus','enim integer faucibus',0,1,1.7,'E53261212',6),(972,'enim morbi','enim morbi',0,1,1.3333,'E561',6),(973,'enim morbi venenatis','enim morbi venenatis',0,1,1.6667,'E561532',6),(974,'enim porta','enim porta',0,1,1.3333,'E5163',6),(975,'enim porta at','enim porta at',0,1,1.4333,'E5163',6),(976,'erat euismod','erat euismod',0,1,1.4,'E63253',6),(977,'erat euismod luctus','erat euismod luctus',0,1,1.6333,'E632534232',6),(978,'eros aliquam','ero aliquam',0,1,1.4,'E62425',6),(979,'eros aliquam hendrerit','ero aliquam hendrerit',0,1,1.7333,'E62425363',6),(980,'eros est','ero est',0,1,1.2667,'E623',6),(981,'eros est porta','ero est porta',0,1,1.4667,'E623163',6),(982,'eros ut massa','ero ut massa',0,1,1.4333,'E62352',6),(983,'est','est',0,0,0.2,'E230',19),(984,'est porta','est porta',0,1,1.3,'E23163',6),(985,'est porta nulla','est porta nulla',0,1,1.5,'E2316354',6),(986,'est urna','est urna',0,1,1.2667,'E2365',6),(987,'est urna ac','est urna ac',0,1,1.3667,'E23652',6),(988,'et lacinia','et lacinia',0,1,1.3333,'E3425',6),(989,'et lacinia ut','et lacinia ut',0,1,1.4333,'E34253',6),(990,'et tincidunt','et tincidunt',0,1,1.4,'E352353',7),(991,'et tincidunt et','et tincidunt et',0,1,1.5,'E352353',6),(992,'et ultrices','et ultrices',0,1,1.3667,'E34362',7),(993,'et ultrices posuere','et ultrices posuere',0,1,1.6333,'E34362126',7),(994,'et urna','et urna',0,1,1.2333,'E365',29),(995,'et urna arcu','et urna arcu',0,1,1.4,'E36562',6),(996,'et urna cras','et urna cras',0,1,1.4,'E365262',6),(997,'etiam auctor','etiam auctor',0,1,1.4,'E35236',6),(998,'etiam auctor nulla','etiam auctor nulla',0,1,1.6,'E3523654',6),(999,'eu consectetur','eu consectetur',0,1,1.4667,'E25236',6),(1000,'eu consectetur magna','eu consectetur magna',0,1,1.6667,'E25236525',6),(1001,'eu elit','eu elit',0,1,1.2333,'E430',6),(1002,'eu elit orci','eu elit orci',0,1,1.4,'E4362',6),(1003,'euismod auctor','euismod auctor',0,1,1.4667,'E253236',6),(1004,'euismod auctor maecenas','euismod auctor maecenas',0,1,1.7667,'E2532365252',6),(1005,'euismod laoreet','euismod laoreet',0,1,1.5,'E253463',6),(1006,'euismod laoreet sem','euismod laoreet sem',0,1,1.6333,'E25346325',6),(1007,'euismod luctus','euismod luctus',0,1,1.4667,'E2534232',6),(1008,'euismod luctus nunc','euismod luctus nunc',0,1,1.6333,'E253423252',6),(1009,'euismod ultricies','euismod ultricies',0,1,1.5667,'E2534362',6),(1010,'euismod ultricies metus','euismod ultricies metus',0,1,1.7667,'E2534362532',6),(1011,'facilisis fringilla','facilisi fringilla',0,1,1.6333,'F24216524',6),(1012,'facilisis fringilla vestibulum','facilisi fringilla vestibulum',0,1,2,'F24216524123145',6),(1013,'facilisis lorem','facilisi lorem',0,1,1.5,'F242465',6),(1014,'facilisis lorem ipsum','facilisi lorem ipsum',0,1,1.7,'F242465125',6),(1015,'faucibus augue','faucibu augue',0,1,1.4667,'F212',6),(1016,'faucibus augue a','faucibu augue a',0,1,1.5333,'F212',6),(1017,'faucibus et','faucibu et',0,1,1.3667,'F2123',6),(1018,'faucibus et urna','faucibu et urna',0,1,1.5333,'F212365',6),(1019,'faucibus hendrerit','faucibu hendrerit',0,1,1.6,'F2125363',6),(1020,'faucibus hendrerit massa','faucibu hendrerit massa',0,1,1.8,'F212536352',6),(1021,'faucibus orci','faucibu orci',0,1,1.4333,'F21262',7),(1022,'faucibus orci luctus','faucibu orci luctus',0,1,1.6667,'F212624232',7),(1023,'felis a','feli a',0,1,1.2333,'F420',6),(1024,'felis a condimentum','feli a condimentum',0,1,1.6333,'F4253535',6),(1025,'felis quis','feli quis',0,1,1.3333,'F420',6),(1026,'felis quis ipsum','feli quis ipsum',0,1,1.5333,'F42125',6),(1027,'felis sem','feli sem',0,1,1.3,'F425',6),(1028,'felis sem tincidunt','feli sem tincidunt',0,1,1.6333,'F425352353',6),(1029,'feugiat','feugiat',0,0,0.4667,'F230',19),(1030,'feugiat sit','feugiat sit',0,1,1.3667,'F2323',6),(1031,'feugiat sit amet','feugiat sit amet',0,1,1.5333,'F232353',6),(1032,'fringilla eget gravida','fringilla eget gravida',0,1,1.7333,'F6524232613',6),(1033,'fringilla vestibulum','fringilla vestibulum',0,1,1.6667,'F6524123145',6),(1034,'fringilla vestibulum ante','fringilla vestibulum ante',0,1,1.8333,'F65241231453',6),(1035,'gravida augue','gravida augue',0,1,1.4333,'G6132',6),(1036,'gravida augue iaculis','gravida augue iaculis',0,1,1.7,'G613242',6),(1037,'gravida nec','gravida nec',0,1,1.3667,'G61352',6),(1038,'gravida nec malesuada','gravida nec malesuada',0,1,1.7,'G613525423',6),(1039,'habitasse','habitass',0,0,0.6,'H132',6),(1040,'habitasse platea','habitass platea',0,1,1.5333,'H132143',6),(1041,'habitasse platea dictumst','habitass platea dictumst',0,1,1.8333,'H13214323523',6),(1042,'hac','hac',0,0,0.2,'H200',6),(1043,'hac habitasse','hac habitasse',0,1,1.4333,'H2132',6),(1044,'hac habitasse platea','hac habitasse platea',0,1,1.6667,'H2132143',6),(1045,'hendrerit massa','hendrerit massa',0,1,1.5,'H536352',6),(1046,'hendrerit massa ac','hendrerit massa ac',0,1,1.6,'H536352',6),(1047,'hendrerit varius','hendrerit varius',0,1,1.5333,'H5363162',6),(1048,'hendrerit varius felis','hendrerit varius felis',0,1,1.7333,'H5363162142',6),(1049,'iaculis blandit','iaculi blandit',0,1,1.5,'I2421453',6),(1050,'iaculis blandit eros','iaculi blandit eros',0,1,1.6667,'I242145362',6),(1051,'iaculis eget','iaculi eget',0,1,1.4,'I2423',6),(1052,'iaculis eget duis','iaculi eget duis',0,1,1.5667,'I24232',6),(1053,'iaculis lorem','iaculi lorem',0,1,1.4333,'I242465',6),(1054,'iaculis lorem ipsum','iaculi lorem ipsum',0,1,1.6333,'I242465125',6),(1055,'id erat','id erat',0,1,1.2333,'I363',6),(1056,'id erat euismod','id erat euismod',0,1,1.5,'I363253',6),(1057,'id pharetra','id pharetra',0,1,1.3667,'I31636',6),(1058,'id pharetra leo','id pharetra leo',0,1,1.5,'I316364',6),(1059,'id suscipit','id suscipit',0,1,1.3667,'I3213',6),(1060,'id suscipit id','id suscipit id',0,1,1.4667,'I3213',6),(1061,'id tincidunt','id tincidunt',0,1,1.4,'I352353',6),(1062,'id tincidunt arcu','id tincidunt arcu',0,1,1.5667,'I35235362',6),(1063,'id turpis','id turpis',0,1,1.3,'I3612',6),(1064,'id turpis quam','id turpis quam',0,1,1.4667,'I36125',6),(1065,'id volutpat','id volutpat',0,1,1.3667,'I314313',6),(1066,'id volutpat eget','id volutpat eget',0,1,1.5333,'I31431323',6),(1067,'in bibendum','in bibendum',0,1,1.3667,'I51535',6),(1068,'in bibendum arcu','in bibendum arcu',0,1,1.5333,'I5153562',6),(1069,'in elit','in elit',0,1,1.2333,'I543',6),(1070,'in et','in et',0,1,1.1667,'I530',6),(1071,'in et urna','in et urna',0,1,1.3333,'I5365',6),(1072,'in faucibus','in faucibus',0,1,1.3667,'I51212',7),(1073,'in faucibus orci','in faucibus orci',0,1,1.5333,'I5121262',7),(1074,'in hac','in hac',0,1,1.2,'I520',6),(1075,'in hac habitasse','in hac habitasse',0,1,1.5333,'I52132',6),(1076,'in molestie','in molestie',0,1,1.3667,'I5423',6),(1077,'in molestie enim','in molestie enim',0,1,1.5333,'I54235',6),(1078,'integer faucibus','integ faucibus',0,1,1.5333,'I53261212',6),(1079,'integer faucibus hendrerit','integ faucibus hendrerit',0,1,1.8667,'I532612125363',6),(1080,'integer quis','integ quis',0,1,1.4,'I53262',6),(1081,'integer quis arcu','integ quis arcu',0,1,1.5667,'I5326262',6),(1082,'integer vehicula','integ vehicula',0,1,1.5333,'I5326124',6),(1083,'integer vehicula odio','integ vehicula odio',0,1,1.7,'I53261243',6),(1084,'integer volutpat','integ volutpat',0,1,1.5333,'I532614313',6),(1085,'integer volutpat velit','integ volutpat velit',0,1,1.7333,'I532614313143',6),(1086,'interdum sit','interdum sit',0,1,1.4,'I5363523',6),(1087,'interdum sit amet','interdum sit amet',0,1,1.5667,'I536352353',6),(1088,'interdum velit','interdum velit',0,1,1.4667,'I53635143',6),(1089,'interdum velit non','interdum velit non',0,1,1.6,'I536351435',6),(1090,'ipsum curabitur','ipsum curabitur',0,1,1.5,'I12526136',6),(1091,'ipsum curabitur bibendum','ipsum curabitur bibendum',0,1,1.8,'I125261361535',6),(1092,'ipsum dolor','ipsum dolor',0,1,1.3667,'I125346',10),(1093,'ipsum dolor sit','ipsum dolor sit',0,1,1.5,'I12534623',10),(1094,'ipsum integer','ipsum integer',0,1,1.4333,'I125326',6),(1095,'ipsum integer quis','ipsum integer quis',0,1,1.6,'I1253262',6),(1096,'ipsum pellentesque','ipsum pellentesque',0,1,1.6,'I12514532',6),(1097,'ipsum pellentesque ultrices','ipsum pellentesque ultrices',0,1,1.9,'I125145324362',6),(1098,'ipsum primis','ipsum primis',0,1,1.4,'I1251652',7),(1099,'ipsum primis in','ipsum primis in',0,1,1.5,'I12516525',7),(1100,'item 5','item 5',0,1,1.2,'I350',2),(1101,'justo egestas','justo egestas',0,1,1.4333,'J3232',6),(1102,'justo egestas eget','justo egestas eget',0,1,1.6,'J32323',6),(1103,'lacinia ut','lacinia ut',0,1,1.3333,'L253',6),(1104,'lacinia ut eros','lacinia ut eros',0,1,1.5,'L25362',6),(1105,'lacus sed','lacu sed',0,1,1.3,'L230',6),(1106,'lacus sed arcu','lacu sed arcu',0,1,1.4667,'L2362',6),(1107,'laoreet enim','laoreet enim',0,1,1.4,'L635',7),(1108,'laoreet enim ac','laoreet enim ac',0,1,1.5,'L6352',6),(1109,'laoreet odio','laoreet odio',0,1,1.4,'L630',6),(1110,'laoreet odio auctor','laoreet odio auctor',0,1,1.6333,'L63236',6),(1111,'laoreet sem','laoreet sem',0,1,1.3667,'L6325',6),(1112,'laoreet sem phasellus','laoreet sem phasellus',0,1,1.7,'L63251242',6),(1113,'lectus in','lectu in',0,1,1.3,'L2325',6),(1114,'lectus in et','lectu in et',0,1,1.4,'L23253',6),(1115,'leo','leo',0,0,0.2,'L000',54),(1116,'leo id','leo id',0,1,1.2,'L300',6),(1117,'leo id pharetra','leo id pharetra',0,1,1.5,'L31636',6),(1118,'leo tempus','leo tempus',0,1,1.3333,'L3512',6),(1119,'leo tempus et','leo tempus et',0,1,1.4333,'L35123',6),(1120,'ligula a','ligula a',0,1,1.2667,'L240',6),(1121,'ligula a ornare','ligula a ornare',0,1,1.5,'L24656',6),(1122,'ligula orci','ligula orci',0,1,1.3667,'L2462',6),(1123,'ligula orci feugiat','ligula orci feugiat',0,1,1.6333,'L2462123',6),(1124,'ligula praesent','ligula praesent',0,1,1.5,'L2416253',6),(1125,'ligula praesent pellentesque','ligula praesent pellentesque',0,1,1.9333,'L241625314532',6),(1126,'lobortis sem','loborti sem',0,1,1.4,'L16325',6),(1127,'lobortis sem quam','loborti sem quam',0,1,1.5667,'L1632525',6),(1128,'lorem blandit','lorem blandit',0,1,1.4333,'L651453',6),(1129,'lorem blandit interdum','lorem blandit interdum',0,1,1.7333,'L65145353635',6),(1130,'lorem ipsum','lorem ipsum',0,1,1.3667,'L65125',10),(1131,'lorem ipsum dolor','lorem ipsum dolor',0,1,1.5667,'L65125346',10),(1132,'luctus et','luctu et',0,1,1.3,'L2323',7),(1133,'luctus et ultrices','luctu et ultrices',0,1,1.6,'L23234362',7),(1134,'luctus nunc','luctu nunc',0,1,1.3667,'L23252',14),(1135,'luctus nunc ligula','luctu nunc ligula',0,1,1.6,'L23252424',6),(1136,'maecenas adipiscing','maecena adipiscing',0,1,1.6333,'M25231252',6),(1137,'maecenas adipiscing tortor','maecena adipiscing tortor',0,1,1.8667,'M252312523636',6),(1138,'maecenas nisi','maecena nisi',0,1,1.4333,'M25252',6),(1139,'maecenas nisi mi','maecena nisi mi',0,1,1.5333,'M252525',6),(1140,'magna adipiscing','magna adipiscing',0,1,1.5333,'M2531252',6),(1141,'magna adipiscing duis','magna adipiscing duis',0,1,1.7,'M253125232',6),(1142,'malesuada facilisis','malesuada facilisis',0,1,1.6333,'M4231242',6),(1143,'malesuada facilisis lorem','malesuada facilisis lorem',0,1,1.8333,'M4231242465',6),(1144,'malesuada sapien','malesuada sapien',0,1,1.5333,'M423215',6),(1145,'malesuada sapien convallis','malesuada sapien convallis',0,1,1.8667,'M42321525142',6),(1146,'malesuada sem','malesuada sem',0,1,1.4333,'M42325',6),(1147,'malesuada sem sodales','malesuada sem sodales',0,1,1.7,'M423252342',6),(1148,'malesuada ultrices','malesuada ultrices',0,1,1.6,'M4234362',6),(1149,'malesuada ultrices nec','malesuada ultrices nec',0,1,1.7333,'M423436252',6),(1150,'massa ac','massa ac',0,1,1.2667,'M200',6),(1151,'massa ac tincidunt','massa ac tincidunt',0,1,1.6,'M2352353',6),(1152,'massa facilisis','massa facilisis',0,1,1.5,'M21242',6),(1153,'massa facilisis fringilla','massa facilisis fringilla',0,1,1.8333,'M2124216524',6),(1154,'mattis','matti',0,0,0.4,'M320',7),(1155,'mattis felis','matti felis',0,1,1.4,'M32142',6),(1156,'mattis felis sem','matti felis sem',0,1,1.5333,'M321425',6),(1157,'mauris at','mauri at',0,1,1.3,'M623',3),(1158,'mauris at ante','mauri at ante',0,1,1.4667,'M62353',3),(1159,'mauris dignissim','mauri dignissim',0,1,1.5333,'M6232525',6),(1160,'mauris dignissim a','mauri dignissim a',0,1,1.6,'M6232525',6),(1161,'mauris integer','mauri integer',0,1,1.4667,'M625326',6),(1162,'mauris integer vehicula','mauri integer vehicula',0,1,1.7667,'M625326124',6),(1163,'mauris varius','mauri varius',0,1,1.4333,'M62162',6),(1164,'mauris varius vitae','mauri varius vitae',0,1,1.6333,'M6216213',6),(1165,'metus ac','metu ac',0,1,1.2667,'M320',6),(1166,'metus ac tempus','metu ac tempus',0,1,1.5,'M323512',6),(1167,'mi elementum','mi elementum',0,1,1.4,'M4535',6),(1168,'mi elementum ut','mi elementum ut',0,1,1.5,'M45353',6),(1169,'molestie enim','molesti enim',0,1,1.4333,'M4235',6),(1170,'molestie enim morbi','molesti enim morbi',0,1,1.6333,'M423561',6),(1171,'mollis','molli',0,0,0.4,'M420',17),(1172,'mollis in','molli in',0,1,1.3,'M425',6),(1173,'mollis in elit','molli in elit',0,1,1.4667,'M42543',6),(1174,'morbi venenatis','morbi venenatis',0,1,1.5,'M61532',6),(1175,'morbi venenatis accumsan','morbi venenatis accumsan',0,1,1.8,'M61532525',6),(1176,'nec at','nec at',0,1,1.2,'N230',6),(1177,'nec at ligula','nec at ligula',0,1,1.4333,'N23424',6),(1178,'nec malesuada','nec malesuada',0,1,1.4333,'N25423',6),(1179,'nec malesuada sapien','nec malesuada sapien',0,1,1.6667,'N25423215',6),(1180,'nibh fringilla','nibh fringilla',0,1,1.4667,'N16524',6),(1181,'nibh fringilla eget','nibh fringilla eget',0,1,1.6333,'N1652423',6),(1182,'nibh pellentesque','nibh pellentesque',0,1,1.5667,'N14532',8),(1183,'nibh pellentesque dictum','nibh pellentesque dictum',0,1,1.8,'N145323235',6),(1184,'nisi mi','nisi mi',0,1,1.2333,'N250',6),(1185,'nisi mi elementum','nisi mi elementum',0,1,1.5667,'N254535',6),(1186,'nisi vehicula','nisi vehicula',0,1,1.4333,'N2124',6),(1187,'nisi vehicula id','nisi vehicula id',0,1,1.5333,'N21243',6),(1188,'non diam','non diam',0,1,1.2667,'N350',6),(1189,'non diam malesuada','non diam malesuada',0,1,1.6,'N35423',6),(1190,'nulla id erat','nulla id erat',0,1,1.4333,'N4363',6),(1191,'nulla sit','nulla sit',0,1,1.3,'N423',6),(1192,'nulla sit amet','nulla sit amet',0,1,1.4667,'N42353',6),(1193,'nulla ultricies','nulla ultricies',0,1,1.5,'N4362',6),(1194,'nulla ultricies laoreet','nulla ultricies laoreet',0,1,1.7667,'N4362463',6),(1195,'nunc ligula','nunc ligula',0,1,1.3667,'N2424',6),(1196,'nunc ligula orci','nunc ligula orci',0,1,1.5333,'N242462',6),(1197,'odio ac','odio ac',0,1,1.2333,'O320',6),(1198,'odio ac purus','odio ac purus',0,1,1.4333,'O32162',6),(1199,'odio auctor','odio auctor',0,1,1.3667,'O3236',6),(1200,'odio auctor volutpat','odio auctor volutpat',0,1,1.6667,'O323614313',6),(1201,'odio lorem','odio lorem',0,1,1.3333,'O3465',6),(1202,'odio lorem ipsum','odio lorem ipsum',0,1,1.5333,'O3465125',6),(1203,'odio sit','odio sit',0,1,1.2667,'O323',6),(1204,'odio sit amet','odio sit amet',0,1,1.4333,'O32353',6),(1205,'orci duis','orci duis',0,1,1.3,'O6232',7),(1206,'orci duis diam','orci duis diam',0,1,1.4667,'O623235',6),(1207,'orci feugiat','orci feugiat',0,1,1.4,'O62123',6),(1208,'orci feugiat sit','orci feugiat sit',0,1,1.5333,'O6212323',6),(1209,'orci luctus','orci luctus',0,1,1.3667,'O624232',7),(1210,'orci luctus et','orci luctus et',0,1,1.4667,'O6242323',7),(1211,'ornare lectus','ornar lectus',0,1,1.4333,'O6564232',6),(1212,'ornare lectus in','ornar lectus in',0,1,1.5333,'O65642325',6),(1213,'pellentesque dictum','pellentesqu dictum',0,1,1.6333,'P45323235',6),(1214,'pellentesque dictum rhoncus','pellentesqu dictum rhoncus',0,1,1.9,'P45323235652',6),(1215,'pellentesque faucibus','pellentesqu faucibus',0,1,1.7,'P45321212',6),(1216,'pellentesque faucibus augue','pellentesqu faucibus augue',0,1,1.9,'P45321212',6),(1217,'pellentesque lacus','pellentesqu lacus',0,1,1.6,'P453242',6),(1218,'pellentesque lacus sed','pellentesqu lacus sed',0,1,1.7333,'P4532423',6),(1219,'pellentesque tellus','pellentesqu tellus',0,1,1.6333,'P4532342',6),(1220,'pellentesque tellus augue','pellentesqu tellus augue',0,1,1.8333,'P4532342',6),(1221,'pellentesque ultrices','pellentesqu ultrices',0,1,1.7,'P45324362',6),(1222,'pellentesque ultrices vivamus','pellentesqu ultrices vivamus',0,1,1.9667,'P45324362152',6),(1223,'pharetra leo','pharetra leo',0,1,1.4,'P6364',6),(1224,'pharetra leo tempus','pharetra leo tempus',0,1,1.6333,'P63643512',6),(1225,'phasellus ullamcorper','phasellu ullamcorper',0,1,1.7,'P242452616',6),(1226,'phasellus ullamcorper blandit','phasellu ullamcorper blandit',0,1,1.9667,'P2424526161453',6),(1227,'phasellus vehicula','phasellu vehicula',0,1,1.6,'P242124',6),(1228,'phasellus vehicula malesuada','phasellu vehicula malesuada',0,1,1.9333,'P2421245423',6),(1229,'platea','platea',0,0,0.4,'P430',6),(1230,'platea dictumst','platea dictumst',0,1,1.5,'P4323523',6),(1231,'platea dictumst donec','platea dictumst donec',0,1,1.7,'P432352352',6),(1232,'platea dictumst ut','platea dictumst ut',0,1,1.6,'P4323523',6),(1233,'porta at','porta at',0,1,1.2667,'P630',6),(1234,'porta at nulla','porta at nulla',0,1,1.4667,'P6354',6),(1235,'porta nulla','porta nulla',0,1,1.3667,'P6354',6),(1236,'porta nulla sit','porta nulla sit',0,1,1.5,'P635423',6),(1237,'posuere cubilia','posuer cubilia',0,1,1.5,'P26214',7),(1238,'posuere cubilia curae','posuer cubilia curae',0,1,1.7,'P2621426',7),(1239,'posuere vitae','posuer vitae',0,1,1.4333,'P2613',6),(1240,'posuere vitae quis','posuer vitae quis',0,1,1.6,'P26132',6),(1241,'praesent','praesent',0,0,0.5333,'P6253',25),(1242,'praesent in','praesent in',0,1,1.3667,'P62535',6),(1243,'praesent in molestie','praesent in molestie',0,1,1.6667,'P62535423',6),(1244,'praesent pellentesque','praesent pellentesque',0,1,1.7,'P625314532',6),(1245,'praesent pellentesque lacus','praesent pellentesque lacus',0,1,1.9,'P62531453242',6),(1246,'primis','primi',0,0,0.4,'P652',7),(1247,'primis in','primi in',0,1,1.3,'P6525',7),(1248,'primis in faucibus','primi in faucibus',0,1,1.6,'P65251212',7),(1249,'proin euismod','proin euismod',0,1,1.4333,'P65253',6),(1250,'proin euismod laoreet','proin euismod laoreet',0,1,1.7,'P65253463',6),(1251,'pulvinar eros','pulvinar eros',0,1,1.4333,'P41562',6),(1252,'pulvinar eros ut','pulvinar eros ut',0,1,1.5333,'P415623',6),(1253,'purus euismod','puru euismod',0,1,1.4333,'P6253',6),(1254,'purus euismod auctor','puru euismod auctor',0,1,1.6667,'P6253236',6),(1255,'purus quisque','puru quisque',0,1,1.4333,'P620',6),(1256,'purus quisque nibh','puru quisque nibh',0,1,1.6,'P6251',6),(1257,'quam quisque','quam quisque',0,1,1.4,'Q520',6),(1258,'quam quisque ullamcorper','quam quisque ullamcorper',0,1,1.8,'Q52452616',6),(1259,'quam sed','quam sed',0,1,1.2667,'Q523',6),(1260,'quam sed ipsum','quam sed ipsum',0,1,1.4667,'Q523125',6),(1261,'quis arcu','qui arcu',0,1,1.3,'Q620',6),(1262,'quis arcu vitae','qui arcu vitae',0,1,1.5,'Q6213',6),(1263,'quis cursus','qui cursus',0,1,1.3667,'Q620',6),(1264,'quis cursus aliquam','qui cursus aliquam',0,1,1.6333,'Q62425',6),(1265,'quis ipsum','qui ipsum',0,1,1.3333,'Q125',6),(1266,'quis ipsum pellentesque','qui ipsum pellentesque',0,1,1.7667,'Q12514532',6),(1267,'quis purus','qui purus',0,1,1.3333,'Q162',6),(1268,'quis purus quisque','qui purus quisque',0,1,1.6,'Q162',6),(1269,'quis vehicula','qui vehicula',0,1,1.4333,'Q124',6),(1270,'quis vehicula est','qui vehicula est',0,1,1.5667,'Q12423',6),(1271,'quisque nibh','quisqu nibh',0,1,1.4,'Q510',6),(1272,'quisque ullamcorper','quisqu ullamcorper',0,1,1.6333,'Q452616',6),(1273,'quisque ullamcorper condimentum','quisqu ullamcorper condimentum',0,1,2,'Q452616253535',6),(1274,'rhoncus velit','rhoncu velit',0,1,1.4333,'R52143',6),(1275,'rhoncus velit sit','rhoncu velit sit',0,1,1.5667,'R5214323',6),(1276,'rutrum','rutrum',0,0,0.4,'R365',9),(1277,'rutrum magna','rutrum magna',0,1,1.4,'R36525',8),(1278,'sagittis vel','sagitti vel',0,1,1.4,'S3214',6),(1279,'sagittis vel faucibus','sagitti vel faucibus',0,1,1.7,'S32141212',6),(1280,'sapien convallis','sapien convallis',0,1,1.5333,'S1525142',6),(1281,'sapien convallis proin','sapien convallis proin',0,1,1.7333,'S1525142165',6),(1282,'scelerisque','scelerisqu',0,0,0.7333,'S462',18),(1283,'scelerisque odio','scelerisqu odio',0,1,1.5333,'S4623',6),(1284,'scelerisque odio ac','scelerisqu odio ac',0,1,1.6333,'S46232',6),(1285,'sed arcu','sed arcu',0,1,1.2667,'S362',6),(1286,'sed arcu cursus','sed arcu cursus',0,1,1.5,'S36262',6),(1287,'sed cursus','sed cursus',0,1,1.3333,'S3262',7),(1288,'sed cursus laoreet','sed cursus laoreet',0,1,1.6,'S3262463',6),(1289,'sed ipsum','sed ipsum',0,1,1.3,'S3125',6),(1290,'sed ipsum curabitur','sed ipsum curabitur',0,1,1.6333,'S312526136',6),(1291,'sed lorem','sed lorem',0,1,1.3,'S3465',6),(1292,'sed lorem blandit','sed lorem blandit',0,1,1.5667,'S34651453',6),(1293,'sed nibh','sed nibh',0,1,1.2667,'S351',6),(1294,'sed nibh pellentesque','sed nibh pellentesque',0,1,1.7,'S3514532',6),(1295,'sed urna','sed urna',0,1,1.2667,'S365',7),(1296,'sed urna sed','sed urna sed',0,1,1.4,'S36523',6),(1297,'sem phasellus','sem phasellus',0,1,1.4333,'S51242',6),(1298,'sem phasellus ullamcorper','sem phasellus ullamcorper',0,1,1.8333,'S51242452616',6),(1299,'sem quam','sem quam',0,1,1.2667,'S525',6),(1300,'sem quam sed','sem quam sed',0,1,1.4,'S52523',6),(1301,'sem sodales','sem sodales',0,1,1.3667,'S52342',6),(1302,'sem sodales sit','sem sodales sit',0,1,1.5,'S523423',6),(1303,'sem tincidunt','sem tincidunt',0,1,1.4333,'S5352353',6),(1304,'sem tincidunt tellus','sem tincidunt tellus',0,1,1.6667,'S535235342',6),(1305,'sem vulputate','sem vulputate',0,1,1.4333,'S51413',6),(1306,'sem vulputate eget','sem vulputate eget',0,1,1.6,'S5141323',6),(1307,'sit amet condimentum','sit amet condimentum',0,1,1.6667,'S353253535',6),(1308,'sit amet consectetur','sit amet consectetur',0,1,1.6667,'S35325236',10),(1309,'sit amet lobortis','sit amet lobortis',0,1,1.5667,'S35341632',6),(1310,'sit amet mollis','sit amet mollis',0,1,1.5,'S353542',6),(1311,'sit amet praesent','sit amet praesent',0,1,1.5667,'S35316253',6),(1312,'sit amet sagittis','sit amet sagittis',0,1,1.5667,'S353232',6),(1313,'sit amet sed','sit amet sed',0,1,1.4,'S35323',6),(1314,'sodales','sodal',0,0,0.4667,'S342',7),(1315,'sodales sit','sodal sit',0,1,1.3667,'S3423',6),(1316,'sodales sit amet','sodal sit amet',0,1,1.5333,'S342353',6),(1317,'suscipit id volutpat','suscipit id volutpat',0,1,1.6667,'S1314313',6),(1318,'suspendisse','suspendiss',0,0,0.7333,'S1532',10),(1319,'suspendisse pulvinar','suspendiss pulvinar',0,1,1.6667,'S153214156',6),(1320,'suspendisse pulvinar eros','suspendiss pulvinar eros',0,1,1.8333,'S1532141562',6),(1321,'tellus','tellu',0,0,0.4,'T420',12),(1322,'tellus augue','tellu augue',0,1,1.4,'T420',6),(1323,'tellus augue cursus','tellu augue cursus',0,1,1.6333,'T4262',6),(1324,'tellus quis','tellu quis',0,1,1.3667,'T420',6),(1325,'tellus quis vehicula','tellu quis vehicula',0,1,1.6667,'T42124',6),(1326,'tempus et','tempu et',0,1,1.3,'T5123',6),(1327,'tempus et curabitur','tempu et curabitur',0,1,1.6333,'T512326136',6),(1328,'tempus sem','tempu sem',0,1,1.3333,'T5125',6),(1329,'tempus sem vulputate','tempu sem vulputate',0,1,1.6667,'T51251413',6),(1330,'tincidunt arcu','tincidunt arcu',0,1,1.4667,'T5235362',6),(1331,'tincidunt arcu pellentesque','tincidunt arcu pellentesque',0,1,1.9,'T523536214532',6),(1332,'tincidunt eget mauris','tincidunt eget mauris',0,1,1.7,'T5235323562',6),(1333,'tincidunt enim','tincidunt enim',0,1,1.4667,'T523535',6),(1334,'tincidunt enim porta','tincidunt enim porta',0,1,1.6667,'T523535163',6),(1335,'tincidunt et','tincidunt et',0,1,1.4,'T52353',6),(1336,'tincidunt et lacinia','tincidunt et lacinia',0,1,1.6667,'T52353425',6),(1337,'tincidunt tellus','tincidunt tellus',0,1,1.5333,'T5235342',6),(1338,'tincidunt tellus quis','tincidunt tellus quis',0,1,1.7,'T5235342',6),(1339,'tortor ac','tortor ac',0,1,1.3,'T6362',6),(1340,'tortor ac iaculis','tortor ac iaculis',0,1,1.5667,'T636242',6),(1341,'turpis eget','turpi eget',0,1,1.3667,'T6123',6),(1342,'turpis eget congue','turpi eget congue',0,1,1.6,'T6123252',6),(1343,'turpis in','turpi in',0,1,1.3,'T6125',6),(1344,'turpis in bibendum','turpi in bibendum',0,1,1.6,'T61251535',6),(1345,'turpis quam','turpi quam',0,1,1.3667,'T6125',6),(1346,'turpis quam quisque','turpi quam quisque',0,1,1.6333,'T61252',6),(1347,'ullamcorper blandit','ullamcorp blandit',0,1,1.6333,'U4526161453',6),(1348,'ullamcorper blandit leo','ullamcorp blandit leo',0,1,1.7667,'U45261614534',6),(1349,'ullamcorper condimentum','ullamcorp condimentum',0,1,1.7667,'U452616253535',6),(1350,'ullamcorper condimentum urna','ullamcorp condimentum urna',0,1,1.9333,'U45261625353565',6),(1351,'ultrices','ultric',0,0,0.5333,'U4362',16),(1352,'ultrices arcu','ultric arcu',0,1,1.4333,'U436262',6),(1353,'ultrices arcu dictum','ultric arcu dictum',0,1,1.6667,'U4362623235',6),(1354,'ultrices nec','ultric nec',0,1,1.4,'U436252',6),(1355,'ultrices nec at','ultric nec at',0,1,1.5,'U4362523',6),(1356,'ultrices posuere','ultric posuere',0,1,1.5333,'U4362126',7),(1357,'ultrices posuere cubilia','ultric posuere cubilia',0,1,1.8,'U4362126214',7),(1358,'ultrices sed','ultric sed',0,1,1.4,'U43623',6),(1359,'ultrices sed cursus','ultric sed cursus',0,1,1.6333,'U43623262',6),(1360,'ultrices vivamus','ultric vivamus',0,1,1.5333,'U4362152',6),(1361,'ultrices vivamus sed','ultric vivamus sed',0,1,1.6667,'U43621523',6),(1362,'ultricies','ultrici',0,0,0.6,'U4362',17),(1363,'ultricies laoreet','ultrici laoreet',0,1,1.5667,'U4362463',6),(1364,'ultricies laoreet enim','ultrici laoreet enim',0,1,1.7333,'U43624635',6),(1365,'ultricies metus','ultrici metus',0,1,1.5,'U4362532',6),(1366,'ultricies metus ac','ultrici metus ac',0,1,1.6,'U4362532',6),(1367,'urna','urna',0,0,0.2667,'U650',41),(1368,'urna ac','urna ac',0,1,1.2333,'U652',6),(1369,'urna ac odio','urna ac odio',0,1,1.4,'U6523',6),(1370,'urna arcu','urna arcu',0,1,1.3,'U6562',6),(1371,'urna arcu id','urna arcu id',0,1,1.4,'U65623',6),(1372,'urna cras','urna cras',0,1,1.3,'U65262',6),(1373,'urna cras aliquam','urna cras aliquam',0,1,1.5667,'U65262425',6),(1374,'urna gravida','urna gravida',0,1,1.4,'U652613',6),(1375,'urna gravida nec','urna gravida nec',0,1,1.5333,'U65261352',6),(1376,'urna ligula','urna ligula',0,1,1.3667,'U65424',6),(1377,'urna ligula a','urna ligula a',0,1,1.4333,'U65424',6),(1378,'urna quis','urna quis',0,1,1.3,'U652',6),(1379,'urna quis cursus','urna quis cursus',0,1,1.5333,'U65262',6),(1380,'urna sed','urna sed',0,1,1.2667,'U6523',6),(1381,'urna sed lorem','urna sed lorem',0,1,1.4667,'U6523465',6),(1382,'ut dapibus','ut dapibus',0,1,1.3333,'U312',6),(1383,'ut dapibus at','ut dapibus at',0,1,1.4333,'U3123',6),(1384,'ut elit','ut elit',0,1,1.2333,'U343',6),(1385,'ut elit nisi','ut elit nisi',0,1,1.4,'U34352',6),(1386,'ut eros','ut eros',0,1,1.2333,'U362',6),(1387,'ut eros aliquam','ut eros aliquam',0,1,1.5,'U362425',6),(1388,'ut massa','ut massa',0,1,1.2667,'U352',6),(1389,'ut massa facilisis','ut massa facilisis',0,1,1.6,'U3521242',6),(1390,'ut rutrum','ut rutrum',0,1,1.3,'U36365',6),(1391,'ut rutrum magna','ut rutrum magna',0,1,1.5,'U3636525',6),(1392,'varius felis','variu felis',0,1,1.4,'V62142',6),(1393,'varius felis a','variu felis a',0,1,1.4667,'V62142',6),(1394,'varius vitae','variu vitae',0,1,1.4,'V6213',6),(1395,'varius vitae integer','variu vitae integer',0,1,1.6667,'V62135326',6),(1396,'vehicula','vehicula',0,0,0.5333,'V240',19),(1397,'vehicula est','vehicula est',0,1,1.4,'V2423',6),(1398,'vehicula est urna','vehicula est urna',0,1,1.5667,'V242365',6),(1399,'vehicula id','vehicula id',0,1,1.3667,'V243',6),(1400,'vehicula id suscipit','vehicula id suscipit',0,1,1.6667,'V243213',6),(1401,'vehicula malesuada','vehicula malesuada',0,1,1.6,'V245423',6),(1402,'vehicula malesuada facilisis','vehicula malesuada facilisis',0,1,1.9333,'V2454231242',6),(1403,'vehicula odio','vehicula odio',0,1,1.4333,'V243',6),(1404,'vehicula odio sit','vehicula odio sit',0,1,1.5667,'V24323',6),(1405,'vel augue','vel augue',0,1,1.3,'V420',6),(1406,'vel augue ultrices','vel augue ultrices',0,1,1.6,'V424362',6),(1407,'vel faucibus','vel faucibus',0,1,1.4,'V41212',6),(1408,'vel faucibus et','vel faucibus et',0,1,1.5,'V412123',6),(1409,'vel urna','vel urna',0,1,1.2667,'V465',6),(1410,'vel urna gravida','vel urna gravida',0,1,1.5333,'V4652613',6),(1411,'velit non','velit non',0,1,1.3,'V435',6),(1412,'velit non diam','velit non diam',0,1,1.4667,'V43535',6),(1413,'velit sit','velit sit',0,1,1.3,'V4323',7),(1414,'velit sit amet','velit sit amet',0,1,1.4667,'V432353',7),(1415,'velit vel','velit vel',0,1,1.3,'V4314',6),(1416,'velit vel urna','velit vel urna',0,1,1.4667,'V431465',6),(1417,'venenatis accumsan','venenati accumsan',0,1,1.6,'V532525',6),(1418,'venenatis accumsan turpis','venenati accumsan turpis',0,1,1.8333,'V5325253612',6),(1419,'vestibulum ante','vestibulum ante',0,1,1.5,'V231453',8),(1420,'vestibulum ante ipsum','vestibulum ante ipsum',0,1,1.7,'V231453125',7),(1421,'vitae elit','vita elit',0,1,1.3333,'V343',6),(1422,'vitae elit cursus','vita elit cursus',0,1,1.5667,'V343262',6),(1423,'vitae integer','vita integer',0,1,1.4333,'V35326',6),(1424,'vitae integer volutpat','vita integer volutpat',0,1,1.7333,'V3532614313',6),(1425,'vitae quis','vita quis',0,1,1.3333,'V320',6),(1426,'vitae quis purus','vita quis purus',0,1,1.5333,'V32162',6),(1427,'vivamus sed','vivamu sed',0,1,1.3667,'V523',6),(1428,'vivamus sed urna','vivamu sed urna',0,1,1.5333,'V52365',6),(1429,'vivamus vel','vivamu vel',0,1,1.3667,'V5214',7),(1430,'vivamus vel augue','vivamu vel augue',0,1,1.5667,'V52142',6),(1431,'volutpat eget','volutpat eget',0,1,1.4333,'V431323',6),(1432,'volutpat eget enim','volutpat eget enim',0,1,1.6,'V4313235',6),(1433,'volutpat suspendisse','volutpat suspendisse',0,1,1.6667,'V431321532',6),(1434,'volutpat suspendisse pulvinar','volutpat suspendisse pulvinar',0,1,1.9667,'V43132153214156',6),(1435,'volutpat velit','volutpat velit',0,1,1.4667,'V4313143',6),(1436,'volutpat velit vel','volutpat velit vel',0,1,1.6,'V431314314',6),(1437,'vulputate','vulput',0,0,0.6,'V413',10),(1438,'vulputate eget','vulput eget',0,1,1.4667,'V41323',7),(1439,'vulputate eget donec','vulput eget donec',0,1,1.6667,'V4132352',6),(1440,'6','6',0,0,0.1,'',2),(1441,'67','67',0,0,0.2,'',1),(1442,'aliquam erat','aliquam erat',0,1,1.4,'A42563',6),(1443,'blog item 6','blog item 6',0,1,1.3667,'B4235',1),(1444,'item 6','item 6',0,1,1.2,'I350',1),(1445,'68','68',0,0,0.2,'',2),(1446,'7','7',0,0,0.1,'',2),(1447,'blog item 7','blog item 7',0,1,1.3667,'B4235',1),(1448,'facilisi','facilisi',0,0,0.5333,'F242',3),(1449,'item 7','item 7',0,1,1.2,'I350',1),(1450,'nulla facilisi','nulla facilisi',0,1,1.4667,'N41242',3),(1451,'69','69',0,0,0.2,'',3),(1452,'8','8',0,0,0.1,'',2),(1453,'blog item 8','blog item 8',0,1,1.3667,'B4235',2),(1454,'item 8','item 8',0,1,1.2,'I350',2),(1455,'curabitur consectetur','curabitur consectetur',0,1,1.7,'C613625236',2),(1456,'404','404',0,0,0.3,'',8),(1457,'404 page','404 page',0,1,1.2667,'P200',8),(1458,'404 page not','404 page not',0,1,1.4,'P253',8),(1459,'70','70',0,0,0.2,'',8),(1460,'are','ar',0,0,0.2,'A600',8),(1461,'are looking','ar looking',0,1,1.3667,'A64252',8),(1462,'are looking for','ar looking for',0,1,1.5,'A6425216',8),(1463,'been','been',0,0,0.2667,'B500',12),(1464,'been removed','been removed',0,1,1.4,'B56513',8),(1465,'been removed had','been removed had',0,1,1.5333,'B56513',8),(1466,'below','below',0,0,0.3333,'B400',8),(1467,'below to','below to',0,1,1.2667,'B430',8),(1468,'below to look','below to look',0,1,1.4333,'B4342',8),(1469,'box','box',0,0,0.2,'B200',8),(1470,'box below','box below',0,1,1.3,'B214',8),(1471,'box below to','box below to',0,1,1.4,'B2143',8),(1472,'changed','chang',0,0,0.4667,'C523',8),(1473,'changed or','chang or',0,1,1.3333,'C5236',8),(1474,'changed or is','chang or is',0,1,1.4333,'C52362',8),(1475,'for','for',0,0,0.2,'F600',12),(1476,'for information','for information',0,1,1.5,'F6516535',8),(1477,'for information on','for information on',0,1,1.6,'F6516535',8),(1478,'for might','for might',0,1,1.3,'F6523',8),(1479,'for might have','for might have',0,1,1.4667,'F65231',8),(1480,'found','found',0,0,0.3333,'F530',12),(1481,'found the','found the',0,1,1.3,'F530',8),(1482,'found the page','found the page',0,1,1.4667,'F5312',8),(1483,'had','had',0,0,0.2,'H300',8),(1484,'had its','had its',0,1,1.2333,'H320',8),(1485,'had its name','had its name',0,1,1.4,'H325',8),(1486,'have','have',0,0,0.2667,'H100',8),(1487,'have been','have been',0,1,1.3,'H150',8),(1488,'have been removed','have been removed',0,1,1.5667,'H156513',8),(1489,'information','inform',0,0,0.7333,'I516535',8),(1490,'information on','inform on',0,1,1.4667,'I516535',8),(1491,'information on the','inform on the',0,1,1.6,'I5165353',8),(1492,'internet','internet',0,0,0.5333,'I53653',8),(1493,'is','is',0,0,0.1333,'I200',12),(1494,'is temporarily','is temporarily',0,1,1.4667,'I235164',8),(1495,'is temporarily unavailable','is temporarily unavailable',0,1,1.8667,'I23516451414',8),(1496,'its','it',0,0,0.2,'I320',8),(1497,'its name','it name',0,1,1.2667,'I325',8),(1498,'its name changed','it name changed',0,1,1.5333,'I3252523',8),(1499,'look','look',0,0,0.2667,'L200',8),(1500,'look for','look for',0,1,1.2667,'L216',8),(1501,'look for information','look for information',0,1,1.6667,'L216516535',8),(1502,'looking','look',0,0,0.4667,'L252',8),(1503,'looking for','look for',0,1,1.3667,'L25216',8),(1504,'looking for might','look for might',0,1,1.5667,'L25216523',8),(1505,'might','might',0,0,0.3333,'M230',8),(1506,'might have','might have',0,1,1.3333,'M231',8),(1507,'might have been','might have been',0,1,1.5,'M2315',8),(1508,'name','name',0,0,0.2667,'N000',8),(1509,'name changed','name changed',0,1,1.4,'N2523',8),(1510,'name changed or','name changed or',0,1,1.5,'N25236',8),(1511,'not','not',0,0,0.2,'N300',8),(1512,'not found','not found',0,1,1.3,'N3153',8),(1513,'not found the','not found the',0,1,1.4333,'N3153',8),(1514,'on','on',0,0,0.1333,'O500',8),(1515,'on the','on the',0,1,1.2,'O530',8),(1516,'on the internet','on the internet',0,1,1.5,'O5353653',8),(1517,'or','or',0,0,0.1333,'O600',12),(1518,'or is','or is',0,1,1.1667,'O620',8),(1519,'or is temporarily','or is temporarily',0,1,1.5667,'O6235164',8),(1520,'our','our',0,0,0.2,'O600',8),(1521,'our search','our search',0,1,1.3333,'O6262',8),(1522,'our search box','our search box',0,1,1.4667,'O626212',8),(1523,'page','page',0,0,0.2667,'P200',8),(1524,'page not','page not',0,1,1.2667,'P253',8),(1525,'page not found','page not found',0,1,1.4667,'P253153',8),(1526,'page you','page you',0,1,1.2667,'P200',8),(1527,'page you are','page you are',0,1,1.4,'P260',8),(1528,'please','pleas',0,0,0.4,'P420',8),(1529,'please try','pleas try',0,1,1.3333,'P4236',8),(1530,'please try using','pleas try using',0,1,1.5333,'P4236252',8),(1531,'removed','remov',0,0,0.4667,'R513',8),(1532,'removed had','remov had',0,1,1.3667,'R513',8),(1533,'removed had its','remov had its',0,1,1.5,'R5132',8),(1534,'search','search',0,0,0.4,'S620',12),(1535,'search box','search box',0,1,1.3333,'S6212',8),(1536,'search box below','search box below',0,1,1.5333,'S621214',8),(1537,'sorry','sorri',0,0,0.3333,'S600',8),(1538,'sorry 404','sorri 404',0,1,1.3,'S600',8),(1539,'sorry 404 page','sorri 404 page',0,1,1.4667,'S612',8),(1540,'system','system',0,0,0.4,'S350',8),(1541,'temporarily','temporarili',0,0,0.7333,'T5164',8),(1542,'temporarily unavailable','temporarili unavailable',0,1,1.7667,'T516451414',8),(1543,'temporarily unavailable please','temporarili unavailable please',0,1,2,'T516451414142',8),(1544,'the','the',0,0,0.2,'T000',16),(1545,'the internet','the internet',0,1,1.4,'T53653',8),(1546,'the page','the page',0,1,1.2667,'T120',8),(1547,'the page you','the page you',0,1,1.4,'T120',8),(1548,'to','to',0,0,0.1333,'T000',16),(1549,'to look','to look',0,1,1.2333,'T420',8),(1550,'to look for','to look for',0,1,1.3667,'T4216',8),(1551,'try','try',0,0,0.2,'T600',8),(1552,'try using','try using',0,1,1.3,'T6252',8),(1553,'try using our','try using our',0,1,1.4333,'T62526',8),(1554,'unavailable','unavail',0,0,0.7333,'U51414',8),(1555,'unavailable please','unavail please',0,1,1.6,'U51414142',8),(1556,'unavailable please try','unavail please try',0,1,1.7333,'U5141414236',8),(1557,'using','us',0,0,0.3333,'U252',8),(1558,'using our','us our',0,1,1.3,'U2526',8),(1559,'using our search','us our search',0,1,1.5333,'U2526262',8),(1560,'you','you',0,0,0.2,'Y000',8),(1561,'you are','you are',0,1,1.2333,'Y600',8),(1562,'you are looking','you are looking',0,1,1.5,'Y64252',8),(1563,'internet loadmodule','internet loadmodule',0,1,1.6333,'I5365343534',2),(1564,'internet loadmodule mod','internet loadmodule mod',0,1,1.7667,'I536534353453',2),(1565,'loadmodule','loadmodul',0,0,0.6667,'L3534',2),(1566,'loadmodule mod','loadmodul mod',0,1,1.4667,'L353453',2),(1567,'loadmodule mod search','loadmodul mod search',0,1,1.7,'L353453262',2),(1568,'mod','mod',0,0,0.2,'M300',2),(1569,'mod search','mod search',0,1,1.3333,'M3262',2),(1570,'the internet loadmodule','the internet loadmodule',0,1,1.7667,'T5365343534',2),(1571,'error404','error404',0,0,0.5333,'E600',2),(1572,'internet loadposition','internet loadposition',0,1,1.7,'I53653431235',2),(1573,'internet loadposition error404','internet loadposition error404',0,1,2,'I536534312356',2),(1574,'loadposition error404','loadposit error404',0,1,1.7,'L312356',2),(1575,'the internet loadposition','the internet loadposition',0,1,1.8333,'T53653431235',2),(1576,'demo','demo',0,0,0.2667,'D500',95),(1577,'demo user','demo user',0,1,1.3,'D526',95),(1578,'10','10',0,0,0.2,'',3),(1579,'alert','alert',0,0,0.3333,'A463',1),(1580,'alert boxes','alert boxes',0,1,1.3667,'A46312',1),(1581,'boxes','box',0,0,0.3333,'B200',1),(1582,'category','categori',0,0,0.5333,'C326',2),(1583,'11','11',0,0,0.2,'',1),(1584,'columns','column',0,0,0.4667,'C452',1),(1585,'fluid','fluid',0,0,0.3333,'F430',1),(1586,'fluid columns','fluid columns',0,1,1.4333,'F432452',1),(1587,'15','15',0,0,0.2,'',6),(1588,'portfolio','portfolio',0,0,0.6,'P6314',67),(1589,'portfolio 1','portfolio 1',0,1,1.3667,'P6314',1),(1590,'16','16',0,0,0.2,'',6),(1591,'portfolio 2','portfolio 2',0,1,1.3667,'P6314',1),(1592,'17','17',0,0,0.2,'',7),(1593,'portfolio 3','portfolio 3',0,1,1.3667,'P6314',1),(1594,'18','18',0,0,0.2,'',7),(1595,'portfolio 4','portfolio 4',0,1,1.3667,'P6314',1),(1596,'19','19',0,0,0.2,'',7),(1597,'portfolio 5','portfolio 5',0,1,1.3667,'P6314',1),(1598,'20','20',0,0,0.2,'',12),(1599,'portfolio 6','portfolio 6',0,1,1.3667,'P6314',1),(1600,'21','21',0,0,0.2,'',5),(1601,'portfolio 7','portfolio 7',0,1,1.3667,'P6314',1),(1602,'25','25',0,0,0.2,'',2),(1603,'ac egestas','ac egestas',0,1,1.3333,'A232',1),(1604,'ac egestas adipiscing','ac egestas adipiscing',0,1,1.7,'A23231252',1),(1605,'ac fermentum','ac fermentum',0,1,1.4,'A216535',1),(1606,'ac fermentum justo','ac fermentum justo',0,1,1.6,'A21653523',1),(1607,'adipiscing elit suspendisse','adipisc elit suspendisse',0,1,1.9,'A312524321532',1),(1608,'adipiscing tellus','adipisc tellus',0,1,1.5667,'A31252342',1),(1609,'adipiscing tellus leo','adipisc tellus leo',0,1,1.7,'A312523424',1),(1610,'aliquam odio','aliquam odio',0,1,1.4,'A4253',1),(1611,'aliquam odio sapien','aliquam odio sapien',0,1,1.6333,'A4253215',1),(1612,'amet etiam','amet etiam',0,1,1.3333,'A535',1),(1613,'amet etiam mauris','amet etiam mauris',0,1,1.5667,'A53562',1),(1614,'amet magna','amet magna',0,1,1.3333,'A53525',1),(1615,'amet magna suspendisse','amet magna suspendisse',0,1,1.7333,'A5352521532',1),(1616,'amet nunc','amet nunc',0,1,1.3,'A5352',1),(1617,'amet nunc pellentesque','amet nunc pellentesque',0,1,1.7333,'A535214532',1),(1618,'ante fermentum','ant fermentum',0,1,1.4667,'A5316535',1),(1619,'ante fermentum eget','ant fermentum eget',0,1,1.6333,'A531653523',1),(1620,'arcu vestibulum','arcu vestibulum',0,1,1.5,'A62123145',1),(1621,'arcu vestibulum fringilla','arcu vestibulum fringilla',0,1,1.8333,'A6212314516524',1),(1622,'arcu vivamus','arcu vivamus',0,1,1.4,'A62152',1),(1623,'arcu vivamus hendrerit','arcu vivamus hendrerit',0,1,1.7333,'A621525363',1),(1624,'auctor tempus','auctor tempus',0,1,1.4333,'A2363512',1),(1625,'auctor tempus justo','auctor tempus justo',0,1,1.6333,'A23635123',1),(1626,'bibendum vitae','bibendum vitae',0,1,1.4667,'B53513',1),(1627,'bibendum vitae facilisis','bibendum vitae facilisis',0,1,1.8,'B535131242',1),(1628,'congue aliquam','congu aliquam',0,1,1.4667,'C52425',1),(1629,'congue aliquam odio','congu aliquam odio',0,1,1.6333,'C524253',1),(1630,'consequat nunc','consequat nunc',0,1,1.4667,'C52352',1),(1631,'consequat nunc justo','consequat nunc justo',0,1,1.6667,'C523523',1),(1632,'convallis quam','conval quam',0,1,1.4667,'C51425',1),(1633,'convallis quam non','conval quam non',0,1,1.6,'C51425',1),(1634,'demolink','demolink',0,0,0.5333,'D5452',15),(1635,'demolink org','demolink org',0,1,1.4,'D545262',15),(1636,'diam dictum','diam dictum',0,1,1.3667,'D53235',1),(1637,'diam dictum magna','diam dictum magna',0,1,1.5667,'D5323525',1),(1638,'dictum magna','dictum magna',0,1,1.4,'D23525',1),(1639,'dictum magna vitae','dictum magna vitae',0,1,1.6,'D2352513',1),(1640,'dignissim velit diam','dignissim velit diam',0,1,1.6667,'D25251435',1),(1641,'egestas adipiscing','egesta adipiscing',0,1,1.6,'E23231252',1),(1642,'egestas adipiscing tellus','egesta adipiscing tellus',0,1,1.8333,'E23231252342',1),(1643,'eget facilisis sapien','eget facilisis sapien',0,1,1.7,'E23124215',1),(1644,'elementum enim','elementum enim',0,1,1.4667,'E4535',1),(1645,'elementum enim congue','elementum enim congue',0,1,1.7,'E4535252',1),(1646,'elit suspendisse','elit suspendisse',0,1,1.5333,'E4321532',2),(1647,'elit suspendisse facilisis','elit suspendisse facilisis',0,1,1.8667,'E43215321242',1),(1648,'enim congue','enim congue',0,1,1.3667,'E5252',1),(1649,'enim congue aliquam','enim congue aliquam',0,1,1.6333,'E5252425',1),(1650,'erat ultrices','erat ultrices',0,1,1.4333,'E634362',1),(1651,'erat ultrices in','erat ultrices in',0,1,1.5333,'E6343625',1),(1652,'et luctus','et luctus',0,1,1.3,'E34232',1),(1653,'et luctus non','et luctus non',0,1,1.4333,'E342325',1),(1654,'etiam mauris','etiam mauris',0,1,1.4,'E3562',1),(1655,'etiam mauris neque','etiam mauris neque',0,1,1.6,'E356252',1),(1656,'facilisis et','facilisi et',0,1,1.4,'F2423',9),(1657,'facilisis et luctus','facilisi et luctus',0,1,1.6333,'F24234232',1),(1658,'facilisis sapien','facilisi sapien',0,1,1.5333,'F24215',1),(1659,'facilisis sapien tincidunt','facilisi sapien tincidunt',0,1,1.8667,'F24215352353',1),(1660,'facilisis turpis','facilisi turpis',0,1,1.5333,'F2423612',1),(1661,'facilisis turpis vitae','facilisi turpis vitae',0,1,1.7333,'F242361213',1),(1662,'fermentum eget','fermentum eget',0,1,1.4667,'F653523',1),(1663,'fermentum eget facilisis','fermentum eget facilisis',0,1,1.8,'F6535231242',1),(1664,'fermentum justo','fermentum justo',0,1,1.5,'F653523',1),(1665,'fermentum justo ultricies','fermentum justo ultricies',0,1,1.8333,'F6535234362',1),(1666,'fringilla vehicula','fringilla vehicula',0,1,1.6,'F6524124',1),(1667,'fringilla vehicula scelerisque','fringilla vehicula scelerisque',0,1,2,'F65241242462',1),(1668,'fusce tincidunt','fusc tincidunt',0,1,1.5,'F2352353',1),(1669,'fusce tincidunt laoreet','fusc tincidunt laoreet',0,1,1.7667,'F2352353463',1),(1670,'hendrerit tempor','hendrerit tempor',0,1,1.5333,'H5363516',1),(1671,'hendrerit tempor magna','hendrerit tempor magna',0,1,1.7333,'H5363516525',1),(1672,'id arcu','id arcu',0,1,1.2333,'I362',2),(1673,'id arcu vivamus','id arcu vivamus',0,1,1.5,'I362152',1),(1674,'id elementum','id elementum',0,1,1.4,'I34535',1),(1675,'id elementum sit','id elementum sit',0,1,1.5333,'I3453523',1),(1676,'in interdum','in interdum',0,1,1.3667,'I53635',1),(1677,'in interdum id','in interdum id',0,1,1.4667,'I536353',1),(1678,'interdum id','interdum id',0,1,1.3667,'I536353',1),(1679,'interdum id elementum','interdum id elementum',0,1,1.7,'I5363534535',1),(1680,'ipsum elementum','ipsum elementum',0,1,1.5,'I1254535',1),(1681,'ipsum elementum enim','ipsum elementum enim',0,1,1.6667,'I1254535',1),(1682,'justo id','justo id',0,1,1.2667,'J300',1),(1683,'justo id arcu','justo id arcu',0,1,1.4333,'J362',1),(1684,'justo ipsum','justo ipsum',0,1,1.3667,'J3125',1),(1685,'justo ipsum elementum','justo ipsum elementum',0,1,1.7,'J31254535',1),(1686,'justo ultricies','justo ultricies',0,1,1.5,'J34362',1),(1687,'justo ultricies sit','justo ultricies sit',0,1,1.6333,'J343623',1),(1688,'laoreet viverra','laoreet viverra',0,1,1.5,'L6316',1),(1689,'laoreet viverra robert','laoreet viverra robert',0,1,1.7333,'L6316163',1),(1690,'leo mollis','leo mollis',0,1,1.3333,'L542',1),(1691,'leo mollis nibh','leo mollis nibh',0,1,1.5,'L54251',1),(1692,'leo nec','leo nec',0,1,1.2333,'L520',1),(1693,'leo nec purus','leo nec purus',0,1,1.4333,'L52162',1),(1694,'luctus non','luctu non',0,1,1.3333,'L2325',1),(1695,'luctus non arcu','luctu non arcu',0,1,1.5,'L232562',1),(1696,'magna ac','magna ac',0,1,1.2667,'M252',1),(1697,'magna ac fermentum','magna ac fermentum',0,1,1.6,'M25216535',1),(1698,'magna suspendisse','magna suspendisse',0,1,1.5667,'M2521532',1),(1699,'magna suspendisse potenti','magna suspendisse potenti',0,1,1.8333,'M25215321353',1),(1700,'magna vitae','magna vitae',0,1,1.3667,'M2513',1),(1701,'magna vitae consequat','magna vitae consequat',0,1,1.7,'M25132523',1),(1702,'massa erat','massa erat',0,1,1.3333,'M263',1),(1703,'massa erat ultrices','massa erat ultrices',0,1,1.6333,'M2634362',1),(1704,'mauris neque','mauri neque',0,1,1.4,'M6252',1),(1705,'mauris neque bibendum','mauri neque bibendum',0,1,1.7,'M62521535',1),(1706,'mi ac','mi ac',0,1,1.1667,'M200',1),(1707,'mi ac egestas','mi ac egestas',0,1,1.4333,'M232',1),(1708,'mollis nibh','molli nibh',0,1,1.3667,'M4251',1),(1709,'mollis nibh ut','molli nibh ut',0,1,1.4667,'M42513',1),(1710,'nec purus','nec purus',0,1,1.3,'N2162',1),(1711,'nec purus nullam','nec purus nullam',0,1,1.5333,'N2162545',1),(1712,'neque bibendum','nequ bibendum',0,1,1.4667,'N21535',1),(1713,'neque bibendum vitae','nequ bibendum vitae',0,1,1.6667,'N2153513',1),(1714,'nibh ut','nibh ut',0,1,1.2333,'N130',1),(1715,'nibh ut ultricies','nibh ut ultricies',0,1,1.5667,'N134362',1),(1716,'non ante','non ante',0,1,1.2667,'N300',1),(1717,'non ante fermentum','non ante fermentum',0,1,1.6,'N316535',1),(1718,'non arcu','non arcu',0,1,1.2667,'N620',1),(1719,'non arcu vestibulum','non arcu vestibulum',0,1,1.6333,'N62123145',1),(1720,'nullam massa','nullam massa',0,1,1.4,'N452',1),(1721,'nullam massa erat','nullam massa erat',0,1,1.5667,'N45263',1),(1722,'nunc justo','nunc justo',0,1,1.3333,'N230',1),(1723,'nunc justo id','nunc justo id',0,1,1.4333,'N230',1),(1724,'nunc pellentesque','nunc pellentesque',0,1,1.5667,'N214532',1),(1725,'nunc pellentesque porta','nunc pellentesque porta',0,1,1.7667,'N214532163',1),(1726,'odio sapien','odio sapien',0,1,1.3667,'O3215',1),(1727,'odio sapien sit','odio sapien sit',0,1,1.5,'O321523',1),(1728,'org','org',0,0,0.2,'O620',15),(1729,'ornare dignissim','ornar dignissim',0,1,1.5333,'O65632525',1),(1730,'ornare dignissim velit','ornar dignissim velit',0,1,1.7333,'O65632525143',1),(1731,'pellentesque porta','pellentesqu porta',0,1,1.6,'P4532163',1),(1732,'pellentesque porta mi','pellentesqu porta mi',0,1,1.7,'P45321635',1),(1733,'porta mi','porta mi',0,1,1.2667,'P635',1),(1734,'porta mi ac','porta mi ac',0,1,1.3667,'P6352',1),(1735,'potenti','potenti',0,0,0.4667,'P353',4),(1736,'potenti quisque','potenti quisque',0,1,1.5,'P3532',1),(1737,'potenti quisque convallis','potenti quisque convallis',0,1,1.8333,'P35325142',1),(1738,'praesent ultricies','praesent ultricies',0,1,1.6,'P62534362',1),(1739,'praesent ultricies sem','praesent ultricies sem',0,1,1.7333,'P625343625',1),(1740,'purus nullam','puru nullam',0,1,1.4,'P62545',1),(1741,'purus nullam massa','puru nullam massa',0,1,1.6,'P625452',1),(1742,'quam non','quam non',0,1,1.2667,'Q500',1),(1743,'quam non ante','quam non ante',0,1,1.4333,'Q530',1),(1744,'quis auctor','qui auctor',0,1,1.3667,'Q360',1),(1745,'quis auctor tempus','qui auctor tempus',0,1,1.6,'Q363512',1),(1746,'quisque convallis','quisqu convallis',0,1,1.5667,'Q5142',1),(1747,'quisque convallis quam','quisqu convallis quam',0,1,1.7333,'Q51425',1),(1748,'robert','robert',0,0,0.4,'R163',2),(1749,'robert smith','robert smith',0,1,1.4,'R163253',2),(1750,'robert smith demolink','robert smith demolink',0,1,1.7,'R1632535452',1),(1751,'sapien sit','sapien sit',0,1,1.3333,'S1523',1),(1752,'sapien sit amet','sapien sit amet',0,1,1.5,'S152353',1),(1753,'sapien tincidunt','sapien tincidunt',0,1,1.5333,'S15352353',1),(1754,'sapien tincidunt fusce','sapien tincidunt fusce',0,1,1.7333,'S1535235312',1),(1755,'scelerisque praesent','scelerisqu praesent',0,1,1.6667,'S46216253',1),(1756,'scelerisque praesent ultricies','scelerisqu praesent ultricies',0,1,2,'S462162534362',1),(1757,'sem quis','sem quis',0,1,1.2667,'S520',1),(1758,'sem quis auctor','sem quis auctor',0,1,1.5,'S5236',1),(1759,'sit amet etiam','sit amet etiam',0,1,1.4667,'S3535',1),(1760,'sit amet magna','sit amet magna',0,1,1.4667,'S353525',1),(1761,'sit amet nunc','sit amet nunc',0,1,1.4333,'S35352',1),(1762,'smith','smith',0,0,0.3333,'S530',2),(1763,'smith demolink','smith demolink',0,1,1.4667,'S535452',1),(1764,'smith demolink org','smith demolink org',0,1,1.6,'S53545262',1),(1765,'suspendisse facilisis','suspendiss facilisis',0,1,1.7,'S15321242',1),(1766,'suspendisse facilisis turpis','suspendiss facilisis turpis',0,1,1.9333,'S153212423612',1),(1767,'suspendisse potenti','suspendiss potenti',0,1,1.6333,'S15321353',4),(1768,'suspendisse potenti quisque','suspendiss potenti quisque',0,1,1.9,'S153213532',1),(1769,'tellus leo','tellu leo',0,1,1.3333,'T424',1),(1770,'tellus leo mollis','tellu leo mollis',0,1,1.5667,'T424542',1),(1771,'tempor','tempor',0,0,0.4,'T516',2),(1772,'tempor magna','tempor magna',0,1,1.4,'T516525',1),(1773,'tempor magna ac','tempor magna ac',0,1,1.5,'T5165252',1),(1774,'tempus justo','tempu justo',0,1,1.4,'T5123',1),(1775,'tempus justo ipsum','tempu justo ipsum',0,1,1.6,'T5123125',1),(1776,'testimonials','testimoni',0,0,0.8,'T23542',15),(1777,'tincidunt fusce','tincidunt fusce',0,1,1.5,'T5235312',1),(1778,'tincidunt fusce tincidunt','tincidunt fusce tincidunt',0,1,1.8333,'T5235312352353',1),(1779,'tincidunt laoreet','tincidunt laoreet',0,1,1.5667,'T52353463',1),(1780,'tincidunt laoreet viverra','tincidunt laoreet viverra',0,1,1.8333,'T5235346316',1),(1781,'turpis vitae','turpi vitae',0,1,1.4,'T61213',1),(1782,'turpis vitae ornare','turpi vitae ornare',0,1,1.6333,'T61213656',1),(1783,'ultrices in','ultric in',0,1,1.3667,'U43625',1),(1784,'ultrices in interdum','ultric in interdum',0,1,1.6667,'U436253635',1),(1785,'ultricies sem','ultrici sem',0,1,1.4333,'U43625',9),(1786,'ultricies sem quis','ultrici sem quis',0,1,1.6,'U436252',1),(1787,'ultricies sit','ultrici sit',0,1,1.4333,'U43623',1),(1788,'ultricies sit amet','ultrici sit amet',0,1,1.6,'U4362353',1),(1789,'ultricies velit','ultrici velit',0,1,1.5,'U4362143',1),(1790,'ultricies velit leo','ultrici velit leo',0,1,1.6333,'U43621434',1),(1791,'ut ultricies','ut ultricies',0,1,1.4,'U34362',1),(1792,'ut ultricies velit','ut ultricies velit',0,1,1.6,'U34362143',1),(1793,'vehicula scelerisque','vehicula scelerisque',0,1,1.6667,'V242462',1),(1794,'vehicula scelerisque praesent','vehicula scelerisque praesent',0,1,1.9667,'V24246216253',1),(1795,'velit diam','velit diam',0,1,1.3333,'V435',1),(1796,'velit diam dictum','velit diam dictum',0,1,1.5667,'V4353235',1),(1797,'velit leo','velit leo',0,1,1.3,'V434',1),(1798,'velit leo nec','velit leo nec',0,1,1.4333,'V43452',1),(1799,'vestibulum fringilla','vestibulum fringilla',0,1,1.6667,'V2314516524',1),(1800,'vestibulum fringilla vehicula','vestibulum fringilla vehicula',0,1,1.9667,'V2314516524124',1),(1801,'vitae consequat','vita consequat',0,1,1.5,'V32523',1),(1802,'vitae consequat nunc','vita consequat nunc',0,1,1.6667,'V3252352',1),(1803,'vitae facilisis','vita facilisis',0,1,1.5,'V31242',1),(1804,'vitae facilisis et','vita facilisis et',0,1,1.6,'V312423',1),(1805,'vitae ornare','vita ornare',0,1,1.4,'V3656',1),(1806,'vitae ornare dignissim','vita ornare dignissim',0,1,1.7333,'V365632525',1),(1807,'vivamus hendrerit','vivamu hendrerit',0,1,1.5667,'V525363',1),(1808,'vivamus hendrerit tempor','vivamu hendrerit tempor',0,1,1.8,'V525363516',1),(1809,'viverra robert','viverra robert',0,1,1.4667,'V6163',1),(1810,'viverra robert smith','viverra robert smith',0,1,1.6667,'V6163253',1),(1811,'26','26',0,0,0.2,'',2),(1812,'elizabeth','elizabeth',0,0,0.6,'E4213',3),(1813,'elizabeth green','elizabeth green',0,1,1.5,'E4213265',3),(1814,'green','green',0,0,0.3333,'G650',3),(1815,'23','23',0,0,0.2,'',6),(1816,'a varius','a varius',0,1,1.2667,'A162',1),(1817,'a varius nisl','a varius nisl',0,1,1.4333,'A162524',1),(1818,'ac augue','ac augue',0,1,1.2667,'A200',1),(1819,'ac augue venenatis','ac augue venenatis',0,1,1.6,'A21532',1),(1820,'ac lacus','ac lacus',0,1,1.2667,'A242',1),(1821,'ac lacus ac','ac lacus ac',0,1,1.3667,'A242',1),(1822,'ac lorem','ac lorem',0,1,1.2667,'A2465',11),(1823,'ac lorem lobortis','ac lorem lobortis',0,1,1.5667,'A246541632',1),(1824,'adipiscing nulla','adipisc nulla',0,1,1.5333,'A3125254',1),(1825,'adipiscing nulla pretium','adipisc nulla pretium',0,1,1.8,'A31252541635',1),(1826,'aliquam eget','aliquam eget',0,1,1.4,'A42523',1),(1827,'aliquam eget porta','aliquam eget porta',0,1,1.6,'A42523163',1),(1828,'arcu elizabeth','arcu elizabeth',0,1,1.4667,'A624213',1),(1829,'arcu elizabeth green','arcu elizabeth green',0,1,1.6667,'A624213265',1),(1830,'auctor magna','auctor magna',0,1,1.4,'A236525',1),(1831,'auctor magna suscipit','auctor magna suscipit',0,1,1.7,'A236525213',1),(1832,'augue venenatis','augu venenatis',0,1,1.5,'A21532',1),(1833,'augue venenatis eu','augu venenatis eu',0,1,1.6,'A21532',1),(1834,'bibendum quisque','bibendum quisque',0,1,1.5333,'B5352',1),(1835,'bibendum quisque magna','bibendum quisque magna',0,1,1.7333,'B5352525',1),(1836,'blandit nullam','blandit nullam',0,1,1.4667,'B453545',1),(1837,'blandit nullam vel','blandit nullam vel',0,1,1.6,'B45354514',1),(1838,'condimentum etiam','condimentum etiam',0,1,1.5667,'C5353535',1),(1839,'condimentum etiam ipsum','condimentum etiam ipsum',0,1,1.7667,'C5353535125',1),(1840,'condimentum pellentesque','condimentum pellentesque',0,1,1.8,'C5353514532',1),(1841,'condimentum pellentesque ipsum','condimentum pellentesque ipsum',0,1,2,'C5353514532125',1),(1842,'congue faucibus','congu faucibus',0,1,1.5,'C521212',1),(1843,'congue faucibus elementum','congu faucibus elementum',0,1,1.8333,'C5212124535',1),(1844,'consectetur nisi','consectetur nisi',0,1,1.5333,'C523652',1),(1845,'consectetur nisi in','consectetur nisi in',0,1,1.6333,'C5236525',1),(1846,'cubilia curae donec','cubilia curae donec',0,1,1.6333,'C1426352',1),(1847,'cum','cum',0,0,0.2,'C500',3),(1848,'cum sociis','cum sociis',0,1,1.3333,'C520',3),(1849,'cum sociis natoque','cum sociis natoque',0,1,1.6,'C52532',3),(1850,'curabitur ac','curabitur ac',0,1,1.4,'C61362',1),(1851,'curabitur ac lacus','curabitur ac lacus',0,1,1.6,'C6136242',1),(1852,'curae donec','cura donec',0,1,1.3667,'C6352',1),(1853,'curae donec condimentum','cura donec condimentum',0,1,1.7667,'C635253535',1),(1854,'dapibus vestibulum','dapibu vestibulum',0,1,1.6,'D12123145',1),(1855,'dapibus vestibulum ante','dapibu vestibulum ante',0,1,1.7667,'D121231453',1),(1856,'dis','di',0,0,0.2,'D200',3),(1857,'dis parturient','di parturient',0,1,1.4667,'D2163653',3),(1858,'dis parturient montes','di parturient montes',0,1,1.7,'D2163653532',3),(1859,'dolor id','dolor id',0,1,1.2667,'D463',1),(1860,'dolor id auctor','dolor id auctor',0,1,1.5,'D463236',1),(1861,'dolor nec','dolor nec',0,1,1.3,'D4652',1),(1862,'dolor nec est','dolor nec est',0,1,1.4333,'D46523',1),(1863,'donec condimentum','donec condimentum',0,1,1.5667,'D5253535',1),(1864,'donec condimentum pellentesque','donec condimentum pellentesque',0,1,2,'D525353514532',1),(1865,'donec in','donec in',0,1,1.2667,'D525',1),(1866,'donec in nisi','donec in nisi',0,1,1.4333,'D5252',1),(1867,'duis faucibus','dui faucibus',0,1,1.4333,'D21212',1),(1868,'duis faucibus dolor','dui faucibus dolor',0,1,1.6333,'D21212346',1),(1869,'eget facilisis non','eget facilisis non',0,1,1.6,'E2312425',1),(1870,'eget porta','eget porta',0,1,1.3333,'E23163',2),(1871,'eget porta non','eget porta non',0,1,1.4667,'E231635',1),(1872,'elementum nec','elementum nec',0,1,1.4333,'E45352',1),(1873,'elementum nec turpis','elementum nec turpis',0,1,1.6667,'E453523612',1),(1874,'elizabeth green demolink','elizabeth green demolink',0,1,1.8,'E421326535452',1),(1875,'erat dapibus','erat dapibus',0,1,1.4,'E6312',1),(1876,'erat dapibus vestibulum','erat dapibus vestibulum',0,1,1.7667,'E6312123145',1),(1877,'eros fringilla','ero fringilla',0,1,1.4667,'E6216524',1),(1878,'eros fringilla quis','ero fringilla quis',0,1,1.6333,'E62165242',1),(1879,'est in','est in',0,1,1.2,'E235',1),(1880,'est in pulvinar','est in pulvinar',0,1,1.5,'E23514156',1),(1881,'est rutrum','est rutrum',0,1,1.3333,'E236365',1),(1882,'est rutrum a','est rutrum a',0,1,1.4,'E236365',1),(1883,'est vulputate','est vulputate',0,1,1.4333,'E231413',1),(1884,'est vulputate eget','est vulputate eget',0,1,1.6,'E23141323',1),(1885,'et magnis','et magnis',0,1,1.3,'E35252',3),(1886,'et magnis dis','et magnis dis',0,1,1.4333,'E3525232',3),(1887,'et turpis','et turpis',0,1,1.3,'E3612',1),(1888,'et turpis sed','et turpis sed',0,1,1.4333,'E36123',1),(1889,'etiam ipsum','etiam ipsum',0,1,1.3667,'E35125',1),(1890,'etiam ipsum est','etiam ipsum est',0,1,1.5,'E3512523',1),(1891,'eu rhoncus','eu rhoncus',0,1,1.3333,'E652',1),(1892,'eu rhoncus erat','eu rhoncus erat',0,1,1.5,'E65263',1),(1893,'facilisis non','facilisi non',0,1,1.4333,'F2425',1),(1894,'facilisis non scelerisque','facilisi non scelerisque',0,1,1.8333,'F24252462',1),(1895,'facilisis quis','facilisi quis',0,1,1.4667,'F242',1),(1896,'facilisis quis congue','facilisi quis congue',0,1,1.7,'F24252',1),(1897,'faucibus dolor','faucibu dolor',0,1,1.4667,'F212346',1),(1898,'faucibus dolor nec','faucibu dolor nec',0,1,1.6,'F21234652',1),(1899,'faucibus elementum','faucibu elementum',0,1,1.6,'F2124535',1),(1900,'faucibus elementum nec','faucibu elementum nec',0,1,1.7333,'F21245352',1),(1901,'feugiat bibendum','feugiat bibendum',0,1,1.5333,'F231535',1),(1902,'feugiat bibendum quisque','feugiat bibendum quisque',0,1,1.8,'F2315352',1),(1903,'fringilla quis','fringilla quis',0,1,1.4667,'F65242',1),(1904,'fringilla quis aliquam','fringilla quis aliquam',0,1,1.7333,'F65242425',1),(1905,'green demolink','green demolink',0,1,1.4667,'G6535452',1),(1906,'green demolink org','green demolink org',0,1,1.6,'G653545262',1),(1907,'id arcu elizabeth','id arcu elizabeth',0,1,1.5667,'I3624213',1),(1908,'id auctor','id auctor',0,1,1.3,'I3236',1),(1909,'id auctor magna','id auctor magna',0,1,1.5,'I3236525',1),(1910,'in condimentum','in condimentum',0,1,1.4667,'I5253535',1),(1911,'in condimentum etiam','in condimentum etiam',0,1,1.6667,'I525353535',1),(1912,'in nisi','in nisi',0,1,1.2333,'I520',1),(1913,'in nisi est','in nisi est',0,1,1.3667,'I523',1),(1914,'in pulvinar','in pulvinar',0,1,1.3667,'I514156',1),(1915,'in pulvinar consectetur','in pulvinar consectetur',0,1,1.7667,'I51415625236',1),(1916,'in tristique','in tristique',0,1,1.4,'I536232',1),(1917,'in tristique risus','in tristique risus',0,1,1.6,'I53623262',1),(1918,'ipsum est','ipsum est',0,1,1.3,'I12523',1),(1919,'ipsum est vulputate','ipsum est vulputate',0,1,1.6333,'I125231413',1),(1920,'ipsum nec','ipsum nec',0,1,1.3,'I1252',1),(1921,'ipsum nec ornare','ipsum nec ornare',0,1,1.5333,'I1252656',1),(1922,'lacus ac','lacu ac',0,1,1.2667,'L200',1),(1923,'lacus ac lorem','lacu ac lorem',0,1,1.4667,'L2465',1),(1924,'libero facilisis','libero facilisis',0,1,1.5333,'L161242',1),(1925,'libero facilisis quis','libero facilisis quis',0,1,1.7,'L161242',1),(1926,'lobortis blandit','loborti blandit',0,1,1.5333,'L16321453',1),(1927,'lobortis blandit nullam','loborti blandit nullam',0,1,1.7667,'L16321453545',1),(1928,'lorem lobortis','lorem lobortis',0,1,1.4667,'L6541632',1),(1929,'lorem lobortis blandit','lorem lobortis blandit',0,1,1.7333,'L65416321453',1),(1930,'magna libero','magna libero',0,1,1.4,'M25416',1),(1931,'magna libero facilisis','magna libero facilisis',0,1,1.7333,'M254161242',1),(1932,'magna suscipit','magna suscipit',0,1,1.4667,'M25213',1),(1933,'magna suscipit tincidunt','magna suscipit tincidunt',0,1,1.8,'M2521352353',1),(1934,'magnis','magni',0,0,0.4,'M252',3),(1935,'magnis dis','magni dis',0,1,1.3333,'M25232',3),(1936,'magnis dis parturient','magni dis parturient',0,1,1.7,'M25232163653',3),(1937,'mauris nulla','mauri nulla',0,1,1.4,'M6254',1),(1938,'mauris nulla in','mauri nulla in',0,1,1.5,'M62545',1),(1939,'mi curabitur','mi curabitur',0,1,1.4,'M26136',1),(1940,'mi curabitur ac','mi curabitur ac',0,1,1.5,'M261362',1),(1941,'montes','mont',0,0,0.4,'M320',3),(1942,'montes nascetur','mont nascetur',0,1,1.5,'M325236',3),(1943,'montes nascetur ridiculus','mont nascetur ridiculus',0,1,1.8333,'M3252363242',3),(1944,'mus','mu',0,0,0.2,'M200',3),(1945,'mus phasellus','mu phasellus',0,1,1.4333,'M21242',1),(1946,'mus phasellus et','mu phasellus et',0,1,1.5333,'M212423',1),(1947,'nascetur','nascetur',0,0,0.5333,'N236',3),(1948,'nascetur ridiculus','nascetur ridiculus',0,1,1.6,'N2363242',3),(1949,'nascetur ridiculus mus','nascetur ridiculus mus',0,1,1.7333,'N236324252',3),(1950,'natoque','natoqu',0,0,0.4667,'N320',3),(1951,'natoque penatibus','natoqu penatibus',0,1,1.5667,'N3215312',3),(1952,'natoque penatibus et','natoqu penatibus et',0,1,1.6667,'N32153123',3),(1953,'nec est','nec est',0,1,1.2333,'N230',1),(1954,'nec est rutrum','nec est rutrum',0,1,1.4667,'N236365',1),(1955,'nec ornare','nec ornare',0,1,1.3333,'N2656',1),(1956,'nec ornare donec','nec ornare donec',0,1,1.5333,'N2656352',1),(1957,'nec turpis','nec turpis',0,1,1.3333,'N23612',1),(1958,'nec turpis nullam','nec turpis nullam',0,1,1.5667,'N23612545',1),(1959,'nisi est','nisi est',0,1,1.2667,'N230',1),(1960,'nisi est in','nisi est in',0,1,1.3667,'N235',1),(1961,'nisi in','nisi in',0,1,1.2333,'N250',1),(1962,'nisi in condimentum','nisi in condimentum',0,1,1.6333,'N25253535',1),(1963,'nisl adipiscing','nisl adipiscing',0,1,1.5,'N2431252',1),(1964,'nisl adipiscing nulla','nisl adipiscing nulla',0,1,1.7,'N243125254',1),(1965,'non mi','non mi',0,1,1.2,'N000',1),(1966,'non mi curabitur','non mi curabitur',0,1,1.5333,'N26136',1),(1967,'non scelerisque','non scelerisque',0,1,1.5,'N2462',1),(1968,'non scelerisque id','non scelerisque id',0,1,1.6,'N24623',1),(1969,'nulla ac','nulla ac',0,1,1.2667,'N420',1),(1970,'nulla ac augue','nulla ac augue',0,1,1.4667,'N420',1),(1971,'nulla in','nulla in',0,1,1.2667,'N450',1),(1972,'nulla in tristique','nulla in tristique',0,1,1.6,'N4536232',1),(1973,'nulla pretium','nulla pretium',0,1,1.4333,'N41635',1),(1974,'nulla pretium nulla','nulla pretium nulla',0,1,1.6333,'N416354',1),(1975,'nulla sollicitudin','nulla sollicitudin',0,1,1.6,'N424235',1),(1976,'nulla sollicitudin ornare','nulla sollicitudin ornare',0,1,1.8333,'N424235656',1),(1977,'nullam tortor','nullam tortor',0,1,1.4333,'N453636',1),(1978,'nullam tortor eros','nullam tortor eros',0,1,1.6,'N4536362',1),(1979,'nullam vel','nullam vel',0,1,1.3333,'N4514',1),(1980,'nullam vel mauris','nullam vel mauris',0,1,1.5667,'N4514562',1),(1981,'nunc sed','nunc sed',0,1,1.2667,'N230',1),(1982,'nunc sed rutrum','nunc sed rutrum',0,1,1.5,'N236365',1),(1983,'orci duis faucibus','orci duis faucibus',0,1,1.6,'O62321212',1),(1984,'ornare dolor','ornar dolor',0,1,1.4,'O656346',1),(1985,'ornare dolor id','ornar dolor id',0,1,1.5,'O6563463',1),(1986,'ornare donec','ornar donec',0,1,1.4,'O656352',1),(1987,'ornare donec in','ornar donec in',0,1,1.5,'O6563525',1),(1988,'parturient','parturi',0,0,0.6667,'P63653',3),(1989,'parturient montes','parturi montes',0,1,1.5667,'P63653532',3),(1990,'parturient montes nascetur','parturi montes nascetur',0,1,1.8667,'P636535325236',3),(1991,'pellentesque ipsum','pellentesqu ipsum',0,1,1.6,'P4532125',1),(1992,'pellentesque ipsum nec','pellentesqu ipsum nec',0,1,1.7333,'P45321252',1),(1993,'penatibus','penatibu',0,0,0.6,'P5312',3),(1994,'penatibus et','penatibu et',0,1,1.4,'P53123',3),(1995,'penatibus et magnis','penatibu et magnis',0,1,1.6333,'P531235252',3),(1996,'phasellus et','phasellu et',0,1,1.4,'P2423',1),(1997,'phasellus et turpis','phasellu et turpis',0,1,1.6333,'P2423612',1),(1998,'porta non','porta non',0,1,1.3,'P635',1),(1999,'porta non mi','porta non mi',0,1,1.4,'P635',1),(2000,'portfolio 10','portfolio 10',0,1,1.4,'P6314',2),(2001,'pretium nulla','pretium nulla',0,1,1.4333,'P6354',1),(2002,'pretium nulla ac','pretium nulla ac',0,1,1.5333,'P63542',1),(2003,'pulvinar consectetur','pulvinar consectetur',0,1,1.6667,'P415625236',1),(2004,'pulvinar consectetur nisi','pulvinar consectetur nisi',0,1,1.8333,'P41562523652',1),(2005,'quis aliquam','qui aliquam',0,1,1.4,'Q425',1),(2006,'quis aliquam eget','qui aliquam eget',0,1,1.5667,'Q42523',1),(2007,'quis congue','qui congue',0,1,1.3667,'Q520',1),(2008,'quis congue faucibus','qui congue faucibus',0,1,1.6667,'Q521212',1),(2009,'quisque magna','quisqu magna',0,1,1.4333,'Q525',1),(2010,'quisque magna libero','quisqu magna libero',0,1,1.6667,'Q525416',1),(2011,'rhoncus erat','rhoncu erat',0,1,1.4,'R5263',1),(2012,'rhoncus erat dapibus','rhoncu erat dapibus',0,1,1.6667,'R526312',1),(2013,'ridiculus','ridiculu',0,0,0.6,'R3242',3),(2014,'ridiculus mus','ridiculu mus',0,1,1.4333,'R324252',3),(2015,'ridiculus mus phasellus','ridiculu mus phasellus',0,1,1.7667,'R3242521242',1),(2016,'risus nunc','risu nunc',0,1,1.3333,'R252',1),(2017,'risus nunc sed','risu nunc sed',0,1,1.4667,'R2523',1),(2018,'rutrum a','rutrum a',0,1,1.2667,'R365',1),(2019,'rutrum a varius','rutrum a varius',0,1,1.5,'R365162',1),(2020,'rutrum orci','rutrum orci',0,1,1.3667,'R36562',1),(2021,'rutrum orci duis','rutrum orci duis',0,1,1.5333,'R3656232',1),(2022,'scelerisque id','scelerisqu id',0,1,1.4667,'S4623',1),(2023,'scelerisque id arcu','scelerisqu id arcu',0,1,1.6333,'S462362',1),(2024,'sed rutrum','sed rutrum',0,1,1.3333,'S36365',1),(2025,'sed rutrum orci','sed rutrum orci',0,1,1.5,'S3636562',1),(2026,'sed urna feugiat','sed urna feugiat',0,1,1.5333,'S365123',1),(2027,'sociis','socii',0,0,0.4,'S000',3),(2028,'sociis natoque','socii natoque',0,1,1.4667,'S532',3),(2029,'sociis natoque penatibus','socii natoque penatibus',0,1,1.8,'S53215312',3),(2030,'sollicitudin ornare dolor','sollicitudin ornare dolor',0,1,1.8333,'S4235656346',1),(2031,'suscipit tincidunt','suscipit tincidunt',0,1,1.6,'S1352353',1),(2032,'suscipit tincidunt cum','suscipit tincidunt cum',0,1,1.7333,'S135235325',1),(2033,'tincidunt cum','tincidunt cum',0,1,1.4333,'T5235325',1),(2034,'tincidunt cum sociis','tincidunt cum sociis',0,1,1.6667,'T52353252',1),(2035,'tortor eros','tortor eros',0,1,1.3667,'T6362',1),(2036,'tortor eros fringilla','tortor eros fringilla',0,1,1.7,'T636216524',1),(2037,'tristique','tristiqu',0,0,0.6,'T6232',12),(2038,'tristique risus','tristiqu risus',0,1,1.5,'T623262',1),(2039,'tristique risus nunc','tristiqu risus nunc',0,1,1.6667,'T62326252',1),(2040,'turpis nullam','turpi nullam',0,1,1.4333,'T612545',1),(2041,'turpis nullam tortor','turpi nullam tortor',0,1,1.6667,'T6125453636',1),(2042,'turpis sed','turpi sed',0,1,1.3333,'T6123',1),(2043,'turpis sed urna','turpi sed urna',0,1,1.5,'T612365',1),(2044,'urna feugiat','urna feugiat',0,1,1.4,'U65123',1),(2045,'urna feugiat bibendum','urna feugiat bibendum',0,1,1.7,'U651231535',1),(2046,'varius nisl','variu nisl',0,1,1.3667,'V62524',1),(2047,'varius nisl adipiscing','variu nisl adipiscing',0,1,1.7333,'V6252431252',1),(2048,'vel mauris','vel mauris',0,1,1.3333,'V4562',1),(2049,'vel mauris nulla','vel mauris nulla',0,1,1.5333,'V456254',1),(2050,'venenatis eu','venenati eu',0,1,1.4,'V532',1),(2051,'venenatis eu rhoncus','venenati eu rhoncus',0,1,1.6667,'V532652',1),(2052,'vulputate eget facilisis','vulput eget facilisis',0,1,1.8,'V413231242',1),(2053,'27','27',0,0,0.2,'',3),(2054,'a rutrum','a rutrum',0,1,1.2667,'A6365',2),(2055,'a rutrum magna','a rutrum magna',0,1,1.4667,'A636525',2),(2056,'accumsan a','accumsan a',0,1,1.3333,'A2525',2),(2057,'accumsan a rutrum','accumsan a rutrum',0,1,1.5667,'A25256365',2),(2058,'adipiscing elit integer','adipisc elit integer',0,1,1.7667,'A31252435326',2),(2059,'aliquam in','aliquam in',0,1,1.3333,'A425',2),(2060,'aliquam in blandit','aliquam in blandit',0,1,1.6,'A4251453',2),(2061,'at ipsum','at ipsum',0,1,1.2667,'A3125',2),(2062,'at ipsum nibh','at ipsum nibh',0,1,1.4333,'A31251',2),(2063,'at lacus','at lacus',0,1,1.2667,'A342',2),(2064,'at lacus integer','at lacus integer',0,1,1.5333,'A3425326',2),(2065,'at libero','at libero',0,1,1.3,'A3416',2),(2066,'at libero suspendisse','at libero suspendisse',0,1,1.7,'A341621532',2),(2067,'at rhoncus','at rhoncus',0,1,1.3333,'A3652',2),(2068,'at rhoncus nulla','at rhoncus nulla',0,1,1.5333,'A365254',2),(2069,'augue mollis','augu mollis',0,1,1.4,'A2542',2),(2070,'augue mollis semper','augu mollis semper',0,1,1.6333,'A2542516',2),(2071,'blandit in','blandit in',0,1,1.3333,'B4535',3),(2072,'blandit in vehicula','blandit in vehicula',0,1,1.6333,'B4535124',2),(2073,'campbell','campbel',0,0,0.5333,'C514',3),(2074,'campbell demolink','campbel demolink',0,1,1.5667,'C51435452',2),(2075,'campbell demolink org','campbel demolink org',0,1,1.7,'C5143545262',2),(2076,'condimentum faucibus','condimentum faucibus',0,1,1.6667,'C535351212',2),(2077,'condimentum faucibus ligula','condimentum faucibus ligula',0,1,1.9,'C535351212424',2),(2078,'condimentum ligula','condimentum ligula',0,1,1.6,'C53535424',2),(2079,'condimentum ligula id','condimentum ligula id',0,1,1.7,'C535354243',2),(2080,'consectetur duis','consectetur duis',0,1,1.5333,'C523632',2),(2081,'consectetur duis vel','consectetur duis vel',0,1,1.6667,'C52363214',2),(2082,'consequat lorem','consequat lorem',0,1,1.5,'C523465',2),(2083,'consequat lorem ipsum','consequat lorem ipsum',0,1,1.7,'C523465125',2),(2084,'convallis suspendisse','conval suspendisse',0,1,1.7,'C51421532',2),(2085,'convallis suspendisse potenti','conval suspendisse potenti',0,1,1.9667,'C514215321353',2),(2086,'curabitur rutrum','curabitur rutrum',0,1,1.5333,'C6136365',2),(2087,'curabitur rutrum velit','curabitur rutrum velit',0,1,1.7333,'C6136365143',2),(2088,'cursus vulputate','cursu vulputate',0,1,1.5333,'C621413',2),(2089,'cursus vulputate mauris','cursu vulputate mauris',0,1,1.7667,'C621413562',2),(2090,'dictum non','dictum non',0,1,1.3333,'D235',10),(2091,'dictum non pellentesque','dictum non pellentesque',0,1,1.7667,'D23514532',2),(2092,'dignissim vestibulum','dignissim vestibulum',0,1,1.6667,'D2525123145',2),(2093,'dignissim vestibulum at','dignissim vestibulum at',0,1,1.7667,'D25251231453',2),(2094,'duis vel','dui vel',0,1,1.2667,'D214',2),(2095,'duis vel magna','dui vel magna',0,1,1.4667,'D214525',2),(2096,'eget tincidunt urna','eget tincidunt urna',0,1,1.6333,'E235235365',2),(2097,'elementum quis','elementum quis',0,1,1.4667,'E45352',2),(2098,'elementum quis phasellus','elementum quis phasellus',0,1,1.8,'E453521242',2),(2099,'elit integer','elit integer',0,1,1.4,'E435326',2),(2100,'elit integer sollicitudin','elit integer sollicitudin',0,1,1.8333,'E43532624235',2),(2101,'eros molestie','ero molestie',0,1,1.4333,'E625423',2),(2102,'eros molestie id','ero molestie id',0,1,1.5333,'E625423',2),(2103,'est ligula','est ligula',0,1,1.3333,'E23424',2),(2104,'est ligula aliquam','est ligula aliquam',0,1,1.6,'E2342425',2),(2105,'eu mi','eu mi',0,1,1.1667,'E500',2),(2106,'eu mi maecenas','eu mi maecenas',0,1,1.4667,'E5252',2),(2107,'eu nibh','eu nibh',0,1,1.2333,'E510',2),(2108,'eu nibh lacus','eu nibh lacus',0,1,1.4333,'E5142',2),(2109,'facilisis malesuada','facilisi malesuada',0,1,1.6333,'F2425423',2),(2110,'facilisis malesuada tincidunt','facilisi malesuada tincidunt',0,1,1.9667,'F242542352353',2),(2111,'faucibus ligula','faucibu ligula',0,1,1.5,'F212424',2),(2112,'faucibus ligula sed','faucibu ligula sed',0,1,1.6333,'F21242423',2),(2113,'feugiat odio','feugiat odio',0,1,1.4,'F230',2),(2114,'feugiat odio cursus','feugiat odio cursus',0,1,1.6333,'F23262',2),(2115,'hendrerit non','hendrerit non',0,1,1.4333,'H53635',2),(2116,'hendrerit non semper','hendrerit non semper',0,1,1.6667,'H536352516',2),(2117,'id augue','id augue',0,1,1.2667,'I320',2),(2118,'id augue mollis','id augue mollis',0,1,1.5,'I32542',2),(2119,'id consequat','id consequat',0,1,1.4,'I32523',2),(2120,'id consequat lorem','id consequat lorem',0,1,1.6,'I32523465',2),(2121,'id facilisis','id facilisis',0,1,1.4,'I31242',2),(2122,'id facilisis malesuada','id facilisis malesuada',0,1,1.7333,'I312425423',2),(2123,'id risus','id risus',0,1,1.2667,'I362',2),(2124,'id risus accumsan','id risus accumsan',0,1,1.5667,'I362525',2),(2125,'in blandit','in blandit',0,1,1.3333,'I51453',2),(2126,'in blandit in','in blandit in',0,1,1.4333,'I514535',2),(2127,'in vehicula','in vehicula',0,1,1.3667,'I5124',2),(2128,'in vehicula at','in vehicula at',0,1,1.4667,'I51243',2),(2129,'integer eu','integ eu',0,1,1.3333,'I5326',2),(2130,'integer eu nibh','integ eu nibh',0,1,1.5,'I532651',2),(2131,'integer sollicitudin','integ sollicitudin',0,1,1.6667,'I532624235',2),(2132,'integer sollicitudin mi','integ sollicitudin mi',0,1,1.7667,'I532624235',2),(2133,'ipsum nibh','ipsum nibh',0,1,1.3333,'I1251',2),(2134,'ipsum nibh pellentesque','ipsum nibh pellentesque',0,1,1.7667,'I12514532',2),(2135,'jeff','jeff',0,0,0.2667,'J100',3),(2136,'jeff campbell','jeff campbell',0,1,1.4333,'J12514',3),(2137,'jeff campbell demolink','jeff campbell demolink',0,1,1.7333,'J1251435452',2),(2138,'lacinia quis','lacinia quis',0,1,1.4,'L252',2),(2139,'lacinia quis dictum','lacinia quis dictum',0,1,1.6333,'L2523235',2),(2140,'lacus integer','lacu integer',0,1,1.4333,'L25326',2),(2141,'lacus integer eu','lacu integer eu',0,1,1.5333,'L25326',2),(2142,'lacus vestibulum','lacu vestibulum',0,1,1.5333,'L2123145',2),(2143,'lacus vestibulum tincidunt','lacu vestibulum tincidunt',0,1,1.8667,'L2123145352353',2),(2144,'laoreet suspendisse','laoreet suspendisse',0,1,1.6333,'L6321532',2),(2145,'laoreet suspendisse potenti','laoreet suspendisse potenti',0,1,1.9,'L63215321353',2),(2146,'libero suspendisse','libero suspendisse',0,1,1.6,'L1621532',2),(2147,'libero suspendisse velit','libero suspendisse velit',0,1,1.8,'L1621532143',2),(2148,'ligula aliquam','ligula aliquam',0,1,1.4667,'L2425',2),(2149,'ligula aliquam in','ligula aliquam in',0,1,1.5667,'L2425',2),(2150,'ligula id','ligula id',0,1,1.3,'L243',2),(2151,'ligula id consequat','ligula id consequat',0,1,1.6333,'L2432523',2),(2152,'ligula sed','ligula sed',0,1,1.3333,'L2423',2),(2153,'ligula sed consectetur','ligula sed consectetur',0,1,1.7333,'L242325236',2),(2154,'luctus nulla','luctu nulla',0,1,1.4,'L23254',2),(2155,'luctus nulla vitae','luctu nulla vitae',0,1,1.6,'L2325413',2),(2156,'maecenas velit','maecena velit',0,1,1.4667,'M252143',2),(2157,'maecenas velit eros','maecena velit eros',0,1,1.6333,'M25214362',2),(2158,'magna laoreet','magna laoreet',0,1,1.4333,'M25463',2),(2159,'magna laoreet suspendisse','magna laoreet suspendisse',0,1,1.8333,'M2546321532',2),(2160,'magna nisi','magna nisi',0,1,1.3333,'M252',2),(2161,'magna nisi at','magna nisi at',0,1,1.4333,'M2523',2),(2162,'malesuada tincidunt','malesuada tincidunt',0,1,1.6333,'M42352353',2),(2163,'malesuada tincidunt at','malesuada tincidunt at',0,1,1.7333,'M42352353',2),(2164,'mauris elementum','mauri elementum',0,1,1.5333,'M624535',2),(2165,'mauris elementum quis','mauri elementum quis',0,1,1.7,'M6245352',2),(2166,'mi hendrerit','mi hendrerit',0,1,1.4,'M363',2),(2167,'mi hendrerit non','mi hendrerit non',0,1,1.5333,'M3635',2),(2168,'mi maecenas','mi maecenas',0,1,1.3667,'M252',2),(2169,'mi maecenas velit','mi maecenas velit',0,1,1.5667,'M252143',2),(2170,'mi nec','mi nec',0,1,1.2,'M200',2),(2171,'mi nec mi','mi nec mi',0,1,1.3,'M250',2),(2172,'molestie id','molesti id',0,1,1.3667,'M423',2),(2173,'molestie id facilisis','molesti id facilisis',0,1,1.7,'M4231242',2),(2174,'mollis semper','molli semper',0,1,1.4333,'M42516',2),(2175,'mollis semper sed','molli semper sed',0,1,1.5667,'M4251623',2),(2176,'nec mi','nec mi',0,1,1.2,'N250',2),(2177,'nec mi hendrerit','nec mi hendrerit',0,1,1.5333,'N25363',2),(2178,'nibh lacus','nibh lacus',0,1,1.3333,'N142',2),(2179,'nibh lacus vestibulum','nibh lacus vestibulum',0,1,1.7,'N142123145',2),(2180,'nibh pellentesque condimentum','nibh pellentesque condimentum',0,1,1.9667,'N1453253535',2),(2181,'nisi at','nisi at',0,1,1.2333,'N230',2),(2182,'nisi at rhoncus','nisi at rhoncus',0,1,1.5,'N23652',2),(2183,'non pellentesque','non pellentesque',0,1,1.5333,'N14532',2),(2184,'non pellentesque eu','non pellentesque eu',0,1,1.6333,'N14532',2),(2185,'non semper','non semper',0,1,1.3333,'N2516',2),(2186,'non semper orci','non semper orci',0,1,1.5,'N25162',2),(2187,'nulla est','nulla est',0,1,1.3,'N423',2),(2188,'nulla est ligula','nulla est ligula',0,1,1.5333,'N423424',2),(2189,'nulla nulla','nulla nulla',0,1,1.3667,'N454',2),(2190,'nulla nulla est','nulla nulla est',0,1,1.5,'N45423',2),(2191,'nulla vitae','nulla vitae',0,1,1.3667,'N413',2),(2192,'nulla vitae odio','nulla vitae odio',0,1,1.5333,'N413',2),(2193,'nunc id','nunc id',0,1,1.2333,'N230',2),(2194,'nunc id augue','nunc id augue',0,1,1.4333,'N232',2),(2195,'odio cursus','odio cursus',0,1,1.3667,'O3262',3),(2196,'odio cursus vulputate','odio cursus vulputate',0,1,1.7,'O32621413',2),(2197,'odio venenatis','odio venenatis',0,1,1.4667,'O31532',2),(2198,'odio venenatis eget','odio venenatis eget',0,1,1.6333,'O315323',2),(2199,'orci convallis','orci convallis',0,1,1.4667,'O625142',2),(2200,'orci convallis suspendisse','orci convallis suspendisse',0,1,1.8667,'O6251421532',2),(2201,'pellentesque condimentum','pellentesqu condimentum',0,1,1.8,'P453253535',2),(2202,'pellentesque condimentum faucibus','pellentesqu condimentum faucibus',0,1,2,'P4532535351212',2),(2203,'pellentesque eu','pellentesqu eu',0,1,1.5,'P4532',2),(2204,'pellentesque eu mi','pellentesqu eu mi',0,1,1.6,'P45325',2),(2205,'pellentesque porttitor','pellentesqu porttitor',0,1,1.7333,'P45321636',2),(2206,'pellentesque porttitor curabitur','pellentesqu porttitor curabitur',0,1,2,'P4532163626136',2),(2207,'pharetra nunc','pharetra nunc',0,1,1.4333,'P63652',2),(2208,'pharetra nunc id','pharetra nunc id',0,1,1.5333,'P636523',2),(2209,'phasellus suscipit','phasellu suscipit',0,1,1.6,'P24213',2),(2210,'phasellus suscipit condimentum','phasellu suscipit condimentum',0,1,2,'P24213253535',2),(2211,'porttitor','porttitor',0,0,0.6,'P636',4),(2212,'porttitor curabitur','porttitor curabitur',0,1,1.6333,'P63626136',2),(2213,'porttitor curabitur rutrum','porttitor curabitur rutrum',0,1,1.8667,'P63626136365',2),(2214,'potenti jeff','potenti jeff',0,1,1.4,'P35321',2),(2215,'potenti jeff campbell','potenti jeff campbell',0,1,1.7,'P353212514',2),(2216,'potenti ut','potenti ut',0,1,1.3333,'P353',2),(2217,'potenti ut pharetra','potenti ut pharetra',0,1,1.6333,'P3531636',2),(2218,'quis dictum','qui dictum',0,1,1.3667,'Q3235',2),(2219,'quis dictum non','qui dictum non',0,1,1.5,'Q3235',2),(2220,'quis phasellus','qui phasellus',0,1,1.4667,'Q1242',2),(2221,'quis phasellus suscipit','qui phasellus suscipit',0,1,1.7667,'Q124213',2),(2222,'rhoncus nulla','rhoncu nulla',0,1,1.4333,'R5254',2),(2223,'rhoncus nulla nulla','rhoncu nulla nulla',0,1,1.6333,'R525454',2),(2224,'risus accumsan','risu accumsan',0,1,1.4667,'R2525',2),(2225,'risus accumsan a','risu accumsan a',0,1,1.5333,'R2525',2),(2226,'rutrum magna laoreet','rutrum magna laoreet',0,1,1.6667,'R36525463',2),(2227,'rutrum velit','rutrum velit',0,1,1.4,'R365143',2),(2228,'rutrum velit id','rutrum velit id',0,1,1.5,'R365143',2),(2229,'sed consectetur','sed consectetur',0,1,1.5,'S325236',10),(2230,'sed consectetur duis','sed consectetur duis',0,1,1.6667,'S32523632',2),(2231,'sed luctus','sed luctus',0,1,1.3333,'S34232',2),(2232,'sed luctus nulla','sed luctus nulla',0,1,1.5333,'S3423254',2),(2233,'sed sollicitudin','sed sollicitudin',0,1,1.5333,'S324235',2),(2234,'sed sollicitudin feugiat','sed sollicitudin feugiat',0,1,1.8,'S324235123',2),(2235,'semper orci','semper orci',0,1,1.3667,'S5162',2),(2236,'semper orci convallis','semper orci convallis',0,1,1.7,'S51625142',2),(2237,'semper sed','semper sed',0,1,1.3333,'S51623',2),(2238,'semper sed luctus','semper sed luctus',0,1,1.5667,'S516234232',2),(2239,'sollicitudin feugiat','sollicitudin feugiat',0,1,1.6667,'S4235123',2),(2240,'sollicitudin feugiat odio','sollicitudin feugiat odio',0,1,1.8333,'S4235123',2),(2241,'sollicitudin mi','sollicitudin mi',0,1,1.5,'S4235',2),(2242,'sollicitudin mi nec','sollicitudin mi nec',0,1,1.6333,'S42352',2),(2243,'suscipit condimentum','suscipit condimentum',0,1,1.6667,'S13253535',2),(2244,'suscipit condimentum ligula','suscipit condimentum ligula',0,1,1.9,'S13253535424',2),(2245,'suspendisse potenti jeff','suspendiss potenti jeff',0,1,1.8,'S1532135321',2),(2246,'suspendisse potenti ut','suspendiss potenti ut',0,1,1.7333,'S15321353',2),(2247,'suspendisse velit','suspendiss velit',0,1,1.5667,'S1532143',2),(2248,'suspendisse velit tellus','suspendiss velit tellus',0,1,1.8,'S153214342',2),(2249,'tellus lacinia','tellu lacinia',0,1,1.4667,'T42425',2),(2250,'tellus lacinia quis','tellu lacinia quis',0,1,1.6333,'T424252',2),(2251,'tincidunt at','tincidunt at',0,1,1.4,'T52353',2),(2252,'tincidunt at lacus','tincidunt at lacus',0,1,1.6,'T5235342',2),(2253,'tincidunt pellentesque','tincidunt pellentesque',0,1,1.7333,'T5235314532',2),(2254,'tincidunt pellentesque porttitor','tincidunt pellentesque porttitor',0,1,2,'T52353145321636',2),(2255,'tincidunt urna','tincidunt urna',0,1,1.4667,'T5235365',2),(2256,'tincidunt urna dignissim','tincidunt urna dignissim',0,1,1.8,'T523536532525',2),(2257,'urna dignissim','urna dignissim',0,1,1.4667,'U6532525',2),(2258,'urna dignissim vestibulum','urna dignissim vestibulum',0,1,1.8333,'U6532525123145',2),(2259,'ut pharetra','ut pharetra',0,1,1.3667,'U31636',2),(2260,'ut pharetra nunc','ut pharetra nunc',0,1,1.5333,'U3163652',2),(2261,'vehicula at','vehicula at',0,1,1.3667,'V243',2),(2262,'vehicula at libero','vehicula at libero',0,1,1.6,'V243416',2),(2263,'vel magna','vel magna',0,1,1.3,'V4525',2),(2264,'vel magna nisi','vel magna nisi',0,1,1.4667,'V45252',2),(2265,'velit eros','velit eros',0,1,1.3333,'V4362',2),(2266,'velit eros molestie','velit eros molestie',0,1,1.6333,'V43625423',2),(2267,'velit id','velit id',0,1,1.2667,'V430',2),(2268,'velit id risus','velit id risus',0,1,1.4667,'V4362',2),(2269,'velit tellus','velit tellus',0,1,1.4,'V4342',2),(2270,'velit tellus lacinia','velit tellus lacinia',0,1,1.6667,'V4342425',2),(2271,'venenatis eget','venenati eget',0,1,1.4667,'V5323',2),(2272,'venenatis eget tincidunt','venenati eget tincidunt',0,1,1.8,'V532352353',2),(2273,'vestibulum at','vestibulum at',0,1,1.4333,'V231453',2),(2274,'vestibulum at ipsum','vestibulum at ipsum',0,1,1.6333,'V231453125',2),(2275,'vestibulum tincidunt','vestibulum tincidunt',0,1,1.6667,'V23145352353',2),(2276,'vestibulum tincidunt pellentesque','vestibulum tincidunt pellentesque',0,1,2,'V2314535235314532',2),(2277,'vitae odio','vita odio',0,1,1.3333,'V300',2),(2278,'vitae odio venenatis','vita odio venenatis',0,1,1.6667,'V31532',2),(2279,'vulputate mauris','vulput mauris',0,1,1.5333,'V413562',2),(2280,'vulputate mauris elementum','vulput mauris elementum',0,1,1.8667,'V4135624535',2),(2281,'24','24',0,0,0.2,'',5),(2282,'9','9',0,0,0.1,'',1),(2283,'ac justo','ac justo',0,1,1.2667,'A230',1),(2284,'ac justo vivamus','ac justo vivamus',0,1,1.5333,'A23152',1),(2285,'ac laoreet','ac laoreet',0,1,1.3333,'A2463',1),(2286,'ac laoreet enim','ac laoreet enim',0,1,1.5,'A24635',1),(2287,'ac rhoncus','ac rhoncus',0,1,1.3333,'A2652',1),(2288,'ac rhoncus ac','ac rhoncus ac',0,1,1.4333,'A2652',1),(2289,'accumsan tristique','accumsan tristique',0,1,1.6,'A252536232',1),(2290,'accumsan tristique pellentesque','accumsan tristique pellentesque',0,1,2,'A25253623214532',1),(2291,'aliquam non','aliquam non',0,1,1.3667,'A425',1),(2292,'aliquam non vestibulum','aliquam non vestibulum',0,1,1.7333,'A425123145',1),(2293,'ante in','ant in',0,1,1.2333,'A535',1),(2294,'ante in lorem','ant in lorem',0,1,1.4333,'A535465',1),(2295,'arcu cras','arcu cras',0,1,1.3,'A6262',1),(2296,'arcu cras congue','arcu cras congue',0,1,1.5333,'A626252',1),(2297,'at erat','at erat',0,1,1.2333,'A363',1),(2298,'at erat pretium','at erat pretium',0,1,1.5,'A3631635',1),(2299,'auctor venenatis','auctor venenatis',0,1,1.5333,'A2361532',1),(2300,'auctor venenatis elementum','auctor venenatis elementum',0,1,1.8667,'A23615324535',1),(2301,'blandit in urna','blandit in urna',0,1,1.5,'B453565',1),(2302,'condimentum est','condimentum est',0,1,1.5,'C5353523',1),(2303,'condimentum est vel','condimentum est vel',0,1,1.6333,'C535352314',1),(2304,'congue dignissim','congu dignissim',0,1,1.5333,'C5232525',1),(2305,'congue dignissim est','congu dignissim est',0,1,1.6667,'C523252523',1),(2306,'consequat vehicula','consequat vehicula',0,1,1.6,'C523124',1),(2307,'consequat vehicula porttitor','consequat vehicula porttitor',0,1,1.9333,'C5231241636',1),(2308,'cras congue','cra congue',0,1,1.3667,'C6252',1),(2309,'cras congue dignissim','cra congue dignissim',0,1,1.7,'C625232525',1),(2310,'curabitur tempus','curabitur tempus',0,1,1.5333,'C61363512',1),(2311,'curabitur tempus condimentum','curabitur tempus condimentum',0,1,1.9333,'C6136351253535',1),(2312,'cursus ultricies','cursu ultricies',0,1,1.5333,'C624362',1),(2313,'cursus ultricies proin','cursu ultricies proin',0,1,1.7333,'C624362165',1),(2314,'dignissim est','dignissim est',0,1,1.4333,'D252523',1),(2315,'dignissim est placerat','dignissim est placerat',0,1,1.7333,'D25252314263',1),(2316,'dolor aliquam','dolor aliquam',0,1,1.4333,'D46425',1),(2317,'dolor aliquam non','dolor aliquam non',0,1,1.5667,'D46425',1),(2318,'dolor nibh','dolor nibh',0,1,1.3333,'D4651',1),(2319,'dolor nibh consequat','dolor nibh consequat',0,1,1.6667,'D46512523',1),(2320,'dui at','dui at',0,1,1.2,'D000',1),(2321,'dui at erat','dui at erat',0,1,1.3667,'D630',1),(2322,'duis dolor','dui dolor',0,1,1.3333,'D2346',1),(2323,'duis dolor nibh','dui dolor nibh',0,1,1.5,'D234651',1),(2324,'elementum dolor','elementum dolor',0,1,1.5,'E4535346',1),(2325,'elementum dolor aliquam','elementum dolor aliquam',0,1,1.7667,'E4535346425',1),(2326,'elit in','elit in',0,1,1.2333,'E435',1),(2327,'elit in ut','elit in ut',0,1,1.3333,'E4353',1),(2328,'enim lobortis','enim lobortis',0,1,1.4333,'E541632',1),(2329,'enim lobortis margaret','enim lobortis margaret',0,1,1.7333,'E54163256263',1),(2330,'erat cursus','erat cursus',0,1,1.3667,'E63262',1),(2331,'erat cursus ultricies','erat cursus ultricies',0,1,1.7,'E632624362',1),(2332,'erat pretium','erat pretium',0,1,1.4,'E631635',1),(2333,'erat pretium ac','erat pretium ac',0,1,1.5,'E6316352',1),(2334,'est accumsan','est accumsan',0,1,1.4,'E232525',1),(2335,'est accumsan tristique','est accumsan tristique',0,1,1.7333,'E23252536232',1),(2336,'est placerat','est placerat',0,1,1.4,'E2314263',1),(2337,'est placerat sollicitudin','est placerat sollicitudin',0,1,1.8333,'E231426324235',1),(2338,'est vel','est vel',0,1,1.2333,'E2314',2),(2339,'est vel gravida','est vel gravida',0,1,1.5,'E23142613',1),(2340,'fusce quis','fusc quis',0,1,1.3333,'F200',1),(2341,'fusce quis tellus','fusc quis tellus',0,1,1.5667,'F2342',1),(2342,'gravida fusce','gravida fusce',0,1,1.4333,'G61312',1),(2343,'gravida fusce quis','gravida fusce quis',0,1,1.6,'G61312',1),(2344,'in lorem','in lorem',0,1,1.2667,'I5465',1),(2345,'in lorem scelerisque','in lorem scelerisque',0,1,1.6667,'I54652462',1),(2346,'in urna','in urna',0,1,1.2333,'I565',1),(2347,'in urna nulla','in urna nulla',0,1,1.4333,'I5654',1),(2348,'in ut','in ut',0,1,1.1667,'I530',1),(2349,'in ut nisl','in ut nisl',0,1,1.3333,'I53524',1),(2350,'integer semper','integ semper',0,1,1.4667,'I53262516',1),(2351,'integer semper mauris','integ semper mauris',0,1,1.7,'I53262516562',1),(2352,'justo vivamus','justo vivamus',0,1,1.4333,'J3152',9),(2353,'justo vivamus vel','justo vivamus vel',0,1,1.5667,'J315214',1),(2354,'lacinia nec','lacinia nec',0,1,1.3667,'L252',1),(2355,'lacinia nec tempus','lacinia nec tempus',0,1,1.6,'L2523512',1),(2356,'laoreet enim lobortis','laoreet enim lobortis',0,1,1.7,'L63541632',1),(2357,'libero suscipit','libero suscipit',0,1,1.5,'L16213',1),(2358,'libero suscipit auctor','libero suscipit auctor',0,1,1.7333,'L16213236',1),(2359,'lobortis margaret','loborti margaret',0,1,1.5667,'L163256263',1),(2360,'lobortis margaret walker','loborti margaret walker',0,1,1.8,'L163256263426',1),(2361,'lorem scelerisque','lorem scelerisque',0,1,1.5667,'L652462',1),(2362,'lorem scelerisque malesuada','lorem scelerisque malesuada',0,1,1.9,'L6524625423',1),(2363,'malesuada quisque','malesuada quisque',0,1,1.5667,'M4232',1),(2364,'malesuada quisque quis','malesuada quisque quis',0,1,1.7333,'M4232',1),(2365,'margaret','margaret',0,0,0.5333,'M6263',2),(2366,'margaret walker','margaret walker',0,1,1.5,'M6263426',2),(2367,'margaret walker demolink','margaret walker demolink',0,1,1.8,'M626342635452',1),(2368,'mauris non','mauri non',0,1,1.3333,'M625',1),(2369,'mauris non est','mauri non est',0,1,1.4667,'M62523',1),(2370,'metus vitae','metu vitae',0,1,1.3667,'M3213',1),(2371,'metus vitae risus','metu vitae risus',0,1,1.5667,'M321362',1),(2372,'nec blandit','nec blandit',0,1,1.3667,'N21453',1),(2373,'nec blandit in','nec blandit in',0,1,1.4667,'N214535',1),(2374,'nec tempus','nec tempus',0,1,1.3333,'N23512',1),(2375,'nec tempus ac','nec tempus ac',0,1,1.4333,'N23512',1),(2376,'neque lacinia','nequ lacinia',0,1,1.4333,'N2425',1),(2377,'neque lacinia nec','nequ lacinia nec',0,1,1.5667,'N24252',1),(2378,'nibh consequat','nibh consequat',0,1,1.4667,'N12523',1),(2379,'nibh consequat vehicula','nibh consequat vehicula',0,1,1.7667,'N12523124',1),(2380,'nisl sed','nisl sed',0,1,1.2667,'N2423',1),(2381,'nisl sed libero','nisl sed libero',0,1,1.5,'N2423416',1),(2382,'nisl velit','nisl velit',0,1,1.3333,'N24143',1),(2383,'nisl velit integer','nisl velit integer',0,1,1.6,'N241435326',1),(2384,'non est','non est',0,1,1.2333,'N230',1),(2385,'non est accumsan','non est accumsan',0,1,1.5333,'N232525',1),(2386,'non vestibulum','non vestibulum',0,1,1.4667,'N123145',1),(2387,'non vestibulum arcu','non vestibulum arcu',0,1,1.6333,'N12314562',1),(2388,'nulla scelerisque','nulla scelerisque',0,1,1.5667,'N42462',1),(2389,'nulla scelerisque dui','nulla scelerisque dui',0,1,1.7,'N424623',1),(2390,'odio tincidunt','odio tincidunt',0,1,1.4667,'O352353',1),(2391,'odio tincidunt vel','odio tincidunt vel',0,1,1.6,'O35235314',1),(2392,'pellentesque pharetra','pellentesqu pharetra',0,1,1.7,'P45321636',1),(2393,'pellentesque pharetra metus','pellentesqu pharetra metus',0,1,1.9,'P45321636532',1),(2394,'pharetra metus','pharetra metus',0,1,1.4667,'P636532',1),(2395,'pharetra metus vitae','pharetra metus vitae',0,1,1.6667,'P63653213',1),(2396,'placerat sollicitudin','placerat sollicitudin',0,1,1.7,'P426324235',1),(2397,'placerat sollicitudin odio','placerat sollicitudin odio',0,1,1.8667,'P4263242353',1),(2398,'portfolio 9','portfolio 9',0,1,1.3667,'P6314',1),(2399,'porttitor nec','porttitor nec',0,1,1.4333,'P63652',1),(2400,'porttitor nec blandit','porttitor nec blandit',0,1,1.7,'P636521453',1),(2401,'pretium ac','pretium ac',0,1,1.3333,'P6352',1),(2402,'pretium ac laoreet','pretium ac laoreet',0,1,1.6,'P6352463',1),(2403,'pretium duis','pretium duis',0,1,1.4,'P63532',2),(2404,'pretium duis dolor','pretium duis dolor',0,1,1.6,'P63532346',1),(2405,'pretium vulputate','pretium vulputate',0,1,1.5667,'P6351413',1),(2406,'pretium vulputate erat','pretium vulputate erat',0,1,1.7333,'P635141363',1),(2407,'proin tortor','proin tortor',0,1,1.4,'P653636',1),(2408,'proin tortor neque','proin tortor neque',0,1,1.6,'P65363652',1),(2409,'quis nisl','qui nisl',0,1,1.3,'Q524',1),(2410,'quis nisl velit','qui nisl velit',0,1,1.5,'Q524143',1),(2411,'quis tellus','qui tellus',0,1,1.3667,'Q342',1),(2412,'quis tellus elit','qui tellus elit',0,1,1.5333,'Q34243',1),(2413,'quisque quis','quisqu quis',0,1,1.4,'Q000',1),(2414,'quisque quis nisl','quisqu quis nisl',0,1,1.5667,'Q524',1),(2415,'rhoncus ac justo','rhoncu ac justo',0,1,1.5333,'R523',1),(2416,'risus scelerisque','risu scelerisque',0,1,1.5667,'R2462',1),(2417,'risus scelerisque pretium','risu scelerisque pretium',0,1,1.8333,'R24621635',1),(2418,'scelerisque dui','scelerisqu dui',0,1,1.5,'S4623',1),(2419,'scelerisque dui at','scelerisqu dui at',0,1,1.6,'S4623',1),(2420,'scelerisque malesuada','scelerisqu malesuada',0,1,1.7,'S4625423',1),(2421,'scelerisque malesuada quisque','scelerisqu malesuada quisque',0,1,1.9667,'S46254232',1),(2422,'scelerisque pretium','scelerisqu pretium',0,1,1.6333,'S4621635',9),(2423,'scelerisque pretium duis','scelerisqu pretium duis',0,1,1.8,'S462163532',1),(2424,'sed libero','sed libero',0,1,1.3333,'S3416',1),(2425,'sed libero suscipit','sed libero suscipit',0,1,1.6333,'S3416213',1),(2426,'sed pretium','sed pretium',0,1,1.3667,'S31635',3),(2427,'sed pretium vulputate','sed pretium vulputate',0,1,1.7,'S316351413',1),(2428,'semper mauris','semper mauris',0,1,1.4333,'S516562',1),(2429,'semper mauris non','semper mauris non',0,1,1.5667,'S5165625',1),(2430,'sollicitudin odio','sollicitudin odio',0,1,1.5667,'S42353',1),(2431,'sollicitudin odio tincidunt','sollicitudin odio tincidunt',0,1,1.9,'S4235352353',1),(2432,'suscipit auctor','suscipit auctor',0,1,1.5,'S13236',1),(2433,'suscipit auctor venenatis','suscipit auctor venenatis',0,1,1.8333,'S132361532',1),(2434,'tellus elit','tellu elit',0,1,1.3667,'T4243',1),(2435,'tellus elit in','tellu elit in',0,1,1.4667,'T42435',1),(2436,'tempus ac rhoncus','tempu ac rhoncus',0,1,1.5667,'T512652',1),(2437,'tempus condimentum','tempu condimentum',0,1,1.6,'T51253535',1),(2438,'tempus condimentum est','tempu condimentum est',0,1,1.7333,'T5125353523',1),(2439,'tincidunt vel','tincidunt vel',0,1,1.4333,'T5235314',1),(2440,'tincidunt vel sed','tincidunt vel sed',0,1,1.5667,'T523531423',1),(2441,'tortor neque','tortor neque',0,1,1.4,'T63652',1),(2442,'tortor neque lacinia','tortor neque lacinia',0,1,1.6667,'T63652425',1),(2443,'tristique pellentesque','tristiqu pellentesque',0,1,1.7333,'T623214532',1),(2444,'tristique pellentesque pharetra','tristiqu pellentesque pharetra',0,1,2,'T6232145321636',1),(2445,'ultricies proin','ultrici proin',0,1,1.5,'U4362165',1),(2446,'ultricies proin tortor','ultrici proin tortor',0,1,1.7333,'U43621653636',1),(2447,'urna nulla','urna nulla',0,1,1.3333,'U654',1),(2448,'urna nulla scelerisque','urna nulla scelerisque',0,1,1.7333,'U6542462',1),(2449,'ut nisl','ut nisl',0,1,1.2333,'U3524',1),(2450,'ut nisl sed','ut nisl sed',0,1,1.3667,'U352423',1),(2451,'vehicula porttitor','vehicula porttitor',0,1,1.6,'V241636',1),(2452,'vehicula porttitor nec','vehicula porttitor nec',0,1,1.7333,'V24163652',1),(2453,'vel ante','vel ante',0,1,1.2667,'V453',1),(2454,'vel ante in','vel ante in',0,1,1.3667,'V4535',1),(2455,'vel gravida','vel gravida',0,1,1.3667,'V42613',1),(2456,'vel gravida fusce','vel gravida fusce',0,1,1.5667,'V4261312',1),(2457,'vel sed','vel sed',0,1,1.2333,'V423',1),(2458,'vel sed pretium','vel sed pretium',0,1,1.5,'V4231635',1),(2459,'velit integer','velit integer',0,1,1.4333,'V435326',1),(2460,'velit integer semper','velit integer semper',0,1,1.6667,'V4353262516',1),(2461,'venenatis elementum','venenati elementum',0,1,1.6333,'V5324535',1),(2462,'venenatis elementum dolor','venenati elementum dolor',0,1,1.8333,'V5324535346',1),(2463,'vestibulum arcu','vestibulum arcu',0,1,1.5,'V2314562',1),(2464,'vestibulum arcu cras','vestibulum arcu cras',0,1,1.6667,'V231456262',1),(2465,'vitae risus','vita risus',0,1,1.3667,'V362',1),(2466,'vitae risus scelerisque','vita risus scelerisque',0,1,1.7667,'V362462',1),(2467,'vivamus vel ante','vivamu vel ante',0,1,1.5333,'V521453',1),(2468,'vulputate erat','vulput erat',0,1,1.4667,'V41363',1),(2469,'vulputate erat cursus','vulput erat cursus',0,1,1.7,'V41363262',1),(2470,'walker','walker',0,0,0.4,'W426',2),(2471,'walker demolink','walker demolink',0,1,1.5,'W42635452',1),(2472,'walker demolink org','walker demolink org',0,1,1.6333,'W4263545262',1),(2473,'29','29',0,0,0.2,'',3),(2474,'ac felis','ac felis',0,1,1.2667,'A2142',1),(2475,'ac felis massa','ac felis massa',0,1,1.4667,'A214252',1),(2476,'ac turpis','ac turpis',0,1,1.3,'A23612',1),(2477,'ac turpis egestas','ac turpis egestas',0,1,1.5667,'A2361232',1),(2478,'accumsan maecenas','accumsan maecenas',0,1,1.5667,'A2525252',1),(2479,'accumsan maecenas tempus','accumsan maecenas tempus',0,1,1.8,'A25252523512',1),(2480,'adipiscing elit curabitur','adipisc elit curabitur',0,1,1.8333,'A312524326136',1),(2481,'aenean sit','aenean sit',0,1,1.3333,'A523',1),(2482,'aenean sit amet','aenean sit amet',0,1,1.5,'A52353',1),(2483,'aliquam kenneth','aliquam kenneth',0,1,1.5,'A425253',1),(2484,'aliquam kenneth edwards','aliquam kenneth edwards',0,1,1.7667,'A425253632',1),(2485,'aliquam magna','aliquam magna',0,1,1.4333,'A42525',1),(2486,'aliquam magna dignissim','aliquam magna dignissim',0,1,1.7667,'A4252532525',1),(2487,'amet risus','amet risus',0,1,1.3333,'A5362',1),(2488,'amet risus mi','amet risus mi',0,1,1.4333,'A53625',1),(2489,'augue velit','augu velit',0,1,1.3667,'A2143',1),(2490,'augue velit pharetra','augu velit pharetra',0,1,1.6667,'A21431636',1),(2491,'consequat nullam','consequat nullam',0,1,1.5333,'C523545',1),(2492,'consequat nullam ut','consequat nullam ut',0,1,1.6333,'C5235453',1),(2493,'consequat sed','consequat sed',0,1,1.4333,'C52323',1),(2494,'consequat sed id','consequat sed id',0,1,1.5333,'C52323',1),(2495,'convallis hendrerit','conval hendrerit',0,1,1.6333,'C51425363',1),(2496,'convallis hendrerit aliquam','conval hendrerit aliquam',0,1,1.9,'C51425363425',1),(2497,'curabitur aliquam','curabitur aliquam',0,1,1.5667,'C6136425',1),(2498,'curabitur aliquam magna','curabitur aliquam magna',0,1,1.7667,'C613642525',1),(2499,'dignissim elit','dignissim elit',0,1,1.4667,'D252543',9),(2500,'dignissim elit sollicitudin','dignissim elit sollicitudin',0,1,1.9,'D25254324235',1),(2501,'donec ac','donec ac',0,1,1.2667,'D520',1),(2502,'donec ac felis','donec ac felis',0,1,1.4667,'D52142',1),(2503,'duis augue','dui augue',0,1,1.3333,'D200',1),(2504,'duis augue velit','dui augue velit',0,1,1.5333,'D2143',1),(2505,'duis fermentum','dui fermentum',0,1,1.4667,'D216535',1),(2506,'duis fermentum vehicula','dui fermentum vehicula',0,1,1.7667,'D216535124',1),(2507,'duis malesuada','dui malesuada',0,1,1.4667,'D25423',1),(2508,'duis malesuada tellus','dui malesuada tellus',0,1,1.7,'D2542342',1),(2509,'edwards','edward',0,0,0.4667,'E3632',3),(2510,'edwards demolink','edward demolink',0,1,1.5333,'E363235452',1),(2511,'edwards demolink org','edward demolink org',0,1,1.6667,'E36323545262',1),(2512,'egestas cum','egesta cum',0,1,1.3667,'E2325',1),(2513,'egestas cum sociis','egesta cum sociis',0,1,1.6,'E23252',1),(2514,'eget porta id','eget porta id',0,1,1.4333,'E23163',1),(2515,'elit curabitur','elit curabitur',0,1,1.4667,'E4326136',1),(2516,'elit curabitur aliquam','elit curabitur aliquam',0,1,1.7333,'E4326136425',1),(2517,'elit sollicitudin','elit sollicitudin',0,1,1.5667,'E4324235',1),(2518,'elit sollicitudin accumsan','elit sollicitudin accumsan',0,1,1.8667,'E43242352525',1),(2519,'et malesuada','et malesuada',0,1,1.4,'E35423',1),(2520,'et malesuada fames','et malesuada fames',0,1,1.6,'E35423152',1),(2521,'et netus','et netus',0,1,1.2667,'E3532',1),(2522,'et netus et','et netus et',0,1,1.3667,'E35323',1),(2523,'et tellus','et tellus',0,1,1.3,'E342',1),(2524,'et tellus feugiat','et tellus feugiat',0,1,1.5667,'E342123',1),(2525,'fames','fame',0,0,0.3333,'F520',1),(2526,'fames ac','fame ac',0,1,1.2667,'F520',1),(2527,'fames ac turpis','fame ac turpis',0,1,1.5,'F523612',1),(2528,'felis lorem','feli lorem',0,1,1.3667,'F42465',1),(2529,'felis lorem ipsum','feli lorem ipsum',0,1,1.5667,'F42465125',1),(2530,'felis massa','feli massa',0,1,1.3667,'F4252',1),(2531,'felis massa aenean','feli massa aenean',0,1,1.6,'F42525',1),(2532,'fermentum vehicula','fermentum vehicula',0,1,1.6,'F6535124',1),(2533,'fermentum vehicula consequat','fermentum vehicula consequat',0,1,1.9333,'F65351242523',1),(2534,'feugiat consequat','feugiat consequat',0,1,1.5667,'F232523',1),(2535,'feugiat consequat sed','feugiat consequat sed',0,1,1.7,'F23252323',1),(2536,'fringilla felis','fringilla felis',0,1,1.5,'F6524142',1),(2537,'fringilla felis lorem','fringilla felis lorem',0,1,1.7,'F6524142465',1),(2538,'habitant','habit',0,0,0.5333,'H1353',1),(2539,'habitant morbi','habit morbi',0,1,1.4667,'H1353561',1),(2540,'habitant morbi tristique','habit morbi tristique',0,1,1.8,'H135356136232',1),(2541,'hendrerit aliquam','hendrerit aliquam',0,1,1.5667,'H5363425',1),(2542,'hendrerit aliquam kenneth','hendrerit aliquam kenneth',0,1,1.8333,'H5363425253',1),(2543,'id fringilla','id fringilla',0,1,1.4,'I316524',1),(2544,'id fringilla felis','id fringilla felis',0,1,1.6,'I316524142',1),(2545,'id massa','id massa',0,1,1.2667,'I352',1),(2546,'id massa nam','id massa nam',0,1,1.4,'I3525',1),(2547,'justo duis','justo duis',0,1,1.3333,'J320',1),(2548,'justo duis malesuada','justo duis malesuada',0,1,1.6667,'J325423',1),(2549,'kenneth','kenneth',0,0,0.4667,'K530',3),(2550,'kenneth edwards','kenneth edwards',0,1,1.5,'K53632',3),(2551,'kenneth edwards demolink','kenneth edwards demolink',0,1,1.8,'K5363235452',1),(2552,'luctus pretium','luctu pretium',0,1,1.4667,'L2321635',1),(2553,'luctus pretium duis','luctu pretium duis',0,1,1.6333,'L232163532',1),(2554,'maecenas tempus','maecena tempus',0,1,1.5,'M2523512',1),(2555,'maecenas tempus luctus','maecena tempus luctus',0,1,1.7333,'M25235124232',1),(2556,'magna dignissim','magna dignissim',0,1,1.5,'M2532525',1),(2557,'magna dignissim elit','magna dignissim elit',0,1,1.6667,'M253252543',1),(2558,'malesuada fames','malesuada fames',0,1,1.5,'M423152',1),(2559,'malesuada fames ac','malesuada fames ac',0,1,1.6,'M423152',1),(2560,'malesuada tellus','malesuada tellus',0,1,1.5333,'M42342',1),(2561,'malesuada tellus et','malesuada tellus et',0,1,1.6333,'M423423',1),(2562,'massa aenean','massa aenean',0,1,1.4,'M250',1),(2563,'massa aenean sit','massa aenean sit',0,1,1.5333,'M2523',1),(2564,'massa nam','massa nam',0,1,1.3,'M250',1),(2565,'massa nam convallis','massa nam convallis',0,1,1.6333,'M2525142',1),(2566,'mi pellentesque','mi pellentesque',0,1,1.5,'M14532',1),(2567,'mi pellentesque habitant','mi pellentesque habitant',0,1,1.8,'M145321353',1),(2568,'morbi tristique','morbi tristique',0,1,1.5,'M6136232',1),(2569,'morbi tristique senectus','morbi tristique senectus',0,1,1.8,'M61362325232',1),(2570,'mus duis','mu duis',0,1,1.2667,'M232',1),(2571,'mus duis fermentum','mu duis fermentum',0,1,1.6,'M23216535',1),(2572,'nam','nam',0,0,0.2,'N000',2),(2573,'nam convallis','nam convallis',0,1,1.4333,'N25142',1),(2574,'nam convallis hendrerit','nam convallis hendrerit',0,1,1.7667,'N251425363',1),(2575,'neque justo','nequ justo',0,1,1.3667,'N230',1),(2576,'neque justo duis','nequ justo duis',0,1,1.5333,'N232',1),(2577,'netus','netu',0,0,0.3333,'N320',1),(2578,'netus et','netu et',0,1,1.2667,'N323',1),(2579,'netus et malesuada','netu et malesuada',0,1,1.6,'N3235423',1),(2580,'nullam ut','nullam ut',0,1,1.3,'N453',1),(2581,'nullam ut neque','nullam ut neque',0,1,1.5,'N45352',1),(2582,'pellentesque habitant','pellentesqu habitant',0,1,1.7,'P45321353',1),(2583,'pellentesque habitant morbi','pellentesqu habitant morbi',0,1,1.9,'P45321353561',1),(2584,'pharetra quis','pharetra quis',0,1,1.4333,'P6362',1),(2585,'pharetra quis ullamcorper','pharetra quis ullamcorper',0,1,1.8333,'P6362452616',1),(2586,'porta id','porta id',0,1,1.2667,'P630',1),(2587,'porta id massa','porta id massa',0,1,1.4667,'P6352',1),(2588,'pretium duis augue','pretium duis augue',0,1,1.6,'P63532',1),(2589,'quis ullamcorper','qui ullamcorper',0,1,1.5333,'Q452616',1),(2590,'quis ullamcorper eget','qui ullamcorper eget',0,1,1.7,'Q45261623',1),(2591,'ridiculus mus duis','ridiculu mus duis',0,1,1.6,'R32425232',1),(2592,'risus mi','risu mi',0,1,1.2667,'R250',1),(2593,'risus mi pellentesque','risu mi pellentesque',0,1,1.7,'R2514532',1),(2594,'sed id','sed id',0,1,1.2,'S300',1),(2595,'sed id fringilla','sed id fringilla',0,1,1.5333,'S316524',1),(2596,'senectus','senectu',0,0,0.5333,'S5232',1),(2597,'senectus et','senectu et',0,1,1.3667,'S52323',1),(2598,'senectus et netus','senectu et netus',0,1,1.5667,'S52323532',1),(2599,'sit amet risus','sit amet risus',0,1,1.4667,'S35362',1),(2600,'sollicitudin accumsan','sollicitudin accumsan',0,1,1.7,'S42352525',1),(2601,'sollicitudin accumsan maecenas','sollicitudin accumsan maecenas',0,1,2,'S42352525252',1),(2602,'tellus et','tellu et',0,1,1.3,'T423',1),(2603,'tellus et tellus','tellu et tellus',0,1,1.5333,'T42342',1),(2604,'tellus feugiat','tellu feugiat',0,1,1.4667,'T42123',1),(2605,'tellus feugiat consequat','tellu feugiat consequat',0,1,1.8,'T421232523',1),(2606,'tempus luctus pretium','tempu luctus pretium',0,1,1.7,'T51242321635',1),(2607,'tristique senectus','tristiqu senectus',0,1,1.6,'T62325232',1),(2608,'tristique senectus et','tristiqu senectus et',0,1,1.7,'T623252323',1),(2609,'turpis egestas','turpi egestas',0,1,1.4667,'T61232',1),(2610,'turpis egestas cum','turpi egestas cum',0,1,1.6,'T612325',1),(2611,'ullamcorper eget','ullamcorp eget',0,1,1.5333,'U45261623',1),(2612,'ullamcorper eget porta','ullamcorp eget porta',0,1,1.7333,'U45261623163',1),(2613,'ut neque','ut neque',0,1,1.2667,'U352',1),(2614,'ut neque justo','ut neque justo',0,1,1.4667,'U3523',1),(2615,'vehicula consequat','vehicula consequat',0,1,1.6,'V242523',1),(2616,'vehicula consequat nullam','vehicula consequat nullam',0,1,1.8333,'V242523545',1),(2617,'velit pharetra','velit pharetra',0,1,1.4667,'V431636',1),(2618,'velit pharetra quis','velit pharetra quis',0,1,1.6333,'V4316362',1),(2619,'donna','donna',0,0,0.3333,'D500',4),(2620,'donna phillips','donna phillips',0,1,1.4667,'D51412',4),(2621,'phillips','phillip',0,0,0.5333,'P412',4),(2622,'ac tortor','ac tortor',0,1,1.3,'A23636',1),(2623,'ac tortor vitae','ac tortor vitae',0,1,1.5,'A2363613',1),(2624,'accumsan nam','accumsan nam',0,1,1.4,'A2525',1),(2625,'accumsan nam sapien','accumsan nam sapien',0,1,1.6333,'A2525215',1),(2626,'amet consequat','amet consequat',0,1,1.4667,'A532523',1),(2627,'amet consequat ornare','amet consequat ornare',0,1,1.7,'A532523656',1),(2628,'amet erat','amet erat',0,1,1.3,'A5363',1),(2629,'amet erat suspendisse','amet erat suspendisse',0,1,1.7,'A536321532',1),(2630,'ante curabitur','ant curabitur',0,1,1.4667,'A5326136',1),(2631,'ante curabitur ut','ant curabitur ut',0,1,1.5667,'A53261363',1),(2632,'arcu sodales','arcu sodales',0,1,1.4,'A62342',1),(2633,'arcu sodales quis','arcu sodales quis',0,1,1.5667,'A62342',1),(2634,'arcu velit','arcu velit',0,1,1.3333,'A62143',1),(2635,'arcu velit sit','arcu velit sit',0,1,1.4667,'A6214323',1),(2636,'at nulla tristique','at nulla tristique',0,1,1.6,'A35436232',1),(2637,'at suscipit','at suscipit',0,1,1.3667,'A3213',1),(2638,'at suscipit et','at suscipit et',0,1,1.4667,'A3213',1),(2639,'blandit duis','blandit duis',0,1,1.4,'B4532',1),(2640,'blandit duis tincidunt','blandit duis tincidunt',0,1,1.7333,'B4532352353',1),(2641,'congue arcu','congu arcu',0,1,1.3667,'C5262',1),(2642,'congue arcu velit','congu arcu velit',0,1,1.5667,'C5262143',1),(2643,'congue purus','congu purus',0,1,1.4,'C52162',1),(2644,'congue purus leo','congu purus leo',0,1,1.5333,'C521624',1),(2645,'consequat ornare','consequat ornare',0,1,1.5333,'C523656',1),(2646,'consequat ornare nibh','consequat ornare nibh',0,1,1.7,'C52365651',1),(2647,'cras sollicitudin','cra sollicitudin',0,1,1.5667,'C624235',1),(2648,'cras sollicitudin risus','cra sollicitudin risus',0,1,1.7667,'C62423562',1),(2649,'curabitur ut','curabitur ut',0,1,1.4,'C61363',1),(2650,'curabitur ut lorem','curabitur ut lorem',0,1,1.6,'C61363465',1),(2651,'cursus mattis','cursu mattis',0,1,1.4333,'C62532',1),(2652,'cursus mattis pulvinar','cursu mattis pulvinar',0,1,1.7333,'C6253214156',1),(2653,'cursus vel','cursu vel',0,1,1.3333,'C6214',1),(2654,'cursus vel elit','cursu vel elit',0,1,1.5,'C62143',1),(2655,'dapibus quis','dapibu quis',0,1,1.4,'D120',9),(2656,'dapibus quis pharetra','dapibu quis pharetra',0,1,1.7,'D121636',1),(2657,'diam est','diam est',0,1,1.2667,'D523',1),(2658,'diam est vel','diam est vel',0,1,1.4,'D52314',1),(2659,'diam eu odio','diam eu odio',0,1,1.4,'D530',1),(2660,'donna phillips demolink','donna phillips demolink',0,1,1.7667,'D5141235452',1),(2661,'duis tincidunt','dui tincidunt',0,1,1.4667,'D2352353',1),(2662,'duis tincidunt quam','dui tincidunt quam',0,1,1.6333,'D235235325',1),(2663,'egestas sem','egesta sem',0,1,1.3667,'E2325',1),(2664,'egestas sem nec','egesta sem nec',0,1,1.5,'E23252',1),(2665,'eget volutpat','eget volutpat',0,1,1.4333,'E2314313',1),(2666,'eget volutpat magna','eget volutpat magna',0,1,1.6333,'E2314313525',1),(2667,'elit accumsan','elit accumsan',0,1,1.4333,'E432525',1),(2668,'elit accumsan nam','elit accumsan nam',0,1,1.5667,'E432525',1),(2669,'elit suspendisse potenti','elit suspendisse potenti',0,1,1.8,'E43215321353',1),(2670,'enim dapibus','enim dapibus',0,1,1.4,'E5312',1),(2671,'enim dapibus quis','enim dapibus quis',0,1,1.5667,'E5312',1),(2672,'erat fermentum','erat fermentum',0,1,1.4667,'E6316535',1),(2673,'erat fermentum mauris','erat fermentum mauris',0,1,1.7,'E631653562',1),(2674,'erat suspendisse','erat suspendisse',0,1,1.5333,'E6321532',1),(2675,'erat suspendisse ornare','erat suspendisse ornare',0,1,1.7667,'E6321532656',1),(2676,'eros arcu','ero arcu',0,1,1.3,'E6262',1),(2677,'eros arcu sodales','ero arcu sodales',0,1,1.5667,'E6262342',1),(2678,'est vel lorem','est vel lorem',0,1,1.4333,'E231465',1),(2679,'et odio','et odio',0,1,1.2333,'E300',1),(2680,'et odio pellentesque','et odio pellentesque',0,1,1.6667,'E314532',1),(2681,'et tincidunt elit','et tincidunt elit',0,1,1.5667,'E35235343',1),(2682,'eu odio','eu odio',0,1,1.2333,'E300',1),(2683,'eu odio cursus','eu odio cursus',0,1,1.4667,'E3262',1),(2684,'eu sed','eu sed',0,1,1.2,'E230',1),(2685,'eu sed tellus','eu sed tellus',0,1,1.4333,'E2342',1),(2686,'eu vestibulum','eu vestibulum',0,1,1.4333,'E123145',1),(2687,'eu vestibulum diam','eu vestibulum diam',0,1,1.6,'E12314535',1),(2688,'euismod metus','euismod metus',0,1,1.4333,'E253532',1),(2689,'euismod metus sed','euismod metus sed',0,1,1.5667,'E2535323',1),(2690,'faucibus congue','faucibu congue',0,1,1.5,'F21252',1),(2691,'faucibus congue arcu','faucibu congue arcu',0,1,1.6667,'F2125262',1),(2692,'faucibus odio','faucibu odio',0,1,1.4333,'F2123',1),(2693,'faucibus odio sed','faucibu odio sed',0,1,1.5667,'F212323',1),(2694,'fermentum diam','fermentum diam',0,1,1.4667,'F653535',1),(2695,'fermentum diam eu','fermentum diam eu',0,1,1.5667,'F653535',1),(2696,'fermentum mauris','fermentum mauris',0,1,1.5333,'F653562',1),(2697,'fermentum mauris faucibus','fermentum mauris faucibus',0,1,1.8333,'F6535621212',1),(2698,'feugiat nulla','feugiat nulla',0,1,1.4333,'F2354',1),(2699,'feugiat nulla tempor','feugiat nulla tempor',0,1,1.6667,'F23543516',1),(2700,'feugiat vestibulum','feugiat vestibulum',0,1,1.6,'F23123145',1),(2701,'feugiat vestibulum justo','feugiat vestibulum justo',0,1,1.8,'F2312314523',1),(2702,'iaculis at','iaculi at',0,1,1.3333,'I2423',1),(2703,'iaculis at suscipit','iaculi at suscipit',0,1,1.6333,'I2423213',1),(2704,'imperdiet ultricies','imperdiet ultricies',0,1,1.6333,'I51634362',1),(2705,'imperdiet ultricies lectus','imperdiet ultricies lectus',0,1,1.8667,'I516343624232',1),(2706,'integer ac','integ ac',0,1,1.3333,'I53262',1),(2707,'integer ac tortor','integ ac tortor',0,1,1.5667,'I532623636',1),(2708,'justo lectus','justo lectus',0,1,1.4,'J34232',1),(2709,'justo lectus feugiat','justo lectus feugiat',0,1,1.6667,'J34232123',1),(2710,'lectus feugiat','lectu feugiat',0,1,1.4667,'L232123',1),(2711,'lectus feugiat nulla','lectu feugiat nulla',0,1,1.6667,'L23212354',1),(2712,'lectus nulla','lectu nulla',0,1,1.4,'L23254',1),(2713,'lectus nulla tincidunt','lectu nulla tincidunt',0,1,1.7333,'L23254352353',1),(2714,'leo faucibus','leo faucibus',0,1,1.4,'L1212',1),(2715,'leo faucibus odio','leo faucibus odio',0,1,1.5667,'L12123',1),(2716,'lorem eget','lorem eget',0,1,1.3333,'L6523',1),(2717,'lorem eget volutpat','lorem eget volutpat',0,1,1.6333,'L652314313',1),(2718,'lorem lorem','lorem lorem',0,1,1.3667,'L65465',1),(2719,'lorem lorem eget','lorem lorem eget',0,1,1.5333,'L6546523',1),(2720,'lorem nulla','lorem nulla',0,1,1.3667,'L654',1),(2721,'lorem nulla egestas','lorem nulla egestas',0,1,1.6333,'L654232',1),(2722,'magna pellentesque','magna pellentesque',0,1,1.6,'M2514532',1),(2723,'magna pellentesque eros','magna pellentesque eros',0,1,1.7667,'M251453262',1),(2724,'mattis pulvinar','matti pulvinar',0,1,1.5,'M3214156',1),(2725,'mattis pulvinar sem','matti pulvinar sem',0,1,1.6333,'M321415625',1),(2726,'mauris euismod','mauri euismod',0,1,1.4667,'M6253',1),(2727,'mauris euismod metus','mauri euismod metus',0,1,1.6667,'M6253532',1),(2728,'mauris faucibus','mauri faucibus',0,1,1.5,'M621212',1),(2729,'mauris faucibus congue','mauri faucibus congue',0,1,1.7333,'M62121252',1),(2730,'metus sed','metu sed',0,1,1.3,'M323',1),(2731,'metus sed feugiat','metu sed feugiat',0,1,1.5667,'M323123',1),(2732,'mi ut','mi ut',0,1,1.1667,'M300',1),(2733,'mi ut imperdiet','mi ut imperdiet',0,1,1.5,'M35163',1),(2734,'mus cras','mu cras',0,1,1.2667,'M262',1),(2735,'mus cras sollicitudin','mu cras sollicitudin',0,1,1.7,'M2624235',1),(2736,'nam sapien','nam sapien',0,1,1.3333,'N215',1),(2737,'nam sapien enim','nam sapien enim',0,1,1.5,'N215',1),(2738,'nec nisi','nec nisi',0,1,1.2667,'N252',1),(2739,'nec nisi scelerisque','nec nisi scelerisque',0,1,1.6667,'N252462',1),(2740,'nibh erat','nibh erat',0,1,1.3,'N163',1),(2741,'nibh erat fermentum','nibh erat fermentum',0,1,1.6333,'N16316535',1),(2742,'nisi scelerisque','nisi scelerisque',0,1,1.5333,'N2462',1),(2743,'nisi scelerisque et','nisi scelerisque et',0,1,1.6333,'N24623',1),(2744,'nisl tempus','nisl tempus',0,1,1.3667,'N243512',1),(2745,'nisl tempus blandit','nisl tempus blandit',0,1,1.6333,'N2435121453',1),(2746,'nulla egestas','nulla egestas',0,1,1.4333,'N4232',1),(2747,'nulla egestas sem','nulla egestas sem',0,1,1.5667,'N42325',1),(2748,'nulla tempor','nulla tempor',0,1,1.4,'N43516',1),(2749,'nulla tempor congue','nulla tempor congue',0,1,1.6333,'N43516252',1),(2750,'nulla tincidunt','nulla tincidunt',0,1,1.5,'N4352353',1),(2751,'nulla tincidunt velit','nulla tincidunt velit',0,1,1.7,'N4352353143',1),(2752,'nulla tristique','nulla tristique',0,1,1.5,'N436232',1),(2753,'nulla tristique porttitor','nulla tristique porttitor',0,1,1.8333,'N4362321636',1),(2754,'odio cursus mattis','odio cursus mattis',0,1,1.6,'O3262532',1),(2755,'odio pellentesque','odio pellentesque',0,1,1.5667,'O314532',1),(2756,'odio pellentesque fermentum','odio pellentesque fermentum',0,1,1.9,'O31453216535',1),(2757,'odio sed','odio sed',0,1,1.2667,'O323',1),(2758,'odio sed sagittis','odio sed sagittis',0,1,1.5667,'O323232',1),(2759,'ornare nibh','ornar nibh',0,1,1.3667,'O65651',1),(2760,'ornare nibh erat','ornar nibh erat',0,1,1.5333,'O6565163',1),(2761,'ornare pulvinar','ornar pulvinar',0,1,1.5,'O65614156',1),(2762,'ornare pulvinar ante','ornar pulvinar ante',0,1,1.6667,'O6561415653',1),(2763,'pellentesque eros','pellentesqu eros',0,1,1.5667,'P453262',1),(2764,'pellentesque eros arcu','pellentesqu eros arcu',0,1,1.7333,'P45326262',1),(2765,'pellentesque fermentum','pellentesqu fermentum',0,1,1.7333,'P453216535',1),(2766,'pellentesque fermentum diam','pellentesqu fermentum diam',0,1,1.9,'P45321653535',1),(2767,'pharetra sed','pharetra sed',0,1,1.4,'P63623',1),(2768,'pharetra sed cursus','pharetra sed cursus',0,1,1.6333,'P63623262',1),(2769,'phillips demolink','phillip demolink',0,1,1.5667,'P41235452',1),(2770,'phillips demolink org','phillip demolink org',0,1,1.7,'P4123545262',1),(2771,'porttitor eu','porttitor eu',0,1,1.4,'P636',1),(2772,'porttitor eu sed','porttitor eu sed',0,1,1.5333,'P63623',1),(2773,'potenti donna','potenti donna',0,1,1.4333,'P3535',1),(2774,'potenti donna phillips','potenti donna phillips',0,1,1.7333,'P35351412',1),(2775,'pulvinar ante','pulvinar ante',0,1,1.4333,'P415653',1),(2776,'pulvinar ante curabitur','pulvinar ante curabitur',0,1,1.7667,'P41565326136',1),(2777,'pulvinar sem','pulvinar sem',0,1,1.4,'P415625',1),(2778,'pulvinar sem volutpat','pulvinar sem volutpat',0,1,1.7,'P41562514313',1),(2779,'purus leo','puru leo',0,1,1.3,'P624',1),(2780,'purus leo faucibus','puru leo faucibus',0,1,1.6,'P6241212',1),(2781,'quam at','quam at',0,1,1.2333,'Q530',1),(2782,'quam at nulla','quam at nulla',0,1,1.4333,'Q5354',1),(2783,'quis iaculis','qui iaculis',0,1,1.4,'Q420',1),(2784,'quis iaculis at','qui iaculis at',0,1,1.5,'Q423',1),(2785,'quis pharetra','qui pharetra',0,1,1.4333,'Q1636',1),(2786,'quis pharetra sed','qui pharetra sed',0,1,1.5667,'Q163623',1),(2787,'ridiculus mus cras','ridiculu mus cras',0,1,1.6,'R32425262',1),(2788,'risus sit','risu sit',0,1,1.3,'R230',1),(2789,'risus sit amet','risu sit amet',0,1,1.4667,'R2353',1),(2790,'sagittis mi ut','sagitti mi ut',0,1,1.4667,'S3253',1),(2791,'sapien enim','sapien enim',0,1,1.3667,'S150',1),(2792,'sapien enim dapibus','sapien enim dapibus',0,1,1.6333,'S15312',1),(2793,'scelerisque et','scelerisqu et',0,1,1.4667,'S4623',1),(2794,'scelerisque et tincidunt','scelerisqu et tincidunt',0,1,1.8,'S462352353',1),(2795,'sed cursus vel','sed cursus vel',0,1,1.4667,'S326214',1),(2796,'sed feugiat','sed feugiat',0,1,1.3667,'S3123',1),(2797,'sed feugiat vestibulum','sed feugiat vestibulum',0,1,1.7333,'S3123123145',1),(2798,'sed sagittis','sed sagittis',0,1,1.4,'S3232',1),(2799,'sed sagittis mi','sed sagittis mi',0,1,1.5,'S32325',1),(2800,'sed tellus','sed tellus',0,1,1.3333,'S342',1),(2801,'sed tellus mauris','sed tellus mauris',0,1,1.5667,'S342562',1),(2802,'sem nec','sem nec',0,1,1.2333,'S520',1),(2803,'sem nec nisi','sem nec nisi',0,1,1.4,'S5252',1),(2804,'sem volutpat','sem volutpat',0,1,1.4,'S514313',1),(2805,'sem volutpat integer','sem volutpat integer',0,1,1.6667,'S5143135326',1),(2806,'sit amet consequat','sit amet consequat',0,1,1.6,'S3532523',1),(2807,'sit amet erat','sit amet erat',0,1,1.4333,'S35363',1),(2808,'sodales quis','sodal quis',0,1,1.4,'S342',1),(2809,'sodales quis iaculis','sodal quis iaculis',0,1,1.6667,'S34242',1),(2810,'sollicitudin risus','sollicitudin risus',0,1,1.6,'S423562',1),(2811,'sollicitudin risus sit','sollicitudin risus sit',0,1,1.7333,'S4235623',1),(2812,'suscipit et','suscipit et',0,1,1.3667,'S130',1),(2813,'suscipit et odio','suscipit et odio',0,1,1.5333,'S130',1),(2814,'suspendisse ornare','suspendiss ornare',0,1,1.6,'S1532656',1),(2815,'suspendisse ornare pulvinar','suspendiss ornare pulvinar',0,1,1.9,'S153265614156',1),(2816,'suspendisse potenti donna','suspendiss potenti donna',0,1,1.8333,'S153213535',1),(2817,'tellus mauris','tellu mauris',0,1,1.4333,'T42562',1),(2818,'tellus mauris euismod','tellu mauris euismod',0,1,1.7,'T4256253',1),(2819,'tempor congue','tempor congue',0,1,1.4333,'T516252',1),(2820,'tempor congue purus','tempor congue purus',0,1,1.6333,'T516252162',1),(2821,'tempus blandit','tempu blandit',0,1,1.4667,'T5121453',1),(2822,'tempus blandit duis','tempu blandit duis',0,1,1.6333,'T51214532',1),(2823,'tincidunt elit','tincidunt elit',0,1,1.4667,'T5235343',1),(2824,'tincidunt elit accumsan','tincidunt elit accumsan',0,1,1.7667,'T52353432525',1),(2825,'tincidunt quam','tincidunt quam',0,1,1.4667,'T5235325',1),(2826,'tincidunt quam at','tincidunt quam at',0,1,1.5667,'T52353253',1),(2827,'tincidunt velit','tincidunt velit',0,1,1.5,'T52353143',1),(2828,'tincidunt velit eu','tincidunt velit eu',0,1,1.6,'T52353143',1),(2829,'tortor vitae','tortor vitae',0,1,1.4,'T63613',1),(2830,'tortor vitae nisl','tortor vitae nisl',0,1,1.5667,'T63613524',1),(2831,'tristique porttitor','tristiqu porttitor',0,1,1.6333,'T62321636',1),(2832,'tristique porttitor eu','tristiqu porttitor eu',0,1,1.7333,'T62321636',1),(2833,'ultricies lectus','ultrici lectus',0,1,1.5333,'U43624232',1),(2834,'ultricies lectus nulla','ultrici lectus nulla',0,1,1.7333,'U4362423254',1),(2835,'ut imperdiet ultricies','ut imperdiet ultricies',0,1,1.7333,'U351634362',1),(2836,'ut lorem','ut lorem',0,1,1.2667,'U3465',1),(2837,'ut lorem lorem','ut lorem lorem',0,1,1.4667,'U3465465',1),(2838,'vel elit','vel elit',0,1,1.2667,'V430',1),(2839,'vel elit suspendisse','vel elit suspendisse',0,1,1.6667,'V4321532',1),(2840,'vel lorem','vel lorem',0,1,1.3,'V465',1),(2841,'vel lorem nulla','vel lorem nulla',0,1,1.5,'V4654',1),(2842,'velit eu','velit eu',0,1,1.2667,'V430',1),(2843,'velit eu vestibulum','velit eu vestibulum',0,1,1.6333,'V43123145',1),(2844,'vestibulum diam','vestibulum diam',0,1,1.5,'V2314535',1),(2845,'vestibulum diam est','vestibulum diam est',0,1,1.6333,'V231453523',1),(2846,'vestibulum justo','vestibulum justo',0,1,1.5333,'V2314523',1),(2847,'vestibulum justo lectus','vestibulum justo lectus',0,1,1.7667,'V23145234232',1),(2848,'vitae nisl','vita nisl',0,1,1.3333,'V3524',1),(2849,'vitae nisl tempus','vita nisl tempus',0,1,1.5667,'V35243512',1),(2850,'volutpat integer ac','volutpat integer ac',0,1,1.6333,'V431353262',1),(2851,'volutpat magna','volutpat magna',0,1,1.4667,'V4313525',1),(2852,'volutpat magna pellentesque','volutpat magna pellentesque',0,1,1.9,'V431352514532',1),(2853,'31','31',0,0,0.2,'',2),(2854,'a lobortis','a lobortis',0,1,1.3333,'A41632',8),(2855,'a lobortis mi','a lobortis mi',0,1,1.4333,'A416325',8),(2856,'a tristique','a tristique',0,1,1.3667,'A36232',8),(2857,'a tristique neque','a tristique neque',0,1,1.5667,'A3623252',8),(2858,'ac mauris','ac mauris',0,1,1.3,'A2562',8),(2859,'ac mauris scelerisque','ac mauris scelerisque',0,1,1.7,'A2562462',8),(2860,'ac nisl','ac nisl',0,1,1.2333,'A2524',8),(2861,'ac nisl integer','ac nisl integer',0,1,1.5,'A25245326',8),(2862,'accumsan cras','accumsan cras',0,1,1.4333,'A2525262',8),(2863,'accumsan cras mollis','accumsan cras mollis',0,1,1.6667,'A2525262542',8),(2864,'adipiscing dolor','adipisc dolor',0,1,1.5333,'A31252346',8),(2865,'adipiscing dolor eget','adipisc dolor eget',0,1,1.7,'A3125234623',8),(2866,'adipiscing massa','adipisc massa',0,1,1.5333,'A3125252',8),(2867,'adipiscing massa ut','adipisc massa ut',0,1,1.6333,'A31252523',8),(2868,'aliquet eget','aliquet eget',0,1,1.4,'A42323',8),(2869,'aliquet eget integer','aliquet eget integer',0,1,1.6667,'A423235326',8),(2870,'aliquet ornare','aliquet ornare',0,1,1.4667,'A423656',8),(2871,'aliquet ornare sed','aliquet ornare sed',0,1,1.6,'A42365623',8),(2872,'amet fermentum','amet fermentum',0,1,1.4667,'A5316535',8),(2873,'amet fermentum egestas','amet fermentum egestas',0,1,1.7333,'A5316535232',8),(2874,'amet ullamcorper','amet ullamcorper',0,1,1.5333,'A53452616',8),(2875,'amet ullamcorper ullamcorper','amet ullamcorper ullamcorper',0,1,1.9333,'A53452616452616',8),(2876,'amet urna','amet urna',0,1,1.3,'A5365',8),(2877,'amet urna proin','amet urna proin',0,1,1.5,'A5365165',8),(2878,'ante aliquet eget','ant aliquet eget',0,1,1.5667,'A5342323',8),(2879,'auctor ante','auctor ante',0,1,1.3667,'A23653',8),(2880,'auctor ante aliquet','auctor ante aliquet',0,1,1.6333,'A23653423',8),(2881,'augue ullamcorper','augu ullamcorper',0,1,1.5667,'A2452616',8),(2882,'augue ullamcorper dui','augu ullamcorper dui',0,1,1.7,'A24526163',8),(2883,'commodo dictum','commodo dictum',0,1,1.4667,'C53235',8),(2884,'commodo dictum non','commodo dictum non',0,1,1.6,'C53235',8),(2885,'commodo libero','commodo libero',0,1,1.4667,'C53416',8),(2886,'commodo libero gravida','commodo libero gravida',0,1,1.7333,'C534162613',8),(2887,'congue eget','congu eget',0,1,1.3667,'C523',8),(2888,'congue eget praesent','congu eget praesent',0,1,1.6667,'C52316253',8),(2889,'consectetur purus','consectetur purus',0,1,1.5667,'C5236162',8),(2890,'consectetur purus molestie','consectetur purus molestie',0,1,1.8667,'C52361625423',8),(2891,'consectetur quam','consectetur quam',0,1,1.5333,'C523625',8),(2892,'consectetur quam sit','consectetur quam sit',0,1,1.6667,'C52362523',8),(2893,'consectetur vivamus','consectetur vivamus',0,1,1.6333,'C5236152',8),(2894,'consectetur vivamus varius','consectetur vivamus varius',0,1,1.8667,'C5236152162',8),(2895,'consequat adipiscing','consequat adipiscing',0,1,1.6667,'C5231252',8),(2896,'consequat adipiscing massa','consequat adipiscing massa',0,1,1.8667,'C523125252',8),(2897,'convallis sapien','conval sapien',0,1,1.5333,'C514215',8),(2898,'convallis sapien congue','conval sapien congue',0,1,1.7667,'C514215252',8),(2899,'cras mollis','cra mollis',0,1,1.3667,'C62542',8),(2900,'cras mollis eros','cra mollis eros',0,1,1.5333,'C6254262',8),(2901,'cursus quam','cursu quam',0,1,1.3667,'C625',8),(2902,'cursus quam a','cursu quam a',0,1,1.4333,'C625',8),(2903,'cursus sagittis','cursu sagittis',0,1,1.5,'C6232',8),(2904,'cursus sagittis eget','cursu sagittis eget',0,1,1.6667,'C62323',8),(2905,'dapibus quis placerat','dapibu quis placerat',0,1,1.7,'D1214263',8),(2906,'diam augue','diam augue',0,1,1.3333,'D520',8),(2907,'diam augue ullamcorper','diam augue ullamcorper',0,1,1.7333,'D52452616',8),(2908,'dictum non eget','dictum non eget',0,1,1.5,'D23523',8),(2909,'dignissim elit et','dignissim elit et',0,1,1.5667,'D252543',8),(2910,'dolor eget erat','dolor eget erat',0,1,1.5,'D462363',8),(2911,'dolor orci','dolor orci',0,1,1.3333,'D462',8),(2912,'dolor orci facilisis','dolor orci facilisis',0,1,1.6667,'D4621242',8),(2913,'dui a','dui a',0,1,1.1667,'D000',8),(2914,'dui a tristique','dui a tristique',0,1,1.5,'D6232',8),(2915,'dui est','dui est',0,1,1.2333,'D230',8),(2916,'dui est cursus','dui est cursus',0,1,1.4667,'D23262',8),(2917,'duis dignissim','dui dignissim',0,1,1.4667,'D232525',8),(2918,'duis dignissim elit','dui dignissim elit',0,1,1.6333,'D23252543',8),(2919,'duis in','dui in',0,1,1.2333,'D250',8),(2920,'duis in libero','dui in libero',0,1,1.4667,'D25416',8),(2921,'egestas diam','egesta diam',0,1,1.4,'E23235',8),(2922,'egestas diam augue','egesta diam augue',0,1,1.6,'E232352',8),(2923,'eget erat','eget erat',0,1,1.3,'E2363',8),(2924,'eget erat ullamcorper','eget erat ullamcorper',0,1,1.7,'E2363452616',8),(2925,'eget integer','eget integer',0,1,1.4,'E235326',8),(2926,'eget integer nec','eget integer nec',0,1,1.5333,'E23532652',8),(2927,'eget interdum','eget interdum',0,1,1.4333,'E2353635',8),(2928,'eget interdum turpis','eget interdum turpis',0,1,1.6667,'E23536353612',8),(2929,'eget justo vivamus','eget justo vivamus',0,1,1.6,'E2323152',8),(2930,'eget praesent','eget praesent',0,1,1.4333,'E2316253',8),(2931,'eget praesent dolor','eget praesent dolor',0,1,1.6333,'E231625346',8),(2932,'eget ut','eget ut',0,1,1.2333,'E230',8),(2933,'eget ut nunc','eget ut nunc',0,1,1.4,'E2352',8),(2934,'elementum commodo','elementum commodo',0,1,1.5667,'E4535253',8),(2935,'elementum commodo libero','elementum commodo libero',0,1,1.8,'E4535253416',8),(2936,'elit et','elit et',0,1,1.2333,'E430',8),(2937,'elit et velit','elit et velit',0,1,1.4333,'E43143',8),(2938,'enim nec','enim nec',0,1,1.2667,'E520',8),(2939,'enim nec sapien','enim nec sapien',0,1,1.5,'E5215',8),(2940,'erat accumsan','erat accumsan',0,1,1.4333,'E632525',8),(2941,'erat accumsan cras','erat accumsan cras',0,1,1.6,'E632525262',8),(2942,'erat ullamcorper','erat ullamcorper',0,1,1.5333,'E63452616',8),(2943,'erat ullamcorper sed','erat ullamcorper sed',0,1,1.6667,'E6345261623',8),(2944,'eros mollis','ero mollis',0,1,1.3667,'E62542',8),(2945,'eros mollis nisl','ero mollis nisl',0,1,1.5333,'E62542524',8),(2946,'est cursus','est cursus',0,1,1.3333,'E23262',8),(2947,'est cursus quam','est cursus quam',0,1,1.5,'E232625',8),(2948,'et dapibus','et dapibus',0,1,1.3333,'E312',8),(2949,'et dapibus quis','et dapibus quis',0,1,1.5,'E312',8),(2950,'et velit','et velit',0,1,1.2667,'E3143',8),(2951,'et velit cursus','et velit cursus',0,1,1.5,'E3143262',8),(2952,'euismod erat','euismod erat',0,1,1.4,'E25363',8),(2953,'euismod erat accumsan','euismod erat accumsan',0,1,1.7,'E253632525',8),(2954,'facilisis et dapibus','facilisi et dapibus',0,1,1.6667,'F242312',8),(2955,'felis aliquet','feli aliquet',0,1,1.4333,'F42423',8),(2956,'felis aliquet ornare','feli aliquet ornare',0,1,1.6667,'F42423656',8),(2957,'fermentum egestas','fermentum egestas',0,1,1.5667,'F6535232',8),(2958,'fermentum egestas diam','fermentum egestas diam',0,1,1.7333,'F653523235',8),(2959,'feugiat non','feugiat non',0,1,1.3667,'F235',8),(2960,'feugiat non euismod','feugiat non euismod',0,1,1.6333,'F235253',8),(2961,'fusce interdum','fusc interdum',0,1,1.4667,'F253635',8),(2962,'fusce interdum turpis','fusc interdum turpis',0,1,1.7,'F2536353612',8),(2963,'george','georg',0,0,0.4,'G620',2),(2964,'george martin','georg martin',0,1,1.4333,'G625635',2),(2965,'george martin demolink','georg martin demolink',0,1,1.7333,'G62563535452',1),(2966,'gravida tincidunt','gravida tincidunt',0,1,1.5667,'G61352353',8),(2967,'gravida tincidunt in','gravida tincidunt in',0,1,1.6667,'G613523535',8),(2968,'gravida tristique','gravida tristique',0,1,1.5667,'G6136232',8),(2969,'gravida tristique vehicula','gravida tristique vehicula',0,1,1.8667,'G6136232124',8),(2970,'hendrerit eget','hendrerit eget',0,1,1.4667,'H536323',8),(2971,'hendrerit eget interdum','hendrerit eget interdum',0,1,1.7667,'H53632353635',8),(2972,'in consequat','in consequat',0,1,1.4,'I52523',8),(2973,'in consequat adipiscing','in consequat adipiscing',0,1,1.7667,'I525231252',8),(2974,'integer gravida','integ gravida',0,1,1.5,'I53262613',8),(2975,'integer gravida tristique','integ gravida tristique',0,1,1.8333,'I532626136232',8),(2976,'integer nec','integ nec',0,1,1.3667,'I532652',8),(2977,'integer nec nibh','integ nec nibh',0,1,1.5333,'I53265251',8),(2978,'interdum turpis','interdum turpis',0,1,1.5,'I536353612',8),(2979,'interdum turpis consectetur','interdum turpis consectetur',0,1,1.9,'I5363536125236',8),(2980,'interdum turpis sit','interdum turpis sit',0,1,1.6333,'I5363536123',8),(2981,'ipsum fusce','ipsum fusce',0,1,1.3667,'I12512',8),(2982,'ipsum fusce interdum','ipsum fusce interdum',0,1,1.6667,'I1251253635',8),(2983,'ipsum sed','ipsum sed',0,1,1.3,'I12523',8),(2984,'ipsum sed auctor','ipsum sed auctor',0,1,1.5333,'I12523236',8),(2985,'justo vivamus adipiscing','justo vivamus adipiscing',0,1,1.8,'J315231252',8),(2986,'leo nunc','leo nunc',0,1,1.2667,'L520',8),(2987,'leo nunc pharetra','leo nunc pharetra',0,1,1.5667,'L521636',8),(2988,'libero gravida','libero gravida',0,1,1.4667,'L162613',8),(2989,'libero gravida tincidunt','libero gravida tincidunt',0,1,1.8,'L16261352353',8),(2990,'libero ipsum fusce','libero ipsum fusce',0,1,1.6,'L1612512',8),(2991,'ligula hendrerit','ligula hendrerit',0,1,1.5333,'L245363',8),(2992,'ligula hendrerit eget','ligula hendrerit eget',0,1,1.7,'L24536323',8),(2993,'lobortis mi','loborti mi',0,1,1.3667,'L16325',8),(2994,'lobortis mi urna','loborti mi urna',0,1,1.5333,'L1632565',8),(2995,'luctus nunc tincidunt','luctu nunc tincidunt',0,1,1.7,'L23252352353',8),(2996,'magna duis','magna duis',0,1,1.3333,'M2532',8),(2997,'magna duis in','magna duis in',0,1,1.4333,'M25325',8),(2998,'martin','martin',0,0,0.4,'M635',2),(2999,'martin demolink','martin demolink',0,1,1.5,'M63535452',1),(3000,'martin demolink org','martin demolink org',0,1,1.6333,'M6353545262',1),(3001,'massa ut','massa ut',0,1,1.2667,'M230',8),(3002,'massa ut convallis','massa ut convallis',0,1,1.6,'M2325142',8),(3003,'mauris luctus','mauri luctus',0,1,1.4333,'M624232',8),(3004,'mauris luctus nunc','mauri luctus nunc',0,1,1.6,'M62423252',8),(3005,'mauris scelerisque','mauri scelerisque',0,1,1.6,'M62462',8),(3006,'mauris scelerisque metus','mauri scelerisque metus',0,1,1.8,'M62462532',8),(3007,'metus commodo','metu commodo',0,1,1.4333,'M3253',8),(3008,'metus commodo dictum','metu commodo dictum',0,1,1.6667,'M3253235',8),(3009,'metus ornare','metu ornare',0,1,1.4,'M32656',8),(3010,'metus ornare praesent','metu ornare praesent',0,1,1.7,'M3265616253',8),(3011,'mi urna','mi urna',0,1,1.2333,'M650',8),(3012,'mi urna sit','mi urna sit',0,1,1.3667,'M6523',8),(3013,'molestie viverra','molesti viverra',0,1,1.5333,'M42316',8),(3014,'molestie viverra sed','molesti viverra sed',0,1,1.6667,'M4231623',8),(3015,'mollis eros','molli eros',0,1,1.3667,'M4262',8),(3016,'mollis eros mollis','molli eros mollis',0,1,1.6,'M4262542',8),(3017,'mollis nisl','molli nisl',0,1,1.3667,'M42524',8),(3018,'mollis nisl scelerisque','molli nisl scelerisque',0,1,1.7667,'M425242462',8),(3019,'mollis ultrices','molli ultrices',0,1,1.5,'M424362',8),(3020,'mollis ultrices felis','molli ultrices felis',0,1,1.7,'M424362142',8),(3021,'nec nibh','nec nibh',0,1,1.2667,'N251',8),(3022,'nec nibh consectetur','nec nibh consectetur',0,1,1.6667,'N25125236',8),(3023,'nec sapien','nec sapien',0,1,1.3333,'N215',8),(3024,'nec sapien feugiat','nec sapien feugiat',0,1,1.6,'N215123',8),(3025,'neque nibh','nequ nibh',0,1,1.3333,'N251',8),(3026,'neque nibh vitae','nequ nibh vitae',0,1,1.5333,'N2513',8),(3027,'nibh consectetur','nibh consectetur',0,1,1.5333,'N125236',8),(3028,'nibh consectetur purus','nibh consectetur purus',0,1,1.7333,'N125236162',8),(3029,'nibh vitae','nibh vitae',0,1,1.3333,'N130',8),(3030,'nibh vitae leo','nibh vitae leo',0,1,1.4667,'N134',8),(3031,'nisl integer','nisl integer',0,1,1.4,'N245326',8),(3032,'nisl integer gravida','nisl integer gravida',0,1,1.6667,'N2453262613',8),(3033,'nisl scelerisque','nisl scelerisque',0,1,1.5333,'N242462',8),(3034,'nisl scelerisque pretium','nisl scelerisque pretium',0,1,1.8,'N2424621635',8),(3035,'non eget','non eget',0,1,1.2667,'N230',8),(3036,'non eget justo','non eget justo',0,1,1.4667,'N2323',8),(3037,'non euismod','non euismod',0,1,1.3667,'N253',8),(3038,'non euismod erat','non euismod erat',0,1,1.5333,'N25363',8),(3039,'nunc mauris','nunc mauris',0,1,1.3667,'N2562',8),(3040,'nunc mauris luctus','nunc mauris luctus',0,1,1.6,'N25624232',8),(3041,'nunc pharetra','nunc pharetra',0,1,1.4333,'N21636',8),(3042,'nunc pharetra enim','nunc pharetra enim',0,1,1.6,'N216365',8),(3043,'nunc tincidunt','nunc tincidunt',0,1,1.4667,'N2352353',8),(3044,'nunc tincidunt ligula','nunc tincidunt ligula',0,1,1.7,'N2352353424',8),(3045,'orci facilisis','orci facilisis',0,1,1.4667,'O621242',8),(3046,'orci facilisis et','orci facilisis et',0,1,1.5667,'O6212423',8),(3047,'ornare placerat','ornar placerat',0,1,1.5,'O65614263',8),(3048,'ornare placerat ipsum','ornar placerat ipsum',0,1,1.7,'O65614263125',8),(3049,'ornare praesent','ornar praesent',0,1,1.5,'O65616253',8),(3050,'ornare praesent ornare','ornar praesent ornare',0,1,1.7333,'O65616253656',8),(3051,'ornare sed','ornar sed',0,1,1.3333,'O65623',8),(3052,'ornare sed consectetur','ornar sed consectetur',0,1,1.7333,'O6562325236',8),(3053,'pharetra enim','pharetra enim',0,1,1.4333,'P6365',8),(3054,'pharetra enim nec','pharetra enim nec',0,1,1.5667,'P63652',8),(3055,'placerat ipsum','placerat ipsum',0,1,1.4667,'P4263125',8),(3056,'placerat ipsum sed','placerat ipsum sed',0,1,1.6,'P426312523',8),(3057,'placerat ut','placerat ut',0,1,1.3667,'P4263',8),(3058,'placerat ut magna','placerat ut magna',0,1,1.5667,'P4263525',8),(3059,'praesent dolor','praesent dolor',0,1,1.4667,'P625346',8),(3060,'praesent dolor orci','praesent dolor orci',0,1,1.6333,'P6253462',8),(3061,'praesent ornare','praesent ornare',0,1,1.5,'P6253656',8),(3062,'praesent ornare placerat','praesent ornare placerat',0,1,1.8,'P625365614263',8),(3063,'pretium george','pretium george',0,1,1.4667,'P635262',1),(3064,'pretium george martin','pretium george martin',0,1,1.7,'P6352625635',1),(3065,'proin ac','proin ac',0,1,1.2667,'P652',8),(3066,'proin ac mauris','proin ac mauris',0,1,1.5,'P652562',8),(3067,'purus molestie','puru molestie',0,1,1.4667,'P625423',8),(3068,'purus molestie viverra','puru molestie viverra',0,1,1.7333,'P62542316',8),(3069,'quam a','quam a',0,1,1.2,'Q500',8),(3070,'quam a lobortis','quam a lobortis',0,1,1.5,'Q541632',8),(3071,'quam sit','quam sit',0,1,1.2667,'Q523',8),(3072,'quam sit amet','quam sit amet',0,1,1.4333,'Q52353',8),(3073,'quis placerat','qui placerat',0,1,1.4333,'Q14263',8),(3074,'quis placerat ut','qui placerat ut',0,1,1.5333,'Q14263',8),(3075,'sagittis eget','sagitti eget',0,1,1.4333,'S323',8),(3076,'sagittis eget ut','sagitti eget ut',0,1,1.5333,'S323',8),(3077,'sapien congue','sapien congue',0,1,1.4333,'S15252',8),(3078,'sapien congue eget','sapien congue eget',0,1,1.6,'S152523',8),(3079,'sapien feugiat','sapien feugiat',0,1,1.4667,'S15123',8),(3080,'sapien feugiat non','sapien feugiat non',0,1,1.6,'S151235',8),(3081,'scelerisque metus','scelerisqu metus',0,1,1.5667,'S462532',8),(3082,'scelerisque metus commodo','scelerisqu metus commodo',0,1,1.8333,'S46253253',8),(3083,'scelerisque pretium george','scelerisqu pretium george',0,1,1.8667,'S4621635262',1),(3084,'sed ac','sed ac',0,1,1.2,'S320',8),(3085,'sed ac nisl','sed ac nisl',0,1,1.3667,'S32524',8),(3086,'sed auctor','sed auctor',0,1,1.3333,'S3236',8),(3087,'sed auctor ante','sed auctor ante',0,1,1.5,'S323653',8),(3088,'sed consectetur quam','sed consectetur quam',0,1,1.6667,'S32523625',8),(3089,'sed tincidunt','sed tincidunt',0,1,1.4333,'S352353',8),(3090,'sed tincidunt metus','sed tincidunt metus',0,1,1.6333,'S352353532',8),(3091,'sem elementum','sem elementum',0,1,1.4333,'S54535',8),(3092,'sem elementum commodo','sem elementum commodo',0,1,1.7,'S54535253',8),(3093,'sit amet fermentum','sit amet fermentum',0,1,1.6,'S35316535',8),(3094,'sit amet ullamcorper','sit amet ullamcorper',0,1,1.6667,'S353452616',8),(3095,'sit amet urna','sit amet urna',0,1,1.4333,'S35365',8),(3096,'tincidunt in','tincidunt in',0,1,1.4,'T523535',8),(3097,'tincidunt in consequat','tincidunt in consequat',0,1,1.7333,'T5235352523',8),(3098,'tincidunt ligula','tincidunt ligula',0,1,1.5333,'T52353424',8),(3099,'tincidunt ligula hendrerit','tincidunt ligula hendrerit',0,1,1.8667,'T523534245363',8),(3100,'tincidunt metus','tincidunt metus',0,1,1.5,'T52353532',8),(3101,'tincidunt metus ornare','tincidunt metus ornare',0,1,1.7333,'T52353532656',8),(3102,'tristique neque','tristiqu neque',0,1,1.5,'T623252',8),(3103,'tristique neque nibh','tristiqu neque nibh',0,1,1.6667,'T62325251',8),(3104,'tristique vehicula','tristiqu vehicula',0,1,1.6,'T6232124',8),(3105,'tristique vehicula duis','tristiqu vehicula duis',0,1,1.7667,'T623212432',8),(3106,'turpis consectetur','turpi consectetur',0,1,1.6,'T6125236',8),(3107,'turpis consectetur vivamus','turpi consectetur vivamus',0,1,1.8667,'T6125236152',8),(3108,'turpis sit','turpi sit',0,1,1.3333,'T6123',8),(3109,'turpis sit amet','turpi sit amet',0,1,1.5,'T612353',8),(3110,'ullamcorper dui','ullamcorp dui',0,1,1.5,'U4526163',8),(3111,'ullamcorper dui a','ullamcorp dui a',0,1,1.5667,'U4526163',8),(3112,'ullamcorper dui est','ullamcorp dui est',0,1,1.6333,'U452616323',8),(3113,'ullamcorper sed','ullamcorp sed',0,1,1.5,'U45261623',8),(3114,'ullamcorper sed tincidunt','ullamcorp sed tincidunt',0,1,1.8333,'U4526162352353',8),(3115,'ullamcorper ullamcorper','ullamcorp ullamcorper',0,1,1.7667,'U452616452616',8),(3116,'ullamcorper ullamcorper dui','ullamcorp ullamcorper dui',0,1,1.9,'U4526164526163',8),(3117,'ultrices felis','ultric felis',0,1,1.4667,'U4362142',8),(3118,'ultrices felis aliquet','ultric felis aliquet',0,1,1.7333,'U4362142423',8),(3119,'ultricies sem elementum','ultrici sem elementum',0,1,1.7667,'U436254535',8),(3120,'urna proin','urna proin',0,1,1.3333,'U65165',8),(3121,'urna proin ac','urna proin ac',0,1,1.4333,'U651652',8),(3122,'urna sit','urna sit',0,1,1.2667,'U6523',8),(3123,'urna sit amet','urna sit amet',0,1,1.4333,'U652353',8),(3124,'ut convallis','ut convallis',0,1,1.4,'U325142',8),(3125,'ut convallis sapien','ut convallis sapien',0,1,1.6333,'U32514215',8),(3126,'ut magna','ut magna',0,1,1.2667,'U3525',8),(3127,'ut magna duis','ut magna duis',0,1,1.4333,'U352532',8),(3128,'ut mollis','ut mollis',0,1,1.3,'U3542',8),(3129,'ut mollis ultrices','ut mollis ultrices',0,1,1.6,'U35424362',8),(3130,'ut nunc','ut nunc',0,1,1.2333,'U352',8),(3131,'ut nunc mauris','ut nunc mauris',0,1,1.4667,'U352562',8),(3132,'varius ultricies','variu ultricies',0,1,1.5333,'V624362',8),(3133,'varius ultricies sem','variu ultricies sem',0,1,1.6667,'V6243625',8),(3134,'vehicula duis','vehicula duis',0,1,1.4333,'V2432',8),(3135,'vehicula duis dignissim','vehicula duis dignissim',0,1,1.7667,'V243232525',8),(3136,'velit cursus','velit cursus',0,1,1.4,'V43262',8),(3137,'velit cursus sagittis','velit cursus sagittis',0,1,1.7,'V4326232',8),(3138,'vitae leo','vita leo',0,1,1.3,'V340',8),(3139,'vitae leo nunc','vita leo nunc',0,1,1.4667,'V3452',8),(3140,'vivamus adipiscing','vivamu adipiscing',0,1,1.6,'V5231252',8),(3141,'vivamus adipiscing dolor','vivamu adipiscing dolor',0,1,1.8,'V5231252346',8),(3142,'vivamus varius','vivamu varius',0,1,1.4667,'V52162',8),(3143,'vivamus varius ultricies','vivamu varius ultricies',0,1,1.8,'V521624362',8),(3144,'viverra sed','viverra sed',0,1,1.3667,'V623',8),(3145,'viverra sed ac','viverra sed ac',0,1,1.4667,'V6232',8),(3146,'22','22',0,0,0.2,'',5),(3147,'28','28',0,0,0.2,'',1),(4698,'later the','later the',0,1,1.3,'L363',4),(3149,'aconel','aconel',0,0,0.4,'A254',38),(3150,'aconel auris','aconel auris',0,1,1.4,'A25462',38),(3151,'aconel auris fermentus','aconel auris fermentus',0,1,1.7333,'A2546216532',38),(3152,'aloecenase','aloecenas',0,0,0.6667,'A4252',38),(3153,'aloecenase magna','aloecenas magna',0,1,1.5333,'A4252525',38),(3154,'aloecenase magna onec','aloecenas magna onec',0,1,1.7,'A42525252',38),(3155,'aserase','aseras',0,0,0.4667,'A262',33),(3156,'aserase elit','aseras elit',0,1,1.4,'A26243',33),(3157,'aserase elit enean','aseras elit enean',0,1,1.6,'A262435',19),(3158,'auctor wisi','auctor wisi',0,1,1.3667,'A2362',23),(3159,'auctor wisi et','auctor wisi et',0,1,1.4667,'A23623',23),(3160,'auris','auri',0,0,0.3333,'A620',38),(3161,'auris fermentus','auri fermentus',0,1,1.5,'A6216532',38),(3162,'auris fermentus dear','auri fermentus dear',0,1,1.6667,'A621653236',38),(3163,'baselei','baselei',0,0,0.4667,'B240',33),(3164,'baselei fender','baselei fender',0,1,1.4667,'B241536',33),(3165,'baselei fender aserase','baselei fender aserase',0,1,1.7333,'B241536262',33),(3166,'cumsan','cumsan',0,0,0.4,'C525',38),(3167,'cumsan maleasit','cumsan maleasit',0,1,1.5,'C525423',38),(3168,'cumsan maleasit aconel','cumsan maleasit aconel',0,1,1.7333,'C525423254',38),(3169,'dapibus eget','dapibu eget',0,1,1.4,'D123',33),(3170,'dapibus eget ensus','dapibu eget ensus',0,1,1.6,'D12352',19),(3171,'dear','dear',0,0,0.2667,'D600',38),(3172,'dear laoraliquam','dear laoraliquam',0,1,1.5333,'D646425',38),(3173,'dear laoraliquam leo','dear laoraliquam leo',0,1,1.6667,'D6464254',38),(3174,'dolor dapibus','dolor dapibus',0,1,1.4333,'D46312',33),(3175,'dolor dapibus eget','dolor dapibus eget',0,1,1.6,'D463123',33),(3176,'eget ensus','eget ensus',0,1,1.3333,'E2352',19),(3177,'eget ensus baselei','eget ensus baselei',0,1,1.6,'E2352124',19),(3178,'elit enean','elit enean',0,1,1.3333,'E435',19),(3179,'elit enean auctor','elit enean auctor',0,1,1.5667,'E435236',19),(3180,'enean','enean',0,0,0.3333,'E500',19),(3181,'enean auctor','enean auctor',0,1,1.4,'E5236',19),(3182,'enean auctor wisi','enean auctor wisi',0,1,1.5667,'E52362',19),(3183,'ensus','ensu',0,0,0.3333,'E520',19),(3184,'ensus baselei','ensu baselei',0,1,1.4333,'E52124',19),(3185,'ensus baselei fender','ensu baselei fender',0,1,1.6667,'E521241536',19),(3186,'fender','fender',0,0,0.4,'F536',33),(3187,'fender aserase','fender aserase',0,1,1.4667,'F536262',33),(3188,'fender aserase elit','fender aserase elit',0,1,1.6333,'F53626243',33),(3189,'fermentus','fermentu',0,0,0.6,'F6532',38),(3190,'fermentus dear','fermentu dear',0,1,1.4667,'F653236',38),(3191,'fermentus dear laoraliquam','fermentu dear laoraliquam',0,1,1.8667,'F65323646425',38),(3192,'iaser','iaser',0,0,0.3333,'I260',29),(3193,'laoraliquam','laoraliquam',0,0,0.7333,'L6425',38),(3194,'laoraliquam leo','laoraliquam leo',0,1,1.5,'L64254',38),(3195,'laoraliquam leo utellusereser','laoraliquam leo utellusereser',0,1,1.9667,'L64254342626',33),(3196,'leo utellusereser','leo utellusereser',0,1,1.5667,'L342626',33),(3197,'leo utellusereser dolor','leo utellusereser dolor',0,1,1.7667,'L342626346',33),(3198,'magna onec','magna onec',0,1,1.3333,'M252',38),(3199,'magna onec cumsan','magna onec cumsan',0,1,1.5667,'M252525',38),(3200,'maleasit','maleasit',0,0,0.5333,'M423',38),(3201,'maleasit aconel','maleasit aconel',0,1,1.5,'M423254',38),(3202,'maleasit aconel auris','maleasit aconel auris',0,1,1.7,'M42325462',38),(3203,'nasetat','nasetat',0,0,0.4667,'N230',45),(3204,'nasetat iaser','nasetat iaser',0,1,1.4333,'N2326',29),(3205,'onec','onec',0,0,0.2667,'O520',38),(3206,'onec cumsan','onec cumsan',0,1,1.3667,'O52525',38),(3207,'onec cumsan maleasit','onec cumsan maleasit',0,1,1.6667,'O52525423',38),(3208,'utellusereser','utelluseres',0,0,0.8667,'U342626',33),(3209,'utellusereser dolor','utelluseres dolor',0,1,1.6333,'U342626346',33),(3210,'utellusereser dolor dapibus','utelluseres dolor dapibus',0,1,1.9,'U342626346312',33),(3211,'wisi','wisi',0,0,0.2667,'W200',23),(3212,'wisi et','wisi et',0,1,1.2333,'W230',23),(3213,'wisi et urna','wisi et urna',0,1,1.4,'W2365',23),(3214,'37','37',0,0,0.2,'',2),(3215,'ac lorem praesent','ac lorem praesent',0,1,1.5667,'A246516253',10),(3216,'agslelu','agslelu',0,0,0.4667,'A240',10),(3217,'agslelu msie','agslelu msie',0,1,1.4,'A2452',10),(3218,'agslelu msie lroem','agslelu msie lroem',0,1,1.6,'A2452465',10),(3219,'aserase elit praesent','aseras elit praesent',0,1,1.7,'A2624316253',10),(3220,'cras gravida','cra gravida',0,1,1.4,'C62613',2),(3221,'dapibus eget elemensus','dapibu eget elemensus',0,1,1.7333,'D123452',14),(3222,'digni','digni',0,0,0.3333,'D250',10),(3223,'dignis','digni',0,0,0.4,'D252',10),(3224,'dignis serat','digni serat',0,1,1.4,'D25263',10),(3225,'dignis serat samatrsus','digni serat samatrsus',0,1,1.7333,'D2526325362',10),(3226,'dignissim pulvinar','dignissim pulvinar',0,1,1.6,'D252514156',10),(3227,'dignissim pulvinar ac','dignissim pulvinar ac',0,1,1.7,'D2525141562',10),(3228,'dolor lobortis','dolor lobortis',0,1,1.4667,'D4641632',10),(3229,'dolor lobortis quis','dolor lobortis quis',0,1,1.6333,'D4641632',10),(3230,'eget elemensus','eget elemensus',0,1,1.4667,'E23452',14),(3231,'eget elemensus baselei','eget elemensus baselei',0,1,1.7333,'E23452124',14),(3232,'elemensus','elemensu',0,0,0.6,'E452',14),(3233,'elemensus baselei','elemensu baselei',0,1,1.5667,'E452124',14),(3234,'elemensus baselei fender','elemensu baselei fender',0,1,1.8,'E4521241536',14),(3235,'elit praesent','elit praesent',0,1,1.4333,'E4316253',10),(3236,'elit praesent justo','elit praesent justo',0,1,1.6333,'E431625323',10),(3237,'euctus','euctu',0,0,0.4,'E232',16),(3238,'euctus ste','euctu ste',0,1,1.3333,'E2323',10),(3239,'euctus ste psoet','euctu ste psoet',0,1,1.5333,'E2323123',10),(3240,'gaslelus','gaslelu',0,0,0.5333,'G420',10),(3241,'gaslelus aloecenase','gaslelu aloecenase',0,1,1.6333,'G424252',10),(3242,'gaslelus aloecenase magna','gaslelu aloecenase magna',0,1,1.8333,'G424252525',10),(3243,'iaserat','iaserat',0,0,0.4667,'I263',16),(3244,'iaserat samatrsus','iaserat samatrsus',0,1,1.5667,'I26325362',16),(3245,'iaserat samatrsus euctus','iaserat samatrsus euctus',0,1,1.8,'I2632536232',16),(3246,'justo dolor','justo dolor',0,1,1.3667,'J346',10),(3247,'justo dolor lobortis','justo dolor lobortis',0,1,1.6667,'J34641632',10),(3248,'lobortis digni','loborti digni',0,1,1.4667,'L1632325',10),(3249,'lobortis dignis','loborti dignis',0,1,1.5,'L16323252',10),(3250,'lobortis dignis serat','loborti dignis serat',0,1,1.7,'L1632325263',10),(3251,'lobortis dignissim','loborti dignissim',0,1,1.6,'L163232525',10),(3252,'lobortis dignissim pulvinar','loborti dignissim pulvinar',0,1,1.9,'L16323252514156',10),(3253,'lobortis quis','loborti quis',0,1,1.4333,'L1632',10),(3254,'lobortis quis lobortis','loborti quis lobortis',0,1,1.7333,'L163241632',10),(3255,'lorem praesent','lorem praesent',0,1,1.4667,'L6516253',10),(3256,'lorem praesent justo','lorem praesent justo',0,1,1.6667,'L651625323',10),(3257,'lroem','lroem',0,0,0.3333,'L650',10),(3258,'lroem port','lroem port',0,1,1.3333,'L65163',10),(3259,'lroem port gaslelus','lroem port gaslelus',0,1,1.6333,'L65163242',10),(3260,'lroem ster','lroem ster',0,1,1.3333,'L65236',10),(3261,'lroem ster pos','lroem ster pos',0,1,1.4667,'L6523612',10),(3262,'lroem ster poste','lroem ster poste',0,1,1.5333,'L65236123',10),(3263,'maet','maet',0,0,0.2667,'M300',10),(3264,'maet port','maet port',0,1,1.3,'M3163',10),(3265,'maet port agslelu','maet port agslelu',0,1,1.5667,'M316324',10),(3266,'mi8,sie','mi8,sie',0,0,0.4667,'M200',10),(3267,'mi8,sie lroem','mi8,sie lroem',0,1,1.4333,'M2465',10),(3268,'mi8,sie lroem port','mi8,sie lroem port',0,1,1.6,'M2465163',10),(3269,'msie','msie',0,0,0.2667,'M200',10),(3270,'msie lroem','msie lroem',0,1,1.3333,'M2465',10),(3271,'msie lroem ster','msie lroem ster',0,1,1.5,'M2465236',10),(3272,'nasetat iaserat','nasetat iaserat',0,1,1.5,'N23263',16),(3273,'nasetat iaserat samatrsus','nasetat iaserat samatrsus',0,1,1.8333,'N2326325362',16),(3274,'port','port',0,0,0.2667,'P630',14),(3275,'port agslelu','port agslelu',0,1,1.4,'P6324',10),(3276,'port agslelu msie','port agslelu msie',0,1,1.5667,'P632452',10),(3277,'port gaslelus','port gaslelus',0,1,1.4333,'P63242',10),(3278,'port gaslelus aloecenase','port gaslelus aloecenase',0,1,1.8,'P632424252',10),(3279,'pos','po',0,0,0.2,'P200',10),(3280,'pos aloecenase','po aloecenase',0,1,1.4667,'P24252',10),(3281,'pos aloecenase magna','po aloecenase magna',0,1,1.6667,'P24252525',10),(3282,'poste','post',0,0,0.3333,'P230',10),(3283,'poste quqn','post quqn',0,1,1.3333,'P2325',10),(3284,'poste quqn ster','post quqn ster',0,1,1.5,'P2325236',10),(3285,'praesent justo','praesent justo',0,1,1.4667,'P625323',10),(3286,'praesent justo dolor','praesent justo dolor',0,1,1.6667,'P62532346',10),(3287,'psoet','psoet',0,0,0.3333,'P230',10),(3288,'psoet aloecenase','psoet aloecenase',0,1,1.5333,'P234252',9),(3289,'psoet aloecenase magna','psoet aloecenase magna',0,1,1.7333,'P234252525',9),(3290,'psoet sren','psoet sren',0,1,1.3333,'P23265',10),(3291,'psoet sren maet','psoet sren maet',0,1,1.5,'P232653',10),(3292,'pulvinar ac','pulvinar ac',0,1,1.3667,'P41562',10),(3293,'pulvinar ac lorem','pulvinar ac lorem',0,1,1.5667,'P41562465',10),(3294,'quis lobortis','qui lobortis',0,1,1.4333,'Q41632',10),(3295,'quis lobortis digni','qui lobortis digni',0,1,1.6333,'Q41632325',10),(3296,'quis lobortis dignis','qui lobortis dignis',0,1,1.6667,'Q416323252',10),(3297,'quis lobortis dignissim','qui lobortis dignissim',0,1,1.7667,'Q4163232525',10),(3298,'quqn','quqn',0,0,0.2667,'Q500',10),(3299,'quqn ster','quqn ster',0,1,1.3,'Q5236',10),(3300,'quqn ster sren','quqn ster sren',0,1,1.4667,'Q5236265',10),(3301,'samatrsus','samatrsu',0,0,0.6,'S5362',16),(3302,'samatrsus euctus','samatrsu euctus',0,1,1.5333,'S536232',16),(3303,'samatrsus euctus ste','samatrsu euctus ste',0,1,1.6667,'S5362323',10),(3304,'serat','serat',0,0,0.3333,'S630',10),(3305,'serat samatrsus','serat samatrsus',0,1,1.5,'S6325362',10),(3306,'serat samatrsus euctus','serat samatrsus euctus',0,1,1.7333,'S632536232',10),(3307,'sren','sren',0,0,0.2667,'S650',10),(3308,'sren maet','sren maet',0,1,1.3,'S653',10),(3309,'sren maet port','sren maet port',0,1,1.4667,'S653163',10),(3310,'sren mi8,sie','sren mi8,sie',0,1,1.4,'S652',10),(3311,'sren mi8,sie lroem','sren mi8,sie lroem',0,1,1.6,'S652465',10),(3312,'ste','ste',0,0,0.2,'S300',10),(3313,'ste psoet','ste psoet',0,1,1.3,'S3123',10),(3314,'ste psoet aloecenase','ste psoet aloecenase',0,1,1.6667,'S31234252',9),(3315,'ste psoet sren','ste psoet sren',0,1,1.4667,'S3123265',10),(3316,'ster','ster',0,0,0.2667,'S360',10),(3317,'ster pos','ster pos',0,1,1.2667,'S3612',10),(3318,'ster pos aloecenase','ster pos aloecenase',0,1,1.6333,'S36124252',10),(3319,'ster poste','ster poste',0,1,1.3333,'S36123',10),(3320,'ster poste quqn','ster poste quqn',0,1,1.5,'S3612325',10),(3321,'ster sren','ster sren',0,1,1.3,'S36265',10),(3322,'ster sren mi8,sie','ster sren mi8,sie',0,1,1.5667,'S362652',10),(3323,'38','38',0,0,0.2,'',2),(3324,'50','50',0,0,0.2,'',1),(3325,'51','51',0,0,0.2,'',1),(3326,'etiam eu','etiam eu',0,1,1.2667,'E350',1),(3327,'etiam eu nisl','etiam eu nisl',0,1,1.4333,'E3524',1),(3328,'eu nisl','eu nisl',0,1,1.2333,'E524',1),(4697,'later','later',0,0,0.3333,'L360',4),(4696,'late 19th century','late 19th century',0,1,1.5667,'L32536',4),(4695,'late 19th','late 19th',0,1,1.3,'L300',4),(4694,'late','late',0,0,0.2667,'L300',4),(4693,'largest port in','largest port in',0,1,1.5,'L6231635',4),(4692,'largest port','largest port',0,1,1.4,'L623163',4),(4691,'largest','largest',0,0,0.4667,'L623',4),(4690,'land they fought','land they fought',0,1,1.5333,'L53123',4),(4689,'land they','land they',0,1,1.3,'L530',4),(4688,'land','land',0,0,0.2667,'L530',4),(4687,'lake later the','lake later the',0,1,1.4667,'L24363',4),(4686,'lake later','lake later',0,1,1.3333,'L2436',4),(4685,'lake','lake',0,0,0.2667,'L200',4),(4684,'koxinga\'s forces the','koxinga forces the',0,1,1.6667,'K521623',4),(4683,'koxinga\'s forces','koxinga forces',0,1,1.5333,'K52162',4),(4682,'koxinga\'s','koxinga',0,0,0.6,'K520',4),(4681,'koxinga who was','koxinga who was',0,1,1.5,'K520',4),(4680,'koxinga who','koxinga who',0,1,1.3667,'K520',4),(4679,'koxinga','koxinga',0,0,0.4667,'K520',4),(4678,'known as the','known as the',0,1,1.4,'K523',4),(4677,'known as','known as',0,1,1.2667,'K520',4),(4676,'known','known',0,0,0.3333,'K500',4),(4675,'ketagalan group belonging','ketagalan group belonging',0,1,1.8333,'K324526145252',4),(4674,'ketagalan group','ketagalan group',0,1,1.5,'K3245261',4),(4673,'ketagalan','ketagalan',0,0,0.6,'K3245',4),(4672,'keelung and built','keelung and built',0,1,1.5667,'K45253143',4),(4671,'keelung and','keelung and',0,1,1.3667,'K45253',4),(4670,'keelung','keelung',0,0,0.4667,'K452',4),(4669,'japanese colony until','japanes colony until',0,1,1.7,'J1524534',4),(4668,'japanese colony in','japanes colony in',0,1,1.6,'J15245',4),(3367,'aliquam erat volutpat','aliquam erat volutpat',0,1,1.7,'A4256314313',4),(4667,'japanese colony','japanes colony',0,1,1.5,'J15245',4),(4666,'japanese','japanes',0,0,0.5333,'J152',4),(4665,'island with ming','island with ming',0,1,1.5333,'I245352',4),(4664,'island with','island with',0,1,1.3667,'I2453',4),(4663,'island','island',0,0,0.4,'I2453',4),(4662,'invaded south taiwan','invad south taiwan',0,1,1.6667,'I513235',4),(4661,'invaded south','invad south',0,1,1.4333,'I51323',4),(4660,'invaded','invad',0,0,0.4667,'I513',4),(4659,'influx of nationalist','influx of nationalist',0,1,1.7,'I51421535423',4),(4658,'influx of','influx of',0,1,1.3,'I51421',4),(4657,'influx','influx',0,0,0.4,'I5142',4),(4656,'increased immigration from','increas immigration from',0,1,1.8667,'I5262352635165',4),(4655,'increased immigration','increas immigration',0,1,1.7,'I5262352635',4),(4654,'increased','increas',0,0,0.6,'I52623',4),(4653,'in the yuanshan','in the yuanshan',0,1,1.5,'I53525',4),(4652,'in the late','in the late',0,1,1.3667,'I5343',4),(4651,'in taipei was','in taipei was',0,1,1.4333,'I5312',4),(4650,'in taipei and','in taipei and',0,1,1.4333,'I53153',4),(4649,'in taipei','in taipei',0,1,1.3,'I531',4),(4648,'in tainan after','in tainan after',0,1,1.5,'I535136',4),(4647,'in tainan','in tainan',0,1,1.3,'I535',4),(4646,'in search of','in search of',0,1,1.4,'I52621',4),(4645,'in search','in search',0,1,1.3,'I5262',4),(4644,'in recent years','in recent years',0,1,1.5,'I5625362',4),(4643,'in recent','in recent',0,1,1.3,'I56253',4),(4642,'in mengjia then','in mengjia then',0,1,1.5,'I5235',4),(4641,'in mengjia','in mengjia',0,1,1.3333,'I520',4),(4640,'in danshui from','in danshui from',0,1,1.5,'I5352165',4),(4639,'in danshui','in danshui',0,1,1.3333,'I5352',4),(4638,'in areas such','in areas such',0,1,1.4333,'I562',4),(4637,'in areas','in areas',0,1,1.2667,'I562',4),(4636,'in 1895 after','in 1895 after',0,1,1.4333,'I5136',4),(4635,'in 1895','in 1895',0,1,1.2333,'I500',4),(4634,'immigration from southeast','immigr from southeast',0,1,1.8667,'I526351652323',4),(4632,'immigration','immigr',0,0,0.7333,'I52635',4),(4633,'immigration from','immigr from',0,1,1.5333,'I52635165',4),(4631,'immigrants from quanzhou','immigr from quanzhou',0,1,1.8,'I526532165252',4),(4630,'immigrants from','immigr from',0,1,1.5,'I526532165',4),(4629,'immigrants built houses','immigr built houses',0,1,1.7667,'I5265321432',4),(4628,'immigrants built','immigr built',0,1,1.5333,'I526532143',4),(4627,'immigrants','immigr',0,0,0.6667,'I526532',4),(4626,'human presence in','human presence in',0,1,1.5667,'H5162525',4),(4625,'human presence','human presence',0,1,1.4667,'H516252',4),(4624,'human','human',0,0,0.3333,'H500',4),(4623,'houses and temples','hous and temples',0,1,1.6,'H2535142',4),(4622,'houses and','hous and',0,1,1.3333,'H253',4),(4621,'houses','hous',0,0,0.4,'H200',4),(4620,'hongmao fort or','hongmao fort or',0,1,1.5,'H5251636',4),(4619,'hongmao fort','hongmao fort',0,1,1.4,'H525163',4),(4618,'hongmao','hongmao',0,0,0.4667,'H525',4),(4617,'historically taipei has','histor taipei has',0,1,1.7667,'H23624312',4),(4616,'historically taipei','histor taipei',0,1,1.6333,'H2362431',4),(4615,'historically','histor',0,0,0.8,'H23624',4),(4614,'historical city gates','histor city gates',0,1,1.7,'H2362423232',4),(4613,'historical city','histor city',0,1,1.5,'H2362423',4),(4612,'historical','histor',0,0,0.6667,'H23624',4),(4611,'has further contributed','ha further contributed',0,1,1.7667,'H21636253613',4),(4610,'has further','ha further',0,1,1.3667,'H21636',4),(4609,'has always been','ha always been',0,1,1.5,'H24215',4),(4608,'has always','ha always',0,1,1.3333,'H242',4),(4607,'has','ha',0,0,0.2,'H200',4),(4606,'hair castle shortly','hair castle shortly',0,1,1.6333,'H62342634',4),(4605,'hair castle','hair castle',0,1,1.3667,'H6234',4),(4604,'hair','hair',0,0,0.2667,'H600',4),(4603,'guangxu\'s reign the','guangxu reign the',0,1,1.6333,'G526253',4),(4602,'guangxu\'s reign','guangxu reign',0,1,1.5,'G52625',4),(4601,'guangxu\'s','guangxu',0,0,0.6,'G520',4),(4600,'group belonging to','group belonging to',0,1,1.6,'G61452523',4),(4599,'group belonging','group belonging',0,1,1.5,'G6145252',4),(4598,'group','group',0,0,0.3333,'G610',4),(4597,'government took over','govern took over',0,1,1.6667,'G1653216',4),(4596,'government took','govern took',0,1,1.5,'G16532',4),(4595,'government assumed total','govern assumed total',0,1,1.8,'G16532534',4),(4594,'government assumed','govern assumed',0,1,1.6,'G1653253',4),(4593,'government','govern',0,0,0.6667,'G1653',4),(4592,'general koxinga who','gener koxinga who',0,1,1.6333,'G564252',4),(3463,'erat volutpat','erat volutpat',0,1,1.4333,'E6314313',4),(4590,'general','gener',0,0,0.4667,'G564',4),(4591,'general koxinga','gener koxinga',0,1,1.5,'G564252',4),(4589,'gates that we','gate that we',0,1,1.4333,'G323',4),(4588,'gates that','gate that',0,1,1.3333,'G323',4),(4587,'gates','gate',0,0,0.3333,'G320',4),(4586,'further contributed to','further contributed to',0,1,1.7333,'F636253613',4),(4585,'further contributed','further contributed',0,1,1.6333,'F636253613',4),(4584,'further','further',0,0,0.4667,'F636',4),(4583,'from southeast asia','from southeast asia',0,1,1.6333,'F6523232',4),(4582,'from southeast','from southeast',0,1,1.4667,'F652323',4),(4581,'from quanzhou zhangzhou','from quanzhou zhangzhou',0,1,1.7667,'F6525252',4),(4580,'from quanzhou','from quanzhou',0,1,1.4333,'F65252',4),(4579,'from keelung and','from keelung and',0,1,1.5333,'F65245253',4),(4578,'from keelung','from keelung',0,1,1.4,'F652452',4),(4577,'from','from',0,0,0.2667,'F650',4),(4576,'found in the','found in the',0,1,1.4,'F5353',4),(4575,'found in','found in',0,1,1.2667,'F535',4),(4574,'fought for control','fought for control',0,1,1.6,'F231625364',4),(4573,'fought for','fought for',0,1,1.3333,'F2316',4),(4572,'fought constantly with','fought constantly with',0,1,1.7333,'F2325235343',4),(4571,'fought constantly','fought constantly',0,1,1.5667,'F232523534',4),(4570,'fought','fought',0,0,0.4,'F230',4),(4569,'fort provintia now','fort provintia now',0,1,1.6,'F63161535',4),(4568,'fort provintia','fort provintia',0,1,1.4667,'F6316153',4),(4567,'fort or red-topped','fort or red-topped',0,1,1.6,'F636313',4),(4566,'fort or','fort or',0,1,1.2333,'F636',4),(4565,'fort','fort',0,0,0.2667,'F630',4),(4564,'forces the qing','forc the qing',0,1,1.5,'F623252',4),(4563,'forces the','forc the',0,1,1.3333,'F623',4),(4562,'forces','forc',0,0,0.4,'F620',4),(4561,'for territory these','for territory these',0,1,1.6333,'F6363632',4),(4560,'for territory','for territory',0,1,1.4333,'F63636',4),(4559,'for control of','for control of',0,1,1.4667,'F6253641',4),(4558,'for control','for control',0,1,1.3667,'F625364',4),(4557,'first sino-japanese war','first sino-japanese war',0,1,1.7667,'F6232521526',4),(4556,'first sino-japanese','first sino-japanese',0,1,1.6333,'F623252152',4),(4555,'first','first',0,0,0.3333,'F623',4),(4554,'evidence of human','evid of human',0,1,1.5667,'E135215',4),(4552,'evidence','evid',0,0,0.5333,'E1352',4),(4553,'evidence of','evid of',0,1,1.3667,'E13521',4),(4551,'ever more diversified','ever more diversified',0,1,1.7,'E1656316213',4),(4550,'ever more','ever more',0,1,1.3,'E1656',4),(4549,'ever','ever',0,0,0.2667,'E160',4),(4548,'end of wwii','end of wwii',0,1,1.3667,'E531',4),(4547,'end of','end of',0,1,1.2,'E531',4),(4546,'end','end',0,0,0.2,'E530',4),(4545,'emperor guangxu\'s reign','emperor guangxu reign',0,1,1.7667,'E516252625',4),(4544,'emperor guangxu\'s','emperor guangxu',0,1,1.5667,'E516252',4),(4543,'emperor','emperor',0,0,0.4667,'E516',4),(4542,'early immigrants built','earli immigrants built',0,1,1.7333,'E64526532143',4),(4541,'early immigrants','earli immigrants',0,1,1.5333,'E64526532',4),(4540,'early human presence','earli human presence',0,1,1.6667,'E64516252',4),(4538,'early','earli',0,0,0.3333,'E640',4),(4539,'early human','earli human',0,1,1.3667,'E645',4),(4537,'earliest archaeological evidence','earliest archaeological evidence',0,1,2,'E6423624241352',4),(4536,'earliest archaeological','earliest archaeological',0,1,1.7667,'E642362424',4),(4535,'earliest','earliest',0,0,0.5333,'E6423',4),(4534,'dynasty general koxinga','dynasti general koxinga',0,1,1.7667,'D5232564252',4),(4533,'dynasty general','dynasti general',0,1,1.5,'D5232564',4),(4532,'dynasty','dynasti',0,0,0.4667,'D523',4),(4531,'dutch invaded south','dutch invaded south',0,1,1.6333,'D251323',4),(4530,'dutch invaded','dutch invaded',0,1,1.4333,'D2513',4),(4529,'dutch','dutch',0,0,0.3333,'D200',4),(4528,'during this period','dure this period',0,1,1.6,'D65232163',4),(4527,'during this','dure this',0,1,1.3667,'D65232',4),(4526,'during emperor guangxu\'s','dure emperor guangxu',0,1,1.8,'D652516252',4),(4525,'during emperor','dure emperor',0,1,1.4667,'D652516',4),(4524,'during','dure',0,0,0.4,'D652',4),(4523,'diversified cultural climate','diversifi cultural climate',0,1,1.9333,'D16213243642453',4),(4522,'diversified cultural','diversifi cultural',0,1,1.6667,'D1621324364',4),(4521,'diversified','diversifi',0,0,0.7333,'D16213',4),(4520,'defeating koxinga\'s forces','defeat koxinga forces',0,1,1.8667,'D135252162',4),(4519,'defeating koxinga\'s','defeat koxinga',0,1,1.6333,'D135252',4),(4518,'defeating','defeat',0,0,0.6,'D1352',4),(4517,'danshui from keelung','danshui from keelung',0,1,1.6667,'D521652452',4),(4516,'danshui from','danshui from',0,1,1.4,'D52165',4),(4515,'danshui beitou and','danshui beitou and',0,1,1.6,'D521353',4),(4514,'danshui beitou','danshui beitou',0,1,1.4667,'D5213',4),(4513,'danshui','danshui',0,0,0.4667,'D520',4),(4512,'cultures collide and','cultur collide and',0,1,1.6667,'C43624353',4),(4511,'cultures collide','cultur collide',0,1,1.5333,'C436243',4),(4510,'cultures','cultur',0,0,0.5333,'C4362',4),(4509,'culture to taiwanese','cultur to taiwanese',0,1,1.6667,'C436352',4),(4508,'culture to','cultur to',0,1,1.3333,'C4363',4),(4507,'culture','cultur',0,0,0.4667,'C436',4),(4506,'cultural climate','cultur climate',0,1,1.5333,'C43642453',4),(4505,'cultural','cultur',0,0,0.5333,'C4364',4),(4504,'control of the','control of the',0,1,1.4667,'C536413',4),(4503,'control of taiwan','control of taiwan',0,1,1.5667,'C5364135',4),(4502,'control of','control of',0,1,1.3333,'C53641',4),(4501,'control','control',0,0,0.4667,'C5364',4),(4500,'contributed to taipei\'s','contribut to taipei',0,1,1.7667,'C5361312',4),(4499,'contributed to','contribut to',0,1,1.4667,'C53613',4),(4498,'contributed','contribut',0,0,0.7333,'C53613',4),(4497,'construction of taipei','construct of taipei',0,1,1.7333,'C5236235131',4),(4496,'construction of','construct of',0,1,1.5,'C52362351',4),(4495,'construction','construct',0,0,0.8,'C5236235',4),(4494,'constructed during this','construct during this',0,1,1.7667,'C52362365232',4),(4493,'constructed during','construct during',0,1,1.6,'C523623652',4),(4492,'constructed','construct',0,0,0.7333,'C523623',4),(4491,'constantly with the','constantli with the',0,1,1.6333,'C5235343',4),(4490,'constantly with','constantli with',0,1,1.5,'C5235343',4),(4489,'constantly','constantli',0,0,0.6667,'C523534',4),(4488,'confirm the early','confirm the early',0,1,1.5667,'C5165364',4),(4487,'confirm the','confirm the',0,1,1.3667,'C51653',4),(4486,'confirm','confirm',0,0,0.4667,'C5165',4),(4485,'completed in the','complet in the',0,1,1.5333,'C514353',4),(4484,'completed in','complet in',0,1,1.4,'C51435',4),(4483,'completed','complet',0,0,0.6,'C5143',4),(4482,'colony until the','coloni until the',0,1,1.5333,'C45343',4),(4481,'colony until','coloni until',0,1,1.4,'C4534',4),(4480,'colony in 1895','coloni in 1895',0,1,1.4667,'C450',4),(4479,'colony in','coloni in',0,1,1.3,'C450',4),(4478,'colony','coloni',0,0,0.4,'C450',4),(4477,'collide and coalesce','collid and coalesce',0,1,1.6667,'C4353242',4),(4476,'collide and','collid and',0,1,1.3667,'C4353',4),(4475,'collide','collid',0,0,0.4667,'C430',4),(4474,'coalesce the earliest','coalesc the earliest',0,1,1.7,'C4236423',2),(4473,'coalesce the','coalesc the',0,1,1.4,'C423',2),(4472,'coalesce','coalesc',0,0,0.5333,'C420',4),(4471,'climate','climat',0,0,0.4667,'C453',4),(4470,'city was completed','citi was completed',0,1,1.6,'C325143',4),(4469,'city was','citi was',0,1,1.2667,'C320',4),(4468,'city gates that','citi gates that',0,1,1.5,'C32323',4),(4466,'city','citi',0,0,0.2667,'C300',4),(4467,'city gates','citi gates',0,1,1.3333,'C3232',4),(4465,'chinese nationalist government','chines nationalist government',0,1,2,'C5253542321653',4),(4464,'chinese nationalist','chines nationalist',0,1,1.6333,'C52535423',4),(4463,'chinese immigrants from','chines immigrants from',0,1,1.7667,'C52526532165',4),(4462,'chinese immigrants','chines immigrants',0,1,1.6,'C52526532',4),(4461,'chinese culture to','chines culture to',0,1,1.6,'C524363',4),(4460,'chinese culture','chines culture',0,1,1.5,'C52436',4),(4459,'chinese','chines',0,0,0.4667,'C520',4),(4458,'china lost the','china lost the',0,1,1.4667,'C5423',4),(4457,'china lost','china lost',0,1,1.3333,'C5423',4),(4456,'china','china',0,0,0.3333,'C500',4),(4455,'century during emperor','centuri during emperor',0,1,1.7333,'C5363652516',4),(4454,'century during','centuri during',0,1,1.4667,'C5363652',4),(4453,'century','centuri',0,0,0.4667,'C536',4),(4452,'castle shortly after','castl shortly after',0,1,1.6667,'C342634136',4),(4451,'castle shortly','castl shortly',0,1,1.4667,'C342634',4),(4450,'castle','castl',0,0,0.4,'C340',4),(4449,'canton began to','canton began to',0,1,1.5,'C5351253',4),(4448,'canton began','canton began',0,1,1.4,'C535125',4),(4447,'canton','canton',0,0,0.4,'C535',4),(4446,'c 5000 and','c 5000 and',0,1,1.3333,'C530',4),(4445,'c 5000','c 5000',0,1,1.2,'C000',4),(4444,'c 1000-200 the','c 1000-200 the',0,1,1.4667,'C300',3),(4443,'c 1000-200','c 1000-200',0,1,1.3333,'C000',4),(4442,'c','c',0,0,0.0667,'C000',4),(4441,'built houses and','built houses and',0,1,1.5333,'B43253',4),(4440,'built houses','built houses',0,1,1.4,'B432',4),(4439,'built fort provintia','built fort provintia',0,1,1.6667,'B4316316153',4),(4438,'built fort','built fort',0,1,1.3333,'B43163',4),(4437,'built','built',0,0,0.3333,'B430',4),(4436,'brought with them','brought with them',0,1,1.5667,'B6235',4),(4435,'brought with','brought with',0,1,1.4,'B623',4),(4434,'brought','brought',0,0,0.4667,'B623',4),(4433,'belonging to the','belong to the',0,1,1.5333,'B452523',4),(4432,'belonging to','belong to',0,1,1.4,'B452523',4),(4431,'belonging','belong',0,0,0.6,'B45252',4),(4430,'beitou and bali','beitou and bali',0,1,1.5,'B35314',4),(4429,'beitou and','beitou and',0,1,1.3333,'B353',4),(4428,'beitou','beitou',0,0,0.4,'B300',4),(4427,'began to thrive','began to thrive',0,1,1.5,'B25361',4),(4426,'began to arrive','began to arrive',0,1,1.5,'B25361',4),(4425,'began to','began to',0,1,1.2667,'B253',4),(4424,'began','began',0,0,0.3333,'B250',4),(4423,'been a place','been a place',0,1,1.4,'B5142',4),(4422,'been a','been a',0,1,1.2,'B500',4),(4421,'became a japanese','becam a japanese',0,1,1.5667,'B252152',4),(4420,'became a','becam a',0,1,1.2667,'B250',4),(4419,'became','becam',0,0,0.4,'B250',4),(4418,'bali','bali',0,0,0.2667,'B400',4),(4417,'b c 5000','b c 5000',0,1,1.2667,'B200',4),(4416,'b c 1000-200','b c 1000-200',0,1,1.4,'B200',4),(4415,'b c','b c',0,1,1.1,'B200',4),(4414,'b','b',0,0,0.0667,'B000',4),(4413,'assumed total control','assum total control',0,1,1.7,'A253425364',4),(4412,'assumed total','assum total',0,1,1.4333,'A2534',4),(4411,'assumed','assum',0,0,0.4667,'A253',4),(4410,'asia has further','asia has further',0,1,1.5333,'A21636',4),(4409,'asia has','asia has',0,1,1.2667,'A200',4),(4408,'asia','asia',0,0,0.2667,'A200',4),(4407,'as well as','as well as',0,1,1.3333,'A242',4),(4406,'as well','as well',0,1,1.2333,'A240',4),(4405,'as the hongmao','as the hongmao',0,1,1.4667,'A23525',4),(4404,'as the','as the',0,1,1.2,'A230',4),(4403,'as danshui beitou','as danshui beitou',0,1,1.5667,'A235213',4),(4402,'as danshui','as danshui',0,1,1.3333,'A2352',4),(4401,'as among themselves','as among themselves',0,1,1.6333,'A252352412',4),(4400,'as among','as among',0,1,1.2667,'A252',4),(4398,'as a','as a',0,1,1.1333,'A200',4),(4399,'as a lake','as a lake',0,1,1.3,'A242',4),(4397,'as','as',0,0,0.1333,'A200',4),(4396,'arrived in danshui','arriv in danshui',0,1,1.6,'A6135352',4),(4395,'arrived in','arriv in',0,1,1.3333,'A6135',4),(4394,'arrived','arriv',0,0,0.4667,'A613',4),(4393,'arrive in mengjia','arriv in mengjia',0,1,1.5667,'A6152',4),(4392,'arrive in','arriv in',0,1,1.3,'A615',4),(4391,'arrive','arriv',0,0,0.4,'A610',4),(4390,'areas such as','area such as',0,1,1.4333,'A620',4),(4389,'areas such','area such',0,1,1.3333,'A620',4),(4388,'areas','area',0,0,0.3333,'A620',4),(4387,'architectural styles construction','architectur styles construction',0,1,2,'A623236423425236235',4),(4386,'architectural styles','architectur styles',0,1,1.6667,'A62323642342',4),(4385,'architectural','architectur',0,0,0.8667,'A6232364',4),(4384,'archaeological evidence of','archaeolog evidence of',0,1,1.8667,'A6242413521',4),(4383,'archaeological evidence','archaeolog evidence',0,1,1.7667,'A624241352',4),(4382,'archaeological','archaeolog',0,0,0.9333,'A62424',4),(4381,'arable land they','arabl land they',0,1,1.5333,'A61453',4),(4380,'arable land','arabl land',0,1,1.3667,'A61453',4),(4379,'arable','arabl',0,0,0.4,'A614',4),(4378,'and the zhishanyan','and the zhishanyan',0,1,1.6,'A5325',4),(4377,'and temples that','and temples that',0,1,1.5333,'A5351423',4),(4376,'and temples','and temples',0,1,1.3667,'A535142',4),(4375,'and taipei\'s past','and taipei past',0,1,1.5667,'A5312123',4),(4374,'and taipei\'s','and taipei',0,1,1.4,'A5312',4),(4373,'and personnel brought','and personnel brought',0,1,1.7,'A53162541623',4),(4372,'and personnel','and personnel',0,1,1.4333,'A5316254',4),(4371,'and fought for','and fought for',0,1,1.4667,'A5312316',4),(4370,'and fought','and fought',0,1,1.3333,'A53123',4),(4369,'and coalesce the','and coalesce the',0,1,1.5333,'A532423',2),(4368,'and coalesce','and coalesce',0,1,1.4,'A53242',4),(4367,'and canton began','and canton began',0,1,1.5333,'A532535125',4),(4366,'and canton','and canton',0,1,1.3333,'A532535',4),(4365,'and built fort','and built fort',0,1,1.4667,'A53143163',4),(4364,'and built','and built',0,1,1.3,'A53143',4),(4363,'and bali','and bali',0,1,1.2667,'A5314',4),(4362,'among themselves for','among themselves for',0,1,1.6667,'A5235241216',4),(4361,'among themselves','among themselves',0,1,1.5333,'A52352412',4),(4360,'among','among',0,0,0.3333,'A520',4),(4359,'always been a','alwai been a',0,1,1.4333,'A4215',4),(4358,'always been','alwai been',0,1,1.3667,'A4215',4),(4357,'always','alwai',0,0,0.4,'A420',4),(4356,'after the dutch','after the dutch',0,1,1.5,'A13632',4),(4355,'after the','after the',0,1,1.3,'A1363',4),(4354,'after defeating koxinga\'s','after defeating koxinga',0,1,1.8333,'A1363135252',4),(4353,'after defeating','after defeating',0,1,1.5,'A13631352',4),(4352,'after china lost','after china lost',0,1,1.5333,'A13625423',4),(4351,'after china','after china',0,1,1.3667,'A13625',4),(4350,'after','after',0,0,0.3333,'A136',4),(4349,'aboriginal tribes began','aborigin tribes began',0,1,1.7667,'A162543612125',4),(4348,'aboriginal tribes','aborigin tribes',0,1,1.5667,'A162543612',4),(4347,'aboriginal','aborigin',0,0,0.6667,'A16254',4),(4346,'a place where','a place where',0,1,1.4333,'A1426',4),(4345,'a place','a place',0,1,1.2333,'A142',4),(4344,'a number of','a number of',0,1,1.3667,'A5161',4),(4343,'a number','a number',0,1,1.2667,'A516',4),(4342,'a lake later','a lake later',0,1,1.4,'A42436',4),(4341,'a lake','a lake',0,1,1.2,'A420',4),(4340,'a japanese colony','a japanese colony',0,1,1.5667,'A215245',4),(4339,'a japanese','a japanese',0,1,1.3333,'A2152',4),(4338,'5000 and the','5000 and the',0,1,1.4,'A530',4),(4337,'5000 and','5000 and',0,1,1.2667,'A530',4),(4336,'5000','5000',0,0,0.4,'',4),(4335,'19th century during','19th century during',0,1,1.6333,'T25363652',4),(4334,'19th century','19th century',0,1,1.4,'T2536',4),(4333,'19th','19th',0,0,0.2667,'T000',4),(4332,'1895 after china','1895 after china',0,1,1.5333,'A13625',4),(4330,'1895','1895',0,0,0.4,'',4),(4331,'1895 after','1895 after',0,1,1.3333,'A136',4),(4329,'1000-200 the two','1000-200 the two',0,1,1.5333,'T000',3),(4328,'1000-200 the','1000-200 the',0,1,1.4,'T000',3),(4327,'1000-200','1000-200',0,0,0.8,'',4),(4325,'109','109',0,0,0.3,'',1),(4326,'krabi','krabi',0,0,0.3333,'K610',1),(4324,'guilin','guilin',0,0,0.4,'G450',1),(4322,'taipei','taipei',0,0,0.4,'T100',5),(4323,'108','108',0,0,0.3,'',1),(4321,'107','107',0,0,0.3,'',5),(4320,'destination','destin',0,0,0.7333,'D23535',9),(4319,'beijing','beij',0,0,0.4667,'B252',2),(4318,'106','106',0,0,0.3,'',2),(4317,'yo sent ground','yo sent ground',0,1,1.4667,'Y2532653',4),(4316,'yo sent','yo sent',0,1,1.2333,'Y253',4),(4315,'yo','yo',0,0,0.1333,'Y000',4),(4314,'years of experience','year of experience',0,1,1.6333,'Y62121652',4),(4313,'years of','year of',0,1,1.2667,'Y621',4),(4312,'years','year',0,0,0.3333,'Y620',8),(4311,'with the yo','with the yo',0,1,1.3667,'W300',4),(4310,'with the','with the',0,1,1.2667,'W300',8),(4309,'with and by','with and by',0,1,1.3667,'W3531',4),(4308,'with and','with and',0,1,1.2667,'W353',4),(4307,'with','with',1,0,0.0333,'W300',8),(4306,'us','us',0,0,0.1333,'U200',4),(4305,'travel to pick','travel to pick',0,1,1.4667,'T614312',4),(4304,'travel to','travel to',0,1,1.3,'T6143',4),(4303,'travel plan and','travel plan and',0,1,1.5,'T6141453',4),(4302,'travel plan','travel plan',0,1,1.3667,'T614145',4),(4301,'travel is legal','travel is legal',0,1,1.5,'T6142424',4),(4299,'travel','travel',0,0,0.4,'T614',4),(4300,'travel is','travel is',0,1,1.3,'T6142',4),(4298,'to pick the','to pick the',0,1,1.3667,'T123',4),(4297,'to pick','to pick',0,1,1.2333,'T120',4),(4296,'to customers provided','to customers provided',0,1,1.7,'T235621613',4),(4295,'to customers','to customers',0,1,1.4,'T23562',4),(4293,'the yo','the yo',0,1,1.2,'T000',4),(4294,'the yo sent','the yo sent',0,1,1.3667,'T253',4),(4292,'the recognition','the recognition',0,1,1.5,'T62535',4),(4291,'the international travel','the international travel',0,1,1.8,'T53653543614',4),(4290,'the international','the international',0,1,1.5667,'T5365354',4),(4289,'the company with','the company with',0,1,1.5333,'T25153',4),(4288,'the company is','the company is',0,1,1.4667,'T25152',4),(4287,'the company','the company',0,1,1.3667,'T2515',4),(4285,'the background','the background',0,1,1.4667,'T12653',4),(4286,'the background is','the background is',0,1,1.5667,'T126532',4),(4284,'than 20 years','than 20 years',0,1,1.4333,'T562',4),(4283,'than 20','than 20',0,1,1.2333,'T500',4),(4282,'than','than',1,0,0.0333,'T500',4),(4281,'supporting to customers','support to customers',0,1,1.7667,'S16352323562',4),(4279,'supporting','support',0,0,0.6667,'S16352',4),(4280,'supporting to','support to',0,1,1.4333,'S163523',4),(4278,'sent ground supporting','sent ground supporting',0,1,1.7333,'S532653216352',4),(4277,'sent ground','sent ground',0,1,1.3667,'S532653',4),(4276,'sent','sent',0,0,0.2667,'S530',4),(4275,'recognition','recognit',0,0,0.7333,'R2535',4),(4274,'provided by ground','provid by ground',0,1,1.6,'P61312653',4),(4273,'provided by','provid by',0,1,1.3667,'P6131',4),(4272,'provided','provid',0,0,0.5333,'P613',4),(4271,'plan and the','plan and the',0,1,1.4,'P453',4),(4270,'plan and','plan and',0,1,1.2667,'P453',4),(4269,'plan','plan',0,0,0.2667,'P450',4),(4268,'pick the company','pick the company',0,1,1.5333,'P232515',4),(3851,'urna aliquam','urna aliquam',0,1,1.4,'U65425',4),(4267,'pick the','pick the',0,1,1.2667,'P230',4),(4266,'pick','pick',0,0,0.2667,'P200',4),(4265,'online business necessities','onlin business necessities',0,1,1.9,'O54512525232',4),(4264,'online business','onlin business',0,1,1.5,'O5451252',4),(4263,'online','onlin',0,0,0.4,'O545',4),(4262,'of experience in','of experience in',0,1,1.5333,'O1216525',4),(4261,'of experience','of experience',0,1,1.4333,'O121652',4),(4260,'of','of',1,0,0.0167,'O100',8),(4259,'necessities involving travel','necess involving travel',0,1,1.9333,'N2325141523614',4),(4258,'necessities involving','necess involving',0,1,1.7,'N232514152',4),(4257,'necessities','necess',0,0,0.7333,'N232',4),(4256,'more than 20','more than 20',0,1,1.4,'M635',4),(4255,'more than','more than',0,1,1.3,'M635',4),(4254,'more','more',1,0,0.0333,'M600',8),(4253,'legal with and','legal with and',0,1,1.4667,'L24353',4),(4252,'legal with','legal with',0,1,1.3333,'L243',4),(4251,'legal','legal',0,0,0.3333,'L240',4),(4250,'is more than','is more than',0,1,1.4,'I25635',4),(4249,'is more','is more',0,1,1.2333,'I256',4),(4248,'is legal with','is legal with',0,1,1.4333,'I24243',4),(4247,'is legal','is legal',0,1,1.2667,'I2424',4),(4246,'is an online','is an online',0,1,1.4,'I2545',4),(4245,'is an','is an',0,1,1.1667,'I250',4),(4244,'involving travel plan','involv travel plan',0,1,1.7,'I5141523614145',4),(4243,'involving travel','involv travel',0,1,1.5333,'I5141523614',4),(4242,'involving','involv',0,0,0.6,'I514152',4),(4241,'international travel to','intern travel to',0,1,1.7667,'I536535436143',4),(4240,'international travel','intern travel',0,1,1.6667,'I53653543614',4),(4239,'international','intern',0,0,0.8667,'I5365354',4),(4238,'in the international','in the international',0,1,1.6667,'I535365354',4),(4237,'in the','in the',0,1,1.2,'I530',8),(4236,'ground travel is','ground travel is',0,1,1.5333,'G6536142',4),(4235,'ground travel','ground travel',0,1,1.4333,'G653614',4),(4234,'ground supporting to','ground supporting to',0,1,1.6667,'G6532163523',4),(4233,'ground supporting','ground supporting',0,1,1.5667,'G653216352',4),(4232,'ground','ground',0,0,0.4,'G653',4),(4231,'experience in the','experi in the',0,1,1.5667,'E2165253',4),(4230,'experience in','experi in',0,1,1.4333,'E216525',4),(4229,'experience','experi',0,0,0.6667,'E21652',4),(4228,'en-gb','en-gb',0,0,0.3333,'E521',4),(4227,'customers provided by','custom provided by',0,1,1.7,'C356216131',4),(4226,'customers provided','custom provided',0,1,1.6,'C35621613',4),(4225,'customers','custom',0,0,0.6,'C3562',4),(4224,'company with the','compani with the',0,1,1.5333,'C5153',4),(4223,'company with','compani with',0,1,1.4,'C5153',4),(4222,'company is an','compani is an',0,1,1.4333,'C51525',4),(4221,'company is','compani is',0,1,1.3333,'C5152',4),(4220,'company','compani',0,0,0.4667,'C515',4),(4219,'by the recognition','by the recognition',0,1,1.6,'B362535',4),(4218,'by the','by the',0,1,1.2,'B300',4),(4217,'by ground travel','by ground travel',0,1,1.5333,'B2653614',4),(4216,'by ground','by ground',0,1,1.3,'B2653',4),(4215,'by','by',1,0,0.0167,'B000',4),(4196,'105','105',0,0,0.3,'',4),(4197,'20 years','20 years',0,1,1.2667,'Y620',4),(4198,'20 years of','20 years of',0,1,1.3667,'Y621',4),(4199,'about','about',1,0,0.0417,'A130',4),(4200,'about us','about us',0,1,1.2667,'A132',4),(4201,'an','an',1,0,0.0167,'A500',4),(4202,'an online','an online',0,1,1.3,'A545',4),(4203,'an online business','an online business',0,1,1.6,'A5451252',4),(4204,'and','and',1,0,0.025,'A530',8),(4205,'and by','and by',0,1,1.2,'A531',4),(4206,'and by the','and by the',0,1,1.3333,'A5313',4),(4207,'and the','and the',0,1,1.2333,'A530',8),(4208,'and the background','and the background',0,1,1.6,'A5312653',4),(4209,'background','background',0,0,0.6667,'B2653',4),(4210,'background is','background is',0,1,1.4333,'B26532',4),(4211,'background is more','background is more',0,1,1.6,'B2653256',4),(4212,'business','busi',0,0,0.5333,'B252',4),(4213,'business necessities','busi necessities',0,1,1.6667,'B2525232',4),(4214,'business necessities involving','busi necessities involving',0,1,2,'B2525232514152',4),(4699,'later the ketagalan','later the ketagalan',0,1,1.6333,'L36323245',4),(4719,'nationalist troops and','nationalist troops and',0,1,1.7333,'N3542361253',4),(4718,'nationalist troops','nationalist troops',0,1,1.6,'N35423612',4),(4717,'nationalist government took','nationalist government took',0,1,1.9,'N35423216532',4),(4722,'now known as','now known as',0,1,1.4,'N252',4),(4720,'now','now',0,0,0.2,'N000',4),(4721,'now known','now known',0,1,1.3,'N250',4),(4723,'number','number',0,0,0.4,'N160',4),(4724,'number of','number of',0,1,1.3,'N161',4),(4725,'number of regional','number of regional',0,1,1.6,'N1616254',4),(4726,'of arable','of arable',0,1,1.3,'O1614',4),(4727,'of arable land','of arable land',0,1,1.4667,'O161453',4),(4728,'of human','of human',0,1,1.2667,'O150',4),(4729,'of human presence','of human presence',0,1,1.5667,'O1516252',4),(4742,'or red-topped','or red-topped',0,1,1.4333,'O6313',4),(4741,'of wwii when','of wwii when',0,1,1.4,'O150',4),(4740,'of wwii','of wwii',0,1,1.2333,'O100',4),(4739,'of the island','of the island',0,1,1.4333,'O132453',4),(4738,'of the','of the',0,1,1.2,'O130',4),(4737,'of taiwan southern','of taiwan southern',0,1,1.6,'O1352365',4),(4736,'of taiwan','of taiwan',0,1,1.3,'O135',4),(4735,'of taipei city','of taipei city',0,1,1.4667,'O13123',4),(4734,'of taipei','of taipei',0,1,1.3,'O131',4),(4733,'of regional architectural','of regional architectural',0,1,1.8333,'O162546232364',4),(4732,'of regional','of regional',0,1,1.3667,'O16254',4),(4731,'of nationalist troops','of nationalist troops',0,1,1.7,'O1535423612',4),(4730,'of nationalist','of nationalist',0,1,1.4667,'O1535423',4),(3987,'ac turpisn','ac turpisn',0,1,1.3333,'A236125',4),(3988,'ac turpisn tegetrum','ac turpisn tegetrum',0,1,1.6333,'A23612532365',4),(3989,'aenean auctor','aenean auctor',0,1,1.4333,'A5236',4),(3990,'aenean auctor wisi','aenean auctor wisi',0,1,1.6,'A52362',4),(3991,'ante eu','ant eu',0,1,1.2333,'A530',4),(3992,'ante eu lacus','ant eu lacus',0,1,1.4333,'A5342',4),(3993,'aserase elit aenean','aseras elit aenean',0,1,1.6333,'A262435',4),(3994,'david','david',0,0,0.3333,'D130',4),(3995,'david michaels','david michaels',0,1,1.4667,'D135242',4),(3996,'duis ac','dui ac',0,1,1.2333,'D200',4),(3997,'duis ac turpisn','dui ac turpisn',0,1,1.5,'D236125',4),(3998,'elit aenean','elit aenean',0,1,1.3667,'E435',4),(3999,'elit aenean auctor','elit aenean auctor',0,1,1.6,'E435236',4),(4000,'erat volutpat duis','erat volutpat duis',0,1,1.6,'E63143132',4),(4001,'et urna aliquam','et urna aliquam',0,1,1.5,'E365425',4),(4002,'eu lacus','eu lacus',0,1,1.2667,'E420',4),(4003,'eu lacus lkuyrasaera','eu lacus lkuyrasaera',0,1,1.6667,'E4242626',4),(4004,'lacus lkuyrasaera','lacu lkuyrasaera',0,1,1.5667,'L242626',4),(4005,'lacus lkuyrasaera vertase','lacu lkuyrasaera vertase',0,1,1.8333,'L2426261632',4),(4006,'lkuyrasaera','lkuyrasaera',0,0,0.7333,'L2626',4),(4007,'lkuyrasaera vertase','lkuyrasaera vertase',0,1,1.6333,'L26261632',4),(4008,'lkuyrasaera vertase david','lkuyrasaera vertase david',0,1,1.8333,'L26261632313',4),(4009,'michaels','michael',0,0,0.5333,'M242',4),(4010,'tegetrum','tegetrum',0,0,0.5333,'T2365',4),(4011,'tegetrum ante','tegetrum ante',0,1,1.4333,'T23653',4),(4012,'tegetrum ante eu','tegetrum ante eu',0,1,1.5333,'T23653',4),(4013,'turpisn','turpisn',0,0,0.4667,'T6125',4),(4014,'turpisn tegetrum','turpisn tegetrum',0,1,1.5333,'T612532365',4),(4015,'turpisn tegetrum ante','turpisn tegetrum ante',0,1,1.7,'T6125323653',4),(4016,'urna aliquam erat','urna aliquam erat',0,1,1.5667,'U6542563',4),(4017,'vertase','vertas',0,0,0.4667,'V632',4),(4018,'vertase david','vertas david',0,1,1.4333,'V632313',4),(4019,'vertase david michaels','vertas david michaels',0,1,1.7333,'V6323135242',4),(4020,'volutpat duis','volutpat duis',0,1,1.4333,'V43132',4),(4021,'volutpat duis ac','volutpat duis ac',0,1,1.5333,'V43132',4),(4022,'93','93',0,0,0.2,'',1),(4753,'personnel','personnel',0,0,0.6,'P6254',4),(4752,'period taiwan became','period taiwan became',0,1,1.6667,'P635125',4),(4750,'period','period',0,0,0.4,'P630',4),(4751,'period taiwan','period taiwan',0,1,1.4333,'P635',4),(4749,'past as a','past as a',0,1,1.3,'P232',4),(4748,'past as','past as',0,1,1.2333,'P232',4),(4747,'past','past',0,0,0.2667,'P230',4),(4746,'over the influx','over the influx',0,1,1.5,'O1635142',4),(4744,'over','over',0,0,0.2667,'O160',4),(4745,'over the','over the',0,1,1.2667,'O163',4),(4743,'or red-topped tower','or red-topped tower',0,1,1.6333,'O63136',4),(4716,'nationalist government','nationalist government',0,1,1.7333,'N3542321653',4),(4715,'nationalist','nationalist',0,0,0.7333,'N35423',4),(4714,'more diversified cultural','more diversified cultural',0,1,1.8333,'M631621324364',4),(4713,'more diversified','more diversified',0,1,1.5333,'M6316213',4),(4712,'ming dynasty general','ming dynasty general',0,1,1.6667,'M235232564',4),(4711,'ming dynasty','ming dynasty',0,1,1.4,'M23523',4),(4710,'ming','ming',0,0,0.2667,'M200',4),(4709,'mengjia then taiwan\'s','mengjia then taiwan',0,1,1.7,'M235352',4),(4708,'mengjia then','mengjia then',0,1,1.4,'M235',4),(4707,'mengjia','mengjia',0,0,0.4667,'M200',4),(4706,'mainland chinese nationalist','mainland chinese nationalist',0,1,1.9333,'M453252535423',4),(4705,'mainland chinese culture','mainland chinese culture',0,1,1.8,'M453252436',4),(4704,'mainland chinese','mainland chinese',0,1,1.5333,'M453252',4),(4700,'lost','lost',0,0,0.2667,'L230',4),(4701,'lost the','lost the',0,1,1.2667,'L230',4),(4702,'lost the first','lost the first',0,1,1.4667,'L231623',4),(4703,'mainland','mainland',0,0,0.5333,'M453',4),(4777,'provintia now known','provintia now known',0,1,1.6333,'P6153525',4),(4776,'provintia now','provintia now',0,1,1.4333,'P61535',4),(4775,'provintia','provintia',0,0,0.6,'P6153',4),(4774,'presence in taipei','presenc in taipei',0,1,1.6,'P6252531',4),(4773,'presence in','presenc in',0,1,1.3667,'P62525',4),(4772,'presence','presenc',0,0,0.5333,'P6252',4),(4771,'prehistoric site b','prehistor site b',0,1,1.6,'P6236231',4),(4770,'prehistoric site','prehistor site',0,1,1.5333,'P623623',4),(4769,'prehistoric','prehistor',0,0,0.7333,'P62362',4),(4768,'port in search','port in search',0,1,1.4667,'P635262',4),(4767,'port in','port in',0,1,1.2333,'P635',4),(4766,'plains aboriginal tribes','plain aboriginal tribes',0,1,1.8,'P452162543612',4),(4765,'plains aboriginal','plain aboriginal',0,1,1.5667,'P45216254',4),(4764,'plains','plain',0,0,0.4,'P452',4),(4763,'place where cultures','place where cultures',0,1,1.6667,'P42624362',4),(4762,'place where','place where',0,1,1.3667,'P426',4),(4761,'place','place',0,0,0.3333,'P420',4),(4760,'pingpu tribe as','pingpu tribe as',0,1,1.5,'P5213612',4),(4759,'pingpu tribe','pingpu tribe',0,1,1.4,'P521361',4),(4758,'pingpu plains aboriginal','pingpu plains aboriginal',0,1,1.8,'P52145216254',4),(4757,'pingpu plains','pingpu plains',0,1,1.4333,'P521452',4),(4756,'pingpu','pingpu',0,0,0.4,'P521',4),(4754,'personnel brought','personnel brought',0,1,1.5667,'P62541623',4),(4755,'personnel brought with','personnel brought with',0,1,1.7333,'P62541623',4),(4100,'+1','+1',0,0,0.2,'',7),(4101,'+1 504','+1 504',0,1,1.2,'',7),(4102,'+1 504 889','+1 504 889',0,1,1.3333,'',7),(4103,'+1 800','+1 800',0,1,1.2,'',7),(4104,'+1 800 559','+1 800 559',0,1,1.3333,'',7),(4105,'+1 959','+1 959',0,1,1.2,'',7),(4106,'+1 959 603','+1 959 603',0,1,1.3333,'',7),(4107,'504','504',0,0,0.3,'',7),(4108,'504 889','504 889',0,1,1.2333,'',7),(4109,'504 889 9898','504 889 9898',0,1,1.4,'',7),(4110,'559','559',0,0,0.3,'',7),(4111,'559 6580','559 6580',0,1,1.2667,'',7),(4112,'559 6580 telephone','559 6580 telephone',0,1,1.6,'T415',7),(4113,'603','603',0,0,0.3,'',7),(4114,'603 6035','603 6035',0,1,1.2667,'',7),(4115,'603 6035 fax','603 6035 fax',0,1,1.4,'F200',7),(4116,'6035','6035',0,0,0.4,'',7),(4117,'6035 fax','6035 fax',0,1,1.2667,'F200',7),(4118,'6035 fax +1','6035 fax +1',0,1,1.3667,'F200',7),(4119,'6580','6580',0,0,0.4,'',7),(4120,'6580 telephone','6580 telephone',0,1,1.4667,'T415',7),(4121,'6580 telephone +1','6580 telephone +1',0,1,1.5667,'T415',7),(4122,'800','800',0,0,0.3,'',7),(4123,'800 559','800 559',0,1,1.2333,'',7),(4124,'800 559 6580','800 559 6580',0,1,1.4,'',7),(4125,'889','889',0,0,0.3,'',7),(4126,'889 9898','889 9898',0,1,1.2667,'',7),(4127,'889 9898 e-mail','889 9898 e-mail',0,1,1.5,'E540',7),(4128,'8901','8901',0,0,0.4,'',7),(4129,'8901 marmora','8901 marmora',0,1,1.4,'M656',7),(4130,'8901 marmora road','8901 marmora road',0,1,1.5667,'M6563',7),(4131,'89gr','89gr',0,0,0.2667,'G600',7),(4132,'89gr freephone','89gr freephone',0,1,1.4667,'G61615',7),(4133,'89gr freephone +1','89gr freephone +1',0,1,1.5667,'G61615',7),(4134,'959','959',0,0,0.3,'',7),(4135,'959 603','959 603',0,1,1.2333,'',7),(4136,'959 603 6035','959 603 6035',0,1,1.4,'',7),(4137,'9863','9863',0,0,0.4,'',7),(4138,'9863 9867','9863 9867',0,1,1.3,'',7),(4139,'9863 9867 mill','9863 9867 mill',0,1,1.4667,'M400',7),(4140,'9867','9867',0,0,0.4,'',7),(4141,'9867 mill','9867 mill',0,1,1.3,'M400',7),(4142,'9867 mill road','9867 mill road',0,1,1.4667,'M463',7),(4143,'9898','9898',0,0,0.4,'',7),(4144,'9898 e-mail','9898 e-mail',0,1,1.3667,'E540',7),(4145,'9898 e-mail mail','9898 e-mail mail',0,1,1.5333,'E5454',7),(4146,'99ht','99ht',0,0,0.2667,'H300',7),(4147,'99ht freephone','99ht freephone',0,1,1.4667,'H31615',7),(4148,'99ht freephone +1','99ht freephone +1',0,1,1.5667,'H31615',7),(4149,'cambridge','cambridg',0,0,0.6,'C51632',7),(4150,'cambridge mg09','cambridg mg09',0,1,1.4667,'C5163252',7),(4151,'cambridge mg09 99ht','cambridg mg09 99ht',0,1,1.6333,'C51632523',7),(4152,'contact','contact',0,0,0.4667,'C5323',7),(4153,'contacts','contact',0,0,0.5333,'C53232',7),(4154,'d04','d04',0,0,0.2,'D000',7),(4155,'d04 89gr','d04 89gr',0,1,1.2667,'D260',7),(4156,'d04 89gr freephone','d04 89gr freephone',0,1,1.6,'D261615',7),(4157,'demolink org 9863','demolink org 9863',0,1,1.5667,'D545262',7),(4158,'e-mail','e-mail',0,0,0.4,'E540',7),(4159,'e-mail mail','e-mail mail',0,1,1.3667,'E5454',7),(4160,'e-mail mail demolink','e-mail mail demolink',0,1,1.6667,'E545435452',7),(4161,'fax','fax',0,0,0.2,'F200',7),(4162,'fax +1','fax +1',0,1,1.2,'F200',7),(4163,'fax +1 504','fax +1 504',0,1,1.3333,'F200',7),(4164,'freephone','freephon',0,0,0.6,'F615',7),(4165,'freephone +1','freephon +1',0,1,1.4,'F615',7),(4166,'freephone +1 800','freephon +1 800',0,1,1.5333,'F615',7),(4167,'glasgow','glasgow',0,0,0.4667,'G420',7),(4168,'glasgow d04','glasgow d04',0,1,1.3667,'G423',7),(4169,'glasgow d04 89gr','glasgow d04 89gr',0,1,1.5333,'G42326',7),(4170,'mail','mail',0,0,0.2667,'M400',7),(4171,'mail demolink','mail demolink',0,1,1.4333,'M435452',7),(4172,'mail demolink org','mail demolink org',0,1,1.5667,'M43545262',7),(4173,'mailto','mailto',0,0,0.4,'M430',6),(4174,'mailto demolink','mailto demolink',0,1,1.5,'M435452',6),(4175,'mailto demolink org','mailto demolink org',0,1,1.6333,'M43545262',6),(4176,'marmora','marmora',0,0,0.4667,'M656',7),(4177,'marmora road','marmora road',0,1,1.4,'M6563',7),(4178,'marmora road glasgow','marmora road glasgow',0,1,1.6667,'M6563242',7),(4179,'mg09','mg09',0,0,0.2667,'M200',7),(4180,'mg09 99ht','mg09 99ht',0,1,1.3,'M230',7),(4181,'mg09 99ht freephone','mg09 99ht freephone',0,1,1.6333,'M231615',7),(4182,'mill','mill',0,0,0.2667,'M400',7),(4183,'mill road','mill road',0,1,1.3,'M463',7),(4184,'mill road cambridge','mill road cambridge',0,1,1.6333,'M463251632',7),(4185,'org 9863','org 9863',0,1,1.2667,'O620',7),(4186,'org 9863 9867','org 9863 9867',0,1,1.4333,'O620',7),(4187,'road','road',0,0,0.2667,'R300',7),(4188,'road cambridge','road cambridge',0,1,1.4667,'R3251632',7),(4189,'road cambridge mg09','road cambridge mg09',0,1,1.6333,'R325163252',7),(4190,'road glasgow','road glasgow',0,1,1.4,'R3242',7),(4191,'road glasgow d04','road glasgow d04',0,1,1.5333,'R32423',7),(4192,'telephone','telephon',0,0,0.6,'T415',7),(4193,'telephone +1','telephon +1',0,1,1.4,'T415',7),(4194,'telephone +1 959','telephon +1 959',0,1,1.5333,'T415',7),(4195,'uncategorised','uncategoris',0,0,0.8667,'U5232623',7),(4778,'qing','qing',0,0,0.2667,'Q520',4),(4779,'qing government','qing government',0,1,1.5,'Q521653',4),(4780,'qing government assumed','qing government assumed',0,1,1.7667,'Q521653253',4),(4781,'quanzhou','quanzhou',0,0,0.5333,'Q520',4),(4782,'quanzhou zhangzhou','quanzhou zhangzhou',0,1,1.6,'Q5252',4),(4783,'quanzhou zhangzhou and','quanzhou zhangzhou and',0,1,1.7333,'Q525253',4),(4784,'recent','recent',0,0,0.4,'R253',4),(4785,'recent years','recent years',0,1,1.4,'R25362',4),(4786,'recent years increased','recent years increased',0,1,1.7333,'R2536252623',4),(4787,'red','red',0,0,0.2,'R300',4),(4788,'red hair','red hair',0,1,1.2667,'R360',4),(4789,'red hair castle','red hair castle',0,1,1.5,'R36234',4),(4790,'red-topped','red-top',0,0,0.6667,'R313',4),(4791,'red-topped tower','red-top tower',0,1,1.5333,'R3136',4),(4792,'red-topped tower red','red-top tower red',0,1,1.6667,'R31363',4),(4793,'reflected','reflect',0,0,0.6,'R1423',4),(4794,'reflected a','reflect a',0,1,1.3667,'R1423',4),(4795,'reflected a number','reflect a number',0,1,1.6,'R1423516',4),(4796,'regional','region',0,0,0.5333,'R254',4),(4797,'regional architectural','region architectural',0,1,1.7333,'R2546232364',4),(4798,'regional architectural styles','region architectural styles',0,1,1.9667,'R25462323642342',4),(4799,'reign','reign',0,0,0.3333,'R250',4),(4800,'reign the','reign the',0,1,1.3,'R253',4),(4801,'reign the historical','reign the historical',0,1,1.6667,'R25323624',4),(4802,'remained','remain',0,0,0.5333,'R530',4),(4803,'remained a','remain a',0,1,1.3333,'R530',4),(4804,'remained a japanese','remain a japanese',0,1,1.6333,'R532152',4),(4805,'search of','search of',0,1,1.3,'S621',4),(4806,'search of arable','search of arable',0,1,1.5333,'S621614',4),(4807,'see','see',0,0,0.2,'S000',4),(4808,'see today','see today',0,1,1.3,'S300',4),(4809,'see today were','see today were',0,1,1.4667,'S360',4),(4810,'shortly','shortli',0,0,0.4667,'S634',4),(4811,'shortly after','shortli after',0,1,1.4333,'S634136',4),(4812,'shortly after the','shortli after the',0,1,1.5667,'S6341363',4),(4813,'sino-japanese','sino-japanes',0,0,0.8667,'S52152',4),(4814,'sino-japanese war','sino-japanes war',0,1,1.5667,'S521526',4),(4815,'sino-japanese war taiwan','sino-japanes war taiwan',0,1,1.8,'S52152635',4),(4816,'site','site',0,0,0.2667,'S300',4),(4817,'site b','site b',0,1,1.2,'S310',4),(4818,'site b c','site b c',0,1,1.2667,'S312',4),(4819,'sites','site',0,0,0.3333,'S320',4),(4820,'sites confirm','site confirm',0,1,1.4333,'S325165',4),(4821,'sites confirm the','site confirm the',0,1,1.5667,'S3251653',4),(4822,'society','societi',0,0,0.4667,'S300',4),(4823,'society in','societi in',0,1,1.3333,'S350',4),(4824,'society in recent','societi in recent',0,1,1.5667,'S356253',4),(4825,'south','south',0,0,0.3333,'S300',4),(4826,'south taiwan','south taiwan',0,1,1.4,'S350',4),(4827,'south taiwan and','south taiwan and',0,1,1.5333,'S353',4),(4828,'southeast','southeast',0,0,0.6,'S323',4),(4829,'southeast asia','southeast asia',0,1,1.4667,'S3232',4),(4830,'southeast asia has','southeast asia has',0,1,1.6,'S3232',4),(4831,'southern','southern',0,0,0.5333,'S365',4),(4832,'southern chinese','southern chinese',0,1,1.5333,'S365252',4),(4833,'southern chinese immigrants','southern chinese immigrants',0,1,1.9,'S365252526532',4),(4834,'spanish','spanish',0,0,0.4667,'S152',4),(4835,'spanish arrived','spanish arrived',0,1,1.5,'S152613',4),(4836,'spanish arrived in','spanish arrived in',0,1,1.6,'S1526135',4),(4837,'stationed','station',0,0,0.6,'S353',4),(4838,'stationed in','station in',0,1,1.4,'S3535',4),(4839,'stationed in tainan','station in tainan',0,1,1.6333,'S353535',4),(4840,'styles','style',0,0,0.4,'S342',4),(4841,'styles construction','style construction',0,1,1.6333,'S3425236235',4),(4842,'styles construction of','style construction of',0,1,1.7333,'S34252362351',4),(4843,'such','such',0,0,0.2667,'S000',4),(4844,'such as','such as',0,1,1.2333,'S000',4),(4845,'such as danshui','such as danshui',0,1,1.5,'S352',4),(4846,'tainan','tainan',0,0,0.4,'T500',4),(4847,'tainan after','tainan after',0,1,1.4,'T5136',4),(4848,'tainan after defeating','tainan after defeating',0,1,1.7333,'T513631352',4),(4849,'taipei and','taipei and',0,1,1.3333,'T153',4),(4850,'taipei and taipei\'s','taipei and taipei',0,1,1.6333,'T15312',4),(4851,'taipei city','taipei city',0,1,1.3667,'T123',4),(4852,'taipei city was','taipei city was',0,1,1.5,'T1232',4),(4853,'taipei has','taipei has',0,1,1.3333,'T120',4),(4854,'taipei has always','taipei has always',0,1,1.5667,'T1242',4),(4855,'taipei was','taipei was',0,1,1.3333,'T120',4),(4856,'taipei was found','taipei was found',0,1,1.5333,'T12153',4),(4857,'taipei\'s','taipei',0,0,0.5333,'T120',4),(4858,'taipei\'s ever','taipei ever',0,1,1.4333,'T1216',4),(4859,'taipei\'s ever more','taipei ever more',0,1,1.6,'T121656',4),(4860,'taipei\'s past','taipei past',0,1,1.4333,'T12123',4),(4861,'taipei\'s past as','taipei past as',0,1,1.5333,'T121232',4),(4862,'taiwan','taiwan',0,0,0.4,'T500',4),(4863,'taiwan and','taiwan and',0,1,1.3333,'T530',4),(4864,'taiwan and fought','taiwan and fought',0,1,1.5667,'T53123',4),(4865,'taiwan became','taiwan became',0,1,1.4333,'T5125',4),(4866,'taiwan became a','taiwan became a',0,1,1.5,'T5125',4),(4867,'taiwan remained','taiwan remained',0,1,1.5,'T5653',4),(4868,'taiwan remained a','taiwan remained a',0,1,1.5667,'T5653',4),(4869,'taiwan southern','taiwan southern',0,1,1.5,'T52365',4),(4870,'taiwan southern chinese','taiwan southern chinese',0,1,1.7667,'T52365252',4),(4871,'taiwan\'s','taiwan',0,0,0.5333,'T520',4),(4872,'taiwan\'s largest','taiwan largest',0,1,1.5333,'T524623',4),(4873,'taiwan\'s largest port','taiwan largest port',0,1,1.7,'T524623163',4),(4874,'taiwanese','taiwanes',0,0,0.6,'T520',4),(4875,'taiwanese society','taiwanes society',0,1,1.5667,'T523',4),(4876,'taiwanese society in','taiwanes society in',0,1,1.6667,'T5235',4),(4877,'temples','templ',0,0,0.4667,'T5142',4),(4878,'temples that','templ that',0,1,1.4,'T51423',4),(4879,'temples that reflected','templ that reflected',0,1,1.7333,'T5142361423',4),(4880,'territory','territori',0,0,0.6,'T636',4),(4881,'territory these','territori these',0,1,1.5,'T63632',4),(4882,'territory these early','territori these early',0,1,1.7,'T6363264',4),(4883,'that','that',0,0,0.2667,'T000',4),(4884,'that reflected','that reflected',0,1,1.4667,'T61423',4),(4885,'that reflected a','that reflected a',0,1,1.5333,'T61423',4),(4886,'that we','that we',0,1,1.2333,'T000',4),(4887,'that we see','that we see',0,1,1.3667,'T200',4),(4888,'the dutch','the dutch',0,1,1.3,'T200',4),(4889,'the dutch invaded','the dutch invaded',0,1,1.5667,'T2513',4),(4890,'the earliest','the earliest',0,1,1.4,'T6423',4),(4891,'the earliest archaeological','the earliest archaeological',0,1,1.9,'T642362424',4),(4892,'the early','the early',0,1,1.3,'T640',4),(4893,'the early human','the early human',0,1,1.5,'T645',4),(4894,'the end','the end',0,1,1.2333,'T530',4),(4895,'the end of','the end of',0,1,1.3333,'T531',4),(4896,'the first','the first',0,1,1.3,'T1623',4),(4897,'the first sino-japanese','the first sino-japanese',0,1,1.7667,'T1623252152',4),(4898,'the historical','the historical',0,1,1.4667,'T23624',4),(4899,'the historical city','the historical city',0,1,1.6333,'T2362423',4),(4900,'the hongmao','the hongmao',0,1,1.3667,'T525',4),(4901,'the hongmao fort','the hongmao fort',0,1,1.5333,'T525163',4),(4902,'the influx','the influx',0,1,1.3333,'T5142',4),(4903,'the influx of','the influx of',0,1,1.4333,'T51421',4),(4904,'the island','the island',0,1,1.3333,'T2453',4),(4905,'the island with','the island with',0,1,1.5,'T2453',4),(4906,'the ketagalan','the ketagalan',0,1,1.4333,'T23245',4),(4907,'the ketagalan group','the ketagalan group',0,1,1.6333,'T23245261',4),(4908,'the late','the late',0,1,1.2667,'T430',4),(4909,'the late 19th','the late 19th',0,1,1.4333,'T430',4),(4910,'the mainland','the mainland',0,1,1.4,'T5453',4),(4911,'the mainland chinese','the mainland chinese',0,1,1.6667,'T5453252',4),(4912,'the pingpu','the pingpu',0,1,1.3333,'T1521',4),(4913,'the pingpu plains','the pingpu plains',0,1,1.5667,'T1521452',4),(4914,'the pingpu tribe','the pingpu tribe',0,1,1.5333,'T1521361',4),(4915,'the qing','the qing',0,1,1.2667,'T252',4),(4916,'the qing government','the qing government',0,1,1.6333,'T2521653',4),(4917,'the spanish','the spanish',0,1,1.3667,'T2152',4),(4918,'the spanish arrived','the spanish arrived',0,1,1.6333,'T2152613',4),(4919,'the two','the two',0,1,1.2333,'T000',4),(4920,'the two sites','the two sites',0,1,1.4333,'T232',4),(4921,'the yuanshan','the yuanshan',0,1,1.4,'T525',4),(4922,'the yuanshan prehistoric','the yuanshan prehistoric',0,1,1.8,'T525162362',4),(4923,'the zhishanyan','the zhishanyan',0,1,1.4667,'T250',4),(4924,'the zhishanyan prehistoric','the zhishanyan prehistoric',0,1,1.8667,'T25162362',4),(4925,'them','them',0,0,0.2667,'T500',4),(4926,'them mainland','them mainland',0,1,1.4333,'T5453',4),(4927,'them mainland chinese','them mainland chinese',0,1,1.7,'T5453252',4),(4928,'themselves','themselv',0,0,0.6667,'T52412',4),(4929,'themselves for','themselv for',0,1,1.4667,'T5241216',4),(4930,'themselves for territory','themselv for territory',0,1,1.8,'T52412163636',4),(4931,'then','then',0,0,0.2667,'T500',4),(4932,'then stationed','then stationed',0,1,1.4667,'T52353',4),(4933,'then stationed in','then stationed in',0,1,1.5667,'T523535',4),(4934,'then taiwan\'s','then taiwan',0,1,1.4333,'T5352',4),(4935,'then taiwan\'s largest','then taiwan largest',0,1,1.7,'T53524623',4),(4936,'these','these',0,0,0.3333,'T200',4),(4937,'these early','these early',0,1,1.3667,'T264',4),(4938,'these early immigrants','these early immigrants',0,1,1.7333,'T264526532',4),(4939,'they','thei',0,0,0.2667,'T000',4),(4940,'they fought','thei fought',0,1,1.3667,'T123',4),(4941,'they fought constantly','thei fought constantly',0,1,1.7333,'T1232523534',4),(4942,'this','thi',0,0,0.2667,'T200',4),(4943,'this period','thi period',0,1,1.3667,'T2163',4),(4944,'this period taiwan','thi period taiwan',0,1,1.6,'T21635',4),(4945,'thrive','thrive',0,0,0.4,'T610',4),(4946,'thrive in','thrive in',0,1,1.3,'T615',4),(4947,'thrive in areas','thrive in areas',0,1,1.5,'T61562',4),(4948,'to arrive','to arrive',0,1,1.3,'T610',4),(4949,'to arrive in','to arrive in',0,1,1.4,'T615',4),(4950,'to taipei\'s','to taipei',0,1,1.3667,'T120',4),(4951,'to taipei\'s ever','to taipei ever',0,1,1.5333,'T1216',4),(4952,'to taiwanese','to taiwanese',0,1,1.4,'T520',4),(4953,'to taiwanese society','to taiwanese society',0,1,1.6667,'T523',4),(4954,'to the','to the',0,1,1.2,'T000',4),(4955,'to the pingpu','to the pingpu',0,1,1.4333,'T1521',4),(4956,'to thrive','to thrive',0,1,1.3,'T610',4),(4957,'to thrive in','to thrive in',0,1,1.4,'T615',4),(4958,'today','todai',0,0,0.3333,'T000',4),(4959,'today were','todai were',0,1,1.3333,'T600',4),(4960,'today were constructed','todai were constructed',0,1,1.7333,'T62523623',4),(4961,'took','took',0,0,0.2667,'T200',4),(4962,'took over','took over',0,1,1.3,'T216',4),(4963,'took over the','took over the',0,1,1.4333,'T2163',4),(4964,'total','total',0,0,0.3333,'T400',4),(4965,'total control','total control',0,1,1.4333,'T425364',4),(4966,'total control of','total control of',0,1,1.5333,'T4253641',4),(4967,'tower','tower',0,0,0.3333,'T600',4),(4968,'tower red','tower red',0,1,1.3,'T630',4),(4969,'tower red hair','tower red hair',0,1,1.4667,'T636',4),(4970,'tribe','tribe',0,0,0.3333,'T610',4),(4971,'tribe as','tribe as',0,1,1.2667,'T612',4),(4972,'tribe as well','tribe as well',0,1,1.4333,'T6124',4),(4973,'tribes','tribe',0,0,0.4,'T612',4),(4974,'tribes began','tribe began',0,1,1.4,'T612125',4),(4975,'tribes began to','tribe began to',0,1,1.5,'T6121253',4),(4976,'troops','troop',0,0,0.4,'T612',4),(4977,'troops and','troop and',0,1,1.3333,'T61253',4),(4978,'troops and personnel','troop and personnel',0,1,1.6667,'T6125316254',4),(4979,'two','two',0,0,0.2,'T000',4),(4980,'two sites','two sites',0,1,1.3,'T232',4),(4981,'two sites confirm','two sites confirm',0,1,1.5667,'T2325165',4),(4982,'until','until',0,0,0.3333,'U534',4),(4983,'until the','until the',0,1,1.3,'U5343',4),(4984,'until the end','until the end',0,1,1.4333,'U534353',4),(4985,'war','war',0,0,0.2,'W600',4),(4986,'war taiwan','war taiwan',0,1,1.3333,'W635',4),(4987,'war taiwan remained','war taiwan remained',0,1,1.6333,'W635653',4),(4988,'was','wa',0,0,0.2,'W200',4),(4989,'was completed','wa completed',0,1,1.4333,'W25143',4),(4990,'was completed in','wa completed in',0,1,1.5333,'W251435',4),(4991,'was found','wa found',0,1,1.3,'W2153',4),(4992,'was found in','wa found in',0,1,1.4,'W21535',4),(4993,'was then','wa then',0,1,1.2667,'W235',4),(4994,'was then stationed','wa then stationed',0,1,1.6,'W2352353',4),(4995,'we','we',0,0,0.1333,'W000',4),(4996,'we see','we see',0,1,1.2,'W200',4),(4997,'we see today','we see today',0,1,1.4,'W230',4),(4998,'well','well',0,0,0.2667,'W400',4),(4999,'well as','well as',0,1,1.2333,'W420',4),(5000,'well as among','well as among',0,1,1.4333,'W4252',4),(5001,'were','were',0,0,0.2667,'W600',4),(5002,'were constructed','were constructed',0,1,1.5333,'W62523623',4),(5003,'were constructed during','were constructed during',0,1,1.7667,'W62523623652',4),(5004,'when','when',0,0,0.2667,'W500',4),(5005,'when the','when the',0,1,1.2667,'W530',4),(5006,'when the mainland','when the mainland',0,1,1.5667,'W535453',4),(5007,'where','where',0,0,0.3333,'W600',4),(5008,'where cultures','where cultures',0,1,1.4667,'W624362',4),(5009,'where cultures collide','where cultures collide',0,1,1.7333,'W62436243',4),(5010,'who','who',0,0,0.2,'W000',4),(5011,'who was','who was',0,1,1.2333,'W200',4),(5012,'who was then','who was then',0,1,1.4,'W235',4),(5013,'with ming','with ming',0,1,1.3,'W352',4),(5014,'with ming dynasty','with ming dynasty',0,1,1.5667,'W3523523',4),(5015,'with the pingpu','with the pingpu',0,1,1.5,'W31521',4),(5016,'with them','with them',0,1,1.3,'W350',4),(5017,'with them mainland','with them mainland',0,1,1.6,'W35453',4),(5018,'wwii','wwii',0,0,0.2667,'W000',4),(5019,'wwii when','wwii when',0,1,1.3,'W500',4),(5020,'wwii when the','wwii when the',0,1,1.4333,'W530',4),(5021,'years increased','year increased',0,1,1.5,'Y6252623',4),(5022,'years increased immigration','year increased immigration',0,1,1.9,'Y625262352635',4),(5023,'yuanshan','yuanshan',0,0,0.5333,'Y525',4),(5024,'yuanshan prehistoric','yuanshan prehistoric',0,1,1.6667,'Y525162362',4),(5025,'yuanshan prehistoric site','yuanshan prehistoric site',0,1,1.8333,'Y5251623623',4),(5026,'zhangzhou','zhangzhou',0,0,0.6,'Z520',4),(5027,'zhangzhou and','zhangzhou and',0,1,1.4333,'Z5253',4),(5028,'zhangzhou and canton','zhangzhou and canton',0,1,1.6667,'Z52532535',4),(5029,'zhishanyan','zhishanyan',0,0,0.6667,'Z500',4),(5030,'zhishanyan prehistoric','zhishanyan prehistoric',0,1,1.7333,'Z5162362',4),(5031,'zhishanyan prehistoric site','zhishanyan prehistoric site',0,1,1.9,'Z51623623',4),(5032,'and bali the','and bali the',0,1,1.4,'A53143',3),(5033,'bali the','bali the',0,1,1.2667,'B430',3),(5034,'bali the spanish','bali the spanish',0,1,1.5333,'B432152',3);
/*!40000 ALTER TABLE `bk078_finder_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_finder_taxonomy`
--

DROP TABLE IF EXISTS `bk078_finder_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_finder_taxonomy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `access` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `state` (`state`),
  KEY `ordering` (`ordering`),
  KEY `access` (`access`),
  KEY `idx_parent_published` (`parent_id`,`state`,`access`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_finder_taxonomy`
--

LOCK TABLES `bk078_finder_taxonomy` WRITE;
/*!40000 ALTER TABLE `bk078_finder_taxonomy` DISABLE KEYS */;
INSERT INTO `bk078_finder_taxonomy` VALUES (1,0,'ROOT',0,0,0),(2,1,'Type',1,1,0),(4,1,'Author',1,1,0),(6,1,'Category',1,1,0),(8,1,'Language',1,1,0),(9,8,'*',1,1,0),(11,1,'K2 Category',1,1,0),(38,4,'Super User',1,1,0),(20,2,'Category',1,1,0),(39,11,'About',1,1,0),(40,8,'en-GB',1,1,0),(41,11,'Destination',1,1,0),(37,2,'K2 Item',1,1,0),(35,2,'Contact',1,1,0),(36,6,'Uncategorised',1,1,0);
/*!40000 ALTER TABLE `bk078_finder_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_categories`
--

DROP TABLE IF EXISTS `bk078_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__#__ table.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `extension` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `metadesc` varchar(1024) NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`extension`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_language` (`language`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_categories`
--

LOCK TABLES `bk078_categories` WRITE;
/*!40000 ALTER TABLE `bk078_categories` DISABLE KEYS */;
INSERT INTO `bk078_categories` VALUES (1,0,0,0,21,0,'','system','ROOT','root','','',1,0,'0000-00-00 00:00:00',1,'{}','','','',367,'2009-10-18 16:07:09',0,'0000-00-00 00:00:00',0,'*'),(2,27,1,1,2,1,'uncategorised','com_content','Uncategorised','uncategorised','','',1,0,'0000-00-00 00:00:00',1,'{\"target\":\"\",\"image\":\"\"}','','','{\"page_title\":\"\",\"author\":\"\",\"robots\":\"\"}',367,'2010-06-28 13:26:37',0,'0000-00-00 00:00:00',0,'*'),(3,28,1,3,4,1,'uncategorised','com_banners','Uncategorised','uncategorised','','',1,0,'0000-00-00 00:00:00',1,'{\"target\":\"\",\"image\":\"\",\"foobar\":\"\"}','','','{\"page_title\":\"\",\"author\":\"\",\"robots\":\"\"}',367,'2010-06-28 13:27:35',0,'0000-00-00 00:00:00',0,'*'),(4,29,1,5,6,1,'uncategorised','com_contact','Uncategorised','uncategorised','','',1,0,'0000-00-00 00:00:00',1,'{\"target\":\"\",\"image\":\"\"}','','','{\"page_title\":\"\",\"author\":\"\",\"robots\":\"\"}',367,'2010-06-28 13:27:57',0,'0000-00-00 00:00:00',0,'*'),(5,30,1,7,8,1,'uncategorised','com_newsfeeds','Uncategorised','uncategorised','','',1,0,'0000-00-00 00:00:00',1,'{\"target\":\"\",\"image\":\"\"}','','','{\"page_title\":\"\",\"author\":\"\",\"robots\":\"\"}',367,'2010-06-28 13:28:15',0,'0000-00-00 00:00:00',0,'*'),(6,31,1,9,10,1,'uncategorised','com_weblinks','Uncategorised','uncategorised','','',1,0,'0000-00-00 00:00:00',1,'{\"target\":\"\",\"image\":\"\"}','','','{\"page_title\":\"\",\"author\":\"\",\"robots\":\"\"}',367,'2010-06-28 13:28:33',0,'0000-00-00 00:00:00',0,'*'),(7,36,1,11,12,1,'basic','com_rokcandy','Basic','basic','','',1,0,'0000-00-00 00:00:00',1,'','','','',367,'2012-07-17 14:44:21',0,'0000-00-00 00:00:00',0,''),(8,37,1,13,14,1,'typography','com_rokcandy','Typography','typography','','',1,0,'0000-00-00 00:00:00',1,'','','','',367,'2012-07-17 14:44:21',0,'0000-00-00 00:00:00',0,''),(9,38,1,15,16,1,'uncategorised','com_rokcandy','Uncategorised','uncategorised','','',1,0,'0000-00-00 00:00:00',1,'','','','',367,'2012-07-17 14:44:21',0,'0000-00-00 00:00:00',0,''),(10,40,1,17,18,1,'alert-boxes','com_rokcandy','Alert Boxes','alert-boxes','','',1,0,'0000-00-00 00:00:00',1,'{\"category_layout\":\"\",\"image\":\"\"}','','','{\"author\":\"\",\"robots\":\"\"}',367,'2012-07-17 14:49:49',0,'0000-00-00 00:00:00',0,'*'),(11,41,1,19,20,1,'fluid-columns','com_rokcandy','Fluid Columns','fluid-columns','','',1,0,'0000-00-00 00:00:00',1,'{\"category_layout\":\"\",\"image\":\"\"}','','','{\"author\":\"\",\"robots\":\"\"}',367,'2012-07-17 14:49:55',0,'0000-00-00 00:00:00',0,'*');
/*!40000 ALTER TABLE `bk078_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_osmembership_subscribers`
--

DROP TABLE IF EXISTS `bk078_osmembership_subscribers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_osmembership_subscribers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zip` varchar(50) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `fax` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `comment` text,
  `created_date` datetime DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `from_date` datetime DEFAULT NULL,
  `to_date` datetime DEFAULT NULL,
  `published` tinyint(3) unsigned DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `tax_amount` decimal(10,2) DEFAULT NULL,
  `discount_amount` decimal(10,2) DEFAULT NULL,
  `gross_amount` decimal(10,2) DEFAULT NULL,
  `subscription_code` varchar(20) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `act` varchar(10) DEFAULT NULL,
  `from_subscription_id` int(11) NOT NULL DEFAULT '0',
  `renew_option_id` int(11) NOT NULL DEFAULT '0',
  `upgrade_option_id` int(11) NOT NULL DEFAULT '0',
  `first_reminder_sent` tinyint(4) NOT NULL DEFAULT '0',
  `second_reminder_sent` tinyint(4) NOT NULL DEFAULT '0',
  `payment_made` int(11) NOT NULL DEFAULT '0',
  `membership_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_osmembership_subscribers`
--

LOCK TABLES `bk078_osmembership_subscribers` WRITE;
/*!40000 ALTER TABLE `bk078_osmembership_subscribers` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_osmembership_subscribers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_comprofiler_plugin`
--

DROP TABLE IF EXISTS `bk078_comprofiler_plugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_comprofiler_plugin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `element` varchar(100) NOT NULL DEFAULT '',
  `type` varchar(100) DEFAULT '',
  `folder` varchar(100) DEFAULT '',
  `backend_menu` varchar(255) NOT NULL DEFAULT '',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(3) NOT NULL DEFAULT '0',
  `iscore` tinyint(3) NOT NULL DEFAULT '0',
  `client_id` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_folder` (`published`,`client_id`,`access`,`folder`),
  KEY `type_pub_order` (`type`,`published`,`ordering`)
) ENGINE=MyISAM AUTO_INCREMENT=500 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_comprofiler_plugin`
--

LOCK TABLES `bk078_comprofiler_plugin` WRITE;
/*!40000 ALTER TABLE `bk078_comprofiler_plugin` DISABLE KEYS */;
INSERT INTO `bk078_comprofiler_plugin` VALUES (1,'CB Core','cb.core','user','plug_cbcore','',0,1,1,1,0,0,'0000-00-00 00:00:00',''),(2,'CB Connections','cb.connections','user','plug_cbconnections','',0,3,0,1,0,0,'0000-00-00 00:00:00',''),(3,'Content Author','cb.authortab','user','plug_cbmamboauthortab','',0,4,0,1,0,0,'0000-00-00 00:00:00',''),(4,'Forum integration','cb.simpleboardtab','user','plug_cbsimpleboardtab','',0,5,0,1,0,0,'0000-00-00 00:00:00',''),(5,'Mamblog Blog','cb.mamblogtab','user','plug_cbmamblogtab','',0,6,0,1,0,0,'0000-00-00 00:00:00',''),(6,'YaNC Newsletters','yanc','user','plug_yancintegration','',0,7,0,1,0,0,'0000-00-00 00:00:00',''),(7,'Default','default','templates','default','',0,1,1,1,0,0,'0000-00-00 00:00:00',''),(8,'WinClassic','winclassic','templates','winclassic','',0,2,1,1,0,0,'0000-00-00 00:00:00',''),(9,'WebFX','webfx','templates','webfx','',0,3,1,1,0,0,'0000-00-00 00:00:00',''),(10,'OSX','osx','templates','osx','',0,4,1,1,0,0,'0000-00-00 00:00:00',''),(11,'Luna','luna','templates','luna','',0,5,1,1,0,0,'0000-00-00 00:00:00',''),(12,'Dark','dark','templates','dark','',0,6,1,1,0,0,'0000-00-00 00:00:00',''),(13,'Default language (English)','default_language','language','default_language','',0,-1,1,1,0,0,'0000-00-00 00:00:00',''),(14,'CB Menu','cb.menu','user','plug_cbmenu','',0,2,1,1,0,0,'0000-00-00 00:00:00',''),(15,'Private Message System','pms.mypmspro','user','plug_pms_mypmspro','',0,8,0,1,0,0,'0000-00-00 00:00:00','');
/*!40000 ALTER TABLE `bk078_comprofiler_plugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_qunipay_hooks`
--

DROP TABLE IF EXISTS `bk078_qunipay_hooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_qunipay_hooks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paymentoptionid` int(11) NOT NULL,
  `installedhookid` varchar(64) NOT NULL,
  `order` tinyint(4) NOT NULL,
  `published` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_qunipay_hooks`
--

LOCK TABLES `bk078_qunipay_hooks` WRITE;
/*!40000 ALTER TABLE `bk078_qunipay_hooks` DISABLE KEYS */;
INSERT INTO `bk078_qunipay_hooks` VALUES (1,1,'InfoText',1,1),(2,1,'RadioButtons',2,1);
/*!40000 ALTER TABLE `bk078_qunipay_hooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_languages`
--

DROP TABLE IF EXISTS `bk078_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_languages` (
  `lang_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang_code` char(7) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_native` varchar(50) NOT NULL,
  `sef` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `description` varchar(512) NOT NULL,
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `sitename` varchar(1024) NOT NULL DEFAULT '',
  `published` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  UNIQUE KEY `idx_sef` (`sef`),
  UNIQUE KEY `idx_image` (`image`),
  UNIQUE KEY `idx_langcode` (`lang_code`),
  KEY `idx_ordering` (`ordering`),
  KEY `idx_access` (`access`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_languages`
--

LOCK TABLES `bk078_languages` WRITE;
/*!40000 ALTER TABLE `bk078_languages` DISABLE KEYS */;
INSERT INTO `bk078_languages` VALUES (1,'en-GB','English (UK)','English (UK)','en','en','','','','',1,0,1);
/*!40000 ALTER TABLE `bk078_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_k2_items`
--

DROP TABLE IF EXISTS `bk078_k2_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_k2_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `catid` int(11) NOT NULL,
  `published` smallint(6) NOT NULL DEFAULT '0',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `video` text,
  `gallery` varchar(255) DEFAULT NULL,
  `extra_fields` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `extra_fields_search` text NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL,
  `checked_out` int(10) unsigned NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `publish_up` datetime NOT NULL,
  `publish_down` datetime NOT NULL,
  `trash` smallint(6) NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `featured` smallint(6) NOT NULL DEFAULT '0',
  `featured_ordering` int(11) NOT NULL DEFAULT '0',
  `image_caption` text NOT NULL,
  `image_credits` varchar(255) NOT NULL,
  `video_caption` text NOT NULL,
  `video_credits` varchar(255) NOT NULL,
  `hits` int(10) unsigned NOT NULL,
  `params` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `metakey` text NOT NULL,
  `plugins` text NOT NULL,
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item` (`published`,`publish_up`,`publish_down`,`trash`,`access`),
  KEY `catid` (`catid`),
  KEY `created_by` (`created_by`),
  KEY `ordering` (`ordering`),
  KEY `featured` (`featured`),
  KEY `featured_ordering` (`featured_ordering`),
  KEY `hits` (`hits`),
  KEY `created` (`created`),
  KEY `language` (`language`),
  FULLTEXT KEY `search` (`title`,`introtext`,`fulltext`,`extra_fields_search`,`image_caption`,`image_credits`,`video_caption`,`video_credits`,`metadesc`,`metakey`),
  FULLTEXT KEY `title` (`title`)
) ENGINE=MyISAM AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_k2_items`
--

LOCK TABLES `bk078_k2_items` WRITE;
/*!40000 ALTER TABLE `bk078_k2_items` DISABLE KEYS */;
INSERT INTO `bk078_k2_items` VALUES (106,'Beijing','beijing',31,1,'','',NULL,NULL,'[]','','2012-10-14 10:40:01',367,'',0,'0000-00-00 00:00:00','2012-10-14 11:01:39',367,'2012-10-14 10:40:01','0000-00-00 00:00:00',0,1,1,0,0,'','','','',0,'{\"catItemTitle\":\"\",\"catItemTitleLinked\":\"\",\"catItemFeaturedNotice\":\"\",\"catItemAuthor\":\"\",\"catItemDateCreated\":\"\",\"catItemRating\":\"\",\"catItemImage\":\"\",\"catItemIntroText\":\"\",\"catItemExtraFields\":\"\",\"catItemHits\":\"\",\"catItemCategory\":\"\",\"catItemTags\":\"\",\"catItemAttachments\":\"\",\"catItemAttachmentsCounter\":\"\",\"catItemVideo\":\"\",\"catItemVideoWidth\":\"\",\"catItemVideoHeight\":\"\",\"catItemAudioWidth\":\"\",\"catItemAudioHeight\":\"\",\"catItemVideoAutoPlay\":\"\",\"catItemImageGallery\":\"\",\"catItemDateModified\":\"\",\"catItemReadMore\":\"\",\"catItemCommentsAnchor\":\"\",\"catItemK2Plugins\":\"\",\"itemDateCreated\":\"\",\"itemTitle\":\"\",\"itemFeaturedNotice\":\"\",\"itemAuthor\":\"\",\"itemFontResizer\":\"\",\"itemPrintButton\":\"\",\"itemEmailButton\":\"\",\"itemSocialButton\":\"\",\"itemVideoAnchor\":\"\",\"itemImageGalleryAnchor\":\"\",\"itemCommentsAnchor\":\"\",\"itemRating\":\"\",\"itemImage\":\"\",\"itemImgSize\":\"\",\"itemImageMainCaption\":\"\",\"itemImageMainCredits\":\"\",\"itemIntroText\":\"\",\"itemFullText\":\"\",\"itemExtraFields\":\"\",\"itemDateModified\":\"\",\"itemHits\":\"\",\"itemCategory\":\"\",\"itemTags\":\"\",\"itemAttachments\":\"\",\"itemAttachmentsCounter\":\"\",\"itemVideo\":\"\",\"itemVideoWidth\":\"\",\"itemVideoHeight\":\"\",\"itemAudioWidth\":\"\",\"itemAudioHeight\":\"\",\"itemVideoAutoPlay\":\"\",\"itemVideoCaption\":\"\",\"itemVideoCredits\":\"\",\"itemImageGallery\":\"\",\"itemNavigation\":\"\",\"itemComments\":\"\",\"itemTwitterButton\":\"\",\"itemFacebookButton\":\"\",\"itemGooglePlusOneButton\":\"\",\"itemAuthorBlock\":\"\",\"itemAuthorImage\":\"\",\"itemAuthorDescription\":\"\",\"itemAuthorURL\":\"\",\"itemAuthorEmail\":\"\",\"itemAuthorLatest\":\"\",\"itemAuthorLatestLimit\":\"\",\"itemRelated\":\"\",\"itemRelatedLimit\":\"\",\"itemRelatedTitle\":\"\",\"itemRelatedCategory\":\"\",\"itemRelatedImageSize\":\"\",\"itemRelatedIntrotext\":\"\",\"itemRelatedFulltext\":\"\",\"itemRelatedAuthor\":\"\",\"itemRelatedMedia\":\"\",\"itemRelatedImageGallery\":\"\",\"itemK2Plugins\":\"\"}','','robots=\nauthor=','','','*'),(107,'Taipei','taipei',31,1,'<p>Historically, Taipei has always been a place where cultures collide and coalesce. </p>\r\n','\r\n<p>The earliest archaeological evidence of human presence in Taipei was found in the Yuanshan Prehistoric Site (B.C. 5000) and the Zhishanyan Prehistoric Site (B.C. 1000-200). The two sites confirm the early human presence in Taipei and Taipei\'s past as a lake. Later, the Ketagalan group belonging to the Pingpu (\"Plains\") aboriginal tribes began to thrive in areas such as Danshui, Beitou and Bali.</p>\r\n<p>The Spanish arrived in Danshui from Keelung and built Fort Provintia (now known as the Hongmao Fort, or \"red-topped tower\" (red hair castle?). Shortly after, the Dutch invaded south Taiwan and fought for control of the island with Ming Dynasty general Koxinga, who was then stationed in Tainan. After defeating Koxinga’s forces, the Qing government assumed total control of Taiwan.</p>\r\n<p>Southern Chinese immigrants from Quanzhou, Zhangzhou, and Canton began to arrive in Mengjia, then Taiwan\'s largest port, in search of arable land. They fought constantly with the Pingpu tribe as well as among themselves for territory. These early immigrants built houses and temples that reflected a number of regional architectural styles.</p>\r\n<p>Construction of Taipei City was completed in the late 19th century during Emperor Guangxu\'s reign. The historical city gates that we see today were constructed during this period.</p>\r\n<p>Taiwan became a Japanese colony in 1895, after China lost the First Sino-Japanese War. Taiwan remained a Japanese colony until the end of WWII, when the mainland Chinese Nationalist government took over. The influx of Nationalist troops and personnel brought with them mainland Chinese culture to Taiwanese society.</p>\r\n<p>In recent years, increased immigration from Southeast Asia has further contributed to Taipei\'s ever more diversified cultural climate.</p>\r\n<p> </p>\r\n<p> </p>',NULL,NULL,'[]','','2012-10-14 11:01:40',367,'',0,'0000-00-00 00:00:00','2012-10-14 12:12:46',367,'2012-10-14 11:01:40','0000-00-00 00:00:00',0,1,2,0,0,'','','','',5,'{\"catItemTitle\":\"\",\"catItemTitleLinked\":\"\",\"catItemFeaturedNotice\":\"\",\"catItemAuthor\":\"\",\"catItemDateCreated\":\"\",\"catItemRating\":\"\",\"catItemImage\":\"\",\"catItemIntroText\":\"\",\"catItemExtraFields\":\"\",\"catItemHits\":\"\",\"catItemCategory\":\"\",\"catItemTags\":\"\",\"catItemAttachments\":\"\",\"catItemAttachmentsCounter\":\"\",\"catItemVideo\":\"\",\"catItemVideoWidth\":\"\",\"catItemVideoHeight\":\"\",\"catItemAudioWidth\":\"\",\"catItemAudioHeight\":\"\",\"catItemVideoAutoPlay\":\"\",\"catItemImageGallery\":\"\",\"catItemDateModified\":\"\",\"catItemReadMore\":\"\",\"catItemCommentsAnchor\":\"\",\"catItemK2Plugins\":\"\",\"itemDateCreated\":\"\",\"itemTitle\":\"\",\"itemFeaturedNotice\":\"\",\"itemAuthor\":\"\",\"itemFontResizer\":\"\",\"itemPrintButton\":\"\",\"itemEmailButton\":\"\",\"itemSocialButton\":\"\",\"itemVideoAnchor\":\"\",\"itemImageGalleryAnchor\":\"\",\"itemCommentsAnchor\":\"\",\"itemRating\":\"\",\"itemImage\":\"\",\"itemImgSize\":\"\",\"itemImageMainCaption\":\"\",\"itemImageMainCredits\":\"\",\"itemIntroText\":\"\",\"itemFullText\":\"\",\"itemExtraFields\":\"\",\"itemDateModified\":\"\",\"itemHits\":\"\",\"itemCategory\":\"\",\"itemTags\":\"\",\"itemAttachments\":\"\",\"itemAttachmentsCounter\":\"\",\"itemVideo\":\"\",\"itemVideoWidth\":\"\",\"itemVideoHeight\":\"\",\"itemAudioWidth\":\"\",\"itemAudioHeight\":\"\",\"itemVideoAutoPlay\":\"\",\"itemVideoCaption\":\"\",\"itemVideoCredits\":\"\",\"itemImageGallery\":\"\",\"itemNavigation\":\"\",\"itemComments\":\"\",\"itemTwitterButton\":\"\",\"itemFacebookButton\":\"\",\"itemGooglePlusOneButton\":\"\",\"itemAuthorBlock\":\"\",\"itemAuthorImage\":\"\",\"itemAuthorDescription\":\"\",\"itemAuthorURL\":\"\",\"itemAuthorEmail\":\"\",\"itemAuthorLatest\":\"\",\"itemAuthorLatestLimit\":\"\",\"itemRelated\":\"\",\"itemRelatedLimit\":\"\",\"itemRelatedTitle\":\"\",\"itemRelatedCategory\":\"\",\"itemRelatedImageSize\":\"\",\"itemRelatedIntrotext\":\"\",\"itemRelatedFulltext\":\"\",\"itemRelatedAuthor\":\"\",\"itemRelatedMedia\":\"\",\"itemRelatedImageGallery\":\"\",\"itemK2Plugins\":\"\"}','','robots=\nauthor=','','','*'),(108,'Guilin','guilin',31,1,'','',NULL,NULL,'[]','','2012-10-14 11:02:00',367,'',0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,'2012-10-14 11:02:00','0000-00-00 00:00:00',0,1,3,0,0,'','','','',0,'{\"catItemTitle\":\"\",\"catItemTitleLinked\":\"\",\"catItemFeaturedNotice\":\"\",\"catItemAuthor\":\"\",\"catItemDateCreated\":\"\",\"catItemRating\":\"\",\"catItemImage\":\"\",\"catItemIntroText\":\"\",\"catItemExtraFields\":\"\",\"catItemHits\":\"\",\"catItemCategory\":\"\",\"catItemTags\":\"\",\"catItemAttachments\":\"\",\"catItemAttachmentsCounter\":\"\",\"catItemVideo\":\"\",\"catItemVideoWidth\":\"\",\"catItemVideoHeight\":\"\",\"catItemAudioWidth\":\"\",\"catItemAudioHeight\":\"\",\"catItemVideoAutoPlay\":\"\",\"catItemImageGallery\":\"\",\"catItemDateModified\":\"\",\"catItemReadMore\":\"\",\"catItemCommentsAnchor\":\"\",\"catItemK2Plugins\":\"\",\"itemDateCreated\":\"\",\"itemTitle\":\"\",\"itemFeaturedNotice\":\"\",\"itemAuthor\":\"\",\"itemFontResizer\":\"\",\"itemPrintButton\":\"\",\"itemEmailButton\":\"\",\"itemSocialButton\":\"\",\"itemVideoAnchor\":\"\",\"itemImageGalleryAnchor\":\"\",\"itemCommentsAnchor\":\"\",\"itemRating\":\"\",\"itemImage\":\"\",\"itemImgSize\":\"\",\"itemImageMainCaption\":\"\",\"itemImageMainCredits\":\"\",\"itemIntroText\":\"\",\"itemFullText\":\"\",\"itemExtraFields\":\"\",\"itemDateModified\":\"\",\"itemHits\":\"\",\"itemCategory\":\"\",\"itemTags\":\"\",\"itemAttachments\":\"\",\"itemAttachmentsCounter\":\"\",\"itemVideo\":\"\",\"itemVideoWidth\":\"\",\"itemVideoHeight\":\"\",\"itemAudioWidth\":\"\",\"itemAudioHeight\":\"\",\"itemVideoAutoPlay\":\"\",\"itemVideoCaption\":\"\",\"itemVideoCredits\":\"\",\"itemImageGallery\":\"\",\"itemNavigation\":\"\",\"itemComments\":\"\",\"itemTwitterButton\":\"\",\"itemFacebookButton\":\"\",\"itemGooglePlusOneButton\":\"\",\"itemAuthorBlock\":\"\",\"itemAuthorImage\":\"\",\"itemAuthorDescription\":\"\",\"itemAuthorURL\":\"\",\"itemAuthorEmail\":\"\",\"itemAuthorLatest\":\"\",\"itemAuthorLatestLimit\":\"\",\"itemRelated\":\"\",\"itemRelatedLimit\":\"\",\"itemRelatedTitle\":\"\",\"itemRelatedCategory\":\"\",\"itemRelatedImageSize\":\"\",\"itemRelatedIntrotext\":\"\",\"itemRelatedFulltext\":\"\",\"itemRelatedAuthor\":\"\",\"itemRelatedMedia\":\"\",\"itemRelatedImageGallery\":\"\",\"itemK2Plugins\":\"\"}','','robots=\nauthor=','','','*'),(109,'Krabi','krabi',31,1,'','',NULL,NULL,'[]','','2012-10-14 11:02:17',367,'',0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,'2012-10-14 11:02:17','0000-00-00 00:00:00',0,1,4,0,0,'','','','',5,'{\"catItemTitle\":\"\",\"catItemTitleLinked\":\"\",\"catItemFeaturedNotice\":\"\",\"catItemAuthor\":\"\",\"catItemDateCreated\":\"\",\"catItemRating\":\"\",\"catItemImage\":\"\",\"catItemIntroText\":\"\",\"catItemExtraFields\":\"\",\"catItemHits\":\"\",\"catItemCategory\":\"\",\"catItemTags\":\"\",\"catItemAttachments\":\"\",\"catItemAttachmentsCounter\":\"\",\"catItemVideo\":\"\",\"catItemVideoWidth\":\"\",\"catItemVideoHeight\":\"\",\"catItemAudioWidth\":\"\",\"catItemAudioHeight\":\"\",\"catItemVideoAutoPlay\":\"\",\"catItemImageGallery\":\"\",\"catItemDateModified\":\"\",\"catItemReadMore\":\"\",\"catItemCommentsAnchor\":\"\",\"catItemK2Plugins\":\"\",\"itemDateCreated\":\"\",\"itemTitle\":\"\",\"itemFeaturedNotice\":\"\",\"itemAuthor\":\"\",\"itemFontResizer\":\"\",\"itemPrintButton\":\"\",\"itemEmailButton\":\"\",\"itemSocialButton\":\"\",\"itemVideoAnchor\":\"\",\"itemImageGalleryAnchor\":\"\",\"itemCommentsAnchor\":\"\",\"itemRating\":\"\",\"itemImage\":\"\",\"itemImgSize\":\"\",\"itemImageMainCaption\":\"\",\"itemImageMainCredits\":\"\",\"itemIntroText\":\"\",\"itemFullText\":\"\",\"itemExtraFields\":\"\",\"itemDateModified\":\"\",\"itemHits\":\"\",\"itemCategory\":\"\",\"itemTags\":\"\",\"itemAttachments\":\"\",\"itemAttachmentsCounter\":\"\",\"itemVideo\":\"\",\"itemVideoWidth\":\"\",\"itemVideoHeight\":\"\",\"itemAudioWidth\":\"\",\"itemAudioHeight\":\"\",\"itemVideoAutoPlay\":\"\",\"itemVideoCaption\":\"\",\"itemVideoCredits\":\"\",\"itemImageGallery\":\"\",\"itemNavigation\":\"\",\"itemComments\":\"\",\"itemTwitterButton\":\"\",\"itemFacebookButton\":\"\",\"itemGooglePlusOneButton\":\"\",\"itemAuthorBlock\":\"\",\"itemAuthorImage\":\"\",\"itemAuthorDescription\":\"\",\"itemAuthorURL\":\"\",\"itemAuthorEmail\":\"\",\"itemAuthorLatest\":\"\",\"itemAuthorLatestLimit\":\"\",\"itemRelated\":\"\",\"itemRelatedLimit\":\"\",\"itemRelatedTitle\":\"\",\"itemRelatedCategory\":\"\",\"itemRelatedImageSize\":\"\",\"itemRelatedIntrotext\":\"\",\"itemRelatedFulltext\":\"\",\"itemRelatedAuthor\":\"\",\"itemRelatedMedia\":\"\",\"itemRelatedImageGallery\":\"\",\"itemK2Plugins\":\"\"}','','robots=\nauthor=','','','*'),(105,'About Us','about-us',3,1,'<p>The company is an online business necessities involving travel plan, and the background is more than 20 years of experience in the international travel to pick the company with the yo sent ground supporting to customers. Provided by ground travel is legal, with and by the recognition.</p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>','',NULL,NULL,'[]','','2012-10-13 17:43:51',367,'',0,'0000-00-00 00:00:00','2012-10-14 11:58:35',367,'2012-10-13 17:43:51','0000-00-00 00:00:00',0,1,1,0,0,'','','','',17,'{\"catItemTitle\":\"\",\"catItemTitleLinked\":\"\",\"catItemFeaturedNotice\":\"\",\"catItemAuthor\":\"\",\"catItemDateCreated\":\"\",\"catItemRating\":\"\",\"catItemImage\":\"\",\"catItemIntroText\":\"\",\"catItemExtraFields\":\"\",\"catItemHits\":\"\",\"catItemCategory\":\"\",\"catItemTags\":\"\",\"catItemAttachments\":\"\",\"catItemAttachmentsCounter\":\"\",\"catItemVideo\":\"\",\"catItemVideoWidth\":\"\",\"catItemVideoHeight\":\"\",\"catItemAudioWidth\":\"\",\"catItemAudioHeight\":\"\",\"catItemVideoAutoPlay\":\"\",\"catItemImageGallery\":\"\",\"catItemDateModified\":\"\",\"catItemReadMore\":\"\",\"catItemCommentsAnchor\":\"\",\"catItemK2Plugins\":\"\",\"itemDateCreated\":\"\",\"itemTitle\":\"\",\"itemFeaturedNotice\":\"\",\"itemAuthor\":\"\",\"itemFontResizer\":\"\",\"itemPrintButton\":\"\",\"itemEmailButton\":\"\",\"itemSocialButton\":\"\",\"itemVideoAnchor\":\"\",\"itemImageGalleryAnchor\":\"\",\"itemCommentsAnchor\":\"\",\"itemRating\":\"\",\"itemImage\":\"\",\"itemImgSize\":\"\",\"itemImageMainCaption\":\"\",\"itemImageMainCredits\":\"\",\"itemIntroText\":\"\",\"itemFullText\":\"\",\"itemExtraFields\":\"\",\"itemDateModified\":\"\",\"itemHits\":\"\",\"itemCategory\":\"\",\"itemTags\":\"\",\"itemAttachments\":\"\",\"itemAttachmentsCounter\":\"\",\"itemVideo\":\"\",\"itemVideoWidth\":\"\",\"itemVideoHeight\":\"\",\"itemAudioWidth\":\"\",\"itemAudioHeight\":\"\",\"itemVideoAutoPlay\":\"\",\"itemVideoCaption\":\"\",\"itemVideoCredits\":\"\",\"itemImageGallery\":\"\",\"itemNavigation\":\"\",\"itemComments\":\"\",\"itemTwitterButton\":\"\",\"itemFacebookButton\":\"\",\"itemGooglePlusOneButton\":\"\",\"itemAuthorBlock\":\"\",\"itemAuthorImage\":\"\",\"itemAuthorDescription\":\"\",\"itemAuthorURL\":\"\",\"itemAuthorEmail\":\"\",\"itemAuthorLatest\":\"\",\"itemAuthorLatestLimit\":\"\",\"itemRelated\":\"\",\"itemRelatedLimit\":\"\",\"itemRelatedTitle\":\"\",\"itemRelatedCategory\":\"\",\"itemRelatedImageSize\":\"\",\"itemRelatedIntrotext\":\"\",\"itemRelatedFulltext\":\"\",\"itemRelatedAuthor\":\"\",\"itemRelatedMedia\":\"\",\"itemRelatedImageGallery\":\"\",\"itemK2Plugins\":\"\"}','','robots=\nauthor=','','','en-GB');
/*!40000 ALTER TABLE `bk078_k2_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_qunipay_configuration`
--

DROP TABLE IF EXISTS `bk078_qunipay_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_qunipay_configuration` (
  `key` varchar(32) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_qunipay_configuration`
--

LOCK TABLES `bk078_qunipay_configuration` WRITE;
/*!40000 ALTER TABLE `bk078_qunipay_configuration` DISABLE KEYS */;
INSERT INTO `bk078_qunipay_configuration` VALUES ('key','Default key'),('version','2.3.1');
/*!40000 ALTER TABLE `bk078_qunipay_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_qunipay_inputmethod_parameters`
--

DROP TABLE IF EXISTS `bk078_qunipay_inputmethod_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_qunipay_inputmethod_parameters` (
  `paymentoptionid` int(11) NOT NULL,
  `installedid` varchar(64) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`paymentoptionid`,`installedid`,`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_qunipay_inputmethod_parameters`
--

LOCK TABLES `bk078_qunipay_inputmethod_parameters` WRITE;
/*!40000 ALTER TABLE `bk078_qunipay_inputmethod_parameters` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_qunipay_inputmethod_parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_bk078_`
--

DROP TABLE IF EXISTS `bk078_bk078_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_bk078_` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set parent.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `level` int(10) unsigned NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asset_name` (`name`),
  KEY `idx_lft_rgt` (`lft`,`rgt`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_bk078_`
--

LOCK TABLES `bk078_bk078_` WRITE;
/*!40000 ALTER TABLE `bk078_bk078_` DISABLE KEYS */;
INSERT INTO `bk078_bk078_` VALUES (1,0,1,418,0,'root.1','Root Asset','{\"core.login.site\":{\"6\":1,\"2\":1},\"core.login.admin\":{\"6\":1},\"core.login.offline\":{\"6\":1},\"core.admin\":{\"8\":1},\"core.manage\":{\"7\":1},\"core.create\":{\"6\":1,\"3\":1},\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"core.edit.own\":{\"6\":1,\"3\":1}}'),(2,1,1,2,1,'com_admin','com_admin','{}'),(3,1,3,6,1,'com_banners','com_banners','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(4,1,7,8,1,'com_cache','com_cache','{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}'),(5,1,9,10,1,'com_checkin','com_checkin','{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}'),(6,1,11,12,1,'com_config','com_config','{}'),(7,1,13,16,1,'com_contact','com_contact','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(8,1,17,20,1,'com_content','com_content','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(9,1,21,22,1,'com_cpanel','com_cpanel','{}'),(10,1,23,24,1,'com_installer','com_installer','{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1},\"core.delete\":[],\"core.edit.state\":[]}'),(11,1,25,26,1,'com_languages','com_languages','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(12,1,27,28,1,'com_login','com_login','{}'),(13,1,29,30,1,'com_mailto','com_mailto','{}'),(14,1,31,32,1,'com_massmail','com_massmail','{}'),(15,1,33,34,1,'com_media','com_media','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":{\"5\":1}}'),(16,1,35,36,1,'com_menus','com_menus','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(17,1,37,38,1,'com_messages','com_messages','{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}'),(18,1,39,40,1,'com_modules','com_modules','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(19,1,41,44,1,'com_newsfeeds','com_newsfeeds','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(20,1,45,46,1,'com_plugins','com_plugins','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(21,1,47,48,1,'com_redirect','com_redirect','{\"core.admin\":{\"7\":1},\"core.manage\":[]}'),(22,1,49,50,1,'com_search','com_search','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),(23,1,51,52,1,'com_templates','com_templates','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(24,1,53,54,1,'com_users','com_users','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.own\":{\"6\":1},\"core.edit.state\":[]}'),(25,1,55,58,1,'com_weblinks','com_weblinks','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(26,1,59,60,1,'com_wrapper','com_wrapper','{}'),(27,8,18,19,2,'com_content.category.2','Uncategorised','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(28,3,4,5,2,'com_banners.category.3','Uncategorised','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(29,7,14,15,2,'com_contact.category.4','Uncategorised','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(30,19,42,43,2,'com_newsfeeds.category.5','Uncategorised','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(31,25,56,57,2,'com_weblinks.category.6','Uncategorised','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(32,1,414,415,1,'com_gantry','gantry','{}'),(33,1,416,417,1,'com_k2','k2','{\"core.admin\":[],\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}');
/*!40000 ALTER TABLE `bk078_bk078_` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_redirect_links`
--

DROP TABLE IF EXISTS `bk078_redirect_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_redirect_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_url` varchar(255) NOT NULL,
  `new_url` varchar(255) NOT NULL,
  `referer` varchar(150) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(4) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_link_old` (`old_url`),
  KEY `idx_link_modifed` (`modified_date`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_redirect_links`
--

LOCK TABLES `bk078_redirect_links` WRITE;
/*!40000 ALTER TABLE `bk078_redirect_links` DISABLE KEYS */;
INSERT INTO `bk078_redirect_links` VALUES (1,'http://localhost/tm/framework/index.php/portfolio/columns-1','','http://localhost/tm/framework/index.php/portfolio/columns-1','',0,-2,'2011-12-25 14:33:38','0000-00-00 00:00:00'),(2,'http://localhost/tm/framework/','','http://localhost/tm/framework/index.php/portfolio/columns-2','',0,-2,'2012-01-12 16:20:41','0000-00-00 00:00:00'),(3,'http://192.168.7.8/chris/tm/framework/index.php/privacy-policy','','http://192.168.7.8/chris/tm/framework/index.php/portfolio/columns-2','',0,-2,'2012-01-18 06:33:14','0000-00-00 00:00:00'),(4,'http://localhost/chris/tm/framework/index.php/privacy-policy','','http://localhost/chris/tm/framework/index.php/blog','',0,-2,'2012-01-18 08:52:47','0000-00-00 00:00:00'),(5,'http://localhost/chris/tm/theme867/installation/index.php','','http://localhost/chris/tm/theme867/installation/index.php','',0,-2,'2012-01-18 10:03:39','0000-00-00 00:00:00'),(6,'http://localhost/chris/tm/framework/index.php/about/our-team','','http://localhost/chris/tm/framework/index.php/blog','',0,-2,'2012-01-27 11:03:57','0000-00-00 00:00:00'),(7,'http://localhost/chris/tm/framework/index.php/about/our-history','','http://localhost/chris/tm/framework/index.php/blog','',0,-2,'2012-01-27 11:04:01','0000-00-00 00:00:00'),(8,'http://localhost/chris/tm/framework/index.php/about/company-overview','','http://localhost/chris/tm/framework/index.php/blog','',0,-2,'2012-01-27 11:04:03','0000-00-00 00:00:00'),(9,'http://localhost/joomla/framework_clones/index.php/en/administrator','','','',0,-2,'2012-04-13 11:13:24','0000-00-00 00:00:00'),(10,'http://localhost/joomla/framework_clones/index.php?option=com_k2&view=item&cid=','','http://localhost/joomla/framework_clones/index.php/component/k2/item/add?tmpl=component','',0,-2,'2012-04-13 14:25:38','0000-00-00 00:00:00'),(11,'http://localhost/framework_clones/index.php/about/company-overview/testimonials/faqs','','http://localhost/framework_clones/','',0,-2,'2012-05-21 09:21:54','0000-00-00 00:00:00'),(12,'http://localhost/framework_clones/index.php/component/k2/item/','','','',0,-2,'2012-05-31 09:43:43','0000-00-00 00:00:00'),(13,'http://localhost/framework_clones/index.php/about1','','','',1,-2,'2012-05-31 09:57:48','0000-00-00 00:00:00'),(14,'http://localhost/framework_clones/index.php/portfolio/columns-21','','','',0,-2,'2012-05-31 11:42:13','0000-00-00 00:00:00'),(15,'http://localhost/framework_clones/index.php/blog1','','','',0,-2,'2012-05-31 12:11:56','0000-00-00 00:00:00'),(16,'index.php?option=com_k2&view=item&layout=item&id=70','index.php/404','','',0,1,'2012-05-31 12:12:30','0000-00-00 00:00:00'),(17,'http://localhost/framework_clones/index.php/about/images/system/digits.png','','http://localhost/framework_clones/index.php/about/faqs','',0,0,'2012-05-31 13:47:24','0000-00-00 00:00:00'),(18,'http://localhost/framework_clones/index.php/blogdfgg/item/69-blog-itedfddm-8','','','',0,0,'2012-06-01 08:29:42','0000-00-00 00:00:00'),(19,'http://localhost/framework_clones/index.php?option=com_k2&view=itemlddfgdfgist&layout=category&task=category&id=3&Itemid=116','','','',0,0,'2012-06-01 08:30:20','0000-00-00 00:00:00'),(20,'http://192.168.9.26/Framework/2012/08 August/theme1141/index.php/blo','','','',1,0,'2012-08-28 09:22:22','0000-00-00 00:00:00'),(21,'http://192.168.1.101:8083/installation/index.php','','http://192.168.1.101:8083/installation/index.php','',1,0,'2012-10-13 14:23:27','0000-00-00 00:00:00'),(22,'http://192.168.1.101:8083/index.php/about-us','','http://192.168.1.101:8083/','',2,0,'2012-10-13 19:01:13','0000-00-00 00:00:00'),(23,'http://192.168.1.101:8083/index.php/404','','http://192.168.1.101:8083/','',40,0,'2012-10-13 19:01:13','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `bk078_redirect_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_finder_links_terms6`
--

DROP TABLE IF EXISTS `bk078_finder_links_terms6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_finder_links_terms6` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_finder_links_terms6`
--

LOCK TABLES `bk078_finder_links_terms6` WRITE;
/*!40000 ALTER TABLE `bk078_finder_links_terms6` DISABLE KEYS */;
INSERT INTO `bk078_finder_links_terms6` VALUES (64,4170,0.37338),(64,4171,2.00662),(64,4172,2.19338),(64,4173,0.48),(64,4174,1.8),(64,4175,1.95996),(64,4176,0.32669),(64,4177,0.98),(64,4178,1.16669),(64,4179,0.18669),(64,4180,0.91),(64,4181,1.14331),(64,4182,0.18669),(64,4183,0.91),(64,4184,1.14331),(65,4254,0.02331),(65,4255,0.91),(65,4256,0.98),(67,4254,0.18669),(67,4703,0.74662),(67,4704,2.14662),(67,4705,1.26),(67,4706,1.35331),(67,4707,0.32669),(67,4708,0.98),(67,4709,1.19),(67,4710,0.18669),(67,4711,0.98),(67,4712,1.16669),(67,4713,1.07331),(67,4714,1.28331);
/*!40000 ALTER TABLE `bk078_finder_links_terms6` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_k2_extra_fields`
--

DROP TABLE IF EXISTS `bk078_k2_extra_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_k2_extra_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(255) NOT NULL,
  `group` int(11) NOT NULL,
  `published` tinyint(4) NOT NULL,
  `ordering` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group` (`group`),
  KEY `published` (`published`),
  KEY `ordering` (`ordering`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_k2_extra_fields`
--

LOCK TABLES `bk078_k2_extra_fields` WRITE;
/*!40000 ALTER TABLE `bk078_k2_extra_fields` DISABLE KEYS */;
INSERT INTO `bk078_k2_extra_fields` VALUES (1,'Client','[{\"name\":null,\"value\":\"\",\"target\":null}]','textfield',1,0,1),(2,'Date','[{\"name\":null,\"value\":\"\",\"target\":null}]','date',1,0,2),(3,'Info','[]','textfield',1,0,3),(4,'URL','[{\"name\":null,\"value\":\"\",\"target\":null}]','textfield',1,0,4),(5,'Author','[{\"name\":null,\"value\":\"\",\"target\":null}]','textfield',2,0,1),(6,'Website','[{\"name\":null,\"value\":\"\",\"target\":null}]','textfield',2,1,2),(7,'Company','[{\"name\":null,\"value\":\"\",\"target\":null}]','textfield',2,1,3),(8,'Thumbnail URL','[{\"name\":null,\"value\":\"\",\"target\":null}]','textfield',3,0,1);
/*!40000 ALTER TABLE `bk078_k2_extra_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_osmembership_renewrates`
--

DROP TABLE IF EXISTS `bk078_osmembership_renewrates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_osmembership_renewrates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_id` int(11) DEFAULT NULL,
  `number_days` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_osmembership_renewrates`
--

LOCK TABLES `bk078_osmembership_renewrates` WRITE;
/*!40000 ALTER TABLE `bk078_osmembership_renewrates` DISABLE KEYS */;
INSERT INTO `bk078_osmembership_renewrates` VALUES (3,1,90,798.00);
/*!40000 ALTER TABLE `bk078_osmembership_renewrates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_overrider`
--

DROP TABLE IF EXISTS `bk078_overrider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_overrider` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `constant` varchar(255) NOT NULL,
  `string` text NOT NULL,
  `file` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_overrider`
--

LOCK TABLES `bk078_overrider` WRITE;
/*!40000 ALTER TABLE `bk078_overrider` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_overrider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_comprofiler_userreports`
--

DROP TABLE IF EXISTS `bk078_comprofiler_userreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_comprofiler_userreports` (
  `reportid` int(11) NOT NULL AUTO_INCREMENT,
  `reporteduser` int(11) NOT NULL DEFAULT '0',
  `reportedbyuser` int(11) NOT NULL DEFAULT '0',
  `reportedondate` date NOT NULL DEFAULT '0000-00-00',
  `reportexplaination` text NOT NULL,
  `reportedstatus` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`reportid`),
  KEY `status_user_date` (`reportedstatus`,`reporteduser`,`reportedondate`),
  KEY `reportedbyuser_ondate` (`reportedbyuser`,`reportedondate`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_comprofiler_userreports`
--

LOCK TABLES `bk078_comprofiler_userreports` WRITE;
/*!40000 ALTER TABLE `bk078_comprofiler_userreports` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_comprofiler_userreports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_qunilicense_purchases`
--

DROP TABLE IF EXISTS `bk078_qunilicense_purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_qunilicense_purchases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paymentid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `resourceId` int(11) NOT NULL,
  `licenseid` int(11) NOT NULL,
  `purchasedate` datetime NOT NULL,
  `active` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_qunilicense_purchases`
--

LOCK TABLES `bk078_qunilicense_purchases` WRITE;
/*!40000 ALTER TABLE `bk078_qunilicense_purchases` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_qunilicense_purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_update_sites`
--

DROP TABLE IF EXISTS `bk078_update_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_update_sites` (
  `update_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `location` text NOT NULL,
  `enabled` int(11) DEFAULT '0',
  `last_check_timestamp` bigint(20) DEFAULT '0',
  PRIMARY KEY (`update_site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='Update Sites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_update_sites`
--

LOCK TABLES `bk078_update_sites` WRITE;
/*!40000 ALTER TABLE `bk078_update_sites` DISABLE KEYS */;
INSERT INTO `bk078_update_sites` VALUES (1,'Joomla Core','collection','http://update.joomla.org/core/list.xml',1,1350670702),(2,'Joomla Extension Directory','collection','http://update.joomla.org/jed/list.xml',1,1350670702),(17,'Gantry Framework Update Site','extension','http://www.gantry-framework.org/updates/joomla16/gantry.xml',1,1350670702),(6,'K2 Updates','extension','http://getk2.org/update.xml',1,1350670702),(10,'jQuery Easy auto updater','extension','http://www.barejoomlatemplates.com/autoupdates/jqueryeasy/jqueryeasy-update.xml',1,1350670702),(14,'Accredited Joomla! Translations','collection','http://update.joomla.org/language/translationlist.xml',1,1350670702),(16,'RocketTheme Update Directory','collection','http://updates.rockettheme.com/joomla/updates.xml',1,1350670702),(19,'Community Builder Update Site','extension','http://update.joomlapolis.net/versions/comprofiler-1_8-update.xml',1,1350670702);
/*!40000 ALTER TABLE `bk078_update_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_extensions`
--

DROP TABLE IF EXISTS `bk078_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_extensions` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `element` varchar(100) NOT NULL,
  `folder` varchar(100) NOT NULL,
  `client_id` tinyint(3) NOT NULL,
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  `access` int(10) unsigned NOT NULL DEFAULT '1',
  `protected` tinyint(3) NOT NULL DEFAULT '0',
  `manifest_cache` text NOT NULL,
  `params` text NOT NULL,
  `custom_data` text NOT NULL,
  `system_data` text NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) DEFAULT '0',
  `state` int(11) DEFAULT '0',
  PRIMARY KEY (`extension_id`),
  KEY `element_clientid` (`element`,`client_id`),
  KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  KEY `extension` (`type`,`element`,`folder`,`client_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10208 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_extensions`
--

LOCK TABLES `bk078_extensions` WRITE;
/*!40000 ALTER TABLE `bk078_extensions` DISABLE KEYS */;
INSERT INTO `bk078_extensions` VALUES (1,'com_mailto','component','com_mailto','',0,1,1,1,'{\"legacy\":false,\"name\":\"com_mailto\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_MAILTO_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(2,'com_wrapper','component','com_wrapper','',0,1,1,1,'{\"legacy\":false,\"name\":\"com_wrapper\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_WRAPPER_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(3,'com_admin','component','com_admin','',1,1,1,1,'{\"legacy\":false,\"name\":\"com_admin\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_ADMIN_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(4,'com_banners','component','com_banners','',1,1,1,0,'{\"legacy\":false,\"name\":\"com_banners\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_BANNERS_XML_DESCRIPTION\",\"group\":\"\"}','{\"purchase_type\":\"3\",\"track_impressions\":\"0\",\"track_clicks\":\"0\",\"metakey_prefix\":\"\"}','','',0,'0000-00-00 00:00:00',0,0),(5,'com_cache','component','com_cache','',1,1,1,1,'{\"legacy\":false,\"name\":\"com_cache\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_CACHE_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(6,'com_categories','component','com_categories','',1,1,1,1,'{\"legacy\":false,\"name\":\"com_categories\",\"type\":\"component\",\"creationDate\":\"December 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(7,'com_checkin','component','com_checkin','',1,1,1,1,'{\"legacy\":false,\"name\":\"com_checkin\",\"type\":\"component\",\"creationDate\":\"Unknown\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2008 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_CHECKIN_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(8,'com_contact','component','com_contact','',1,1,1,0,'{\"legacy\":false,\"name\":\"com_contact\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_CONTACT_XML_DESCRIPTION\",\"group\":\"\"}','{\"show_contact_category\":\"hide\",\"show_contact_list\":\"0\",\"presentation_style\":\"sliders\",\"show_name\":\"1\",\"show_position\":\"1\",\"show_email\":\"0\",\"show_street_address\":\"1\",\"show_suburb\":\"1\",\"show_state\":\"1\",\"show_postcode\":\"1\",\"show_country\":\"1\",\"show_telephone\":\"1\",\"show_mobile\":\"1\",\"show_fax\":\"1\",\"show_webpage\":\"1\",\"show_misc\":\"1\",\"show_image\":\"1\",\"image\":\"\",\"allow_vcard\":\"0\",\"show_articles\":\"0\",\"show_profile\":\"0\",\"show_links\":\"0\",\"linka_name\":\"\",\"linkb_name\":\"\",\"linkc_name\":\"\",\"linkd_name\":\"\",\"linke_name\":\"\",\"contact_icons\":\"0\",\"icon_address\":\"\",\"icon_email\":\"\",\"icon_telephone\":\"\",\"icon_mobile\":\"\",\"icon_fax\":\"\",\"icon_misc\":\"\",\"show_headings\":\"1\",\"show_position_headings\":\"1\",\"show_email_headings\":\"0\",\"show_telephone_headings\":\"1\",\"show_mobile_headings\":\"0\",\"show_fax_headings\":\"0\",\"allow_vcard_headings\":\"0\",\"show_suburb_headings\":\"1\",\"show_state_headings\":\"1\",\"show_country_headings\":\"1\",\"show_email_form\":\"1\",\"show_email_copy\":\"1\",\"banned_email\":\"\",\"banned_subject\":\"\",\"banned_text\":\"\",\"validate_session\":\"1\",\"custom_reply\":\"0\",\"redirect\":\"\",\"show_category_crumb\":\"0\",\"metakey\":\"\",\"metadesc\":\"\",\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}','','',0,'0000-00-00 00:00:00',0,0),(9,'com_cpanel','component','com_cpanel','',1,1,1,1,'{\"legacy\":false,\"name\":\"com_cpanel\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_CPANEL_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(10,'com_installer','component','com_installer','',1,1,1,1,'{\"legacy\":false,\"name\":\"com_installer\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_INSTALLER_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(11,'com_languages','component','com_languages','',1,1,1,1,'{\"legacy\":false,\"name\":\"com_languages\",\"type\":\"component\",\"creationDate\":\"2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_LANGUAGES_XML_DESCRIPTION\",\"group\":\"\"}','{\"administrator\":\"en-GB\",\"site\":\"en-GB\"}','','',0,'0000-00-00 00:00:00',0,0),(12,'com_login','component','com_login','',1,1,1,1,'{\"legacy\":false,\"name\":\"com_login\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_LOGIN_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(13,'com_media','component','com_media','',1,1,0,1,'{\"legacy\":false,\"name\":\"com_media\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_MEDIA_XML_DESCRIPTION\",\"group\":\"\"}','{\"upload_extensions\":\"bmp,csv,doc,gif,ico,jpg,jpeg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,GIF,ICO,JPG,JPEG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS\",\"upload_maxsize\":\"10\",\"file_path\":\"images\",\"image_path\":\"images\",\"restrict_uploads\":\"1\",\"allowed_media_usergroup\":\"3\",\"check_mime\":\"1\",\"image_extensions\":\"bmp,gif,jpg,png\",\"ignore_extensions\":\"\",\"upload_mime\":\"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,application\\/x-shockwave-flash,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip\",\"upload_mime_illegal\":\"text\\/html\",\"enable_flash\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(14,'com_menus','component','com_menus','',1,1,1,1,'{\"legacy\":false,\"name\":\"com_menus\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_MENUS_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(15,'com_messages','component','com_messages','',1,1,1,1,'{\"legacy\":false,\"name\":\"com_messages\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_MESSAGES_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(16,'com_modules','component','com_modules','',1,1,1,1,'{\"legacy\":false,\"name\":\"com_modules\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_MODULES_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(17,'com_newsfeeds','component','com_newsfeeds','',1,1,1,0,'{\"legacy\":false,\"name\":\"com_newsfeeds\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\"}','{\"show_feed_image\":\"1\",\"show_feed_description\":\"1\",\"show_item_description\":\"1\",\"feed_word_count\":\"0\",\"show_headings\":\"1\",\"show_name\":\"1\",\"show_articles\":\"0\",\"show_link\":\"1\",\"show_description\":\"1\",\"show_description_image\":\"1\",\"display_num\":\"\",\"show_pagination_limit\":\"1\",\"show_pagination\":\"1\",\"show_pagination_results\":\"1\",\"show_cat_items\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(18,'com_plugins','component','com_plugins','',1,1,1,1,'{\"legacy\":false,\"name\":\"com_plugins\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_PLUGINS_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(19,'com_search','component','com_search','',1,1,1,1,'{\"legacy\":false,\"name\":\"com_search\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_SEARCH_XML_DESCRIPTION\",\"group\":\"\"}','{\"enabled\":\"0\",\"show_date\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(20,'com_templates','component','com_templates','',1,1,1,1,'{\"legacy\":false,\"name\":\"com_templates\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_TEMPLATES_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(21,'com_weblinks','component','com_weblinks','',1,1,1,0,'{\"legacy\":false,\"name\":\"com_weblinks\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_WEBLINKS_XML_DESCRIPTION\",\"group\":\"\"}','{\"show_comp_description\":\"1\",\"comp_description\":\"\",\"show_link_hits\":\"1\",\"show_link_description\":\"1\",\"show_other_cats\":\"0\",\"show_headings\":\"0\",\"show_numbers\":\"0\",\"show_report\":\"1\",\"count_clicks\":\"1\",\"target\":\"0\",\"link_icons\":\"\"}','','',0,'0000-00-00 00:00:00',0,0),(22,'com_content','component','com_content','',1,1,0,1,'{\"legacy\":false,\"name\":\"com_content\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_CONTENT_XML_DESCRIPTION\",\"group\":\"\"}','{\"article_layout\":\"_:default\",\"show_title\":\"1\",\"link_titles\":\"1\",\"show_intro\":\"1\",\"show_category\":\"1\",\"link_category\":\"1\",\"show_parent_category\":\"0\",\"link_parent_category\":\"0\",\"show_author\":\"1\",\"link_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_publish_date\":\"1\",\"show_item_navigation\":\"1\",\"show_vote\":\"0\",\"show_readmore\":\"1\",\"show_readmore_title\":\"1\",\"readmore_limit\":\"100\",\"show_icons\":\"1\",\"show_print_icon\":\"1\",\"show_email_icon\":\"1\",\"show_hits\":\"1\",\"show_noauth\":\"0\",\"category_layout\":\"_:blog\",\"show_category_title\":\"0\",\"show_description\":\"0\",\"show_description_image\":\"0\",\"maxLevel\":\"1\",\"show_empty_categories\":\"0\",\"show_no_articles\":\"1\",\"show_subcat_desc\":\"1\",\"show_cat_num_articles\":\"0\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_empty_categories_cat\":\"0\",\"show_subcat_desc_cat\":\"1\",\"show_cat_num_articles_cat\":\"1\",\"num_leading_articles\":\"1\",\"num_intro_articles\":\"4\",\"num_columns\":\"2\",\"num_links\":\"4\",\"multi_column_order\":\"0\",\"orderby_pri\":\"order\",\"orderby_sec\":\"rdate\",\"order_date\":\"published\",\"show_pagination_limit\":\"1\",\"filter_field\":\"hide\",\"show_headings\":\"1\",\"list_show_date\":\"0\",\"date_format\":\"\",\"list_show_hits\":\"1\",\"list_show_author\":\"1\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"show_feed_link\":\"1\",\"feed_summary\":\"0\",\"filters\":{\"1\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"6\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"7\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"2\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"3\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"4\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"5\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"10\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"12\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"8\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"}}}','','',0,'0000-00-00 00:00:00',0,0),(23,'com_config','component','com_config','',1,1,0,1,'{\"legacy\":false,\"name\":\"com_config\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_CONFIG_XML_DESCRIPTION\",\"group\":\"\"}','{\"filters\":{\"1\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"6\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"7\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"2\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"9\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"3\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"4\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"5\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"8\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"}}}','','',0,'0000-00-00 00:00:00',0,0),(24,'com_redirect','component','com_redirect','',1,1,0,1,'{\"legacy\":false,\"name\":\"com_redirect\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_REDIRECT_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(25,'com_users','component','com_users','',1,1,0,1,'{\"legacy\":false,\"name\":\"com_users\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_USERS_XML_DESCRIPTION\",\"group\":\"\"}','{\"allowUserRegistration\":\"1\",\"new_usertype\":\"2\",\"useractivation\":\"1\",\"frontend_userparams\":\"1\",\"mailSubjectPrefix\":\"\",\"mailBodySuffix\":\"\"}','','',0,'0000-00-00 00:00:00',0,0),(100,'PHPMailer','library','phpmailer','',0,1,1,1,'{\"legacy\":false,\"name\":\"PHPMailer\",\"type\":\"library\",\"creationDate\":\"2001\",\"author\":\"PHPMailer\",\"copyright\":\"(c) 2001-2003, Brent R. Matzelle, (c) 2004-2009, Andy Prevost. All Rights Reserved., (c) 2010-2011, Jim Jagielski. All Rights Reserved.\",\"authorEmail\":\"jimjag@gmail.com\",\"authorUrl\":\"https:\\/\\/code.google.com\\/a\\/apache-extras.org\\/p\\/phpmailer\\/\",\"version\":\"5.2\",\"description\":\"LIB_PHPMAILER_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(101,'SimplePie','library','simplepie','',0,1,1,1,'{\"legacy\":false,\"name\":\"SimplePie\",\"type\":\"library\",\"creationDate\":\"2004\",\"author\":\"SimplePie\",\"copyright\":\"Copyright (c) 2004-2009, Ryan Parman and Geoffrey Sneddon\",\"authorEmail\":\"\",\"authorUrl\":\"http:\\/\\/simplepie.org\\/\",\"version\":\"1.2\",\"description\":\"LIB_SIMPLEPIE_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(102,'phputf8','library','phputf8','',0,1,1,1,'{\"legacy\":false,\"name\":\"phputf8\",\"type\":\"library\",\"creationDate\":\"2006\",\"author\":\"Harry Fuecks\",\"copyright\":\"Copyright various authors\",\"authorEmail\":\"hfuecks@gmail.com\",\"authorUrl\":\"http:\\/\\/sourceforge.net\\/projects\\/phputf8\",\"version\":\"0.5\",\"description\":\"LIB_PHPUTF8_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(103,'Joomla! Platform','library','joomla','',0,1,1,1,'{\"legacy\":false,\"name\":\"Joomla! Platform\",\"type\":\"library\",\"creationDate\":\"2008\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"http:\\/\\/www.joomla.org\",\"version\":\"11.4\",\"description\":\"LIB_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(200,'mod_articles_archive','module','mod_articles_archive','',0,1,1,1,'{\"legacy\":false,\"name\":\"mod_articles_archive\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters.\\n\\t\\tAll rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(201,'mod_articles_latest','module','mod_articles_latest','',0,1,1,1,'{\"legacy\":false,\"name\":\"mod_articles_latest\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_LATEST_NEWS_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(202,'mod_articles_popular','module','mod_articles_popular','',0,1,1,0,'{\"legacy\":false,\"name\":\"mod_articles_popular\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_POPULAR_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(203,'mod_banners','module','mod_banners','',0,1,1,1,'{\"legacy\":false,\"name\":\"mod_banners\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_BANNERS_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(204,'mod_breadcrumbs','module','mod_breadcrumbs','',0,1,1,1,'{\"legacy\":false,\"name\":\"mod_breadcrumbs\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_BREADCRUMBS_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(205,'mod_custom','module','mod_custom','',0,1,1,1,'{\"legacy\":false,\"name\":\"mod_custom\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_CUSTOM_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(206,'mod_feed','module','mod_feed','',0,1,1,1,'{\"legacy\":false,\"name\":\"mod_feed\",\"type\":\"module\",\"creationDate\":\"July 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_FEED_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(207,'mod_footer','module','mod_footer','',0,1,1,1,'{\"legacy\":false,\"name\":\"mod_footer\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_FOOTER_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(208,'mod_login','module','mod_login','',0,1,1,1,'{\"legacy\":false,\"name\":\"mod_login\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_LOGIN_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(209,'mod_menu','module','mod_menu','',0,1,1,1,'{\"legacy\":false,\"name\":\"mod_menu\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_MENU_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(210,'mod_articles_news','module','mod_articles_news','',0,1,1,0,'{\"legacy\":false,\"name\":\"mod_articles_news\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_ARTICLES_NEWS_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(211,'mod_random_image','module','mod_random_image','',0,1,1,0,'{\"legacy\":false,\"name\":\"mod_random_image\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_RANDOM_IMAGE_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(212,'mod_related_items','module','mod_related_items','',0,1,1,0,'{\"legacy\":false,\"name\":\"mod_related_items\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_RELATED_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(213,'mod_search','module','mod_search','',0,1,1,0,'{\"legacy\":false,\"name\":\"mod_search\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_SEARCH_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(214,'mod_stats','module','mod_stats','',0,1,1,0,'{\"legacy\":false,\"name\":\"mod_stats\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_STATS_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(215,'mod_syndicate','module','mod_syndicate','',0,1,1,1,'{\"legacy\":false,\"name\":\"mod_syndicate\",\"type\":\"module\",\"creationDate\":\"May 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_SYNDICATE_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(216,'mod_users_latest','module','mod_users_latest','',0,1,1,1,'{\"legacy\":false,\"name\":\"mod_users_latest\",\"type\":\"module\",\"creationDate\":\"December 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_USERS_LATEST_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(217,'mod_weblinks','module','mod_weblinks','',0,1,1,0,'{\"legacy\":false,\"name\":\"mod_weblinks\",\"type\":\"module\",\"creationDate\":\"July 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_WEBLINKS_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(218,'mod_whosonline','module','mod_whosonline','',0,1,1,0,'{\"legacy\":false,\"name\":\"mod_whosonline\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_WHOSONLINE_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(219,'mod_wrapper','module','mod_wrapper','',0,1,1,0,'{\"legacy\":false,\"name\":\"mod_wrapper\",\"type\":\"module\",\"creationDate\":\"October 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_WRAPPER_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(220,'mod_articles_category','module','mod_articles_category','',0,1,1,1,'{\"legacy\":false,\"name\":\"mod_articles_category\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_ARTICLES_CATEGORY_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(221,'mod_articles_categories','module','mod_articles_categories','',0,1,1,1,'{\"legacy\":false,\"name\":\"mod_articles_categories\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(222,'mod_languages','module','mod_languages','',0,1,1,1,'{\"legacy\":false,\"name\":\"mod_languages\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_LANGUAGES_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(300,'mod_custom','module','mod_custom','',1,1,1,1,'{\"legacy\":false,\"name\":\"mod_custom\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_CUSTOM_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(301,'mod_feed','module','mod_feed','',1,1,1,0,'{\"legacy\":false,\"name\":\"mod_feed\",\"type\":\"module\",\"creationDate\":\"July 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_FEED_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(302,'mod_latest','module','mod_latest','',1,1,1,0,'{\"legacy\":false,\"name\":\"mod_latest\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_LATEST_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(303,'mod_logged','module','mod_logged','',1,1,1,0,'{\"legacy\":false,\"name\":\"mod_logged\",\"type\":\"module\",\"creationDate\":\"January 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_LOGGED_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(304,'mod_login','module','mod_login','',1,1,1,1,'{\"legacy\":false,\"name\":\"mod_login\",\"type\":\"module\",\"creationDate\":\"March 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_LOGIN_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(305,'mod_menu','module','mod_menu','',1,1,1,0,'{\"legacy\":false,\"name\":\"mod_menu\",\"type\":\"module\",\"creationDate\":\"March 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_MENU_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(307,'mod_popular','module','mod_popular','',1,1,1,0,'{\"legacy\":false,\"name\":\"mod_popular\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_POPULAR_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(308,'mod_quickicon','module','mod_quickicon','',1,1,1,1,'{\"legacy\":false,\"name\":\"mod_quickicon\",\"type\":\"module\",\"creationDate\":\"Nov 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_QUICKICON_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(309,'mod_status','module','mod_status','',1,1,1,0,'{\"legacy\":false,\"name\":\"mod_status\",\"type\":\"module\",\"creationDate\":\"Feb 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_STATUS_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(310,'mod_submenu','module','mod_submenu','',1,1,1,0,'{\"legacy\":false,\"name\":\"mod_submenu\",\"type\":\"module\",\"creationDate\":\"Feb 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_SUBMENU_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(311,'mod_title','module','mod_title','',1,1,1,0,'{\"legacy\":false,\"name\":\"mod_title\",\"type\":\"module\",\"creationDate\":\"Nov 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_TITLE_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(312,'mod_toolbar','module','mod_toolbar','',1,1,1,1,'{\"legacy\":false,\"name\":\"mod_toolbar\",\"type\":\"module\",\"creationDate\":\"Nov 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_TOOLBAR_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(313,'mod_multilangstatus','module','mod_multilangstatus','',1,1,1,0,'{\"legacy\":false,\"name\":\"mod_multilangstatus\",\"type\":\"module\",\"creationDate\":\"September 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_MULTILANGSTATUS_XML_DESCRIPTION\",\"group\":\"\"}','{\"cache\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(400,'plg_authentication_gmail','plugin','gmail','authentication',0,0,1,0,'{\"legacy\":false,\"name\":\"plg_authentication_gmail\",\"type\":\"plugin\",\"creationDate\":\"February 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_GMAIL_XML_DESCRIPTION\",\"group\":\"\"}','{\"applysuffix\":\"0\",\"suffix\":\"\",\"verifypeer\":\"1\",\"user_blacklist\":\"\"}','','',0,'0000-00-00 00:00:00',1,0),(401,'plg_authentication_joomla','plugin','joomla','authentication',0,1,1,1,'{\"legacy\":false,\"name\":\"plg_authentication_joomla\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_AUTH_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(402,'plg_authentication_ldap','plugin','ldap','authentication',0,0,1,0,'{\"legacy\":false,\"name\":\"plg_authentication_ldap\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_LDAP_XML_DESCRIPTION\",\"group\":\"\"}','{\"host\":\"\",\"port\":\"389\",\"use_ldapV3\":\"0\",\"negotiate_tls\":\"0\",\"no_referrals\":\"0\",\"auth_method\":\"bind\",\"base_dn\":\"\",\"search_string\":\"\",\"users_dn\":\"\",\"username\":\"admin\",\"password\":\"bobby7\",\"ldap_fullname\":\"fullName\",\"ldap_email\":\"mail\",\"ldap_uid\":\"uid\"}','','',0,'0000-00-00 00:00:00',3,0),(404,'plg_content_emailcloak','plugin','emailcloak','content',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_content_emailcloak\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_CONTENT_EMAILCLOAK_XML_DESCRIPTION\",\"group\":\"\"}','{\"mode\":\"1\"}','','',0,'0000-00-00 00:00:00',1,0),(405,'plg_content_geshi','plugin','geshi','content',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_content_geshi\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"\",\"authorUrl\":\"qbnz.com\\/highlighter\",\"version\":\"2.5.0\",\"description\":\"PLG_CONTENT_GESHI_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',2,0),(406,'plg_content_loadmodule','plugin','loadmodule','content',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_content_loadmodule\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_LOADMODULE_XML_DESCRIPTION\",\"group\":\"\"}','{\"style\":\"xhtml\"}','','',0,'0000-00-00 00:00:00',0,0),(407,'plg_content_pagebreak','plugin','pagebreak','content',0,1,1,1,'{\"legacy\":false,\"name\":\"plg_content_pagebreak\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_CONTENT_PAGEBREAK_XML_DESCRIPTION\",\"group\":\"\"}','{\"title\":\"1\",\"multipage_toc\":\"1\",\"showall\":\"1\"}','','',0,'0000-00-00 00:00:00',4,0),(408,'plg_content_pagenavigation','plugin','pagenavigation','content',0,1,1,1,'{\"legacy\":false,\"name\":\"plg_content_pagenavigation\",\"type\":\"plugin\",\"creationDate\":\"January 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_PAGENAVIGATION_XML_DESCRIPTION\",\"group\":\"\"}','{\"position\":\"1\"}','','',0,'0000-00-00 00:00:00',5,0),(409,'plg_content_vote','plugin','vote','content',0,1,1,1,'{\"legacy\":false,\"name\":\"plg_content_vote\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_VOTE_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',6,0),(410,'plg_editors_codemirror','plugin','codemirror','editors',0,1,1,1,'{\"legacy\":false,\"name\":\"plg_editors_codemirror\",\"type\":\"plugin\",\"creationDate\":\"28 March 2011\",\"author\":\"Marijn Haverbeke\",\"copyright\":\"\",\"authorEmail\":\"N\\/A\",\"authorUrl\":\"\",\"version\":\"1.0\",\"description\":\"PLG_CODEMIRROR_XML_DESCRIPTION\",\"group\":\"\"}','{\"linenumbers\":\"0\",\"tabmode\":\"indent\"}','','',0,'0000-00-00 00:00:00',1,0),(411,'plg_editors_none','plugin','none','editors',0,1,1,1,'{\"legacy\":false,\"name\":\"plg_editors_none\",\"type\":\"plugin\",\"creationDate\":\"August 2004\",\"author\":\"Unknown\",\"copyright\":\"\",\"authorEmail\":\"N\\/A\",\"authorUrl\":\"\",\"version\":\"2.5.0\",\"description\":\"PLG_NONE_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',2,0),(412,'plg_editors_tinymce','plugin','tinymce','editors',0,1,1,1,'{\"legacy\":false,\"name\":\"plg_editors_tinymce\",\"type\":\"plugin\",\"creationDate\":\"2005-2012\",\"author\":\"Moxiecode Systems AB\",\"copyright\":\"Moxiecode Systems AB\",\"authorEmail\":\"N\\/A\",\"authorUrl\":\"tinymce.moxiecode.com\\/\",\"version\":\"3.5.4.1\",\"description\":\"PLG_TINY_XML_DESCRIPTION\",\"group\":\"\"}','{\"mode\":\"1\",\"skin\":\"0\",\"compressed\":\"0\",\"cleanup_startup\":\"0\",\"cleanup_save\":\"2\",\"entity_encoding\":\"raw\",\"lang_mode\":\"0\",\"lang_code\":\"en\",\"text_direction\":\"ltr\",\"content_css\":\"1\",\"content_css_custom\":\"\",\"relative_urls\":\"1\",\"newlines\":\"0\",\"invalid_elements\":\"script,applet,iframe\",\"extended_elements\":\"\",\"toolbar\":\"top\",\"toolbar_align\":\"left\",\"html_height\":\"550\",\"html_width\":\"750\",\"element_path\":\"1\",\"fonts\":\"1\",\"paste\":\"1\",\"searchreplace\":\"1\",\"insertdate\":\"1\",\"format_date\":\"%Y-%m-%d\",\"inserttime\":\"1\",\"format_time\":\"%H:%M:%S\",\"colors\":\"1\",\"table\":\"1\",\"smilies\":\"1\",\"media\":\"1\",\"hr\":\"1\",\"directionality\":\"1\",\"fullscreen\":\"1\",\"style\":\"1\",\"layer\":\"1\",\"xhtmlxtras\":\"1\",\"visualchars\":\"1\",\"nonbreaking\":\"1\",\"template\":\"1\",\"blockquote\":\"1\",\"wordcount\":\"1\",\"advimage\":\"1\",\"advlink\":\"1\",\"autosave\":\"1\",\"contextmenu\":\"1\",\"inlinepopups\":\"1\",\"safari\":\"0\",\"custom_plugin\":\"\",\"custom_button\":\"\"}','','',0,'0000-00-00 00:00:00',3,0),(413,'plg_editors-xtd_article','plugin','article','editors-xtd',0,1,1,1,'{\"legacy\":false,\"name\":\"plg_editors-xtd_article\",\"type\":\"plugin\",\"creationDate\":\"October 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_ARTICLE_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',1,0),(414,'plg_editors-xtd_image','plugin','image','editors-xtd',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_editors-xtd_image\",\"type\":\"plugin\",\"creationDate\":\"August 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_IMAGE_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',2,0),(415,'plg_editors-xtd_pagebreak','plugin','pagebreak','editors-xtd',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_editors-xtd_pagebreak\",\"type\":\"plugin\",\"creationDate\":\"August 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_EDITORSXTD_PAGEBREAK_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',3,0),(416,'plg_editors-xtd_readmore','plugin','readmore','editors-xtd',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_editors-xtd_readmore\",\"type\":\"plugin\",\"creationDate\":\"March 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_READMORE_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',4,0),(417,'plg_search_categories','plugin','categories','search',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_search_categories\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_SEARCH_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\"}','{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(418,'plg_search_contacts','plugin','contacts','search',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_search_contacts\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_SEARCH_CONTACTS_XML_DESCRIPTION\",\"group\":\"\"}','{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(419,'plg_search_content','plugin','content','search',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_search_content\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_SEARCH_CONTENT_XML_DESCRIPTION\",\"group\":\"\"}','{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(420,'plg_search_newsfeeds','plugin','newsfeeds','search',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_search_newsfeeds\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_SEARCH_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\"}','{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(421,'plg_search_weblinks','plugin','weblinks','search',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_search_weblinks\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_SEARCH_WEBLINKS_XML_DESCRIPTION\",\"group\":\"\"}','{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(422,'plg_system_languagefilter','plugin','languagefilter','system',0,0,1,1,'{\"legacy\":false,\"name\":\"plg_system_languagefilter\",\"type\":\"plugin\",\"creationDate\":\"July 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_SYSTEM_LANGUAGEFILTER_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',6,0),(423,'plg_system_p3p','plugin','p3p','system',0,1,1,1,'{\"legacy\":false,\"name\":\"plg_system_p3p\",\"type\":\"plugin\",\"creationDate\":\"September 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_P3P_XML_DESCRIPTION\",\"group\":\"\"}','{\"headers\":\"NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM\"}','','',0,'0000-00-00 00:00:00',9,0),(424,'plg_system_cache','plugin','cache','system',0,0,1,1,'{\"legacy\":false,\"name\":\"plg_system_cache\",\"type\":\"plugin\",\"creationDate\":\"February 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_CACHE_XML_DESCRIPTION\",\"group\":\"\"}','{\"browsercache\":\"0\",\"cachetime\":\"15\"}','','',0,'0000-00-00 00:00:00',16,0),(425,'plg_system_debug','plugin','debug','system',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_system_debug\",\"type\":\"plugin\",\"creationDate\":\"December 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_DEBUG_XML_DESCRIPTION\",\"group\":\"\"}','{\"profile\":\"1\",\"queries\":\"1\",\"memory\":\"1\",\"language_files\":\"1\",\"language_strings\":\"1\",\"strip-first\":\"1\",\"strip-prefix\":\"\",\"strip-suffix\":\"\"}','','',0,'0000-00-00 00:00:00',11,0),(426,'plg_system_log','plugin','log','system',0,1,1,1,'{\"legacy\":false,\"name\":\"plg_system_log\",\"type\":\"plugin\",\"creationDate\":\"April 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_LOG_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',12,0),(427,'plg_system_redirect','plugin','redirect','system',0,1,1,1,'{\"legacy\":false,\"name\":\"plg_system_redirect\",\"type\":\"plugin\",\"creationDate\":\"April 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_REDIRECT_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',13,0),(428,'plg_system_remember','plugin','remember','system',0,1,1,1,'{\"legacy\":false,\"name\":\"plg_system_remember\",\"type\":\"plugin\",\"creationDate\":\"April 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_REMEMBER_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',14,0),(429,'plg_system_sef','plugin','sef','system',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_system_sef\",\"type\":\"plugin\",\"creationDate\":\"December 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_SEF_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',15,0),(430,'plg_system_logout','plugin','logout','system',0,1,1,1,'{\"legacy\":false,\"name\":\"plg_system_logout\",\"type\":\"plugin\",\"creationDate\":\"April 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_SYSTEM_LOGOUT_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',10,0),(431,'plg_user_contactcreator','plugin','contactcreator','user',0,1,1,1,'{\"legacy\":false,\"name\":\"plg_user_contactcreator\",\"type\":\"plugin\",\"creationDate\":\"August 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_CONTACTCREATOR_XML_DESCRIPTION\",\"group\":\"\"}','{\"autowebpage\":\"\",\"category\":\"34\",\"autopublish\":\"0\"}','','',0,'0000-00-00 00:00:00',1,0),(432,'plg_user_joomla','plugin','joomla','user',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_user_joomla\",\"type\":\"plugin\",\"creationDate\":\"December 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2009 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_USER_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}','{\"autoregister\":\"1\"}','','',0,'0000-00-00 00:00:00',2,0),(433,'plg_user_profile','plugin','profile','user',0,1,1,1,'{\"legacy\":false,\"name\":\"plg_user_profile\",\"type\":\"plugin\",\"creationDate\":\"January 2008\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_USER_PROFILE_XML_DESCRIPTION\",\"group\":\"\"}','{\"register-require_address1\":\"1\",\"register-require_address2\":\"1\",\"register-require_city\":\"1\",\"register-require_region\":\"1\",\"register-require_country\":\"1\",\"register-require_postal_code\":\"1\",\"register-require_phone\":\"1\",\"register-require_website\":\"1\",\"register-require_favoritebook\":\"1\",\"register-require_aboutme\":\"1\",\"register-require_tos\":\"1\",\"register-require_dob\":\"1\",\"profile-require_address1\":\"1\",\"profile-require_address2\":\"1\",\"profile-require_city\":\"1\",\"profile-require_region\":\"1\",\"profile-require_country\":\"1\",\"profile-require_postal_code\":\"1\",\"profile-require_phone\":\"1\",\"profile-require_website\":\"1\",\"profile-require_favoritebook\":\"1\",\"profile-require_aboutme\":\"1\",\"profile-require_tos\":\"1\",\"profile-require_dob\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(434,'plg_extension_joomla','plugin','joomla','extension',0,1,1,1,'{\"legacy\":false,\"name\":\"plg_extension_joomla\",\"type\":\"plugin\",\"creationDate\":\"May 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_EXTENSION_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',1,0),(435,'plg_content_joomla','plugin','joomla','content',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_content_joomla\",\"type\":\"plugin\",\"creationDate\":\"November 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_CONTENT_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(500,'atomic','template','atomic','',0,1,1,0,'{\"legacy\":false,\"name\":\"atomic\",\"type\":\"template\",\"creationDate\":\"10\\/10\\/09\",\"author\":\"Ron Severdia\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"contact@kontentdesign.com\",\"authorUrl\":\"http:\\/\\/www.kontentdesign.com\",\"version\":\"2.5.0\",\"description\":\"TPL_ATOMIC_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(502,'bluestork','template','bluestork','',1,1,1,0,'{\"legacy\":false,\"name\":\"bluestork\",\"type\":\"template\",\"creationDate\":\"07\\/02\\/09\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"TPL_BLUESTORK_XML_DESCRIPTION\",\"group\":\"\"}','{\"useRoundedCorners\":\"1\",\"showSiteName\":\"0\",\"textBig\":\"0\",\"highContrast\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(503,'beez_20','template','beez_20','',0,1,1,0,'{\"legacy\":false,\"name\":\"beez_20\",\"type\":\"template\",\"creationDate\":\"25 November 2009\",\"author\":\"Angie Radtke\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"a.radtke@derauftritt.de\",\"authorUrl\":\"http:\\/\\/www.der-auftritt.de\",\"version\":\"2.5.0\",\"description\":\"TPL_BEEZ2_XML_DESCRIPTION\",\"group\":\"\"}','{\"wrapperSmall\":\"53\",\"wrapperLarge\":\"72\",\"sitetitle\":\"\",\"sitedescription\":\"\",\"navposition\":\"center\",\"templatecolor\":\"nature\"}','','',0,'0000-00-00 00:00:00',0,0),(504,'hathor','template','hathor','',1,1,1,0,'{\"legacy\":false,\"name\":\"hathor\",\"type\":\"template\",\"creationDate\":\"May 2010\",\"author\":\"Andrea Tarr\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"hathor@tarrconsulting.com\",\"authorUrl\":\"http:\\/\\/www.tarrconsulting.com\",\"version\":\"2.5.0\",\"description\":\"TPL_HATHOR_XML_DESCRIPTION\",\"group\":\"\"}','{\"showSiteName\":\"0\",\"colourChoice\":\"0\",\"boldText\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(505,'beez5','template','beez5','',0,1,1,0,'{\"legacy\":false,\"name\":\"beez5\",\"type\":\"template\",\"creationDate\":\"21 May 2010\",\"author\":\"Angie Radtke\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"a.radtke@derauftritt.de\",\"authorUrl\":\"http:\\/\\/www.der-auftritt.de\",\"version\":\"2.5.0\",\"description\":\"TPL_BEEZ5_XML_DESCRIPTION\",\"group\":\"\"}','{\"wrapperSmall\":\"53\",\"wrapperLarge\":\"72\",\"sitetitle\":\"\",\"sitedescription\":\"\",\"navposition\":\"center\",\"html5\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(600,'English (United Kingdom)','language','en-GB','',0,1,1,1,'{\"legacy\":false,\"name\":\"English (United Kingdom)\",\"type\":\"language\",\"creationDate\":\"2008-03-15\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.5\",\"description\":\"en-GB site language\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(601,'English (United Kingdom)','language','en-GB','',1,1,1,1,'{\"legacy\":false,\"name\":\"English (United Kingdom)\",\"type\":\"language\",\"creationDate\":\"2008-03-15\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.5\",\"description\":\"en-GB administrator language\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(700,'files_joomla','file','joomla','',0,1,1,1,'{\"legacy\":false,\"name\":\"files_joomla\",\"type\":\"file\",\"creationDate\":\"September 2012\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.7\",\"description\":\"FILES_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(800,'PKG_JOOMLA','package','pkg_joomla','',0,1,1,1,'{\"legacy\":false,\"name\":\"PKG_JOOMLA\",\"type\":\"package\",\"creationDate\":\"2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"http:\\/\\/www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PKG_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(10012,'K2 Comments','module','mod_k2_comments','',0,1,0,0,'{\"legacy\":true,\"name\":\"K2 Comments\",\"type\":\"module\",\"creationDate\":\"May 9th, 2012\",\"author\":\"JoomlaWorks\",\"copyright\":\"Copyright (c) 2006 - 2012 JoomlaWorks Ltd. All rights reserved.\",\"authorEmail\":\"contact@joomlaworks.net\",\"authorUrl\":\"www.joomlaworks.net\",\"version\":\"2.5.7\",\"description\":\"MOD_K2_COMMENTS_DESCRIPTION\",\"group\":\"\"}','{\"moduleclass_sfx\":\"\",\"module_usage\":\"\",\"\":\"K2_TOP_COMMENTERS\",\"catfilter\":\"0\",\"category_id\":\"\",\"comments_limit\":\"5\",\"comments_word_limit\":\"10\",\"commenterName\":\"1\",\"commentAvatar\":\"1\",\"commentAvatarWidthSelect\":\"custom\",\"commentAvatarWidth\":\"50\",\"commentDate\":\"1\",\"commentDateFormat\":\"absolute\",\"commentLink\":\"1\",\"itemTitle\":\"1\",\"itemCategory\":\"1\",\"feed\":\"1\",\"commenters_limit\":\"5\",\"commenterNameOrUsername\":\"1\",\"commenterAvatar\":\"1\",\"commenterAvatarWidthSelect\":\"custom\",\"commenterAvatarWidth\":\"50\",\"commenterLink\":\"1\",\"commenterCommentsCounter\":\"1\",\"commenterLatestComment\":\"1\",\"cache\":\"1\",\"cache_time\":\"900\"}','','',0,'0000-00-00 00:00:00',0,0),(10111,'Gantry','library','lib_gantry','',0,1,1,0,'{\"legacy\":false,\"name\":\"Gantry\",\"type\":\"library\",\"creationDate\":\"September 18, 2012\",\"author\":\"RocketTheme, LLC\",\"copyright\":\"(C) 2005 - 2012 RocketTheme, LLC. All rights reserved.\",\"authorEmail\":\"support@rockettheme.com\",\"authorUrl\":\"http:\\/\\/www.rockettheme.com\",\"version\":\"4.0.5\",\"description\":\"Gantry Starting Template for Joomla! v4.0.5\",\"group\":\"\"}','{}','{\"last_update\":1350670715}','',0,'0000-00-00 00:00:00',0,0),(10003,'gantry','component','com_gantry','',0,1,0,0,'{\"legacy\":false,\"name\":\"Gantry\",\"type\":\"component\",\"creationDate\":\"September 18, 2012\",\"author\":\"RocketTheme, LLC\",\"copyright\":\"(C) 2005 - 2012 RocketTheme, LLC. All rights reserved.\",\"authorEmail\":\"support@rockettheme.com\",\"authorUrl\":\"http:\\/\\/www.rockettheme.com\",\"version\":\"4.0.5\",\"description\":\"Gantry Starting Template for Joomla! v4.0.5\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10004,'System - Gantry','plugin','gantry','system',0,1,1,0,'{\"legacy\":false,\"name\":\"System - Gantry\",\"type\":\"plugin\",\"creationDate\":\"September 18, 2012\",\"author\":\"RocketTheme, LLC\",\"copyright\":\"(C) 2005 - 2012 RocketTheme, LLC. All rights reserved.\",\"authorEmail\":\"support@rockettheme.com\",\"authorUrl\":\"http:\\/\\/www.rockettheme.com\",\"version\":\"4.0.5\",\"description\":\"Gantry System Plugin for Joomla\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',1,0),(10013,'K2 Content','module','mod_k2_content','',0,1,0,0,'{\"legacy\":true,\"name\":\"K2 Content\",\"type\":\"module\",\"creationDate\":\"May 9th, 2012\",\"author\":\"JoomlaWorks\",\"copyright\":\"Copyright (c) 2006 - 2012 JoomlaWorks Ltd. All rights reserved.\",\"authorEmail\":\"contact@joomlaworks.net\",\"authorUrl\":\"www.joomlaworks.net\",\"version\":\"2.5.7\",\"description\":\"K2_MOD_K2_CONTENT_DESCRIPTION\",\"group\":\"\"}','{\"moduleclass_sfx\":\"\",\"getTemplate\":\"Default\",\"source\":\"filter\",\"\":\"K2_OTHER_OPTIONS\",\"catfilter\":\"0\",\"category_id\":\"\",\"getChildren\":\"0\",\"itemCount\":\"5\",\"itemsOrdering\":\"\",\"FeaturedItems\":\"1\",\"popularityRange\":\"\",\"videosOnly\":\"0\",\"item\":\"\",\"items\":\"\",\"itemTitle\":\"1\",\"itemAuthor\":\"1\",\"itemAuthorAvatar\":\"1\",\"itemAuthorAvatarWidthSelect\":\"custom\",\"itemAuthorAvatarWidth\":\"50\",\"userDescription\":\"1\",\"itemIntroText\":\"1\",\"itemIntroTextWordLimit\":\"\",\"itemImage\":\"1\",\"itemImgSize\":\"Small\",\"itemVideo\":\"1\",\"itemVideoCaption\":\"1\",\"itemVideoCredits\":\"1\",\"itemAttachments\":\"1\",\"itemTags\":\"1\",\"itemCategory\":\"1\",\"itemDateCreated\":\"1\",\"itemHits\":\"1\",\"itemReadMore\":\"1\",\"itemExtraFields\":\"0\",\"itemCommentsCounter\":\"1\",\"feed\":\"1\",\"itemPreText\":\"\",\"itemCustomLink\":\"0\",\"itemCustomLinkTitle\":\"\",\"itemCustomLinkURL\":\"http:\\/\\/\",\"itemCustomLinkMenuItem\":\"\",\"K2Plugins\":\"1\",\"JPlugins\":\"1\",\"cache\":\"1\",\"cache_time\":\"900\"}','','',0,'0000-00-00 00:00:00',0,0),(10014,'K2 Login','module','mod_k2_login','',0,1,0,0,'{\"legacy\":true,\"name\":\"K2 Login\",\"type\":\"module\",\"creationDate\":\"May 9th, 2012\",\"author\":\"JoomlaWorks\",\"copyright\":\"Copyright (c) 2006 - 2012 JoomlaWorks Ltd. All rights reserved.\",\"authorEmail\":\"contact@joomlaworks.net\",\"authorUrl\":\"www.joomlaworks.net\",\"version\":\"2.5.7\",\"description\":\"K2_LOGIN_DESCRIPTION\",\"group\":\"\"}','{\"moduleclass_sfx\":\"\",\"pretext\":\"\",\"\":\"K2_LOGIN_LOGOUT_REDIRECTION\",\"name\":\"1\",\"userAvatar\":\"1\",\"userAvatarWidthSelect\":\"custom\",\"userAvatarWidth\":\"50\",\"menu\":\"\",\"login\":\"\",\"logout\":\"\",\"usesecure\":\"0\",\"cache\":\"0\",\"cache_time\":\"900\"}','','',0,'0000-00-00 00:00:00',0,0),(10015,'K2 Tools','module','mod_k2_tools','',0,1,0,0,'{\"legacy\":true,\"name\":\"K2 Tools\",\"type\":\"module\",\"creationDate\":\"May 9th, 2012\",\"author\":\"JoomlaWorks\",\"copyright\":\"Copyright (c) 2006 - 2012 JoomlaWorks Ltd. All rights reserved.\",\"authorEmail\":\"contact@joomlaworks.net\",\"authorUrl\":\"www.joomlaworks.net\",\"version\":\"2.5.7\",\"description\":\"K2_TOOLS\",\"group\":\"\"}','{\"moduleclass_sfx\":\"\",\"module_usage\":\"0\",\"\":\"K2_CUSTOM_CODE_SETTINGS\",\"archiveItemsCounter\":\"1\",\"archiveCategory\":\"\",\"authors_module_category\":\"\",\"authorItemsCounter\":\"1\",\"authorAvatar\":\"1\",\"authorAvatarWidthSelect\":\"custom\",\"authorAvatarWidth\":\"50\",\"authorLatestItem\":\"1\",\"calendarCategory\":\"\",\"home\":\"\",\"seperator\":\"\",\"root_id\":\"\",\"end_level\":\"\",\"categoriesListOrdering\":\"\",\"categoriesListItemsCounter\":\"1\",\"root_id2\":\"\",\"catfilter\":\"0\",\"category_id\":\"\",\"getChildren\":\"0\",\"liveSearch\":\"\",\"width\":\"20\",\"text\":\"\",\"button\":\"\",\"imagebutton\":\"\",\"button_text\":\"\",\"min_size\":\"75\",\"max_size\":\"300\",\"cloud_limit\":\"30\",\"cloud_category\":\"0\",\"cloud_category_recursive\":\"0\",\"customCode\":\"\",\"parsePhp\":\"0\",\"K2Plugins\":\"0\",\"JPlugins\":\"0\",\"cache\":\"1\",\"cache_time\":\"900\"}','','',0,'0000-00-00 00:00:00',0,0),(10016,'K2 Users','module','mod_k2_users','',0,1,0,0,'{\"legacy\":true,\"name\":\"K2 Users\",\"type\":\"module\",\"creationDate\":\"May 9th, 2012\",\"author\":\"JoomlaWorks\",\"copyright\":\"Copyright (c) 2006 - 2012 JoomlaWorks Ltd. All rights reserved.\",\"authorEmail\":\"contact@joomlaworks.net\",\"authorUrl\":\"www.joomlaworks.net\",\"version\":\"2.5.7\",\"description\":\"K2_MOD_K2_USERS_DESCRTIPTION\",\"group\":\"\"}','{\"moduleclass_sfx\":\"\",\"getTemplate\":\"Default\",\"source\":\"0\",\"\":\"K2_DISPLAY_OPTIONS\",\"filter\":\"1\",\"K2UserGroup\":\"\",\"ordering\":\"1\",\"limit\":\"4\",\"userIDs\":\"\",\"userName\":\"1\",\"userAvatar\":\"1\",\"userAvatarWidthSelect\":\"custom\",\"userAvatarWidth\":\"50\",\"userDescription\":\"1\",\"userDescriptionWordLimit\":\"\",\"userURL\":\"1\",\"userEmail\":\"0\",\"userFeed\":\"1\",\"userItemCount\":\"1\",\"cache\":\"1\",\"cache_time\":\"900\"}','','',0,'0000-00-00 00:00:00',0,0),(10017,'K2 User','module','mod_k2_user','',0,1,0,0,'{\"legacy\":true,\"name\":\"K2 User\",\"type\":\"module\",\"creationDate\":\"May 9th, 2012\",\"author\":\"JoomlaWorks\",\"copyright\":\"Copyright (c) 2006 - 2012 JoomlaWorks Ltd. All rights reserved.\",\"authorEmail\":\"contact@joomlaworks.net\",\"authorUrl\":\"www.joomlaworks.net\",\"version\":\"2.5.7\",\"description\":\"K2_MOD_K2_USER_DESCRIPTION\",\"group\":\"\"}','{\"moduleclass_sfx\":\"\",\"pretext\":\"\",\"\":\"K2_LOGIN_LOGOUT_REDIRECTION\",\"name\":\"1\",\"userAvatar\":\"1\",\"userAvatarWidthSelect\":\"custom\",\"userAvatarWidth\":\"50\",\"menu\":\"\",\"login\":\"\",\"logout\":\"\",\"usesecure\":\"0\",\"cache\":\"0\",\"cache_time\":\"900\"}','','',0,'0000-00-00 00:00:00',0,0),(10018,'K2 Quick Icons (admin)','module','mod_k2_quickicons','',1,1,2,0,'{\"legacy\":true,\"name\":\"K2 Quick Icons (admin)\",\"type\":\"module\",\"creationDate\":\"May 9th, 2012\",\"author\":\"JoomlaWorks\",\"copyright\":\"Copyright (c) 2006 - 2012 JoomlaWorks Ltd. All rights reserved.\",\"authorEmail\":\"contact@joomlaworks.net\",\"authorUrl\":\"www.joomlaworks.net\",\"version\":\"2.5.7\",\"description\":\"K2_QUICKICONS_FOR_USE_IN_THE_JOOMLA_CONTROL_PANEL_DASHBOARD_PAGE\",\"group\":\"\"}','{\"modCSSStyling\":\"1\",\"modLogo\":\"1\",\"cache\":\"0\",\"cache_time\":\"900\"}','','',0,'0000-00-00 00:00:00',0,0),(10019,'K2 Stats (admin)','module','mod_k2_stats','',1,1,2,0,'{\"legacy\":true,\"name\":\"K2 Stats (admin)\",\"type\":\"module\",\"creationDate\":\"May 9th, 2012\",\"author\":\"JoomlaWorks\",\"copyright\":\"Copyright (c) 2006 - 2012 JoomlaWorks Ltd. All rights reserved.\",\"authorEmail\":\"contact@joomlaworks.net\",\"authorUrl\":\"www.joomlaworks.net\",\"version\":\"2.5.7\",\"description\":\"K2_STATS_FOR_USE_IN_THE_K2_DASHBOARD_PAGE\",\"group\":\"\"}','{\"latestItems\":\"1\",\"popularItems\":\"1\",\"mostCommentedItems\":\"1\",\"latestComments\":\"1\",\"statistics\":\"1\",\"cache\":\"0\",\"cache_time\":\"900\"}','','',0,'0000-00-00 00:00:00',0,0),(10020,'Search - K2','plugin','k2','search',0,1,1,0,'{\"legacy\":true,\"name\":\"Search - K2\",\"type\":\"plugin\",\"creationDate\":\"May 9th, 2012\",\"author\":\"JoomlaWorks\",\"copyright\":\"Copyright (c) 2006 - 2012 JoomlaWorks Ltd. All rights reserved.\",\"authorEmail\":\"contact@joomlaworks.net\",\"authorUrl\":\"www.joomlaworks.net\",\"version\":\"2.5.7\",\"description\":\"K2_THIS_PLUGIN_EXTENDS_THE_DEFAULT_JOOMLA_SEARCH_FUNCTIONALITY_TO_K2_CONTENT\",\"group\":\"\"}','{\"search_limit\":\"50\",\"search_tags\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(10021,'System - K2','plugin','k2','system',0,1,1,0,'{\"legacy\":true,\"name\":\"System - K2\",\"type\":\"plugin\",\"creationDate\":\"May 9th, 2012\",\"author\":\"JoomlaWorks\",\"copyright\":\"Copyright (c) 2006 - 2012 JoomlaWorks Ltd. All rights reserved.\",\"authorEmail\":\"contact@joomlaworks.net\",\"authorUrl\":\"www.joomlaworks.net\",\"version\":\"2.5.7\",\"description\":\"K2_THE_K2_SYSTEM_PLUGIN_IS_USED_TO_ASSIST_THE_PROPER_FUNCTIONALITY_OF_THE_K2_COMPONENT_SITE_WIDE_MAKE_SURE_ITS_ALWAYS_PUBLISHED_WHEN_THE_K2_COMPONENT_IS_INSTALLED\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',3,0),(10022,'User - K2','plugin','k2','user',0,1,1,0,'{\"legacy\":true,\"name\":\"User - K2\",\"type\":\"plugin\",\"creationDate\":\"May 9th, 2012\",\"author\":\"JoomlaWorks\",\"copyright\":\"Copyright (c) 2006 - 2012 JoomlaWorks Ltd. All rights reserved.\",\"authorEmail\":\"contact@joomlaworks.net\",\"authorUrl\":\"www.joomlaworks.net\",\"version\":\"2.5.7\",\"description\":\"K2_A_USER_SYNCHRONIZATION_PLUGIN_FOR_K2\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10023,'k2','component','com_k2','',1,1,0,0,'{\"legacy\":true,\"name\":\"K2\",\"type\":\"component\",\"creationDate\":\"May 9th, 2012\",\"author\":\"JoomlaWorks\",\"copyright\":\"Copyright (c) 2006 - 2012 JoomlaWorks Ltd. All rights reserved.\",\"authorEmail\":\"contact@joomlaworks.net\",\"authorUrl\":\"www.joomlaworks.net\",\"version\":\"2.5.7\",\"description\":\"Thank you for installing K2 by JoomlaWorks, the powerful content extension for Joomla!\",\"group\":\"\"}','{\"enable_css\":\"0\",\"jQueryHandling\":\"1.7remote\",\"backendJQueryHandling\":\"remote\",\"userName\":\"0\",\"userImage\":\"0\",\"userDescription\":\"0\",\"userURL\":\"0\",\"userEmail\":\"0\",\"userFeedLink\":\"0\",\"userFeedIcon\":\"0\",\"userItemCount\":\"10\",\"userItemTitle\":\"1\",\"userItemTitleLinked\":\"1\",\"userItemDateCreated\":\"1\",\"userItemImage\":\"1\",\"userItemIntroText\":\"1\",\"userItemCategory\":\"0\",\"userItemTags\":\"0\",\"userItemCommentsAnchor\":\"0\",\"userItemReadMore\":\"1\",\"userItemK2Plugins\":\"1\",\"defaultUsersItemid\":\"117\",\"tagItemCount\":\"10\",\"tagItemTitle\":\"1\",\"tagItemTitleLinked\":\"1\",\"tagItemDateCreated\":\"0\",\"tagItemImage\":\"1\",\"tagItemIntroText\":\"1\",\"tagItemCategory\":\"0\",\"tagItemReadMore\":\"1\",\"tagItemExtraFields\":\"0\",\"tagOrdering\":\"\",\"tagFeedLink\":\"0\",\"tagFeedIcon\":\"0\",\"defaultTagsItemid\":\"117\",\"genericItemCount\":\"10\",\"genericItemTitle\":\"1\",\"genericItemTitleLinked\":\"1\",\"genericItemDateCreated\":\"1\",\"genericItemImage\":\"1\",\"genericItemIntroText\":\"1\",\"genericItemCategory\":\"0\",\"genericItemReadMore\":\"1\",\"genericItemExtraFields\":\"0\",\"genericFeedLink\":\"0\",\"genericFeedIcon\":\"0\",\"feedLimit\":\"10\",\"feedItemImage\":\"1\",\"feedImgSize\":\"S\",\"feedItemIntroText\":\"1\",\"feedTextWordLimit\":\"\",\"feedItemFullText\":\"1\",\"feedItemTags\":\"0\",\"feedItemVideo\":\"0\",\"feedItemGallery\":\"0\",\"feedItemAttachments\":\"0\",\"feedBogusEmail\":\"\",\"introTextCleanup\":\"0\",\"introTextCleanupExcludeTags\":\"\",\"introTextCleanupTagAttr\":\"\",\"fullTextCleanup\":\"0\",\"fullTextCleanupExcludeTags\":\"\",\"fullTextCleanupTagAttr\":\"\",\"xssFiltering\":\"0\",\"linkPopupWidth\":\"900\",\"linkPopupHeight\":\"600\",\"imagesQuality\":\"100\",\"itemImageXS\":\"114\",\"itemImageS\":\"164\",\"itemImageM\":\"264\",\"itemImageL\":\"444\",\"itemImageXL\":\"940\",\"itemImageGeneric\":\"204\",\"catImageWidth\":\"100\",\"catImageDefault\":\"1\",\"userImageWidth\":\"100\",\"userImageDefault\":\"1\",\"commenterImgWidth\":\"66\",\"onlineImageEditor\":\"splashup\",\"imageTimestamp\":\"0\",\"imageMemoryLimit\":\"\",\"socialButtonCode\":\"<!-- AddThis Button BEGIN -->\\r\\n<div class=\\\"addthis_toolbox addthis_default_style addthis_32x32_style \\\">\\r\\n<a class=\\\"addthis_button_preferred_1\\\"><\\/a>\\r\\n<a class=\\\"addthis_button_preferred_2\\\"><\\/a>\\r\\n<a class=\\\"addthis_button_preferred_3\\\"><\\/a>\\r\\n<a class=\\\"addthis_button_preferred_4\\\"><\\/a>\\r\\n<a class=\\\"addthis_button_preferred_5\\\"><\\/a>\\r\\n<a class=\\\"addthis_button_preferred_6\\\"><\\/a>\\r\\n<a class=\\\"addthis_button_preferred_7\\\"><\\/a>\\r\\n<a class=\\\"addthis_button_preferred_8\\\"><\\/a>\\r\\n<a class=\\\"addthis_button_preferred_9\\\"><\\/a>\\r\\n<a class=\\\"addthis_button_preferred_10\\\"><\\/a>\\r\\n<a class=\\\"addthis_button_preferred_11\\\"><\\/a>\\r\\n<a class=\\\"addthis_button_preferred_12\\\"><\\/a>\\r\\n<a class=\\\"addthis_button_compact\\\"><\\/a>\\r\\n<\\/div>\\r\\n<script type=\\\"text\\/javascript\\\" src=\\\"http:\\/\\/s7.addthis.com\\/js\\/300\\/addthis_widget.js#pubid=xa-4efc06d355052c2c\\\"><\\/script>\\r\\n<!-- AddThis Button END -->\",\"twitterUsername\":\"\",\"facebookImage\":\"XSmall\",\"comments\":\"1\",\"commentsOrdering\":\"DESC\",\"commentsLimit\":\"10\",\"commentsFormPosition\":\"below\",\"commentsPublishing\":\"0\",\"commentsReporting\":\"0\",\"commentsReportRecipient\":\"\",\"inlineCommentsModeration\":\"1\",\"gravatar\":\"0\",\"recaptcha\":\"0\",\"commentsFormNotes\":\"0\",\"commentsFormNotesText\":\"\",\"frontendEditing\":\"1\",\"showImageTab\":\"1\",\"showImageGalleryTab\":\"1\",\"showVideoTab\":\"1\",\"showExtraFieldsTab\":\"1\",\"showAttachmentsTab\":\"1\",\"showK2Plugins\":\"1\",\"sideBarDisplayFrontend\":\"0\",\"mergeEditors\":\"1\",\"sideBarDisplay\":\"1\",\"attachmentsFolder\":\"\",\"hideImportButton\":\"0\",\"taggingSystem\":\"1\",\"lockTags\":\"0\",\"showTagFilter\":\"0\",\"googleSearch\":\"0\",\"googleSearchContainer\":\"k2Container\",\"K2UserProfile\":\"1\",\"K2UserGroup\":\"1\",\"redirect\":\"176\",\"adminSearch\":\"simple\",\"cookieDomain\":\"\",\"recaptcha_public_key\":\"\",\"recaptcha_private_key\":\"\",\"recaptcha_theme\":\"clean\",\"recaptchaOnRegistration\":\"0\",\"stopForumSpam\":\"0\",\"stopForumSpamApiKey\":\"\",\"showItemsCounterAdmin\":\"1\",\"showChildCatItems\":\"1\",\"disableCompactOrdering\":\"0\",\"metaDescLimit\":\"150\",\"SEFReplacements\":\"\\u00c5\\u00a0|S, \\u00c5\\u2019|O, \\u00c5\\u00bd|Z, \\u00c5\\u00a1|s, \\u00c5\\u201c|oe, \\u00c5\\u00be|z, \\u00c5\\u00b8|Y, \\u00c2\\u00a5|Y, \\u00c2\\u00b5|u, \\u00c3\\u20ac|A, \\u00c3\\ufffd|A, \\u00c3\\u201a|A, \\u00c3\\u0192|A, \\u00c3\\u201e|A, \\u00c3\\u2026|A, \\u00c3\\u2020|A, \\u00c3\\u2021|C, \\u00c3\\u02c6|E, \\u00c3\\u2030|E, \\u00c3\\u0160|E, \\u00c3\\u2039|E, \\u00c3\\u0152|I, \\u00c3\\ufffd|I, \\u00c3\\u017d|I, \\u00c3\\ufffd|I, \\u00c3\\ufffd|D, \\u00c3\\u2018|N, \\u00c3\\u2019|O, \\u00c3\\u201c|O, \\u00c3\\u201d|O, \\u00c3\\u2022|O, \\u00c3\\u2013|O, \\u00c3\\u02dc|O, \\u00c3\\u2122|U, \\u00c3\\u0161|U, \\u00c3\\u203a|U, \\u00c3\\u0153|U, \\u00c3\\ufffd|Y, \\u00c3\\u0178|s, \\u00c3\\u00a0|a, \\u00c3\\u00a1|a, \\u00c3\\u00a2|a, \\u00c3\\u00a3|a, \\u00c3\\u00a4|a, \\u00c3\\u00a5|a, \\u00c3\\u00a6|a, \\u00c3\\u00a7|c, \\u00c3\\u00a8|e, \\u00c3\\u00a9|e, \\u00c3\\u00aa|e, \\u00c3\\u00ab|e, \\u00c3\\u00ac|i, \\u00c3\\u00ad|i, \\u00c3\\u00ae|i, \\u00c3\\u00af|i, \\u00c3\\u00b0|o, \\u00c3\\u00b1|n, \\u00c3\\u00b2|o, \\u00c3\\u00b3|o, \\u00c3\\u00b4|o, \\u00c3\\u00b5|o, \\u00c3\\u00b6|o, \\u00c3\\u00b8|o, \\u00c3\\u00b9|u, \\u00c3\\u00ba|u, \\u00c3\\u00bb|u, \\u00c3\\u00bc|u, \\u00c3\\u00bd|y, \\u00c3\\u00bf|y, \\u00c3\\u0178|ss\",\"sh404SefLabelCat\":\"\",\"sh404SefLabelUser\":\"blog\",\"sh404SefLabelItem\":\"2\",\"sh404SefTitleAlias\":\"alias\",\"sh404SefModK2ContentFeedAlias\":\"feed\",\"sh404SefInsertItemId\":\"0\",\"sh404SefInsertUniqueItemId\":\"0\",\"cbIntegration\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(10029,'System - RokExtender','plugin','rokextender','system',0,1,1,0,'{\"legacy\":false,\"name\":\"System - RokExtender\",\"type\":\"plugin\",\"creationDate\":\"February 24, 2011\",\"author\":\"RocketTheme, LLC\",\"copyright\":\"(C) 2005 - 2011 RocketTheme, LLC. All rights reserved.\",\"authorEmail\":\"support@rockettheme.com\",\"authorUrl\":\"http:\\/\\/www.rockettheme.com\",\"version\":\"1.0\",\"description\":\"System - Gantry\",\"group\":\"\"}','{\"registered\":\"\\/modules\\/mod_roknavmenu\\/lib\\/RokNavMenuEvents.php\"}','','',0,'0000-00-00 00:00:00',1,0),(10037,'System - RokBox','plugin','rokbox','system',0,1,1,0,'{\"legacy\":false,\"name\":\"System - RokBox\",\"type\":\"plugin\",\"creationDate\":\"September 3, 2012\",\"author\":\"RocketTheme, LLC\",\"copyright\":\"(C) 2005 - 2012 RocketTheme, LLC. All rights reserved.\",\"authorEmail\":\"support@rockettheme.com\",\"authorUrl\":\"http:\\/\\/www.rockettheme.com\",\"version\":\"1.3\",\"description\":\"RokBox System Plugin\",\"group\":\"\"}','{\"theme\":\"clean\",\"custom-theme\":\"sample\",\"custom-legacy\":\"1\",\"width\":\"640\",\"height\":\"460\",\"transition\":\"Quad.easeOut\",\"duration\":\"200\",\"chase\":\"40\",\"effect\":\"quicksilver\",\"frame-border\":\"20\",\"content-padding\":\"0\",\"arrows-height\":\"35\",\"captions\":\"0\",\"captionsDelay\":\"800\",\"scrolling\":\"0\",\"keyEvents\":\"1\",\"overlay_background\":\"#000000\",\"overlay_opacity\":\"0.85\",\"overlay_duration\":\"200\",\"overlay_transition\":\"Quad.easeInOut\",\"autoplay\":\"true\",\"ytautoplay\":\"0\",\"ythighquality\":\"0\",\"controller\":\"false\",\"bgcolor\":\"#f3f3f3\",\"vimeoColor\":\"00adef\",\"vimeoPortrait\":\"0\",\"vimeoTitle\":\"0\",\"vimeoFullScreen\":\"1\",\"vimeoByline\":\"0\"}','','',0,'0000-00-00 00:00:00',1,0),(10032,'RokNavMenu','module','mod_roknavmenu','',0,1,1,0,'{\"legacy\":false,\"name\":\"RokNavMenu\",\"type\":\"module\",\"creationDate\":\"June 19, 2012\",\"author\":\"RocketTheme, LLC\",\"copyright\":\"(C) 2005 - 2012 RocketTheme, LLC. All rights reserved.\",\"authorEmail\":\"support@rockettheme.com\",\"authorUrl\":\"http:\\/\\/www.rockettheme.com\",\"version\":\"1.12\",\"description\":\"RocketTheme Customizable Navigation Menu\",\"group\":\"\"}','{\"limit_levels\":\"0\",\"startLevel\":\"0\",\"endLevel\":\"0\",\"showAllChildren\":\"0\",\"window_open\":\"\",\"filteringspacer2\":\"\",\"theme\":\"default\",\"custom_layout\":\"default.php\",\"custom_formatter\":\"default.php\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\"}','','',0,'0000-00-00 00:00:00',0,0),(10038,'Content - RokBox','plugin','rokbox','content',0,1,1,0,'{\"legacy\":false,\"name\":\"Content - RokBox\",\"type\":\"plugin\",\"creationDate\":\"September 3, 2012\",\"author\":\"RocketTheme, LLC\",\"copyright\":\"(C) 2005 - 2012 RocketTheme, LLC. All rights reserved.\",\"authorEmail\":\"support@rockettheme.com\",\"authorUrl\":\"http:\\/\\/www.rockettheme.com\",\"version\":\"1.3\",\"description\":\"To be used with a RokBox enabled RocketTheme Joomla! template.  Syntax is {rokbox}link{\\/rokbox}.  If you want the image to be part of an \'album\', you can use the syntax {rokbox album=|albumname|}link{\\/rokbox}.  To provide text descriptions, please use the syntax {rokbox title=|your description|}link{\\/rokbox}. To specify a thumbnail, use the syntax {rokbox thumb=|thumbnail_link.jpg|}link{\\/rokbox}. If you want to use a text link, you can specify the text using syntax: {rokbox text=|your link text here|}link{\\/rokbox}. You can also use album, title, thumb and text in the same tag.\",\"group\":\"\"}','{\"remote_sizes\":\"0\",\"thumb_ext\":\"_thumb\",\"thumb_class\":\"album\",\"thumb_custom\":\"0\",\"thumb_dir\":\"cache\",\"thumb_width\":\"150\",\"thumb_height\":\"100\",\"thumb_quality\":\"90\"}','','',0,'0000-00-00 00:00:00',1,0),(10046,'Gantry','component','com_gantry','',1,1,1,0,'{\"legacy\":false,\"name\":\"Gantry\",\"type\":\"component\",\"creationDate\":\"March 5, 2012\",\"author\":\"RocketTheme, LLC\",\"copyright\":\"(C) 2005 - 2012 RocketTheme, LLC. All rights reserved.\",\"authorEmail\":\"support@rockettheme.com\",\"authorUrl\":\"http:\\/\\/www.rockettheme.com\",\"version\":\"3.2.17\",\"description\":\"${project.description}\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10050,'MOD_JGMAP','module','mod_JGMap','',0,1,0,0,'{\"legacy\":false,\"name\":\"MOD_JGMAP\",\"type\":\"module\",\"creationDate\":\"June 13, 2010\",\"author\":\"Kermode Bear Software - James Hansen\",\"copyright\":\"Copyright 2011 Notice\",\"authorEmail\":\"kermode@kermodesoftware.com\",\"authorUrl\":\"www.kermodesoftware.com\",\"version\":\"0.16.35\",\"description\":\"MOD_JGMAP_XML_DESCRIPTION\",\"group\":\"\"}','{\"width\":\"200\",\"height\":\"150\",\"mapName\":\"map\",\"smallmap\":\"1\",\"static\":\"0\",\"lat\":\"48.5747\",\"lng\":\"-123\",\"zoom\":\"3\",\"marker_title\":\"\"}','','',0,'0000-00-00 00:00:00',0,0),(10051,'theme1141','template','theme1141','',0,1,1,0,'{\"legacy\":false,\"name\":\"theme1141\",\"type\":\"template\",\"creationDate\":\"May, 2012\",\"author\":\"Unknown\",\"copyright\":\"Copyright  2003-2011 template-help.com. All Rights Reserved.\",\"authorEmail\":\"info@template-help.com\",\"authorUrl\":\"http:\\/\\/www.template-help.com\",\"version\":\"1.0\",\"description\":\"${project.description}\",\"group\":\"\"}','{\"master\":\"true\"}','','',0,'0000-00-00 00:00:00',0,0),(10056,'com_finder','component','com_finder','',1,1,1,0,'{\"legacy\":false,\"name\":\"com_finder\",\"type\":\"component\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_FINDER_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10057,'mod_finder','module','mod_finder','',0,1,1,0,'{\"legacy\":false,\"name\":\"mod_finder\",\"type\":\"module\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_FINDER_XML_DESCRIPTION\",\"group\":\"\"}','{\"searchfilter\":\"\",\"show_autosuggest\":\"1\",\"show_advanced\":\"0\",\"moduleclass_sfx\":\"\",\"field_size\":\"25\",\"show_label\":\"1\",\"label_pos\":\"top\",\"show_button\":\"0\",\"button_pos\":\"right\",\"opensearch\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(10059,'mod_version','module','mod_version','',1,0,1,0,'{\"legacy\":false,\"name\":\"mod_version\",\"type\":\"module\",\"creationDate\":\"January 2012\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_VERSION_XML_DESCRIPTION\",\"group\":\"\"}','{\"format\":\"short\",\"product\":\"1\",\"cache\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(10060,'plg_captcha_recaptcha','plugin','recaptcha','captcha',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_captcha_recaptcha\",\"type\":\"plugin\",\"creationDate\":\"December 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_CAPTCHA_RECAPTCHA_XML_DESCRIPTION\",\"group\":\"\"}','{\"public_key\":\"\",\"private_key\":\"\",\"theme\":\"clean\"}','','',0,'0000-00-00 00:00:00',0,0),(10061,'plg_content_finder','plugin','finder','content',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_content_finder\",\"type\":\"plugin\",\"creationDate\":\"December 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_CONTENT_FINDER_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10062,'plg_finder_categories','plugin','categories','finder',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_finder_categories\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_FINDER_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10063,'plg_finder_contacts','plugin','contacts','finder',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_finder_contacts\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_FINDER_CONTACTS_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10064,'plg_finder_content','plugin','content','finder',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_finder_content\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_FINDER_CONTENT_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10065,'plg_finder_newsfeeds','plugin','newsfeeds','finder',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_finder_newsfeeds\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_FINDER_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10066,'plg_finder_weblinks','plugin','weblinks','finder',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_finder_weblinks\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_FINDER_WEBLINKS_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10067,'plg_quickicon_extensionupdate','plugin','extensionupdate','quickicon',0,0,1,0,'{\"legacy\":false,\"name\":\"plg_quickicon_extensionupdate\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_QUICKICON_EXTENSIONUPDATE_XML_DESCRIPTION\",\"group\":\"\"}','{\"context\":\"mod_quickicon\"}','','',0,'0000-00-00 00:00:00',0,0),(10068,'plg_quickicon_joomlaupdate','plugin','joomlaupdate','quickicon',0,0,1,0,'{\"legacy\":false,\"name\":\"plg_quickicon_joomlaupdate\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_QUICKICON_JOOMLAUPDATE_XML_DESCRIPTION\",\"group\":\"\"}','{\"context\":\"mod_quickicon\"}','','',0,'0000-00-00 00:00:00',0,0),(10069,'plg_system_highlight','plugin','highlight','system',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_system_highlight\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_SYSTEM_HIGHLIGHT_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',7,0),(10070,'plg_system_languagecode','plugin','languagecode','system',0,0,1,0,'{\"legacy\":false,\"name\":\"plg_system_languagecode\",\"type\":\"plugin\",\"creationDate\":\"November 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_SYSTEM_LANGUAGECODE_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',2,0),(437,'plg_quickicon_joomlaupdate','plugin','joomlaupdate','quickicon',0,0,1,1,'{\"legacy\":false,\"name\":\"plg_quickicon_joomlaupdate\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_QUICKICON_JOOMLAUPDATE_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(438,'plg_quickicon_extensionupdate','plugin','extensionupdate','quickicon',0,0,1,1,'{\"legacy\":false,\"name\":\"plg_quickicon_extensionupdate\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_QUICKICON_EXTENSIONUPDATE_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(27,'com_finder','component','com_finder','',1,0,0,0,'','{\"show_description\":\"1\",\"description_length\":255,\"allow_empty_query\":\"0\",\"show_url\":\"1\",\"show_advanced\":\"1\",\"expand_advanced\":\"0\",\"show_date_filters\":\"0\",\"highlight_terms\":\"1\",\"opensearch_name\":\"\",\"opensearch_description\":\"\",\"batch_size\":\"50\",\"memory_table_limit\":30000,\"title_multiplier\":\"1.7\",\"text_multiplier\":\"0.7\",\"meta_multiplier\":\"1.2\",\"path_multiplier\":\"2.0\",\"misc_multiplier\":\"0.3\",\"stemmer\":\"porter_en\"}','','',0,'0000-00-00 00:00:00',0,0),(314,'mod_version','module','mod_version','',1,0,1,0,'{\"legacy\":false,\"name\":\"mod_version\",\"type\":\"module\",\"creationDate\":\"January 2012\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_VERSION_XML_DESCRIPTION\",\"group\":\"\"}','{\"format\":\"short\",\"product\":\"1\",\"cache\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(10071,'plg_finder_k2','plugin','k2','finder',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_finder_k2\",\"type\":\"plugin\",\"creationDate\":\"May 9th, 2012\",\"author\":\"JoomlaWorks\",\"copyright\":\"Copyright (c) 2006 - 2012 JoomlaWorks Ltd. All rights reserved.\",\"authorEmail\":\"contact@joomlaworks.net\",\"authorUrl\":\"www.joomlaworks.net\",\"version\":\"2.5.7\",\"description\":\"PLG_FINDER_K2_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(28,'com_joomlaupdate','component','com_joomlaupdate','',1,1,0,1,'{\"legacy\":false,\"name\":\"com_joomlaupdate\",\"type\":\"component\",\"creationDate\":\"February 2012\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.2\",\"description\":\"COM_JOOMLAUPDATE_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10089,'K2 jCarousel','module','mod_k2_jcarousel','',0,1,0,0,'{\"legacy\":true,\"name\":\"K2 jCarousel\",\"type\":\"module\",\"creationDate\":\"May 25th, 2012\",\"author\":\"JoomlaWorks\",\"copyright\":\"Copyright(c) 2006 - 2012 JoomlaWorks Ltd. All rights reserved.\",\"authorEmail\":\"contact@joomlaworks.net\",\"authorUrl\":\"www.joomlaworks.net\",\"version\":\"2.5.7\",\"description\":\"K2_JCAROUSEL_XML_DESCRIPTION\",\"group\":\"\"}','{\"moduleclass_sfx\":\"carousel\",\"getTemplate\":\"Default\",\"source\":\"filter\",\"\":\"K2_OTHER_OPTIONS\",\"catfilter\":\"0\",\"category_id\":\"\",\"getChildren\":\"0\",\"itemCount\":\"5\",\"itemsOrdering\":\"\",\"FeaturedItems\":\"1\",\"popularityRange\":\"\",\"videosOnly\":\"0\",\"item\":\"\",\"items\":\"\",\"itemTitle\":\"1\",\"itemAuthor\":\"1\",\"itemAuthorAvatar\":\"1\",\"itemAuthorAvatarWidthSelect\":\"custom\",\"itemAuthorAvatarWidth\":\"50\",\"userDescription\":\"1\",\"itemIntroText\":\"1\",\"itemIntroTextWordLimit\":\"\",\"itemImage\":\"1\",\"itemImgSize\":\"Small\",\"itemVideo\":\"1\",\"itemVideoCaption\":\"1\",\"itemVideoCredits\":\"1\",\"itemAttachments\":\"1\",\"itemTags\":\"1\",\"itemCategory\":\"1\",\"itemDateCreated\":\"1\",\"itemHits\":\"1\",\"itemReadMore\":\"1\",\"itemExtraFields\":\"0\",\"itemCommentsCounter\":\"1\",\"feed\":\"1\",\"itemPreText\":\"\",\"itemCustomLink\":\"0\",\"itemCustomLinkTitle\":\"\",\"itemCustomLinkURL\":\"http:\\/\\/\",\"itemCustomLinkMenuItem\":\"\",\"theme\":\"custom\",\"vertical\":\"false\",\"start\":\"1\",\"offset\":\"1\",\"scroll\":\"1\",\"visible\":\"4\",\"animation\":\"normal\",\"auto\":\"0\",\"wrap\":\"\'circular\'\",\"script\":\"minified\",\"K2Plugins\":\"1\",\"JPlugins\":\"1\",\"cache\":\"1\",\"cache_time\":\"900\"}','','',0,'0000-00-00 00:00:00',0,0),(10093,'rokcandy','component','com_rokcandy','',1,1,0,0,'{\"legacy\":false,\"name\":\"RokCandy\",\"type\":\"component\",\"creationDate\":\"April 2, 2012\",\"author\":\"RocketTheme, LLC\",\"copyright\":\"(C) 2005 - 2012 RocketTheme, LLC. All rights reserved.\",\"authorEmail\":\"support@rockettheme.com\",\"authorUrl\":\"http:\\/\\/www.rockettheme.com\",\"version\":\"1.3\",\"description\":\"\\n\\t\\tRokCandy is a simple yet powerful macro system for Joomla 1.6.  It provides the ability to create and categorize macros that can be used throughout your site.\\n\\t\",\"group\":\"\"}','{\"forcecache\":\"0\",\"adminenabled\":\"0\",\"editenabled\":\"0\",\"contentPlugin\":\"0\",\"disabled\":\"\"}','','',0,'0000-00-00 00:00:00',0,0),(10094,'Button - RokCandy','plugin','rokcandy','editors-xtd',0,1,1,0,'{\"legacy\":false,\"name\":\"Button - RokCandy\",\"type\":\"plugin\",\"creationDate\":\"April 2, 2012\",\"author\":\"RocketTheme, LLC\",\"copyright\":\"(C) 2005 - 2012 RocketTheme, LLC. All rights reserved.\",\"authorEmail\":\"support@rockettheme.com\",\"authorUrl\":\"http:\\/\\/www.rockettheme.com\",\"version\":\"1.3\",\"description\":\"This is an Editor Button to allow selection of RokCandy macros\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',5,0),(10095,'System - RokCandy','plugin','rokcandy','system',0,1,1,0,'{\"legacy\":false,\"name\":\"System - RokCandy\",\"type\":\"plugin\",\"creationDate\":\"April 2, 2012\",\"author\":\"RocketTheme, LLC\",\"copyright\":\"(C) 2005 - 2012 RocketTheme, LLC. All rights reserved.\",\"authorEmail\":\"support@rockettheme.com\",\"authorUrl\":\"http:\\/\\/www.rockettheme.com\",\"version\":\"1.3\",\"description\":\"This is the RokCandy system plugin that performs the macro replacement\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',17,0),(10096,'System - jQuery Easy','plugin','jqueryeasy','system',0,1,1,0,'{\"legacy\":false,\"name\":\"System - jQuery Easy\",\"type\":\"plugin\",\"creationDate\":\"2012-03-11\",\"author\":\"Olivier Buisard\",\"copyright\":\"Copyright (C) 2011 Simplify Your Web. All rights reserved.\",\"authorEmail\":\"olivier.buisard@simplifyyourweb.com\",\"authorUrl\":\"www.simplifyyourweb.com\",\"version\":\"1.2.1\",\"description\":\"PLG_SYSTEM_JQUERYEASY_XML_DESCRIPTION\",\"group\":\"\"}','{\"jqueryinfrontend\":\"2\",\"jqueryversionfrontend\":\"1.7\",\"jquerysubversionfrontend\":\"\",\"jqueryuiversionfrontend\":\"1.8\",\"jqueryuisubversionfrontend\":\"\",\"localversionfrontend\":\"\",\"jqueryuithemefrontend\":\"none\",\"jqueryuithemecustomfrontend\":\"\",\"whichhttpfrontend\":\"http\",\"compressionfrontend\":\"compressed\",\"jqueryinbackend\":\"0\",\"jqueryversionbackend\":\"1.7\",\"jquerysubversionbackend\":\"\",\"jqueryuiversionbackend\":\"1.8\",\"jqueryuisubversionbackend\":\"\",\"localversionbackend\":\"\",\"jqueryuithemebackend\":\"base\",\"jqueryuithemecustombackend\":\"\",\"whichhttpbackend\":\"https\",\"compressionbackend\":\"compressed\",\"enableonlyin\":\"\",\"disablein\":\"\",\"disablemootools\":\"0\",\"keepmootoolsin\":\"\",\"stripremainingscriptsfrontend\":\"\",\"stripremainingcssfrontend\":\"\\/libraries\\/gantry\\/css\\/gantry.css\\r\\n\\/libraries\\/gantry\\/css\\/joomla.css\",\"removenoconflictfrontend\":\"1\",\"addnoconflictfrontend\":\"2\",\"disablecaptions\":\"0\",\"removeblanklinesfrontend\":\"1\",\"stripremainingscriptsbackend\":\"\",\"stripremainingcssbackend\":\"\",\"removenoconflictbackend\":\"1\",\"addnoconflictbackend\":\"2\",\"removeblanklinesbackend\":\"1\"}','','',42,'2012-08-10 09:18:31',1,0),(10099,'BgMax','module','mod_bgmax','',0,1,0,0,'{\"legacy\":false,\"name\":\"BgMax\",\"type\":\"module\",\"creationDate\":\"17-03-2011\",\"author\":\"LMC-lomart\",\"copyright\":\"\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"1.7.1\",\"description\":\"BGMAX_DESC\",\"group\":\"\"}','{\"bgmaxDebug\":\"0\",\"RandomFolder\":\"\",\"bodyColorAuto\":\"0\",\"mode\":\"max\",\"enlarge\":\"1\",\"reduce\":\"0\",\"position\":\"absolute\",\"align\":\"center\",\"vertAlign\":\"top\",\"zIndex\":\"-1\",\"ffHack\":\"0px\",\"fadeActive\":\"0\",\"fadeAfter\":\"0\",\"fadeDuration\":\"1000\",\"fadeFrameRate\":\"30\",\"contentSelector\":\"\",\"contentOpacity\":\"100%\",\"contentWidth\":\"\",\"contentAlign\":\"center\",\"headOther\":\"\",\"filterContent\":\"\",\"debDate\":\"\",\"debTime\":\"\",\"endDate\":\"\",\"endTime\":\"\"}','','',0,'0000-00-00 00:00:00',0,0),(10106,'bundle','package','pkg_bundle','',0,1,1,0,'{\"legacy\":false,\"name\":\"bundle\",\"type\":\"package\",\"creationDate\":\"Unknown\",\"author\":\"Unknown\",\"copyright\":\"\",\"authorEmail\":\"\",\"authorUrl\":\"\",\"version\":\"\",\"description\":\"\\n\\t\\t\\n\\t\\t\\t<p>This package installs the following Joomla extensions:<\\/p>\\n\\t\\t\\t<ul>\\n\\t\\t\\t\\t<li>Module K2 jCarousel<\\/li>\\n\\t\\t\\t\\t<li>BgMax<\\/li>\\n\\t\\t\\t\\t<li>Module jGmap<\\/li>\\n\\t\\t\\t\\t<li>K2 component<\\/li>\\n\\t\\t\\t<\\/ul>\\n\\t\\t\\n\\t\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10203,'travel','component','com_travel','',1,1,0,0,'{\"legacy\":false,\"name\":\"Travel\",\"type\":\"component\",\"creationDate\":\"2012-10-18\",\"author\":\"Edward Khor\",\"copyright\":\"Copyright 2012, All rights reserved\",\"authorEmail\":\"edward@enfonius.com\",\"authorUrl\":\"www.enfonius.com\",\"version\":\"1.0.0\",\"description\":\"\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10104,'Josetta - K2 Categories','plugin','k2category','josetta_ext',0,1,1,0,'{\"legacy\":false,\"name\":\"Josetta - K2 Categories\",\"type\":\"plugin\",\"creationDate\":\"June 7th, 2012\",\"author\":\"JoomlaWorks\",\"copyright\":\"Copyright (c) 2006 - 2012 JoomlaWorks Ltd. All rights reserved.\",\"authorEmail\":\"contact@joomlaworks.net\",\"authorUrl\":\"www.joomlaworks.net\",\"version\":\"2.6.1\",\"description\":\"\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10105,'Josetta - K2 Items','plugin','k2item','josetta_ext',0,0,1,0,'{\"legacy\":false,\"name\":\"Josetta - K2 Items\",\"type\":\"plugin\",\"creationDate\":\"June 7th, 2012\",\"author\":\"JoomlaWorks\",\"copyright\":\"Copyright (c) 2006 - 2012 JoomlaWorks Ltd. All rights reserved.\",\"authorEmail\":\"contact@joomlaworks.net\",\"authorUrl\":\"www.joomlaworks.net\",\"version\":\"2.6.1\",\"description\":\"\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10191,'OS Membership - Joomsocial plugin','plugin','jomsocial','osmembership',0,0,1,0,'{\"legacy\":false,\"name\":\"OS Membership - Joomsocial plugin\",\"type\":\"plugin\",\"creationDate\":\"Apirl 2012\",\"author\":\"Tuan Pham Ngoc\",\"copyright\":\"Ossolution Team\",\"authorEmail\":\"contact@joomdonation.com\",\"authorUrl\":\"www.joomdonation.com\",\"version\":\"1.0\",\"description\":\"This plugin is used to create a Jomsocial account and to assign subscriber to Jomsocial Groups when they subscribe to a Subscription Plan in OS Membership\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10192,'OS Membership - Joomla Groups plugin','plugin','joomlagroups','osmembership',0,1,1,0,'{\"legacy\":false,\"name\":\"OS Membership - Joomla Groups plugin\",\"type\":\"plugin\",\"creationDate\":\"Apirl 2012\",\"author\":\"Tuan Pham Ngoc\",\"copyright\":\"Ossolution Team\",\"authorEmail\":\"contact@joomdonation.com\",\"authorUrl\":\"www.joomdonation.com\",\"version\":\"1.0\",\"description\":\"This plugin is used to assign users to Joomla Groups when they subscribe to a Subscription Plan in OS Membership\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10193,'OS Membership - Docman plugin','plugin','docman','osmembership',0,0,1,0,'{\"legacy\":false,\"name\":\"OS Membership - Docman plugin\",\"type\":\"plugin\",\"creationDate\":\"Apirl 2012\",\"author\":\"Tuan Pham Ngoc\",\"copyright\":\"Ossolution Team\",\"authorEmail\":\"contact@joomdonation.com\",\"authorUrl\":\"www.joomdonation.com\",\"version\":\"1.0\",\"description\":\"This plugin is used to Add Subscribers to Docman Groups when they subscribe for a subscription plan.\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10194,'OS Membership - Urls plugin','plugin','urls','osmembership',0,0,1,0,'{\"legacy\":false,\"name\":\"OS Membership - Urls plugin\",\"type\":\"plugin\",\"creationDate\":\"Apirl 2012\",\"author\":\"Tuan Pham Ngoc\",\"copyright\":\"Ossolution Team\",\"authorEmail\":\"contact@joomdonation.com\",\"authorUrl\":\"www.joomdonation.com\",\"version\":\"1.0\",\"description\":\"This plugin is used to restrict access to URLs to subscribers of each subscription plan\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10195,'OS Membership User','plugin','user','osmembership',0,1,1,0,'{\"legacy\":false,\"name\":\"OS Membership User\",\"type\":\"plugin\",\"creationDate\":\"April 2012\",\"author\":\"Tuan Pham Ngoc\",\"copyright\":\"Copyright (C) 2012 Ossolution Team\",\"authorEmail\":\"contact@joomdonation.com\",\"authorUrl\":\"http:\\/\\/www.joomdonation.com\",\"version\":\"1.0.0\",\"description\":\"This plugin allows activate user account when his subscription is activated and de-activate his account when his subscription expired\",\"group\":\"\"}','{\"block_account_when_expired\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(10196,'OS Membership - Membership ID plugin','plugin','membershipid','osmembership',0,0,1,0,'{\"legacy\":false,\"name\":\"OS Membership - Membership ID plugin\",\"type\":\"plugin\",\"creationDate\":\"April 2012\",\"author\":\"Tuan Pham Ngoc\",\"copyright\":\"Copyright (C) 2012 Ossolution Team\",\"authorEmail\":\"contact@joomdonation.com\",\"authorUrl\":\"http:\\/\\/www.joomdonation.com\",\"version\":\"1.1.1\",\"description\":\"This plugin will generate an unique, auto-increment Membership ID for each subscriber\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10197,'OS Membership Reminder','plugin','osmembershipreminder','system',0,1,1,0,'{\"legacy\":false,\"name\":\"OS Membership Reminder\",\"type\":\"plugin\",\"creationDate\":\"April 2012\",\"author\":\"Tuan Pham Ngoc\",\"copyright\":\"Copyright (C) 2012 Ossolution Team\",\"authorEmail\":\"contact@joomdonation.com\",\"authorUrl\":\"http:\\/\\/www.joomdonation.com\",\"version\":\"1.0.0\",\"description\":\"This plugin check and send reminder emails to subscribers to inform them about membership expire so that they can login to renew their membership\",\"group\":\"\"}','{\"number_subscribers\":\"15\",\"last_run\":1350711435}','','',0,'0000-00-00 00:00:00',0,0),(10198,'OS Membership Update Subscribers status','plugin','osmembershipupdatestatus','system',0,1,1,0,'{\"legacy\":false,\"name\":\"OS Membership Update Subscribers status\",\"type\":\"plugin\",\"creationDate\":\"April 2012\",\"author\":\"Tuan Pham Ngoc\",\"copyright\":\"Copyright (C) 2012 Ossolution Team\",\"authorEmail\":\"contact@joomdonation.com\",\"authorUrl\":\"http:\\/\\/www.joomdonation.com\",\"version\":\"1.0.0\",\"description\":\"This plugin check and update status of subscribers to Expired when their membership is expired\",\"group\":\"\"}','{\"number_subscribers\":\"15\",\"last_run\":1350709232}','','',0,'0000-00-00 00:00:00',0,0),(10199,'OS Membership URLs','plugin','osmembershipurls','system',0,0,1,0,'{\"legacy\":false,\"name\":\"OS Membership URLs\",\"type\":\"plugin\",\"creationDate\":\"April 2012\",\"author\":\"Tuan Pham Ngoc\",\"copyright\":\"Copyright (C) 2012 Ossolution Team\",\"authorEmail\":\"contact@joomdonation.com\",\"authorUrl\":\"http:\\/\\/www.joomdonation.com\",\"version\":\"1.0.0\",\"description\":\"This plugin check to see whether users can access to an URL. Only publish it if you use OS Membership URLS plugin to restrict access for members\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10200,'osmembership','component','com_osmembership','',1,1,0,0,'{\"legacy\":false,\"name\":\"OS Membership\",\"type\":\"component\",\"creationDate\":\"May 2012\",\"author\":\"Tuan Pham Ngoc\",\"copyright\":\"Copyright (C) 2012 Ossolution Team\",\"authorEmail\":\"contact@joomdonation.com\",\"authorUrl\":\"http:\\/\\/www.joomdonation.com\",\"version\":\"1.5.0\",\"description\":\"Membership Pro give you an quick and easy way to sell memberships and give subscribers access to resources on your site\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10201,'comprofiler','component','com_comprofiler','',1,1,0,0,'{\"legacy\":false,\"name\":\"comprofiler\",\"type\":\"component\",\"creationDate\":\"2012-06-19\",\"author\":\"Beat\",\"copyright\":\"Copyright (C) 2004-2012 Joomlapolis.com. All rights reserved.\",\"authorEmail\":\"beat@joomlapolis.com\",\"authorUrl\":\"www.joomlapolis.com\",\"version\":\"1.8.1\",\"description\":\"Joomla\\/Mambo Community Builder 1.8.1 native for Joomla! 2.5.0 - 2.5.6, 1.7.0 - 1.7.3, 1.6.0 - 1.6.6, 1.5.3 - 1.5.26, 1.0.0 - 1.0.15 and Mambo 4.5.0 - 4.6.5.\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10202,'CB Login','module','mod_cblogin','',0,1,0,0,'{\"legacy\":true,\"name\":\"CB Login\",\"type\":\"module\",\"creationDate\":\"2012-06-19\",\"author\":\"Beat and JoomlaJoe\",\"copyright\":\"(C) 2005-2012 Joomlapolis.com. This module is released under the GNU\\/GPL v2 License\",\"authorEmail\":\"beat@joomlapolis.com\",\"authorUrl\":\"www.joomlapolis.com\",\"version\":\"1.8.1\",\"description\":\"Login module to be used with Community Builder instead of the Login module.\",\"group\":\"\"}','{\"moduleclass_sfx\":\"\",\"horizontal\":\"0\",\"compact\":\"0\",\"pretext\":\"\",\"logoutpretext\":\"\",\"login\":\"\",\"logout\":\"index.php\",\"show_lostpass\":\"1\",\"show_newaccount\":\"1\",\"show_username_pass_icons\":\"0\",\"name_lenght\":\"14\",\"pass_lenght\":\"14\",\"show_buttons_icons\":\"0\",\"show_remind_register_icons\":\"0\",\"login_message\":\"0\",\"logout_message\":\"0\",\"remember_enabled\":\"1\",\"greeting\":\"1\",\"name\":\"0\",\"show_avatar\":\"0\",\"avatar_position\":\"default\",\"text_show_profile\":\"\",\"text_edit_profile\":\"\",\"pms_type\":\"0\",\"show_pms\":\"0\",\"show_connection_notifications\":\"0\",\"https_post\":\"0\",\"cb_plugins\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(10188,'lib_fof','library','lib_fof','',0,1,1,0,'{\"legacy\":false,\"name\":\"lib_fof\",\"type\":\"library\",\"creationDate\":\"2012-09-16\",\"author\":\"Nicholas K. Dionysopoulos \\/ AkeebaBackup.com\",\"copyright\":\"(C)2011-2012 Nicholas K. Dionysopoulos\",\"authorEmail\":\"nicholas@akeebabackup.com\",\"authorUrl\":\"https:\\/\\/www.akeebabackup.com\",\"version\":\"rev1209E60\",\"description\":\"Framework-on-Framework (FOF) \\u2013 A rapid component development framework extension for Joomla!\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10189,'AkeebaStrapper','file','files_strapper','',0,1,0,0,'{\"legacy\":false,\"name\":\"AkeebaStrapper\",\"type\":\"file\",\"creationDate\":\"July 2012\",\"author\":\"Nicholas K. Dionysopoulos\",\"copyright\":\"(C) 2012 Akeeba Ltd.\",\"authorEmail\":\"nicholas@dionysopoulos.me\",\"authorUrl\":\"https:\\/\\/www.akeebabackup.com\",\"version\":\"1.0.0\",\"description\":\"Namespaced jQuery, jQuery UI and Bootstrap for Akeeba products.\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(10190,'OS Membership - CB plugin','plugin','cb','osmembership',0,1,1,0,'{\"legacy\":false,\"name\":\"OS Membership - CB plugin\",\"type\":\"plugin\",\"creationDate\":\"Apirl 2012\",\"author\":\"Tuan Pham Ngoc\",\"copyright\":\"Ossolution Team\",\"authorEmail\":\"contact@joomdonation.com\",\"authorUrl\":\"www.joomdonation.com\",\"version\":\"1.0\",\"description\":\"This plugin is used to create a CB account for user when they subscribe to a Subscription Plan in OS Membership\",\"group\":\"\"}','{\"block_user_on_membership_expire\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(10204,'','language','zh-CN','',0,1,0,0,'{\"legacy\":true,\"name\":\"\\u7b80\\u4f53\\u4e2d\\u6587\",\"type\":\"language\",\"creationDate\":\"2012-09-08\",\"author\":\"CHN Translation Team\",\"copyright\":\"Copyright (C) 2010 CHN Joomla Translation Team  (http:\\/\\/joomlacode.org\\/gf\\/project\\/choice\\/). All rights reserved.\",\"authorEmail\":\"zhous1998@sohu.com\",\"authorUrl\":\"www.joomla.cn\",\"version\":\"2.5.7.1\",\"description\":\"\\n    \\n<div align=\\\"center\\\">\\n <table border=\\\"0\\\" width=\\\"90%\\\">\\n  <table width=\\\"100%\\\" border=\\\"0\\\">\\n  <tr>\\n    <td colspan=\\\"2\\\">Chinese language for Joomla 1.6 back-end. Translated by CHN Joomla Translation Team, one of Joomla Accredited Translations.<\\/td>\\n  <\\/tr>\\n  <tr>\\n    <td colspan=\\\"2\\\">Joomla 2.5 \\u7b80\\u4f53\\u4e2d\\u6587\\u8bed\\u8a00\\u662f\\u7531Joomla\\u6388\\u6743\\u7ffb\\u8bd1\\u7ec4\\u7684Derek Joe\\u5728Joomla 1.6\\u7ffb\\u8bd1\\u5de5\\u4f5c\\u7684\\u57fa\\u7840\\u4e0a\\u8865\\u5145\\u7ffb\\u8bd1\\u3002<\\/td>\\n  <\\/tr>\\n  <tr>\\n    <td colspan=\\\"2\\\">Joomla 2.5\\u7b80\\u4f53\\u4e2d\\u6587\\u8bed\\u8a00\\u5305\\u7684\\u4e3b\\u8981\\u8d21\\u732e\\u4eba\\uff1a<\\/td>\\n  <\\/tr>\\n  <tr>\\n    <td colspan=\\\"2\\\">\\u524d\\u53f0\\uff1a <a href=\\\"http:\\/\\/joomlacode.org\\/gf\\/user\\/wuyujie\\/\\\" target=\\\"_blank\\\">\\u6b66\\u7389\\u6770<\\/a>(wuyujie)\\u3001 <a href=\\\"http:\\/\\/joomlacode.org\\/gf\\/user\\/gzpan123\\/\\\" target=\\\"_blank\\\">\\u90ed\\u5fd7\\u6500<\\/a><\\/td>\\n  <\\/tr>\\n  <tr>\\n    <td colspan=\\\"2\\\">\\u540e\\u53f0\\uff1a <a href=\\\"http:\\/\\/joomlacode.org\\/gf\\/user\\/keydiagram\\/\\\" target=\\\"_blank\\\">Key Diagram<\\/a>\\u3001<a href=\\\"http:\\/\\/joomlacode.org\\/gf\\/user\\/tchyusuf\\/\\\">Yusuf  Wang<\\/a><\\/td>\\n  <\\/tr>\\n  <tr>\\n    <td colspan=\\\"2\\\">\\u5b89\\u88c5\\uff1a <a href=\\\"http:\\/\\/joomlacode.org\\/gf\\/user\\/freechoice\\/\\\" target=\\\"_blank\\\">Johnathan Cheun<\\/a>\\u3001<a href=\\\"http:\\/\\/joomlacode.org\\/gf\\/user\\/tchyusuf\\/\\\">Yusuf  Wang<\\/a>\\u3001 <a href=\\\"http:\\/\\/joomlacode.org\\/gf\\/user\\/zhous\\/\\\" target=\\\"_blank\\\">Derek Joe<\\/a><\\/td>\\n  <\\/tr>\\n  <tr>\\n    <td colspan=\\\"2\\\">\\u793a\\u8303\\u5185\\u5bb9\\u53ca\\u7f16\\u8f91\\u5668\\uff1a <a href=\\\"http:\\/\\/joomlacode.org\\/gf\\/user\\/zhous\\/\\\" target=\\\"_blank\\\">Derek Joe<\\/a><\\/td>\\n  <\\/tr>\\n  <tr>\\n    <td colspan=\\\"2\\\">\\u591a\\u8c22\\u5927\\u5bb6\\u7684\\u8f9b\\u52e4\\u52b3\\u52a8\\uff01\\u8c22\\u8c22wayne82\\u7684\\u53cd\\u9988\\u4e0e\\u5efa\\u8bae\\uff01<\\/td>\\n  <\\/tr>\\n  <tr>\\n    <td width=\\\"132\\\"><p><a href=\\\"http:\\/\\/www.joomla.cn\\/index.php?option=com_kunena&func=showcat&catid=34&Itemid=46&lang=zh\\\" target=\\\"_blank\\\"><img src=\\\"http:\\/\\/www.joomla.cn\\/images\\/aboutjoomlacn.png\\\" alt=\\\"\\u56e7\\u5566!\\u4e2d\\u56fd\\\" width=\\\"130\\\" height=\\\"70\\\" align=\\\"left\\\" longdesc=\\\"http:\\/\\/www.joomla.cn\\\"><br \\/>\\n    <\\/a><\\/p><\\/td>\\n    <td valign=\\\"middle\\\"><a href=\\\"http:\\/\\/www.joomla.cn\\/index.php?option=com_kunena&func=showcat&catid=34&Itemid=46&lang=zh\\\" target=\\\"_blank\\\">Joomla\\u53ca\\u5176\\u6269\\u5c55\\u6c49\\u5316\\u7684\\u5206\\u4eab\\u4e0e\\u8ba8\\u8bba\\u8bf7\\u8bbf\\u95ee\\\"\\u56e7\\u5566!\\u4e2d\\u56fd\\\"<\\/a><br \\/>\\n      <b>\\u6b22\\u8fce\\u559c\\u6b22\\u7ffb\\u8bd1\\u4e14\\u61c2\\u5f97\\u4f7f\\u7528SVN\\u7684\\u670b\\u53cb<\\/b><br \\/>\\n    <a href=\\\"http:\\/\\/www.joomla.cn\\/index.php?option=com_kunena&func=view&catid=34&id=9537&Itemid=46\\\" target=\\\"_blank\\\"><b>\\u52a0\\u5165\\u6211\\u4eec\\u7684\\u7ffb\\u8bd1\\u7ec4\\uff08\\u771f\\u6b63\\u81ea\\u4e3b\\u7684\\u534f\\u4f5c\\u65b9\\u5f0f\\uff09<\\/b><\\/a><\\/td>\\n  <\\/tr>\\n  <tr>\\n    <td colspan=\\\"2\\\">&nbsp;<\\/td>\\n  <\\/tr>\\n<\\/table>\\n <\\/div>\\n  \\n\\t\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10205,'','language','zh-CN','',1,1,0,0,'{\"legacy\":true,\"name\":\"\\u7b80\\u4f53\\u4e2d\\u6587\",\"type\":\"language\",\"creationDate\":\"2012-09-08\",\"author\":\"Derek Joe(zhous)\",\"copyright\":\"Copyright (C) 2010 CHN Joomla Translation (http:\\/\\/joomlacode.org\\/gf\\/project\\/choice\\/). All rights reserved.\",\"authorEmail\":\"zhous1998@sohu.com\",\"authorUrl\":\"\",\"version\":\"2.5.7.1\",\"description\":\"\\n\\t    \\n<div align=\\\"center\\\">\\n <table border=\\\"0\\\" width=\\\"90%\\\">\\n  <table width=\\\"100%\\\" border=\\\"0\\\">\\n  <tr>\\n    <td colspan=\\\"2\\\">Chinese language for Joomla 2.5 back-end. Translated by CHN Joomla Translation Team, one of Joomla Accredited Translations.<\\/td>\\n  <\\/tr>\\n  <tr>\\n    <td colspan=\\\"2\\\">Joomla 2.5 \\u7b80\\u4f53\\u4e2d\\u6587\\u8bed\\u8a00\\u662f\\u7531Joomla\\u6388\\u6743\\u7ffb\\u8bd1\\u7ec4\\u7684Derek Joe\\u5728Joomla 1.6\\u7ffb\\u8bd1\\u5de5\\u4f5c\\u7684\\u57fa\\u7840\\u4e0a\\u8865\\u5145\\u7ffb\\u8bd1\\u3002<\\/td>\\n  <\\/tr>\\n  <tr>\\n    <td colspan=\\\"2\\\">Joomla 2.5\\u7b80\\u4f53\\u4e2d\\u6587\\u8bed\\u8a00\\u5305\\u7684\\u4e3b\\u8981\\u8d21\\u732e\\u4eba\\uff1a<\\/td>\\n  <\\/tr>\\n  <tr>\\n    <td colspan=\\\"2\\\">\\u524d\\u53f0\\uff1a <a href=\\\"http:\\/\\/joomlacode.org\\/gf\\/user\\/wuyujie\\/\\\" target=\\\"_blank\\\">\\u6b66\\u7389\\u6770<\\/a>(wuyujie)\\u3001 <a href=\\\"http:\\/\\/joomlacode.org\\/gf\\/user\\/gzpan123\\/\\\" target=\\\"_blank\\\">\\u90ed\\u5fd7\\u6500<\\/a><\\/td>\\n  <\\/tr>\\n  <tr>\\n    <td colspan=\\\"2\\\">\\u540e\\u53f0\\uff1a <a href=\\\"http:\\/\\/joomlacode.org\\/gf\\/user\\/keydiagram\\/\\\" target=\\\"_blank\\\">Key Diagram<\\/a>\\u3001<a href=\\\"http:\\/\\/joomlacode.org\\/gf\\/user\\/tchyusuf\\/\\\">Yusuf  Wang<\\/a><\\/td>\\n  <\\/tr>\\n  <tr>\\n    <td colspan=\\\"2\\\">\\u5b89\\u88c5\\uff1a <a href=\\\"http:\\/\\/joomlacode.org\\/gf\\/user\\/freechoice\\/\\\" target=\\\"_blank\\\">Johnathan Cheun<\\/a>\\u3001<a href=\\\"http:\\/\\/joomlacode.org\\/gf\\/user\\/tchyusuf\\/\\\">Yusuf  Wang<\\/a>\\u3001 <a href=\\\"http:\\/\\/joomlacode.org\\/gf\\/user\\/zhous\\/\\\" target=\\\"_blank\\\">Derek Joe<\\/a><\\/td>\\n  <\\/tr>\\n  <tr>\\n    <td colspan=\\\"2\\\">\\u793a\\u8303\\u5185\\u5bb9\\u53ca\\u7f16\\u8f91\\u5668\\uff1a <a href=\\\"http:\\/\\/joomlacode.org\\/gf\\/user\\/zhous\\/\\\" target=\\\"_blank\\\">Derek Joe<\\/a><\\/td>\\n  <\\/tr>\\n  <tr>\\n    <td colspan=\\\"2\\\">\\u591a\\u8c22\\u5927\\u5bb6\\u7684\\u8f9b\\u52e4\\u52b3\\u52a8\\uff01\\u8c22\\u8c22wayne82\\u7684\\u53cd\\u9988\\u4e0e\\u5efa\\u8bae\\uff01<\\/td>\\n  <\\/tr>\\n  <tr>\\n    <td width=\\\"132\\\"><p><a href=\\\"http:\\/\\/www.joomla.cn\\/index.php?option=com_kunena&func=showcat&catid=34&Itemid=46&lang=zh\\\" target=\\\"_blank\\\"><img src=\\\"http:\\/\\/www.joomla.cn\\/images\\/aboutjoomlacn.png\\\" alt=\\\"\\u56e7\\u5566!\\u4e2d\\u56fd\\\" width=\\\"130\\\" height=\\\"70\\\" align=\\\"left\\\" longdesc=\\\"http:\\/\\/www.joomla.cn\\\"><br \\/>\\n    <\\/a><\\/p><\\/td>\\n    <td valign=\\\"middle\\\"><a href=\\\"http:\\/\\/www.joomla.cn\\/index.php?option=com_kunena&func=showcat&catid=34&Itemid=46&lang=zh\\\" target=\\\"_blank\\\">Joomla\\u53ca\\u5176\\u6269\\u5c55\\u6c49\\u5316\\u7684\\u5206\\u4eab\\u4e0e\\u8ba8\\u8bba\\u8bf7\\u8bbf\\u95ee\\\"\\u56e7\\u5566!\\u4e2d\\u56fd\\\"<\\/a><br \\/>\\n      <b>\\u6b22\\u8fce\\u559c\\u6b22\\u7ffb\\u8bd1\\u4e14\\u61c2\\u5f97\\u4f7f\\u7528SVN\\u7684\\u670b\\u53cb<\\/b><br \\/>\\n    <a href=\\\"http:\\/\\/www.joomla.cn\\/index.php?option=com_kunena&func=view&catid=34&id=9537&Itemid=46\\\" target=\\\"_blank\\\"><b>\\u52a0\\u5165\\u6211\\u4eec\\u7684\\u7ffb\\u8bd1\\u7ec4\\uff08\\u771f\\u6b63\\u81ea\\u4e3b\\u7684\\u534f\\u4f5c\\u65b9\\u5f0f\\uff09<\\/b><\\/a><\\/td>\\n  <\\/tr>\\n  <tr>\\n    <td colspan=\\\"2\\\">&nbsp;<\\/td>\\n  <\\/tr>\\n<\\/table>\\n <\\/div>\\n  \\n\\t\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10206,'TinyMCE zh-CN','file','tinymce_zh-CN','',0,1,0,0,'{\"legacy\":false,\"name\":\"TinyMCE zh-CN\",\"type\":\"file\",\"creationDate\":\"2012.05.23\",\"author\":\"Joomla! China\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved\",\"authorEmail\":\"zhous1998@gmail.com\",\"authorUrl\":\"www.joomla.cn\",\"version\":\"3.4.9\",\"description\":\"Joomla\\u6838\\u5fc3\\u7f16\\u8f91\\u5668TinyMCE 3.4.9\\u7684\\u7b80\\u4f53\\u4e2d\\u6587\\u8bed\\u8a00\\u5305\\u3002Simplified Chinese Language Package for TinyMCE 3.4.9 in Joomla 2.5.\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(10207,'zh-CN','package','pkg_zh-CN','',0,1,1,0,'{\"legacy\":false,\"name\":\"\\u7b80\\u4f53\\u4e2d\\u6587Simplified Chinese\",\"type\":\"package\",\"creationDate\":\"2012-09-08\",\"author\":\"CHN Translation Team\",\"copyright\":\"Copyright (C) 2010 CHN Joomla Translation Team  (http:\\/\\/joomlacode.org\\/gf\\/project\\/choice\\/). All rights reserved.\",\"authorEmail\":\"zhous1998@sohu.com\",\"authorUrl\":\"www.joomla.cn\",\"version\":\"2.5.7.1\",\"description\":\"\\n\\t\\n\\t<h3>Joomla! 2.5.7\\u7b80\\u4f53\\u4e2d\\u6587\\u8bed\\u8a00\\u5305\\u7b2c\\u4e00\\u7248<\\/h3>\\n    <h3>Joomla! 2.5.7 Full Simplified Chinese (zh-CN) Language Package version 1<\\/h3>\\n    <h3>\\u672c\\u5b89\\u88c5\\u5305\\u5df2\\u5305\\u542bJoomla\\u6838\\u5fc3\\u7f16\\u8f91\\u5668TinyMCE 3.4.9\\u7684\\u4e2d\\u6587\\u8bed\\u8a00<\\/h3>\\n\\t<div>\\n\\tJoomla 2.5.7\\u8bed\\u8a00\\u662f\\u7531Joomla\\u5b98\\u65b9\\u7ffb\\u8bd1\\u7ec4\\u7684Derek Joe\\u7ec4\\u7ec7\\u7ffb\\u8bd1\\u3002\\u5de5\\u4f5c\\u662f\\u5728Joomla1.6\\u7684\\u57fa\\u7840\\u4e0a\\u8fdb\\u884c\\u7684\\u3002Joomla 2.5.7\\u8bed\\u8a00\\u7684\\u8865\\u5145\\u7531Derek Joe\\u5b8c\\u6210\\u3002\\u611f\\u8c22Joomla\\u7b80\\u4f53\\u4e2d\\u6587\\u7ffb\\u8bd1\\u7ec4\\u7684\\u6240\\u6709\\u5fd7\\u613f\\u8005\\uff1a\\u6b66\\u7389\\u6770\\u3001Key Diagram\\u3001Yusuf  Wang\\u3001\\u90ed\\u5fd7\\u6500\\u3001Eric Wong\\uff08http:\\/\\/berocks2.com\\/\\uff09\\u3001wayne82\\uff01\\u7ffb\\u8bd1\\u57fa\\u5730\\uff1a<a href=\\\"http:\\/\\/www.joomla.cn\\\" target=\\\"_blank\\\">\\u56e7\\u5566!\\u4e2d\\u56fd\\uff08Joomla.cn\\uff09<\\/a>\\u3002\\u7ffb\\u8bd1\\u4e0e\\u4f7f\\u7528\\u4ea4\\u6d41\\uff1a\\uff1a<a href=\\\"http:\\/\\/weibo.com\\/joomlacn\\\" target=\\\"_blank\\\">\\u56e7\\u5566\\u4e2d\\u56fd\\uff08\\u65b0\\u6d6a\\u5fae\\u535a\\uff09<\\/a>\\u3002\\u6b22\\u8fce\\u559c\\u6b22\\u7ffb\\u8bd1\\u7684\\u670b\\u53cb\\u52a0\\u5165\\u6211\\u4eec\\u3002<br><br>\\n\\t\\u4e3a\\u4e86\\u66f4\\u597d\\u5730\\u4f7f\\u7528Joomla\\uff0cDerek\\u66f4\\u65b0\\u4e86Joomla\\u6838\\u5fc3\\u7f16\\u8f91\\u5668TinyMCE\\u7684\\u7b80\\u4f53\\u4e2d\\u6587\\u8bed\\u8a00\\u3002<br> <br>\\n\\t<\\/div>\\n\\t\\n\\t\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0);
/*!40000 ALTER TABLE `bk078_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_newsfeeds`
--

DROP TABLE IF EXISTS `bk078_newsfeeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `link` varchar(200) NOT NULL DEFAULT '',
  `filename` varchar(200) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(10) unsigned NOT NULL DEFAULT '1',
  `cache_time` int(10) unsigned NOT NULL DEFAULT '3600',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_newsfeeds`
--

LOCK TABLES `bk078_newsfeeds` WRITE;
/*!40000 ALTER TABLE `bk078_newsfeeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_newsfeeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_finder_links_terms1`
--

DROP TABLE IF EXISTS `bk078_finder_links_terms1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_finder_links_terms1` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_finder_links_terms1`
--

LOCK TABLES `bk078_finder_links_terms1` WRITE;
/*!40000 ALTER TABLE `bk078_finder_links_terms1` DISABLE KEYS */;
INSERT INTO `bk078_finder_links_terms1` VALUES (64,4113,0.42),(64,4114,1.77338),(64,4115,1.96),(64,4116,0.56),(64,4117,1.77338),(64,4118,1.91338),(64,4119,0.56),(64,4120,2.05338),(64,4121,2.19338);
/*!40000 ALTER TABLE `bk078_finder_links_terms1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_user_notes`
--

DROP TABLE IF EXISTS `bk078_user_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_user_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(100) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL,
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_category_id` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_user_notes`
--

LOCK TABLES `bk078_user_notes` WRITE;
/*!40000 ALTER TABLE `bk078_user_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_user_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_content_rating`
--

DROP TABLE IF EXISTS `bk078_content_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(10) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_content_rating`
--

LOCK TABLES `bk078_content_rating` WRITE;
/*!40000 ALTER TABLE `bk078_content_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_content_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_finder_links_terms2`
--

DROP TABLE IF EXISTS `bk078_finder_links_terms2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_finder_links_terms2` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_finder_links_terms2`
--

LOCK TABLES `bk078_finder_links_terms2` WRITE;
/*!40000 ALTER TABLE `bk078_finder_links_terms2` DISABLE KEYS */;
INSERT INTO `bk078_finder_links_terms2` VALUES (64,4100,0.84),(64,4101,1.68),(64,4102,1.86662),(64,4103,1.68),(64,4104,1.86662),(64,4105,1.68),(64,4106,1.86662),(65,4251,0.23331),(65,4252,0.93331),(65,4253,1.02669),(67,4604,0.18669),(67,4605,0.95669),(67,4606,1.14331),(67,4607,0.28),(67,4608,0.93331),(67,4609,1.05),(67,4610,0.95669),(67,4611,1.23669),(67,4612,0.46669),(67,4613,1.05),(67,4614,1.19),(67,4615,0.56),(67,4616,1.14331),(67,4617,1.23669),(67,4618,0.32669),(67,4619,0.98),(67,4620,1.05),(67,4621,0.28),(67,4622,0.93331),(67,4623,1.12),(67,4624,0.46662),(67,4625,2.05338),(67,4626,2.19338),(67,4685,0.18669),(67,4686,0.93331),(67,4687,1.02669),(67,4688,0.18669),(67,4689,0.91),(67,4690,1.07331),(67,4691,0.32669),(67,4692,0.98),(67,4693,1.05),(67,4694,0.18669),(67,4695,0.91),(67,4696,1.09669),(67,4697,0.23331),(67,4698,0.91),(67,4699,1.14331),(67,4700,0.18669),(67,4701,0.88669),(67,4702,1.02669);
/*!40000 ALTER TABLE `bk078_finder_links_terms2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_menu_types`
--

DROP TABLE IF EXISTS `bk078_menu_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL,
  `title` varchar(48) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_menutype` (`menutype`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_menu_types`
--

LOCK TABLES `bk078_menu_types` WRITE;
/*!40000 ALTER TABLE `bk078_menu_types` DISABLE KEYS */;
INSERT INTO `bk078_menu_types` VALUES (1,'mainmenu','Main Menu','The main menu for the site'),(2,'system-menu','System Menu',''),(5,'about-us','About us',''),(10,'destination','Destination',''),(11,'agent','Agent','');
/*!40000 ALTER TABLE `bk078_menu_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_comprofiler_lists`
--

DROP TABLE IF EXISTS `bk078_comprofiler_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_comprofiler_lists` (
  `listid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `viewaccesslevel` int(10) unsigned NOT NULL DEFAULT '0',
  `usergroupids` varchar(255) DEFAULT NULL,
  `useraccessgroupid` int(9) NOT NULL DEFAULT '18',
  `sortfields` varchar(255) DEFAULT NULL,
  `filterfields` mediumtext,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `col1title` varchar(255) DEFAULT NULL,
  `col1enabled` tinyint(1) NOT NULL DEFAULT '0',
  `col1fields` mediumtext,
  `col2title` varchar(255) DEFAULT NULL,
  `col2enabled` tinyint(1) NOT NULL DEFAULT '0',
  `col1captions` tinyint(1) NOT NULL DEFAULT '0',
  `col2fields` mediumtext,
  `col2captions` tinyint(1) NOT NULL DEFAULT '0',
  `col3title` varchar(255) DEFAULT NULL,
  `col3enabled` tinyint(1) NOT NULL DEFAULT '0',
  `col3fields` mediumtext,
  `col3captions` tinyint(1) NOT NULL DEFAULT '0',
  `col4title` varchar(255) DEFAULT NULL,
  `col4enabled` tinyint(1) NOT NULL DEFAULT '0',
  `col4fields` mediumtext,
  `col4captions` tinyint(1) NOT NULL DEFAULT '0',
  `params` mediumtext,
  PRIMARY KEY (`listid`),
  KEY `pub_ordering` (`published`,`ordering`),
  KEY `default_published` (`default`,`published`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_comprofiler_lists`
--

LOCK TABLES `bk078_comprofiler_lists` WRITE;
/*!40000 ALTER TABLE `bk078_comprofiler_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_comprofiler_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_usergroups`
--

DROP TABLE IF EXISTS `bk078_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_usergroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Adjacency List Reference Id',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `title` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  KEY `idx_usergroup_title_lookup` (`title`),
  KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_usergroups`
--

LOCK TABLES `bk078_usergroups` WRITE;
/*!40000 ALTER TABLE `bk078_usergroups` DISABLE KEYS */;
INSERT INTO `bk078_usergroups` VALUES (1,0,1,18,'Public'),(2,1,6,15,'Registered'),(3,2,9,14,'Author'),(4,3,10,13,'Editor'),(5,4,11,12,'Publisher'),(6,1,2,5,'Manager'),(7,6,3,4,'Administrator'),(8,1,16,17,'Super Users'),(10,2,7,8,'Agent');
/*!40000 ALTER TABLE `bk078_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_k2_extra_fields_groups`
--

DROP TABLE IF EXISTS `bk078_k2_extra_fields_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_k2_extra_fields_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_k2_extra_fields_groups`
--

LOCK TABLES `bk078_k2_extra_fields_groups` WRITE;
/*!40000 ALTER TABLE `bk078_k2_extra_fields_groups` DISABLE KEYS */;
INSERT INTO `bk078_k2_extra_fields_groups` VALUES (1,'Portfolio'),(2,'Testimonials'),(3,'Thumbnails');
/*!40000 ALTER TABLE `bk078_k2_extra_fields_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_weblinks`
--

DROP TABLE IF EXISTS `bk078_weblinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_weblinks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL DEFAULT '0',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '1',
  `access` int(11) NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `language` char(7) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if link is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_weblinks`
--

LOCK TABLES `bk078_weblinks` WRITE;
/*!40000 ALTER TABLE `bk078_weblinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_weblinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_osmembership_categories`
--

DROP TABLE IF EXISTS `bk078_osmembership_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_osmembership_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `published` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_osmembership_categories`
--

LOCK TABLES `bk078_osmembership_categories` WRITE;
/*!40000 ALTER TABLE `bk078_osmembership_categories` DISABLE KEYS */;
INSERT INTO `bk078_osmembership_categories` VALUES (1,'Standard Member','<p>MTA Standard Member</p>',1);
/*!40000 ALTER TABLE `bk078_osmembership_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_messages`
--

DROP TABLE IF EXISTS `bk078_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_to` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `priority` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_messages`
--

LOCK TABLES `bk078_messages` WRITE;
/*!40000 ALTER TABLE `bk078_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_assets`
--

DROP TABLE IF EXISTS `bk078_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set parent.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `level` int(10) unsigned NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asset_name` (`name`),
  KEY `idx_lft_rgt` (`lft`,`rgt`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_assets`
--

LOCK TABLES `bk078_assets` WRITE;
/*!40000 ALTER TABLE `bk078_assets` DISABLE KEYS */;
INSERT INTO `bk078_assets` VALUES (1,0,1,87,0,'root.1','Root Asset','{\"core.login.site\":{\"6\":1,\"2\":1},\"core.login.admin\":{\"6\":1},\"core.login.offline\":{\"6\":1},\"core.admin\":{\"8\":1},\"core.manage\":{\"7\":1},\"core.create\":{\"6\":1,\"3\":1},\"core.delete\":{\"6\":1,\"9\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"core.edit.own\":{\"6\":1,\"3\":1}}'),(2,1,1,2,1,'com_admin','com_admin','{}'),(3,1,3,6,1,'com_banners','com_banners','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(4,1,7,8,1,'com_cache','com_cache','{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}'),(5,1,9,10,1,'com_checkin','com_checkin','{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}'),(6,1,11,12,1,'com_config','com_config','{}'),(7,1,13,16,1,'com_contact','com_contact','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(8,1,17,20,1,'com_content','com_content','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(9,1,21,22,1,'com_cpanel','com_cpanel','{}'),(10,1,23,24,1,'com_installer','com_installer','{\"core.admin\":[],\"core.manage\":{\"7\":0},\"core.delete\":{\"7\":0},\"core.edit.state\":{\"7\":0}}'),(11,1,25,26,1,'com_languages','com_languages','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(12,1,27,28,1,'com_login','com_login','{}'),(13,1,29,30,1,'com_mailto','com_mailto','{}'),(14,1,31,32,1,'com_massmail','com_massmail','{}'),(15,1,33,34,1,'com_media','com_media','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":{\"5\":1}}'),(16,1,35,36,1,'com_menus','com_menus','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(17,1,37,38,1,'com_messages','com_messages','{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}'),(18,1,39,40,1,'com_modules','com_modules','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(19,1,41,44,1,'com_newsfeeds','com_newsfeeds','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(20,1,45,46,1,'com_plugins','com_plugins','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(21,1,47,48,1,'com_redirect','com_redirect','{\"core.admin\":{\"7\":1},\"core.manage\":[]}'),(22,1,49,50,1,'com_search','com_search','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),(23,1,51,52,1,'com_templates','com_templates','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(24,1,53,56,1,'com_users','com_users','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(25,1,57,60,1,'com_weblinks','com_weblinks','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(26,1,61,62,1,'com_wrapper','com_wrapper','{}'),(27,8,18,19,2,'com_content.category.2','Uncategorised','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(28,3,4,5,2,'com_banners.category.3','Uncategorised','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(29,7,14,15,2,'com_contact.category.4','Uncategorised','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(30,19,42,43,2,'com_newsfeeds.category.5','Uncategorised','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(31,25,58,59,2,'com_weblinks.category.6','Uncategorised','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(32,24,54,55,1,'com_users.notes.category.7','Uncategorised','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(33,1,63,64,1,'com_finder','com_finder','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),(34,1,65,66,1,'com_joomlaupdate','com_joomlaupdate','{\"core.admin\":[],\"core.manage\":[],\"core.delete\":[],\"core.edit.state\":[]}'),(35,1,67,68,1,'com_k2','com_k2','{\"core.admin\":[],\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(36,1,69,70,1,'com_rokcandy.category.7','Basic',''),(37,1,71,72,1,'com_rokcandy.category.8','Typography',''),(38,1,73,74,1,'com_rokcandy.category.9','Uncategorised',''),(39,1,75,80,1,'com_rokcandy','rokcandy','{}'),(40,39,76,77,2,'com_rokcandy.category.10','Alert Boxes','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(41,39,78,79,2,'com_rokcandy.category.11','Fluid Columns','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(45,1,81,82,1,'com_osmembership','osmembership','{}'),(46,1,83,84,1,'com_comprofiler','comprofiler','{}'),(47,1,85,86,1,'com_travel','travel','{}');
/*!40000 ALTER TABLE `bk078_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_banners`
--

DROP TABLE IF EXISTS `bk078_banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `clickurl` varchar(200) NOT NULL DEFAULT '',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `custombannercode` varchar(2048) NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `params` text NOT NULL,
  `own_prefix` tinyint(1) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `language` char(7) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`),
  KEY `idx_banner_catid` (`catid`),
  KEY `idx_language` (`language`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_banners`
--

LOCK TABLES `bk078_banners` WRITE;
/*!40000 ALTER TABLE `bk078_banners` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_banner_clients`
--

DROP TABLE IF EXISTS `bk078_banner_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_banner_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contact` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `extrainfo` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `metakey` text NOT NULL,
  `own_prefix` tinyint(4) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_banner_clients`
--

LOCK TABLES `bk078_banner_clients` WRITE;
/*!40000 ALTER TABLE `bk078_banner_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_banner_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_menu`
--

DROP TABLE IF EXISTS `bk078_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(1024) NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The published state of the menu link.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'The parent menu item in the menu tree.',
  `level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The relative level in the tree.',
  `component_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__extensions.id',
  `ordering` int(11) NOT NULL DEFAULT '0' COMMENT 'The relative ordering of the menu item in the tree.',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__users.id',
  `checked_out_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The click behaviour of the link.',
  `access` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `home` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) NOT NULL DEFAULT '',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`,`language`),
  KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  KEY `idx_menutype` (`menutype`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_path` (`path`(333)),
  KEY `idx_language` (`language`)
) ENGINE=MyISAM AUTO_INCREMENT=263 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_menu`
--

LOCK TABLES `bk078_menu` WRITE;
/*!40000 ALTER TABLE `bk078_menu` DISABLE KEYS */;
INSERT INTO `bk078_menu` VALUES (1,'','Menu_Item_Root','root','','','','',1,0,0,0,0,0,'0000-00-00 00:00:00',0,0,'',0,'',0,155,0,'*',0),(2,'menu','com_banners','Banners','','Banners','index.php?option=com_banners','component',0,1,1,4,0,0,'0000-00-00 00:00:00',0,0,'class:banners',0,'',1,10,0,'*',1),(3,'menu','com_banners','Banners','','Banners/Banners','index.php?option=com_banners','component',0,2,2,4,0,0,'0000-00-00 00:00:00',0,0,'class:banners',0,'',2,3,0,'*',1),(4,'menu','com_banners_categories','Categories','','Banners/Categories','index.php?option=com_categories&extension=com_banners','component',0,2,2,6,0,0,'0000-00-00 00:00:00',0,0,'class:banners-cat',0,'',4,5,0,'*',1),(5,'menu','com_banners_clients','Clients','','Banners/Clients','index.php?option=com_banners&view=clients','component',0,2,2,4,0,0,'0000-00-00 00:00:00',0,0,'class:banners-clients',0,'',6,7,0,'*',1),(6,'menu','com_banners_tracks','Tracks','','Banners/Tracks','index.php?option=com_banners&view=tracks','component',0,2,2,4,0,0,'0000-00-00 00:00:00',0,0,'class:banners-tracks',0,'',8,9,0,'*',1),(7,'menu','com_contact','Contacts','','Contacts','index.php?option=com_contact','component',0,1,1,8,0,0,'0000-00-00 00:00:00',0,0,'class:contact',0,'',13,18,0,'*',1),(8,'menu','com_contact','Contacts','','Contacts/Contacts','index.php?option=com_contact','component',0,7,2,8,0,0,'0000-00-00 00:00:00',0,0,'class:contact',0,'',14,15,0,'*',1),(9,'menu','com_contact_categories','Categories','','Contacts/Categories','index.php?option=com_categories&extension=com_contact','component',0,7,2,6,0,0,'0000-00-00 00:00:00',0,0,'class:contact-cat',0,'',16,17,0,'*',1),(10,'menu','com_messages','Messaging','','Messaging','index.php?option=com_messages','component',0,1,1,15,0,0,'0000-00-00 00:00:00',0,0,'class:messages',0,'',23,28,0,'*',1),(11,'menu','com_messages_add','New Private Message','','Messaging/New Private Message','index.php?option=com_messages&task=message.add','component',0,10,2,15,0,0,'0000-00-00 00:00:00',0,0,'class:messages-add',0,'',24,25,0,'*',1),(12,'menu','com_messages_read','Read Private Message','','Messaging/Read Private Message','index.php?option=com_messages','component',0,10,2,15,0,0,'0000-00-00 00:00:00',0,0,'class:messages-read',0,'',26,27,0,'*',1),(13,'menu','com_newsfeeds','News Feeds','','News Feeds','index.php?option=com_newsfeeds','component',0,1,1,17,0,0,'0000-00-00 00:00:00',0,0,'class:newsfeeds',0,'',29,34,0,'*',1),(14,'menu','com_newsfeeds_feeds','Feeds','','News Feeds/Feeds','index.php?option=com_newsfeeds','component',0,13,2,17,0,0,'0000-00-00 00:00:00',0,0,'class:newsfeeds',0,'',30,31,0,'*',1),(15,'menu','com_newsfeeds_categories','Categories','','News Feeds/Categories','index.php?option=com_categories&extension=com_newsfeeds','component',0,13,2,6,0,0,'0000-00-00 00:00:00',0,0,'class:newsfeeds-cat',0,'',32,33,0,'*',1),(16,'menu','com_redirect','Redirect','','Redirect','index.php?option=com_redirect','component',0,1,1,24,0,0,'0000-00-00 00:00:00',0,0,'class:redirect',0,'',43,44,0,'*',1),(17,'menu','com_search','Search','','Search','index.php?option=com_search','component',0,1,1,19,0,0,'0000-00-00 00:00:00',0,0,'class:search',0,'',35,36,0,'*',1),(18,'menu','com_weblinks','Weblinks','','Weblinks','index.php?option=com_weblinks','component',0,1,1,21,0,0,'0000-00-00 00:00:00',0,0,'class:weblinks',0,'',37,42,0,'*',1),(19,'menu','com_weblinks_links','Links','','Weblinks/Links','index.php?option=com_weblinks','component',0,18,2,21,0,0,'0000-00-00 00:00:00',0,0,'class:weblinks',0,'',38,39,0,'*',1),(20,'menu','com_weblinks_categories','Categories','','Weblinks/Categories','index.php?option=com_categories&extension=com_weblinks','component',0,18,2,6,0,0,'0000-00-00 00:00:00',0,0,'class:weblinks-cat',0,'',40,41,0,'*',1),(101,'mainmenu','About Us','about-us','','about-us','index.php?option=com_k2&view=item&layout=item&id=105','component',1,1,1,10023,0,0,'0000-00-00 00:00:00',0,1,'',23,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"no_body\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0,\"fusion_item_subtext\":\"\",\"fusion_customimage\":\"\",\"fusion_customclass\":\"\",\"fusion_columns\":\"1\",\"fusion_distribution\":\"even\",\"fusion_dropdown_width\":\"\",\"fusion_column_widths\":\"\",\"fusion_children_group\":\"0\",\"fusion_children_type\":\"menuitems\",\"fusion_modules\":\"80\",\"fusion_module_positions\":\"\",\"splitmenu_item_subtext\":\"\"}',11,12,0,'*',0),(210,'main','K2_INFORMATION','k2-information','','com-k2/k2-information','index.php?option=com_k2&view=info','component',0,200,2,10023,0,0,'0000-00-00 00:00:00',0,1,'class:component',0,'',88,89,0,'',1),(209,'main','K2_MEDIA_MANAGER','k2-media-manager','','com-k2/k2-media-manager','index.php?option=com_k2&view=media','component',0,200,2,10023,0,0,'0000-00-00 00:00:00',0,1,'class:component',0,'',86,87,0,'',1),(208,'main','K2_EXTRA_FIELD_GROUPS','k2-extra-field-groups','','com-k2/k2-extra-field-groups','index.php?option=com_k2&view=extrafieldsgroups','component',0,200,2,10023,0,0,'0000-00-00 00:00:00',0,1,'class:component',0,'',84,85,0,'',1),(207,'main','K2_EXTRA_FIELDS','k2-extra-fields','','com-k2/k2-extra-fields','index.php?option=com_k2&view=extrafields','component',0,200,2,10023,0,0,'0000-00-00 00:00:00',0,1,'class:component',0,'',82,83,0,'',1),(206,'main','K2_USER_GROUPS','k2-user-groups','','com-k2/k2-user-groups','index.php?option=com_k2&view=usergroups','component',0,200,2,10023,0,0,'0000-00-00 00:00:00',0,1,'class:component',0,'',80,81,0,'',1),(205,'main','K2_USERS','k2-users','','com-k2/k2-users','index.php?option=com_k2&view=users','component',0,200,2,10023,0,0,'0000-00-00 00:00:00',0,1,'class:component',0,'',78,79,0,'',1),(203,'main','K2_TAGS','k2-tags','','com-k2/k2-tags','index.php?option=com_k2&view=tags','component',0,200,2,10023,0,0,'0000-00-00 00:00:00',0,1,'class:component',0,'',74,75,0,'',1),(254,'main','TRAVEL_MENU_WITHDRAWS','travel-menu-withdraws','','travel-menu-travel/travel-menu-withdraws','index.php?option=com_travel&view=withdraws','component',0,251,2,10203,0,0,'0000-00-00 00:00:00',0,1,'components/com_travel/images/icon-16-travel_withdraws.png',0,'',148,149,0,'',1),(255,'mainmenu','Travel Packages','travel-packages','','agent/travel-packages','index.php?option=com_travel&view=packages','component',-2,224,2,10203,0,0,'0000-00-00 00:00:00',0,4,'',23,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0,\"fusion_item_subtext\":\"\",\"fusion_customimage\":\"\",\"fusion_customclass\":\"\",\"fusion_columns\":\"1\",\"fusion_distribution\":\"even\",\"fusion_dropdown_width\":\"\",\"fusion_column_widths\":\"\",\"fusion_children_group\":\"0\",\"fusion_children_type\":\"menuitems\",\"fusion_modules\":\"94\",\"fusion_module_positions\":\"\",\"splitmenu_item_subtext\":\"\"}',94,95,0,'en-GB',0),(256,'mainmenu','Agent Subscription','agent-subscription','','agent/agent-subscription','index.php?option=com_osmembership&view=plan&id=1','component',-2,224,2,10200,0,0,'0000-00-00 00:00:00',0,2,'',0,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0,\"fusion_item_subtext\":\"\",\"fusion_customimage\":\"\",\"fusion_customclass\":\"\",\"fusion_columns\":\"1\",\"fusion_distribution\":\"even\",\"fusion_dropdown_width\":\"\",\"fusion_column_widths\":\"\",\"fusion_children_group\":\"0\",\"fusion_children_type\":\"menuitems\",\"fusion_modules\":\"94\",\"fusion_module_positions\":\"\",\"splitmenu_item_subtext\":\"\"}',96,97,0,'*',0),(257,'mainmenu','Subscription History','subscription-history','','agent/subscription-history','index.php?option=com_osmembership&view=subscriptions','component',-2,224,2,10200,0,0,'0000-00-00 00:00:00',0,2,'',0,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0,\"fusion_item_subtext\":\"\",\"fusion_customimage\":\"\",\"fusion_customclass\":\"\",\"fusion_columns\":\"1\",\"fusion_distribution\":\"even\",\"fusion_dropdown_width\":\"\",\"fusion_column_widths\":\"\",\"fusion_children_group\":\"0\",\"fusion_children_type\":\"menuitems\",\"fusion_modules\":\"94\",\"fusion_module_positions\":\"\",\"splitmenu_item_subtext\":\"\"}',98,99,0,'*',0),(258,'mainmenu','Order History','order-history','','agent/order-history','index.php?option=com_travel&view=sales&layout=sales','component',-2,224,2,10203,0,0,'0000-00-00 00:00:00',0,4,'',0,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0,\"fusion_item_subtext\":\"\",\"fusion_customimage\":\"\",\"fusion_customclass\":\"\",\"fusion_columns\":\"1\",\"fusion_distribution\":\"even\",\"fusion_dropdown_width\":\"\",\"fusion_column_widths\":\"\",\"fusion_children_group\":\"0\",\"fusion_children_type\":\"menuitems\",\"fusion_modules\":\"94\",\"fusion_module_positions\":\"\",\"splitmenu_item_subtext\":\"\"}',100,101,0,'*',0),(259,'mainmenu','Commission History','commission-history','','agent/commission-history','index.php?option=com_travel&view=withdraws','component',-2,224,2,10203,0,0,'0000-00-00 00:00:00',0,4,'',23,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0,\"fusion_item_subtext\":\"\",\"fusion_customimage\":\"\",\"fusion_customclass\":\"\",\"fusion_columns\":\"1\",\"fusion_distribution\":\"even\",\"fusion_dropdown_width\":\"\",\"fusion_column_widths\":\"\",\"fusion_children_group\":\"0\",\"fusion_children_type\":\"menuitems\",\"fusion_modules\":\"94\",\"fusion_module_positions\":\"\",\"splitmenu_item_subtext\":\"\"}',102,103,0,'*',0),(124,'system-menu','Privacy Policy','privacy-policy','','privacy-policy','index.php?option=com_k2&view=item&layout=item&id=39','component',1,1,1,10023,0,0,'0000-00-00 00:00:00',0,1,'',23,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0,\"fusion_item_subtext\":\"\",\"fusion_customimage\":\"\",\"fusion_customclass\":\"\",\"fusion_columns\":\"1\",\"fusion_distribution\":\"even\",\"fusion_dropdown_width\":\"\",\"fusion_column_widths\":\"\",\"fusion_children_group\":\"0\",\"fusion_children_type\":\"menuitems\",\"fusion_modules\":\"82\",\"fusion_module_positions\":\"\",\"splitmenu_item_subtext\":\"\"}',45,46,0,'*',0),(130,'main','COM_FINDER','com-finder','','com-finder','index.php?option=com_finder','component',0,1,1,10056,0,0,'0000-00-00 00:00:00',0,1,'class:finder',0,'',47,48,0,'',1),(21,'menu','com_finder','Smart Search','','Smart Search','index.php?option=com_finder','component',0,1,1,27,0,0,'0000-00-00 00:00:00',0,0,'class:finder',0,'',21,22,0,'*',1),(204,'main','K2_COMMENTS','k2-comments','','com-k2/k2-comments','index.php?option=com_k2&view=comments','component',0,200,2,10023,0,0,'0000-00-00 00:00:00',0,1,'class:component',0,'',76,77,0,'',1),(22,'menu','com_joomlaupdate','Joomla! Update','','Joomla! Update','index.php?option=com_joomlaupdate','component',0,1,1,28,0,0,'0000-00-00 00:00:00',0,0,'class:joomlaupdate',0,'',19,20,0,'*',1),(154,'system-menu','User login','user-login','','user-login','index.php?option=com_comprofiler&task=registers','component',1,1,1,10201,0,0,'0000-00-00 00:00:00',0,1,'',23,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0,\"fusion_item_subtext\":\"\",\"fusion_customimage\":\"\",\"fusion_customclass\":\"\",\"fusion_columns\":\"1\",\"fusion_distribution\":\"even\",\"fusion_dropdown_width\":\"\",\"fusion_column_widths\":\"\",\"fusion_children_group\":\"0\",\"fusion_children_type\":\"menuitems\",\"fusion_modules\":\"94\",\"fusion_module_positions\":\"\",\"splitmenu_item_subtext\":\"\"}',49,50,0,'*',0),(202,'main','K2_CATEGORIES','k2-categories','','com-k2/k2-categories','index.php?option=com_k2&view=categories','component',0,200,2,10023,0,0,'0000-00-00 00:00:00',0,1,'class:component',0,'',72,73,0,'',1),(169,'system-menu','404','404','','404','index.php?option=com_k2&view=item&layout=item&id=70','component',1,1,1,10023,0,0,'0000-00-00 00:00:00',0,1,'',23,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"404 Page Not Found\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"error\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0,\"fusion_item_subtext\":\"\",\"fusion_customimage\":\"\",\"fusion_customclass\":\"\",\"fusion_columns\":\"1\",\"fusion_distribution\":\"even\",\"fusion_dropdown_width\":\"\",\"fusion_column_widths\":\"\",\"fusion_children_group\":\"0\",\"fusion_children_type\":\"menuitems\",\"fusion_modules\":\"94\",\"fusion_module_positions\":\"\",\"splitmenu_item_subtext\":\"\"}',51,52,0,'*',0),(171,'system-menu','User Page','user-page','','user-page','index.php?option=com_k2&view=itemlist&layout=user&id=42&task=user','component',0,1,1,10023,0,0,'0000-00-00 00:00:00',0,1,'',23,'{\"theme\":\"blog\",\"userCategoriesFilter\":[\"4\",\"11\",\"19\",\"10\",\"20\",\"12\",\"21\",\"13\",\"22\"],\"userOrdering\":\"\",\"userFeedLink\":\"0\",\"userFeedIcon\":\"0\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":1,\"page_heading\":\"User Page (Blog)\",\"pageclass_sfx\":\"blog\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0,\"fusion_item_subtext\":\"\",\"fusion_customimage\":\"\",\"fusion_customclass\":\"\",\"fusion_columns\":\"1\",\"fusion_distribution\":\"even\",\"fusion_dropdown_width\":\"\",\"fusion_column_widths\":\"\",\"fusion_children_group\":\"0\",\"fusion_children_type\":\"menuitems\",\"fusion_modules\":\"94\",\"fusion_module_positions\":\"\",\"splitmenu_item_subtext\":\"\"}',53,54,0,'*',0),(172,'main','RokCandy','rokcandy','','rokcandy','index.php?option=com_rokcandy','component',0,1,1,10093,0,0,'0000-00-00 00:00:00',0,1,'components/com_rokcandy/assets/rokcandy-icon-16.png',0,'',55,60,0,'',1),(173,'main','Macros','macros','','rokcandy/macros','index.php?option=com_rokcandy','component',0,172,2,10093,0,0,'0000-00-00 00:00:00',0,1,'components/com_rokcandy/assets/rokcandy-icon-16.png',0,'',56,57,0,'',1),(174,'main','Categories','categories','','rokcandy/categories','index.php?option=com_categories&extension=com_rokcandy','component',0,172,2,10093,0,0,'0000-00-00 00:00:00',0,1,'components/com_rokcandy/assets/icon-16-category.png',0,'',58,59,0,'',1),(176,'system-menu','User Profile','user-profile','','user-profile','index.php?option=com_users&view=profile','component',0,1,1,25,0,0,'0000-00-00 00:00:00',0,1,'',23,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":1,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0,\"fusion_item_subtext\":\"\",\"fusion_customimage\":\"\",\"fusion_customclass\":\"\",\"fusion_columns\":\"1\",\"fusion_distribution\":\"even\",\"fusion_dropdown_width\":\"\",\"fusion_column_widths\":\"\",\"fusion_children_group\":\"0\",\"fusion_children_type\":\"menuitems\",\"fusion_modules\":\"94\",\"fusion_module_positions\":\"\",\"splitmenu_item_subtext\":\"\"}',61,62,0,'*',0),(177,'system-menu','Splash','splash','','splash','index.php?option=com_content&view=category&layout=blog&id=2','component',1,1,1,22,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"layout_type\":\"blog\",\"show_category_title\":\"\",\"show_description\":\"\",\"show_description_image\":\"\",\"maxLevel\":\"\",\"show_empty_categories\":\"\",\"show_no_articles\":\"\",\"show_subcat_desc\":\"\",\"show_cat_num_articles\":\"\",\"page_subheading\":\"\",\"num_leading_articles\":\"0\",\"num_intro_articles\":\"0\",\"num_columns\":\"0\",\"num_links\":\"0\",\"multi_column_order\":\"\",\"show_subcategory_content\":\"\",\"orderby_pri\":\"\",\"orderby_sec\":\"\",\"order_date\":\"\",\"show_pagination\":\"\",\"show_pagination_results\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_readmore\":\"\",\"show_readmore_title\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"show_feed_link\":\"\",\"feed_summary\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"splash\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0,\"fusion_item_subtext\":\"\",\"fusion_customimage\":\"\",\"fusion_customclass\":\"\",\"fusion_columns\":\"1\",\"fusion_distribution\":\"even\",\"fusion_dropdown_width\":\"\",\"fusion_column_widths\":\"\",\"fusion_children_group\":\"0\",\"fusion_children_type\":\"menuitems\",\"fusion_modules\":\"94\",\"fusion_module_positions\":\"\",\"splitmenu_item_subtext\":\"\"}',63,64,1,'*',0),(229,'main','OS Membership','os-membership','','os-membership','index.php?option=com_osmembership','component',0,1,1,10200,0,0,'0000-00-00 00:00:00',0,1,'class:component',0,'',107,126,0,'',1),(230,'main','Configuration','configuration','','os-membership/configuration','index.php?option=com_osmembership&view=configuration','component',0,229,2,10200,0,0,'0000-00-00 00:00:00',0,1,'class:component',0,'',108,109,0,'',1),(231,'main','Categories','categories','','os-membership/categories','index.php?option=com_osmembership&view=categories','component',0,229,2,10200,0,0,'0000-00-00 00:00:00',0,1,'class:component',0,'',110,111,0,'',1),(232,'main','Subscription Plans','subscription-plans','','os-membership/subscription-plans','index.php?option=com_osmembership&view=plans','component',0,229,2,10200,0,0,'0000-00-00 00:00:00',0,1,'class:component',0,'',112,113,0,'',1),(253,'main','TRAVEL_MENU_SALES','travel-menu-sales','','travel-menu-travel/travel-menu-sales','index.php?option=com_travel&view=sales','component',0,251,2,10203,0,0,'0000-00-00 00:00:00',0,1,'components/com_travel/images/icon-16-travel_sales.png',0,'',146,147,0,'',1),(224,'mainmenu','Agent','agent','','agent','index.php?option=com_travel&view=packages','component',1,1,1,10203,0,0,'0000-00-00 00:00:00',0,2,'',23,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0,\"fusion_item_subtext\":\"\",\"fusion_customimage\":\"\",\"fusion_customclass\":\"\",\"fusion_columns\":\"1\",\"fusion_distribution\":\"even\",\"fusion_dropdown_width\":\"\",\"fusion_column_widths\":\"\",\"fusion_children_group\":\"0\",\"fusion_children_type\":\"menuitems\",\"fusion_modules\":\"94\",\"fusion_module_positions\":\"\",\"splitmenu_item_subtext\":\"\"}',93,106,0,'en-GB',0),(181,'about-us','About us','1','','1','','separator',1,1,1,0,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"menu_image\":\"\",\"menu_text\":1,\"fusion_item_subtext\":\"\",\"fusion_customimage\":\"\",\"fusion_customclass\":\"\",\"fusion_columns\":\"1\",\"fusion_distribution\":\"even\",\"fusion_dropdown_width\":\"\",\"fusion_column_widths\":\"\",\"fusion_children_group\":\"0\",\"fusion_children_type\":\"menuitems\",\"fusion_modules\":\"94\",\"fusion_module_positions\":\"\",\"splitmenu_item_subtext\":\"\"}',65,66,0,'*',0),(251,'main','TRAVEL_MENU_TRAVEL','travel-menu-travel','','travel-menu-travel','index.php?option=com_travel','component',0,1,1,10203,0,0,'0000-00-00 00:00:00',0,1,'components/com_travel/images/icon-16-travel.png',0,'',143,150,0,'',1),(252,'main','TRAVEL_MENU_PACKAGES','travel-menu-packages','','travel-menu-travel/travel-menu-packages','index.php?option=com_travel&view=packages','component',0,251,2,10203,0,0,'0000-00-00 00:00:00',0,1,'components/com_travel/images/icon-16-travel_packages.png',0,'',144,145,0,'',1),(213,'destination','Destination','2','','2','','separator',1,1,1,0,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"menu_image\":\"\",\"menu_text\":1,\"fusion_item_subtext\":\"\",\"fusion_customimage\":\"\",\"fusion_customclass\":\"\",\"fusion_columns\":\"1\",\"fusion_distribution\":\"even\",\"fusion_dropdown_width\":\"\",\"fusion_column_widths\":\"\",\"fusion_children_group\":\"0\",\"fusion_children_type\":\"menuitems\",\"fusion_modules\":\"94\",\"fusion_module_positions\":\"\",\"splitmenu_item_subtext\":\"\"}',91,92,0,'*',0),(200,'main','COM_K2','com-k2','','com-k2','index.php?option=com_k2','component',0,1,1,10023,0,0,'0000-00-00 00:00:00',0,1,'../media/k2/assets/images/system/k2_16x16.png',0,'',69,90,0,'',1),(201,'main','K2_ITEMS','k2-items','','com-k2/k2-items','index.php?option=com_k2&view=items','component',0,200,2,10023,0,0,'0000-00-00 00:00:00',0,1,'class:component',0,'',70,71,0,'',1),(199,'mainmenu','Destination','destination','','destination','index.php?option=com_k2&view=itemlist&layout=category&task=category&id=31','component',1,1,1,10023,0,0,'0000-00-00 00:00:00',0,1,'',23,'{\"categories\":[\"31\"],\"singleCatOrdering\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":1,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0,\"fusion_item_subtext\":\"\",\"fusion_customimage\":\"\",\"fusion_customclass\":\"\",\"fusion_columns\":\"1\",\"fusion_distribution\":\"even\",\"fusion_dropdown_width\":\"\",\"fusion_column_widths\":\"\",\"fusion_children_group\":\"0\",\"fusion_children_type\":\"menuitems\",\"fusion_modules\":\"94\",\"fusion_module_positions\":\"\",\"splitmenu_item_subtext\":\"\"}',67,68,0,'en-GB',0),(233,'main','Subscribers','subscribers','','os-membership/subscribers','index.php?option=com_osmembership&view=subscribers','component',0,229,2,10200,0,0,'0000-00-00 00:00:00',0,1,'class:component',0,'',114,115,0,'',1),(234,'main','Upgrade Rules','upgrade-rules','','os-membership/upgrade-rules','index.php?option=com_osmembership&view=rules','component',0,229,2,10200,0,0,'0000-00-00 00:00:00',0,1,'class:component',0,'',116,117,0,'',1),(235,'main','Custom Fields','custom-fields','','os-membership/custom-fields','index.php?option=com_osmembership&view=fields','component',0,229,2,10200,0,0,'0000-00-00 00:00:00',0,1,'class:component',0,'',118,119,0,'',1),(236,'main','Coupons','coupons','','os-membership/coupons','index.php?option=com_osmembership&view=coupons','component',0,229,2,10200,0,0,'0000-00-00 00:00:00',0,1,'class:component',0,'',120,121,0,'',1),(237,'main','Payment Plugins','payment-plugins','','os-membership/payment-plugins','index.php?option=com_osmembership&view=plugins','component',0,229,2,10200,0,0,'0000-00-00 00:00:00',0,1,'class:component',0,'',122,123,0,'',1),(238,'main','Translation','translation','','os-membership/translation','index.php?option=com_osmembership&view=language','component',0,229,2,10200,0,0,'0000-00-00 00:00:00',0,1,'class:component',0,'',124,125,0,'',1),(239,'main','COM_COMPROFILER','com-comprofiler','','com-comprofiler','index.php?option=com_comprofiler','component',0,1,1,10201,0,0,'0000-00-00 00:00:00',0,1,'../components/com_comprofiler/plugin/templates/luna/images/header/icon-16-cb.png',0,'',127,142,0,'',1),(240,'main','COM_COMPROFILER_SHOWUSERS','com-comprofiler-showusers','','com-comprofiler/com-comprofiler-showusers','index.php?option=com_comprofiler&task=showusers&view=showusers','component',0,239,2,10201,0,0,'0000-00-00 00:00:00',0,1,'class:user',0,'',128,129,0,'',1),(241,'main','COM_COMPROFILER_SHOWTAB','com-comprofiler-showtab','','com-comprofiler/com-comprofiler-showtab','index.php?option=com_comprofiler&task=showTab&view=showTab','component',0,239,2,10201,0,0,'0000-00-00 00:00:00',0,1,'class:themes',0,'',130,131,0,'',1),(242,'main','COM_COMPROFILER_SHOWFIELD','com-comprofiler-showfield','','com-comprofiler/com-comprofiler-showfield','index.php?option=com_comprofiler&task=showField&view=showField','component',0,239,2,10201,0,0,'0000-00-00 00:00:00',0,1,'class:content',0,'',132,133,0,'',1),(243,'main','COM_COMPROFILER_SHOWLISTS','com-comprofiler-showlists','','com-comprofiler/com-comprofiler-showlists','index.php?option=com_comprofiler&task=showLists&view=showLists','component',0,239,2,10201,0,0,'0000-00-00 00:00:00',0,1,'class:search',0,'',134,135,0,'',1),(244,'main','COM_COMPROFILER_SHOWPLUGINS','com-comprofiler-showplugins','','com-comprofiler/com-comprofiler-showplugins','index.php?option=com_comprofiler&task=showPlugins&view=showPlugins','component',0,239,2,10201,0,0,'0000-00-00 00:00:00',0,1,'class:plugin',0,'',136,137,0,'',1),(245,'main','COM_COMPROFILER_TOOLS','com-comprofiler-tools','','com-comprofiler/com-comprofiler-tools','index.php?option=com_comprofiler&task=tools&view=tools','component',0,239,2,10201,0,0,'0000-00-00 00:00:00',0,1,'class:maintenance',0,'',138,139,0,'',1),(246,'main','COM_COMPROFILER_SHOWCONFIG','com-comprofiler-showconfig','','com-comprofiler/com-comprofiler-showconfig','index.php?option=com_comprofiler&task=showconfig&view=showconfig','component',0,239,2,10201,0,0,'0000-00-00 00:00:00',0,1,'class:config',0,'',140,141,0,'',1),(260,'system-menu','New Subscription','new-subscription','','new-subscription','index.php?option=com_osmembership&view=register&id=1','component',1,1,1,10200,0,0,'0000-00-00 00:00:00',0,1,'',23,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0,\"fusion_item_subtext\":\"\",\"fusion_customimage\":\"\",\"fusion_customclass\":\"\",\"fusion_columns\":\"1\",\"fusion_distribution\":\"even\",\"fusion_dropdown_width\":\"\",\"fusion_column_widths\":\"\",\"fusion_children_group\":\"0\",\"fusion_children_type\":\"menuitems\",\"fusion_modules\":\"94\",\"fusion_module_positions\":\"\",\"splitmenu_item_subtext\":\"\"}',151,152,0,'*',0),(262,'agent','Agent','3','','3','','separator',1,1,1,0,0,0,'0000-00-00 00:00:00',0,4,'',23,'{\"menu_image\":\"\",\"menu_text\":1,\"fusion_item_subtext\":\"\",\"fusion_customimage\":\"\",\"fusion_customclass\":\"\",\"fusion_columns\":\"1\",\"fusion_distribution\":\"even\",\"fusion_dropdown_width\":\"\",\"fusion_column_widths\":\"\",\"fusion_children_group\":\"0\",\"fusion_children_type\":\"menuitems\",\"fusion_modules\":\"94\",\"fusion_module_positions\":\"\",\"splitmenu_item_subtext\":\"\"}',153,154,0,'*',0),(261,'mainmenu','Cart','cart','','agent/cart','index.php?option=com_travel&view=carts&layout=carts','component',-2,224,2,10203,0,0,'0000-00-00 00:00:00',0,4,'',23,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0,\"fusion_item_subtext\":\"\",\"fusion_customimage\":\"\",\"fusion_customclass\":\"\",\"fusion_columns\":\"1\",\"fusion_distribution\":\"even\",\"fusion_dropdown_width\":\"\",\"fusion_column_widths\":\"\",\"fusion_children_group\":\"0\",\"fusion_children_type\":\"menuitems\",\"fusion_modules\":\"94\",\"fusion_module_positions\":\"\",\"splitmenu_item_subtext\":\"\"}',104,105,0,'en-GB',0);
/*!40000 ALTER TABLE `bk078_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_qunipay_installed_logourl`
--

DROP TABLE IF EXISTS `bk078_qunipay_installed_logourl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_qunipay_installed_logourl` (
  `id` varchar(64) NOT NULL,
  `url` varchar(256) NOT NULL,
  `logo` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_qunipay_installed_logourl`
--

LOCK TABLES `bk078_qunipay_installed_logourl` WRITE;
/*!40000 ALTER TABLE `bk078_qunipay_installed_logourl` DISABLE KEYS */;
INSERT INTO `bk078_qunipay_installed_logourl` VALUES ('Configurable','http://www.qunit.nl','administrator/components/com_qunipay/assets/qunipay.png'),('PaymentFactory','http://www.qunit.nl	','administrator/components/com_qunipay/assets/qunipay.png'),('JRequest','http://www.qunit.nl	','administrator/components/com_qunipay/assets/qunipay.png'),('ComboBox','http://www.qunit.nl	','administrator/components/com_qunipay/assets/qunipay.png'),('RadioButtons','http://www.qunit.nl	','administrator/components/com_qunipay/assets/qunipay.png'),('Dummy','http://www.qunit.nl	','administrator/components/com_qunipay/assets/qunipay.png'),('InputText','http://www.qunit.nl','administrator/components/com_qunipay/assets/qunipay.png'),('InputEmail','http://www.qunit.nl','administrator/components/com_qunipay/assets/qunipay.png'),('InfoText','http://www.qunit.nl	','administrator/components/com_qunipay/assets/qunipay.png'),('EmailNotifier','http://www.qunit.nl	','administrator/components/com_qunipay/assets/qunipay.png'),('ccNewsLetter','http://www.chillcreations.com/joomla-extensions/ccnewsletter-joomla-newsletter-extension.html','administrator/components/com_qunipay/assets/ccnewsletter_icon.jpg'),('Custom','http://www.qunit.nl	','administrator/components/com_qunipay/assets/qunipay.png'),('SimpleCaddy','http://www.qunit.nl	','administrator/components/com_qunipay/assets/simplecaddy.png'),('VirtueMart','http://virtuemart.net/','administrator/components/com_qunipay/assets/virtuemart-96x96.png'),('InputHidden','http://www.qunit.nl	','administrator/components/com_qunipay/assets/qunipay.png'),('InputCheckBox','http://www.qunit.nl	','administrator/components/com_qunipay/assets/qunipay.png');
/*!40000 ALTER TABLE `bk078_qunipay_installed_logourl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_qunipay_installed_parameters`
--

DROP TABLE IF EXISTS `bk078_qunipay_installed_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_qunipay_installed_parameters` (
  `installedid` varchar(64) NOT NULL,
  `key` varchar(32) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`installedid`,`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_qunipay_installed_parameters`
--

LOCK TABLES `bk078_qunipay_installed_parameters` WRITE;
/*!40000 ALTER TABLE `bk078_qunipay_installed_parameters` DISABLE KEYS */;
INSERT INTO `bk078_qunipay_installed_parameters` VALUES ('Custom','validatePaymentInformationCode','// Your PHP validation code here. The result of the validation must be stored in the $result variable.\n$result = true;\n?>'),('Custom','gatherPaymentInformationCode','// Your PHP code here\n?>'),('Custom','paySuccessCode','// Your PHP code here\n?>'),('Custom','paySuccessConfirmedCode','// Your PHP code here\n?>'),('Custom','payCancelledCode','// Your PHP code here\n?>'),('Custom','payErrorCode','// Your PHP code here\n?>'),('InputCheckBox','text','Do you wish to check this box?'),('InputCheckBox','name','checkbox'),('InputCheckBox','valuechecked','1'),('InputCheckBox','valueunchecked',''),('InputText','text','Enter your name'),('InputText','name','name'),('InputText','maxlength','32'),('InputText','inputrequired','1'),('ccNewsLetter','text','Subscribe to newsletter'),('ccNewsLetter','name','name'),('ccNewsLetter','email','email'),('RadioButtons','numberofColumns','1'),('RadioButtons','imageWidth','50px'),('RadioButtons','imageHeight','50px'),('InputHidden','name','hidden'),('InputHidden','defaultValue',''),('EmailNotifier','emailField','email'),('EmailNotifier','emailAdmin','administrator@email.com'),('EmailNotifier','replyToName','Reply to name'),('EmailNotifier','replyToAddress','replyto@address.com'),('EmailNotifier','sendMailPayAdmin','1'),('EmailNotifier','subjectPayAdmin','Notification of started payment'),('EmailNotifier','textPayAdmin','<p>This is a notification e-mail to notify you of a started payment proces. The following are the payment details:</p><ul><li>Amount: %AMOUNT%</li><li>Description: %DESCRIPTION%</li><li>Id: %PREFIX% %ID%</li></ul><p>These are the payment items:</p><p>%ITEMS%</p><p>These are the payment variables:</p><p>%VARS%</p>'),('EmailNotifier','plainTextPayAdmin','This is a notification e-mail to notify you of a started payment proces. The following are the payment details:\n\n- Amount: %AMOUNT%\n- Description: %DESCRIPTION%\n- Id: %PREFIX% %ID%\n\nThese are the payment items:\n\n%ITEMS%\n\nThese are the payment variables:\n\n%VARS%\n'),('EmailNotifier','sendMailPayPayer','0'),('EmailNotifier','subjectPayPayer',''),('EmailNotifier','textPayPayer',''),('EmailNotifier','plainTextPayPayer',''),('EmailNotifier','sendMailSuccessAdmin','1'),('EmailNotifier','subjectSuccessAdmin','Notification of finished payment'),('EmailNotifier','textSuccessAdmin','<p>This is a notification e-mail to notify you of a finished payment proces. The payment is currently pending confirmation. The following are the payment details:</p><ul><li>Amount: %AMOUNT%</li><li>Description: %DESCRIPTION%</li><li>Id: %PREFIX% %ID%</li></ul><p>These are the payment items:</p><p>%ITEMS%</p><p>These are the payment variables:</p><p>%VARS%</p>'),('EmailNotifier','plainTextSuccessAdmin','This is a notification e-mail to notify you of a finished payment proces. The payment is currently pending confirmation. The following are the payment details:\n\n- Amount: %AMOUNT%\n- Description: %DESCRIPTION%\n- Id: %PREFIX% %ID%\n\nThese are the payment items:\n\n%ITEMS%\n\nThese are the payment variables:\n\n%VARS%\n'),('EmailNotifier','sendMailSuccessPayer','1'),('EmailNotifier','subjectSuccessPayer','Notification of finished payment process'),('EmailNotifier','textSuccessPayer','<p>This is a notification e-mail to notify you of a finished payment proces. The payment is currently pending confirmation. The following are the payment details:</p><ul><li>Amount: %AMOUNT%</li><li>Description: %DESCRIPTION%</li><li>Id: %PREFIX% %ID%</li></ul>'),('EmailNotifier','plainTextSuccessPayer','This is a notification e-mail to notify you of a finished payment proces. The payment is currently pending confirmation. The following are the payment details:\n\n- Amount: %AMOUNT%\n- Description: %DESCRIPTION%\n- Id: %PREFIX% %ID%'),('EmailNotifier','sendMailSuccessConfirmedAdmin','1'),('EmailNotifier','subjectSuccessConfirmedAdmin','Notification of finished and confirmed payment process'),('EmailNotifier','textSuccessConfirmedAdmin','<p>This is a notification e-mail to notify you of a finished and confirmed payment proces. The following are the payment details:</p><ul><li>Amount: %AMOUNT%</li><li>Description: %DESCRIPTION%</li><li>Id: %PREFIX% %ID%</li></ul><p>These are the payment items:</p><p>%ITEMS%</p><p>These are the payment variables:</p><p>%VARS%</p>'),('EmailNotifier','plainTextSuccessConfirmedAdmin','This is a notification e-mail to notify you of a finished and confirmed payment proces. The following are the payment details:\n\n- Amount: %AMOUNT%\n- Description: %DESCRIPTION%\n- Id: %PREFIX% %ID%\n\nThese are the payment items:\n\n%ITEMS%\n\nThese are the payment variables:\n\n%VARS%\n'),('EmailNotifier','sendMailSuccessConfirmedPayer','1'),('EmailNotifier','subjectSuccessConfirmedPayer','Notification of finished and confirmed payment process'),('EmailNotifier','textSuccessConfirmedPayer','<p>This is a notification e-mail to notify you of a finished and confirmed payment proces. The following are the payment details:</p><ul><li>Amount: %AMOUNT%</li><li>Description: %DESCRIPTION%</li><li>Id: %PREFIX% %ID%</li></ul>'),('EmailNotifier','plainTextSuccessConfirmedPayer','This is a notification e-mail to notify you of a finished and confirmed payment proces. The following are the payment details:\n\n- Amount: %AMOUNT%\n- Description: %DESCRIPTION%\n- Id: %PREFIX% %ID%'),('EmailNotifier','sendMailCancelledAdmin','1'),('EmailNotifier','subjectCancelledAdmin','Notification of cancelled payment'),('EmailNotifier','textCancelledAdmin','<p>This is a notification e-mail to notify you of a cancelled payment proces. The following are the payment details:</p><ul><li>Amount: %AMOUNT%</li><li>Description: %DESCRIPTION%</li><li>Id: %PREFIX% %ID%</li></ul><p>These are the payment items:</p><p>%ITEMS%</p><p>These are the payment variables:</p><p>%VARS%</p>'),('EmailNotifier','plainTextCancelledAdmin','This is a notification e-mail to notify you of a cancelled payment proces. The following are the payment details:\n\n- Amount: %AMOUNT%\n- Description: %DESCRIPTION%\n- Id: %PREFIX% %ID%\n\nThese are the payment items:\n\n%ITEMS%\n\nThese are the payment variables:\n\n%VARS%\n'),('EmailNotifier','sendMailCancelledPayer','0'),('EmailNotifier','subjectCancelledPayer',''),('EmailNotifier','textCancelledPayer',''),('EmailNotifier','plainTextCancelledPayer',''),('EmailNotifier','sendMailErrorAdmin','1'),('EmailNotifier','subjectErrorAdmin','Notification of terminated payment'),('EmailNotifier','textErrorAdmin','<p>This is a notification e-mail to notify you that a payment was terminated. The following are the payment details:</p><ul><li>Amount: %AMOUNT%</li><li>Description: %DESCRIPTION%</li><li>Id: %PREFIX% %ID%</li></ul><p>These are the payment items:</p><p>%ITEMS%</p><p>These are the payment variables:</p><p>%VARS%</p>'),('EmailNotifier','plainTextErrorAdmin','This is a notification e-mail to notify you that a payment was terminated. The following are the payment details:\n\n- Amount: %AMOUNT%\n- Description: %DESCRIPTION%\n- Id: %PREFIX% %ID%\n\nThese are the payment items:\n\n%ITEMS%\n\nThese are the payment variables:\n\n%VARS%\n'),('EmailNotifier','sendMailErrorPayer','0'),('EmailNotifier','subjectErrorPayer',''),('EmailNotifier','textErrorPayer',''),('EmailNotifier','plainTextErrorPayer',''),('InputEmail','text','Enter your e-mail address:'),('InputEmail','name','email'),('InputEmail','emailrequired','1'),('InfoText','textGatherPaymentInfo','Select a payment method:'),('InfoText','textPaySuccessConfirmed','The payment was processed and confirmed succesfully'),('InfoText','textPaySuccess','The payment was processed succesfully'),('InfoText','textPayCancelled','The payment was cancelled on user request'),('InfoText','textPayError','The payment failed due to an external cause'),('Configurable','infoText','Please choose the applicable amount:'),('Configurable','currency','EUR'),('Configurable','description','Preconfigured payment'),('Configurable','amountId',''),('Configurable','fixed','fixed'),('Configurable','fixedAmount','10'),('Configurable','selectableAmounts','10|20|50|100'),('Configurable','allowFreeEntry','0'),('Configurable','defaultSelectableAmount','10'),('JRequest','idField','id'),('JRequest','currencyField','currency'),('JRequest','amountField','amount'),('JRequest','descriptionField','description'),('JRequest','varsField',''),('JRequest','itemNameField','itemname'),('JRequest','itemAmountField','itemamount'),('JRequest','itemCountField','itemcount'),('VirtueMart','emailField','email'),('VirtueMart','titleField','title'),('VirtueMart','firstNameField','firstName'),('VirtueMart','lastNameField','lastName'),('VirtueMart','addressField','address'),('VirtueMart','address2Field','address2'),('VirtueMart','phoneNumberField','phoneNumber'),('VirtueMart','zipCodeField','zipCode'),('VirtueMart','cityField','city'),('VirtueMart','stateField','state'),('VirtueMart','countryField','country');
/*!40000 ALTER TABLE `bk078_qunipay_installed_parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_comprofiler_sessions`
--

DROP TABLE IF EXISTS `bk078_comprofiler_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_comprofiler_sessions` (
  `username` varchar(50) NOT NULL DEFAULT '',
  `userid` int(11) unsigned NOT NULL DEFAULT '0',
  `ui` tinyint(4) NOT NULL DEFAULT '0',
  `incoming_ip` varchar(39) NOT NULL DEFAULT '',
  `client_ip` varchar(39) NOT NULL DEFAULT '',
  `session_id` varchar(33) NOT NULL DEFAULT '',
  `session_data` mediumtext NOT NULL,
  `expiry_time` int(14) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`session_id`),
  KEY `expiry_time` (`expiry_time`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_comprofiler_sessions`
--

LOCK TABLES `bk078_comprofiler_sessions` WRITE;
/*!40000 ALTER TABLE `bk078_comprofiler_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_comprofiler_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_qunilicense_resources`
--

DROP TABLE IF EXISTS `bk078_qunilicense_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_qunilicense_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(256) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `active` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_qunilicense_resources`
--

LOCK TABLES `bk078_qunilicense_resources` WRITE;
/*!40000 ALTER TABLE `bk078_qunilicense_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_qunilicense_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_viewlevels`
--

DROP TABLE IF EXISTS `bk078_viewlevels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_viewlevels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `title` varchar(100) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_assetgroup_title_lookup` (`title`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_viewlevels`
--

LOCK TABLES `bk078_viewlevels` WRITE;
/*!40000 ALTER TABLE `bk078_viewlevels` DISABLE KEYS */;
INSERT INTO `bk078_viewlevels` VALUES (1,'Public',0,'[1]'),(2,'Registered',1,'[6,2,8]'),(3,'Special',2,'[6,3,8]'),(4,'Agent',0,'[6,2,10,8]');
/*!40000 ALTER TABLE `bk078_viewlevels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_comprofiler_tabs`
--

DROP TABLE IF EXISTS `bk078_comprofiler_tabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_comprofiler_tabs` (
  `tabid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL DEFAULT '',
  `description` text,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `ordering_register` int(11) NOT NULL DEFAULT '10',
  `width` varchar(10) NOT NULL DEFAULT '.5',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `pluginclass` varchar(255) DEFAULT NULL,
  `pluginid` int(11) DEFAULT NULL,
  `fields` tinyint(1) NOT NULL DEFAULT '1',
  `params` mediumtext,
  `sys` tinyint(4) NOT NULL DEFAULT '0',
  `displaytype` varchar(255) NOT NULL DEFAULT '',
  `position` varchar(255) NOT NULL DEFAULT '',
  `viewaccesslevel` int(10) unsigned NOT NULL DEFAULT '0',
  `useraccessgroupid` int(9) NOT NULL DEFAULT '-2',
  PRIMARY KEY (`tabid`),
  KEY `enabled_position_ordering` (`enabled`,`position`,`ordering`),
  KEY `orderreg_enabled_pos_order` (`enabled`,`ordering_register`,`position`,`ordering`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_comprofiler_tabs`
--

LOCK TABLES `bk078_comprofiler_tabs` WRITE;
/*!40000 ALTER TABLE `bk078_comprofiler_tabs` DISABLE KEYS */;
INSERT INTO `bk078_comprofiler_tabs` VALUES (11,'_UE_CONTACT_INFO_HEADER','',-4,10,'1',1,'getContactTab',1,1,NULL,2,'tab','cb_tabmain',1,-2),(12,'_UE_AUTHORTAB','',-3,10,'1',0,'getAuthorTab',3,0,NULL,1,'tab','cb_tabmain',1,-2),(13,'_UE_FORUMTAB','',-2,10,'1',0,'getForumTab',4,1,NULL,1,'tab','cb_tabmain',1,-2),(14,'_UE_BLOGTAB','',-1,10,'1',0,'getBlogTab',5,0,NULL,1,'tab','cb_tabmain',1,-2),(15,'_UE_CONNECTION','',99,10,'1',0,'getConnectionTab',2,0,NULL,1,'tab','cb_tabmain',1,-2),(16,'_UE_NEWSLETTER_HEADER','_UE_NEWSLETTER_INTRODCUTION',99,10,'1',0,'getNewslettersTab',6,0,NULL,1,'tab','cb_tabmain',1,-2),(17,'_UE_MENU','',-10,10,'1',1,'getMenuTab',14,0,NULL,1,'html','cb_head',1,-2),(18,'_UE_CONNECTIONPATHS','',-9,10,'1',0,'getConnectionPathsTab',2,0,NULL,1,'html','cb_head',1,-2),(19,'_UE_PROFILE_PAGE_TITLE','',-8,10,'1',0,'getPageTitleTab',1,0,NULL,1,'html','cb_head',1,-2),(20,'_UE_PORTRAIT','',-7,10,'1',0,'getPortraitTab',1,1,NULL,1,'html','cb_middle',1,-2),(21,'_UE_USER_STATUS','',-6,10,'.5',0,'getStatusTab',14,1,NULL,1,'html','cb_right',1,-2),(22,'_UE_PMSTAB','',-5,10,'.5',0,'getmypmsproTab',15,0,NULL,1,'html','cb_right',1,-2);
/*!40000 ALTER TABLE `bk078_comprofiler_tabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_contact_details`
--

DROP TABLE IF EXISTS `bk078_contact_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `con_position` varchar(255) DEFAULT NULL,
  `address` text,
  `suburb` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `misc` mediumtext,
  `image` varchar(255) DEFAULT NULL,
  `imagepos` varchar(20) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `default_con` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `webpage` varchar(255) NOT NULL DEFAULT '',
  `sortname1` varchar(255) NOT NULL,
  `sortname2` varchar(255) NOT NULL,
  `sortname3` varchar(255) NOT NULL,
  `language` char(7) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_contact_details`
--

LOCK TABLES `bk078_contact_details` WRITE;
/*!40000 ALTER TABLE `bk078_contact_details` DISABLE KEYS */;
INSERT INTO `bk078_contact_details` VALUES (1,'Contacts','contacts','','','','','','','','','<p>8901 Marmora Road,<br /> \r\nGlasgow, D04 89GR.<br /> \r\nFreephone: +1 800 559 6580<br /> \r\nTelephone: +1 959 603 6035<br /> \r\nFAX: +1 504 889 9898<br /> \r\nE-mail: <a href=\"mailto:mail@demolink.org\">mail@demolink.org</a>\r\n</p>\r\n\r\n<p>9863 - 9867 Mill Road, <br /> \r\nCambridge, MG09 99HT<br /> \r\nFreephone: +1 800 559 6580<br /> \r\nTelephone: +1 959 603 6035<br /> \r\nFAX: +1 504 889 9898<br /> \r\nE-mail: <a href=\"mailto:mail@demolink.org\">mail@demolink.org</a>\r\n</p>','',NULL,'mailto@demolink.org',0,1,0,'0000-00-00 00:00:00',1,'{\"show_contact_category\":\"\",\"show_contact_list\":\"\",\"presentation_style\":\"\",\"show_name\":\"\",\"show_position\":\"\",\"show_email\":\"\",\"show_street_address\":\"\",\"show_suburb\":\"\",\"show_state\":\"\",\"show_postcode\":\"\",\"show_country\":\"\",\"show_telephone\":\"\",\"show_mobile\":\"\",\"show_fax\":\"\",\"show_webpage\":\"\",\"show_misc\":\"\",\"show_image\":\"\",\"allow_vcard\":\"\",\"show_articles\":\"\",\"show_profile\":\"\",\"show_links\":\"\",\"linka_name\":\"\",\"linka\":null,\"linkb_name\":\"\",\"linkb\":null,\"linkc_name\":\"\",\"linkc\":null,\"linkd_name\":\"\",\"linkd\":null,\"linke_name\":\"\",\"linke\":\"\",\"contact_layout\":\"\",\"show_email_form\":\"\",\"show_email_copy\":\"\",\"banned_email\":\"\",\"banned_subject\":\"\",\"banned_text\":\"\",\"validate_session\":\"\",\"custom_reply\":\"\",\"redirect\":\"\"}',0,4,1,'','','','','','*','2011-12-17 11:44:54',367,'','2012-08-28 06:51:56',441,'','','{\"robots\":\"\",\"rights\":\"\"}',0,'','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,'system','system',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'system@demolink.org',0,0,0,'0000-00-00 00:00:00',0,'',43,34,1,'','','','','','','2012-05-31 11:38:50',367,'','0000-00-00 00:00:00',0,'','','',0,'','0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,'Edward Khor','edward-khor',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'mingzai1989@hotmail.com',0,0,0,'0000-00-00 00:00:00',0,'',368,34,1,'','','','','','','2012-10-14 16:26:47',0,'','0000-00-00 00:00:00',0,'','','',0,'','0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `bk078_contact_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_osmembership_plans`
--

DROP TABLE IF EXISTS `bk078_osmembership_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_osmembership_plans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `subscription_length` int(11) NOT NULL DEFAULT '0',
  `thumb` varchar(255) DEFAULT NULL,
  `short_description` tinytext,
  `description` text,
  `price` decimal(10,2) DEFAULT NULL,
  `expired_date` datetime DEFAULT NULL,
  `enable_cancel` tinyint(3) unsigned DEFAULT NULL,
  `cancel_before_number_days` int(11) DEFAULT NULL,
  `params` text,
  `ordering` int(11) DEFAULT '0',
  `published` tinyint(3) unsigned DEFAULT NULL,
  `send_first_reminder` tinyint(4) NOT NULL DEFAULT '0',
  `send_second_reminder` tinyint(4) NOT NULL DEFAULT '0',
  `recurring_subscription` tinyint(4) NOT NULL DEFAULT '0',
  `enable_renewal` tinyint(4) NOT NULL DEFAULT '1',
  `trial_amount` decimal(10,2) DEFAULT '0.00',
  `number_payments` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_osmembership_plans`
--

LOCK TABLES `bk078_osmembership_plans` WRITE;
/*!40000 ALTER TABLE `bk078_osmembership_plans` DISABLE KEYS */;
INSERT INTO `bk078_osmembership_plans` VALUES (1,'90 Days Standard Member',90,'','','',798.00,'0000-00-00 00:00:00',NULL,NULL,'{\"joomla_group_ids\":\"9\",\"joomla_expried_group_ids\":\"9\"}',1,1,7,1,0,1,0.00,0,1);
/*!40000 ALTER TABLE `bk078_osmembership_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_finder_tokens`
--

DROP TABLE IF EXISTS `bk078_finder_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_finder_tokens` (
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '1',
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  KEY `idx_word` (`term`),
  KEY `idx_context` (`context`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_finder_tokens`
--

LOCK TABLES `bk078_finder_tokens` WRITE;
/*!40000 ALTER TABLE `bk078_finder_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_finder_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_finder_links_terms8`
--

DROP TABLE IF EXISTS `bk078_finder_links_terms8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_finder_links_terms8` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_finder_links_terms8`
--

LOCK TABLES `bk078_finder_links_terms8` WRITE;
/*!40000 ALTER TABLE `bk078_finder_links_terms8` DISABLE KEYS */;
INSERT INTO `bk078_finder_links_terms8` VALUES (11,4,0.6666),(12,4,0.6666),(12,1585,1.23321),(12,1586,5.30321),(64,4,0.6666),(64,1634,1.38658),(64,1635,3.64),(64,4154,0.14),(64,4155,0.88669),(64,4156,1.12),(64,4157,1.09669),(64,4161,0.28),(64,4162,1.68),(64,4163,1.86662),(64,4164,0.84),(64,4165,1.96),(64,4166,2.14662),(65,4,0.6666),(65,310,0.01169),(65,341,0.32004),(65,348,0.15996),(65,349,1.47996),(65,1493,0.03507),(65,4237,0.84),(65,4238,1.16669),(65,4239,0.60669),(65,4240,1.16669),(65,4241,1.23669),(65,4242,0.42),(65,4243,1.07331),(65,4244,1.19),(65,4245,0.81669),(65,4246,0.98),(65,4247,0.88669),(65,4248,1.00331),(65,4249,0.86331),(65,4250,0.98),(65,4266,0.18669),(65,4267,0.88669),(65,4268,1.07331),(65,4269,0.18669),(65,4270,0.88669),(65,4271,0.98),(65,4272,0.37331),(65,4273,0.95669),(65,4274,1.12),(66,4,0.6666),(66,341,0.32004),(66,348,0.15996),(66,349,1.47996),(66,4320,0.87996),(67,4,0.6666),(67,310,1.02641),(67,341,0.32004),(67,348,0.15996),(67,349,1.47996),(67,1475,0.28),(67,1480,0.23331),(67,3274,0.18669),(67,4237,1.68),(67,4320,0.87996),(67,4513,0.65338),(67,4514,1.02669),(67,4515,1.12),(67,4516,0.98),(67,4517,1.16669),(67,4518,0.42),(67,4519,1.14331),(67,4520,1.30669),(67,4521,0.51331),(67,4522,1.16669),(67,4523,1.35331),(67,4524,0.56),(67,4525,1.02669),(67,4526,1.26),(67,4527,0.95669),(67,4528,1.12),(67,4529,0.23331),(67,4530,1.00331),(67,4531,1.14331),(67,4532,0.32669),(67,4533,1.05),(67,4534,1.23669),(67,4555,0.23331),(67,4556,1.14331),(67,4557,1.23669),(67,4558,0.95669),(67,4559,1.02669),(67,4560,1.00331),(67,4561,1.14331),(67,4562,0.28),(67,4563,0.93331),(67,4564,1.05),(67,4565,0.37338),(67,4566,0.86331),(67,4567,1.12),(67,4568,1.02669),(67,4569,1.12),(67,4570,0.56),(67,4571,1.09669),(67,4572,1.21331),(67,4573,0.93331),(67,4574,1.12),(67,4575,0.88669),(67,4576,0.98),(67,4577,0.56007),(67,4578,0.98),(67,4579,1.07331),(67,4580,1.00331),(67,4581,1.23669),(67,4582,1.02669),(67,4583,1.14331),(67,4584,0.32669),(67,4585,1.14331),(67,4586,1.21331),(67,4627,0.93338),(67,4628,1.07331),(67,4629,1.23669),(67,4630,1.05),(67,4631,1.26),(67,4632,0.51331),(67,4633,1.07331),(67,4634,1.30669),(67,4635,0.86331),(67,4636,1.00331),(67,4637,0.88669),(67,4638,1.00331),(67,4639,0.93331),(67,4640,1.05),(67,4641,0.93331),(67,4642,1.05),(67,4643,0.91),(67,4644,1.05),(67,4645,0.91),(67,4646,0.98),(67,4647,0.91),(67,4648,1.05),(67,4649,1.82),(67,4650,1.00331),(67,4651,1.00331),(67,4652,0.95669),(67,4653,1.05),(67,4654,0.42),(67,4655,1.19),(67,4656,1.30669),(67,4657,0.28),(67,4658,0.91),(67,4659,1.19),(67,4660,0.32669),(67,4661,1.00331),(67,4662,1.16669),(67,4663,0.28),(67,4664,0.95669),(67,4665,1.07331),(67,4670,0.32669),(67,4671,0.95669),(67,4672,1.09669),(67,4673,0.42),(67,4674,1.05),(67,4675,1.28331),(67,4676,0.23331),(67,4677,0.88669),(67,4678,0.98),(67,4679,0.32669),(67,4680,0.95669),(67,4681,1.05),(67,4682,0.42),(67,4683,1.07331),(67,4684,1.16669),(67,4747,0.18669),(67,4748,0.86331),(67,4749,0.91),(67,4750,0.28),(67,4751,1.00331),(67,4752,1.16669),(67,4753,0.42),(67,4754,1.09669),(67,4755,1.21331),(67,4756,0.56),(67,4757,1.00331),(67,4758,1.26),(67,4759,0.98),(67,4760,1.05),(67,4761,0.23331),(67,4762,0.95669),(67,4763,1.16669),(67,4764,0.28),(67,4765,1.09669),(67,4766,1.26),(67,4767,0.86331),(67,4768,1.02669),(67,4769,1.02662),(67,4770,2.14662),(67,4771,2.24),(67,4772,0.74662),(67,4773,1.91338),(67,4774,2.24),(67,4775,0.42),(67,4776,1.00331),(67,4777,1.14331),(68,4,0.6666),(68,341,0.32004),(68,348,0.15996),(68,349,1.47996),(68,4320,0.87996),(69,4,0.6666),(69,341,0.32004),(69,348,0.15996),(69,349,1.47996),(69,4320,0.87996),(69,4326,1.23321);
/*!40000 ALTER TABLE `bk078_finder_links_terms8` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_qunilicense_resource_identifiers`
--

DROP TABLE IF EXISTS `bk078_qunilicense_resource_identifiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_qunilicense_resource_identifiers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resourceId` int(11) NOT NULL,
  `identifier` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_qunilicense_resource_identifiers`
--

LOCK TABLES `bk078_qunilicense_resource_identifiers` WRITE;
/*!40000 ALTER TABLE `bk078_qunilicense_resource_identifiers` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_qunilicense_resource_identifiers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_qunipay_hook_parameters`
--

DROP TABLE IF EXISTS `bk078_qunipay_hook_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_qunipay_hook_parameters` (
  `hookid` int(11) NOT NULL,
  `key` varchar(32) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`hookid`,`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_qunipay_hook_parameters`
--

LOCK TABLES `bk078_qunipay_hook_parameters` WRITE;
/*!40000 ALTER TABLE `bk078_qunipay_hook_parameters` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_qunipay_hook_parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_comprofiler_views`
--

DROP TABLE IF EXISTS `bk078_comprofiler_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_comprofiler_views` (
  `viewer_id` int(11) NOT NULL DEFAULT '0',
  `profile_id` int(11) NOT NULL DEFAULT '0',
  `lastip` varchar(50) NOT NULL DEFAULT '',
  `lastview` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `viewscount` int(11) NOT NULL DEFAULT '0',
  `vote` tinyint(3) DEFAULT NULL,
  `lastvote` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`viewer_id`,`profile_id`,`lastip`),
  KEY `lastview` (`lastview`),
  KEY `profile_id_lastview` (`profile_id`,`lastview`,`viewer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_comprofiler_views`
--

LOCK TABLES `bk078_comprofiler_views` WRITE;
/*!40000 ALTER TABLE `bk078_comprofiler_views` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_comprofiler_views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_qunipay_payment_vars`
--

DROP TABLE IF EXISTS `bk078_qunipay_payment_vars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_qunipay_payment_vars` (
  `id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  UNIQUE KEY `id` (`id`,`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_qunipay_payment_vars`
--

LOCK TABLES `bk078_qunipay_payment_vars` WRITE;
/*!40000 ALTER TABLE `bk078_qunipay_payment_vars` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_qunipay_payment_vars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_k2_categories`
--

DROP TABLE IF EXISTS `bk078_k2_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_k2_categories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `parent` int(11) DEFAULT '0',
  `extraFieldsGroup` int(11) NOT NULL,
  `published` smallint(6) NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `image` varchar(255) NOT NULL,
  `params` text NOT NULL,
  `trash` smallint(6) NOT NULL DEFAULT '0',
  `plugins` text NOT NULL,
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category` (`published`,`access`,`trash`),
  KEY `parent` (`parent`),
  KEY `ordering` (`ordering`),
  KEY `published` (`published`),
  KEY `access` (`access`),
  KEY `trash` (`trash`),
  KEY `language` (`language`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_k2_categories`
--

LOCK TABLES `bk078_k2_categories` WRITE;
/*!40000 ALTER TABLE `bk078_k2_categories` DISABLE KEYS */;
INSERT INTO `bk078_k2_categories` VALUES (3,'About','about','',0,0,1,1,2,'','{\"inheritFrom\":\"0\",\"theme\":\"\",\"num_leading_items\":\"2\",\"num_leading_columns\":\"1\",\"leadingImgSize\":\"Large\",\"num_primary_items\":\"4\",\"num_primary_columns\":\"2\",\"primaryImgSize\":\"Medium\",\"num_secondary_items\":\"4\",\"num_secondary_columns\":\"1\",\"secondaryImgSize\":\"Small\",\"num_links\":\"4\",\"num_links_columns\":\"1\",\"linksImgSize\":\"XSmall\",\"catCatalogMode\":\"0\",\"catFeaturedItems\":\"1\",\"catOrdering\":\"\",\"catPagination\":\"0\",\"catPaginationResults\":\"0\",\"catTitle\":\"0\",\"catTitleItemCounter\":\"0\",\"catDescription\":\"0\",\"catImage\":\"0\",\"catFeedLink\":\"0\",\"catFeedIcon\":\"0\",\"subCategories\":\"0\",\"subCatColumns\":\"2\",\"subCatOrdering\":\"\",\"subCatTitle\":\"0\",\"subCatTitleItemCounter\":\"0\",\"subCatDescription\":\"0\",\"subCatImage\":\"0\",\"itemImageXS\":\"\",\"itemImageS\":\"\",\"itemImageM\":\"\",\"itemImageL\":\"\",\"itemImageXL\":\"\",\"catItemTitle\":\"1\",\"catItemTitleLinked\":\"0\",\"catItemFeaturedNotice\":\"0\",\"catItemAuthor\":\"0\",\"catItemDateCreated\":\"0\",\"catItemRating\":\"0\",\"catItemImage\":\"1\",\"catItemIntroText\":\"1\",\"catItemIntroTextWordLimit\":\"\",\"catItemExtraFields\":\"0\",\"catItemHits\":\"0\",\"catItemCategory\":\"0\",\"catItemTags\":\"0\",\"catItemAttachments\":\"0\",\"catItemAttachmentsCounter\":\"0\",\"catItemVideo\":\"0\",\"catItemVideoWidth\":\"\",\"catItemVideoHeight\":\"\",\"catItemAudioWidth\":\"\",\"catItemAudioHeight\":\"\",\"catItemVideoAutoPlay\":\"0\",\"catItemImageGallery\":\"0\",\"catItemDateModified\":\"0\",\"catItemReadMore\":\"1\",\"catItemCommentsAnchor\":\"0\",\"catItemK2Plugins\":\"1\",\"itemDateCreated\":\"0\",\"itemTitle\":\"1\",\"itemFeaturedNotice\":\"0\",\"itemAuthor\":\"0\",\"itemFontResizer\":\"0\",\"itemPrintButton\":\"0\",\"itemEmailButton\":\"0\",\"itemSocialButton\":\"0\",\"itemVideoAnchor\":\"0\",\"itemImageGalleryAnchor\":\"0\",\"itemCommentsAnchor\":\"0\",\"itemRating\":\"0\",\"itemImage\":\"1\",\"itemImgSize\":\"Medium\",\"itemImageMainCaption\":\"0\",\"itemImageMainCredits\":\"0\",\"itemIntroText\":\"1\",\"itemFullText\":\"1\",\"itemExtraFields\":\"0\",\"itemDateModified\":\"0\",\"itemHits\":\"0\",\"itemCategory\":\"0\",\"itemTags\":\"0\",\"itemAttachments\":\"0\",\"itemAttachmentsCounter\":\"0\",\"itemVideo\":\"0\",\"itemVideoWidth\":\"\",\"itemVideoHeight\":\"\",\"itemAudioWidth\":\"\",\"itemAudioHeight\":\"\",\"itemVideoAutoPlay\":\"0\",\"itemVideoCaption\":\"0\",\"itemVideoCredits\":\"0\",\"itemImageGallery\":\"0\",\"itemNavigation\":\"0\",\"itemComments\":\"0\",\"itemTwitterButton\":\"0\",\"itemFacebookButton\":\"0\",\"itemGooglePlusOneButton\":\"0\",\"itemAuthorBlock\":\"0\",\"itemAuthorImage\":\"0\",\"itemAuthorDescription\":\"0\",\"itemAuthorURL\":\"0\",\"itemAuthorEmail\":\"0\",\"itemAuthorLatest\":\"0\",\"itemAuthorLatestLimit\":\"5\",\"itemRelated\":\"0\",\"itemRelatedLimit\":\"5\",\"itemRelatedTitle\":\"0\",\"itemRelatedCategory\":\"0\",\"itemRelatedImageSize\":\"0\",\"itemRelatedIntrotext\":\"0\",\"itemRelatedFulltext\":\"0\",\"itemRelatedAuthor\":\"0\",\"itemRelatedMedia\":\"0\",\"itemRelatedImageGallery\":\"0\",\"itemK2Plugins\":\"1\",\"catMetaDesc\":\"\",\"catMetaKey\":\"\",\"catMetaRobots\":\"\",\"catMetaAuthor\":\"\"}',0,'','*'),(6,'Blank','blank','',0,0,1,1,1,'','{\"inheritFrom\":\"0\",\"theme\":\"\",\"num_leading_items\":\"2\",\"num_leading_columns\":\"1\",\"leadingImgSize\":\"Large\",\"num_primary_items\":\"4\",\"num_primary_columns\":\"2\",\"primaryImgSize\":\"Medium\",\"num_secondary_items\":\"4\",\"num_secondary_columns\":\"1\",\"secondaryImgSize\":\"Small\",\"num_links\":\"4\",\"num_links_columns\":\"1\",\"linksImgSize\":\"XSmall\",\"catCatalogMode\":\"0\",\"catFeaturedItems\":\"1\",\"catOrdering\":\"\",\"catPagination\":\"2\",\"catPaginationResults\":\"1\",\"catTitle\":\"1\",\"catTitleItemCounter\":\"1\",\"catDescription\":\"1\",\"catImage\":\"1\",\"catFeedLink\":\"1\",\"catFeedIcon\":\"1\",\"subCategories\":\"1\",\"subCatColumns\":\"2\",\"subCatOrdering\":\"\",\"subCatTitle\":\"1\",\"subCatTitleItemCounter\":\"1\",\"subCatDescription\":\"1\",\"subCatImage\":\"1\",\"itemImageXS\":\"\",\"itemImageS\":\"\",\"itemImageM\":\"\",\"itemImageL\":\"\",\"itemImageXL\":\"\",\"catItemTitle\":\"1\",\"catItemTitleLinked\":\"1\",\"catItemFeaturedNotice\":\"0\",\"catItemAuthor\":\"1\",\"catItemDateCreated\":\"1\",\"catItemRating\":\"0\",\"catItemImage\":\"1\",\"catItemIntroText\":\"1\",\"catItemIntroTextWordLimit\":\"\",\"catItemExtraFields\":\"0\",\"catItemHits\":\"0\",\"catItemCategory\":\"1\",\"catItemTags\":\"1\",\"catItemAttachments\":\"0\",\"catItemAttachmentsCounter\":\"0\",\"catItemVideo\":\"0\",\"catItemVideoWidth\":\"\",\"catItemVideoHeight\":\"\",\"catItemAudioWidth\":\"\",\"catItemAudioHeight\":\"\",\"catItemVideoAutoPlay\":\"0\",\"catItemImageGallery\":\"0\",\"catItemDateModified\":\"0\",\"catItemReadMore\":\"1\",\"catItemCommentsAnchor\":\"1\",\"catItemK2Plugins\":\"1\",\"itemDateCreated\":\"1\",\"itemTitle\":\"1\",\"itemFeaturedNotice\":\"1\",\"itemAuthor\":\"1\",\"itemFontResizer\":\"1\",\"itemPrintButton\":\"1\",\"itemEmailButton\":\"1\",\"itemSocialButton\":\"1\",\"itemVideoAnchor\":\"1\",\"itemImageGalleryAnchor\":\"1\",\"itemCommentsAnchor\":\"1\",\"itemRating\":\"1\",\"itemImage\":\"1\",\"itemImgSize\":\"Large\",\"itemImageMainCaption\":\"1\",\"itemImageMainCredits\":\"1\",\"itemIntroText\":\"1\",\"itemFullText\":\"1\",\"itemExtraFields\":\"1\",\"itemDateModified\":\"1\",\"itemHits\":\"1\",\"itemCategory\":\"1\",\"itemTags\":\"1\",\"itemAttachments\":\"1\",\"itemAttachmentsCounter\":\"1\",\"itemVideo\":\"1\",\"itemVideoWidth\":\"\",\"itemVideoHeight\":\"\",\"itemAudioWidth\":\"\",\"itemAudioHeight\":\"\",\"itemVideoAutoPlay\":\"0\",\"itemVideoCaption\":\"1\",\"itemVideoCredits\":\"1\",\"itemImageGallery\":\"1\",\"itemNavigation\":\"1\",\"itemComments\":\"1\",\"itemTwitterButton\":\"1\",\"itemFacebookButton\":\"1\",\"itemGooglePlusOneButton\":\"1\",\"itemAuthorBlock\":\"1\",\"itemAuthorImage\":\"1\",\"itemAuthorDescription\":\"1\",\"itemAuthorURL\":\"1\",\"itemAuthorEmail\":\"0\",\"itemAuthorLatest\":\"1\",\"itemAuthorLatestLimit\":\"5\",\"itemRelated\":\"1\",\"itemRelatedLimit\":\"5\",\"itemRelatedTitle\":\"1\",\"itemRelatedCategory\":\"0\",\"itemRelatedImageSize\":\"0\",\"itemRelatedIntrotext\":\"0\",\"itemRelatedFulltext\":\"0\",\"itemRelatedAuthor\":\"0\",\"itemRelatedMedia\":\"0\",\"itemRelatedImageGallery\":\"0\",\"itemK2Plugins\":\"1\",\"catMetaDesc\":\"\",\"catMetaKey\":\"\",\"catMetaRobots\":\"\",\"catMetaAuthor\":\"\"}',0,'','*'),(31,'Destination','destination','',0,1,1,1,3,'','{\"inheritFrom\":\"0\",\"theme\":\"blog\",\"num_leading_items\":\"0\",\"num_leading_columns\":\"2\",\"leadingImgSize\":\"Medium\",\"num_primary_items\":\"4\",\"num_primary_columns\":\"2\",\"primaryImgSize\":\"Medium\",\"num_secondary_items\":\"4\",\"num_secondary_columns\":\"1\",\"secondaryImgSize\":\"Medium\",\"num_links\":\"4\",\"num_links_columns\":\"1\",\"linksImgSize\":\"Medium\",\"catCatalogMode\":\"0\",\"catFeaturedItems\":\"1\",\"catOrdering\":\"\",\"catPagination\":\"2\",\"catPaginationResults\":\"0\",\"catTitle\":\"0\",\"catTitleItemCounter\":\"0\",\"catDescription\":\"0\",\"catImage\":\"0\",\"catFeedLink\":\"0\",\"catFeedIcon\":\"0\",\"subCategories\":\"0\",\"subCatColumns\":\"2\",\"subCatOrdering\":\"\",\"subCatTitle\":\"0\",\"subCatTitleItemCounter\":\"0\",\"subCatDescription\":\"0\",\"subCatImage\":\"0\",\"itemImageXS\":\"\",\"itemImageS\":\"\",\"itemImageM\":\"\",\"itemImageL\":\"\",\"itemImageXL\":\"\",\"catItemTitle\":\"1\",\"catItemTitleLinked\":\"1\",\"catItemFeaturedNotice\":\"0\",\"catItemAuthor\":\"0\",\"catItemDateCreated\":\"0\",\"catItemRating\":\"0\",\"catItemImage\":\"1\",\"catItemIntroText\":\"1\",\"catItemIntroTextWordLimit\":\"7\",\"catItemExtraFields\":\"0\",\"catItemHits\":\"0\",\"catItemCategory\":\"0\",\"catItemTags\":\"0\",\"catItemAttachments\":\"0\",\"catItemAttachmentsCounter\":\"0\",\"catItemVideo\":\"0\",\"catItemVideoWidth\":\"\",\"catItemVideoHeight\":\"\",\"catItemAudioWidth\":\"\",\"catItemAudioHeight\":\"\",\"catItemVideoAutoPlay\":\"0\",\"catItemImageGallery\":\"0\",\"catItemDateModified\":\"0\",\"catItemReadMore\":\"0\",\"catItemCommentsAnchor\":\"0\",\"catItemK2Plugins\":\"1\",\"itemDateCreated\":\"0\",\"itemTitle\":\"1\",\"itemFeaturedNotice\":\"0\",\"itemAuthor\":\"0\",\"itemFontResizer\":\"0\",\"itemPrintButton\":\"0\",\"itemEmailButton\":\"0\",\"itemSocialButton\":\"0\",\"itemVideoAnchor\":\"0\",\"itemImageGalleryAnchor\":\"0\",\"itemCommentsAnchor\":\"0\",\"itemRating\":\"0\",\"itemImage\":\"1\",\"itemImgSize\":\"Large\",\"itemImageMainCaption\":\"1\",\"itemImageMainCredits\":\"1\",\"itemIntroText\":\"1\",\"itemFullText\":\"1\",\"itemExtraFields\":\"0\",\"itemDateModified\":\"0\",\"itemHits\":\"0\",\"itemCategory\":\"0\",\"itemTags\":\"0\",\"itemAttachments\":\"0\",\"itemAttachmentsCounter\":\"0\",\"itemVideo\":\"0\",\"itemVideoWidth\":\"\",\"itemVideoHeight\":\"\",\"itemAudioWidth\":\"\",\"itemAudioHeight\":\"\",\"itemVideoAutoPlay\":\"0\",\"itemVideoCaption\":\"0\",\"itemVideoCredits\":\"0\",\"itemImageGallery\":\"0\",\"itemNavigation\":\"0\",\"itemComments\":\"0\",\"itemTwitterButton\":\"1\",\"itemFacebookButton\":\"1\",\"itemGooglePlusOneButton\":\"1\",\"itemAuthorBlock\":\"0\",\"itemAuthorImage\":\"0\",\"itemAuthorDescription\":\"0\",\"itemAuthorURL\":\"0\",\"itemAuthorEmail\":\"0\",\"itemAuthorLatest\":\"0\",\"itemAuthorLatestLimit\":\"5\",\"itemRelated\":\"0\",\"itemRelatedLimit\":\"5\",\"itemRelatedTitle\":\"0\",\"itemRelatedCategory\":\"0\",\"itemRelatedImageSize\":\"0\",\"itemRelatedIntrotext\":\"0\",\"itemRelatedFulltext\":\"0\",\"itemRelatedAuthor\":\"0\",\"itemRelatedMedia\":\"0\",\"itemRelatedImageGallery\":\"0\",\"itemK2Plugins\":\"1\",\"catMetaDesc\":\"\",\"catMetaKey\":\"\",\"catMetaRobots\":\"\",\"catMetaAuthor\":\"\"}',0,'','en-GB');
/*!40000 ALTER TABLE `bk078_k2_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_session`
--

DROP TABLE IF EXISTS `bk078_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_session` (
  `session_id` varchar(200) NOT NULL DEFAULT '',
  `client_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `guest` tinyint(4) unsigned DEFAULT '1',
  `time` varchar(14) DEFAULT '',
  `data` mediumtext,
  `userid` int(11) DEFAULT '0',
  `username` varchar(150) DEFAULT '',
  `usertype` varchar(50) DEFAULT '',
  PRIMARY KEY (`session_id`),
  KEY `whosonline` (`guest`,`usertype`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_session`
--

LOCK TABLES `bk078_session` WRITE;
/*!40000 ALTER TABLE `bk078_session` DISABLE KEYS */;
INSERT INTO `bk078_session` VALUES ('10flvm1r3lqp08lgo06983n765',0,1,'1350711435','__default|a:8:{s:15:\"session.counter\";i:28;s:19:\"session.timer.start\";i:1350710009;s:18:\"session.timer.last\";i:1350711431;s:17:\"session.timer.now\";i:1350711435;s:22:\"session.client.browser\";s:108:\"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.40 Safari/537.11\";s:8:\"registry\";O:9:\"JRegistry\":1:{s:7:\"\0*\0data\";O:8:\"stdClass\":1:{s:10:\"com_travel\";O:8:\"stdClass\":4:{s:8:\"packages\";O:8:\"stdClass\":1:{s:8:\"ordercol\";N;}s:5:\"carts\";O:8:\"stdClass\":1:{s:5:\"carts\";O:8:\"stdClass\":1:{s:8:\"ordercol\";N;}}s:5:\"sales\";O:8:\"stdClass\":1:{s:5:\"sales\";O:8:\"stdClass\":1:{s:8:\"ordercol\";N;}}s:9:\"withdraws\";O:8:\"stdClass\":1:{s:8:\"ordercol\";N;}}}}s:4:\"user\";O:5:\"JUser\":25:{s:9:\"\0*\0isRoot\";b:0;s:2:\"id\";i:0;s:4:\"name\";N;s:8:\"username\";N;s:5:\"email\";N;s:8:\"password\";N;s:14:\"password_clear\";s:0:\"\";s:8:\"usertype\";N;s:5:\"block\";N;s:9:\"sendEmail\";i:0;s:12:\"registerDate\";N;s:13:\"lastvisitDate\";N;s:10:\"activation\";N;s:6:\"params\";N;s:6:\"groups\";a:0:{}s:5:\"guest\";i:1;s:13:\"lastResetTime\";N;s:10:\"resetCount\";N;s:10:\"\0*\0_params\";O:9:\"JRegistry\":1:{s:7:\"\0*\0data\";O:8:\"stdClass\":0:{}}s:14:\"\0*\0_authGroups\";a:1:{i:0;i:1;}s:14:\"\0*\0_authLevels\";a:4:{i:0;i:1;i:1;i:1;i:2;i:2;i:3;i:4;}s:15:\"\0*\0_authActions\";N;s:12:\"\0*\0_errorMsg\";N;s:10:\"\0*\0_errors\";a:0:{}s:3:\"aid\";i:0;}s:13:\"session.token\";s:32:\"6a5e604b7ba17b596042ec08440a44a7\";}Travel|a:1:{s:5:\"Model\";a:4:{s:8:\"packages\";a:1:{s:5:\"State\";O:7:\"JObject\":9:{s:10:\"\0*\0_errors\";a:0:{}s:5:\"limit\";i:0;s:4:\"task\";s:0:\"\";s:15:\"parameters.menu\";O:9:\"JRegistry\":1:{s:7:\"\0*\0data\";O:8:\"stdClass\":24:{s:17:\"menu-anchor_title\";s:0:\"\";s:15:\"menu-anchor_css\";s:0:\"\";s:10:\"menu_image\";s:0:\"\";s:9:\"menu_text\";i:1;s:10:\"page_title\";s:0:\"\";s:17:\"show_page_heading\";i:0;s:12:\"page_heading\";s:0:\"\";s:13:\"pageclass_sfx\";s:0:\"\";s:21:\"menu-meta_description\";s:0:\"\";s:18:\"menu-meta_keywords\";s:0:\"\";s:6:\"robots\";s:0:\"\";s:6:\"secure\";i:0;s:19:\"fusion_item_subtext\";s:0:\"\";s:18:\"fusion_customimage\";s:0:\"\";s:18:\"fusion_customclass\";s:0:\"\";s:14:\"fusion_columns\";s:1:\"1\";s:19:\"fusion_distribution\";s:4:\"even\";s:21:\"fusion_dropdown_width\";s:0:\"\";s:20:\"fusion_column_widths\";s:0:\"\";s:21:\"fusion_children_group\";s:1:\"0\";s:20:\"fusion_children_type\";s:9:\"menuitems\";s:14:\"fusion_modules\";s:2:\"94\";s:23:\"fusion_module_positions\";s:0:\"\";s:22:\"splitmenu_item_subtext\";s:0:\"\";}}s:6:\"params\";O:9:\"JRegistry\":1:{s:7:\"\0*\0data\";O:8:\"stdClass\":0:{}}s:10:\"list.limit\";s:2:\"20\";s:10:\"list.start\";d:0;s:13:\"list.ordering\";N;s:14:\"list.direction\";N;}}s:5:\"carts\";a:1:{s:5:\"State\";O:7:\"JObject\":10:{s:10:\"\0*\0_errors\";a:0:{}s:5:\"limit\";i:0;s:4:\"task\";s:0:\"\";s:15:\"parameters.menu\";O:9:\"JRegistry\":1:{s:7:\"\0*\0data\";O:8:\"stdClass\":24:{s:17:\"menu-anchor_title\";s:0:\"\";s:15:\"menu-anchor_css\";s:0:\"\";s:10:\"menu_image\";s:0:\"\";s:9:\"menu_text\";i:1;s:10:\"page_title\";s:0:\"\";s:17:\"show_page_heading\";i:0;s:12:\"page_heading\";s:0:\"\";s:13:\"pageclass_sfx\";s:0:\"\";s:21:\"menu-meta_description\";s:0:\"\";s:18:\"menu-meta_keywords\";s:0:\"\";s:6:\"robots\";s:0:\"\";s:6:\"secure\";i:0;s:19:\"fusion_item_subtext\";s:0:\"\";s:18:\"fusion_customimage\";s:0:\"\";s:18:\"fusion_customclass\";s:0:\"\";s:14:\"fusion_columns\";s:1:\"1\";s:19:\"fusion_distribution\";s:4:\"even\";s:21:\"fusion_dropdown_width\";s:0:\"\";s:20:\"fusion_column_widths\";s:0:\"\";s:21:\"fusion_children_group\";s:1:\"0\";s:20:\"fusion_children_type\";s:9:\"menuitems\";s:14:\"fusion_modules\";s:2:\"94\";s:23:\"fusion_module_positions\";s:0:\"\";s:22:\"splitmenu_item_subtext\";s:0:\"\";}}s:6:\"params\";O:9:\"JRegistry\":1:{s:7:\"\0*\0data\";O:8:\"stdClass\":0:{}}s:10:\"list.limit\";s:2:\"20\";s:10:\"list.start\";d:0;s:13:\"list.ordering\";N;s:14:\"list.direction\";N;s:17:\"filter.package_id\";N;}}s:5:\"sales\";a:1:{s:5:\"State\";O:7:\"JObject\":14:{s:10:\"\0*\0_errors\";a:0:{}s:4:\"task\";s:0:\"\";s:15:\"parameters.menu\";O:9:\"JRegistry\":1:{s:7:\"\0*\0data\";O:8:\"stdClass\":24:{s:17:\"menu-anchor_title\";s:0:\"\";s:15:\"menu-anchor_css\";s:0:\"\";s:10:\"menu_image\";s:0:\"\";s:9:\"menu_text\";i:1;s:10:\"page_title\";s:0:\"\";s:17:\"show_page_heading\";i:0;s:12:\"page_heading\";s:0:\"\";s:13:\"pageclass_sfx\";s:0:\"\";s:21:\"menu-meta_description\";s:0:\"\";s:18:\"menu-meta_keywords\";s:0:\"\";s:6:\"robots\";s:0:\"\";s:6:\"secure\";i:0;s:19:\"fusion_item_subtext\";s:0:\"\";s:18:\"fusion_customimage\";s:0:\"\";s:18:\"fusion_customclass\";s:0:\"\";s:14:\"fusion_columns\";s:1:\"1\";s:19:\"fusion_distribution\";s:4:\"even\";s:21:\"fusion_dropdown_width\";s:0:\"\";s:20:\"fusion_column_widths\";s:0:\"\";s:21:\"fusion_children_group\";s:1:\"0\";s:20:\"fusion_children_type\";s:9:\"menuitems\";s:14:\"fusion_modules\";s:2:\"94\";s:23:\"fusion_module_positions\";s:0:\"\";s:22:\"splitmenu_item_subtext\";s:0:\"\";}}s:6:\"params\";O:9:\"JRegistry\":1:{s:7:\"\0*\0data\";O:8:\"stdClass\":0:{}}s:10:\"list.limit\";s:2:\"20\";s:10:\"list.start\";d:0;s:13:\"list.ordering\";N;s:14:\"list.direction\";N;s:25:\"filter.creation_date_from\";N;s:23:\"filter.creation_date_to\";N;s:27:\"filter.completion_date_from\";N;s:25:\"filter.completion_date_to\";N;s:20:\"filter.creation_date\";N;s:22:\"filter.completion_date\";N;}}s:9:\"withdraws\";a:1:{s:5:\"State\";O:7:\"JObject\":14:{s:10:\"\0*\0_errors\";a:0:{}s:4:\"task\";s:0:\"\";s:15:\"parameters.menu\";O:9:\"JRegistry\":1:{s:7:\"\0*\0data\";O:8:\"stdClass\":24:{s:17:\"menu-anchor_title\";s:0:\"\";s:15:\"menu-anchor_css\";s:0:\"\";s:10:\"menu_image\";s:0:\"\";s:9:\"menu_text\";i:1;s:10:\"page_title\";s:0:\"\";s:17:\"show_page_heading\";i:0;s:12:\"page_heading\";s:0:\"\";s:13:\"pageclass_sfx\";s:0:\"\";s:21:\"menu-meta_description\";s:0:\"\";s:18:\"menu-meta_keywords\";s:0:\"\";s:6:\"robots\";s:0:\"\";s:6:\"secure\";i:0;s:19:\"fusion_item_subtext\";s:0:\"\";s:18:\"fusion_customimage\";s:0:\"\";s:18:\"fusion_customclass\";s:0:\"\";s:14:\"fusion_columns\";s:1:\"1\";s:19:\"fusion_distribution\";s:4:\"even\";s:21:\"fusion_dropdown_width\";s:0:\"\";s:20:\"fusion_column_widths\";s:0:\"\";s:21:\"fusion_children_group\";s:1:\"0\";s:20:\"fusion_children_type\";s:9:\"menuitems\";s:14:\"fusion_modules\";s:2:\"94\";s:23:\"fusion_module_positions\";s:0:\"\";s:22:\"splitmenu_item_subtext\";s:0:\"\";}}s:6:\"params\";O:9:\"JRegistry\":1:{s:7:\"\0*\0data\";O:8:\"stdClass\":0:{}}s:10:\"list.limit\";s:2:\"20\";s:10:\"list.start\";d:0;s:13:\"list.ordering\";N;s:14:\"list.direction\";N;s:25:\"filter.creation_date_from\";N;s:23:\"filter.creation_date_to\";N;s:24:\"filter.payment_date_from\";N;s:22:\"filter.payment_date_to\";N;s:20:\"filter.creation_date\";N;s:19:\"filter.payment_date\";N;}}}}',0,'',''),('5472bbe1dc339326981a30a03876fb0e',1,0,'1350710876','__default|a:8:{s:15:\"session.counter\";i:217;s:19:\"session.timer.start\";i:1350709343;s:18:\"session.timer.last\";i:1350710876;s:17:\"session.timer.now\";i:1350710876;s:22:\"session.client.browser\";s:108:\"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.40 Safari/537.11\";s:8:\"registry\";O:9:\"JRegistry\":1:{s:7:\"\0*\0data\";O:8:\"stdClass\":9:{s:11:\"application\";O:8:\"stdClass\":1:{s:4:\"lang\";s:0:\"\";}s:10:\"com_travel\";O:8:\"stdClass\":1:{s:5:\"sales\";O:8:\"stdClass\":1:{s:8:\"ordercol\";N;}}s:9:\"com_menus\";O:8:\"stdClass\":2:{s:5:\"items\";O:8:\"stdClass\":2:{s:6:\"filter\";O:8:\"stdClass\":1:{s:8:\"menutype\";s:8:\"mainmenu\";}s:10:\"limitstart\";i:0;}s:4:\"edit\";O:8:\"stdClass\":1:{s:4:\"item\";O:8:\"stdClass\":4:{s:2:\"id\";a:1:{i:0;i:255;}s:4:\"data\";N;s:4:\"type\";N;s:4:\"link\";N;}}}s:9:\"com_users\";O:8:\"stdClass\":1:{s:4:\"edit\";O:8:\"stdClass\":3:{s:5:\"level\";O:8:\"stdClass\":2:{s:2:\"id\";a:4:{i:3;i:3;i:4;i:2;i:5;i:1;i:6;i:4;}s:4:\"data\";N;}s:4:\"user\";O:8:\"stdClass\":2:{s:2:\"id\";a:0:{}s:4:\"data\";N;}s:5:\"group\";O:8:\"stdClass\":2:{s:2:\"id\";a:4:{i:0;i:9;i:1;i:2;i:2;i:8;i:3;i:10;}s:4:\"data\";N;}}}s:10:\"com_config\";O:8:\"stdClass\":1:{s:6:\"config\";O:8:\"stdClass\":1:{s:6:\"global\";O:8:\"stdClass\":1:{s:4:\"data\";a:61:{s:7:\"caching\";i:0;s:13:\"cache_handler\";s:3:\"apc\";s:9:\"cachetime\";i:0;s:6:\"dbtype\";s:6:\"mysqli\";s:4:\"host\";s:9:\"localhost\";s:4:\"user\";s:4:\"root\";s:2:\"db\";s:3:\"mta\";s:8:\"dbprefix\";s:6:\"bk078_\";s:5:\"debug\";i:0;s:10:\"debug_lang\";i:0;s:10:\"ftp_enable\";i:0;s:8:\"ftp_host\";s:9:\"127.0.0.1\";s:8:\"ftp_port\";s:2:\"21\";s:8:\"ftp_user\";s:0:\"\";s:8:\"ftp_pass\";s:0:\"\";s:8:\"ftp_root\";s:0:\"\";s:6:\"offset\";s:3:\"UTC\";s:6:\"mailer\";s:4:\"smtp\";s:8:\"mailfrom\";s:22:\"edward@tomato-ming.net\";s:8:\"fromname\";s:12:\"MTA Programm\";s:8:\"sendmail\";s:18:\"/usr/sbin/sendmail\";s:8:\"smtpauth\";i:1;s:10:\"smtpsecure\";s:4:\"none\";s:8:\"smtpport\";s:3:\"587\";s:8:\"smtpuser\";s:22:\"edward+tomato-ming.net\";s:8:\"smtppass\";s:10:\"8943271901\";s:8:\"smtphost\";s:20:\"mail.tomato-ming.net\";s:8:\"MetaDesc\";s:0:\"\";s:8:\"MetaKeys\";s:0:\"\";s:6:\"robots\";s:0:\"\";s:10:\"MetaRights\";s:0:\"\";s:10:\"MetaAuthor\";i:1;s:11:\"MetaVersion\";i:0;s:3:\"sef\";i:1;s:11:\"sef_rewrite\";i:0;s:10:\"sef_suffix\";i:0;s:12:\"unicodeslugs\";i:0;s:19:\"sitename_pagetitles\";i:0;s:8:\"tmp_path\";s:28:\"/home/edward/project/mta/tmp\";s:4:\"gzip\";i:0;s:15:\"error_reporting\";s:7:\"default\";s:9:\"force_ssl\";i:0;s:8:\"lifetime\";i:30;s:15:\"session_handler\";s:8:\"database\";s:8:\"sitename\";s:13:\"MTA Programme\";s:7:\"offline\";i:0;s:23:\"display_offline_message\";i:1;s:15:\"offline_message\";s:70:\"This site is down for maintenance.<br /> Please check back again soon.\";s:13:\"offline_image\";s:0:\"\";s:6:\"editor\";s:7:\"tinymce\";s:7:\"captcha\";s:1:\"0\";s:6:\"access\";i:1;s:10:\"list_limit\";i:20;s:10:\"feed_limit\";i:10;s:10:\"feed_email\";s:6:\"author\";s:8:\"log_path\";s:29:\"/home/edward/project/mta/logs\";s:7:\"helpurl\";s:89:\"http://help.joomla.org/proxy/index.php?option=com_help&keyref=Help{major}{minor}:{keyref}\";s:13:\"cookie_domain\";s:0:\"\";s:11:\"cookie_path\";s:0:\"\";s:5:\"rules\";a:10:{s:15:\"core.login.site\";a:2:{i:6;b:1;i:2;b:1;}s:16:\"core.login.admin\";a:1:{i:6;b:1;}s:18:\"core.login.offline\";a:1:{i:6;b:1;}s:10:\"core.admin\";a:1:{i:8;b:1;}s:11:\"core.manage\";a:1:{i:7;b:1;}s:11:\"core.create\";a:2:{i:6;b:1;i:3;b:1;}s:11:\"core.delete\";a:2:{i:6;b:1;i:9;b:1;}s:9:\"core.edit\";a:2:{i:6;b:1;i:4;b:1;}s:15:\"core.edit.state\";a:2:{i:6;b:1;i:5;b:1;}s:13:\"core.edit.own\";a:2:{i:6;b:1;i:3;b:1;}}s:7:\"filters\";a:9:{i:1;a:3:{s:11:\"filter_type\";s:2:\"BL\";s:11:\"filter_tags\";s:0:\"\";s:17:\"filter_attributes\";s:0:\"\";}i:6;a:3:{s:11:\"filter_type\";s:2:\"BL\";s:11:\"filter_tags\";s:0:\"\";s:17:\"filter_attributes\";s:0:\"\";}i:7;a:3:{s:11:\"filter_type\";s:2:\"BL\";s:11:\"filter_tags\";s:0:\"\";s:17:\"filter_attributes\";s:0:\"\";}i:2;a:3:{s:11:\"filter_type\";s:2:\"BL\";s:11:\"filter_tags\";s:0:\"\";s:17:\"filter_attributes\";s:0:\"\";}i:9;a:3:{s:11:\"filter_type\";s:2:\"BL\";s:11:\"filter_tags\";s:0:\"\";s:17:\"filter_attributes\";s:0:\"\";}i:3;a:3:{s:11:\"filter_type\";s:2:\"BL\";s:11:\"filter_tags\";s:0:\"\";s:17:\"filter_attributes\";s:0:\"\";}i:4;a:3:{s:11:\"filter_type\";s:2:\"BL\";s:11:\"filter_tags\";s:0:\"\";s:17:\"filter_attributes\";s:0:\"\";}i:5;a:3:{s:11:\"filter_type\";s:2:\"BL\";s:11:\"filter_tags\";s:0:\"\";s:17:\"filter_attributes\";s:0:\"\";}i:8;a:3:{s:11:\"filter_type\";s:2:\"BL\";s:11:\"filter_tags\";s:0:\"\";s:17:\"filter_attributes\";s:0:\"\";}}}}}}s:11:\"com_k2users\";O:8:\"stdClass\":1:{s:10:\"limitstart\";i:0;}s:21:\"searchcom_comprofiler\";s:0:\"\";s:29:\"viewcom_comprofilerlimitstart\";i:0;s:29:\"viewcom_comprofilerlastCBlist\";s:9:\"showusers\";}}s:4:\"user\";O:5:\"JUser\":26:{s:9:\"\0*\0isRoot\";b:1;s:2:\"id\";s:3:\"367\";s:4:\"name\";s:10:\"Super User\";s:8:\"username\";s:5:\"admin\";s:5:\"email\";s:19:\"edward@enfonius.com\";s:8:\"password\";s:65:\"0095f5080dfd42e47342b4241f62b08b:qB2jG4pNH48d33BNuKGClJRBRuTxbaZJ\";s:14:\"password_clear\";s:0:\"\";s:8:\"usertype\";s:10:\"deprecated\";s:5:\"block\";s:1:\"0\";s:9:\"sendEmail\";s:1:\"1\";s:12:\"registerDate\";s:19:\"2012-10-13 14:22:11\";s:13:\"lastvisitDate\";s:19:\"2012-10-19 18:10:01\";s:10:\"activation\";s:1:\"0\";s:6:\"params\";s:0:\"\";s:6:\"groups\";a:1:{i:8;s:1:\"8\";}s:5:\"guest\";i:0;s:13:\"lastResetTime\";s:19:\"0000-00-00 00:00:00\";s:10:\"resetCount\";s:1:\"0\";s:10:\"\0*\0_params\";O:9:\"JRegistry\":1:{s:7:\"\0*\0data\";O:8:\"stdClass\":0:{}}s:14:\"\0*\0_authGroups\";a:2:{i:0;i:1;i:1;i:8;}s:14:\"\0*\0_authLevels\";a:5:{i:0;i:1;i:1;i:1;i:2;i:2;i:3;i:3;i:4;i:4;}s:15:\"\0*\0_authActions\";N;s:12:\"\0*\0_errorMsg\";N;s:10:\"\0*\0_errors\";a:0:{}s:3:\"aid\";i:0;s:3:\"gid\";i:1000;}s:13:\"session.token\";s:32:\"8e1b12271c728a89743bb828abe4fb47\";}Travel|a:1:{s:5:\"Model\";a:1:{s:5:\"sales\";a:1:{s:5:\"State\";O:7:\"JObject\":15:{s:10:\"\0*\0_errors\";a:0:{}s:4:\"task\";s:0:\"\";s:6:\"params\";O:9:\"JRegistry\":1:{s:7:\"\0*\0data\";O:8:\"stdClass\":0:{}}s:10:\"list.limit\";s:2:\"20\";s:10:\"list.start\";d:0;s:13:\"list.ordering\";N;s:14:\"list.direction\";N;s:25:\"filter.creation_date_from\";N;s:23:\"filter.creation_date_to\";N;s:27:\"filter.completion_date_from\";N;s:25:\"filter.completion_date_to\";N;s:16:\"filter.completed\";N;s:20:\"filter.creation_date\";N;s:22:\"filter.completion_date\";N;s:13:\"search.search\";N;}}}}',367,'admin','');
/*!40000 ALTER TABLE `bk078_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_osmembership_currencies`
--

DROP TABLE IF EXISTS `bk078_osmembership_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_osmembership_currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency_code` varchar(10) DEFAULT NULL,
  `currency_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_osmembership_currencies`
--

LOCK TABLES `bk078_osmembership_currencies` WRITE;
/*!40000 ALTER TABLE `bk078_osmembership_currencies` DISABLE KEYS */;
INSERT INTO `bk078_osmembership_currencies` VALUES (1,'CAD','Canadian Dollars'),(2,'EUR','Euros'),(3,'GBP','Pounds Sterling'),(4,'USD','U.S. Dollars'),(5,'JPY','Japanese Yen'),(6,'AUD','Australian Dollars'),(7,'NZD','New Zealand Dollars'),(8,'CHF','Swiss Francs'),(9,'HKD','Hong Kong Dollars'),(10,'SGD','Singapore Dollars'),(11,'SEK','Swedish Kronor'),(12,'DKK','Danish Kroner'),(13,'PLN','Polish Zloty'),(14,'NOK','Norwegian Kroner'),(15,'HUF','Hungarian Forint'),(16,'CZK','Czech Koruna'),(17,'ILS','Israeli Shekel'),(18,'BRL','Brazilian Real'),(19,'MYR','Malaysian Ringgit'),(20,'MXN','Mexican Peso'),(21,'PHP','Philippine Peso'),(22,'TWD','Taiwan New Dollar'),(23,'THB','Thai Baht');
/*!40000 ALTER TABLE `bk078_osmembership_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_osmembership_plugins`
--

DROP TABLE IF EXISTS `bk078_osmembership_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_osmembership_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `author` varchar(250) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `copyright` varchar(255) DEFAULT NULL,
  `license` varchar(255) DEFAULT NULL,
  `author_email` varchar(50) DEFAULT NULL,
  `author_url` varchar(50) DEFAULT NULL,
  `version` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `params` text,
  `ordering` int(11) DEFAULT NULL,
  `published` tinyint(3) unsigned DEFAULT NULL,
  `support_recurring_subscription` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_osmembership_plugins`
--

LOCK TABLES `bk078_osmembership_plugins` WRITE;
/*!40000 ALTER TABLE `bk078_osmembership_plugins` DISABLE KEYS */;
INSERT INTO `bk078_osmembership_plugins` VALUES (1,'os_paypal','Paypal','Tuan Pham Ngoc','0000-00-00 00:00:00','Copyright 2007-2010 Ossolution Team','http://www.gnu.org/licenses/old-licenses/gpl-2.0.html GNU/GPL version 2','contact@joomdonation.com','www.joomdonation.com','1.0','Paypal Payment Plugin For Events Booking Extension','paypal_mode=\"0\"\npaypal_id=\"\"\npaypal_currency=\"USD\"',1,0,1),(2,'os_authnet','Authorize.net','Tuan Pham Ngoc','0000-00-00 00:00:00','Copyright 2007-2010 Ossolution Team','http://www.gnu.org/licenses/old-licenses/gpl-2.0.html GNU/GPL version 2','contact@joomdonation.com','www.joomdonation.com','1.0','Authorize.net Payment Plugin For Events Booking Extension','authnet_mode=\"0\"\nx_login=\"2Sht9m67PD\"\nx_tran_key=\"35J2rq5d6LtJ2Yg6\"',2,0,1),(3,'os_eway','Eway','Tuan Pham Ngoc','0000-00-00 00:00:00','Copyright 2007-2010 Ossolution Team','http://www.gnu.org/licenses/old-licenses/gpl-2.0.html GNU/GPL version 2','contact@joomdonation.com','www.joomdonation.com','1.0','Eway Payment Plugin For Events Booking Extension',NULL,3,0,0),(4,'os_offline','Offline Payment','Tuan Pham Ngoc','0000-00-00 00:00:00','Copyright 2007-2010 Ossolution Team','http://www.gnu.org/licenses/old-licenses/gpl-2.0.html GNU/GPL version 2','contact@joomdonation.com','www.joomdonation.com','1.0','Offline Payment Plugin For Events Booking Extension',NULL,4,1,0);
/*!40000 ALTER TABLE `bk078_osmembership_plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_travel_withdraws`
--

DROP TABLE IF EXISTS `bk078_travel_withdraws`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_travel_withdraws` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `params` text NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `total_paid` decimal(10,2) NOT NULL DEFAULT '0.00',
  `user_id` int(11) NOT NULL,
  `creation_date` date DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_travel_withdraws`
--

LOCK TABLES `bk078_travel_withdraws` WRITE;
/*!40000 ALTER TABLE `bk078_travel_withdraws` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_travel_withdraws` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_osmembership_upgraderules`
--

DROP TABLE IF EXISTS `bk078_osmembership_upgraderules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_osmembership_upgraderules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_plan_id` tinyint(3) unsigned DEFAULT NULL,
  `to_plan_id` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `min_presence` int(11) DEFAULT NULL,
  `max_presence` int(11) DEFAULT NULL,
  `published` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_osmembership_upgraderules`
--

LOCK TABLES `bk078_osmembership_upgraderules` WRITE;
/*!40000 ALTER TABLE `bk078_osmembership_upgraderules` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_osmembership_upgraderules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_qunipay_paymentoptions`
--

DROP TABLE IF EXISTS `bk078_qunipay_paymentoptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_qunipay_paymentoptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accessLevel` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `inputmethod` varchar(64) NOT NULL,
  `published` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_qunipay_paymentoptions`
--

LOCK TABLES `bk078_qunipay_paymentoptions` WRITE;
/*!40000 ALTER TABLE `bk078_qunipay_paymentoptions` DISABLE KEYS */;
INSERT INTO `bk078_qunipay_paymentoptions` VALUES (1,1,'Bank In','Bank in','PaymentFactory',1);
/*!40000 ALTER TABLE `bk078_qunipay_paymentoptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_qunipay_payment_items`
--

DROP TABLE IF EXISTS `bk078_qunipay_payment_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_qunipay_payment_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paymentid` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `count` int(11) NOT NULL,
  `currency` varchar(3) NOT NULL,
  `amount` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_qunipay_payment_items`
--

LOCK TABLES `bk078_qunipay_payment_items` WRITE;
/*!40000 ALTER TABLE `bk078_qunipay_payment_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_qunipay_payment_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_k2_users`
--

DROP TABLE IF EXISTS `bk078_k2_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_k2_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `gender` enum('m','f') NOT NULL DEFAULT 'm',
  `description` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `group` int(11) NOT NULL DEFAULT '0',
  `plugins` text NOT NULL,
  `ip` varchar(15) NOT NULL,
  `hostname` varchar(255) NOT NULL,
  `notes` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userID` (`userID`),
  KEY `group` (`group`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_k2_users`
--

LOCK TABLES `bk078_k2_users` WRITE;
/*!40000 ALTER TABLE `bk078_k2_users` DISABLE KEYS */;
INSERT INTO `bk078_k2_users` VALUES (1,42,'Super User','m','',NULL,'',1,'','192.168.9.1','newgate.cod',''),(2,43,'system','m','',NULL,'',1,'','127.0.0.1','activate.adobe.com',''),(3,0,NULL,'m','',NULL,NULL,1,'','127.0.0.1','activate.adobe.com',''),(4,0,NULL,'m','',NULL,NULL,1,'','127.0.0.1','activate.adobe.com',''),(5,499,'Super User','m','',NULL,'',1,'','127.0.0.1','activate.adobe.com',''),(6,0,NULL,'m','',NULL,NULL,1,'','192.168.1.103','192.168.1.103',''),(7,0,NULL,'m','',NULL,NULL,1,'','192.168.1.103','192.168.1.103',''),(8,0,NULL,'m','',NULL,NULL,1,'','172.16.21.23','PNT-MINGLIH.local',''),(9,0,NULL,'m','',NULL,NULL,1,'','172.16.21.23','PNT-MINGLIH.local',''),(10,0,NULL,'m','',NULL,NULL,1,'','172.16.21.23','PNT-MINGLIH.local',''),(11,0,NULL,'m','',NULL,NULL,1,'','172.16.21.23','PNT-MINGLIH.local',''),(12,0,NULL,'m','',NULL,NULL,1,'','172.16.21.23','PNT-MINGLIH.local',''),(13,0,NULL,'m','',NULL,NULL,1,'','192.168.1.103','192.168.1.103',''),(14,0,NULL,'m','',NULL,NULL,1,'','192.168.1.103','192.168.1.103',''),(15,0,NULL,'m','',NULL,NULL,1,'','192.168.1.103','192.168.1.103',''),(16,0,NULL,'m','',NULL,NULL,1,'','192.168.1.103','192.168.1.103',''),(17,0,NULL,'m','',NULL,NULL,1,'','192.168.1.103','192.168.1.103',''),(18,0,NULL,'m','',NULL,NULL,1,'','192.168.1.103','192.168.1.103',''),(19,0,NULL,'m','',NULL,NULL,1,'','192.168.1.103','192.168.1.103','');
/*!40000 ALTER TABLE `bk078_k2_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_osmembership_coupons`
--

DROP TABLE IF EXISTS `bk078_osmembership_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_osmembership_coupons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL,
  `coupon_type` tinyint(3) unsigned DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `plan_id` int(11) DEFAULT NULL,
  `times` int(11) DEFAULT NULL,
  `used` int(11) DEFAULT NULL,
  `valid_from` date DEFAULT NULL,
  `valid_to` date DEFAULT NULL,
  `published` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_osmembership_coupons`
--

LOCK TABLES `bk078_osmembership_coupons` WRITE;
/*!40000 ALTER TABLE `bk078_osmembership_coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_osmembership_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_osmembership_field_value`
--

DROP TABLE IF EXISTS `bk078_osmembership_field_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_osmembership_field_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) DEFAULT NULL,
  `subscriber_id` int(11) DEFAULT NULL,
  `field_value` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_osmembership_field_value`
--

LOCK TABLES `bk078_osmembership_field_value` WRITE;
/*!40000 ALTER TABLE `bk078_osmembership_field_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_osmembership_field_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_finder_taxonomy_map`
--

DROP TABLE IF EXISTS `bk078_finder_taxonomy_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_finder_taxonomy_map` (
  `link_id` int(10) unsigned NOT NULL,
  `node_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`node_id`),
  KEY `link_id` (`link_id`),
  KEY `node_id` (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_finder_taxonomy_map`
--

LOCK TABLES `bk078_finder_taxonomy_map` WRITE;
/*!40000 ALTER TABLE `bk078_finder_taxonomy_map` DISABLE KEYS */;
INSERT INTO `bk078_finder_taxonomy_map` VALUES (11,9),(11,20),(12,9),(12,20),(64,9),(64,35),(64,36),(65,37),(65,38),(65,39),(65,40),(66,9),(66,37),(66,38),(66,41),(67,9),(67,37),(67,38),(67,41),(68,9),(68,37),(68,38),(68,41),(69,9),(69,37),(69,38),(69,41);
/*!40000 ALTER TABLE `bk078_finder_taxonomy_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_core_log_searches`
--

DROP TABLE IF EXISTS `bk078_core_log_searches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_core_log_searches` (
  `search_term` varchar(128) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_core_log_searches`
--

LOCK TABLES `bk078_core_log_searches` WRITE;
/*!40000 ALTER TABLE `bk078_core_log_searches` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_core_log_searches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_finder_types`
--

DROP TABLE IF EXISTS `bk078_finder_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_finder_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `mime` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_finder_types`
--

LOCK TABLES `bk078_finder_types` WRITE;
/*!40000 ALTER TABLE `bk078_finder_types` DISABLE KEYS */;
INSERT INTO `bk078_finder_types` VALUES (1,'Category',''),(2,'Contact',''),(3,'Article',''),(4,'News Feed',''),(5,'Web Link',''),(6,'K2 Item','');
/*!40000 ALTER TABLE `bk078_finder_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_finder_links_termsd`
--

DROP TABLE IF EXISTS `bk078_finder_links_termsd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_finder_links_termsd` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_finder_links_termsd`
--

LOCK TABLES `bk078_finder_links_termsd` WRITE;
/*!40000 ALTER TABLE `bk078_finder_links_termsd` DISABLE KEYS */;
INSERT INTO `bk078_finder_links_termsd` VALUES (11,1,0),(12,1,0),(64,1,0),(64,1728,0.52),(64,4185,0.88669),(64,4186,1.00331),(65,4260,0.01169),(65,4261,1.00331),(65,4262,1.07331),(65,4263,0.28),(65,4264,1.05),(65,4265,1.33),(66,1,0),(67,1,0),(67,1517,0.09331),(67,4260,0.74648),(67,4726,0.91),(67,4727,1.02669),(67,4728,0.88669),(67,4729,1.09669),(67,4730,1.02669),(67,4731,1.19),(67,4732,0.95669),(67,4733,1.28331),(67,4734,0.91),(67,4735,1.02669),(67,4736,0.91),(67,4737,1.12),(67,4738,0.84),(67,4739,1.00331),(67,4740,0.86331),(67,4741,0.98),(67,4742,1.00331),(67,4743,1.14331),(67,4744,0.18669),(67,4745,0.88669),(67,4746,1.05),(68,1,0),(69,1,0);
/*!40000 ALTER TABLE `bk078_finder_links_termsd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_finder_links_termse`
--

DROP TABLE IF EXISTS `bk078_finder_links_termse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_finder_links_termse` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_finder_links_termse`
--

LOCK TABLES `bk078_finder_links_termse` WRITE;
/*!40000 ALTER TABLE `bk078_finder_links_termse` DISABLE KEYS */;
INSERT INTO `bk078_finder_links_termse` VALUES (64,4107,0.42),(64,4108,1.72662),(64,4109,1.96),(64,4110,0.42),(64,4111,1.77338),(64,4112,2.24),(64,4158,0.56),(64,4159,1.91338),(64,4160,2.33338),(64,4192,0.84),(64,4193,1.96),(64,4194,2.14662),(65,1544,0.105),(65,1548,0.02338),(65,4228,0.39996),(65,4229,0.46669),(65,4230,1.00331),(65,4231,1.09669),(65,4282,0.02331),(65,4283,0.86331),(65,4284,1.00331),(65,4285,1.02669),(65,4286,1.09669),(65,4287,1.91338),(65,4288,1.02669),(65,4289,1.07331),(65,4290,1.09669),(65,4291,1.26),(65,4292,1.05),(65,4293,0.84),(65,4294,0.95669),(65,4295,0.98),(65,4296,1.19),(65,4297,0.86331),(65,4298,0.95669),(65,4299,0.84),(65,4300,0.91),(65,4301,1.05),(65,4302,0.95669),(65,4303,1.05),(65,4304,0.91),(65,4305,1.02669),(67,1544,2.66),(67,1548,0.46655),(67,4322,2.6),(67,4336,0.28),(67,4337,0.88669),(67,4338,0.98),(67,4535,0.37331),(67,4536,1.23669),(67,4537,1.4),(67,4538,0.46662),(67,4539,0.95669),(67,4540,1.16669),(67,4541,1.07331),(67,4542,1.21331),(67,4543,0.32669),(67,4544,1.09669),(67,4545,1.23669),(67,4546,0.14),(67,4547,0.84),(67,4548,0.95669),(67,4549,0.18669),(67,4550,0.91),(67,4551,1.19),(67,4552,0.37331),(67,4553,0.95669),(67,4554,1.09669),(67,4846,0.28),(67,4847,0.98),(67,4848,1.21331),(67,4849,0.93331),(67,4850,1.14331),(67,4851,0.95669),(67,4852,1.05),(67,4853,0.93331),(67,4854,1.09669),(67,4855,0.93331),(67,4856,1.07331),(67,4857,0.74662),(67,4858,1.00331),(67,4859,1.12),(67,4860,1.00331),(67,4861,1.07331),(67,4862,1.12),(67,4863,0.93331),(67,4864,1.09669),(67,4865,1.00331),(67,4866,1.05),(67,4867,1.05),(67,4868,1.09669),(67,4869,1.05),(67,4870,1.23669),(67,4871,0.37331),(67,4872,1.07331),(67,4873,1.19),(67,4874,0.42),(67,4875,1.09669),(67,4876,1.16669),(67,4877,0.32669),(67,4878,0.98),(67,4879,1.21331),(67,4880,0.42),(67,4881,1.05),(67,4882,1.19),(67,4883,0.37338),(67,4884,1.02669),(67,4885,1.07331),(67,4886,0.86331),(67,4887,0.95669),(67,4888,0.91),(67,4889,1.09669),(67,4890,0.98),(67,4891,1.33),(67,4892,0.91),(67,4893,1.05),(67,4894,0.86331),(67,4895,0.93331),(67,4896,0.91),(67,4897,1.23669),(67,4898,1.02669),(67,4899,1.14331),(67,4900,0.95669),(67,4901,1.07331),(67,4902,0.93331),(67,4903,1.00331),(67,4904,0.93331),(67,4905,1.05),(67,4906,1.00331),(67,4907,1.14331),(67,4908,0.88669),(67,4909,1.00331),(67,4910,0.98),(67,4911,1.16669),(67,4912,1.86662),(67,4913,1.09669),(67,4914,1.07331),(67,4915,0.88669),(67,4916,1.14331),(67,4917,0.95669),(67,4918,1.14331),(67,4919,0.86331),(67,4920,1.00331),(67,4921,0.98),(67,4922,1.26),(67,4923,1.02669),(67,4924,1.30669),(67,4925,0.18669),(67,4926,1.00331),(67,4927,1.19),(67,4928,0.46669),(67,4929,1.02669),(67,4930,1.26),(67,4931,0.37338),(67,4932,1.02669),(67,4933,1.09669),(67,4934,1.00331),(67,4935,1.19),(67,4936,0.23331),(67,4937,0.95669),(67,4938,1.21331),(67,4939,0.18669),(67,4940,0.95669),(67,4941,1.21331),(67,4942,0.18669),(67,4943,0.95669),(67,4944,1.12),(67,4945,0.28),(67,4946,0.91),(67,4947,1.05),(67,4948,0.91),(67,4949,0.98),(67,4950,0.95669),(67,4951,1.07331),(67,4952,0.98),(67,4953,1.16669),(67,4954,0.84),(67,4955,1.00331),(67,4956,0.91),(67,4957,0.98),(67,4958,0.23331),(67,4959,0.93331),(67,4960,1.21331),(67,4961,0.18669),(67,4962,0.91),(67,4963,1.00331),(67,4964,0.23331),(67,4965,1.00331),(67,4966,1.07331),(67,4967,0.23331),(67,4968,0.91),(67,4969,1.02669),(67,4970,0.23331),(67,4971,0.88669),(67,4972,1.00331),(67,4973,0.28),(67,4974,0.98),(67,4975,1.05),(67,4976,0.28),(67,4977,0.93331),(67,4978,1.16669),(67,4979,0.14),(67,4980,0.91),(67,4981,1.09669);
/*!40000 ALTER TABLE `bk078_finder_links_termse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_finder_terms_common`
--

DROP TABLE IF EXISTS `bk078_finder_terms_common`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_finder_terms_common` (
  `term` varchar(75) NOT NULL,
  `language` varchar(3) NOT NULL,
  KEY `idx_word_lang` (`term`,`language`),
  KEY `idx_lang` (`language`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_finder_terms_common`
--

LOCK TABLES `bk078_finder_terms_common` WRITE;
/*!40000 ALTER TABLE `bk078_finder_terms_common` DISABLE KEYS */;
INSERT INTO `bk078_finder_terms_common` VALUES ('a','en'),('a','en'),('a','en'),('about','en'),('about','en'),('about','en'),('after','en'),('after','en'),('after','en'),('ago','en'),('ago','en'),('ago','en'),('all','en'),('all','en'),('all','en'),('am','en'),('am','en'),('am','en'),('an','en'),('an','en'),('an','en'),('and','en'),('and','en'),('and','en'),('ani','en'),('ani','en'),('ani','en'),('any','en'),('any','en'),('any','en'),('are','en'),('are','en'),('are','en'),('aren\'t','en'),('aren\'t','en'),('aren\'t','en'),('as','en'),('as','en'),('as','en'),('at','en'),('at','en'),('at','en'),('be','en'),('be','en'),('be','en'),('but','en'),('but','en'),('but','en'),('by','en'),('by','en'),('by','en'),('for','en'),('for','en'),('for','en'),('from','en'),('from','en'),('from','en'),('get','en'),('get','en'),('get','en'),('go','en'),('go','en'),('go','en'),('how','en'),('how','en'),('how','en'),('if','en'),('if','en'),('if','en'),('in','en'),('in','en'),('in','en'),('into','en'),('into','en'),('into','en'),('is','en'),('is','en'),('is','en'),('isn\'t','en'),('isn\'t','en'),('isn\'t','en'),('it','en'),('it','en'),('it','en'),('its','en'),('its','en'),('its','en'),('me','en'),('me','en'),('me','en'),('more','en'),('more','en'),('more','en'),('most','en'),('most','en'),('most','en'),('must','en'),('must','en'),('must','en'),('my','en'),('my','en'),('my','en'),('new','en'),('new','en'),('new','en'),('no','en'),('no','en'),('no','en'),('none','en'),('none','en'),('none','en'),('not','en'),('not','en'),('not','en'),('noth','en'),('noth','en'),('noth','en'),('nothing','en'),('nothing','en'),('nothing','en'),('of','en'),('of','en'),('of','en'),('off','en'),('off','en'),('off','en'),('often','en'),('often','en'),('often','en'),('old','en'),('old','en'),('old','en'),('on','en'),('on','en'),('on','en'),('onc','en'),('onc','en'),('onc','en'),('once','en'),('once','en'),('once','en'),('onli','en'),('onli','en'),('onli','en'),('only','en'),('only','en'),('only','en'),('or','en'),('or','en'),('or','en'),('other','en'),('other','en'),('other','en'),('our','en'),('our','en'),('our','en'),('ours','en'),('ours','en'),('ours','en'),('out','en'),('out','en'),('out','en'),('over','en'),('over','en'),('over','en'),('page','en'),('page','en'),('page','en'),('she','en'),('she','en'),('she','en'),('should','en'),('should','en'),('should','en'),('small','en'),('small','en'),('small','en'),('so','en'),('so','en'),('so','en'),('some','en'),('some','en'),('some','en'),('than','en'),('than','en'),('than','en'),('thank','en'),('thank','en'),('thank','en'),('that','en'),('that','en'),('that','en'),('the','en'),('the','en'),('the','en'),('their','en'),('their','en'),('their','en'),('theirs','en'),('theirs','en'),('theirs','en'),('them','en'),('them','en'),('them','en'),('then','en'),('then','en'),('then','en'),('there','en'),('there','en'),('there','en'),('these','en'),('these','en'),('these','en'),('they','en'),('they','en'),('they','en'),('this','en'),('this','en'),('this','en'),('those','en'),('those','en'),('those','en'),('thus','en'),('thus','en'),('thus','en'),('time','en'),('time','en'),('time','en'),('times','en'),('times','en'),('times','en'),('to','en'),('to','en'),('to','en'),('too','en'),('too','en'),('too','en'),('true','en'),('true','en'),('true','en'),('under','en'),('under','en'),('under','en'),('until','en'),('until','en'),('until','en'),('up','en'),('up','en'),('up','en'),('upon','en'),('upon','en'),('upon','en'),('use','en'),('use','en'),('use','en'),('user','en'),('user','en'),('user','en'),('users','en'),('users','en'),('users','en'),('veri','en'),('veri','en'),('veri','en'),('version','en'),('version','en'),('version','en'),('very','en'),('very','en'),('very','en'),('via','en'),('via','en'),('via','en'),('want','en'),('want','en'),('want','en'),('was','en'),('was','en'),('was','en'),('way','en'),('way','en'),('way','en'),('were','en'),('were','en'),('were','en'),('what','en'),('what','en'),('what','en'),('when','en'),('when','en'),('when','en'),('where','en'),('where','en'),('where','en'),('whi','en'),('whi','en'),('whi','en'),('which','en'),('which','en'),('which','en'),('who','en'),('who','en'),('who','en'),('whom','en'),('whom','en'),('whom','en'),('whose','en'),('whose','en'),('whose','en'),('why','en'),('why','en'),('why','en'),('wide','en'),('wide','en'),('wide','en'),('will','en'),('will','en'),('will','en'),('with','en'),('with','en'),('with','en'),('within','en'),('within','en'),('within','en'),('without','en'),('without','en'),('without','en'),('would','en'),('would','en'),('would','en'),('yes','en'),('yes','en'),('yes','en'),('yet','en'),('yet','en'),('yet','en'),('you','en'),('you','en'),('you','en'),('your','en'),('your','en'),('your','en'),('yours','en'),('yours','en'),('yours','en');
/*!40000 ALTER TABLE `bk078_finder_terms_common` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_qunilicense_configuration`
--

DROP TABLE IF EXISTS `bk078_qunilicense_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_qunilicense_configuration` (
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_qunilicense_configuration`
--

LOCK TABLES `bk078_qunilicense_configuration` WRITE;
/*!40000 ALTER TABLE `bk078_qunilicense_configuration` DISABLE KEYS */;
INSERT INTO `bk078_qunilicense_configuration` VALUES ('paymentPrefix','MEMBER'),('paymentDescription','Membership Subscription'),('currency','MYR'),('paymentOption','1'),('confirmedPaymentRequired','PROCESSEDANDCONFIRMED');
/*!40000 ALTER TABLE `bk078_qunilicense_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_finder_links_termsa`
--

DROP TABLE IF EXISTS `bk078_finder_links_termsa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_finder_links_termsa` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_finder_links_termsa`
--

LOCK TABLES `bk078_finder_links_termsa` WRITE;
/*!40000 ALTER TABLE `bk078_finder_links_termsa` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_finder_links_termsa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_finder_links_termsb`
--

DROP TABLE IF EXISTS `bk078_finder_links_termsb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_finder_links_termsb` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_finder_links_termsb`
--

LOCK TABLES `bk078_finder_links_termsb` WRITE;
/*!40000 ALTER TABLE `bk078_finder_links_termsb` DISABLE KEYS */;
INSERT INTO `bk078_finder_links_termsb` VALUES (64,4167,0.32669),(64,4168,0.95669),(64,4169,1.07331),(65,4232,0.56),(65,4233,1.09669),(65,4234,1.16669),(65,4235,1.00331),(65,4236,1.07331),(67,4587,0.23331),(67,4588,0.93331),(67,4589,1.00331),(67,4590,0.32669),(67,4591,1.05),(67,4592,1.14331),(67,4593,0.93338),(67,4594,1.12),(67,4595,1.26),(67,4596,1.05),(67,4597,1.16669),(67,4598,0.23331),(67,4599,1.05),(67,4600,1.12),(67,4601,0.42),(67,4602,1.05),(67,4603,1.14331),(68,4324,1.48);
/*!40000 ALTER TABLE `bk078_finder_links_termsb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_finder_links_termsc`
--

DROP TABLE IF EXISTS `bk078_finder_links_termsc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_finder_links_termsc` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_finder_links_termsc`
--

LOCK TABLES `bk078_finder_links_termsc` WRITE;
/*!40000 ALTER TABLE `bk078_finder_links_termsc` DISABLE KEYS */;
INSERT INTO `bk078_finder_links_termsc` VALUES (11,1578,0.34),(12,1583,0.34),(64,2,0.17),(64,4122,0.42),(64,4123,1.72662),(64,4124,1.96),(64,4125,0.42),(64,4126,1.77338),(64,4127,2.1),(64,4128,0.28),(64,4129,0.98),(64,4130,1.09669),(64,4131,0.18669),(64,4132,1.02669),(64,4133,1.09669),(65,1598,0.14),(65,4196,0.51),(65,4197,0.88669),(65,4198,0.95669),(66,4318,0.51),(67,4321,0.51),(67,4327,0.56),(67,4328,0.98),(67,4329,1.07331),(67,4330,0.28),(67,4331,0.93331),(67,4332,1.07331),(67,4333,0.18669),(67,4334,0.98),(67,4335,1.14331),(68,4323,0.51),(69,4325,0.51);
/*!40000 ALTER TABLE `bk078_finder_links_termsc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_update_sites_extensions`
--

DROP TABLE IF EXISTS `bk078_update_sites_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_update_sites_extensions` (
  `update_site_id` int(11) NOT NULL DEFAULT '0',
  `extension_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`update_site_id`,`extension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Links extensions to update sites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_update_sites_extensions`
--

LOCK TABLES `bk078_update_sites_extensions` WRITE;
/*!40000 ALTER TABLE `bk078_update_sites_extensions` DISABLE KEYS */;
INSERT INTO `bk078_update_sites_extensions` VALUES (1,700),(2,700),(6,10023),(10,10096),(14,600),(14,10207),(16,10038),(17,10111),(19,10201);
/*!40000 ALTER TABLE `bk078_update_sites_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_user_profiles`
--

DROP TABLE IF EXISTS `bk078_user_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_user_profiles` (
  `user_id` int(11) NOT NULL,
  `profile_key` varchar(100) NOT NULL,
  `profile_value` varchar(255) NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Simple user profile storage table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_user_profiles`
--

LOCK TABLES `bk078_user_profiles` WRITE;
/*!40000 ALTER TABLE `bk078_user_profiles` DISABLE KEYS */;
INSERT INTO `bk078_user_profiles` VALUES (368,'profile.aboutme','\"\"',10),(368,'profile.address1','\"\"',1),(368,'profile.address2','\"\"',2),(368,'profile.city','\"\"',3),(368,'profile.country','\"\"',5),(368,'profile.dob','\"\"',11),(368,'profile.favoritebook','\"\"',9),(368,'profile.phone','\"\"',7),(368,'profile.postal_code','\"\"',6),(368,'profile.region','\"\"',4),(368,'profile.website','\"\"',8);
/*!40000 ALTER TABLE `bk078_user_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_modules_menu`
--

DROP TABLE IF EXISTS `bk078_modules_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_modules_menu`
--

LOCK TABLES `bk078_modules_menu` WRITE;
/*!40000 ALTER TABLE `bk078_modules_menu` DISABLE KEYS */;
INSERT INTO `bk078_modules_menu` VALUES (2,0),(3,0),(4,0),(6,0),(7,0),(8,0),(9,0),(10,0),(12,0),(13,0),(14,0),(15,0),(79,0),(80,117),(80,171),(81,101),(83,101),(85,0),(86,0),(87,0),(90,117),(91,114),(94,101),(96,0),(97,117),(97,171),(98,0),(99,0),(100,0),(103,0),(113,101),(115,0),(116,0),(117,0),(118,101),(119,118),(119,119),(119,120),(119,121),(120,116),(120,122),(120,123),(120,126),(120,127),(121,117),(122,114),(123,101),(128,0),(129,0);
/*!40000 ALTER TABLE `bk078_modules_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_comprofiler_fields`
--

DROP TABLE IF EXISTS `bk078_comprofiler_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_comprofiler_fields` (
  `fieldid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `tablecolumns` text NOT NULL,
  `table` varchar(50) NOT NULL DEFAULT '#__comprofiler',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `type` varchar(50) NOT NULL DEFAULT '',
  `maxlength` int(11) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `required` tinyint(4) DEFAULT '0',
  `tabid` int(11) DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  `cols` int(11) DEFAULT NULL,
  `rows` int(11) DEFAULT NULL,
  `value` varchar(50) DEFAULT NULL,
  `default` mediumtext,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `registration` tinyint(1) NOT NULL DEFAULT '0',
  `profile` tinyint(1) NOT NULL DEFAULT '1',
  `displaytitle` tinyint(1) NOT NULL DEFAULT '1',
  `readonly` tinyint(1) NOT NULL DEFAULT '0',
  `searchable` tinyint(1) NOT NULL DEFAULT '0',
  `calculated` tinyint(1) NOT NULL DEFAULT '0',
  `sys` tinyint(4) NOT NULL DEFAULT '0',
  `pluginid` int(11) NOT NULL DEFAULT '0',
  `params` mediumtext,
  PRIMARY KEY (`fieldid`),
  KEY `tabid_pub_prof_order` (`tabid`,`published`,`profile`,`ordering`),
  KEY `readonly_published_tabid` (`readonly`,`published`,`tabid`),
  KEY `registration_published_order` (`registration`,`published`,`ordering`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_comprofiler_fields`
--

LOCK TABLES `bk078_comprofiler_fields` WRITE;
/*!40000 ALTER TABLE `bk078_comprofiler_fields` DISABLE KEYS */;
INSERT INTO `bk078_comprofiler_fields` VALUES (41,'name','name','#__users','_UE_NAME','_UE_REGWARN_NAME','predefined',NULL,NULL,1,11,-51,NULL,NULL,NULL,NULL,1,1,0,1,0,1,1,1,1,NULL),(26,'onlinestatus','','#__comprofiler','_UE_ONLINESTATUS','','status',NULL,NULL,0,21,-21,NULL,NULL,NULL,NULL,1,0,1,1,0,0,1,1,1,NULL),(27,'lastvisitDate','lastvisitDate','#__users','_UE_LASTONLINE','','datetime',NULL,NULL,0,21,-19,NULL,NULL,NULL,NULL,1,0,1,1,1,0,1,1,1,'field_display_by=2'),(28,'registerDate','registerDate','#__users','_UE_MEMBERSINCE','','datetime',NULL,NULL,0,21,-20,NULL,NULL,NULL,NULL,1,0,1,1,1,0,1,1,1,'field_display_by=2'),(29,'avatar','avatar,avatarapproved','#__comprofiler','_UE_IMAGE','','image',NULL,NULL,0,20,1,NULL,NULL,NULL,NULL,1,0,1,0,0,0,1,1,1,NULL),(42,'username','username','#__users','_UE_UNAME','_UE_VALID_UNAME','predefined',NULL,NULL,1,11,-46,NULL,NULL,NULL,NULL,1,1,0,1,0,1,1,1,1,NULL),(45,'formatname','','#__comprofiler','_UE_FORMATNAME','','formatname',NULL,NULL,0,11,-52,NULL,NULL,NULL,NULL,1,0,1,0,1,0,1,1,1,NULL),(46,'firstname','firstname','#__comprofiler','_UE_YOUR_FNAME','_UE_REGWARN_FNAME','predefined',NULL,NULL,1,11,-50,NULL,NULL,NULL,NULL,0,1,0,1,0,0,1,1,1,NULL),(47,'middlename','middlename','#__comprofiler','_UE_YOUR_MNAME','_UE_REGWARN_MNAME','predefined',NULL,NULL,0,11,-49,NULL,NULL,NULL,NULL,0,1,0,1,0,0,1,1,1,NULL),(48,'lastname','lastname','#__comprofiler','_UE_YOUR_LNAME','_UE_REGWARN_LNAME','predefined',NULL,NULL,1,11,-48,NULL,NULL,NULL,NULL,0,1,0,1,0,0,1,1,1,NULL),(49,'lastupdatedate','lastupdatedate','#__comprofiler','_UE_LASTUPDATEDON','','datetime',NULL,NULL,0,21,-18,NULL,NULL,NULL,NULL,1,0,1,1,1,0,1,1,1,'field_display_by=2'),(50,'email','email','#__users','_UE_EMAIL','_UE_REGWARN_MAIL','primaryemailaddress',NULL,NULL,1,11,-47,NULL,NULL,NULL,NULL,1,1,0,1,0,0,1,1,1,NULL),(25,'hits','hits','#__comprofiler','_UE_HITS','_UE_HITS_DESC','counter',NULL,NULL,0,21,-22,NULL,NULL,NULL,NULL,1,0,1,1,1,0,1,1,1,NULL),(51,'password','password','#__users','_UE_PASS','_UE_VALID_PASS','password',50,NULL,1,11,-45,NULL,NULL,NULL,NULL,1,1,0,1,0,0,1,1,1,NULL),(52,'params','params','#__users','_UE_USERPARAMS','','userparams',NULL,NULL,0,11,-30,NULL,NULL,NULL,NULL,1,0,0,1,0,0,1,1,1,NULL),(24,'connections','','#__comprofiler','_UE_CONNECTION','','connections',NULL,NULL,0,21,-17,NULL,NULL,NULL,NULL,1,0,1,1,1,0,1,1,1,NULL),(23,'forumrank','','#__comprofiler','_UE_FORUM_FORUMRANKING','','forumstats',NULL,NULL,0,21,-16,NULL,NULL,NULL,NULL,1,0,1,1,1,0,1,1,4,NULL),(22,'forumposts','','#__comprofiler','_UE_FORUM_TOTALPOSTS','','forumstats',NULL,NULL,0,21,-15,NULL,NULL,NULL,NULL,1,0,1,1,1,0,1,1,4,NULL),(21,'forumkarma','','#__comprofiler','_UE_FORUM_KARMA','','forumstats',NULL,NULL,0,21,-14,NULL,NULL,NULL,NULL,1,0,1,1,1,0,1,1,4,NULL),(20,'forumsignature','','#__comprofiler','_UE_FB_SIGNATURE','','forumsettings',NULL,NULL,0,13,3,60,5,NULL,NULL,1,0,0,1,0,0,0,1,4,NULL),(19,'forumview','','#__comprofiler','_UE_FB_VIEWTYPE_TITLE','','forumsettings',NULL,NULL,1,13,2,NULL,NULL,NULL,'flat',1,0,0,1,0,0,0,1,4,NULL),(18,'forumorder','','#__comprofiler','_UE_FB_ORDERING_TITLE','','forumsettings',NULL,NULL,1,13,1,NULL,NULL,NULL,'0',1,0,0,1,0,0,0,1,4,NULL);
/*!40000 ALTER TABLE `bk078_comprofiler_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_qunipay_paymentmethods`
--

DROP TABLE IF EXISTS `bk078_qunipay_paymentmethods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_qunipay_paymentmethods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paymentoptionid` int(11) NOT NULL,
  `installedpaymentmethodid` varchar(64) NOT NULL,
  `published` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_qunipay_paymentmethods`
--

LOCK TABLES `bk078_qunipay_paymentmethods` WRITE;
/*!40000 ALTER TABLE `bk078_qunipay_paymentmethods` DISABLE KEYS */;
INSERT INTO `bk078_qunipay_paymentmethods` VALUES (1,1,'Dummy',1);
/*!40000 ALTER TABLE `bk078_qunipay_paymentmethods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_users`
--

DROP TABLE IF EXISTS `bk078_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `usertype` varchar(25) NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `lastResetTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of last password reset',
  `resetCount` int(11) NOT NULL DEFAULT '0' COMMENT 'Count of password resets since lastResetTime',
  PRIMARY KEY (`id`),
  KEY `usertype` (`usertype`),
  KEY `idx_name` (`name`),
  KEY `idx_block` (`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=369 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_users`
--

LOCK TABLES `bk078_users` WRITE;
/*!40000 ALTER TABLE `bk078_users` DISABLE KEYS */;
INSERT INTO `bk078_users` VALUES (42,'Demo User','demo','demouser@demolink.org','3ae86119d8d13b239a5d1b12170b96b7:bN3JIxgTGuKtqQr2g2Kl3pLaf3MzUvUo','deprecated',0,1,'2012-06-20 11:23:21','2012-06-21 06:48:47','0','{\"admin_style\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"helpsite\":\"\",\"timezone\":\"\"}','0000-00-00 00:00:00',0),(367,'Super User','admin','edward@enfonius.com','0095f5080dfd42e47342b4241f62b08b:qB2jG4pNH48d33BNuKGClJRBRuTxbaZJ','deprecated',0,1,'2012-10-13 14:22:11','2012-10-20 05:02:31','0','','0000-00-00 00:00:00',0),(368,'Edward Khor','liete123','mingzai1989@hotmail.com','1369d2998e09edb85b8b2f6d7e05e684:tdvrAuPBpv71KojKuCkGRX8BBoat5Qpg','Registered',0,0,'2012-10-15 00:26:47','2012-10-20 05:13:29','','{\"language\":\"\",\"editor\":\"\",\"timezone\":\"\"}','0000-00-00 00:00:00',0);
/*!40000 ALTER TABLE `bk078_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_simplemembership_group_joomgroup`
--

DROP TABLE IF EXISTS `bk078_simplemembership_group_joomgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_simplemembership_group_joomgroup` (
  `mgroup_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__simlemembership_groups.id',
  `jgroup_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__usergroups.id',
  PRIMARY KEY (`mgroup_id`,`jgroup_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_simplemembership_group_joomgroup`
--

LOCK TABLES `bk078_simplemembership_group_joomgroup` WRITE;
/*!40000 ALTER TABLE `bk078_simplemembership_group_joomgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_simplemembership_group_joomgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_template_styles`
--

DROP TABLE IF EXISTS `bk078_template_styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_template_styles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template` varchar(50) NOT NULL DEFAULT '',
  `client_id` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `home` char(7) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_template` (`template`),
  KEY `idx_home` (`home`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_template_styles`
--

LOCK TABLES `bk078_template_styles` WRITE;
/*!40000 ALTER TABLE `bk078_template_styles` DISABLE KEYS */;
INSERT INTO `bk078_template_styles` VALUES (2,'bluestork',1,'1','Bluestork - Default','{\"useRoundedCorners\":\"1\",\"showSiteName\":\"0\"}'),(3,'atomic',0,'0','Atomic - Default','{}'),(4,'beez_20',0,'0','Beez2 - Default','{\"wrapperSmall\":\"53\",\"wrapperLarge\":\"72\",\"logo\":\"images\\/joomla_black.gif\",\"sitetitle\":\"Joomla!\",\"sitedescription\":\"Open Source Content Management\",\"navposition\":\"left\",\"templatecolor\":\"personal\",\"html5\":\"0\"}'),(5,'hathor',1,'0','Hathor - Default','{\"showSiteName\":\"0\",\"colourChoice\":\"\",\"boldText\":\"0\"}'),(6,'beez5',0,'0','Beez5 - Default','{\"wrapperSmall\":\"53\",\"wrapperLarge\":\"72\",\"logo\":\"images\\/sampledata\\/fruitshop\\/fruits.gif\",\"sitetitle\":\"Joomla!\",\"sitedescription\":\"Open Source Content Management\",\"navposition\":\"left\",\"html5\":\"0\"}'),(19,'theme1141',0,'1','theme1141 - Splash','{\"master\":\"true\",\"current_id\":\"19\",\"template_full_name\":\"Gantry Template\",\"grid_system\":\"16\",\"template_prefix\":\"gantry-\",\"cookie_time\":\"31536000\",\"copy_lang_files_if_diff\":\"1\",\"cssstyle\":\"style1\",\"bgcolor\":\"#ededed\",\"top_row\":{\"row\":\"#ffffff\",\"container\":\"\"},\"header_row\":{\"row\":\"\",\"container\":\"\"},\"nav_row\":{\"row\":\"\",\"container\":\"\"},\"showcase_row\":{\"row\":\"\",\"container\":\"\"},\"utility_row\":{\"row\":\"\",\"container\":\"\"},\"feature_row\":{\"row\":\"\",\"container\":\"\"},\"maintop_row\":{\"row\":\"\",\"container\":\"\"},\"main_row\":{\"row\":\"\",\"container\":\"\"},\"mainbottom_row\":{\"row\":\"\",\"container\":\"\"},\"bottom_row\":{\"row\":\"\",\"container\":\"\"},\"footer_row\":{\"row\":\"#ffffff\",\"container\":\"\"},\"copyright_row\":{\"row\":\"#ffffff\",\"container\":\"\"},\"linkcolor\":{\"default\":\"#ffbc10\",\"hover\":\"#ffffff\"},\"more\":{\"default\":\"#070707\",\"bg\":\"#ffffff\",\"hover\":\"#ffffff\",\"bg_hover\":\"#ffbc10\"},\"button\":{\"default\":\"#070707\",\"bg\":\"#ffffff\",\"hover\":\"#ffffff\",\"bg_hover\":\"#ffbc10\"},\"top_menu\":{\"enabled\":\"1\",\"topMenuLink\":\"#ffffff\",\"topMenuLinkBg\":\"\",\"topMenuLink_hover\":\"#ffffff\",\"topMenuLink_hoverBg\":\"\"},\"top_menu_sub\":{\"enabled\":\"1\",\"topMenuLink\":\"#000000\",\"topMenuLinkBg\":\"#ffffff\",\"topMenuLink_hover\":\"#ffffff\",\"topMenuLink_hoverBg\":\"#eabf3f\",\"topMenu_sublevel\":\"#ffffff\"},\"colorset_1\":{\"color\":\"\",\"text\":\"\"},\"colorset_2\":{\"color\":\"\",\"text\":\"\"},\"colorset_3\":{\"color\":\"\",\"text\":\"\"},\"default_font\":{\"enabled\":\"1\",\"font_size\":\"12px\",\"line_height\":\"18px\",\"font_family\":\"tahoma\",\"color\":\"#e4e4e4\"},\"viewswitcher-priority\":\"1\",\"logo-priority\":\"2\",\"copyright-priority\":\"3\",\"styledeclaration-priority\":\"4\",\"fontsizer-priority\":\"5\",\"iphonegradients-priority\":\"6\",\"date-priority\":\"7\",\"totop-priority\":\"8\",\"systemmessages-priority\":\"9\",\"inactive-priority\":\"10\",\"iphoneimages-priority\":\"11\",\"morearticles-priority\":\"12\",\"smartload-priority\":\"13\",\"pagesuffix-priority\":\"14\",\"resetsettings-priority\":\"15\",\"analytics-priority\":\"16\",\"belatedpng-priority\":\"17\",\"fusionmenu-priority\":\"18\",\"ie6menu-priority\":\"19\",\"ie6warn-priority\":\"20\",\"jstools-priority\":\"21\",\"moduleoverlays-priority\":\"22\",\"rtl-priority\":\"23\",\"splitmenu-priority\":\"24\",\"suckerfishmenu-priority\":\"25\",\"touchmenu-priority\":\"26\",\"webfonts-priority\":\"27\",\"styledeclaration-enabled\":\"1\",\"userlogin\":{\"enabled\":\"1\",\"position\":\"top-b\",\"logintext\":\"Sign In\",\"logouttext\":\"Sign Out\"},\"logo\":{\"enabled\":\"1\",\"position\":\"top-a\",\"autosize\":\"1\",\"perstyle\":\"0\",\"css\":\"body #rt-logo\"},\"date\":{\"enabled\":\"0\",\"position\":\"top-d\",\"clientside\":\"0\",\"formats\":\"%A, %B %d, %Y\"},\"copyright\":{\"enabled\":\"1\",\"position\":\"footer-a\",\"text\":\"\"},\"smartload\":{\"enabled\":\"0\",\"text\":\"50\",\"ignores\":\"com_contact\",\"exclusion\":\"\"},\"totop\":{\"enabled\":\"1\",\"position\":\"copyright\",\"text\":\"Scroll to Top\"},\"systemmessages\":{\"enabled\":\"1\",\"position\":\"feature-a\"},\"resetsettings\":{\"enabled\":\"0\",\"position\":\"copyright\",\"text\":\"Reset Settings\"},\"ie6warn2\":{\"enabled\":\"1\",\"position\":\"iewarn\"},\"ie7warn2\":{\"enabled\":\"1\",\"position\":\"iewarn\"},\"analytics\":{\"enabled\":\"0\",\"code\":\"\"},\"counter\":{\"enabled\":\"1\",\"launchMonth\":\"12\",\"launchDay\":\"31\",\"launchHour\":\"23\",\"launchMin\":\"59\",\"launchSec\":\"59\"},\"menu\":{\"enabled\":\"1\",\"type\":\"fusionmenu\",\"fusionmenu\":{\"menutype\":\"mainmenu\",\"position\":\"header-a\",\"enable_js\":\"1\",\"opacity\":\"1\",\"effect\":\"slidefade\",\"hidedelay\":\"500\",\"menu-animation\":\"Circ.easeOut\",\"menu-duration\":\"300\",\"centered-offset\":\"0\",\"tweak-initial-x\":\"43\",\"tweak-initial-y\":\"-66\",\"tweak-subsequent-x\":\"1\",\"tweak-subsequent-y\":\"0\",\"tweak-width\":\"0\",\"tweak-height\":\"0\",\"enable-current-id\":\"0\",\"theme\":\"gantry-fusion\",\"limit_levels\":\"0\",\"startLevel\":\"0\",\"showAllChildren\":\"1\",\"class_sfx\":\"top\",\"cache\":\"0\",\"module_cache\":\"1\"},\"splitmenu\":{\"menutype\":\"mainmenu\",\"theme\":\"gantry-splitmenu\",\"cache\":\"0\",\"module_cache\":\"1\",\"mainmenu-position\":\"header-b\",\"mainmenu-limit_levels\":\"1\",\"mainmenu-startLevel\":\"0\",\"mainmenu-endLevel\":\"0\",\"mainmenu-class_sfx\":\"top\",\"submenu-position\":\"sidebar-a\",\"submenu-limit_levels\":\"1\",\"submenu-startLevel\":\"1\",\"submenu-endLevel\":\"9\",\"submenu-class_sfx\":\"\"}},\"top\":{\"layout\":\"a:1:{i:16;a:2:{i:1;a:1:{i:0;i:16;}i:2;a:2:{i:0;i:13;i:1;i:3;}}}\",\"showall\":\"0\",\"showmax\":\"6\"},\"header\":{\"layout\":\"a:1:{i:12;a:1:{i:2;a:2:{i:0;i:4;i:1;i:8;}}}\",\"showall\":\"0\",\"showmax\":\"2\"},\"showcase\":{\"layout\":\"3,3,3,3\",\"showall\":\"0\",\"showmax\":\"6\"},\"feature\":{\"layout\":\"3,3,3,3\",\"showall\":\"0\",\"showmax\":\"6\"},\"utility\":{\"layout\":\"3,3,3,3\",\"showall\":\"0\",\"showmax\":\"6\"},\"maintop\":{\"layout\":\"3,3,3,3\",\"showall\":\"0\",\"showmax\":\"6\"},\"mainbodyPosition\":\"a:1:{i:16;a:2:{i:1;a:1:{s:2:\\\"mb\\\";i:16;}i:2;a:2:{s:2:\\\"sa\\\";i:4;s:2:\\\"mb\\\";i:12;}}}\",\"mainbottom\":{\"layout\":\"3,3,3,3\",\"showall\":\"0\",\"showmax\":\"6\"},\"bottom\":{\"layout\":\"3,3,3,3\",\"showall\":\"0\",\"showmax\":\"6\"},\"footer\":{\"layout\":\"3,3,3,3\",\"showall\":\"0\",\"showmax\":\"6\"},\"cache\":{\"enabled\":\"1\",\"time\":\"900\"},\"gzipper\":{\"enabled\":\"0\",\"time\":\"600\",\"expirestime\":\"1440\",\"stripwhitespace\":\"1\"},\"inputstyling\":{\"enabled\":\"0\",\"exclusions\":\"\'.content_vote\'\"},\"component-enabled\":\"1\",\"pagesuffix-enabled\":\"0\",\"inactive\":{\"enabled\":\"1\",\"menuitem\":\"101\"}}'),(22,'rt_gantry',0,'0','rt_gantry - Default','{\"presets\":\"preset1\",\"master\":\"true\",\"current_id\":\"true\",\"template_full_name\":\"Gantry Template\",\"grid_system\":\"12\",\"template_prefix\":\"gantry-\",\"cookie_time\":\"31536000\",\"copy_lang_files_if_diff\":\"1\",\"cssstyle\":\"style1\",\"bgcolor\":\"#dddddd\",\"headercolor\":\"#111111\",\"bottomcolor\":\"#111111\",\"footercolor\":\"#666666\",\"linkcolor\":\"#cc0000\",\"webfonts\":{\"enabled\":\"0\",\"source\":\"google\"},\"font\":{\"family\":\"helvetica\",\"size\":\"default\",\"size-is\":\"default\"},\"viewswitcher-priority\":\"1\",\"logo-priority\":\"2\",\"copyright-priority\":\"3\",\"styledeclaration-priority\":\"4\",\"fontsizer-priority\":\"5\",\"iphonegradients-priority\":\"6\",\"date-priority\":\"7\",\"totop-priority\":\"8\",\"systemmessages-priority\":\"9\",\"inactive-priority\":\"10\",\"iphoneimages-priority\":\"11\",\"morearticles-priority\":\"12\",\"smartload-priority\":\"13\",\"pagesuffix-priority\":\"14\",\"resetsettings-priority\":\"15\",\"analytics-priority\":\"16\",\"belatedpng-priority\":\"17\",\"fusionmenu-priority\":\"18\",\"ie6menu-priority\":\"19\",\"ie6warn-priority\":\"20\",\"jstools-priority\":\"21\",\"moduleoverlays-priority\":\"22\",\"rtl-priority\":\"23\",\"splitmenu-priority\":\"24\",\"suckerfishmenu-priority\":\"25\",\"touchmenu-priority\":\"26\",\"webfonts-priority\":\"27\",\"styledeclaration-enabled\":\"1\",\"logo\":{\"enabled\":\"1\",\"position\":\"header-a\",\"autosize\":\"0\",\"perstyle\":\"0\",\"css\":\"body #rt-logo\"},\"date\":{\"enabled\":\"0\",\"position\":\"top-d\",\"clientside\":\"0\",\"formats\":\"%A, %B %d, %Y\"},\"fontsizer\":{\"enabled\":\"0\",\"position\":\"feature-b\"},\"copyright\":{\"enabled\":\"1\",\"position\":\"copyright\",\"text\":\"Designed by RocketTheme\"},\"smartload\":{\"enabled\":\"0\",\"text\":\"50\",\"ignores\":\"com_contact\",\"exclusion\":\"\"},\"totop\":{\"enabled\":\"1\",\"position\":\"copyright\",\"text\":\"Scroll to Top\"},\"systemmessages\":{\"enabled\":\"1\",\"position\":\"feature-a\"},\"resetsettings\":{\"enabled\":\"0\",\"position\":\"copyright\",\"text\":\"Reset Settings\"},\"ie6warn\":{\"enabled\":\"1\",\"delay\":\"2000\"},\"analytics\":{\"enabled\":\"0\",\"code\":\"\"},\"menu\":{\"enabled\":\"1\",\"type\":\"fusionmenu\",\"fusionmenu\":{\"menutype\":\"mainmenu\",\"position\":\"header-b\",\"enable_js\":\"1\",\"opacity\":\"1\",\"effect\":\"slidefade\",\"hidedelay\":\"500\",\"menu-animation\":\"Circ.easeOut\",\"menu-duration\":\"300\",\"centered-offset\":\"0\",\"tweak-initial-x\":\"-10\",\"tweak-initial-y\":\"-13\",\"tweak-subsequent-x\":\"0\",\"tweak-subsequent-y\":\"0\",\"tweak-width\":\"20\",\"tweak-height\":\"20\",\"enable-current-id\":\"0\",\"theme\":\"gantry-fusion\",\"limit_levels\":\"0\",\"startLevel\":\"0\",\"showAllChildren\":\"1\",\"class_sfx\":\"top\",\"cache\":\"0\",\"module_cache\":\"1\"},\"splitmenu\":{\"menutype\":\"mainmenu\",\"theme\":\"gantry-splitmenu\",\"cache\":\"0\",\"module_cache\":\"1\",\"mainmenu-position\":\"header-b\",\"mainmenu-limit_levels\":\"1\",\"mainmenu-startLevel\":\"0\",\"mainmenu-endLevel\":\"0\",\"mainmenu-class_sfx\":\"top\",\"submenu-position\":\"sidebar-a\",\"submenu-limit_levels\":\"1\",\"submenu-startLevel\":\"1\",\"submenu-endLevel\":\"9\",\"submenu-class_sfx\":\"\"}},\"top\":{\"layout\":\"5,7\",\"showall\":\"0\",\"showmax\":\"6\"},\"header\":{\"layout\":\"3,3,3,3\",\"showall\":\"0\",\"showmax\":\"6\"},\"showcase\":{\"layout\":\"3,3,3,3\",\"showall\":\"0\",\"showmax\":\"6\"},\"feature\":{\"layout\":\"3,3,3,3\",\"showall\":\"0\",\"showmax\":\"6\"},\"utility\":{\"layout\":\"3,3,3,3\",\"showall\":\"0\",\"showmax\":\"6\"},\"maintop\":{\"layout\":\"3,3,3,3\",\"showall\":\"0\",\"showmax\":\"6\"},\"mainbodyPosition\":\"6,3,3\",\"mainbottom\":{\"layout\":\"3,3,3,3\",\"showall\":\"0\",\"showmax\":\"6\"},\"bottom\":{\"layout\":\"3,3,3,3\",\"showall\":\"0\",\"showmax\":\"6\"},\"footer\":{\"layout\":\"3,3,3,3\",\"showall\":\"0\",\"showmax\":\"6\"},\"iphone-enabled\":\"1\",\"android-enabled\":\"1\",\"iphone-scalable\":\"0\",\"iphone-switcher\":{\"enabled\":\"0\",\"position\":\"mobile-header\"},\"touchmenu\":{\"menutype\":\"mainmenu\",\"enabled\":\"1\",\"position\":\"mobile-navigation\",\"theme\":\"touch\",\"animation\":\"cube\",\"cache\":\"0\",\"module_cache\":\"1\",\"startLevel\":\"0\",\"endLevel\":\"20\",\"showAllChildren\":\"1\"},\"iphoneimages\":{\"enabled\":\"1\",\"minWidth\":\"80\",\"percentage\":\"33\"},\"iphone-header-gradient\":{\"from\":\"#545353\",\"to\":\"#262626\",\"fromopacity\":\"1\",\"toopacity\":\"1\",\"direction_start\":\"left-top\",\"direction_end\":\"left-bottom\"},\"iphone-showcase-gradient\":{\"from\":\"#ededed\",\"to\":\"#fff\",\"fromopacity\":\"1\",\"toopacity\":\"1\",\"direction_start\":\"left-top\",\"direction_end\":\"left-bottom\"},\"iphone-copyright-gradient\":{\"from\":\"#545353\",\"to\":\"#262626\",\"fromopacity\":\"1\",\"toopacity\":\"1\",\"direction_start\":\"left-top\",\"direction_end\":\"left-bottom\"},\"mobile\":{\"drawer\":\"drawer\",\"top\":\"top-a\",\"header\":\"header-a\",\"navigation\":\"mobile-navigation\",\"showcase\":\"mobile-showcase\",\"footer\":\"footer-a\",\"copyright\":\"copyright\"},\"cache\":{\"enabled\":\"1\",\"time\":\"900\"},\"gzipper\":{\"enabled\":\"0\",\"time\":\"600\",\"expirestime\":\"1440\",\"stripwhitespace\":\"1\"},\"inputstyling\":{\"enabled\":\"0\",\"exclusions\":\"\'.content_vote\'\"},\"component-enabled\":\"1\",\"rtl-enabled\":\"1\",\"buildspans-enabled\":\"1\",\"pagesuffix-enabled\":\"0\",\"inactive\":{\"enabled\":\"1\"}}'),(23,'theme1141',0,'0','theme1141 - Default','{\"master\":\"19\",\"current_id\":\"23\",\"menu\":{\"fusionmenu\":{\"position\":\"sidebar-a\",\"hidedelay\":\"800\",\"menu-duration\":\"800\"}}}');
/*!40000 ALTER TABLE `bk078_template_styles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_updates`
--

DROP TABLE IF EXISTS `bk078_updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_updates` (
  `update_id` int(11) NOT NULL AUTO_INCREMENT,
  `update_site_id` int(11) DEFAULT '0',
  `extension_id` int(11) DEFAULT '0',
  `categoryid` int(11) DEFAULT '0',
  `name` varchar(100) DEFAULT '',
  `description` text NOT NULL,
  `element` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `folder` varchar(20) DEFAULT '',
  `client_id` tinyint(3) DEFAULT '0',
  `version` varchar(10) DEFAULT '',
  `data` text NOT NULL,
  `detailsurl` text NOT NULL,
  `infourl` text NOT NULL,
  PRIMARY KEY (`update_id`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COMMENT='Available Updates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_updates`
--

LOCK TABLES `bk078_updates` WRITE;
/*!40000 ALTER TABLE `bk078_updates` DISABLE KEYS */;
INSERT INTO `bk078_updates` VALUES (11,14,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.7.3','','http://update.joomla.org/language/details/da-DK_details.xml',''),(12,14,0,0,'Khmer','','pkg_km-KH','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/km-KH_details.xml',''),(69,10,10096,0,'System - jQuery Easy','jQuery Easy Plugin - Check the release history before updating to get the latest recommendations','jqueryeasy','plugin','system',0,'1.3.0','','http://www.barejoomlatemplates.com/autoupdates/jqueryeasy/jqueryeasy-update.xml','http://www.simplifyyourweb.com/index.php/downloads/category/8-loading-jquery'),(68,6,10023,0,'K2','K2, the powerful content extension for Joomla! (by JoomlaWorks)','com_k2','component','',1,'2.6.1','','http://getk2.org/update.xml',''),(13,14,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/sv-SE_details.xml',''),(14,14,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/hu-HU_details.xml',''),(15,14,0,0,'Bulgarian','','pkg_bg-BG','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/bg-BG_details.xml',''),(16,14,0,0,'French','','pkg_fr-FR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/fr-FR_details.xml',''),(17,14,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/it-IT_details.xml',''),(18,14,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/es-ES_details.xml',''),(19,14,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/nl-NL_details.xml',''),(20,14,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/tr-TR_details.xml',''),(21,14,0,0,'Ukrainian','','pkg_uk-UA','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/uk-UA_details.xml',''),(22,14,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/sk-SK_details.xml',''),(23,14,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.6.1','','http://update.joomla.org/language/details/be-BY_details.xml',''),(24,14,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/lv-LV_details.xml',''),(25,14,0,0,'Estonian','','pkg_et-EE','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/et-EE_details.xml',''),(26,14,0,0,'Romanian','','pkg_ro-RO','package','',0,'2.5.5.1','','http://update.joomla.org/language/details/ro-RO_details.xml',''),(27,14,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/nl-BE_details.xml',''),(28,14,0,0,'Macedonian','','pkg_mk-MK','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/mk-MK_details.xml',''),(29,14,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/ja-JP_details.xml',''),(30,14,0,0,'Serbian Latin','','pkg_sr-YU','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/sr-YU_details.xml',''),(31,14,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/ar-AA_details.xml',''),(32,14,0,0,'German','','pkg_de-DE','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/de-DE_details.xml',''),(33,14,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/nb-NO_details.xml',''),(34,14,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/en-AU_details.xml',''),(35,14,0,0,'English US','','pkg_en-US','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/en-US_details.xml',''),(36,14,0,0,'Serbian Cyrillic','','pkg_sr-RS','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/sr-RS_details.xml',''),(37,14,0,0,'Lithuanian','','pkg_lt-LT','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/lt-LT_details.xml',''),(38,14,0,0,'Albanian','','pkg_sq-AL','package','',0,'2.5.1.5','','http://update.joomla.org/language/details/sq-AL_details.xml',''),(39,14,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/fa-IR_details.xml',''),(40,14,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/gl-ES_details.xml',''),(41,14,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/pl-PL_details.xml',''),(42,14,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/sy-IQ_details.xml',''),(43,14,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/ru-RU_details.xml',''),(44,14,0,0,'Hebrew','','pkg_he-IL','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/he-IL_details.xml',''),(45,14,0,0,'Laotian','','pkg_lo-LA','package','',0,'2.5.6.1','','http://update.joomla.org/language/details/lo-LA_details.xml',''),(46,14,0,0,'Afrikaans','','pkg_af-ZA','package','',0,'2.5.6.2','','http://update.joomla.org/language/details/af-ZA_details.xml',''),(48,14,0,0,'Greek','','pkg_el-GR','package','',0,'2.5.6.1','','http://update.joomla.org/language/details/el-GR_details.xml',''),(49,14,0,0,'Esperanto','','pkg_eo-XX','package','',0,'2.5.6.1','','http://update.joomla.org/language/details/eo-XX_details.xml',''),(50,14,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/fi-FI_details.xml',''),(51,14,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/pt-BR_details.xml',''),(52,14,0,0,'Chinese Traditional','','pkg_zh-TW','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/zh-TW_details.xml',''),(53,14,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/vi-VN_details.xml',''),(54,14,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml',''),(55,14,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/bs-BA_details.xml',''),(56,14,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/hr-HR_details.xml',''),(57,14,0,0,'Azeri','','pkg_az-AZ','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/az-AZ_details.xml',''),(58,14,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/nn-NO_details.xml',''),(59,14,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/ta-IN_details.xml',''),(60,14,0,0,'Scottish Gaelic','','pkg_gd-GB','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/gd-GB_details.xml',''),(61,14,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/th-TH_details.xml',''),(62,14,0,0,'Basque','','pkg_eu-ES','package','',0,'1.7.0.1','','http://update.joomla.org/language/details/eu-ES_details.xml',''),(63,14,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.6.1','','http://update.joomla.org/language/details/ug-CN_details.xml',''),(64,14,0,0,'Korean','','pkg_ko-KR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ko-KR_details.xml',''),(65,14,0,0,'Hindi','','pkg_hi-IN','package','',0,'2.5.6.1','','http://update.joomla.org/language/details/hi-IN_details.xml',''),(66,14,0,0,'Welsh','','pkg_cy-GB','package','',0,'2.5.6.1','','http://update.joomla.org/language/details/cy-GB_details.xml',''),(70,16,0,0,'RokBooster','','rokbooster','plugin','system',0,'1.0.2','','http://updates.rockettheme.com/joomla/plugins/rokbooster.xml',''),(71,16,0,0,'RokPad','','rokpad','plugin','editors',0,'2.0.4','','http://updates.rockettheme.com/joomla/plugins/rokpad.xml',''),(72,16,0,0,'RokSprocket','','mod_roksprocket','module','',0,'1.6.1','','http://updates.rockettheme.com/joomla/modules/roksprocket.xml','');
/*!40000 ALTER TABLE `bk078_updates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_qunipay_payments`
--

DROP TABLE IF EXISTS `bk078_qunipay_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_qunipay_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paymentidprefix` varchar(32) NOT NULL,
  `state` enum('INITIALIZED','STARTED','CANCELLED','TERMINATED','PROCESSED') NOT NULL,
  `initdate` datetime NOT NULL,
  `finishdate` datetime NOT NULL,
  `confirmdate` datetime NOT NULL,
  `confirmed` int(11) NOT NULL,
  `description` text NOT NULL,
  `currency` varchar(3) NOT NULL,
  `amount` float NOT NULL,
  `paymentmethod` varchar(64) NOT NULL,
  `paymentoptionid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `exported` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_qunipay_payments`
--

LOCK TABLES `bk078_qunipay_payments` WRITE;
/*!40000 ALTER TABLE `bk078_qunipay_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_qunipay_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_k2_comments`
--

DROP TABLE IF EXISTS `bk078_k2_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_k2_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `userName` varchar(255) NOT NULL,
  `commentDate` datetime NOT NULL,
  `commentText` text NOT NULL,
  `commentEmail` varchar(255) NOT NULL,
  `commentURL` varchar(255) NOT NULL,
  `published` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `itemID` (`itemID`),
  KEY `userID` (`userID`),
  KEY `published` (`published`),
  KEY `latestComments` (`published`,`commentDate`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_k2_comments`
--

LOCK TABLES `bk078_k2_comments` WRITE;
/*!40000 ALTER TABLE `bk078_k2_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_k2_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_travel_sales`
--

DROP TABLE IF EXISTS `bk078_travel_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_travel_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `payment` decimal(10,2) DEFAULT '0.00',
  `completed` tinyint(4) NOT NULL DEFAULT '0',
  `creation_date` date DEFAULT NULL,
  `modification_date` date DEFAULT NULL,
  `completion_date` date DEFAULT NULL,
  `total_commission` decimal(10,2) NOT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_travel_sales`
--

LOCK TABLES `bk078_travel_sales` WRITE;
/*!40000 ALTER TABLE `bk078_travel_sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_travel_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_k2_user_groups`
--

DROP TABLE IF EXISTS `bk078_k2_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_k2_user_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `permissions` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_k2_user_groups`
--

LOCK TABLES `bk078_k2_user_groups` WRITE;
/*!40000 ALTER TABLE `bk078_k2_user_groups` DISABLE KEYS */;
INSERT INTO `bk078_k2_user_groups` VALUES (1,'Administrators','{\"comment\":\"1\",\"frontEdit\":\"1\",\"add\":\"1\",\"editOwn\":\"1\",\"editAll\":\"1\",\"publish\":\"1\",\"inheritance\":\"1\",\"categories\":\"all\"}');
/*!40000 ALTER TABLE `bk078_k2_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_osmembership_fields`
--

DROP TABLE IF EXISTS `bk078_osmembership_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_osmembership_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_id` int(11) DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `field_type` tinyint(3) unsigned DEFAULT NULL,
  `required` tinyint(3) unsigned DEFAULT NULL,
  `values` text,
  `default_values` text,
  `rows` tinyint(3) unsigned DEFAULT NULL,
  `cols` tinyint(3) unsigned DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `css_class` varchar(50) DEFAULT NULL,
  `extra` varchar(255) DEFAULT NULL,
  `ordering` int(11) DEFAULT '0',
  `published` tinyint(3) unsigned DEFAULT NULL,
  `datatype_validation` tinyint(4) NOT NULL DEFAULT '0',
  `field_mapping` varchar(50) DEFAULT NULL,
  `is_core` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Core field',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_osmembership_fields`
--

LOCK TABLES `bk078_osmembership_fields` WRITE;
/*!40000 ALTER TABLE `bk078_osmembership_fields` DISABLE KEYS */;
INSERT INTO `bk078_osmembership_fields` VALUES (1,0,'first_name','First Name','',0,1,'','',0,0,25,'inputbox',NULL,1,1,0,'firstname',1),(2,0,'last_name','Last Name','',0,1,'','',0,0,25,'inputbox',NULL,2,1,0,'last_name',1),(3,0,'organization','Organization','',0,1,'','',0,0,50,'inputbox',NULL,3,0,0,'organization',1),(4,0,'address','Address','',0,1,'','',0,0,50,'inputbox',NULL,4,0,0,'address',1),(5,0,'address2','Address2','',0,1,'','',0,0,50,'inputbox',NULL,5,0,0,'address2',1),(6,0,'city','City','',0,1,'','',0,0,20,'inputbox',NULL,6,0,0,'city',1),(7,0,'state','State','',0,1,'','',0,0,20,'inputbox',NULL,7,0,0,'state',1),(8,0,'zip','Zip','',0,1,'','',0,0,10,'inputbox',NULL,8,0,0,'zip',1),(9,0,'country','Country','',2,1,'','',0,0,0,'inputbox',NULL,9,0,0,'country',1),(10,0,'phone','Phone','',0,1,'','',0,0,20,'inputbox',NULL,10,0,0,'phone',1),(12,0,'email','Email','',0,1,'','',0,0,35,'inputbox',NULL,12,1,3,'',1);
/*!40000 ALTER TABLE `bk078_osmembership_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_travel_carts`
--

DROP TABLE IF EXISTS `bk078_travel_carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_travel_carts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `params` text NOT NULL,
  `package_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_travel_carts`
--

LOCK TABLES `bk078_travel_carts` WRITE;
/*!40000 ALTER TABLE `bk078_travel_carts` DISABLE KEYS */;
INSERT INTO `bk078_travel_carts` VALUES (4,'',1,2,1),(5,'',1,1,368);
/*!40000 ALTER TABLE `bk078_travel_carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_user_usergroup_map`
--

DROP TABLE IF EXISTS `bk078_user_usergroup_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_user_usergroup_map` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__users.id',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__usergroups.id',
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_user_usergroup_map`
--

LOCK TABLES `bk078_user_usergroup_map` WRITE;
/*!40000 ALTER TABLE `bk078_user_usergroup_map` DISABLE KEYS */;
INSERT INTO `bk078_user_usergroup_map` VALUES (42,8),(367,8),(368,2);
/*!40000 ALTER TABLE `bk078_user_usergroup_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_travel_saleitems`
--

DROP TABLE IF EXISTS `bk078_travel_saleitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_travel_saleitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `params` text NOT NULL,
  `package_id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `comission_rate` decimal(10,2) NOT NULL,
  `comission_type` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_travel_saleitems`
--

LOCK TABLES `bk078_travel_saleitems` WRITE;
/*!40000 ALTER TABLE `bk078_travel_saleitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_travel_saleitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_finder_links`
--

DROP TABLE IF EXISTS `bk078_finder_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_finder_links` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `indexdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `md5sum` varchar(32) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `state` int(5) DEFAULT '1',
  `access` int(5) DEFAULT '0',
  `language` varchar(8) NOT NULL,
  `publish_start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `list_price` double unsigned NOT NULL DEFAULT '0',
  `sale_price` double unsigned NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL,
  `object` mediumblob NOT NULL,
  PRIMARY KEY (`link_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_title` (`title`),
  KEY `idx_md5` (`md5sum`),
  KEY `idx_url` (`url`(75)),
  KEY `idx_published_list` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`list_price`),
  KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`)
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_finder_links`
--

LOCK TABLES `bk078_finder_links` WRITE;
/*!40000 ALTER TABLE `bk078_finder_links` DISABLE KEYS */;
INSERT INTO `bk078_finder_links` VALUES (11,'index.php?option=com_rokcandy&view=category&id=10','index.php?option=com_content&view=category&id=10','Alert Boxes','','2012-07-17 17:49:49','3df94cd0c92fa1c6ad9c781be7d16d96',1,1,1,'*','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-17 14:49:49','0000-00-00 00:00:00',0,0,1,'O:19:\"FinderIndexerResult\":18:{s:11:\"\0*\0elements\";a:18:{s:2:\"id\";s:2:\"10\";s:5:\"alias\";s:11:\"alert-boxes\";s:7:\"summary\";s:0:\"\";s:9:\"extension\";s:12:\"com_rokcandy\";s:10:\"created_by\";s:2:\"64\";s:8:\"modified\";s:19:\"0000-00-00 00:00:00\";s:11:\"modified_by\";s:1:\"0\";s:7:\"metakey\";s:0:\"\";s:8:\"metadesc\";s:0:\"\";s:8:\"metadata\";O:9:\"JRegistry\":1:{s:7:\"\0*\0data\";O:8:\"stdClass\":2:{s:6:\"author\";s:0:\"\";s:6:\"robots\";s:0:\"\";}}s:3:\"lft\";s:2:\"17\";s:9:\"parent_id\";s:1:\"1\";s:5:\"level\";s:1:\"1\";s:6:\"params\";O:9:\"JRegistry\":1:{s:7:\"\0*\0data\";O:8:\"stdClass\":2:{s:15:\"category_layout\";s:0:\"\";s:5:\"image\";s:0:\"\";}}s:4:\"slug\";s:14:\"10:alert-boxes\";s:6:\"layout\";s:8:\"category\";s:10:\"metaauthor\";N;s:4:\"path\";s:42:\"index.php/component/content/category?id=10\";}s:15:\"\0*\0instructions\";a:5:{i:1;a:3:{i:0;s:5:\"title\";i:1;s:8:\"subtitle\";i:2;s:2:\"id\";}i:2;a:2:{i:0;s:7:\"summary\";i:1;s:4:\"body\";}i:3;a:8:{i:0;s:4:\"meta\";i:1;s:10:\"list_price\";i:2;s:10:\"sale_price\";i:3;s:4:\"link\";i:4;s:7:\"metakey\";i:5;s:8:\"metadesc\";i:6;s:10:\"metaauthor\";i:7;s:6:\"author\";}i:4;a:2:{i:0;s:4:\"path\";i:1;s:5:\"alias\";}i:5;a:1:{i:0;s:8:\"comments\";}}s:11:\"\0*\0taxonomy\";a:2:{s:4:\"Type\";a:1:{s:8:\"Category\";O:7:\"JObject\":4:{s:10:\"\0*\0_errors\";a:0:{}s:5:\"title\";s:8:\"Category\";s:5:\"state\";i:1;s:6:\"access\";i:1;}}s:8:\"Language\";a:1:{s:1:\"*\";O:7:\"JObject\":4:{s:10:\"\0*\0_errors\";a:0:{}s:5:\"title\";s:1:\"*\";s:5:\"state\";i:1;s:6:\"access\";i:1;}}}s:3:\"url\";s:49:\"index.php?option=com_rokcandy&view=category&id=10\";s:5:\"route\";s:48:\"index.php?option=com_content&view=category&id=10\";s:5:\"title\";s:11:\"Alert Boxes\";s:11:\"description\";s:0:\"\";s:9:\"published\";N;s:5:\"state\";i:1;s:6:\"access\";s:1:\"1\";s:8:\"language\";s:1:\"*\";s:18:\"publish_start_date\";s:19:\"0000-00-00 00:00:00\";s:16:\"publish_end_date\";s:19:\"0000-00-00 00:00:00\";s:10:\"start_date\";s:19:\"2012-07-17 14:49:49\";s:8:\"end_date\";s:19:\"0000-00-00 00:00:00\";s:10:\"list_price\";N;s:10:\"sale_price\";N;s:7:\"type_id\";i:1;}'),(12,'index.php?option=com_rokcandy&view=category&id=11','index.php?option=com_content&view=category&id=11','Fluid Columns','','2012-07-17 17:49:55','6622d1bb7afd057a1b3ee4cb65c61433',1,1,1,'*','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-07-17 14:49:55','0000-00-00 00:00:00',0,0,1,'O:19:\"FinderIndexerResult\":18:{s:11:\"\0*\0elements\";a:18:{s:2:\"id\";s:2:\"11\";s:5:\"alias\";s:13:\"fluid-columns\";s:7:\"summary\";s:0:\"\";s:9:\"extension\";s:12:\"com_rokcandy\";s:10:\"created_by\";s:2:\"64\";s:8:\"modified\";s:19:\"0000-00-00 00:00:00\";s:11:\"modified_by\";s:1:\"0\";s:7:\"metakey\";s:0:\"\";s:8:\"metadesc\";s:0:\"\";s:8:\"metadata\";O:9:\"JRegistry\":1:{s:7:\"\0*\0data\";O:8:\"stdClass\":2:{s:6:\"author\";s:0:\"\";s:6:\"robots\";s:0:\"\";}}s:3:\"lft\";s:2:\"19\";s:9:\"parent_id\";s:1:\"1\";s:5:\"level\";s:1:\"1\";s:6:\"params\";O:9:\"JRegistry\":1:{s:7:\"\0*\0data\";O:8:\"stdClass\":2:{s:15:\"category_layout\";s:0:\"\";s:5:\"image\";s:0:\"\";}}s:4:\"slug\";s:16:\"11:fluid-columns\";s:6:\"layout\";s:8:\"category\";s:10:\"metaauthor\";N;s:4:\"path\";s:42:\"index.php/component/content/category?id=11\";}s:15:\"\0*\0instructions\";a:5:{i:1;a:3:{i:0;s:5:\"title\";i:1;s:8:\"subtitle\";i:2;s:2:\"id\";}i:2;a:2:{i:0;s:7:\"summary\";i:1;s:4:\"body\";}i:3;a:8:{i:0;s:4:\"meta\";i:1;s:10:\"list_price\";i:2;s:10:\"sale_price\";i:3;s:4:\"link\";i:4;s:7:\"metakey\";i:5;s:8:\"metadesc\";i:6;s:10:\"metaauthor\";i:7;s:6:\"author\";}i:4;a:2:{i:0;s:4:\"path\";i:1;s:5:\"alias\";}i:5;a:1:{i:0;s:8:\"comments\";}}s:11:\"\0*\0taxonomy\";a:2:{s:4:\"Type\";a:1:{s:8:\"Category\";O:7:\"JObject\":4:{s:10:\"\0*\0_errors\";a:0:{}s:5:\"title\";s:8:\"Category\";s:5:\"state\";i:1;s:6:\"access\";i:1;}}s:8:\"Language\";a:1:{s:1:\"*\";O:7:\"JObject\":4:{s:10:\"\0*\0_errors\";a:0:{}s:5:\"title\";s:1:\"*\";s:5:\"state\";i:1;s:6:\"access\";i:1;}}}s:3:\"url\";s:49:\"index.php?option=com_rokcandy&view=category&id=11\";s:5:\"route\";s:48:\"index.php?option=com_content&view=category&id=11\";s:5:\"title\";s:13:\"Fluid Columns\";s:11:\"description\";s:0:\"\";s:9:\"published\";N;s:5:\"state\";i:1;s:6:\"access\";s:1:\"1\";s:8:\"language\";s:1:\"*\";s:18:\"publish_start_date\";s:19:\"0000-00-00 00:00:00\";s:16:\"publish_end_date\";s:19:\"0000-00-00 00:00:00\";s:10:\"start_date\";s:19:\"2012-07-17 14:49:55\";s:8:\"end_date\";s:19:\"0000-00-00 00:00:00\";s:10:\"list_price\";N;s:10:\"sale_price\";N;s:7:\"type_id\";i:1;}'),(65,'index.php?option=com_k2&view=item&id=105','index.php?option=com_k2&view=item&id=105:about-us&Itemid=101','About Us','The company is an online business necessities involving travel plan, and the background is more than 20 years of experience in the international travel to pick the company with the yo sent ground supporting to customers. Provided by ground travel is legal','2012-10-14 19:58:35','9a43f1a220c479afacc072d29282746b',1,1,1,'en-GB','2012-10-13 17:43:51','0000-00-00 00:00:00','2012-10-13 17:43:51','0000-00-00 00:00:00',0,0,6,'O:19:\"FinderIndexerResult\":18:{s:11:\"\0*\0elements\";a:25:{s:2:\"id\";s:3:\"105\";s:5:\"alias\";s:8:\"about-us\";s:7:\"summary\";s:391:\"<p>The company is an online business necessities involving travel plan, and the background is more than 20 years of experience in the international travel to pick the company with the yo sent ground supporting to customers. Provided by ground travel is legal, with and by the recognition.</p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\r\n<p> </p>\";s:4:\"body\";s:0:\"\";s:5:\"catid\";s:1:\"3\";s:10:\"created_by\";s:3:\"367\";s:16:\"created_by_alias\";s:0:\"\";s:8:\"modified\";s:19:\"2012-10-14 11:58:35\";s:11:\"modified_by\";s:3:\"367\";s:6:\"params\";O:9:\"JRegistry\":1:{s:7:\"\0*\0data\";O:8:\"stdClass\":137:{s:10:\"enable_css\";s:1:\"0\";s:14:\"jQueryHandling\";s:9:\"1.7remote\";s:21:\"backendJQueryHandling\";s:6:\"remote\";s:8:\"userName\";s:1:\"0\";s:9:\"userImage\";s:1:\"0\";s:15:\"userDescription\";s:1:\"0\";s:7:\"userURL\";s:1:\"0\";s:9:\"userEmail\";s:1:\"0\";s:12:\"userFeedLink\";s:1:\"0\";s:12:\"userFeedIcon\";s:1:\"0\";s:13:\"userItemCount\";s:2:\"10\";s:13:\"userItemTitle\";s:1:\"1\";s:19:\"userItemTitleLinked\";s:1:\"1\";s:19:\"userItemDateCreated\";s:1:\"1\";s:13:\"userItemImage\";s:1:\"1\";s:17:\"userItemIntroText\";s:1:\"1\";s:16:\"userItemCategory\";s:1:\"0\";s:12:\"userItemTags\";s:1:\"0\";s:22:\"userItemCommentsAnchor\";s:1:\"0\";s:16:\"userItemReadMore\";s:1:\"1\";s:17:\"userItemK2Plugins\";s:1:\"1\";s:18:\"defaultUsersItemid\";s:3:\"117\";s:12:\"tagItemCount\";s:2:\"10\";s:12:\"tagItemTitle\";s:1:\"1\";s:18:\"tagItemTitleLinked\";s:1:\"1\";s:18:\"tagItemDateCreated\";s:1:\"0\";s:12:\"tagItemImage\";s:1:\"1\";s:16:\"tagItemIntroText\";s:1:\"1\";s:15:\"tagItemCategory\";s:1:\"0\";s:15:\"tagItemReadMore\";s:1:\"1\";s:18:\"tagItemExtraFields\";s:1:\"0\";s:11:\"tagOrdering\";s:0:\"\";s:11:\"tagFeedLink\";s:1:\"0\";s:11:\"tagFeedIcon\";s:1:\"0\";s:17:\"defaultTagsItemid\";s:3:\"117\";s:16:\"genericItemCount\";s:2:\"10\";s:16:\"genericItemTitle\";s:1:\"1\";s:22:\"genericItemTitleLinked\";s:1:\"1\";s:22:\"genericItemDateCreated\";s:1:\"1\";s:16:\"genericItemImage\";s:1:\"1\";s:20:\"genericItemIntroText\";s:1:\"1\";s:19:\"genericItemCategory\";s:1:\"0\";s:19:\"genericItemReadMore\";s:1:\"1\";s:22:\"genericItemExtraFields\";s:1:\"0\";s:15:\"genericFeedLink\";s:1:\"0\";s:15:\"genericFeedIcon\";s:1:\"0\";s:9:\"feedLimit\";s:2:\"10\";s:13:\"feedItemImage\";s:1:\"1\";s:11:\"feedImgSize\";s:1:\"S\";s:17:\"feedItemIntroText\";s:1:\"1\";s:17:\"feedTextWordLimit\";s:0:\"\";s:16:\"feedItemFullText\";s:1:\"1\";s:12:\"feedItemTags\";s:1:\"0\";s:13:\"feedItemVideo\";s:1:\"0\";s:15:\"feedItemGallery\";s:1:\"0\";s:19:\"feedItemAttachments\";s:1:\"0\";s:14:\"feedBogusEmail\";s:0:\"\";s:16:\"introTextCleanup\";s:1:\"0\";s:27:\"introTextCleanupExcludeTags\";s:0:\"\";s:23:\"introTextCleanupTagAttr\";s:0:\"\";s:15:\"fullTextCleanup\";s:1:\"0\";s:26:\"fullTextCleanupExcludeTags\";s:0:\"\";s:22:\"fullTextCleanupTagAttr\";s:0:\"\";s:12:\"xssFiltering\";s:1:\"0\";s:14:\"linkPopupWidth\";s:3:\"900\";s:15:\"linkPopupHeight\";s:3:\"600\";s:13:\"imagesQuality\";s:3:\"100\";s:11:\"itemImageXS\";s:3:\"114\";s:10:\"itemImageS\";s:3:\"164\";s:10:\"itemImageM\";s:3:\"264\";s:10:\"itemImageL\";s:3:\"444\";s:11:\"itemImageXL\";s:3:\"940\";s:16:\"itemImageGeneric\";s:3:\"204\";s:13:\"catImageWidth\";s:3:\"100\";s:15:\"catImageDefault\";s:1:\"1\";s:14:\"userImageWidth\";s:3:\"100\";s:16:\"userImageDefault\";s:1:\"1\";s:17:\"commenterImgWidth\";s:2:\"66\";s:17:\"onlineImageEditor\";s:8:\"splashup\";s:14:\"imageTimestamp\";s:1:\"0\";s:16:\"imageMemoryLimit\";s:0:\"\";s:16:\"socialButtonCode\";s:832:\"<!-- AddThis Button BEGIN -->\r\n<div class=\"addthis_toolbox addthis_default_style addthis_32x32_style \">\r\n<a class=\"addthis_button_preferred_1\"></a>\r\n<a class=\"addthis_button_preferred_2\"></a>\r\n<a class=\"addthis_button_preferred_3\"></a>\r\n<a class=\"addthis_button_preferred_4\"></a>\r\n<a class=\"addthis_button_preferred_5\"></a>\r\n<a class=\"addthis_button_preferred_6\"></a>\r\n<a class=\"addthis_button_preferred_7\"></a>\r\n<a class=\"addthis_button_preferred_8\"></a>\r\n<a class=\"addthis_button_preferred_9\"></a>\r\n<a class=\"addthis_button_preferred_10\"></a>\r\n<a class=\"addthis_button_preferred_11\"></a>\r\n<a class=\"addthis_button_preferred_12\"></a>\r\n<a class=\"addthis_button_compact\"></a>\r\n</div>\r\n<script type=\"text/javascript\" src=\"http://s7.addthis.com/js/300/addthis_widget.js#pubid=xa-4efc06d355052c2c\"></script>\r\n<!-- AddThis Button END -->\";s:15:\"twitterUsername\";s:0:\"\";s:13:\"facebookImage\";s:6:\"XSmall\";s:8:\"comments\";s:1:\"1\";s:16:\"commentsOrdering\";s:4:\"DESC\";s:13:\"commentsLimit\";s:2:\"10\";s:20:\"commentsFormPosition\";s:5:\"below\";s:18:\"commentsPublishing\";s:1:\"0\";s:17:\"commentsReporting\";s:1:\"0\";s:23:\"commentsReportRecipient\";s:0:\"\";s:24:\"inlineCommentsModeration\";s:1:\"1\";s:8:\"gravatar\";s:1:\"0\";s:9:\"recaptcha\";s:1:\"0\";s:17:\"commentsFormNotes\";s:1:\"0\";s:21:\"commentsFormNotesText\";s:0:\"\";s:15:\"frontendEditing\";s:1:\"1\";s:12:\"showImageTab\";s:1:\"1\";s:19:\"showImageGalleryTab\";s:1:\"1\";s:12:\"showVideoTab\";s:1:\"1\";s:18:\"showExtraFieldsTab\";s:1:\"1\";s:18:\"showAttachmentsTab\";s:1:\"1\";s:13:\"showK2Plugins\";s:1:\"1\";s:22:\"sideBarDisplayFrontend\";s:1:\"0\";s:12:\"mergeEditors\";s:1:\"1\";s:14:\"sideBarDisplay\";s:1:\"1\";s:17:\"attachmentsFolder\";s:0:\"\";s:16:\"hideImportButton\";s:1:\"0\";s:13:\"taggingSystem\";s:1:\"1\";s:8:\"lockTags\";s:1:\"0\";s:13:\"showTagFilter\";s:1:\"0\";s:12:\"googleSearch\";s:1:\"0\";s:21:\"googleSearchContainer\";s:11:\"k2Container\";s:13:\"K2UserProfile\";s:1:\"1\";s:11:\"K2UserGroup\";s:1:\"1\";s:8:\"redirect\";s:3:\"176\";s:11:\"adminSearch\";s:6:\"simple\";s:12:\"cookieDomain\";s:0:\"\";s:20:\"recaptcha_public_key\";s:0:\"\";s:21:\"recaptcha_private_key\";s:0:\"\";s:15:\"recaptcha_theme\";s:5:\"clean\";s:23:\"recaptchaOnRegistration\";s:1:\"0\";s:13:\"stopForumSpam\";s:1:\"0\";s:19:\"stopForumSpamApiKey\";s:0:\"\";s:21:\"showItemsCounterAdmin\";s:1:\"1\";s:17:\"showChildCatItems\";s:1:\"1\";s:22:\"disableCompactOrdering\";s:1:\"0\";s:13:\"metaDescLimit\";s:3:\"150\";s:15:\"SEFReplacements\";s:583:\"Å |S, Å’|O, Å½|Z, Å¡|s, Å“|oe, Å¾|z, Å¸|Y, Â¥|Y, Âµ|u, Ã€|A, Ã�|A, Ã‚|A, Ãƒ|A, Ã„|A, Ã…|A, Ã†|A, Ã‡|C, Ãˆ|E, Ã‰|E, ÃŠ|E, Ã‹|E, ÃŒ|I, Ã�|I, ÃŽ|I, Ã�|I, Ã�|D, Ã‘|N, Ã’|O, Ã“|O, Ã”|O, Ã•|O, Ã–|O, Ã˜|O, Ã™|U, Ãš|U, Ã›|U, Ãœ|U, Ã�|Y, ÃŸ|s, Ã |a, Ã¡|a, Ã¢|a, Ã£|a, Ã¤|a, Ã¥|a, Ã¦|a, Ã§|c, Ã¨|e, Ã©|e, Ãª|e, Ã«|e, Ã¬|i, Ã­|i, Ã®|i, Ã¯|i, Ã°|o, Ã±|n, Ã²|o, Ã³|o, Ã´|o, Ãµ|o, Ã¶|o, Ã¸|o, Ã¹|u, Ãº|u, Ã»|u, Ã¼|u, Ã½|y, Ã¿|y, ÃŸ|ss\";s:16:\"sh404SefLabelCat\";s:0:\"\";s:17:\"sh404SefLabelUser\";s:4:\"blog\";s:17:\"sh404SefLabelItem\";s:1:\"2\";s:18:\"sh404SefTitleAlias\";s:5:\"alias\";s:29:\"sh404SefModK2ContentFeedAlias\";s:4:\"feed\";s:20:\"sh404SefInsertItemId\";s:1:\"0\";s:26:\"sh404SefInsertUniqueItemId\";s:1:\"0\";s:13:\"cbIntegration\";s:1:\"0\";}}s:7:\"metakey\";s:0:\"\";s:8:\"metadesc\";s:0:\"\";s:8:\"metadata\";O:9:\"JRegistry\":1:{s:7:\"\0*\0data\";O:8:\"stdClass\":2:{s:6:\"robots\";s:0:\"\";s:6:\"author\";s:0:\"\";}}s:8:\"ordering\";s:1:\"1\";s:5:\"trash\";s:1:\"0\";s:9:\"cat_trash\";s:1:\"0\";s:8:\"category\";s:5:\"About\";s:9:\"cat_state\";s:1:\"1\";s:10:\"cat_access\";s:1:\"1\";s:4:\"slug\";s:12:\"105:about-us\";s:7:\"catslug\";s:7:\"3:about\";s:6:\"author\";s:10:\"Super User\";s:6:\"layout\";s:4:\"item\";s:4:\"path\";s:18:\"index.php/about-us\";s:10:\"metaauthor\";N;}s:15:\"\0*\0instructions\";a:5:{i:1;a:3:{i:0;s:5:\"title\";i:1;s:8:\"subtitle\";i:2;s:2:\"id\";}i:2;a:2:{i:0;s:7:\"summary\";i:1;s:4:\"body\";}i:3;a:8:{i:0;s:4:\"meta\";i:1;s:10:\"list_price\";i:2;s:10:\"sale_price\";i:3;s:7:\"metakey\";i:4;s:8:\"metadesc\";i:5;s:10:\"metaauthor\";i:6;s:6:\"author\";i:7;s:16:\"created_by_alias\";}i:4;a:2:{i:0;s:4:\"path\";i:1;s:5:\"alias\";}i:5;a:1:{i:0;s:8:\"comments\";}}s:11:\"\0*\0taxonomy\";a:4:{s:4:\"Type\";a:1:{s:7:\"K2 Item\";O:7:\"JObject\":4:{s:10:\"\0*\0_errors\";a:0:{}s:5:\"title\";s:7:\"K2 Item\";s:5:\"state\";i:1;s:6:\"access\";i:1;}}s:6:\"Author\";a:1:{s:10:\"Super User\";O:7:\"JObject\":4:{s:10:\"\0*\0_errors\";a:0:{}s:5:\"title\";s:10:\"Super User\";s:5:\"state\";i:1;s:6:\"access\";i:1;}}s:11:\"K2 Category\";a:1:{s:5:\"About\";O:7:\"JObject\":4:{s:10:\"\0*\0_errors\";a:0:{}s:5:\"title\";s:5:\"About\";s:5:\"state\";i:1;s:6:\"access\";i:1;}}s:8:\"Language\";a:1:{s:5:\"en-GB\";O:7:\"JObject\":4:{s:10:\"\0*\0_errors\";a:0:{}s:5:\"title\";s:5:\"en-GB\";s:5:\"state\";i:1;s:6:\"access\";i:1;}}}s:3:\"url\";s:40:\"index.php?option=com_k2&view=item&id=105\";s:5:\"route\";s:60:\"index.php?option=com_k2&view=item&id=105:about-us&Itemid=101\";s:5:\"title\";s:8:\"About Us\";s:11:\"description\";s:285:\"The company is an online business necessities involving travel plan, and the background is more than 20 years of experience in the international travel to pick the company with the yo sent ground supporting to customers. Provided by ground travel is legal, with and by the recognition.\";s:9:\"published\";N;s:5:\"state\";i:1;s:6:\"access\";s:1:\"1\";s:8:\"language\";s:5:\"en-GB\";s:18:\"publish_start_date\";s:19:\"2012-10-13 17:43:51\";s:16:\"publish_end_date\";s:19:\"0000-00-00 00:00:00\";s:10:\"start_date\";s:19:\"2012-10-13 17:43:51\";s:8:\"end_date\";s:19:\"0000-00-00 00:00:00\";s:10:\"list_price\";N;s:10:\"sale_price\";N;s:7:\"type_id\";i:6;}'),(66,'index.php?option=com_k2&view=item&id=106','index.php?option=com_k2&view=item&id=106:beijing&Itemid=199','Beijing','','2012-10-14 19:01:39','10d6b7f069d1f61405fa765bac8e36da',1,1,1,'*','2012-10-14 10:40:01','0000-00-00 00:00:00','2012-10-14 10:40:01','0000-00-00 00:00:00',0,0,6,'O:19:\"FinderIndexerResult\":18:{s:11:\"\0*\0elements\";a:25:{s:2:\"id\";s:3:\"106\";s:5:\"alias\";s:7:\"beijing\";s:7:\"summary\";s:0:\"\";s:4:\"body\";s:0:\"\";s:5:\"catid\";s:2:\"31\";s:10:\"created_by\";s:3:\"367\";s:16:\"created_by_alias\";s:0:\"\";s:8:\"modified\";s:19:\"2012-10-14 11:01:39\";s:11:\"modified_by\";s:3:\"367\";s:6:\"params\";O:9:\"JRegistry\":1:{s:7:\"\0*\0data\";O:8:\"stdClass\":137:{s:10:\"enable_css\";s:1:\"0\";s:14:\"jQueryHandling\";s:9:\"1.7remote\";s:21:\"backendJQueryHandling\";s:6:\"remote\";s:8:\"userName\";s:1:\"0\";s:9:\"userImage\";s:1:\"0\";s:15:\"userDescription\";s:1:\"0\";s:7:\"userURL\";s:1:\"0\";s:9:\"userEmail\";s:1:\"0\";s:12:\"userFeedLink\";s:1:\"0\";s:12:\"userFeedIcon\";s:1:\"0\";s:13:\"userItemCount\";s:2:\"10\";s:13:\"userItemTitle\";s:1:\"1\";s:19:\"userItemTitleLinked\";s:1:\"1\";s:19:\"userItemDateCreated\";s:1:\"1\";s:13:\"userItemImage\";s:1:\"1\";s:17:\"userItemIntroText\";s:1:\"1\";s:16:\"userItemCategory\";s:1:\"0\";s:12:\"userItemTags\";s:1:\"0\";s:22:\"userItemCommentsAnchor\";s:1:\"0\";s:16:\"userItemReadMore\";s:1:\"1\";s:17:\"userItemK2Plugins\";s:1:\"1\";s:18:\"defaultUsersItemid\";s:3:\"117\";s:12:\"tagItemCount\";s:2:\"10\";s:12:\"tagItemTitle\";s:1:\"1\";s:18:\"tagItemTitleLinked\";s:1:\"1\";s:18:\"tagItemDateCreated\";s:1:\"0\";s:12:\"tagItemImage\";s:1:\"1\";s:16:\"tagItemIntroText\";s:1:\"1\";s:15:\"tagItemCategory\";s:1:\"0\";s:15:\"tagItemReadMore\";s:1:\"1\";s:18:\"tagItemExtraFields\";s:1:\"0\";s:11:\"tagOrdering\";s:0:\"\";s:11:\"tagFeedLink\";s:1:\"0\";s:11:\"tagFeedIcon\";s:1:\"0\";s:17:\"defaultTagsItemid\";s:3:\"117\";s:16:\"genericItemCount\";s:2:\"10\";s:16:\"genericItemTitle\";s:1:\"1\";s:22:\"genericItemTitleLinked\";s:1:\"1\";s:22:\"genericItemDateCreated\";s:1:\"1\";s:16:\"genericItemImage\";s:1:\"1\";s:20:\"genericItemIntroText\";s:1:\"1\";s:19:\"genericItemCategory\";s:1:\"0\";s:19:\"genericItemReadMore\";s:1:\"1\";s:22:\"genericItemExtraFields\";s:1:\"0\";s:15:\"genericFeedLink\";s:1:\"0\";s:15:\"genericFeedIcon\";s:1:\"0\";s:9:\"feedLimit\";s:2:\"10\";s:13:\"feedItemImage\";s:1:\"1\";s:11:\"feedImgSize\";s:1:\"S\";s:17:\"feedItemIntroText\";s:1:\"1\";s:17:\"feedTextWordLimit\";s:0:\"\";s:16:\"feedItemFullText\";s:1:\"1\";s:12:\"feedItemTags\";s:1:\"0\";s:13:\"feedItemVideo\";s:1:\"0\";s:15:\"feedItemGallery\";s:1:\"0\";s:19:\"feedItemAttachments\";s:1:\"0\";s:14:\"feedBogusEmail\";s:0:\"\";s:16:\"introTextCleanup\";s:1:\"0\";s:27:\"introTextCleanupExcludeTags\";s:0:\"\";s:23:\"introTextCleanupTagAttr\";s:0:\"\";s:15:\"fullTextCleanup\";s:1:\"0\";s:26:\"fullTextCleanupExcludeTags\";s:0:\"\";s:22:\"fullTextCleanupTagAttr\";s:0:\"\";s:12:\"xssFiltering\";s:1:\"0\";s:14:\"linkPopupWidth\";s:3:\"900\";s:15:\"linkPopupHeight\";s:3:\"600\";s:13:\"imagesQuality\";s:3:\"100\";s:11:\"itemImageXS\";s:3:\"114\";s:10:\"itemImageS\";s:3:\"164\";s:10:\"itemImageM\";s:3:\"264\";s:10:\"itemImageL\";s:3:\"444\";s:11:\"itemImageXL\";s:3:\"940\";s:16:\"itemImageGeneric\";s:3:\"204\";s:13:\"catImageWidth\";s:3:\"100\";s:15:\"catImageDefault\";s:1:\"1\";s:14:\"userImageWidth\";s:3:\"100\";s:16:\"userImageDefault\";s:1:\"1\";s:17:\"commenterImgWidth\";s:2:\"66\";s:17:\"onlineImageEditor\";s:8:\"splashup\";s:14:\"imageTimestamp\";s:1:\"0\";s:16:\"imageMemoryLimit\";s:0:\"\";s:16:\"socialButtonCode\";s:832:\"<!-- AddThis Button BEGIN -->\r\n<div class=\"addthis_toolbox addthis_default_style addthis_32x32_style \">\r\n<a class=\"addthis_button_preferred_1\"></a>\r\n<a class=\"addthis_button_preferred_2\"></a>\r\n<a class=\"addthis_button_preferred_3\"></a>\r\n<a class=\"addthis_button_preferred_4\"></a>\r\n<a class=\"addthis_button_preferred_5\"></a>\r\n<a class=\"addthis_button_preferred_6\"></a>\r\n<a class=\"addthis_button_preferred_7\"></a>\r\n<a class=\"addthis_button_preferred_8\"></a>\r\n<a class=\"addthis_button_preferred_9\"></a>\r\n<a class=\"addthis_button_preferred_10\"></a>\r\n<a class=\"addthis_button_preferred_11\"></a>\r\n<a class=\"addthis_button_preferred_12\"></a>\r\n<a class=\"addthis_button_compact\"></a>\r\n</div>\r\n<script type=\"text/javascript\" src=\"http://s7.addthis.com/js/300/addthis_widget.js#pubid=xa-4efc06d355052c2c\"></script>\r\n<!-- AddThis Button END -->\";s:15:\"twitterUsername\";s:0:\"\";s:13:\"facebookImage\";s:6:\"XSmall\";s:8:\"comments\";s:1:\"1\";s:16:\"commentsOrdering\";s:4:\"DESC\";s:13:\"commentsLimit\";s:2:\"10\";s:20:\"commentsFormPosition\";s:5:\"below\";s:18:\"commentsPublishing\";s:1:\"0\";s:17:\"commentsReporting\";s:1:\"0\";s:23:\"commentsReportRecipient\";s:0:\"\";s:24:\"inlineCommentsModeration\";s:1:\"1\";s:8:\"gravatar\";s:1:\"0\";s:9:\"recaptcha\";s:1:\"0\";s:17:\"commentsFormNotes\";s:1:\"0\";s:21:\"commentsFormNotesText\";s:0:\"\";s:15:\"frontendEditing\";s:1:\"1\";s:12:\"showImageTab\";s:1:\"1\";s:19:\"showImageGalleryTab\";s:1:\"1\";s:12:\"showVideoTab\";s:1:\"1\";s:18:\"showExtraFieldsTab\";s:1:\"1\";s:18:\"showAttachmentsTab\";s:1:\"1\";s:13:\"showK2Plugins\";s:1:\"1\";s:22:\"sideBarDisplayFrontend\";s:1:\"0\";s:12:\"mergeEditors\";s:1:\"1\";s:14:\"sideBarDisplay\";s:1:\"1\";s:17:\"attachmentsFolder\";s:0:\"\";s:16:\"hideImportButton\";s:1:\"0\";s:13:\"taggingSystem\";s:1:\"1\";s:8:\"lockTags\";s:1:\"0\";s:13:\"showTagFilter\";s:1:\"0\";s:12:\"googleSearch\";s:1:\"0\";s:21:\"googleSearchContainer\";s:11:\"k2Container\";s:13:\"K2UserProfile\";s:1:\"1\";s:11:\"K2UserGroup\";s:1:\"1\";s:8:\"redirect\";s:3:\"176\";s:11:\"adminSearch\";s:6:\"simple\";s:12:\"cookieDomain\";s:0:\"\";s:20:\"recaptcha_public_key\";s:0:\"\";s:21:\"recaptcha_private_key\";s:0:\"\";s:15:\"recaptcha_theme\";s:5:\"clean\";s:23:\"recaptchaOnRegistration\";s:1:\"0\";s:13:\"stopForumSpam\";s:1:\"0\";s:19:\"stopForumSpamApiKey\";s:0:\"\";s:21:\"showItemsCounterAdmin\";s:1:\"1\";s:17:\"showChildCatItems\";s:1:\"1\";s:22:\"disableCompactOrdering\";s:1:\"0\";s:13:\"metaDescLimit\";s:3:\"150\";s:15:\"SEFReplacements\";s:583:\"Å |S, Å’|O, Å½|Z, Å¡|s, Å“|oe, Å¾|z, Å¸|Y, Â¥|Y, Âµ|u, Ã€|A, Ã�|A, Ã‚|A, Ãƒ|A, Ã„|A, Ã…|A, Ã†|A, Ã‡|C, Ãˆ|E, Ã‰|E, ÃŠ|E, Ã‹|E, ÃŒ|I, Ã�|I, ÃŽ|I, Ã�|I, Ã�|D, Ã‘|N, Ã’|O, Ã“|O, Ã”|O, Ã•|O, Ã–|O, Ã˜|O, Ã™|U, Ãš|U, Ã›|U, Ãœ|U, Ã�|Y, ÃŸ|s, Ã |a, Ã¡|a, Ã¢|a, Ã£|a, Ã¤|a, Ã¥|a, Ã¦|a, Ã§|c, Ã¨|e, Ã©|e, Ãª|e, Ã«|e, Ã¬|i, Ã­|i, Ã®|i, Ã¯|i, Ã°|o, Ã±|n, Ã²|o, Ã³|o, Ã´|o, Ãµ|o, Ã¶|o, Ã¸|o, Ã¹|u, Ãº|u, Ã»|u, Ã¼|u, Ã½|y, Ã¿|y, ÃŸ|ss\";s:16:\"sh404SefLabelCat\";s:0:\"\";s:17:\"sh404SefLabelUser\";s:4:\"blog\";s:17:\"sh404SefLabelItem\";s:1:\"2\";s:18:\"sh404SefTitleAlias\";s:5:\"alias\";s:29:\"sh404SefModK2ContentFeedAlias\";s:4:\"feed\";s:20:\"sh404SefInsertItemId\";s:1:\"0\";s:26:\"sh404SefInsertUniqueItemId\";s:1:\"0\";s:13:\"cbIntegration\";s:1:\"0\";}}s:7:\"metakey\";s:0:\"\";s:8:\"metadesc\";s:0:\"\";s:8:\"metadata\";O:9:\"JRegistry\":1:{s:7:\"\0*\0data\";O:8:\"stdClass\":2:{s:6:\"robots\";s:0:\"\";s:6:\"author\";s:0:\"\";}}s:8:\"ordering\";s:1:\"1\";s:5:\"trash\";s:1:\"0\";s:9:\"cat_trash\";s:1:\"0\";s:8:\"category\";s:11:\"Destination\";s:9:\"cat_state\";s:1:\"1\";s:10:\"cat_access\";s:1:\"1\";s:4:\"slug\";s:11:\"106:beijing\";s:7:\"catslug\";s:14:\"31:destination\";s:6:\"author\";s:10:\"Super User\";s:6:\"layout\";s:4:\"item\";s:4:\"path\";s:38:\"index.php/destination/item/106-beijing\";s:10:\"metaauthor\";N;}s:15:\"\0*\0instructions\";a:5:{i:1;a:3:{i:0;s:5:\"title\";i:1;s:8:\"subtitle\";i:2;s:2:\"id\";}i:2;a:2:{i:0;s:7:\"summary\";i:1;s:4:\"body\";}i:3;a:8:{i:0;s:4:\"meta\";i:1;s:10:\"list_price\";i:2;s:10:\"sale_price\";i:3;s:7:\"metakey\";i:4;s:8:\"metadesc\";i:5;s:10:\"metaauthor\";i:6;s:6:\"author\";i:7;s:16:\"created_by_alias\";}i:4;a:2:{i:0;s:4:\"path\";i:1;s:5:\"alias\";}i:5;a:1:{i:0;s:8:\"comments\";}}s:11:\"\0*\0taxonomy\";a:4:{s:4:\"Type\";a:1:{s:7:\"K2 Item\";O:7:\"JObject\":4:{s:10:\"\0*\0_errors\";a:0:{}s:5:\"title\";s:7:\"K2 Item\";s:5:\"state\";i:1;s:6:\"access\";i:1;}}s:6:\"Author\";a:1:{s:10:\"Super User\";O:7:\"JObject\":4:{s:10:\"\0*\0_errors\";a:0:{}s:5:\"title\";s:10:\"Super User\";s:5:\"state\";i:1;s:6:\"access\";i:1;}}s:11:\"K2 Category\";a:1:{s:11:\"Destination\";O:7:\"JObject\":4:{s:10:\"\0*\0_errors\";a:0:{}s:5:\"title\";s:11:\"Destination\";s:5:\"state\";i:1;s:6:\"access\";i:1;}}s:8:\"Language\";a:1:{s:1:\"*\";O:7:\"JObject\":4:{s:10:\"\0*\0_errors\";a:0:{}s:5:\"title\";s:1:\"*\";s:5:\"state\";i:1;s:6:\"access\";i:1;}}}s:3:\"url\";s:40:\"index.php?option=com_k2&view=item&id=106\";s:5:\"route\";s:59:\"index.php?option=com_k2&view=item&id=106:beijing&Itemid=199\";s:5:\"title\";s:7:\"Beijing\";s:11:\"description\";s:0:\"\";s:9:\"published\";N;s:5:\"state\";i:1;s:6:\"access\";s:1:\"1\";s:8:\"language\";s:1:\"*\";s:18:\"publish_start_date\";s:19:\"2012-10-14 10:40:01\";s:16:\"publish_end_date\";s:19:\"0000-00-00 00:00:00\";s:10:\"start_date\";s:19:\"2012-10-14 10:40:01\";s:8:\"end_date\";s:19:\"0000-00-00 00:00:00\";s:10:\"list_price\";N;s:10:\"sale_price\";N;s:7:\"type_id\";i:6;}'),(67,'index.php?option=com_k2&view=item&id=107','index.php?option=com_k2&view=item&id=107:taipei&Itemid=199','Taipei','Historically, Taipei has always been a place where cultures collide and coalesce.','2012-10-14 20:12:47','0628d5e5fca7db063234e35d076625f5',1,1,1,'*','2012-10-14 11:01:40','0000-00-00 00:00:00','2012-10-14 11:01:40','0000-00-00 00:00:00',0,0,6,'O:19:\"FinderIndexerResult\":18:{s:11:\"\0*\0elements\";a:25:{s:2:\"id\";s:3:\"107\";s:5:\"alias\";s:6:\"taipei\";s:7:\"summary\";s:92:\"<p>Historically, Taipei has always been a place where cultures collide and coalesce. </p>\r\n\";s:4:\"body\";s:1824:\"\r\n<p>The earliest archaeological evidence of human presence in Taipei was found in the Yuanshan Prehistoric Site (B.C. 5000) and the Zhishanyan Prehistoric Site (B.C. 1000-200). The two sites confirm the early human presence in Taipei and Taipei\'s past as a lake. Later, the Ketagalan group belonging to the Pingpu (\"Plains\") aboriginal tribes began to thrive in areas such as Danshui, Beitou and Bali.</p>\r\n<p>The Spanish arrived in Danshui from Keelung and built Fort Provintia (now known as the Hongmao Fort, or \"red-topped tower\" (red hair castle?). Shortly after, the Dutch invaded south Taiwan and fought for control of the island with Ming Dynasty general Koxinga, who was then stationed in Tainan. After defeating Koxinga’s forces, the Qing government assumed total control of Taiwan.</p>\r\n<p>Southern Chinese immigrants from Quanzhou, Zhangzhou, and Canton began to arrive in Mengjia, then Taiwan\'s largest port, in search of arable land. They fought constantly with the Pingpu tribe as well as among themselves for territory. These early immigrants built houses and temples that reflected a number of regional architectural styles.</p>\r\n<p>Construction of Taipei City was completed in the late 19th century during Emperor Guangxu\'s reign. The historical city gates that we see today were constructed during this period.</p>\r\n<p>Taiwan became a Japanese colony in 1895, after China lost the First Sino-Japanese War. Taiwan remained a Japanese colony until the end of WWII, when the mainland Chinese Nationalist government took over. The influx of Nationalist troops and personnel brought with them mainland Chinese culture to Taiwanese society.</p>\r\n<p>In recent years, increased immigration from Southeast Asia has further contributed to Taipei\'s ever more diversified cultural climate.</p>\r\n<p> </p>\r\n<p> </p>\";s:5:\"catid\";s:2:\"31\";s:10:\"created_by\";s:3:\"367\";s:16:\"created_by_alias\";s:0:\"\";s:8:\"modified\";s:19:\"2012-10-14 12:12:46\";s:11:\"modified_by\";s:3:\"367\";s:6:\"params\";O:9:\"JRegistry\":1:{s:7:\"\0*\0data\";O:8:\"stdClass\":137:{s:10:\"enable_css\";s:1:\"0\";s:14:\"jQueryHandling\";s:9:\"1.7remote\";s:21:\"backendJQueryHandling\";s:6:\"remote\";s:8:\"userName\";s:1:\"0\";s:9:\"userImage\";s:1:\"0\";s:15:\"userDescription\";s:1:\"0\";s:7:\"userURL\";s:1:\"0\";s:9:\"userEmail\";s:1:\"0\";s:12:\"userFeedLink\";s:1:\"0\";s:12:\"userFeedIcon\";s:1:\"0\";s:13:\"userItemCount\";s:2:\"10\";s:13:\"userItemTitle\";s:1:\"1\";s:19:\"userItemTitleLinked\";s:1:\"1\";s:19:\"userItemDateCreated\";s:1:\"1\";s:13:\"userItemImage\";s:1:\"1\";s:17:\"userItemIntroText\";s:1:\"1\";s:16:\"userItemCategory\";s:1:\"0\";s:12:\"userItemTags\";s:1:\"0\";s:22:\"userItemCommentsAnchor\";s:1:\"0\";s:16:\"userItemReadMore\";s:1:\"1\";s:17:\"userItemK2Plugins\";s:1:\"1\";s:18:\"defaultUsersItemid\";s:3:\"117\";s:12:\"tagItemCount\";s:2:\"10\";s:12:\"tagItemTitle\";s:1:\"1\";s:18:\"tagItemTitleLinked\";s:1:\"1\";s:18:\"tagItemDateCreated\";s:1:\"0\";s:12:\"tagItemImage\";s:1:\"1\";s:16:\"tagItemIntroText\";s:1:\"1\";s:15:\"tagItemCategory\";s:1:\"0\";s:15:\"tagItemReadMore\";s:1:\"1\";s:18:\"tagItemExtraFields\";s:1:\"0\";s:11:\"tagOrdering\";s:0:\"\";s:11:\"tagFeedLink\";s:1:\"0\";s:11:\"tagFeedIcon\";s:1:\"0\";s:17:\"defaultTagsItemid\";s:3:\"117\";s:16:\"genericItemCount\";s:2:\"10\";s:16:\"genericItemTitle\";s:1:\"1\";s:22:\"genericItemTitleLinked\";s:1:\"1\";s:22:\"genericItemDateCreated\";s:1:\"1\";s:16:\"genericItemImage\";s:1:\"1\";s:20:\"genericItemIntroText\";s:1:\"1\";s:19:\"genericItemCategory\";s:1:\"0\";s:19:\"genericItemReadMore\";s:1:\"1\";s:22:\"genericItemExtraFields\";s:1:\"0\";s:15:\"genericFeedLink\";s:1:\"0\";s:15:\"genericFeedIcon\";s:1:\"0\";s:9:\"feedLimit\";s:2:\"10\";s:13:\"feedItemImage\";s:1:\"1\";s:11:\"feedImgSize\";s:1:\"S\";s:17:\"feedItemIntroText\";s:1:\"1\";s:17:\"feedTextWordLimit\";s:0:\"\";s:16:\"feedItemFullText\";s:1:\"1\";s:12:\"feedItemTags\";s:1:\"0\";s:13:\"feedItemVideo\";s:1:\"0\";s:15:\"feedItemGallery\";s:1:\"0\";s:19:\"feedItemAttachments\";s:1:\"0\";s:14:\"feedBogusEmail\";s:0:\"\";s:16:\"introTextCleanup\";s:1:\"0\";s:27:\"introTextCleanupExcludeTags\";s:0:\"\";s:23:\"introTextCleanupTagAttr\";s:0:\"\";s:15:\"fullTextCleanup\";s:1:\"0\";s:26:\"fullTextCleanupExcludeTags\";s:0:\"\";s:22:\"fullTextCleanupTagAttr\";s:0:\"\";s:12:\"xssFiltering\";s:1:\"0\";s:14:\"linkPopupWidth\";s:3:\"900\";s:15:\"linkPopupHeight\";s:3:\"600\";s:13:\"imagesQuality\";s:3:\"100\";s:11:\"itemImageXS\";s:3:\"114\";s:10:\"itemImageS\";s:3:\"164\";s:10:\"itemImageM\";s:3:\"264\";s:10:\"itemImageL\";s:3:\"444\";s:11:\"itemImageXL\";s:3:\"940\";s:16:\"itemImageGeneric\";s:3:\"204\";s:13:\"catImageWidth\";s:3:\"100\";s:15:\"catImageDefault\";s:1:\"1\";s:14:\"userImageWidth\";s:3:\"100\";s:16:\"userImageDefault\";s:1:\"1\";s:17:\"commenterImgWidth\";s:2:\"66\";s:17:\"onlineImageEditor\";s:8:\"splashup\";s:14:\"imageTimestamp\";s:1:\"0\";s:16:\"imageMemoryLimit\";s:0:\"\";s:16:\"socialButtonCode\";s:832:\"<!-- AddThis Button BEGIN -->\r\n<div class=\"addthis_toolbox addthis_default_style addthis_32x32_style \">\r\n<a class=\"addthis_button_preferred_1\"></a>\r\n<a class=\"addthis_button_preferred_2\"></a>\r\n<a class=\"addthis_button_preferred_3\"></a>\r\n<a class=\"addthis_button_preferred_4\"></a>\r\n<a class=\"addthis_button_preferred_5\"></a>\r\n<a class=\"addthis_button_preferred_6\"></a>\r\n<a class=\"addthis_button_preferred_7\"></a>\r\n<a class=\"addthis_button_preferred_8\"></a>\r\n<a class=\"addthis_button_preferred_9\"></a>\r\n<a class=\"addthis_button_preferred_10\"></a>\r\n<a class=\"addthis_button_preferred_11\"></a>\r\n<a class=\"addthis_button_preferred_12\"></a>\r\n<a class=\"addthis_button_compact\"></a>\r\n</div>\r\n<script type=\"text/javascript\" src=\"http://s7.addthis.com/js/300/addthis_widget.js#pubid=xa-4efc06d355052c2c\"></script>\r\n<!-- AddThis Button END -->\";s:15:\"twitterUsername\";s:0:\"\";s:13:\"facebookImage\";s:6:\"XSmall\";s:8:\"comments\";s:1:\"1\";s:16:\"commentsOrdering\";s:4:\"DESC\";s:13:\"commentsLimit\";s:2:\"10\";s:20:\"commentsFormPosition\";s:5:\"below\";s:18:\"commentsPublishing\";s:1:\"0\";s:17:\"commentsReporting\";s:1:\"0\";s:23:\"commentsReportRecipient\";s:0:\"\";s:24:\"inlineCommentsModeration\";s:1:\"1\";s:8:\"gravatar\";s:1:\"0\";s:9:\"recaptcha\";s:1:\"0\";s:17:\"commentsFormNotes\";s:1:\"0\";s:21:\"commentsFormNotesText\";s:0:\"\";s:15:\"frontendEditing\";s:1:\"1\";s:12:\"showImageTab\";s:1:\"1\";s:19:\"showImageGalleryTab\";s:1:\"1\";s:12:\"showVideoTab\";s:1:\"1\";s:18:\"showExtraFieldsTab\";s:1:\"1\";s:18:\"showAttachmentsTab\";s:1:\"1\";s:13:\"showK2Plugins\";s:1:\"1\";s:22:\"sideBarDisplayFrontend\";s:1:\"0\";s:12:\"mergeEditors\";s:1:\"1\";s:14:\"sideBarDisplay\";s:1:\"1\";s:17:\"attachmentsFolder\";s:0:\"\";s:16:\"hideImportButton\";s:1:\"0\";s:13:\"taggingSystem\";s:1:\"1\";s:8:\"lockTags\";s:1:\"0\";s:13:\"showTagFilter\";s:1:\"0\";s:12:\"googleSearch\";s:1:\"0\";s:21:\"googleSearchContainer\";s:11:\"k2Container\";s:13:\"K2UserProfile\";s:1:\"1\";s:11:\"K2UserGroup\";s:1:\"1\";s:8:\"redirect\";s:3:\"176\";s:11:\"adminSearch\";s:6:\"simple\";s:12:\"cookieDomain\";s:0:\"\";s:20:\"recaptcha_public_key\";s:0:\"\";s:21:\"recaptcha_private_key\";s:0:\"\";s:15:\"recaptcha_theme\";s:5:\"clean\";s:23:\"recaptchaOnRegistration\";s:1:\"0\";s:13:\"stopForumSpam\";s:1:\"0\";s:19:\"stopForumSpamApiKey\";s:0:\"\";s:21:\"showItemsCounterAdmin\";s:1:\"1\";s:17:\"showChildCatItems\";s:1:\"1\";s:22:\"disableCompactOrdering\";s:1:\"0\";s:13:\"metaDescLimit\";s:3:\"150\";s:15:\"SEFReplacements\";s:583:\"Å |S, Å’|O, Å½|Z, Å¡|s, Å“|oe, Å¾|z, Å¸|Y, Â¥|Y, Âµ|u, Ã€|A, Ã�|A, Ã‚|A, Ãƒ|A, Ã„|A, Ã…|A, Ã†|A, Ã‡|C, Ãˆ|E, Ã‰|E, ÃŠ|E, Ã‹|E, ÃŒ|I, Ã�|I, ÃŽ|I, Ã�|I, Ã�|D, Ã‘|N, Ã’|O, Ã“|O, Ã”|O, Ã•|O, Ã–|O, Ã˜|O, Ã™|U, Ãš|U, Ã›|U, Ãœ|U, Ã�|Y, ÃŸ|s, Ã |a, Ã¡|a, Ã¢|a, Ã£|a, Ã¤|a, Ã¥|a, Ã¦|a, Ã§|c, Ã¨|e, Ã©|e, Ãª|e, Ã«|e, Ã¬|i, Ã­|i, Ã®|i, Ã¯|i, Ã°|o, Ã±|n, Ã²|o, Ã³|o, Ã´|o, Ãµ|o, Ã¶|o, Ã¸|o, Ã¹|u, Ãº|u, Ã»|u, Ã¼|u, Ã½|y, Ã¿|y, ÃŸ|ss\";s:16:\"sh404SefLabelCat\";s:0:\"\";s:17:\"sh404SefLabelUser\";s:4:\"blog\";s:17:\"sh404SefLabelItem\";s:1:\"2\";s:18:\"sh404SefTitleAlias\";s:5:\"alias\";s:29:\"sh404SefModK2ContentFeedAlias\";s:4:\"feed\";s:20:\"sh404SefInsertItemId\";s:1:\"0\";s:26:\"sh404SefInsertUniqueItemId\";s:1:\"0\";s:13:\"cbIntegration\";s:1:\"0\";}}s:7:\"metakey\";s:0:\"\";s:8:\"metadesc\";s:0:\"\";s:8:\"metadata\";O:9:\"JRegistry\":1:{s:7:\"\0*\0data\";O:8:\"stdClass\":2:{s:6:\"robots\";s:0:\"\";s:6:\"author\";s:0:\"\";}}s:8:\"ordering\";s:1:\"2\";s:5:\"trash\";s:1:\"0\";s:9:\"cat_trash\";s:1:\"0\";s:8:\"category\";s:11:\"Destination\";s:9:\"cat_state\";s:1:\"1\";s:10:\"cat_access\";s:1:\"1\";s:4:\"slug\";s:10:\"107:taipei\";s:7:\"catslug\";s:14:\"31:destination\";s:6:\"author\";s:10:\"Super User\";s:6:\"layout\";s:4:\"item\";s:4:\"path\";s:37:\"index.php/destination/item/107-taipei\";s:10:\"metaauthor\";N;}s:15:\"\0*\0instructions\";a:5:{i:1;a:3:{i:0;s:5:\"title\";i:1;s:8:\"subtitle\";i:2;s:2:\"id\";}i:2;a:2:{i:0;s:7:\"summary\";i:1;s:4:\"body\";}i:3;a:8:{i:0;s:4:\"meta\";i:1;s:10:\"list_price\";i:2;s:10:\"sale_price\";i:3;s:7:\"metakey\";i:4;s:8:\"metadesc\";i:5;s:10:\"metaauthor\";i:6;s:6:\"author\";i:7;s:16:\"created_by_alias\";}i:4;a:2:{i:0;s:4:\"path\";i:1;s:5:\"alias\";}i:5;a:1:{i:0;s:8:\"comments\";}}s:11:\"\0*\0taxonomy\";a:4:{s:4:\"Type\";a:1:{s:7:\"K2 Item\";O:7:\"JObject\":4:{s:10:\"\0*\0_errors\";a:0:{}s:5:\"title\";s:7:\"K2 Item\";s:5:\"state\";i:1;s:6:\"access\";i:1;}}s:6:\"Author\";a:1:{s:10:\"Super User\";O:7:\"JObject\":4:{s:10:\"\0*\0_errors\";a:0:{}s:5:\"title\";s:10:\"Super User\";s:5:\"state\";i:1;s:6:\"access\";i:1;}}s:11:\"K2 Category\";a:1:{s:11:\"Destination\";O:7:\"JObject\":4:{s:10:\"\0*\0_errors\";a:0:{}s:5:\"title\";s:11:\"Destination\";s:5:\"state\";i:1;s:6:\"access\";i:1;}}s:8:\"Language\";a:1:{s:1:\"*\";O:7:\"JObject\":4:{s:10:\"\0*\0_errors\";a:0:{}s:5:\"title\";s:1:\"*\";s:5:\"state\";i:1;s:6:\"access\";i:1;}}}s:3:\"url\";s:40:\"index.php?option=com_k2&view=item&id=107\";s:5:\"route\";s:58:\"index.php?option=com_k2&view=item&id=107:taipei&Itemid=199\";s:5:\"title\";s:6:\"Taipei\";s:11:\"description\";s:81:\"Historically, Taipei has always been a place where cultures collide and coalesce.\";s:9:\"published\";N;s:5:\"state\";i:1;s:6:\"access\";s:1:\"1\";s:8:\"language\";s:1:\"*\";s:18:\"publish_start_date\";s:19:\"2012-10-14 11:01:40\";s:16:\"publish_end_date\";s:19:\"0000-00-00 00:00:00\";s:10:\"start_date\";s:19:\"2012-10-14 11:01:40\";s:8:\"end_date\";s:19:\"0000-00-00 00:00:00\";s:10:\"list_price\";N;s:10:\"sale_price\";N;s:7:\"type_id\";i:6;}'),(68,'index.php?option=com_k2&view=item&id=108','index.php?option=com_k2&view=item&id=108:guilin&Itemid=199','Guilin','','2012-10-14 19:02:17','9ddb1030166fcbecd411b983045e06ce',1,1,1,'*','2012-10-14 11:02:00','0000-00-00 00:00:00','2012-10-14 11:02:00','0000-00-00 00:00:00',0,0,6,'O:19:\"FinderIndexerResult\":18:{s:11:\"\0*\0elements\";a:25:{s:2:\"id\";s:3:\"108\";s:5:\"alias\";s:6:\"guilin\";s:7:\"summary\";s:0:\"\";s:4:\"body\";s:0:\"\";s:5:\"catid\";s:2:\"31\";s:10:\"created_by\";s:3:\"367\";s:16:\"created_by_alias\";s:0:\"\";s:8:\"modified\";s:19:\"0000-00-00 00:00:00\";s:11:\"modified_by\";s:1:\"0\";s:6:\"params\";O:9:\"JRegistry\":1:{s:7:\"\0*\0data\";O:8:\"stdClass\":240:{s:10:\"enable_css\";s:1:\"0\";s:14:\"jQueryHandling\";s:9:\"1.7remote\";s:21:\"backendJQueryHandling\";s:6:\"remote\";s:8:\"userName\";s:1:\"0\";s:9:\"userImage\";s:1:\"0\";s:15:\"userDescription\";s:1:\"0\";s:7:\"userURL\";s:1:\"0\";s:9:\"userEmail\";s:1:\"0\";s:12:\"userFeedLink\";s:1:\"0\";s:12:\"userFeedIcon\";s:1:\"0\";s:13:\"userItemCount\";s:2:\"10\";s:13:\"userItemTitle\";s:1:\"1\";s:19:\"userItemTitleLinked\";s:1:\"1\";s:19:\"userItemDateCreated\";s:1:\"1\";s:13:\"userItemImage\";s:1:\"1\";s:17:\"userItemIntroText\";s:1:\"1\";s:16:\"userItemCategory\";s:1:\"0\";s:12:\"userItemTags\";s:1:\"0\";s:22:\"userItemCommentsAnchor\";s:1:\"0\";s:16:\"userItemReadMore\";s:1:\"1\";s:17:\"userItemK2Plugins\";s:1:\"1\";s:18:\"defaultUsersItemid\";s:3:\"117\";s:12:\"tagItemCount\";s:2:\"10\";s:12:\"tagItemTitle\";s:1:\"1\";s:18:\"tagItemTitleLinked\";s:1:\"1\";s:18:\"tagItemDateCreated\";s:1:\"0\";s:12:\"tagItemImage\";s:1:\"1\";s:16:\"tagItemIntroText\";s:1:\"1\";s:15:\"tagItemCategory\";s:1:\"0\";s:15:\"tagItemReadMore\";s:1:\"1\";s:18:\"tagItemExtraFields\";s:1:\"0\";s:11:\"tagOrdering\";s:0:\"\";s:11:\"tagFeedLink\";s:1:\"0\";s:11:\"tagFeedIcon\";s:1:\"0\";s:17:\"defaultTagsItemid\";s:3:\"117\";s:16:\"genericItemCount\";s:2:\"10\";s:16:\"genericItemTitle\";s:1:\"1\";s:22:\"genericItemTitleLinked\";s:1:\"1\";s:22:\"genericItemDateCreated\";s:1:\"1\";s:16:\"genericItemImage\";s:1:\"1\";s:20:\"genericItemIntroText\";s:1:\"1\";s:19:\"genericItemCategory\";s:1:\"0\";s:19:\"genericItemReadMore\";s:1:\"1\";s:22:\"genericItemExtraFields\";s:1:\"0\";s:15:\"genericFeedLink\";s:1:\"0\";s:15:\"genericFeedIcon\";s:1:\"0\";s:9:\"feedLimit\";s:2:\"10\";s:13:\"feedItemImage\";s:1:\"1\";s:11:\"feedImgSize\";s:1:\"S\";s:17:\"feedItemIntroText\";s:1:\"1\";s:17:\"feedTextWordLimit\";s:0:\"\";s:16:\"feedItemFullText\";s:1:\"1\";s:12:\"feedItemTags\";s:1:\"0\";s:13:\"feedItemVideo\";s:1:\"0\";s:15:\"feedItemGallery\";s:1:\"0\";s:19:\"feedItemAttachments\";s:1:\"0\";s:14:\"feedBogusEmail\";s:0:\"\";s:16:\"introTextCleanup\";s:1:\"0\";s:27:\"introTextCleanupExcludeTags\";s:0:\"\";s:23:\"introTextCleanupTagAttr\";s:0:\"\";s:15:\"fullTextCleanup\";s:1:\"0\";s:26:\"fullTextCleanupExcludeTags\";s:0:\"\";s:22:\"fullTextCleanupTagAttr\";s:0:\"\";s:12:\"xssFiltering\";s:1:\"0\";s:14:\"linkPopupWidth\";s:3:\"900\";s:15:\"linkPopupHeight\";s:3:\"600\";s:13:\"imagesQuality\";s:3:\"100\";s:11:\"itemImageXS\";s:3:\"114\";s:10:\"itemImageS\";s:3:\"164\";s:10:\"itemImageM\";s:3:\"264\";s:10:\"itemImageL\";s:3:\"444\";s:11:\"itemImageXL\";s:3:\"940\";s:16:\"itemImageGeneric\";s:3:\"204\";s:13:\"catImageWidth\";s:3:\"100\";s:15:\"catImageDefault\";s:1:\"1\";s:14:\"userImageWidth\";s:3:\"100\";s:16:\"userImageDefault\";s:1:\"1\";s:17:\"commenterImgWidth\";s:2:\"66\";s:17:\"onlineImageEditor\";s:8:\"splashup\";s:14:\"imageTimestamp\";s:1:\"0\";s:16:\"imageMemoryLimit\";s:0:\"\";s:16:\"socialButtonCode\";s:832:\"<!-- AddThis Button BEGIN -->\r\n<div class=\"addthis_toolbox addthis_default_style addthis_32x32_style \">\r\n<a class=\"addthis_button_preferred_1\"></a>\r\n<a class=\"addthis_button_preferred_2\"></a>\r\n<a class=\"addthis_button_preferred_3\"></a>\r\n<a class=\"addthis_button_preferred_4\"></a>\r\n<a class=\"addthis_button_preferred_5\"></a>\r\n<a class=\"addthis_button_preferred_6\"></a>\r\n<a class=\"addthis_button_preferred_7\"></a>\r\n<a class=\"addthis_button_preferred_8\"></a>\r\n<a class=\"addthis_button_preferred_9\"></a>\r\n<a class=\"addthis_button_preferred_10\"></a>\r\n<a class=\"addthis_button_preferred_11\"></a>\r\n<a class=\"addthis_button_preferred_12\"></a>\r\n<a class=\"addthis_button_compact\"></a>\r\n</div>\r\n<script type=\"text/javascript\" src=\"http://s7.addthis.com/js/300/addthis_widget.js#pubid=xa-4efc06d355052c2c\"></script>\r\n<!-- AddThis Button END -->\";s:15:\"twitterUsername\";s:0:\"\";s:13:\"facebookImage\";s:6:\"XSmall\";s:8:\"comments\";s:1:\"1\";s:16:\"commentsOrdering\";s:4:\"DESC\";s:13:\"commentsLimit\";s:2:\"10\";s:20:\"commentsFormPosition\";s:5:\"below\";s:18:\"commentsPublishing\";s:1:\"0\";s:17:\"commentsReporting\";s:1:\"0\";s:23:\"commentsReportRecipient\";s:0:\"\";s:24:\"inlineCommentsModeration\";s:1:\"1\";s:8:\"gravatar\";s:1:\"0\";s:9:\"recaptcha\";s:1:\"0\";s:17:\"commentsFormNotes\";s:1:\"0\";s:21:\"commentsFormNotesText\";s:0:\"\";s:15:\"frontendEditing\";s:1:\"1\";s:12:\"showImageTab\";s:1:\"1\";s:19:\"showImageGalleryTab\";s:1:\"1\";s:12:\"showVideoTab\";s:1:\"1\";s:18:\"showExtraFieldsTab\";s:1:\"1\";s:18:\"showAttachmentsTab\";s:1:\"1\";s:13:\"showK2Plugins\";s:1:\"1\";s:22:\"sideBarDisplayFrontend\";s:1:\"0\";s:12:\"mergeEditors\";s:1:\"1\";s:14:\"sideBarDisplay\";s:1:\"1\";s:17:\"attachmentsFolder\";s:0:\"\";s:16:\"hideImportButton\";s:1:\"0\";s:13:\"taggingSystem\";s:1:\"1\";s:8:\"lockTags\";s:1:\"0\";s:13:\"showTagFilter\";s:1:\"0\";s:12:\"googleSearch\";s:1:\"0\";s:21:\"googleSearchContainer\";s:11:\"k2Container\";s:13:\"K2UserProfile\";s:1:\"1\";s:11:\"K2UserGroup\";s:1:\"1\";s:8:\"redirect\";s:3:\"176\";s:11:\"adminSearch\";s:6:\"simple\";s:12:\"cookieDomain\";s:0:\"\";s:20:\"recaptcha_public_key\";s:0:\"\";s:21:\"recaptcha_private_key\";s:0:\"\";s:15:\"recaptcha_theme\";s:5:\"clean\";s:23:\"recaptchaOnRegistration\";s:1:\"0\";s:13:\"stopForumSpam\";s:1:\"0\";s:19:\"stopForumSpamApiKey\";s:0:\"\";s:21:\"showItemsCounterAdmin\";s:1:\"1\";s:17:\"showChildCatItems\";s:1:\"1\";s:22:\"disableCompactOrdering\";s:1:\"0\";s:13:\"metaDescLimit\";s:3:\"150\";s:15:\"SEFReplacements\";s:583:\"Å |S, Å’|O, Å½|Z, Å¡|s, Å“|oe, Å¾|z, Å¸|Y, Â¥|Y, Âµ|u, Ã€|A, Ã�|A, Ã‚|A, Ãƒ|A, Ã„|A, Ã…|A, Ã†|A, Ã‡|C, Ãˆ|E, Ã‰|E, ÃŠ|E, Ã‹|E, ÃŒ|I, Ã�|I, ÃŽ|I, Ã�|I, Ã�|D, Ã‘|N, Ã’|O, Ã“|O, Ã”|O, Ã•|O, Ã–|O, Ã˜|O, Ã™|U, Ãš|U, Ã›|U, Ãœ|U, Ã�|Y, ÃŸ|s, Ã |a, Ã¡|a, Ã¢|a, Ã£|a, Ã¤|a, Ã¥|a, Ã¦|a, Ã§|c, Ã¨|e, Ã©|e, Ãª|e, Ã«|e, Ã¬|i, Ã­|i, Ã®|i, Ã¯|i, Ã°|o, Ã±|n, Ã²|o, Ã³|o, Ã´|o, Ãµ|o, Ã¶|o, Ã¸|o, Ã¹|u, Ãº|u, Ã»|u, Ã¼|u, Ã½|y, Ã¿|y, ÃŸ|ss\";s:16:\"sh404SefLabelCat\";s:0:\"\";s:17:\"sh404SefLabelUser\";s:4:\"blog\";s:17:\"sh404SefLabelItem\";s:1:\"2\";s:18:\"sh404SefTitleAlias\";s:5:\"alias\";s:29:\"sh404SefModK2ContentFeedAlias\";s:4:\"feed\";s:20:\"sh404SefInsertItemId\";s:1:\"0\";s:26:\"sh404SefInsertUniqueItemId\";s:1:\"0\";s:13:\"cbIntegration\";s:1:\"0\";s:11:\"inheritFrom\";s:1:\"0\";s:17:\"num_leading_items\";s:1:\"2\";s:19:\"num_leading_columns\";s:1:\"1\";s:14:\"leadingImgSize\";s:5:\"Large\";s:17:\"num_primary_items\";s:1:\"4\";s:19:\"num_primary_columns\";s:1:\"2\";s:14:\"primaryImgSize\";s:6:\"Medium\";s:19:\"num_secondary_items\";s:1:\"4\";s:21:\"num_secondary_columns\";s:1:\"1\";s:16:\"secondaryImgSize\";s:5:\"Small\";s:9:\"num_links\";s:1:\"4\";s:17:\"num_links_columns\";s:1:\"1\";s:12:\"linksImgSize\";s:6:\"XSmall\";s:14:\"catCatalogMode\";s:1:\"0\";s:16:\"catFeaturedItems\";s:1:\"0\";s:13:\"catPagination\";s:1:\"0\";s:20:\"catPaginationResults\";s:1:\"0\";s:8:\"catTitle\";s:1:\"0\";s:19:\"catTitleItemCounter\";s:1:\"0\";s:14:\"catDescription\";s:1:\"0\";s:8:\"catImage\";s:1:\"0\";s:11:\"catFeedLink\";s:1:\"0\";s:11:\"catFeedIcon\";s:1:\"0\";s:13:\"subCategories\";s:1:\"1\";s:13:\"subCatColumns\";s:1:\"2\";s:11:\"subCatTitle\";s:1:\"1\";s:22:\"subCatTitleItemCounter\";s:1:\"1\";s:17:\"subCatDescription\";s:1:\"1\";s:11:\"subCatImage\";s:1:\"1\";s:12:\"catItemTitle\";s:1:\"1\";s:18:\"catItemTitleLinked\";s:1:\"1\";s:21:\"catItemFeaturedNotice\";s:1:\"0\";s:13:\"catItemAuthor\";s:1:\"1\";s:18:\"catItemDateCreated\";s:1:\"1\";s:13:\"catItemRating\";s:1:\"0\";s:12:\"catItemImage\";s:1:\"1\";s:16:\"catItemIntroText\";s:1:\"1\";s:18:\"catItemExtraFields\";s:1:\"0\";s:11:\"catItemHits\";s:1:\"0\";s:15:\"catItemCategory\";s:1:\"1\";s:11:\"catItemTags\";s:1:\"1\";s:18:\"catItemAttachments\";s:1:\"0\";s:25:\"catItemAttachmentsCounter\";s:1:\"0\";s:12:\"catItemVideo\";s:1:\"0\";s:20:\"catItemVideoAutoPlay\";s:1:\"0\";s:19:\"catItemImageGallery\";s:1:\"0\";s:19:\"catItemDateModified\";s:1:\"0\";s:15:\"catItemReadMore\";s:1:\"1\";s:21:\"catItemCommentsAnchor\";s:1:\"1\";s:16:\"catItemK2Plugins\";s:1:\"1\";s:15:\"itemDateCreated\";s:1:\"1\";s:9:\"itemTitle\";s:1:\"1\";s:18:\"itemFeaturedNotice\";s:1:\"1\";s:10:\"itemAuthor\";s:1:\"1\";s:15:\"itemFontResizer\";s:1:\"1\";s:15:\"itemPrintButton\";s:1:\"1\";s:15:\"itemEmailButton\";s:1:\"1\";s:16:\"itemSocialButton\";s:1:\"1\";s:15:\"itemVideoAnchor\";s:1:\"1\";s:22:\"itemImageGalleryAnchor\";s:1:\"1\";s:18:\"itemCommentsAnchor\";s:1:\"1\";s:10:\"itemRating\";s:1:\"1\";s:9:\"itemImage\";s:1:\"1\";s:11:\"itemImgSize\";s:5:\"Large\";s:20:\"itemImageMainCaption\";s:1:\"1\";s:20:\"itemImageMainCredits\";s:1:\"1\";s:13:\"itemIntroText\";s:1:\"1\";s:12:\"itemFullText\";s:1:\"1\";s:15:\"itemExtraFields\";s:1:\"1\";s:16:\"itemDateModified\";s:1:\"1\";s:8:\"itemHits\";s:1:\"1\";s:12:\"itemCategory\";s:1:\"1\";s:8:\"itemTags\";s:1:\"1\";s:15:\"itemAttachments\";s:1:\"1\";s:22:\"itemAttachmentsCounter\";s:1:\"1\";s:9:\"itemVideo\";s:1:\"1\";s:17:\"itemVideoAutoPlay\";s:1:\"0\";s:16:\"itemVideoCaption\";s:1:\"1\";s:16:\"itemVideoCredits\";s:1:\"1\";s:16:\"itemImageGallery\";s:1:\"1\";s:14:\"itemNavigation\";s:1:\"1\";s:12:\"itemComments\";s:1:\"1\";s:17:\"itemTwitterButton\";s:1:\"1\";s:18:\"itemFacebookButton\";s:1:\"1\";s:23:\"itemGooglePlusOneButton\";s:1:\"1\";s:15:\"itemAuthorBlock\";s:1:\"1\";s:15:\"itemAuthorImage\";s:1:\"1\";s:21:\"itemAuthorDescription\";s:1:\"1\";s:13:\"itemAuthorURL\";s:1:\"1\";s:15:\"itemAuthorEmail\";s:1:\"0\";s:16:\"itemAuthorLatest\";s:1:\"1\";s:21:\"itemAuthorLatestLimit\";s:1:\"5\";s:11:\"itemRelated\";s:1:\"1\";s:16:\"itemRelatedLimit\";s:1:\"5\";s:16:\"itemRelatedTitle\";s:1:\"1\";s:19:\"itemRelatedCategory\";s:1:\"0\";s:20:\"itemRelatedImageSize\";s:1:\"0\";s:20:\"itemRelatedIntrotext\";s:1:\"0\";s:19:\"itemRelatedFulltext\";s:1:\"0\";s:17:\"itemRelatedAuthor\";s:1:\"0\";s:16:\"itemRelatedMedia\";s:1:\"0\";s:23:\"itemRelatedImageGallery\";s:1:\"0\";s:13:\"itemK2Plugins\";s:1:\"1\";}}s:7:\"metakey\";s:0:\"\";s:8:\"metadesc\";s:0:\"\";s:8:\"metadata\";O:9:\"JRegistry\":1:{s:7:\"\0*\0data\";O:8:\"stdClass\":2:{s:6:\"robots\";s:0:\"\";s:6:\"author\";s:0:\"\";}}s:8:\"ordering\";s:1:\"3\";s:5:\"trash\";s:1:\"0\";s:9:\"cat_trash\";s:1:\"0\";s:8:\"category\";s:11:\"Destination\";s:9:\"cat_state\";s:1:\"1\";s:10:\"cat_access\";s:1:\"1\";s:4:\"slug\";s:10:\"108:guilin\";s:7:\"catslug\";s:14:\"31:destination\";s:6:\"author\";s:10:\"Super User\";s:6:\"layout\";s:4:\"item\";s:4:\"path\";s:37:\"index.php/destination/item/108-guilin\";s:10:\"metaauthor\";N;}s:15:\"\0*\0instructions\";a:5:{i:1;a:3:{i:0;s:5:\"title\";i:1;s:8:\"subtitle\";i:2;s:2:\"id\";}i:2;a:2:{i:0;s:7:\"summary\";i:1;s:4:\"body\";}i:3;a:8:{i:0;s:4:\"meta\";i:1;s:10:\"list_price\";i:2;s:10:\"sale_price\";i:3;s:7:\"metakey\";i:4;s:8:\"metadesc\";i:5;s:10:\"metaauthor\";i:6;s:6:\"author\";i:7;s:16:\"created_by_alias\";}i:4;a:2:{i:0;s:4:\"path\";i:1;s:5:\"alias\";}i:5;a:1:{i:0;s:8:\"comments\";}}s:11:\"\0*\0taxonomy\";a:4:{s:4:\"Type\";a:1:{s:7:\"K2 Item\";O:7:\"JObject\":4:{s:10:\"\0*\0_errors\";a:0:{}s:5:\"title\";s:7:\"K2 Item\";s:5:\"state\";i:1;s:6:\"access\";i:1;}}s:6:\"Author\";a:1:{s:10:\"Super User\";O:7:\"JObject\":4:{s:10:\"\0*\0_errors\";a:0:{}s:5:\"title\";s:10:\"Super User\";s:5:\"state\";i:1;s:6:\"access\";i:1;}}s:11:\"K2 Category\";a:1:{s:11:\"Destination\";O:7:\"JObject\":4:{s:10:\"\0*\0_errors\";a:0:{}s:5:\"title\";s:11:\"Destination\";s:5:\"state\";i:1;s:6:\"access\";i:1;}}s:8:\"Language\";a:1:{s:1:\"*\";O:7:\"JObject\":4:{s:10:\"\0*\0_errors\";a:0:{}s:5:\"title\";s:1:\"*\";s:5:\"state\";i:1;s:6:\"access\";i:1;}}}s:3:\"url\";s:40:\"index.php?option=com_k2&view=item&id=108\";s:5:\"route\";s:58:\"index.php?option=com_k2&view=item&id=108:guilin&Itemid=199\";s:5:\"title\";s:6:\"Guilin\";s:11:\"description\";s:0:\"\";s:9:\"published\";N;s:5:\"state\";i:1;s:6:\"access\";s:1:\"1\";s:8:\"language\";s:1:\"*\";s:18:\"publish_start_date\";s:19:\"2012-10-14 11:02:00\";s:16:\"publish_end_date\";s:19:\"0000-00-00 00:00:00\";s:10:\"start_date\";s:19:\"2012-10-14 11:02:00\";s:8:\"end_date\";s:19:\"0000-00-00 00:00:00\";s:10:\"list_price\";N;s:10:\"sale_price\";N;s:7:\"type_id\";i:6;}'),(69,'index.php?option=com_k2&view=item&id=109','index.php?option=com_k2&view=item&id=109:krabi&Itemid=199','Krabi','','2012-10-14 19:02:33','27c8363a1932d58b736aa8b20684a711',1,1,1,'*','2012-10-14 11:02:17','0000-00-00 00:00:00','2012-10-14 11:02:17','0000-00-00 00:00:00',0,0,6,'O:19:\"FinderIndexerResult\":18:{s:11:\"\0*\0elements\";a:25:{s:2:\"id\";s:3:\"109\";s:5:\"alias\";s:5:\"krabi\";s:7:\"summary\";s:0:\"\";s:4:\"body\";s:0:\"\";s:5:\"catid\";s:2:\"31\";s:10:\"created_by\";s:3:\"367\";s:16:\"created_by_alias\";s:0:\"\";s:8:\"modified\";s:19:\"0000-00-00 00:00:00\";s:11:\"modified_by\";s:1:\"0\";s:6:\"params\";O:9:\"JRegistry\":1:{s:7:\"\0*\0data\";O:8:\"stdClass\":240:{s:10:\"enable_css\";s:1:\"0\";s:14:\"jQueryHandling\";s:9:\"1.7remote\";s:21:\"backendJQueryHandling\";s:6:\"remote\";s:8:\"userName\";s:1:\"0\";s:9:\"userImage\";s:1:\"0\";s:15:\"userDescription\";s:1:\"0\";s:7:\"userURL\";s:1:\"0\";s:9:\"userEmail\";s:1:\"0\";s:12:\"userFeedLink\";s:1:\"0\";s:12:\"userFeedIcon\";s:1:\"0\";s:13:\"userItemCount\";s:2:\"10\";s:13:\"userItemTitle\";s:1:\"1\";s:19:\"userItemTitleLinked\";s:1:\"1\";s:19:\"userItemDateCreated\";s:1:\"1\";s:13:\"userItemImage\";s:1:\"1\";s:17:\"userItemIntroText\";s:1:\"1\";s:16:\"userItemCategory\";s:1:\"0\";s:12:\"userItemTags\";s:1:\"0\";s:22:\"userItemCommentsAnchor\";s:1:\"0\";s:16:\"userItemReadMore\";s:1:\"1\";s:17:\"userItemK2Plugins\";s:1:\"1\";s:18:\"defaultUsersItemid\";s:3:\"117\";s:12:\"tagItemCount\";s:2:\"10\";s:12:\"tagItemTitle\";s:1:\"1\";s:18:\"tagItemTitleLinked\";s:1:\"1\";s:18:\"tagItemDateCreated\";s:1:\"0\";s:12:\"tagItemImage\";s:1:\"1\";s:16:\"tagItemIntroText\";s:1:\"1\";s:15:\"tagItemCategory\";s:1:\"0\";s:15:\"tagItemReadMore\";s:1:\"1\";s:18:\"tagItemExtraFields\";s:1:\"0\";s:11:\"tagOrdering\";s:0:\"\";s:11:\"tagFeedLink\";s:1:\"0\";s:11:\"tagFeedIcon\";s:1:\"0\";s:17:\"defaultTagsItemid\";s:3:\"117\";s:16:\"genericItemCount\";s:2:\"10\";s:16:\"genericItemTitle\";s:1:\"1\";s:22:\"genericItemTitleLinked\";s:1:\"1\";s:22:\"genericItemDateCreated\";s:1:\"1\";s:16:\"genericItemImage\";s:1:\"1\";s:20:\"genericItemIntroText\";s:1:\"1\";s:19:\"genericItemCategory\";s:1:\"0\";s:19:\"genericItemReadMore\";s:1:\"1\";s:22:\"genericItemExtraFields\";s:1:\"0\";s:15:\"genericFeedLink\";s:1:\"0\";s:15:\"genericFeedIcon\";s:1:\"0\";s:9:\"feedLimit\";s:2:\"10\";s:13:\"feedItemImage\";s:1:\"1\";s:11:\"feedImgSize\";s:1:\"S\";s:17:\"feedItemIntroText\";s:1:\"1\";s:17:\"feedTextWordLimit\";s:0:\"\";s:16:\"feedItemFullText\";s:1:\"1\";s:12:\"feedItemTags\";s:1:\"0\";s:13:\"feedItemVideo\";s:1:\"0\";s:15:\"feedItemGallery\";s:1:\"0\";s:19:\"feedItemAttachments\";s:1:\"0\";s:14:\"feedBogusEmail\";s:0:\"\";s:16:\"introTextCleanup\";s:1:\"0\";s:27:\"introTextCleanupExcludeTags\";s:0:\"\";s:23:\"introTextCleanupTagAttr\";s:0:\"\";s:15:\"fullTextCleanup\";s:1:\"0\";s:26:\"fullTextCleanupExcludeTags\";s:0:\"\";s:22:\"fullTextCleanupTagAttr\";s:0:\"\";s:12:\"xssFiltering\";s:1:\"0\";s:14:\"linkPopupWidth\";s:3:\"900\";s:15:\"linkPopupHeight\";s:3:\"600\";s:13:\"imagesQuality\";s:3:\"100\";s:11:\"itemImageXS\";s:3:\"114\";s:10:\"itemImageS\";s:3:\"164\";s:10:\"itemImageM\";s:3:\"264\";s:10:\"itemImageL\";s:3:\"444\";s:11:\"itemImageXL\";s:3:\"940\";s:16:\"itemImageGeneric\";s:3:\"204\";s:13:\"catImageWidth\";s:3:\"100\";s:15:\"catImageDefault\";s:1:\"1\";s:14:\"userImageWidth\";s:3:\"100\";s:16:\"userImageDefault\";s:1:\"1\";s:17:\"commenterImgWidth\";s:2:\"66\";s:17:\"onlineImageEditor\";s:8:\"splashup\";s:14:\"imageTimestamp\";s:1:\"0\";s:16:\"imageMemoryLimit\";s:0:\"\";s:16:\"socialButtonCode\";s:832:\"<!-- AddThis Button BEGIN -->\r\n<div class=\"addthis_toolbox addthis_default_style addthis_32x32_style \">\r\n<a class=\"addthis_button_preferred_1\"></a>\r\n<a class=\"addthis_button_preferred_2\"></a>\r\n<a class=\"addthis_button_preferred_3\"></a>\r\n<a class=\"addthis_button_preferred_4\"></a>\r\n<a class=\"addthis_button_preferred_5\"></a>\r\n<a class=\"addthis_button_preferred_6\"></a>\r\n<a class=\"addthis_button_preferred_7\"></a>\r\n<a class=\"addthis_button_preferred_8\"></a>\r\n<a class=\"addthis_button_preferred_9\"></a>\r\n<a class=\"addthis_button_preferred_10\"></a>\r\n<a class=\"addthis_button_preferred_11\"></a>\r\n<a class=\"addthis_button_preferred_12\"></a>\r\n<a class=\"addthis_button_compact\"></a>\r\n</div>\r\n<script type=\"text/javascript\" src=\"http://s7.addthis.com/js/300/addthis_widget.js#pubid=xa-4efc06d355052c2c\"></script>\r\n<!-- AddThis Button END -->\";s:15:\"twitterUsername\";s:0:\"\";s:13:\"facebookImage\";s:6:\"XSmall\";s:8:\"comments\";s:1:\"1\";s:16:\"commentsOrdering\";s:4:\"DESC\";s:13:\"commentsLimit\";s:2:\"10\";s:20:\"commentsFormPosition\";s:5:\"below\";s:18:\"commentsPublishing\";s:1:\"0\";s:17:\"commentsReporting\";s:1:\"0\";s:23:\"commentsReportRecipient\";s:0:\"\";s:24:\"inlineCommentsModeration\";s:1:\"1\";s:8:\"gravatar\";s:1:\"0\";s:9:\"recaptcha\";s:1:\"0\";s:17:\"commentsFormNotes\";s:1:\"0\";s:21:\"commentsFormNotesText\";s:0:\"\";s:15:\"frontendEditing\";s:1:\"1\";s:12:\"showImageTab\";s:1:\"1\";s:19:\"showImageGalleryTab\";s:1:\"1\";s:12:\"showVideoTab\";s:1:\"1\";s:18:\"showExtraFieldsTab\";s:1:\"1\";s:18:\"showAttachmentsTab\";s:1:\"1\";s:13:\"showK2Plugins\";s:1:\"1\";s:22:\"sideBarDisplayFrontend\";s:1:\"0\";s:12:\"mergeEditors\";s:1:\"1\";s:14:\"sideBarDisplay\";s:1:\"1\";s:17:\"attachmentsFolder\";s:0:\"\";s:16:\"hideImportButton\";s:1:\"0\";s:13:\"taggingSystem\";s:1:\"1\";s:8:\"lockTags\";s:1:\"0\";s:13:\"showTagFilter\";s:1:\"0\";s:12:\"googleSearch\";s:1:\"0\";s:21:\"googleSearchContainer\";s:11:\"k2Container\";s:13:\"K2UserProfile\";s:1:\"1\";s:11:\"K2UserGroup\";s:1:\"1\";s:8:\"redirect\";s:3:\"176\";s:11:\"adminSearch\";s:6:\"simple\";s:12:\"cookieDomain\";s:0:\"\";s:20:\"recaptcha_public_key\";s:0:\"\";s:21:\"recaptcha_private_key\";s:0:\"\";s:15:\"recaptcha_theme\";s:5:\"clean\";s:23:\"recaptchaOnRegistration\";s:1:\"0\";s:13:\"stopForumSpam\";s:1:\"0\";s:19:\"stopForumSpamApiKey\";s:0:\"\";s:21:\"showItemsCounterAdmin\";s:1:\"1\";s:17:\"showChildCatItems\";s:1:\"1\";s:22:\"disableCompactOrdering\";s:1:\"0\";s:13:\"metaDescLimit\";s:3:\"150\";s:15:\"SEFReplacements\";s:583:\"Å |S, Å’|O, Å½|Z, Å¡|s, Å“|oe, Å¾|z, Å¸|Y, Â¥|Y, Âµ|u, Ã€|A, Ã�|A, Ã‚|A, Ãƒ|A, Ã„|A, Ã…|A, Ã†|A, Ã‡|C, Ãˆ|E, Ã‰|E, ÃŠ|E, Ã‹|E, ÃŒ|I, Ã�|I, ÃŽ|I, Ã�|I, Ã�|D, Ã‘|N, Ã’|O, Ã“|O, Ã”|O, Ã•|O, Ã–|O, Ã˜|O, Ã™|U, Ãš|U, Ã›|U, Ãœ|U, Ã�|Y, ÃŸ|s, Ã |a, Ã¡|a, Ã¢|a, Ã£|a, Ã¤|a, Ã¥|a, Ã¦|a, Ã§|c, Ã¨|e, Ã©|e, Ãª|e, Ã«|e, Ã¬|i, Ã­|i, Ã®|i, Ã¯|i, Ã°|o, Ã±|n, Ã²|o, Ã³|o, Ã´|o, Ãµ|o, Ã¶|o, Ã¸|o, Ã¹|u, Ãº|u, Ã»|u, Ã¼|u, Ã½|y, Ã¿|y, ÃŸ|ss\";s:16:\"sh404SefLabelCat\";s:0:\"\";s:17:\"sh404SefLabelUser\";s:4:\"blog\";s:17:\"sh404SefLabelItem\";s:1:\"2\";s:18:\"sh404SefTitleAlias\";s:5:\"alias\";s:29:\"sh404SefModK2ContentFeedAlias\";s:4:\"feed\";s:20:\"sh404SefInsertItemId\";s:1:\"0\";s:26:\"sh404SefInsertUniqueItemId\";s:1:\"0\";s:13:\"cbIntegration\";s:1:\"0\";s:11:\"inheritFrom\";s:1:\"0\";s:17:\"num_leading_items\";s:1:\"2\";s:19:\"num_leading_columns\";s:1:\"1\";s:14:\"leadingImgSize\";s:5:\"Large\";s:17:\"num_primary_items\";s:1:\"4\";s:19:\"num_primary_columns\";s:1:\"2\";s:14:\"primaryImgSize\";s:6:\"Medium\";s:19:\"num_secondary_items\";s:1:\"4\";s:21:\"num_secondary_columns\";s:1:\"1\";s:16:\"secondaryImgSize\";s:5:\"Small\";s:9:\"num_links\";s:1:\"4\";s:17:\"num_links_columns\";s:1:\"1\";s:12:\"linksImgSize\";s:6:\"XSmall\";s:14:\"catCatalogMode\";s:1:\"0\";s:16:\"catFeaturedItems\";s:1:\"0\";s:13:\"catPagination\";s:1:\"0\";s:20:\"catPaginationResults\";s:1:\"0\";s:8:\"catTitle\";s:1:\"0\";s:19:\"catTitleItemCounter\";s:1:\"0\";s:14:\"catDescription\";s:1:\"0\";s:8:\"catImage\";s:1:\"0\";s:11:\"catFeedLink\";s:1:\"0\";s:11:\"catFeedIcon\";s:1:\"0\";s:13:\"subCategories\";s:1:\"1\";s:13:\"subCatColumns\";s:1:\"2\";s:11:\"subCatTitle\";s:1:\"1\";s:22:\"subCatTitleItemCounter\";s:1:\"1\";s:17:\"subCatDescription\";s:1:\"1\";s:11:\"subCatImage\";s:1:\"1\";s:12:\"catItemTitle\";s:1:\"1\";s:18:\"catItemTitleLinked\";s:1:\"1\";s:21:\"catItemFeaturedNotice\";s:1:\"0\";s:13:\"catItemAuthor\";s:1:\"1\";s:18:\"catItemDateCreated\";s:1:\"1\";s:13:\"catItemRating\";s:1:\"0\";s:12:\"catItemImage\";s:1:\"1\";s:16:\"catItemIntroText\";s:1:\"1\";s:18:\"catItemExtraFields\";s:1:\"0\";s:11:\"catItemHits\";s:1:\"0\";s:15:\"catItemCategory\";s:1:\"1\";s:11:\"catItemTags\";s:1:\"1\";s:18:\"catItemAttachments\";s:1:\"0\";s:25:\"catItemAttachmentsCounter\";s:1:\"0\";s:12:\"catItemVideo\";s:1:\"0\";s:20:\"catItemVideoAutoPlay\";s:1:\"0\";s:19:\"catItemImageGallery\";s:1:\"0\";s:19:\"catItemDateModified\";s:1:\"0\";s:15:\"catItemReadMore\";s:1:\"1\";s:21:\"catItemCommentsAnchor\";s:1:\"1\";s:16:\"catItemK2Plugins\";s:1:\"1\";s:15:\"itemDateCreated\";s:1:\"1\";s:9:\"itemTitle\";s:1:\"1\";s:18:\"itemFeaturedNotice\";s:1:\"1\";s:10:\"itemAuthor\";s:1:\"1\";s:15:\"itemFontResizer\";s:1:\"1\";s:15:\"itemPrintButton\";s:1:\"1\";s:15:\"itemEmailButton\";s:1:\"1\";s:16:\"itemSocialButton\";s:1:\"1\";s:15:\"itemVideoAnchor\";s:1:\"1\";s:22:\"itemImageGalleryAnchor\";s:1:\"1\";s:18:\"itemCommentsAnchor\";s:1:\"1\";s:10:\"itemRating\";s:1:\"1\";s:9:\"itemImage\";s:1:\"1\";s:11:\"itemImgSize\";s:5:\"Large\";s:20:\"itemImageMainCaption\";s:1:\"1\";s:20:\"itemImageMainCredits\";s:1:\"1\";s:13:\"itemIntroText\";s:1:\"1\";s:12:\"itemFullText\";s:1:\"1\";s:15:\"itemExtraFields\";s:1:\"1\";s:16:\"itemDateModified\";s:1:\"1\";s:8:\"itemHits\";s:1:\"1\";s:12:\"itemCategory\";s:1:\"1\";s:8:\"itemTags\";s:1:\"1\";s:15:\"itemAttachments\";s:1:\"1\";s:22:\"itemAttachmentsCounter\";s:1:\"1\";s:9:\"itemVideo\";s:1:\"1\";s:17:\"itemVideoAutoPlay\";s:1:\"0\";s:16:\"itemVideoCaption\";s:1:\"1\";s:16:\"itemVideoCredits\";s:1:\"1\";s:16:\"itemImageGallery\";s:1:\"1\";s:14:\"itemNavigation\";s:1:\"1\";s:12:\"itemComments\";s:1:\"1\";s:17:\"itemTwitterButton\";s:1:\"1\";s:18:\"itemFacebookButton\";s:1:\"1\";s:23:\"itemGooglePlusOneButton\";s:1:\"1\";s:15:\"itemAuthorBlock\";s:1:\"1\";s:15:\"itemAuthorImage\";s:1:\"1\";s:21:\"itemAuthorDescription\";s:1:\"1\";s:13:\"itemAuthorURL\";s:1:\"1\";s:15:\"itemAuthorEmail\";s:1:\"0\";s:16:\"itemAuthorLatest\";s:1:\"1\";s:21:\"itemAuthorLatestLimit\";s:1:\"5\";s:11:\"itemRelated\";s:1:\"1\";s:16:\"itemRelatedLimit\";s:1:\"5\";s:16:\"itemRelatedTitle\";s:1:\"1\";s:19:\"itemRelatedCategory\";s:1:\"0\";s:20:\"itemRelatedImageSize\";s:1:\"0\";s:20:\"itemRelatedIntrotext\";s:1:\"0\";s:19:\"itemRelatedFulltext\";s:1:\"0\";s:17:\"itemRelatedAuthor\";s:1:\"0\";s:16:\"itemRelatedMedia\";s:1:\"0\";s:23:\"itemRelatedImageGallery\";s:1:\"0\";s:13:\"itemK2Plugins\";s:1:\"1\";}}s:7:\"metakey\";s:0:\"\";s:8:\"metadesc\";s:0:\"\";s:8:\"metadata\";O:9:\"JRegistry\":1:{s:7:\"\0*\0data\";O:8:\"stdClass\":2:{s:6:\"robots\";s:0:\"\";s:6:\"author\";s:0:\"\";}}s:8:\"ordering\";s:1:\"4\";s:5:\"trash\";s:1:\"0\";s:9:\"cat_trash\";s:1:\"0\";s:8:\"category\";s:11:\"Destination\";s:9:\"cat_state\";s:1:\"1\";s:10:\"cat_access\";s:1:\"1\";s:4:\"slug\";s:9:\"109:krabi\";s:7:\"catslug\";s:14:\"31:destination\";s:6:\"author\";s:10:\"Super User\";s:6:\"layout\";s:4:\"item\";s:4:\"path\";s:36:\"index.php/destination/item/109-krabi\";s:10:\"metaauthor\";N;}s:15:\"\0*\0instructions\";a:5:{i:1;a:3:{i:0;s:5:\"title\";i:1;s:8:\"subtitle\";i:2;s:2:\"id\";}i:2;a:2:{i:0;s:7:\"summary\";i:1;s:4:\"body\";}i:3;a:8:{i:0;s:4:\"meta\";i:1;s:10:\"list_price\";i:2;s:10:\"sale_price\";i:3;s:7:\"metakey\";i:4;s:8:\"metadesc\";i:5;s:10:\"metaauthor\";i:6;s:6:\"author\";i:7;s:16:\"created_by_alias\";}i:4;a:2:{i:0;s:4:\"path\";i:1;s:5:\"alias\";}i:5;a:1:{i:0;s:8:\"comments\";}}s:11:\"\0*\0taxonomy\";a:4:{s:4:\"Type\";a:1:{s:7:\"K2 Item\";O:7:\"JObject\":4:{s:10:\"\0*\0_errors\";a:0:{}s:5:\"title\";s:7:\"K2 Item\";s:5:\"state\";i:1;s:6:\"access\";i:1;}}s:6:\"Author\";a:1:{s:10:\"Super User\";O:7:\"JObject\":4:{s:10:\"\0*\0_errors\";a:0:{}s:5:\"title\";s:10:\"Super User\";s:5:\"state\";i:1;s:6:\"access\";i:1;}}s:11:\"K2 Category\";a:1:{s:11:\"Destination\";O:7:\"JObject\":4:{s:10:\"\0*\0_errors\";a:0:{}s:5:\"title\";s:11:\"Destination\";s:5:\"state\";i:1;s:6:\"access\";i:1;}}s:8:\"Language\";a:1:{s:1:\"*\";O:7:\"JObject\":4:{s:10:\"\0*\0_errors\";a:0:{}s:5:\"title\";s:1:\"*\";s:5:\"state\";i:1;s:6:\"access\";i:1;}}}s:3:\"url\";s:40:\"index.php?option=com_k2&view=item&id=109\";s:5:\"route\";s:57:\"index.php?option=com_k2&view=item&id=109:krabi&Itemid=199\";s:5:\"title\";s:5:\"Krabi\";s:11:\"description\";s:0:\"\";s:9:\"published\";N;s:5:\"state\";i:1;s:6:\"access\";s:1:\"1\";s:8:\"language\";s:1:\"*\";s:18:\"publish_start_date\";s:19:\"2012-10-14 11:02:17\";s:16:\"publish_end_date\";s:19:\"0000-00-00 00:00:00\";s:10:\"start_date\";s:19:\"2012-10-14 11:02:17\";s:8:\"end_date\";s:19:\"0000-00-00 00:00:00\";s:10:\"list_price\";N;s:10:\"sale_price\";N;s:7:\"type_id\";i:6;}'),(64,'index.php?option=com_contact&view=contact&id=1','index.php?option=com_contact&view=contact&id=1:contacts&catid=4:uncategorised&Itemid=114','Contacts','8901 Marmora Road, Glasgow, D04 89GR. Freephone: +1 800 559 6580 Telephone: +1 959 603 6035 FAX: +1 504 889 9898 E-mail: mail@demolink.org 9863 - 9867 Mill Road, Cambridge, MG09 99HT Freephone: +1 800 559 6580 Telephone: +1 959 603 6035 FAX: +1 504 889 98','2012-08-28 09:51:56','4f680947af03951e538ae6a6cc9d288c',1,1,1,'*','0000-00-00 00:00:00','0000-00-00 00:00:00','2011-12-17 11:44:54','0000-00-00 00:00:00',0,0,2,'O:19:\"FinderIndexerResult\":18:{s:11:\"\0*\0elements\";a:34:{s:2:\"id\";s:1:\"1\";s:5:\"alias\";s:8:\"contacts\";s:8:\"position\";s:0:\"\";s:7:\"address\";s:0:\"\";s:16:\"created_by_alias\";s:0:\"\";s:8:\"modified\";s:19:\"2012-08-28 06:51:56\";s:11:\"modified_by\";s:3:\"441\";s:7:\"metakey\";s:0:\"\";s:8:\"metadesc\";s:0:\"\";s:8:\"metadata\";s:25:\"{\"robots\":\"\",\"rights\":\"\"}\";s:9:\"sortname1\";s:0:\"\";s:9:\"sortname2\";s:0:\"\";s:9:\"sortname3\";s:0:\"\";s:4:\"city\";s:0:\"\";s:6:\"region\";s:0:\"\";s:7:\"country\";s:0:\"\";s:3:\"zip\";s:0:\"\";s:9:\"telephone\";s:0:\"\";s:3:\"fax\";s:0:\"\";s:7:\"summary\";s:463:\"<p>8901 Marmora Road,<br /> \r\nGlasgow, D04 89GR.<br /> \r\nFreephone: +1 800 559 6580<br /> \r\nTelephone: +1 959 603 6035<br /> \r\nFAX: +1 504 889 9898<br /> \r\nE-mail: <a href=\"mailto:mail@demolink.org\">mail@demolink.org</a>\r\n</p>\r\n\r\n<p>9863 - 9867 Mill Road, <br /> \r\nCambridge, MG09 99HT<br /> \r\nFreephone: +1 800 559 6580<br /> \r\nTelephone: +1 959 603 6035<br /> \r\nFAX: +1 504 889 9898<br /> \r\nE-mail: <a href=\"mailto:mail@demolink.org\">mail@demolink.org</a>\r\n</p>\";s:5:\"email\";s:19:\"mailto@demolink.org\";s:6:\"mobile\";s:0:\"\";s:7:\"webpage\";s:0:\"\";s:8:\"ordering\";s:1:\"1\";s:6:\"params\";O:9:\"JRegistry\":1:{s:7:\"\0*\0data\";O:8:\"stdClass\":40:{s:21:\"show_contact_category\";s:0:\"\";s:17:\"show_contact_list\";s:0:\"\";s:18:\"presentation_style\";s:0:\"\";s:9:\"show_name\";s:0:\"\";s:13:\"show_position\";s:0:\"\";s:10:\"show_email\";s:0:\"\";s:19:\"show_street_address\";s:0:\"\";s:11:\"show_suburb\";s:0:\"\";s:10:\"show_state\";s:0:\"\";s:13:\"show_postcode\";s:0:\"\";s:12:\"show_country\";s:0:\"\";s:14:\"show_telephone\";s:0:\"\";s:11:\"show_mobile\";s:0:\"\";s:8:\"show_fax\";s:0:\"\";s:12:\"show_webpage\";s:0:\"\";s:9:\"show_misc\";s:0:\"\";s:10:\"show_image\";s:0:\"\";s:11:\"allow_vcard\";s:0:\"\";s:13:\"show_articles\";s:0:\"\";s:12:\"show_profile\";s:0:\"\";s:10:\"show_links\";s:0:\"\";s:10:\"linka_name\";s:0:\"\";s:5:\"linka\";N;s:10:\"linkb_name\";s:0:\"\";s:5:\"linkb\";N;s:10:\"linkc_name\";s:0:\"\";s:5:\"linkc\";N;s:10:\"linkd_name\";s:0:\"\";s:5:\"linkd\";N;s:10:\"linke_name\";s:0:\"\";s:5:\"linke\";s:0:\"\";s:14:\"contact_layout\";s:0:\"\";s:15:\"show_email_form\";s:0:\"\";s:15:\"show_email_copy\";s:0:\"\";s:12:\"banned_email\";s:0:\"\";s:14:\"banned_subject\";s:0:\"\";s:11:\"banned_text\";s:0:\"\";s:16:\"validate_session\";s:0:\"\";s:12:\"custom_reply\";s:0:\"\";s:8:\"redirect\";s:0:\"\";}}s:5:\"catid\";s:1:\"4\";s:8:\"category\";s:13:\"Uncategorised\";s:9:\"cat_state\";s:1:\"1\";s:10:\"cat_access\";s:1:\"1\";s:4:\"slug\";s:10:\"1:contacts\";s:7:\"catslug\";s:15:\"4:uncategorised\";s:4:\"user\";N;s:6:\"layout\";s:7:\"contact\";s:4:\"path\";s:45:\"index.php/contacts/4-uncategorised/1-contacts\";}s:15:\"\0*\0instructions\";a:5:{i:1;a:3:{i:0;s:5:\"title\";i:1;s:8:\"subtitle\";i:2;s:2:\"id\";}i:2;a:2:{i:0;s:7:\"summary\";i:1;s:4:\"body\";}i:3;a:15:{i:0;s:4:\"meta\";i:1;s:10:\"list_price\";i:2;s:10:\"sale_price\";i:3;s:8:\"position\";i:4;s:7:\"address\";i:5;s:4:\"city\";i:6;s:6:\"region\";i:7;s:7:\"country\";i:8;s:3:\"zip\";i:9;s:9:\"telephone\";i:10;s:3:\"fax\";i:11;s:5:\"email\";i:12;s:6:\"mobile\";i:13;s:7:\"webpage\";i:14;s:4:\"user\";}i:4;a:2:{i:0;s:4:\"path\";i:1;s:5:\"alias\";}i:5;a:1:{i:0;s:8:\"comments\";}}s:11:\"\0*\0taxonomy\";a:3:{s:4:\"Type\";a:1:{s:7:\"Contact\";O:7:\"JObject\":4:{s:10:\"\0*\0_errors\";a:0:{}s:5:\"title\";s:7:\"Contact\";s:5:\"state\";i:1;s:6:\"access\";i:1;}}s:8:\"Category\";a:1:{s:13:\"Uncategorised\";O:7:\"JObject\":4:{s:10:\"\0*\0_errors\";a:0:{}s:5:\"title\";s:13:\"Uncategorised\";s:5:\"state\";i:1;s:6:\"access\";i:1;}}s:8:\"Language\";a:1:{s:1:\"*\";O:7:\"JObject\":4:{s:10:\"\0*\0_errors\";a:0:{}s:5:\"title\";s:1:\"*\";s:5:\"state\";i:1;s:6:\"access\";i:1;}}}s:3:\"url\";s:46:\"index.php?option=com_contact&view=contact&id=1\";s:5:\"route\";s:88:\"index.php?option=com_contact&view=contact&id=1:contacts&catid=4:uncategorised&Itemid=114\";s:5:\"title\";s:8:\"Contacts\";s:11:\"description\";s:283:\"8901 Marmora Road, Glasgow, D04 89GR. Freephone: +1 800 559 6580 Telephone: +1 959 603 6035 FAX: +1 504 889 9898 E-mail: mail@demolink.org 9863 - 9867 Mill Road, Cambridge, MG09 99HT Freephone: +1 800 559 6580 Telephone: +1 959 603 6035 FAX: +1 504 889 9898 E-mail: mail@demolink.org\";s:9:\"published\";N;s:5:\"state\";s:1:\"1\";s:6:\"access\";s:1:\"1\";s:8:\"language\";s:1:\"*\";s:18:\"publish_start_date\";s:19:\"0000-00-00 00:00:00\";s:16:\"publish_end_date\";s:19:\"0000-00-00 00:00:00\";s:10:\"start_date\";s:19:\"2011-12-17 11:44:54\";s:8:\"end_date\";s:19:\"0000-00-00 00:00:00\";s:10:\"list_price\";N;s:10:\"sale_price\";N;s:7:\"type_id\";i:2;}');
/*!40000 ALTER TABLE `bk078_finder_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_finder_links_terms4`
--

DROP TABLE IF EXISTS `bk078_finder_links_terms4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_finder_links_terms4` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_finder_links_terms4`
--

LOCK TABLES `bk078_finder_links_terms4` WRITE;
/*!40000 ALTER TABLE `bk078_finder_links_terms4` DISABLE KEYS */;
INSERT INTO `bk078_finder_links_terms4` VALUES (11,1582,0.63996),(12,1582,0.63996),(12,1584,1.72679),(64,4134,0.42),(64,4135,1.72662),(64,4136,1.96),(64,4137,0.28),(64,4138,0.91),(64,4139,1.02669),(64,4140,0.28),(64,4141,0.91),(64,4142,1.02669),(64,4143,0.56),(64,4144,1.91338),(64,4145,2.14662),(64,4146,0.18669),(64,4147,1.02669),(64,4148,1.09669),(64,4149,0.42),(64,4150,1.02669),(64,4151,1.14331),(64,4152,0.56004),(64,4153,1.97321),(64,4187,0.37338),(64,4188,1.02669),(64,4189,1.14331),(64,4190,0.98),(64,4191,1.07331),(65,4220,0.65338),(65,4221,0.93331),(65,4222,1.00331),(65,4223,0.98),(65,4224,1.07331),(65,4225,0.42),(65,4226,1.12),(65,4227,1.19),(65,4275,0.51331),(65,4312,0.23331),(65,4313,0.88669),(65,4314,1.14331),(65,4315,0.09331),(65,4316,0.86331),(65,4317,1.02669),(67,4312,0.23331),(67,4442,0.09338),(67,4443,0.93331),(67,4444,1.02669),(67,4445,0.84),(67,4446,0.93331),(67,4447,0.28),(67,4448,0.98),(67,4449,1.05),(67,4450,0.28),(67,4451,1.02669),(67,4452,1.16669),(67,4453,0.32669),(67,4454,1.02669),(67,4455,1.21331),(67,4456,0.23331),(67,4457,0.93331),(67,4458,1.02669),(67,4459,0.98007),(67,4460,1.05),(67,4461,1.12),(67,4462,1.12),(67,4463,1.23669),(67,4464,1.14331),(67,4465,1.4),(67,4466,0.37338),(67,4467,0.93331),(67,4468,1.05),(67,4469,0.88669),(67,4470,1.12),(67,4471,0.32669),(67,4472,0.37331),(67,4475,0.32669),(67,4476,0.95669),(67,4477,1.16669),(67,4478,0.56),(67,4479,0.91),(67,4480,1.02669),(67,4481,0.98),(67,4482,1.07331),(67,4483,0.42),(67,4484,0.98),(67,4485,1.07331),(67,4486,0.32669),(67,4487,0.95669),(67,4488,1.09669),(67,4489,0.46669),(67,4490,1.05),(67,4491,1.14331),(67,4492,0.51331),(67,4493,1.12),(67,4494,1.23669),(67,4495,0.56),(67,4496,1.05),(67,4497,1.21331),(67,4498,0.51331),(67,4499,1.02669),(67,4500,1.23669),(67,4501,0.65338),(67,4502,1.86662),(67,4503,1.09669),(67,4504,1.02669),(67,4505,0.37331),(67,4506,1.07331),(67,4507,0.32669),(67,4508,0.93331),(67,4509,1.16669),(67,4510,0.37331),(67,4511,1.07331),(67,4512,1.16669),(67,4784,0.28),(67,4785,0.98),(67,4786,1.21331),(67,4787,0.14),(67,4788,0.88669),(67,4789,1.05),(67,4790,0.46669),(67,4791,1.07331),(67,4792,1.16669),(67,4793,0.42),(67,4794,0.95669),(67,4795,1.12),(67,4796,0.37331),(67,4797,1.21331),(67,4798,1.37669),(67,4799,0.23331),(67,4800,0.91),(67,4801,1.16669),(67,4802,0.37331),(67,4803,0.93331),(67,4804,1.14331),(67,5021,1.05),(67,5022,1.33),(67,5023,0.37331),(67,5024,1.16669),(67,5025,1.28331);
/*!40000 ALTER TABLE `bk078_finder_links_terms4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_finder_links_terms5`
--

DROP TABLE IF EXISTS `bk078_finder_links_terms5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_finder_links_terms5` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_finder_links_terms5`
--

LOCK TABLES `bk078_finder_links_terms5` WRITE;
/*!40000 ALTER TABLE `bk078_finder_links_terms5` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_finder_links_terms5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_update_categories`
--

DROP TABLE IF EXISTS `bk078_update_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_update_categories` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT '',
  `description` text NOT NULL,
  `parent` int(11) DEFAULT '0',
  `updatesite` int(11) DEFAULT '0',
  PRIMARY KEY (`categoryid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Update Categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_update_categories`
--

LOCK TABLES `bk078_update_categories` WRITE;
/*!40000 ALTER TABLE `bk078_update_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_update_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_finder_links_terms7`
--

DROP TABLE IF EXISTS `bk078_finder_links_terms7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_finder_links_terms7` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_finder_links_terms7`
--

LOCK TABLES `bk078_finder_links_terms7` WRITE;
/*!40000 ALTER TABLE `bk078_finder_links_terms7` DISABLE KEYS */;
INSERT INTO `bk078_finder_links_terms7` VALUES (64,4195,1.04004),(65,14,0.07992),(65,4257,0.51331),(65,4258,1.19),(65,4259,1.35331),(65,4306,0.49321),(66,14,0.64008),(67,14,0.64008),(67,4715,1.02662),(67,4716,1.21331),(67,4717,1.33),(67,4718,1.12),(67,4719,1.21331),(67,4720,0.14),(67,4721,0.91),(67,4722,0.98),(67,4723,0.28),(67,4724,0.91),(67,4725,1.12),(67,4778,0.18669),(67,4779,1.05),(67,4780,1.23669),(67,4781,0.37331),(67,4782,1.12),(67,4783,1.21331),(67,4982,0.23331),(67,4983,0.91),(67,4984,1.00331),(68,14,0.64008),(69,14,0.64008);
/*!40000 ALTER TABLE `bk078_finder_links_terms7` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_finder_links_terms0`
--

DROP TABLE IF EXISTS `bk078_finder_links_terms0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_finder_links_terms0` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_finder_links_terms0`
--

LOCK TABLES `bk078_finder_links_terms0` WRITE;
/*!40000 ALTER TABLE `bk078_finder_links_terms0` DISABLE KEYS */;
INSERT INTO `bk078_finder_links_terms0` VALUES (11,1579,1.23321),(11,1580,5.05679),(65,11,0.79992),(65,12,3.19992),(65,4199,0.20433),(65,4200,4.68679),(65,4201,0.01169),(65,4202,0.91),(65,4203,1.12),(65,4204,0.035),(65,4205,0.84),(65,4206,0.93331),(65,4207,0.86331),(65,4208,1.12),(65,4276,0.18669),(65,4277,0.95669),(65,4278,1.21331),(65,4279,0.46669),(65,4280,1.00331),(65,4281,1.23669),(66,11,0.79992),(66,12,3.19992),(67,11,0.79992),(67,12,3.19992),(67,753,0.23345),(67,1534,0.28),(67,4204,1.26),(67,4207,0.86331),(67,4339,1.86662),(67,4340,2.19338),(67,4341,0.84),(67,4342,0.98),(67,4343,0.88669),(67,4344,0.95669),(67,4345,0.86331),(67,4346,1.00331),(67,4347,0.46669),(67,4348,1.09669),(67,4349,1.23669),(67,4350,0.69993),(67,4351,0.95669),(67,4352,1.07331),(67,4353,1.05),(67,4354,1.28331),(67,4355,0.91),(67,4356,1.05),(67,4357,0.28),(67,4358,0.95669),(67,4359,1.00331),(67,4360,0.23331),(67,4361,1.07331),(67,4362,1.16669),(67,4363,0.88669),(67,4364,0.91),(67,4365,1.02669),(67,4366,0.93331),(67,4367,1.07331),(67,4368,0.98),(67,4370,0.93331),(67,4371,1.02669),(67,4372,1.00331),(67,4373,1.19),(67,4374,0.98),(67,4375,1.09669),(67,4376,0.95669),(67,4377,1.07331),(67,4378,1.12),(67,4379,0.28),(67,4380,0.95669),(67,4381,1.07331),(67,4382,0.65331),(67,4383,1.23669),(67,4384,1.30669),(67,4385,0.60669),(67,4386,1.16669),(67,4387,1.4),(67,4388,0.23331),(67,4389,0.93331),(67,4390,1.00331),(67,4391,0.28),(67,4392,0.91),(67,4393,1.09669),(67,4394,0.32669),(67,4395,0.93331),(67,4396,1.12),(67,4397,0.46655),(67,4398,0.79331),(67,4399,0.91),(67,4400,0.88669),(67,4401,1.14331),(67,4402,0.93331),(67,4403,1.09669),(67,4404,0.84),(67,4405,1.02669),(67,4406,0.86331),(67,4407,0.93331),(67,4408,0.18669),(67,4409,0.88669),(67,4410,1.07331),(67,4411,0.32669),(67,4412,1.00331),(67,4413,1.19),(67,4805,0.91),(67,4806,1.07331),(67,4807,0.14),(67,4808,0.91),(67,4809,1.02669),(67,4810,0.32669),(67,4811,1.00331),(67,4812,1.09669),(67,4813,0.60669),(67,4814,1.09669),(67,4815,1.26),(67,4816,0.37338),(67,4817,1.68),(67,4818,1.77338),(67,4819,0.23331),(67,4820,1.00331),(67,4821,1.09669),(67,4822,0.32669),(67,4823,0.93331),(67,4824,1.09669),(67,4825,0.23331),(67,4826,0.98),(67,4827,1.07331),(67,4828,0.42),(67,4829,1.02669),(67,4830,1.12),(67,4831,0.37331),(67,4832,1.07331),(67,4833,1.33),(67,4834,0.32669),(67,4835,1.05),(67,4836,1.12),(67,4837,0.42),(67,4838,0.98),(67,4839,1.14331),(67,4840,0.28),(67,4841,1.14331),(67,4842,1.21331),(67,4843,0.18669),(67,4844,0.86331),(67,4845,1.05),(67,5032,0.98),(68,11,0.79992),(68,12,3.19992),(69,11,0.79992),(69,12,3.19992);
/*!40000 ALTER TABLE `bk078_finder_links_terms0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_qunipay_installed`
--

DROP TABLE IF EXISTS `bk078_qunipay_installed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_qunipay_installed` (
  `idname` varchar(64) NOT NULL,
  `type` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `published` int(11) NOT NULL,
  `core` tinyint(4) NOT NULL,
  `manifest` varchar(128) NOT NULL,
  `version` varchar(16) NOT NULL,
  PRIMARY KEY (`idname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_qunipay_installed`
--

LOCK TABLES `bk078_qunipay_installed` WRITE;
/*!40000 ALTER TABLE `bk078_qunipay_installed` DISABLE KEYS */;
INSERT INTO `bk078_qunipay_installed` VALUES ('Configurable','inputmethod','Allows the administrator to specify a fixed amount for a payment or lets the user select a custom amount on the payment form',1,1,'','2.3.1'),('PaymentFactory','inputmethod','The Payment Factory input method assumes that a payment is already waiting to be processed in the user session. The payment can be stored with a call to PaymentFactory::storePayment($payment). The payment can be retrieved with a call to PaymentFactory::getPayment()',1,1,'','2.3.1'),('JRequest','inputmethod','Retrieves payment information from parameters using the JRequest::getVar method.',1,1,'','2.3.1'),('ComboBox','paymentmethodselector','This payment method selector allows the user to select from a combobox of configured payment methods during the payment process.',1,1,'','2.3.1'),('RadioButtons','paymentmethodselector','This payment method selector allows the user to select a configured payment method from multiple radiobuttons during the payment process.',1,1,'','2.3.1'),('Dummy','paymentmethod','Dummy payment method for testing purposes.',1,1,'','2.3.1'),('InputText','hook','Form text input element	',1,1,'','2.3.1'),('InputEmail','hook','Form e-mail input element',1,1,'','2.3.1'),('InfoText','hook','Shows a user defined text on the payment form',1,1,'','2.3.1'),('EmailNotifier','hook','Notify administrator and payer on payment success	',1,1,'','2.3.1'),('ccNewsLetter','hook','Newsletter subscriber option	',1,1,'','2.3.1'),('Custom','hook','Allows the execution of custom PHP code during several steps of the payment process.',1,1,'','2.3.1'),('SimpleCaddy','integrator','SimpleCaddy',1,1,'','2.3.1'),('VirtueMart','integrator','Allows the user to create and configure plugins for the VirtueMart shopping cart solution',1,1,'','2.3.1'),('InputHidden','hook','Hidden input element',1,1,'','2.3.1'),('InputCheckBox','hook','Form checkbox input element',1,1,'','2.3.1');
/*!40000 ALTER TABLE `bk078_qunipay_installed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_content_frontpage`
--

DROP TABLE IF EXISTS `bk078_content_frontpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_content_frontpage`
--

LOCK TABLES `bk078_content_frontpage` WRITE;
/*!40000 ALTER TABLE `bk078_content_frontpage` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_content_frontpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_finder_links_terms3`
--

DROP TABLE IF EXISTS `bk078_finder_links_terms3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_finder_links_terms3` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_finder_links_terms3`
--

LOCK TABLES `bk078_finder_links_terms3` WRITE;
/*!40000 ALTER TABLE `bk078_finder_links_terms3` DISABLE KEYS */;
INSERT INTO `bk078_finder_links_terms3` VALUES (67,4666,0.74662),(67,4667,2.1),(67,4668,1.12),(67,4669,1.19);
/*!40000 ALTER TABLE `bk078_finder_links_terms3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_associations`
--

DROP TABLE IF EXISTS `bk078_associations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_associations` (
  `id` varchar(50) NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.',
  PRIMARY KEY (`context`,`id`),
  KEY `idx_key` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_associations`
--

LOCK TABLES `bk078_associations` WRITE;
/*!40000 ALTER TABLE `bk078_associations` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_associations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_k2_tags_xref`
--

DROP TABLE IF EXISTS `bk078_k2_tags_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_k2_tags_xref` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tagID` int(11) NOT NULL,
  `itemID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tagID` (`tagID`),
  KEY `itemID` (`itemID`)
) ENGINE=MyISAM AUTO_INCREMENT=270 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_k2_tags_xref`
--

LOCK TABLES `bk078_k2_tags_xref` WRITE;
/*!40000 ALTER TABLE `bk078_k2_tags_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_k2_tags_xref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_finder_links_terms9`
--

DROP TABLE IF EXISTS `bk078_finder_links_terms9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_finder_links_terms9` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_finder_links_terms9`
--

LOCK TABLES `bk078_finder_links_terms9` WRITE;
/*!40000 ALTER TABLE `bk078_finder_links_terms9` DISABLE KEYS */;
INSERT INTO `bk078_finder_links_terms9` VALUES (11,1581,1.23321),(65,4209,0.46669),(65,4210,1.00331),(65,4211,1.12),(65,4212,0.37331),(65,4213,1.16669),(65,4214,1.4),(65,4215,0.02338),(65,4216,0.91),(65,4217,1.07331),(65,4218,0.84),(65,4219,1.12),(66,4319,1.72679),(67,1463,0.18669),(67,4414,0.09338),(67,4415,1.54),(67,4416,0.98),(67,4417,0.88669),(67,4418,0.18669),(67,4419,0.28),(67,4420,0.88669),(67,4421,1.09669),(67,4422,0.84),(67,4423,0.98),(67,4424,0.46662),(67,4425,1.77338),(67,4426,1.05),(67,4427,1.05),(67,4428,0.28),(67,4429,0.93331),(67,4430,1.05),(67,4431,0.42),(67,4432,0.98),(67,4433,1.07331),(67,4434,0.32669),(67,4435,0.98),(67,4436,1.09669),(67,4437,0.46662),(67,4438,0.93331),(67,4439,1.16669),(67,4440,0.98),(67,4441,1.07331),(67,5033,0.88669),(67,5034,1.07331);
/*!40000 ALTER TABLE `bk078_finder_links_terms9` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_schemas`
--

DROP TABLE IF EXISTS `bk078_schemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_schemas` (
  `extension_id` int(11) NOT NULL,
  `version_id` varchar(20) NOT NULL,
  PRIMARY KEY (`extension_id`,`version_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_schemas`
--

LOCK TABLES `bk078_schemas` WRITE;
/*!40000 ALTER TABLE `bk078_schemas` DISABLE KEYS */;
INSERT INTO `bk078_schemas` VALUES (700,'2.5.7');
/*!40000 ALTER TABLE `bk078_schemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_rokcandy`
--

DROP TABLE IF EXISTS `bk078_rokcandy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_rokcandy` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL,
  `macro` text NOT NULL,
  `html` text NOT NULL,
  `published` tinyint(1) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `ordering` int(11) NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_rokcandy`
--

LOCK TABLES `bk078_rokcandy` WRITE;
/*!40000 ALTER TABLE `bk078_rokcandy` DISABLE KEYS */;
INSERT INTO `bk078_rokcandy` VALUES (20,7,'[h1]{text}[/h1]','<h1>{text}</h1>',1,0,'0000-00-00 00:00:00',1,''),(21,7,'[h2]{text}[/h2]','<h2>{text}</h2>',1,0,'0000-00-00 00:00:00',2,''),(22,7,'[h3]{text}[/h3]','<h3>{text}</h3>',1,0,'0000-00-00 00:00:00',3,''),(23,7,'[h4]{text}[/h4]','<h4>{text}</h4>',1,0,'0000-00-00 00:00:00',4,''),(24,7,'[h5]{text}[/h5]','<h5>{text}</h5>',1,0,'0000-00-00 00:00:00',5,''),(25,7,'[b]{text}[/b]','<strong>{text}</strong>',1,0,'0000-00-00 00:00:00',6,''),(26,7,'[i]{text}[/i]','<em>{text}</em>',1,0,'0000-00-00 00:00:00',7,''),(27,7,'[code]{text}[/code]','<code>{text}</code>',1,0,'0000-00-00 00:00:00',8,''),(28,10,'[error-box]{text}[/error-box]','<p class=\"alert-box error-box\">{text}</p> ',1,0,'0000-00-00 00:00:00',9,''),(29,10,'[attention-box]{text}[/attention-box] ','<p class=\"alert-box attention-box\">{text}</p> ',1,0,'0000-00-00 00:00:00',10,''),(30,10,'[notice-box]{text}[/notice-box] ','<p class=\"alert-box notice-box\">{text}</p> ',1,0,'0000-00-00 00:00:00',11,''),(31,10,'[approved-box]{text}[/approved-box] ','<p class=\"alert-box approved-box\">{text}</p> ',1,0,'0000-00-00 00:00:00',12,''),(32,11,'[one_half]{text}[/one_half] ','<div class=\"one_half\">{text}</div> ',1,0,'0000-00-00 00:00:00',13,''),(33,11,'[one_half addClass=\"{class}\"]{text}[/one_half] ','<div class=\"one_half {class}\">{text}</div> ',1,0,'0000-00-00 00:00:00',14,''),(34,11,'[one_third addClass=\"{class}\"]{text}[/one_third] ','<div class=\"one_third {class}\">{text}</div> ',1,0,'0000-00-00 00:00:00',15,''),(35,11,'[two_third addClass=\"{class}\"{text}[/two_third] ','<div class=\"two_third {class}\">{text}</div> ',1,0,'0000-00-00 00:00:00',16,''),(36,11,'[one_fourth addClass=\"{class}\"{text}[/one_fourth] ','<div class=\"one_fourth {class}\">{text}</div> ',1,0,'0000-00-00 00:00:00',17,''),(37,11,'[three_fourth addClass=\"{class}\"]{text}[/three_fourth] ','<div class=\"three_fourth {class}\">{text}</div> ',1,0,'0000-00-00 00:00:00',18,''),(38,11,'[one_fifth addClass=\"{class}\"]{text}[/one_fifth] ','<div class=\"one_fifth {class}\">{text}</div> ',1,0,'0000-00-00 00:00:00',19,''),(39,11,'[two_fifth addClass=\"{class}\"]{text}[/two_fifth] ','<div class=\"two_fifth {class}\">{text}</div> ',1,0,'0000-00-00 00:00:00',20,''),(40,11,'[three_fifth addClass=\"{class}\"]{text}[/three_fifth] ','<div class=\"three_fifth {class}\">{text}</div> ',1,0,'0000-00-00 00:00:00',21,''),(41,11,'[four_fifth addClass=\"{class}\"]{text}[/four_fifth] ','<div class=\"four_fifth {class}\">{text}</div> ',1,0,'0000-00-00 00:00:00',22,''),(42,11,'[one_sixth addClass=\"{class}\"]{text}[/one_sixth] ','<div class=\"one_sixth {class}\">{text}</div> ',1,0,'0000-00-00 00:00:00',23,''),(43,11,'[five_sixth addClass=\"{class}\"]{text}[/five_sixth] ','<div class=\"five_sixth {class}\">{text}</div> ',1,0,'0000-00-00 00:00:00',24,''),(44,11,'[clear][/clear] ','<span class=\"clear\"></span> ',1,0,'0000-00-00 00:00:00',25,''),(45,7,'[span]{text}[/span]','<span>{text}</span>',1,0,'0000-00-00 00:00:00',26,'');
/*!40000 ALTER TABLE `bk078_rokcandy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_banner_tracks`
--

DROP TABLE IF EXISTS `bk078_banner_tracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  KEY `idx_track_date` (`track_date`),
  KEY `idx_track_type` (`track_type`),
  KEY `idx_banner_id` (`banner_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_banner_tracks`
--

LOCK TABLES `bk078_banner_tracks` WRITE;
/*!40000 ALTER TABLE `bk078_banner_tracks` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk078_banner_tracks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bk078_comprofiler`
--

DROP TABLE IF EXISTS `bk078_comprofiler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bk078_comprofiler` (
  `id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(100) DEFAULT NULL,
  `middlename` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `hits` int(11) NOT NULL DEFAULT '0',
  `message_last_sent` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `message_number_sent` int(11) NOT NULL DEFAULT '0',
  `avatar` varchar(255) DEFAULT NULL,
  `avatarapproved` tinyint(4) NOT NULL DEFAULT '1',
  `approved` tinyint(4) NOT NULL DEFAULT '1',
  `confirmed` tinyint(4) NOT NULL DEFAULT '1',
  `lastupdatedate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `registeripaddr` varchar(50) NOT NULL DEFAULT '',
  `cbactivation` varchar(50) NOT NULL DEFAULT '',
  `banned` tinyint(4) NOT NULL DEFAULT '0',
  `banneddate` datetime DEFAULT NULL,
  `unbanneddate` datetime DEFAULT NULL,
  `bannedby` int(11) DEFAULT NULL,
  `unbannedby` int(11) DEFAULT NULL,
  `bannedreason` mediumtext,
  `acceptedterms` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `apprconfbanid` (`approved`,`confirmed`,`banned`,`id`),
  KEY `avatappr_apr_conf_ban_avatar` (`avatarapproved`,`approved`,`confirmed`,`banned`,`avatar`),
  KEY `lastupdatedate` (`lastupdatedate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bk078_comprofiler`
--

LOCK TABLES `bk078_comprofiler` WRITE;
/*!40000 ALTER TABLE `bk078_comprofiler` DISABLE KEYS */;
INSERT INTO `bk078_comprofiler` VALUES (42,42,NULL,NULL,NULL,0,'0000-00-00 00:00:00',0,NULL,1,1,1,'0000-00-00 00:00:00','','',0,NULL,NULL,NULL,NULL,NULL,0),(367,367,NULL,NULL,NULL,0,'0000-00-00 00:00:00',0,NULL,1,1,1,'0000-00-00 00:00:00','','',0,NULL,NULL,NULL,NULL,NULL,0),(368,368,NULL,NULL,NULL,0,'0000-00-00 00:00:00',0,NULL,1,1,1,'0000-00-00 00:00:00','192.168.1.103','',0,NULL,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `bk078_comprofiler` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-10-20 13:39:03
