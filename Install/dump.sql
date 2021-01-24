
-- Dump of TYPO3 Connection "Default"
-- MySQL dump 10.18  Distrib 10.3.27-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	10.2.34-MariaDB-1:10.2.34+maria~bionic-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `backend_layout`
--

DROP TABLE IF EXISTS `backend_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backend_layout` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `config` text COLLATE utf8_unicode_ci NOT NULL,
  `icon` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_layout`
--

LOCK TABLES `backend_layout` WRITE;
/*!40000 ALTER TABLE `backend_layout` DISABLE KEYS */;
/*!40000 ALTER TABLE `backend_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `be_dashboards`
--

DROP TABLE IF EXISTS `be_dashboards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `be_dashboards` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `identifier` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `widgets` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `be_dashboards`
--

LOCK TABLES `be_dashboards` WRITE;
/*!40000 ALTER TABLE `be_dashboards` DISABLE KEYS */;
INSERT INTO `be_dashboards` VALUES (1,0,1611516545,1611516545,1,0,0,0,0,'f70ea63bba333b852716f655c402647b5a7b02cb','My dashboard','{\"fd5fbcbf98d791f6711c4c1a947660c6124f231f\":{\"identifier\":\"t3information\"},\"c5010cebf31e1e2338d02a7de13323d2fe1f7165\":{\"identifier\":\"t3news\"},\"dc169c48c99723a1aa1d266c32afda21a3db7ec5\":{\"identifier\":\"docGettingStarted\"}}'),(2,0,1611516595,1611516595,3,0,0,0,0,'77e5ddd12d2ab8697b32fe5e98e5ca47847df8d6','My dashboard','{\"ad2045d90e77916fd926c55233af23796caafe8d\":{\"identifier\":\"t3information\"},\"cda42e771f624883bfceb4853b3c5c55066a79e1\":{\"identifier\":\"t3news\"},\"d366d2eb0c70f27f4e387f7c743612354165bc09\":{\"identifier\":\"docGettingStarted\"}}');
/*!40000 ALTER TABLE `be_dashboards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `be_groups`
--

DROP TABLE IF EXISTS `be_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `be_groups` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `non_exclude_fields` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `explicit_allowdeny` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `allowed_languages` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `custom_options` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `db_mountpoints` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `pagetypes_select` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `tables_select` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `tables_modify` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `groupMods` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `availableWidgets` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_mountpoints` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_permissions` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `TSconfig` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `subgroup` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `workspace_perms` smallint(6) NOT NULL DEFAULT 1,
  `category_perms` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `tx_styleguide_isdemorecord` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `be_groups`
--

LOCK TABLES `be_groups` WRITE;
/*!40000 ALTER TABLE `be_groups` DISABLE KEYS */;
INSERT INTO `be_groups` VALUES (1,0,0,0,0,0,1,NULL,'styleguide demo group 1',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,1),(2,0,0,0,0,0,1,NULL,'styleguide demo group 2',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,1);
/*!40000 ALTER TABLE `be_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `be_sessions`
--

DROP TABLE IF EXISTS `be_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `be_sessions` (
  `ses_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ses_iplock` varchar(39) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ses_userid` int(10) unsigned NOT NULL DEFAULT 0,
  `ses_tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `ses_data` longblob DEFAULT NULL,
  PRIMARY KEY (`ses_id`),
  KEY `ses_tstamp` (`ses_tstamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `be_sessions`
--

LOCK TABLES `be_sessions` WRITE;
/*!40000 ALTER TABLE `be_sessions` DISABLE KEYS */;
INSERT INTO `be_sessions` VALUES ('117e350844d71359b6f8769cebd0785ae09432150a86fe03a2a8b7b32fe19190','[DISABLED]',1,1611517950,'a:1:{s:26:\"formProtectionSessionToken\";s:64:\"7dc0e5c8b7fd31af8b7f7b2e6aa3eb95e70df553a82ce06b9dd9f47d697a96f8\";}'),('b13e5789cbd8b2637a1f63613decf76e31f1d9a3b1ad710140bfb8c0c21c2ed2','[DISABLED]',3,1611516595,'a:1:{s:26:\"formProtectionSessionToken\";s:64:\"83df34b010ae60ea822403d365de70da9eb8b01caa6b8cc545be30b642d11e98\";}');
/*!40000 ALTER TABLE `be_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `be_users`
--

DROP TABLE IF EXISTS `be_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `be_users` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `disable` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `avatar` int(10) unsigned NOT NULL DEFAULT 0,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `admin` smallint(5) unsigned NOT NULL DEFAULT 0,
  `usergroup` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lang` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `db_mountpoints` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `options` smallint(5) unsigned NOT NULL DEFAULT 0,
  `realName` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userMods` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `allowed_languages` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uc` mediumblob DEFAULT NULL,
  `file_mountpoints` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_permissions` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `workspace_perms` smallint(6) NOT NULL DEFAULT 1,
  `TSconfig` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastlogin` int(10) unsigned NOT NULL DEFAULT 0,
  `workspace_id` int(11) NOT NULL DEFAULT 0,
  `category_perms` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_reset_token` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tx_examples_mobile` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tx_styleguide_isdemorecord` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `username` (`username`),
  KEY `parent` (`pid`,`deleted`,`disable`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `be_users`
--

LOCK TABLES `be_users` WRITE;
/*!40000 ALTER TABLE `be_users` DISABLE KEYS */;
INSERT INTO `be_users` VALUES (1,0,1611516511,1611516511,0,0,0,0,0,NULL,'admin',0,'$argon2i$v=19$m=65536,t=16,p=1$azhEYVZELlBEYnpQRnhyaQ$DUGfY+4VPM5KCy+s+zuNgTTqcIr2DlqAD8+6Jf7ybFM',1,'','','',NULL,0,'',NULL,'','a:10:{s:14:\"interfaceSetup\";s:7:\"backend\";s:10:\"moduleData\";a:5:{s:28:\"dashboard/current_dashboard/\";s:40:\"f70ea63bba333b852716f655c402647b5a7b02cb\";s:9:\"tx_beuser\";s:532:\"O:40:\"TYPO3\\CMS\\Beuser\\Domain\\Model\\ModuleData\":2:{s:9:\"\0*\0demand\";O:36:\"TYPO3\\CMS\\Beuser\\Domain\\Model\\Demand\":12:{s:11:\"\0*\0userName\";s:0:\"\";s:11:\"\0*\0userType\";i:0;s:9:\"\0*\0status\";i:0;s:9:\"\0*\0logins\";i:0;s:19:\"\0*\0backendUserGroup\";i:0;s:6:\"\0*\0uid\";N;s:16:\"\0*\0_localizedUid\";N;s:15:\"\0*\0_languageUid\";N;s:16:\"\0*\0_versionedUid\";N;s:6:\"\0*\0pid\";N;s:61:\"\0TYPO3\\CMS\\Extbase\\DomainObject\\AbstractDomainObject\0_isClone\";b:0;s:69:\"\0TYPO3\\CMS\\Extbase\\DomainObject\\AbstractDomainObject\0_cleanProperties\";a:0:{}}s:18:\"\0*\0compareUserList\";a:0:{}}\";s:10:\"FormEngine\";a:2:{i:0;a:1:{s:32:\"ac7e2643d513409a4f822dc385dd7ed2\";a:4:{i:0;s:24:\"autogenerated-6d8b51cdaa\";i:1;a:5:{s:4:\"edit\";a:1:{s:8:\"be_users\";a:1:{i:3;s:4:\"edit\";}}s:7:\"defVals\";N;s:12:\"overrideVals\";N;s:11:\"columnsOnly\";N;s:6:\"noView\";N;}i:2;s:31:\"&edit%5Bbe_users%5D%5B3%5D=edit\";i:3;a:5:{s:5:\"table\";s:8:\"be_users\";s:3:\"uid\";i:3;s:3:\"pid\";i:0;s:3:\"cmd\";s:4:\"edit\";s:12:\"deleteAccess\";b:1;}}}i:1;s:32:\"ac7e2643d513409a4f822dc385dd7ed2\";}s:57:\"TYPO3\\CMS\\Backend\\Utility\\BackendUtility::getUpdateSignal\";a:0:{}s:10:\"web_layout\";a:2:{s:8:\"function\";s:1:\"1\";s:8:\"language\";s:1:\"0\";}}s:14:\"emailMeAtLogin\";i:0;s:8:\"titleLen\";i:50;s:8:\"edit_RTE\";s:1:\"1\";s:20:\"edit_docModuleUpload\";s:1:\"1\";s:25:\"resizeTextareas_MaxHeight\";i:500;s:4:\"lang\";s:0:\"\";s:19:\"firstLoginTimeStamp\";i:1611516543;s:15:\"moduleSessionID\";a:5:{s:28:\"dashboard/current_dashboard/\";s:32:\"3aed1c519abff55d99ed105cd37845c4\";s:9:\"tx_beuser\";s:32:\"d82d976053a904209354f1897c317ccc\";s:10:\"FormEngine\";s:32:\"3aed1c519abff55d99ed105cd37845c4\";s:57:\"TYPO3\\CMS\\Backend\\Utility\\BackendUtility::getUpdateSignal\";s:32:\"d82d976053a904209354f1897c317ccc\";s:10:\"web_layout\";s:32:\"d82d976053a904209354f1897c317ccc\";}}',NULL,NULL,1,NULL,1611517857,0,NULL,'','',0),(2,0,1611516525,1611516525,0,0,0,0,0,NULL,'_cli_',0,'$argon2i$v=19$m=65536,t=16,p=1$cjRzQmdOdkQyUTlOSFJlZw$+zkcQc3t90ttg9BOA9vLV6y15bWcyD4mbOW3n71XSSQ',1,'','','',NULL,0,'',NULL,'','a:9:{s:14:\"interfaceSetup\";s:0:\"\";s:10:\"moduleData\";a:0:{}s:14:\"emailMeAtLogin\";i:0;s:8:\"titleLen\";i:50;s:8:\"edit_RTE\";s:1:\"1\";s:20:\"edit_docModuleUpload\";s:1:\"1\";s:25:\"resizeTextareas_MaxHeight\";i:500;s:4:\"lang\";s:0:\"\";s:19:\"firstLoginTimeStamp\";i:1611516525;}',NULL,NULL,1,NULL,0,0,NULL,'','',0),(3,0,1611516583,1611516554,1,0,0,0,0,'','pptr_admin',0,'$argon2i$v=19$m=65536,t=16,p=1$NWdxMWx0d1g3b2ZQTGF3Rg$cVsGshJeKDHWXbtbLHPNgoyPH2keNOy9Z1ZBkkavjRM',1,'','','','',3,'','','','a:10:{s:14:\"interfaceSetup\";s:7:\"backend\";s:10:\"moduleData\";a:1:{s:28:\"dashboard/current_dashboard/\";s:40:\"77e5ddd12d2ab8697b32fe5e98e5ca47847df8d6\";}s:14:\"emailMeAtLogin\";i:0;s:8:\"titleLen\";i:50;s:8:\"edit_RTE\";s:1:\"1\";s:20:\"edit_docModuleUpload\";s:1:\"1\";s:25:\"resizeTextareas_MaxHeight\";i:500;s:4:\"lang\";s:0:\"\";s:19:\"firstLoginTimeStamp\";i:1611516593;s:15:\"moduleSessionID\";a:1:{s:28:\"dashboard/current_dashboard/\";s:32:\"a9867d4b17e1ec2797216dfac7fdfe6b\";}}','','readFolder,writeFolder,addFolder,renameFolder,moveFolder,deleteFolder,readFile,writeFile,addFile,renameFile,replaceFile,moveFile,copyFile,deleteFile',1,'',1611516593,0,'','','',0),(4,0,0,0,0,0,1,0,0,NULL,'styleguide demo user 1',0,'$argon2i$v=19$m=65536,t=16,p=1$bGpraEFaZ015Q3BXUGJSdw$OeVz62KcrfSj/cpUZVmFEOoT1s73D9sML58p7ktfKqk',0,'1,2','','',NULL,0,'',NULL,'',NULL,NULL,NULL,1,NULL,0,0,NULL,'','',1),(5,0,0,0,0,0,1,0,0,NULL,'styleguide demo user 2',0,'$argon2i$v=19$m=65536,t=16,p=1$Qi9UNllJa0Z4T2Fxdkt4OA$TTX0Ll0KNG7wG5zEpLmMXLqwkG8gHXHLy4NvRNzuuTE',1,'','','',NULL,0,'',NULL,'',NULL,NULL,NULL,1,NULL,0,0,NULL,'','',1);
/*!40000 ALTER TABLE `be_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_hash`
--

DROP TABLE IF EXISTS `cache_hash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_hash` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT 0,
  `content` longblob DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_hash`
--

LOCK TABLES `cache_hash` WRITE;
/*!40000 ALTER TABLE `cache_hash` DISABLE KEYS */;
INSERT INTO `cache_hash` VALUES (1,'10df67e46713f522ef691bdb554c2064',2145909600,'a:3:{s:8:\"options.\";a:8:{s:15:\"enableBookmarks\";s:1:\"1\";s:10:\"file_list.\";a:4:{s:28:\"enableDisplayBigControlPanel\";s:10:\"selectable\";s:23:\"enableDisplayThumbnails\";s:10:\"selectable\";s:15:\"enableClipBoard\";s:10:\"selectable\";s:10:\"thumbnail.\";a:2:{s:5:\"width\";s:2:\"64\";s:6:\"height\";s:2:\"64\";}}s:9:\"pageTree.\";a:1:{s:31:\"doktypesToShowInNewPageDragArea\";s:29:\"1,6,4,7,3,254,255,199,116,116\";}s:12:\"contextMenu.\";a:1:{s:6:\"table.\";a:3:{s:6:\"pages.\";a:2:{s:12:\"disableItems\";s:0:\"\";s:5:\"tree.\";a:1:{s:12:\"disableItems\";s:0:\"\";}}s:9:\"sys_file.\";a:2:{s:12:\"disableItems\";s:0:\"\";s:5:\"tree.\";a:1:{s:12:\"disableItems\";s:0:\"\";}}s:15:\"sys_filemounts.\";a:2:{s:12:\"disableItems\";s:0:\"\";s:5:\"tree.\";a:1:{s:12:\"disableItems\";s:0:\"\";}}}}s:11:\"saveDocView\";s:1:\"1\";s:10:\"saveDocNew\";s:1:\"1\";s:11:\"saveDocNew.\";a:3:{s:5:\"pages\";s:1:\"0\";s:8:\"sys_file\";s:1:\"0\";s:17:\"sys_file_metadata\";s:1:\"0\";}s:14:\"disableDelete.\";a:1:{s:8:\"sys_file\";s:1:\"1\";}}s:9:\"admPanel.\";a:1:{s:7:\"enable.\";a:1:{s:3:\"all\";s:1:\"1\";}}s:12:\"TCAdefaults.\";a:1:{s:9:\"sys_note.\";a:2:{s:6:\"author\";s:0:\"\";s:5:\"email\";s:0:\"\";}}}'),(2,'e6b32542c42de818a102227d4e7e00d9',2145909600,'a:2:{i:0;a:3:{s:8:\"TSconfig\";a:3:{s:4:\"mod.\";a:4:{s:9:\"web_list.\";a:4:{s:28:\"enableDisplayBigControlPanel\";s:10:\"selectable\";s:15:\"enableClipBoard\";s:10:\"selectable\";s:18:\"tableDisplayOrder.\";a:9:{s:9:\"be_users.\";a:1:{s:5:\"after\";s:9:\"be_groups\";}s:15:\"sys_filemounts.\";a:1:{s:5:\"after\";s:8:\"be_users\";}s:17:\"sys_file_storage.\";a:1:{s:5:\"after\";s:14:\"sys_filemounts\";}s:13:\"sys_language.\";a:1:{s:5:\"after\";s:16:\"sys_file_storage\";}s:9:\"fe_users.\";a:2:{s:5:\"after\";s:9:\"fe_groups\";s:6:\"before\";s:5:\"pages\";}s:13:\"sys_template.\";a:1:{s:5:\"after\";s:5:\"pages\";}s:15:\"backend_layout.\";a:1:{s:5:\"after\";s:5:\"pages\";}s:11:\"tt_content.\";a:1:{s:5:\"after\";s:33:\"pages,backend_layout,sys_template\";}s:13:\"sys_category.\";a:1:{s:5:\"after\";s:10:\"tt_content\";}}s:12:\"searchLevel.\";a:1:{s:6:\"items.\";a:6:{i:-1;s:82:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.infinite\";i:0;s:75:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.0\";i:1;s:75:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.1\";i:2;s:75:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.2\";i:3;s:75:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.3\";i:4;s:75:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.4\";}}}s:8:\"wizards.\";a:2:{s:10:\"newRecord.\";a:1:{s:6:\"pages.\";a:1:{s:5:\"show.\";a:3:{s:10:\"pageInside\";s:1:\"1\";s:9:\"pageAfter\";s:1:\"1\";s:18:\"pageSelectPosition\";s:1:\"1\";}}}s:18:\"newContentElement.\";a:1:{s:12:\"wizardItems.\";a:6:{s:7:\"common.\";a:3:{s:9:\"elements.\";a:9:{s:7:\"header.\";a:4:{s:14:\"iconIdentifier\";s:14:\"content-header\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_headerOnly_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_headerOnly_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:6:\"header\";}}s:5:\"text.\";a:4:{s:14:\"iconIdentifier\";s:12:\"content-text\";s:5:\"title\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_regularText_title\";s:11:\"description\";s:105:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_regularText_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:4:\"text\";}}s:8:\"textpic.\";a:4:{s:14:\"iconIdentifier\";s:15:\"content-textpic\";s:5:\"title\";s:97:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textImage_title\";s:11:\"description\";s:103:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textImage_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:7:\"textpic\";}}s:6:\"image.\";a:4:{s:14:\"iconIdentifier\";s:13:\"content-image\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_imagesOnly_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_imagesOnly_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:5:\"image\";}}s:10:\"textmedia.\";a:4:{s:14:\"iconIdentifier\";s:17:\"content-textmedia\";s:5:\"title\";s:97:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textMedia_title\";s:11:\"description\";s:103:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textMedia_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:9:\"textmedia\";}}s:8:\"bullets.\";a:4:{s:14:\"iconIdentifier\";s:15:\"content-bullets\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_bulletList_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_bulletList_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:7:\"bullets\";}}s:6:\"table.\";a:4:{s:14:\"iconIdentifier\";s:13:\"content-table\";s:5:\"title\";s:93:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_table_title\";s:11:\"description\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_table_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:5:\"table\";}}s:8:\"uploads.\";a:4:{s:14:\"iconIdentifier\";s:23:\"content-special-uploads\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_filelinks_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_filelinks_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:7:\"uploads\";}}s:27:\"examples_newcontentelement.\";a:4:{s:14:\"iconIdentifier\";s:12:\"content-text\";s:5:\"title\";s:90:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_newcontentelement_title\";s:11:\"description\";s:96:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_newcontentelement_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:26:\"examples_newcontentelement\";}}}s:4:\"show\";s:111:\"header,text,textpic,image,textmedia,bullets,table,uploads,examples_newcontentelement,examples_newcontentelement\";s:6:\"header\";s:81:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common\";}s:5:\"menu.\";a:3:{s:9:\"elements.\";a:11:{s:14:\"menu_abstract.\";a:4:{s:14:\"iconIdentifier\";s:21:\"content-menu-abstract\";s:5:\"title\";s:94:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_abstract.title\";s:11:\"description\";s:100:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_abstract.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:13:\"menu_abstract\";}}s:25:\"menu_categorized_content.\";a:4:{s:14:\"iconIdentifier\";s:24:\"content-menu-categorized\";s:5:\"title\";s:105:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_categorized_content.title\";s:11:\"description\";s:111:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_categorized_content.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:24:\"menu_categorized_content\";}}s:23:\"menu_categorized_pages.\";a:4:{s:14:\"iconIdentifier\";s:24:\"content-menu-categorized\";s:5:\"title\";s:103:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_categorized_pages.title\";s:11:\"description\";s:109:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_categorized_pages.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:22:\"menu_categorized_pages\";}}s:11:\"menu_pages.\";a:4:{s:14:\"iconIdentifier\";s:18:\"content-menu-pages\";s:5:\"title\";s:91:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_pages.title\";s:11:\"description\";s:97:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_pages.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:10:\"menu_pages\";}}s:14:\"menu_subpages.\";a:4:{s:14:\"iconIdentifier\";s:18:\"content-menu-pages\";s:5:\"title\";s:94:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_subpages.title\";s:11:\"description\";s:100:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_subpages.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:13:\"menu_subpages\";}}s:22:\"menu_recently_updated.\";a:4:{s:14:\"iconIdentifier\";s:29:\"content-menu-recently-updated\";s:5:\"title\";s:102:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_recently_updated.title\";s:11:\"description\";s:108:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_recently_updated.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:21:\"menu_recently_updated\";}}s:19:\"menu_related_pages.\";a:4:{s:14:\"iconIdentifier\";s:20:\"content-menu-related\";s:5:\"title\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_related_pages.title\";s:11:\"description\";s:105:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_related_pages.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:18:\"menu_related_pages\";}}s:13:\"menu_section.\";a:4:{s:14:\"iconIdentifier\";s:20:\"content-menu-section\";s:5:\"title\";s:93:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_section.title\";s:11:\"description\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_section.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:12:\"menu_section\";}}s:19:\"menu_section_pages.\";a:4:{s:14:\"iconIdentifier\";s:20:\"content-menu-section\";s:5:\"title\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_section_pages.title\";s:11:\"description\";s:105:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_section_pages.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:18:\"menu_section_pages\";}}s:13:\"menu_sitemap.\";a:4:{s:14:\"iconIdentifier\";s:20:\"content-menu-sitemap\";s:5:\"title\";s:93:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_sitemap.title\";s:11:\"description\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_sitemap.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:12:\"menu_sitemap\";}}s:19:\"menu_sitemap_pages.\";a:4:{s:14:\"iconIdentifier\";s:26:\"content-menu-sitemap-pages\";s:5:\"title\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_sitemap_pages.title\";s:11:\"description\";s:105:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_sitemap_pages.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:18:\"menu_sitemap_pages\";}}}s:4:\"show\";s:191:\"menu_abstract,menu_categorized_content,menu_categorized_pages,menu_pages,menu_subpages,menu_recently_updated,menu_related_pages,menu_section,menu_section_pages,menu_sitemap,menu_sitemap_pages\";s:6:\"header\";s:79:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu\";}s:8:\"special.\";a:3:{s:9:\"elements.\";a:3:{s:5:\"html.\";a:4:{s:14:\"iconIdentifier\";s:20:\"content-special-html\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_plainHTML_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_plainHTML_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:4:\"html\";}}s:4:\"div.\";a:5:{s:14:\"iconIdentifier\";s:19:\"content-special-div\";s:5:\"title\";s:96:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_divider_title\";s:11:\"description\";s:102:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_divider_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:3:\"div\";}s:12:\"saveAndClose\";s:4:\"true\";}s:9:\"shortcut.\";a:4:{s:14:\"iconIdentifier\";s:24:\"content-special-shortcut\";s:5:\"title\";s:97:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_shortcut_title\";s:11:\"description\";s:103:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_shortcut_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:8:\"shortcut\";}}}s:4:\"show\";s:17:\"html,div,shortcut\";s:6:\"header\";s:82:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special\";}s:6:\"forms.\";a:3:{s:4:\"show\";s:27:\"formframework,felogin_login\";s:9:\"elements.\";a:2:{s:14:\"formframework.\";a:4:{s:14:\"iconIdentifier\";s:12:\"content-form\";s:5:\"title\";s:75:\"LLL:EXT:form/Resources/Private/Language/locallang.xlf:form_new_wizard_title\";s:11:\"description\";s:77:\"LLL:EXT:form/Resources/Private/Language/locallang:form_new_wizard_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:18:\"form_formframework\";}}s:14:\"felogin_login.\";a:4:{s:14:\"iconIdentifier\";s:22:\"content-elements-login\";s:5:\"title\";s:92:\"LLL:EXT:felogin/Resources/Private/Language/Database.xlf:tt_content.CType.felogin_login.title\";s:11:\"description\";s:98:\"LLL:EXT:felogin/Resources/Private/Language/Database.xlf:tt_content.CType.felogin_login.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:13:\"felogin_login\";}}}s:6:\"header\";s:80:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:forms\";}s:8:\"plugins.\";a:3:{s:6:\"header\";s:82:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:plugins\";s:9:\"elements.\";a:2:{s:8:\"general.\";a:4:{s:14:\"iconIdentifier\";s:14:\"content-plugin\";s:5:\"title\";s:96:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:plugins_general_title\";s:11:\"description\";s:102:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:plugins_general_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:4:\"list\";}}s:9:\"examples.\";a:4:{s:14:\"iconIdentifier\";s:24:\"tx_examples-error-plugin\";s:5:\"title\";s:78:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:pierror_wizard_title\";s:11:\"description\";s:84:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:pierror_wizard_description\";s:21:\"tt_content_defValues.\";a:2:{s:5:\"CType\";s:4:\"list\";s:9:\"list_type\";s:14:\"examples_error\";}}}s:4:\"show\";s:1:\"*\";}s:23:\"dataProcessingExamples.\";a:3:{s:6:\"header\";s:80:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:dataProcessingExamples\";s:9:\"elements.\";a:9:{s:23:\"examples_newcontentcsv.\";a:4:{s:14:\"iconIdentifier\";s:25:\"mimetypes-x-content-table\";s:5:\"title\";s:86:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_newcontentcsv_title\";s:11:\"description\";s:92:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_newcontentcsv_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:22:\"examples_newcontentcsv\";}}s:20:\"examples_dataprocdb.\";a:4:{s:14:\"iconIdentifier\";s:23:\"content-special-uploads\";s:5:\"title\";s:83:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_dataprocdb_title\";s:11:\"description\";s:89:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_dataprocdb_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:19:\"examples_dataprocdb\";}}s:22:\"examples_dataproclang.\";a:4:{s:14:\"iconIdentifier\";s:23:\"install-manage-language\";s:5:\"title\";s:85:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_dataproclang_title\";s:11:\"description\";s:91:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_dataproclang_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:21:\"examples_dataproclang\";}}s:22:\"examples_dataprocmenu.\";a:4:{s:14:\"iconIdentifier\";s:18:\"content-menu-pages\";s:5:\"title\";s:85:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_dataprocmenu_title\";s:11:\"description\";s:91:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_dataprocmenu_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:21:\"examples_dataprocmenu\";}}s:22:\"examples_dataprocsite.\";a:4:{s:14:\"iconIdentifier\";s:25:\"apps-pagetree-folder-root\";s:5:\"title\";s:85:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_dataprocsite_title\";s:11:\"description\";s:91:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_dataprocsite_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:21:\"examples_dataprocsite\";}}s:23:\"examples_dataprocsplit.\";a:4:{s:14:\"iconIdentifier\";s:16:\"content-timeline\";s:5:\"title\";s:86:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_dataprocsplit_title\";s:11:\"description\";s:92:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_dataprocsplit_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:22:\"examples_dataprocsplit\";}}s:23:\"examples_dataprocfiles.\";a:4:{s:14:\"iconIdentifier\";s:13:\"content-image\";s:5:\"title\";s:86:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_dataprocfiles_title\";s:11:\"description\";s:92:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_dataprocfiles_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:22:\"examples_dataprocfiles\";}}s:25:\"examples_dataprocgallery.\";a:4:{s:14:\"iconIdentifier\";s:17:\"content-dashboard\";s:5:\"title\";s:88:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_dataprocgallery_title\";s:11:\"description\";s:94:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_dataprocgallery_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:24:\"examples_dataprocgallery\";}}s:24:\"examples_dataproccustom.\";a:4:{s:14:\"iconIdentifier\";s:17:\"content-dashboard\";s:5:\"title\";s:87:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_dataproccustom_title\";s:11:\"description\";s:93:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_dataproccustom_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:23:\"examples_dataproccustom\";}}}s:4:\"show\";s:207:\"examples_newcontentcsv,examples_dataprocdb,examples_dataproclang, examples_dataprocmenu, examples_dataprocsite, examples_dataprocsplit, examples_dataprocfiles,examples_dataprocgallery,examples_dataproccustom\";}}}}s:9:\"web_view.\";a:1:{s:19:\"previewFrameWidths.\";a:12:{s:5:\"1920.\";a:4:{s:5:\"label\";s:66:\"LLL:EXT:viewpage/Resources/Private/Language/locallang.xlf:computer\";s:4:\"type\";s:7:\"desktop\";s:5:\"width\";s:4:\"1920\";s:6:\"height\";s:4:\"1080\";}s:5:\"1366.\";a:4:{s:5:\"label\";s:66:\"LLL:EXT:viewpage/Resources/Private/Language/locallang.xlf:computer\";s:4:\"type\";s:7:\"desktop\";s:5:\"width\";s:4:\"1366\";s:6:\"height\";s:3:\"768\";}s:5:\"1280.\";a:4:{s:5:\"label\";s:66:\"LLL:EXT:viewpage/Resources/Private/Language/locallang.xlf:computer\";s:4:\"type\";s:7:\"desktop\";s:5:\"width\";s:4:\"1280\";s:6:\"height\";s:4:\"1024\";}s:5:\"1024.\";a:4:{s:5:\"label\";s:66:\"LLL:EXT:viewpage/Resources/Private/Language/locallang.xlf:computer\";s:4:\"type\";s:7:\"desktop\";s:5:\"width\";s:4:\"1024\";s:6:\"height\";s:3:\"768\";}s:7:\"nexus7.\";a:4:{s:5:\"label\";s:7:\"Nexus 7\";s:4:\"type\";s:6:\"tablet\";s:5:\"width\";s:3:\"600\";s:6:\"height\";s:3:\"960\";}s:8:\"nexus6p.\";a:4:{s:5:\"label\";s:8:\"Nexus 6P\";s:4:\"type\";s:6:\"mobile\";s:5:\"width\";s:3:\"411\";s:6:\"height\";s:3:\"731\";}s:8:\"ipadpro.\";a:4:{s:5:\"label\";s:8:\"iPad Pro\";s:4:\"type\";s:6:\"tablet\";s:5:\"width\";s:4:\"1024\";s:6:\"height\";s:4:\"1366\";}s:8:\"ipadair.\";a:4:{s:5:\"label\";s:8:\"iPad Air\";s:4:\"type\";s:6:\"tablet\";s:5:\"width\";s:3:\"768\";s:6:\"height\";s:4:\"1024\";}s:12:\"iphone7plus.\";a:4:{s:5:\"label\";s:13:\"iPhone 7 Plus\";s:4:\"type\";s:6:\"mobile\";s:5:\"width\";s:3:\"414\";s:6:\"height\";s:3:\"736\";}s:8:\"iphone6.\";a:4:{s:5:\"label\";s:8:\"iPhone 6\";s:4:\"type\";s:6:\"mobile\";s:5:\"width\";s:3:\"375\";s:6:\"height\";s:3:\"667\";}s:8:\"iphone5.\";a:4:{s:5:\"label\";s:8:\"iPhone 5\";s:4:\"type\";s:6:\"mobile\";s:5:\"width\";s:3:\"320\";s:6:\"height\";s:3:\"568\";}s:8:\"iphone4.\";a:4:{s:5:\"label\";s:8:\"iPhone 4\";s:4:\"type\";s:6:\"mobile\";s:5:\"width\";s:3:\"320\";s:6:\"height\";s:3:\"480\";}}}s:9:\"web_info.\";a:1:{s:17:\"fieldDefinitions.\";a:5:{s:2:\"0.\";a:2:{s:5:\"label\";s:69:\"LLL:EXT:info/Resources/Private/Language/locallang_webinfo.xlf:pages_0\";s:6:\"fields\";s:75:\"title,uid,slug,starttime,endtime,fe_group,target,url,shortcut,shortcut_mode\";}s:2:\"1.\";a:2:{s:5:\"label\";s:69:\"LLL:EXT:info/Resources/Private/Language/locallang_webinfo.xlf:pages_1\";s:6:\"fields\";s:26:\"title,uid,###ALL_TABLES###\";}s:2:\"2.\";a:2:{s:5:\"label\";s:69:\"LLL:EXT:info/Resources/Private/Language/locallang_webinfo.xlf:pages_2\";s:6:\"fields\";s:93:\"title,uid,lastUpdated,newUntil,cache_timeout,php_tree_stop,TSconfig,is_siteroot,fe_login_mode\";}s:4:\"seo.\";a:2:{s:5:\"label\";s:64:\"LLL:EXT:seo/Resources/Private/Language/locallang_webinfo.xlf:seo\";s:6:\"fields\";s:102:\"title,slug,seo_title,description,no_index,no_follow,canonical_link,sitemap_changefreq,sitemap_priority\";}s:13:\"social_media.\";a:2:{s:5:\"label\";s:73:\"LLL:EXT:seo/Resources/Private/Language/locallang_webinfo.xlf:social_media\";s:6:\"fields\";s:63:\"title,og_title,og_description,twitter_title,twitter_description\";}}}}s:8:\"TCEMAIN.\";a:2:{s:18:\"translateToMessage\";s:16:\"Translate to %s:\";s:12:\"linkHandler.\";a:8:{s:5:\"page.\";a:2:{s:7:\"handler\";s:48:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\PageLinkHandler\";s:5:\"label\";s:77:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:page\";}s:5:\"file.\";a:4:{s:7:\"handler\";s:48:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\FileLinkHandler\";s:5:\"label\";s:77:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:file\";s:12:\"displayAfter\";s:4:\"page\";s:9:\"scanAfter\";s:4:\"page\";}s:7:\"folder.\";a:4:{s:7:\"handler\";s:50:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\FolderLinkHandler\";s:5:\"label\";s:79:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:folder\";s:12:\"displayAfter\";s:4:\"file\";s:9:\"scanAfter\";s:4:\"file\";}s:4:\"url.\";a:4:{s:7:\"handler\";s:47:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\UrlLinkHandler\";s:5:\"label\";s:79:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:extUrl\";s:12:\"displayAfter\";s:6:\"folder\";s:9:\"scanAfter\";s:9:\"telephone\";}s:5:\"mail.\";a:4:{s:7:\"handler\";s:48:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\MailLinkHandler\";s:5:\"label\";s:78:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:email\";s:12:\"displayAfter\";s:3:\"url\";s:10:\"scanBefore\";s:3:\"url\";}s:10:\"telephone.\";a:4:{s:7:\"handler\";s:53:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\TelephoneLinkHandler\";s:5:\"label\";s:82:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:telephone\";s:12:\"displayAfter\";s:4:\"mail\";s:10:\"scanBefore\";s:3:\"url\";}s:6:\"haiku.\";a:5:{s:7:\"handler\";s:50:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\RecordLinkHandler\";s:5:\"label\";s:76:\"LLL:EXT:examples/Resources/Private/Language/locallang_browse_links.xlf:haiku\";s:14:\"configuration.\";a:1:{s:5:\"table\";s:17:\"tx_examples_haiku\";}s:12:\"displayAfter\";s:3:\"url\";s:10:\"scanBefore\";s:4:\"page\";}s:7:\"github.\";a:5:{s:7:\"handler\";s:45:\"T3docs\\Examples\\LinkHandler\\GitHubLinkHandler\";s:5:\"label\";s:77:\"LLL:EXT:examples/Resources/Private/Language/locallang_browse_links.xlf:github\";s:12:\"displayAfter\";s:5:\"haiku\";s:10:\"scanBefore\";s:3:\"url\";s:14:\"configuration.\";a:2:{s:7:\"project\";s:46:\"TYPO3-Documentation/TYPO3CMS-Reference-CoreApi\";s:6:\"action\";s:6:\"issues\";}}}}s:8:\"TCEFORM.\";a:1:{s:11:\"tt_content.\";a:1:{s:12:\"imageorient.\";a:1:{s:6:\"types.\";a:1:{s:6:\"image.\";a:1:{s:11:\"removeItems\";s:18:\"8,9,10,17,18,25,26\";}}}}}}s:8:\"sections\";a:0:{}s:5:\"match\";a:0:{}}i:1;s:32:\"c8c6cce5bf3ca851932d56a1e3f30ddb\";}'),(3,'195daff0bc423d075429a77d65b5315f',2145909600,'a:3:{s:8:\"options.\";a:8:{s:15:\"enableBookmarks\";s:1:\"1\";s:10:\"file_list.\";a:4:{s:28:\"enableDisplayBigControlPanel\";s:10:\"selectable\";s:23:\"enableDisplayThumbnails\";s:10:\"selectable\";s:15:\"enableClipBoard\";s:10:\"selectable\";s:10:\"thumbnail.\";a:2:{s:5:\"width\";s:2:\"64\";s:6:\"height\";s:2:\"64\";}}s:9:\"pageTree.\";a:1:{s:31:\"doktypesToShowInNewPageDragArea\";s:25:\"1,6,4,7,3,254,255,199,116\";}s:12:\"contextMenu.\";a:1:{s:6:\"table.\";a:3:{s:6:\"pages.\";a:2:{s:12:\"disableItems\";s:0:\"\";s:5:\"tree.\";a:1:{s:12:\"disableItems\";s:0:\"\";}}s:9:\"sys_file.\";a:2:{s:12:\"disableItems\";s:0:\"\";s:5:\"tree.\";a:1:{s:12:\"disableItems\";s:0:\"\";}}s:15:\"sys_filemounts.\";a:2:{s:12:\"disableItems\";s:0:\"\";s:5:\"tree.\";a:1:{s:12:\"disableItems\";s:0:\"\";}}}}s:11:\"saveDocView\";s:1:\"1\";s:10:\"saveDocNew\";s:1:\"1\";s:11:\"saveDocNew.\";a:3:{s:5:\"pages\";s:1:\"0\";s:8:\"sys_file\";s:1:\"0\";s:17:\"sys_file_metadata\";s:1:\"0\";}s:14:\"disableDelete.\";a:1:{s:8:\"sys_file\";s:1:\"1\";}}s:9:\"admPanel.\";a:1:{s:7:\"enable.\";a:1:{s:3:\"all\";s:1:\"1\";}}s:12:\"TCAdefaults.\";a:1:{s:9:\"sys_note.\";a:2:{s:6:\"author\";s:0:\"\";s:5:\"email\";s:0:\"\";}}}'),(4,'d95a1a0515cbb2f0d05fab8ab68be95a',2145909600,'a:2:{i:0;a:3:{s:8:\"TSconfig\";a:3:{s:4:\"mod.\";a:4:{s:9:\"web_list.\";a:4:{s:28:\"enableDisplayBigControlPanel\";s:10:\"selectable\";s:15:\"enableClipBoard\";s:10:\"selectable\";s:18:\"tableDisplayOrder.\";a:9:{s:9:\"be_users.\";a:1:{s:5:\"after\";s:9:\"be_groups\";}s:15:\"sys_filemounts.\";a:1:{s:5:\"after\";s:8:\"be_users\";}s:17:\"sys_file_storage.\";a:1:{s:5:\"after\";s:14:\"sys_filemounts\";}s:13:\"sys_language.\";a:1:{s:5:\"after\";s:16:\"sys_file_storage\";}s:9:\"fe_users.\";a:2:{s:5:\"after\";s:9:\"fe_groups\";s:6:\"before\";s:5:\"pages\";}s:13:\"sys_template.\";a:1:{s:5:\"after\";s:5:\"pages\";}s:15:\"backend_layout.\";a:1:{s:5:\"after\";s:5:\"pages\";}s:11:\"tt_content.\";a:1:{s:5:\"after\";s:33:\"pages,backend_layout,sys_template\";}s:13:\"sys_category.\";a:1:{s:5:\"after\";s:10:\"tt_content\";}}s:12:\"searchLevel.\";a:1:{s:6:\"items.\";a:6:{i:-1;s:82:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.infinite\";i:0;s:75:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.0\";i:1;s:75:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.1\";i:2;s:75:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.2\";i:3;s:75:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.3\";i:4;s:75:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.4\";}}}s:8:\"wizards.\";a:2:{s:10:\"newRecord.\";a:1:{s:6:\"pages.\";a:1:{s:5:\"show.\";a:3:{s:10:\"pageInside\";s:1:\"1\";s:9:\"pageAfter\";s:1:\"1\";s:18:\"pageSelectPosition\";s:1:\"1\";}}}s:18:\"newContentElement.\";a:1:{s:12:\"wizardItems.\";a:6:{s:7:\"common.\";a:3:{s:9:\"elements.\";a:9:{s:7:\"header.\";a:4:{s:14:\"iconIdentifier\";s:14:\"content-header\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_headerOnly_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_headerOnly_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:6:\"header\";}}s:5:\"text.\";a:4:{s:14:\"iconIdentifier\";s:12:\"content-text\";s:5:\"title\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_regularText_title\";s:11:\"description\";s:105:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_regularText_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:4:\"text\";}}s:8:\"textpic.\";a:4:{s:14:\"iconIdentifier\";s:15:\"content-textpic\";s:5:\"title\";s:97:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textImage_title\";s:11:\"description\";s:103:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textImage_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:7:\"textpic\";}}s:6:\"image.\";a:4:{s:14:\"iconIdentifier\";s:13:\"content-image\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_imagesOnly_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_imagesOnly_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:5:\"image\";}}s:10:\"textmedia.\";a:4:{s:14:\"iconIdentifier\";s:17:\"content-textmedia\";s:5:\"title\";s:97:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textMedia_title\";s:11:\"description\";s:103:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textMedia_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:9:\"textmedia\";}}s:8:\"bullets.\";a:4:{s:14:\"iconIdentifier\";s:15:\"content-bullets\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_bulletList_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_bulletList_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:7:\"bullets\";}}s:6:\"table.\";a:4:{s:14:\"iconIdentifier\";s:13:\"content-table\";s:5:\"title\";s:93:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_table_title\";s:11:\"description\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_table_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:5:\"table\";}}s:8:\"uploads.\";a:4:{s:14:\"iconIdentifier\";s:23:\"content-special-uploads\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_filelinks_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_filelinks_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:7:\"uploads\";}}s:27:\"examples_newcontentelement.\";a:4:{s:14:\"iconIdentifier\";s:12:\"content-text\";s:5:\"title\";s:90:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_newcontentelement_title\";s:11:\"description\";s:96:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_newcontentelement_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:26:\"examples_newcontentelement\";}}}s:4:\"show\";s:111:\"header,text,textpic,image,textmedia,bullets,table,uploads,examples_newcontentelement,examples_newcontentelement\";s:6:\"header\";s:81:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common\";}s:5:\"menu.\";a:3:{s:9:\"elements.\";a:11:{s:14:\"menu_abstract.\";a:4:{s:14:\"iconIdentifier\";s:21:\"content-menu-abstract\";s:5:\"title\";s:94:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_abstract.title\";s:11:\"description\";s:100:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_abstract.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:13:\"menu_abstract\";}}s:25:\"menu_categorized_content.\";a:4:{s:14:\"iconIdentifier\";s:24:\"content-menu-categorized\";s:5:\"title\";s:105:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_categorized_content.title\";s:11:\"description\";s:111:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_categorized_content.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:24:\"menu_categorized_content\";}}s:23:\"menu_categorized_pages.\";a:4:{s:14:\"iconIdentifier\";s:24:\"content-menu-categorized\";s:5:\"title\";s:103:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_categorized_pages.title\";s:11:\"description\";s:109:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_categorized_pages.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:22:\"menu_categorized_pages\";}}s:11:\"menu_pages.\";a:4:{s:14:\"iconIdentifier\";s:18:\"content-menu-pages\";s:5:\"title\";s:91:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_pages.title\";s:11:\"description\";s:97:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_pages.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:10:\"menu_pages\";}}s:14:\"menu_subpages.\";a:4:{s:14:\"iconIdentifier\";s:18:\"content-menu-pages\";s:5:\"title\";s:94:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_subpages.title\";s:11:\"description\";s:100:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_subpages.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:13:\"menu_subpages\";}}s:22:\"menu_recently_updated.\";a:4:{s:14:\"iconIdentifier\";s:29:\"content-menu-recently-updated\";s:5:\"title\";s:102:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_recently_updated.title\";s:11:\"description\";s:108:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_recently_updated.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:21:\"menu_recently_updated\";}}s:19:\"menu_related_pages.\";a:4:{s:14:\"iconIdentifier\";s:20:\"content-menu-related\";s:5:\"title\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_related_pages.title\";s:11:\"description\";s:105:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_related_pages.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:18:\"menu_related_pages\";}}s:13:\"menu_section.\";a:4:{s:14:\"iconIdentifier\";s:20:\"content-menu-section\";s:5:\"title\";s:93:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_section.title\";s:11:\"description\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_section.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:12:\"menu_section\";}}s:19:\"menu_section_pages.\";a:4:{s:14:\"iconIdentifier\";s:20:\"content-menu-section\";s:5:\"title\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_section_pages.title\";s:11:\"description\";s:105:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_section_pages.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:18:\"menu_section_pages\";}}s:13:\"menu_sitemap.\";a:4:{s:14:\"iconIdentifier\";s:20:\"content-menu-sitemap\";s:5:\"title\";s:93:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_sitemap.title\";s:11:\"description\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_sitemap.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:12:\"menu_sitemap\";}}s:19:\"menu_sitemap_pages.\";a:4:{s:14:\"iconIdentifier\";s:26:\"content-menu-sitemap-pages\";s:5:\"title\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_sitemap_pages.title\";s:11:\"description\";s:105:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_sitemap_pages.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:18:\"menu_sitemap_pages\";}}}s:4:\"show\";s:191:\"menu_abstract,menu_categorized_content,menu_categorized_pages,menu_pages,menu_subpages,menu_recently_updated,menu_related_pages,menu_section,menu_section_pages,menu_sitemap,menu_sitemap_pages\";s:6:\"header\";s:79:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu\";}s:8:\"special.\";a:3:{s:9:\"elements.\";a:3:{s:5:\"html.\";a:4:{s:14:\"iconIdentifier\";s:20:\"content-special-html\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_plainHTML_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_plainHTML_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:4:\"html\";}}s:4:\"div.\";a:5:{s:14:\"iconIdentifier\";s:19:\"content-special-div\";s:5:\"title\";s:96:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_divider_title\";s:11:\"description\";s:102:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_divider_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:3:\"div\";}s:12:\"saveAndClose\";s:4:\"true\";}s:9:\"shortcut.\";a:4:{s:14:\"iconIdentifier\";s:24:\"content-special-shortcut\";s:5:\"title\";s:97:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_shortcut_title\";s:11:\"description\";s:103:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_shortcut_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:8:\"shortcut\";}}}s:4:\"show\";s:17:\"html,div,shortcut\";s:6:\"header\";s:82:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special\";}s:6:\"forms.\";a:3:{s:4:\"show\";s:27:\"formframework,felogin_login\";s:9:\"elements.\";a:2:{s:14:\"formframework.\";a:4:{s:14:\"iconIdentifier\";s:12:\"content-form\";s:5:\"title\";s:75:\"LLL:EXT:form/Resources/Private/Language/locallang.xlf:form_new_wizard_title\";s:11:\"description\";s:77:\"LLL:EXT:form/Resources/Private/Language/locallang:form_new_wizard_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:18:\"form_formframework\";}}s:14:\"felogin_login.\";a:4:{s:14:\"iconIdentifier\";s:22:\"content-elements-login\";s:5:\"title\";s:92:\"LLL:EXT:felogin/Resources/Private/Language/Database.xlf:tt_content.CType.felogin_login.title\";s:11:\"description\";s:98:\"LLL:EXT:felogin/Resources/Private/Language/Database.xlf:tt_content.CType.felogin_login.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:13:\"felogin_login\";}}}s:6:\"header\";s:80:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:forms\";}s:8:\"plugins.\";a:3:{s:6:\"header\";s:82:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:plugins\";s:9:\"elements.\";a:2:{s:8:\"general.\";a:4:{s:14:\"iconIdentifier\";s:14:\"content-plugin\";s:5:\"title\";s:96:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:plugins_general_title\";s:11:\"description\";s:102:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:plugins_general_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:4:\"list\";}}s:9:\"examples.\";a:4:{s:14:\"iconIdentifier\";s:24:\"tx_examples-error-plugin\";s:5:\"title\";s:78:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:pierror_wizard_title\";s:11:\"description\";s:84:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:pierror_wizard_description\";s:21:\"tt_content_defValues.\";a:2:{s:5:\"CType\";s:4:\"list\";s:9:\"list_type\";s:14:\"examples_error\";}}}s:4:\"show\";s:1:\"*\";}s:23:\"dataProcessingExamples.\";a:3:{s:6:\"header\";s:80:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:dataProcessingExamples\";s:9:\"elements.\";a:9:{s:23:\"examples_newcontentcsv.\";a:4:{s:14:\"iconIdentifier\";s:25:\"mimetypes-x-content-table\";s:5:\"title\";s:86:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_newcontentcsv_title\";s:11:\"description\";s:92:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_newcontentcsv_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:22:\"examples_newcontentcsv\";}}s:20:\"examples_dataprocdb.\";a:4:{s:14:\"iconIdentifier\";s:23:\"content-special-uploads\";s:5:\"title\";s:83:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_dataprocdb_title\";s:11:\"description\";s:89:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_dataprocdb_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:19:\"examples_dataprocdb\";}}s:22:\"examples_dataproclang.\";a:4:{s:14:\"iconIdentifier\";s:23:\"install-manage-language\";s:5:\"title\";s:85:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_dataproclang_title\";s:11:\"description\";s:91:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_dataproclang_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:21:\"examples_dataproclang\";}}s:22:\"examples_dataprocmenu.\";a:4:{s:14:\"iconIdentifier\";s:18:\"content-menu-pages\";s:5:\"title\";s:85:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_dataprocmenu_title\";s:11:\"description\";s:91:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_dataprocmenu_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:21:\"examples_dataprocmenu\";}}s:22:\"examples_dataprocsite.\";a:4:{s:14:\"iconIdentifier\";s:25:\"apps-pagetree-folder-root\";s:5:\"title\";s:85:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_dataprocsite_title\";s:11:\"description\";s:91:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_dataprocsite_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:21:\"examples_dataprocsite\";}}s:23:\"examples_dataprocsplit.\";a:4:{s:14:\"iconIdentifier\";s:16:\"content-timeline\";s:5:\"title\";s:86:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_dataprocsplit_title\";s:11:\"description\";s:92:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_dataprocsplit_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:22:\"examples_dataprocsplit\";}}s:23:\"examples_dataprocfiles.\";a:4:{s:14:\"iconIdentifier\";s:13:\"content-image\";s:5:\"title\";s:86:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_dataprocfiles_title\";s:11:\"description\";s:92:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_dataprocfiles_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:22:\"examples_dataprocfiles\";}}s:25:\"examples_dataprocgallery.\";a:4:{s:14:\"iconIdentifier\";s:17:\"content-dashboard\";s:5:\"title\";s:88:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_dataprocgallery_title\";s:11:\"description\";s:94:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_dataprocgallery_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:24:\"examples_dataprocgallery\";}}s:24:\"examples_dataproccustom.\";a:4:{s:14:\"iconIdentifier\";s:17:\"content-dashboard\";s:5:\"title\";s:87:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_dataproccustom_title\";s:11:\"description\";s:93:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_dataproccustom_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:23:\"examples_dataproccustom\";}}}s:4:\"show\";s:207:\"examples_newcontentcsv,examples_dataprocdb,examples_dataproclang, examples_dataprocmenu, examples_dataprocsite, examples_dataprocsplit, examples_dataprocfiles,examples_dataprocgallery,examples_dataproccustom\";}}}}s:9:\"web_view.\";a:1:{s:19:\"previewFrameWidths.\";a:12:{s:5:\"1920.\";a:4:{s:5:\"label\";s:66:\"LLL:EXT:viewpage/Resources/Private/Language/locallang.xlf:computer\";s:4:\"type\";s:7:\"desktop\";s:5:\"width\";s:4:\"1920\";s:6:\"height\";s:4:\"1080\";}s:5:\"1366.\";a:4:{s:5:\"label\";s:66:\"LLL:EXT:viewpage/Resources/Private/Language/locallang.xlf:computer\";s:4:\"type\";s:7:\"desktop\";s:5:\"width\";s:4:\"1366\";s:6:\"height\";s:3:\"768\";}s:5:\"1280.\";a:4:{s:5:\"label\";s:66:\"LLL:EXT:viewpage/Resources/Private/Language/locallang.xlf:computer\";s:4:\"type\";s:7:\"desktop\";s:5:\"width\";s:4:\"1280\";s:6:\"height\";s:4:\"1024\";}s:5:\"1024.\";a:4:{s:5:\"label\";s:66:\"LLL:EXT:viewpage/Resources/Private/Language/locallang.xlf:computer\";s:4:\"type\";s:7:\"desktop\";s:5:\"width\";s:4:\"1024\";s:6:\"height\";s:3:\"768\";}s:7:\"nexus7.\";a:4:{s:5:\"label\";s:7:\"Nexus 7\";s:4:\"type\";s:6:\"tablet\";s:5:\"width\";s:3:\"600\";s:6:\"height\";s:3:\"960\";}s:8:\"nexus6p.\";a:4:{s:5:\"label\";s:8:\"Nexus 6P\";s:4:\"type\";s:6:\"mobile\";s:5:\"width\";s:3:\"411\";s:6:\"height\";s:3:\"731\";}s:8:\"ipadpro.\";a:4:{s:5:\"label\";s:8:\"iPad Pro\";s:4:\"type\";s:6:\"tablet\";s:5:\"width\";s:4:\"1024\";s:6:\"height\";s:4:\"1366\";}s:8:\"ipadair.\";a:4:{s:5:\"label\";s:8:\"iPad Air\";s:4:\"type\";s:6:\"tablet\";s:5:\"width\";s:3:\"768\";s:6:\"height\";s:4:\"1024\";}s:12:\"iphone7plus.\";a:4:{s:5:\"label\";s:13:\"iPhone 7 Plus\";s:4:\"type\";s:6:\"mobile\";s:5:\"width\";s:3:\"414\";s:6:\"height\";s:3:\"736\";}s:8:\"iphone6.\";a:4:{s:5:\"label\";s:8:\"iPhone 6\";s:4:\"type\";s:6:\"mobile\";s:5:\"width\";s:3:\"375\";s:6:\"height\";s:3:\"667\";}s:8:\"iphone5.\";a:4:{s:5:\"label\";s:8:\"iPhone 5\";s:4:\"type\";s:6:\"mobile\";s:5:\"width\";s:3:\"320\";s:6:\"height\";s:3:\"568\";}s:8:\"iphone4.\";a:4:{s:5:\"label\";s:8:\"iPhone 4\";s:4:\"type\";s:6:\"mobile\";s:5:\"width\";s:3:\"320\";s:6:\"height\";s:3:\"480\";}}}s:9:\"web_info.\";a:1:{s:17:\"fieldDefinitions.\";a:5:{s:2:\"0.\";a:2:{s:5:\"label\";s:69:\"LLL:EXT:info/Resources/Private/Language/locallang_webinfo.xlf:pages_0\";s:6:\"fields\";s:75:\"title,uid,slug,starttime,endtime,fe_group,target,url,shortcut,shortcut_mode\";}s:2:\"1.\";a:2:{s:5:\"label\";s:69:\"LLL:EXT:info/Resources/Private/Language/locallang_webinfo.xlf:pages_1\";s:6:\"fields\";s:26:\"title,uid,###ALL_TABLES###\";}s:2:\"2.\";a:2:{s:5:\"label\";s:69:\"LLL:EXT:info/Resources/Private/Language/locallang_webinfo.xlf:pages_2\";s:6:\"fields\";s:93:\"title,uid,lastUpdated,newUntil,cache_timeout,php_tree_stop,TSconfig,is_siteroot,fe_login_mode\";}s:4:\"seo.\";a:2:{s:5:\"label\";s:64:\"LLL:EXT:seo/Resources/Private/Language/locallang_webinfo.xlf:seo\";s:6:\"fields\";s:102:\"title,slug,seo_title,description,no_index,no_follow,canonical_link,sitemap_changefreq,sitemap_priority\";}s:13:\"social_media.\";a:2:{s:5:\"label\";s:73:\"LLL:EXT:seo/Resources/Private/Language/locallang_webinfo.xlf:social_media\";s:6:\"fields\";s:63:\"title,og_title,og_description,twitter_title,twitter_description\";}}}}s:8:\"TCEMAIN.\";a:2:{s:18:\"translateToMessage\";s:16:\"Translate to %s:\";s:12:\"linkHandler.\";a:8:{s:5:\"page.\";a:2:{s:7:\"handler\";s:48:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\PageLinkHandler\";s:5:\"label\";s:77:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:page\";}s:5:\"file.\";a:4:{s:7:\"handler\";s:48:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\FileLinkHandler\";s:5:\"label\";s:77:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:file\";s:12:\"displayAfter\";s:4:\"page\";s:9:\"scanAfter\";s:4:\"page\";}s:7:\"folder.\";a:4:{s:7:\"handler\";s:50:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\FolderLinkHandler\";s:5:\"label\";s:79:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:folder\";s:12:\"displayAfter\";s:4:\"file\";s:9:\"scanAfter\";s:4:\"file\";}s:4:\"url.\";a:4:{s:7:\"handler\";s:47:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\UrlLinkHandler\";s:5:\"label\";s:79:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:extUrl\";s:12:\"displayAfter\";s:6:\"folder\";s:9:\"scanAfter\";s:9:\"telephone\";}s:5:\"mail.\";a:4:{s:7:\"handler\";s:48:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\MailLinkHandler\";s:5:\"label\";s:78:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:email\";s:12:\"displayAfter\";s:3:\"url\";s:10:\"scanBefore\";s:3:\"url\";}s:10:\"telephone.\";a:4:{s:7:\"handler\";s:53:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\TelephoneLinkHandler\";s:5:\"label\";s:82:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:telephone\";s:12:\"displayAfter\";s:4:\"mail\";s:10:\"scanBefore\";s:3:\"url\";}s:6:\"haiku.\";a:5:{s:7:\"handler\";s:50:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\RecordLinkHandler\";s:5:\"label\";s:76:\"LLL:EXT:examples/Resources/Private/Language/locallang_browse_links.xlf:haiku\";s:14:\"configuration.\";a:1:{s:5:\"table\";s:17:\"tx_examples_haiku\";}s:12:\"displayAfter\";s:3:\"url\";s:10:\"scanBefore\";s:4:\"page\";}s:7:\"github.\";a:5:{s:7:\"handler\";s:45:\"T3docs\\Examples\\LinkHandler\\GitHubLinkHandler\";s:5:\"label\";s:77:\"LLL:EXT:examples/Resources/Private/Language/locallang_browse_links.xlf:github\";s:12:\"displayAfter\";s:5:\"haiku\";s:10:\"scanBefore\";s:3:\"url\";s:14:\"configuration.\";a:2:{s:7:\"project\";s:46:\"TYPO3-Documentation/TYPO3CMS-Reference-CoreApi\";s:6:\"action\";s:6:\"issues\";}}}}s:8:\"TCEFORM.\";a:1:{s:11:\"tt_content.\";a:1:{s:12:\"imageorient.\";a:1:{s:6:\"types.\";a:1:{s:6:\"image.\";a:1:{s:11:\"removeItems\";s:18:\"8,9,10,17,18,25,26\";}}}}}}s:8:\"sections\";a:0:{}s:5:\"match\";a:0:{}}i:1;s:32:\"c8c6cce5bf3ca851932d56a1e3f30ddb\";}'),(5,'6b85b83acf00fb926fd3a29673cacc63',2145909600,'a:2:{i:0;a:3:{s:8:\"TSconfig\";a:3:{s:4:\"mod.\";a:4:{s:9:\"web_list.\";a:4:{s:28:\"enableDisplayBigControlPanel\";s:10:\"selectable\";s:15:\"enableClipBoard\";s:10:\"selectable\";s:18:\"tableDisplayOrder.\";a:9:{s:9:\"be_users.\";a:1:{s:5:\"after\";s:9:\"be_groups\";}s:15:\"sys_filemounts.\";a:1:{s:5:\"after\";s:8:\"be_users\";}s:17:\"sys_file_storage.\";a:1:{s:5:\"after\";s:14:\"sys_filemounts\";}s:13:\"sys_language.\";a:1:{s:5:\"after\";s:16:\"sys_file_storage\";}s:9:\"fe_users.\";a:2:{s:5:\"after\";s:9:\"fe_groups\";s:6:\"before\";s:5:\"pages\";}s:13:\"sys_template.\";a:1:{s:5:\"after\";s:5:\"pages\";}s:15:\"backend_layout.\";a:1:{s:5:\"after\";s:5:\"pages\";}s:11:\"tt_content.\";a:1:{s:5:\"after\";s:33:\"pages,backend_layout,sys_template\";}s:13:\"sys_category.\";a:1:{s:5:\"after\";s:10:\"tt_content\";}}s:12:\"searchLevel.\";a:1:{s:6:\"items.\";a:6:{i:-1;s:82:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.infinite\";i:0;s:75:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.0\";i:1;s:75:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.1\";i:2;s:75:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.2\";i:3;s:75:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.3\";i:4;s:75:\"EXT:core/Resources/Private/Language/locallang_core.xlf:labels.searchLevel.4\";}}}s:8:\"wizards.\";a:2:{s:10:\"newRecord.\";a:1:{s:6:\"pages.\";a:1:{s:5:\"show.\";a:3:{s:10:\"pageInside\";s:1:\"1\";s:9:\"pageAfter\";s:1:\"1\";s:18:\"pageSelectPosition\";s:1:\"1\";}}}s:18:\"newContentElement.\";a:1:{s:12:\"wizardItems.\";a:6:{s:7:\"common.\";a:3:{s:9:\"elements.\";a:9:{s:7:\"header.\";a:4:{s:14:\"iconIdentifier\";s:14:\"content-header\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_headerOnly_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_headerOnly_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:6:\"header\";}}s:5:\"text.\";a:4:{s:14:\"iconIdentifier\";s:12:\"content-text\";s:5:\"title\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_regularText_title\";s:11:\"description\";s:105:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_regularText_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:4:\"text\";}}s:8:\"textpic.\";a:4:{s:14:\"iconIdentifier\";s:15:\"content-textpic\";s:5:\"title\";s:97:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textImage_title\";s:11:\"description\";s:103:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textImage_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:7:\"textpic\";}}s:6:\"image.\";a:4:{s:14:\"iconIdentifier\";s:13:\"content-image\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_imagesOnly_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_imagesOnly_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:5:\"image\";}}s:10:\"textmedia.\";a:4:{s:14:\"iconIdentifier\";s:17:\"content-textmedia\";s:5:\"title\";s:97:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textMedia_title\";s:11:\"description\";s:103:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_textMedia_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:9:\"textmedia\";}}s:8:\"bullets.\";a:4:{s:14:\"iconIdentifier\";s:15:\"content-bullets\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_bulletList_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_bulletList_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:7:\"bullets\";}}s:6:\"table.\";a:4:{s:14:\"iconIdentifier\";s:13:\"content-table\";s:5:\"title\";s:93:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_table_title\";s:11:\"description\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common_table_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:5:\"table\";}}s:8:\"uploads.\";a:4:{s:14:\"iconIdentifier\";s:23:\"content-special-uploads\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_filelinks_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_filelinks_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:7:\"uploads\";}}s:27:\"examples_newcontentelement.\";a:4:{s:14:\"iconIdentifier\";s:12:\"content-text\";s:5:\"title\";s:90:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_newcontentelement_title\";s:11:\"description\";s:96:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_newcontentelement_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:26:\"examples_newcontentelement\";}}}s:4:\"show\";s:111:\"header,text,textpic,image,textmedia,bullets,table,uploads,examples_newcontentelement,examples_newcontentelement\";s:6:\"header\";s:81:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:common\";}s:5:\"menu.\";a:3:{s:9:\"elements.\";a:11:{s:14:\"menu_abstract.\";a:4:{s:14:\"iconIdentifier\";s:21:\"content-menu-abstract\";s:5:\"title\";s:94:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_abstract.title\";s:11:\"description\";s:100:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_abstract.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:13:\"menu_abstract\";}}s:25:\"menu_categorized_content.\";a:4:{s:14:\"iconIdentifier\";s:24:\"content-menu-categorized\";s:5:\"title\";s:105:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_categorized_content.title\";s:11:\"description\";s:111:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_categorized_content.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:24:\"menu_categorized_content\";}}s:23:\"menu_categorized_pages.\";a:4:{s:14:\"iconIdentifier\";s:24:\"content-menu-categorized\";s:5:\"title\";s:103:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_categorized_pages.title\";s:11:\"description\";s:109:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_categorized_pages.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:22:\"menu_categorized_pages\";}}s:11:\"menu_pages.\";a:4:{s:14:\"iconIdentifier\";s:18:\"content-menu-pages\";s:5:\"title\";s:91:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_pages.title\";s:11:\"description\";s:97:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_pages.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:10:\"menu_pages\";}}s:14:\"menu_subpages.\";a:4:{s:14:\"iconIdentifier\";s:18:\"content-menu-pages\";s:5:\"title\";s:94:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_subpages.title\";s:11:\"description\";s:100:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_subpages.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:13:\"menu_subpages\";}}s:22:\"menu_recently_updated.\";a:4:{s:14:\"iconIdentifier\";s:29:\"content-menu-recently-updated\";s:5:\"title\";s:102:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_recently_updated.title\";s:11:\"description\";s:108:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_recently_updated.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:21:\"menu_recently_updated\";}}s:19:\"menu_related_pages.\";a:4:{s:14:\"iconIdentifier\";s:20:\"content-menu-related\";s:5:\"title\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_related_pages.title\";s:11:\"description\";s:105:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_related_pages.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:18:\"menu_related_pages\";}}s:13:\"menu_section.\";a:4:{s:14:\"iconIdentifier\";s:20:\"content-menu-section\";s:5:\"title\";s:93:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_section.title\";s:11:\"description\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_section.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:12:\"menu_section\";}}s:19:\"menu_section_pages.\";a:4:{s:14:\"iconIdentifier\";s:20:\"content-menu-section\";s:5:\"title\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_section_pages.title\";s:11:\"description\";s:105:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_section_pages.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:18:\"menu_section_pages\";}}s:13:\"menu_sitemap.\";a:4:{s:14:\"iconIdentifier\";s:20:\"content-menu-sitemap\";s:5:\"title\";s:93:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_sitemap.title\";s:11:\"description\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_sitemap.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:12:\"menu_sitemap\";}}s:19:\"menu_sitemap_pages.\";a:4:{s:14:\"iconIdentifier\";s:26:\"content-menu-sitemap-pages\";s:5:\"title\";s:99:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_sitemap_pages.title\";s:11:\"description\";s:105:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu_sitemap_pages.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:18:\"menu_sitemap_pages\";}}}s:4:\"show\";s:191:\"menu_abstract,menu_categorized_content,menu_categorized_pages,menu_pages,menu_subpages,menu_recently_updated,menu_related_pages,menu_section,menu_section_pages,menu_sitemap,menu_sitemap_pages\";s:6:\"header\";s:79:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:menu\";}s:8:\"special.\";a:3:{s:9:\"elements.\";a:3:{s:5:\"html.\";a:4:{s:14:\"iconIdentifier\";s:20:\"content-special-html\";s:5:\"title\";s:98:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_plainHTML_title\";s:11:\"description\";s:104:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_plainHTML_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:4:\"html\";}}s:4:\"div.\";a:5:{s:14:\"iconIdentifier\";s:19:\"content-special-div\";s:5:\"title\";s:96:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_divider_title\";s:11:\"description\";s:102:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_divider_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:3:\"div\";}s:12:\"saveAndClose\";s:4:\"true\";}s:9:\"shortcut.\";a:4:{s:14:\"iconIdentifier\";s:24:\"content-special-shortcut\";s:5:\"title\";s:97:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_shortcut_title\";s:11:\"description\";s:103:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special_shortcut_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:8:\"shortcut\";}}}s:4:\"show\";s:17:\"html,div,shortcut\";s:6:\"header\";s:82:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:special\";}s:6:\"forms.\";a:3:{s:4:\"show\";s:27:\"formframework,felogin_login\";s:9:\"elements.\";a:2:{s:14:\"formframework.\";a:4:{s:14:\"iconIdentifier\";s:12:\"content-form\";s:5:\"title\";s:75:\"LLL:EXT:form/Resources/Private/Language/locallang.xlf:form_new_wizard_title\";s:11:\"description\";s:77:\"LLL:EXT:form/Resources/Private/Language/locallang:form_new_wizard_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:18:\"form_formframework\";}}s:14:\"felogin_login.\";a:4:{s:14:\"iconIdentifier\";s:22:\"content-elements-login\";s:5:\"title\";s:92:\"LLL:EXT:felogin/Resources/Private/Language/Database.xlf:tt_content.CType.felogin_login.title\";s:11:\"description\";s:98:\"LLL:EXT:felogin/Resources/Private/Language/Database.xlf:tt_content.CType.felogin_login.description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:13:\"felogin_login\";}}}s:6:\"header\";s:80:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:forms\";}s:8:\"plugins.\";a:3:{s:6:\"header\";s:82:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:plugins\";s:9:\"elements.\";a:2:{s:8:\"general.\";a:4:{s:14:\"iconIdentifier\";s:14:\"content-plugin\";s:5:\"title\";s:96:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:plugins_general_title\";s:11:\"description\";s:102:\"LLL:EXT:backend/Resources/Private/Language/locallang_db_new_content_el.xlf:plugins_general_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:4:\"list\";}}s:9:\"examples.\";a:4:{s:14:\"iconIdentifier\";s:24:\"tx_examples-error-plugin\";s:5:\"title\";s:78:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:pierror_wizard_title\";s:11:\"description\";s:84:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:pierror_wizard_description\";s:21:\"tt_content_defValues.\";a:2:{s:5:\"CType\";s:4:\"list\";s:9:\"list_type\";s:14:\"examples_error\";}}}s:4:\"show\";s:1:\"*\";}s:23:\"dataProcessingExamples.\";a:3:{s:6:\"header\";s:80:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:dataProcessingExamples\";s:9:\"elements.\";a:9:{s:23:\"examples_newcontentcsv.\";a:4:{s:14:\"iconIdentifier\";s:25:\"mimetypes-x-content-table\";s:5:\"title\";s:86:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_newcontentcsv_title\";s:11:\"description\";s:92:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_newcontentcsv_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:22:\"examples_newcontentcsv\";}}s:20:\"examples_dataprocdb.\";a:4:{s:14:\"iconIdentifier\";s:23:\"content-special-uploads\";s:5:\"title\";s:83:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_dataprocdb_title\";s:11:\"description\";s:89:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_dataprocdb_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:19:\"examples_dataprocdb\";}}s:22:\"examples_dataproclang.\";a:4:{s:14:\"iconIdentifier\";s:23:\"install-manage-language\";s:5:\"title\";s:85:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_dataproclang_title\";s:11:\"description\";s:91:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_dataproclang_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:21:\"examples_dataproclang\";}}s:22:\"examples_dataprocmenu.\";a:4:{s:14:\"iconIdentifier\";s:18:\"content-menu-pages\";s:5:\"title\";s:85:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_dataprocmenu_title\";s:11:\"description\";s:91:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_dataprocmenu_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:21:\"examples_dataprocmenu\";}}s:22:\"examples_dataprocsite.\";a:4:{s:14:\"iconIdentifier\";s:25:\"apps-pagetree-folder-root\";s:5:\"title\";s:85:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_dataprocsite_title\";s:11:\"description\";s:91:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_dataprocsite_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:21:\"examples_dataprocsite\";}}s:23:\"examples_dataprocsplit.\";a:4:{s:14:\"iconIdentifier\";s:16:\"content-timeline\";s:5:\"title\";s:86:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_dataprocsplit_title\";s:11:\"description\";s:92:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_dataprocsplit_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:22:\"examples_dataprocsplit\";}}s:23:\"examples_dataprocfiles.\";a:4:{s:14:\"iconIdentifier\";s:13:\"content-image\";s:5:\"title\";s:86:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_dataprocfiles_title\";s:11:\"description\";s:92:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_dataprocfiles_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:22:\"examples_dataprocfiles\";}}s:25:\"examples_dataprocgallery.\";a:4:{s:14:\"iconIdentifier\";s:17:\"content-dashboard\";s:5:\"title\";s:88:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_dataprocgallery_title\";s:11:\"description\";s:94:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_dataprocgallery_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:24:\"examples_dataprocgallery\";}}s:24:\"examples_dataproccustom.\";a:4:{s:14:\"iconIdentifier\";s:17:\"content-dashboard\";s:5:\"title\";s:87:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_dataproccustom_title\";s:11:\"description\";s:93:\"LLL:EXT:examples/Resources/Private/Language/locallang.xlf:examples_dataproccustom_description\";s:21:\"tt_content_defValues.\";a:1:{s:5:\"CType\";s:23:\"examples_dataproccustom\";}}}s:4:\"show\";s:207:\"examples_newcontentcsv,examples_dataprocdb,examples_dataproclang, examples_dataprocmenu, examples_dataprocsite, examples_dataprocsplit, examples_dataprocfiles,examples_dataprocgallery,examples_dataproccustom\";}}}}s:9:\"web_view.\";a:1:{s:19:\"previewFrameWidths.\";a:12:{s:5:\"1920.\";a:4:{s:5:\"label\";s:66:\"LLL:EXT:viewpage/Resources/Private/Language/locallang.xlf:computer\";s:4:\"type\";s:7:\"desktop\";s:5:\"width\";s:4:\"1920\";s:6:\"height\";s:4:\"1080\";}s:5:\"1366.\";a:4:{s:5:\"label\";s:66:\"LLL:EXT:viewpage/Resources/Private/Language/locallang.xlf:computer\";s:4:\"type\";s:7:\"desktop\";s:5:\"width\";s:4:\"1366\";s:6:\"height\";s:3:\"768\";}s:5:\"1280.\";a:4:{s:5:\"label\";s:66:\"LLL:EXT:viewpage/Resources/Private/Language/locallang.xlf:computer\";s:4:\"type\";s:7:\"desktop\";s:5:\"width\";s:4:\"1280\";s:6:\"height\";s:4:\"1024\";}s:5:\"1024.\";a:4:{s:5:\"label\";s:66:\"LLL:EXT:viewpage/Resources/Private/Language/locallang.xlf:computer\";s:4:\"type\";s:7:\"desktop\";s:5:\"width\";s:4:\"1024\";s:6:\"height\";s:3:\"768\";}s:7:\"nexus7.\";a:4:{s:5:\"label\";s:7:\"Nexus 7\";s:4:\"type\";s:6:\"tablet\";s:5:\"width\";s:3:\"600\";s:6:\"height\";s:3:\"960\";}s:8:\"nexus6p.\";a:4:{s:5:\"label\";s:8:\"Nexus 6P\";s:4:\"type\";s:6:\"mobile\";s:5:\"width\";s:3:\"411\";s:6:\"height\";s:3:\"731\";}s:8:\"ipadpro.\";a:4:{s:5:\"label\";s:8:\"iPad Pro\";s:4:\"type\";s:6:\"tablet\";s:5:\"width\";s:4:\"1024\";s:6:\"height\";s:4:\"1366\";}s:8:\"ipadair.\";a:4:{s:5:\"label\";s:8:\"iPad Air\";s:4:\"type\";s:6:\"tablet\";s:5:\"width\";s:3:\"768\";s:6:\"height\";s:4:\"1024\";}s:12:\"iphone7plus.\";a:4:{s:5:\"label\";s:13:\"iPhone 7 Plus\";s:4:\"type\";s:6:\"mobile\";s:5:\"width\";s:3:\"414\";s:6:\"height\";s:3:\"736\";}s:8:\"iphone6.\";a:4:{s:5:\"label\";s:8:\"iPhone 6\";s:4:\"type\";s:6:\"mobile\";s:5:\"width\";s:3:\"375\";s:6:\"height\";s:3:\"667\";}s:8:\"iphone5.\";a:4:{s:5:\"label\";s:8:\"iPhone 5\";s:4:\"type\";s:6:\"mobile\";s:5:\"width\";s:3:\"320\";s:6:\"height\";s:3:\"568\";}s:8:\"iphone4.\";a:4:{s:5:\"label\";s:8:\"iPhone 4\";s:4:\"type\";s:6:\"mobile\";s:5:\"width\";s:3:\"320\";s:6:\"height\";s:3:\"480\";}}}s:9:\"web_info.\";a:1:{s:17:\"fieldDefinitions.\";a:5:{s:2:\"0.\";a:2:{s:5:\"label\";s:69:\"LLL:EXT:info/Resources/Private/Language/locallang_webinfo.xlf:pages_0\";s:6:\"fields\";s:75:\"title,uid,slug,starttime,endtime,fe_group,target,url,shortcut,shortcut_mode\";}s:2:\"1.\";a:2:{s:5:\"label\";s:69:\"LLL:EXT:info/Resources/Private/Language/locallang_webinfo.xlf:pages_1\";s:6:\"fields\";s:26:\"title,uid,###ALL_TABLES###\";}s:2:\"2.\";a:2:{s:5:\"label\";s:69:\"LLL:EXT:info/Resources/Private/Language/locallang_webinfo.xlf:pages_2\";s:6:\"fields\";s:93:\"title,uid,lastUpdated,newUntil,cache_timeout,php_tree_stop,TSconfig,is_siteroot,fe_login_mode\";}s:4:\"seo.\";a:2:{s:5:\"label\";s:64:\"LLL:EXT:seo/Resources/Private/Language/locallang_webinfo.xlf:seo\";s:6:\"fields\";s:102:\"title,slug,seo_title,description,no_index,no_follow,canonical_link,sitemap_changefreq,sitemap_priority\";}s:13:\"social_media.\";a:2:{s:5:\"label\";s:73:\"LLL:EXT:seo/Resources/Private/Language/locallang_webinfo.xlf:social_media\";s:6:\"fields\";s:63:\"title,og_title,og_description,twitter_title,twitter_description\";}}}}s:8:\"TCEMAIN.\";a:2:{s:18:\"translateToMessage\";s:16:\"Translate to %s:\";s:12:\"linkHandler.\";a:8:{s:5:\"page.\";a:2:{s:7:\"handler\";s:48:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\PageLinkHandler\";s:5:\"label\";s:77:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:page\";}s:5:\"file.\";a:4:{s:7:\"handler\";s:48:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\FileLinkHandler\";s:5:\"label\";s:77:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:file\";s:12:\"displayAfter\";s:4:\"page\";s:9:\"scanAfter\";s:4:\"page\";}s:7:\"folder.\";a:4:{s:7:\"handler\";s:50:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\FolderLinkHandler\";s:5:\"label\";s:79:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:folder\";s:12:\"displayAfter\";s:4:\"file\";s:9:\"scanAfter\";s:4:\"file\";}s:4:\"url.\";a:4:{s:7:\"handler\";s:47:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\UrlLinkHandler\";s:5:\"label\";s:79:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:extUrl\";s:12:\"displayAfter\";s:6:\"folder\";s:9:\"scanAfter\";s:9:\"telephone\";}s:5:\"mail.\";a:4:{s:7:\"handler\";s:48:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\MailLinkHandler\";s:5:\"label\";s:78:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:email\";s:12:\"displayAfter\";s:3:\"url\";s:10:\"scanBefore\";s:3:\"url\";}s:10:\"telephone.\";a:4:{s:7:\"handler\";s:53:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\TelephoneLinkHandler\";s:5:\"label\";s:82:\"LLL:EXT:recordlist/Resources/Private/Language/locallang_browse_links.xlf:telephone\";s:12:\"displayAfter\";s:4:\"mail\";s:10:\"scanBefore\";s:3:\"url\";}s:6:\"haiku.\";a:5:{s:7:\"handler\";s:50:\"TYPO3\\CMS\\Recordlist\\LinkHandler\\RecordLinkHandler\";s:5:\"label\";s:76:\"LLL:EXT:examples/Resources/Private/Language/locallang_browse_links.xlf:haiku\";s:14:\"configuration.\";a:1:{s:5:\"table\";s:17:\"tx_examples_haiku\";}s:12:\"displayAfter\";s:3:\"url\";s:10:\"scanBefore\";s:4:\"page\";}s:7:\"github.\";a:5:{s:7:\"handler\";s:45:\"T3docs\\Examples\\LinkHandler\\GitHubLinkHandler\";s:5:\"label\";s:77:\"LLL:EXT:examples/Resources/Private/Language/locallang_browse_links.xlf:github\";s:12:\"displayAfter\";s:5:\"haiku\";s:10:\"scanBefore\";s:3:\"url\";s:14:\"configuration.\";a:2:{s:7:\"project\";s:46:\"TYPO3-Documentation/TYPO3CMS-Reference-CoreApi\";s:6:\"action\";s:6:\"issues\";}}}}s:8:\"TCEFORM.\";a:1:{s:11:\"tt_content.\";a:1:{s:12:\"imageorient.\";a:1:{s:6:\"types.\";a:1:{s:6:\"image.\";a:1:{s:11:\"removeItems\";s:18:\"8,9,10,17,18,25,26\";}}}}}}s:8:\"sections\";a:0:{}s:5:\"match\";a:0:{}}i:1;s:32:\"c8c6cce5bf3ca851932d56a1e3f30ddb\";}');
/*!40000 ALTER TABLE `cache_hash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_hash_tags`
--

DROP TABLE IF EXISTS `cache_hash_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_hash_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_hash_tags`
--

LOCK TABLES `cache_hash_tags` WRITE;
/*!40000 ALTER TABLE `cache_hash_tags` DISABLE KEYS */;
INSERT INTO `cache_hash_tags` VALUES (1,'10df67e46713f522ef691bdb554c2064','UserTSconfig'),(2,'e6b32542c42de818a102227d4e7e00d9','pageTSconfig'),(3,'195daff0bc423d075429a77d65b5315f','UserTSconfig'),(4,'d95a1a0515cbb2f0d05fab8ab68be95a','pageTSconfig'),(5,'6b85b83acf00fb926fd3a29673cacc63','pageTSconfig');
/*!40000 ALTER TABLE `cache_hash_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_imagesizes`
--

DROP TABLE IF EXISTS `cache_imagesizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_imagesizes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT 0,
  `content` longblob DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_imagesizes`
--

LOCK TABLES `cache_imagesizes` WRITE;
/*!40000 ALTER TABLE `cache_imagesizes` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_imagesizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_imagesizes_tags`
--

DROP TABLE IF EXISTS `cache_imagesizes_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_imagesizes_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_imagesizes_tags`
--

LOCK TABLES `cache_imagesizes_tags` WRITE;
/*!40000 ALTER TABLE `cache_imagesizes_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_imagesizes_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_pages`
--

DROP TABLE IF EXISTS `cache_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT 0,
  `content` longblob DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_pages`
--

LOCK TABLES `cache_pages` WRITE;
/*!40000 ALTER TABLE `cache_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_pages_tags`
--

DROP TABLE IF EXISTS `cache_pages_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_pages_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_pages_tags`
--

LOCK TABLES `cache_pages_tags` WRITE;
/*!40000 ALTER TABLE `cache_pages_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_pages_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_pagesection`
--

DROP TABLE IF EXISTS `cache_pagesection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_pagesection` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT 0,
  `content` longblob DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_pagesection`
--

LOCK TABLES `cache_pagesection` WRITE;
/*!40000 ALTER TABLE `cache_pagesection` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_pagesection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_pagesection_tags`
--

DROP TABLE IF EXISTS `cache_pagesection_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_pagesection_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_pagesection_tags`
--

LOCK TABLES `cache_pagesection_tags` WRITE;
/*!40000 ALTER TABLE `cache_pagesection_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_pagesection_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_rootline`
--

DROP TABLE IF EXISTS `cache_rootline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_rootline` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` int(10) unsigned NOT NULL DEFAULT 0,
  `content` longblob DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(180),`expires`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_rootline`
--

LOCK TABLES `cache_rootline` WRITE;
/*!40000 ALTER TABLE `cache_rootline` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_rootline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_rootline_tags`
--

DROP TABLE IF EXISTS `cache_rootline_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_rootline_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cache_id` (`identifier`(191)),
  KEY `cache_tag` (`tag`(191))
) ENGINE=InnoDB AUTO_INCREMENT=272 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_rootline_tags`
--

LOCK TABLES `cache_rootline_tags` WRITE;
/*!40000 ALTER TABLE `cache_rootline_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_rootline_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_treelist`
--

DROP TABLE IF EXISTS `cache_treelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_treelist` (
  `md5hash` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pid` int(11) NOT NULL DEFAULT 0,
  `treelist` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `tstamp` int(11) NOT NULL DEFAULT 0,
  `expires` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`md5hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_treelist`
--

LOCK TABLES `cache_treelist` WRITE;
/*!40000 ALTER TABLE `cache_treelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_treelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fe_groups`
--

DROP TABLE IF EXISTS `fe_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fe_groups` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `tx_extbase_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subgroup` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  `TSconfig` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `felogin_redirectPid` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fe_groups`
--

LOCK TABLES `fe_groups` WRITE;
/*!40000 ALTER TABLE `fe_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `fe_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fe_sessions`
--

DROP TABLE IF EXISTS `fe_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fe_sessions` (
  `ses_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ses_iplock` varchar(39) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ses_userid` int(10) unsigned NOT NULL DEFAULT 0,
  `ses_tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `ses_data` mediumblob DEFAULT NULL,
  `ses_permanent` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`ses_id`),
  KEY `ses_tstamp` (`ses_tstamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fe_sessions`
--

LOCK TABLES `fe_sessions` WRITE;
/*!40000 ALTER TABLE `fe_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `fe_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fe_users`
--

DROP TABLE IF EXISTS `fe_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fe_users` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `disable` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `tx_extbase_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `usergroup` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(160) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `middle_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `telephone` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fax` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uc` blob DEFAULT NULL,
  `title` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `zip` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `country` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `www` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `company` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `image` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  `TSconfig` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastlogin` int(10) unsigned NOT NULL DEFAULT 0,
  `is_online` int(10) unsigned NOT NULL DEFAULT 0,
  `felogin_redirectPid` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  `felogin_forgotHash` varchar(80) COLLATE utf8_unicode_ci DEFAULT '',
  `tx_examples_options` int(11) NOT NULL DEFAULT 0,
  `tx_examples_special` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`username`(100)),
  KEY `username` (`username`(100)),
  KEY `is_online` (`is_online`),
  KEY `felogin_forgotHash` (`felogin_forgotHash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fe_users`
--

LOCK TABLES `fe_users` WRITE;
/*!40000 ALTER TABLE `fe_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `fe_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `fe_group` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `sorting` int(11) NOT NULL DEFAULT 0,
  `rowDescription` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `editlock` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `perms_userid` int(10) unsigned NOT NULL DEFAULT 0,
  `perms_groupid` int(10) unsigned NOT NULL DEFAULT 0,
  `perms_user` smallint(5) unsigned NOT NULL DEFAULT 0,
  `perms_group` smallint(5) unsigned NOT NULL DEFAULT 0,
  `perms_everybody` smallint(5) unsigned NOT NULL DEFAULT 0,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL,
  `doktype` int(10) unsigned NOT NULL DEFAULT 0,
  `TSconfig` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_siteroot` smallint(6) NOT NULL DEFAULT 0,
  `php_tree_stop` smallint(6) NOT NULL DEFAULT 0,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shortcut` int(10) unsigned NOT NULL DEFAULT 0,
  `shortcut_mode` int(10) unsigned NOT NULL DEFAULT 0,
  `subtitle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `layout` int(10) unsigned NOT NULL DEFAULT 0,
  `target` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `media` int(10) unsigned NOT NULL DEFAULT 0,
  `lastUpdated` int(10) unsigned NOT NULL DEFAULT 0,
  `keywords` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `cache_timeout` int(10) unsigned NOT NULL DEFAULT 0,
  `cache_tags` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `newUntil` int(10) unsigned NOT NULL DEFAULT 0,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `no_search` smallint(5) unsigned NOT NULL DEFAULT 0,
  `SYS_LASTCHANGED` int(10) unsigned NOT NULL DEFAULT 0,
  `abstract` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `module` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `extendToSubpages` smallint(5) unsigned NOT NULL DEFAULT 0,
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `author_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `nav_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `nav_hide` smallint(6) NOT NULL DEFAULT 0,
  `content_from_pid` int(10) unsigned NOT NULL DEFAULT 0,
  `mount_pid` int(10) unsigned NOT NULL DEFAULT 0,
  `mount_pid_ol` smallint(6) NOT NULL DEFAULT 0,
  `l18n_cfg` smallint(6) NOT NULL DEFAULT 0,
  `fe_login_mode` smallint(6) NOT NULL DEFAULT 0,
  `backend_layout` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `backend_layout_next_level` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tsconfig_includes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `tx_impexp_origuid` int(11) NOT NULL DEFAULT 0,
  `seo_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `no_index` smallint(6) NOT NULL DEFAULT 0,
  `no_follow` smallint(6) NOT NULL DEFAULT 0,
  `og_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `og_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `og_image` int(10) unsigned NOT NULL DEFAULT 0,
  `twitter_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `twitter_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter_image` int(10) unsigned NOT NULL DEFAULT 0,
  `twitter_card` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `canonical_link` varchar(2048) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sitemap_priority` decimal(2,1) NOT NULL DEFAULT 0.5,
  `sitemap_changefreq` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `categories` int(11) NOT NULL DEFAULT 0,
  `tx_examples_related_pages` int(11) NOT NULL DEFAULT 0,
  `tx_styleguide_containsdemo` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tx_examples_cats` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `determineSiteRoot` (`is_siteroot`),
  KEY `language_identifier` (`l10n_parent`,`sys_language_uid`),
  KEY `slug` (`slug`(127)),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,0,1611517876,1611517876,1,0,1,0,0,'0',256,NULL,0,0,0,0,NULL,0,'',0,0,0,0,1,0,31,27,0,'styleguide TCA demo','/',1,NULL,1,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide',0),(2,1,1611517876,1611517876,1,0,0,0,0,'0',256,NULL,0,0,0,0,NULL,0,'',0,0,0,0,1,0,31,27,0,'staticdata','/staticdata',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_staticdata',0),(3,1,1611517876,1611517876,1,0,0,0,0,'0',128,NULL,0,1,2,2,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'staticdata - language 1','/staticdata-language-1',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_staticdata',0),(4,1,1611517876,1611517876,1,0,0,0,0,'0',64,NULL,0,2,2,2,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'staticdata - language 2','/staticdata-language-2',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_staticdata',0),(5,1,1611517876,1611517876,1,0,0,0,0,'0',32,NULL,0,3,2,2,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'staticdata - language 3','/staticdata-language-3',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_staticdata',0),(6,1,1611517876,1611517876,1,0,0,0,0,'0',16,NULL,0,4,2,2,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'staticdata - language 4','/staticdata-language-4',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_staticdata',0),(7,1,1611517876,1611517876,1,0,0,0,0,'0',512,NULL,0,0,0,0,NULL,0,'',0,0,0,0,1,0,31,27,0,'elements basic','/elements-basic',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_elements_basic',0),(8,1,1611517876,1611517876,1,0,0,0,0,'0',384,NULL,0,1,7,7,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'elements basic - language 1','/elements-basic-language-1',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_elements_basic',0),(9,1,1611517876,1611517876,1,0,0,0,0,'0',320,NULL,0,2,7,7,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'elements basic - language 2','/elements-basic-language-2',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_elements_basic',0),(10,1,1611517876,1611517876,1,0,0,0,0,'0',288,NULL,0,3,7,7,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'elements basic - language 3','/elements-basic-language-3',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_elements_basic',0),(11,1,1611517876,1611517876,1,0,0,0,0,'0',272,NULL,0,4,7,7,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'elements basic - language 4','/elements-basic-language-4',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_elements_basic',0),(12,1,1611517876,1611517876,1,0,0,0,0,'0',768,NULL,0,0,0,0,NULL,0,'',0,0,0,0,1,0,31,27,0,'elements group','/elements-group',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_elements_group',0),(13,1,1611517876,1611517876,1,0,0,0,0,'0',640,NULL,0,1,12,12,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'elements group - language 1','/elements-group-language-1',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_elements_group',0),(14,1,1611517876,1611517876,1,0,0,0,0,'0',576,NULL,0,2,12,12,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'elements group - language 2','/elements-group-language-2',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_elements_group',0),(15,1,1611517876,1611517876,1,0,0,0,0,'0',544,NULL,0,3,12,12,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'elements group - language 3','/elements-group-language-3',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_elements_group',0),(16,1,1611517876,1611517876,1,0,0,0,0,'0',528,NULL,0,4,12,12,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'elements group - language 4','/elements-group-language-4',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_elements_group',0),(17,1,1611517876,1611517876,1,0,0,0,0,'0',1024,NULL,0,0,0,0,NULL,0,'',0,0,0,0,1,0,31,27,0,'elements rte','/elements-rte',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_elements_rte',0),(18,1,1611517876,1611517876,1,0,0,0,0,'0',896,NULL,0,1,17,17,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'elements rte - language 1','/elements-rte-language-1',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_elements_rte',0),(19,1,1611517876,1611517876,1,0,0,0,0,'0',832,NULL,0,2,17,17,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'elements rte - language 2','/elements-rte-language-2',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_elements_rte',0),(20,1,1611517876,1611517876,1,0,0,0,0,'0',800,NULL,0,3,17,17,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'elements rte - language 3','/elements-rte-language-3',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_elements_rte',0),(21,1,1611517876,1611517876,1,0,0,0,0,'0',784,NULL,0,4,17,17,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'elements rte - language 4','/elements-rte-language-4',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_elements_rte',0),(22,1,1611517876,1611517876,1,0,0,0,0,'0',1280,NULL,0,0,0,0,NULL,0,'',0,0,0,0,1,0,31,27,0,'elements select','/elements-select',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_elements_select',0),(23,1,1611517876,1611517876,1,0,0,0,0,'0',1152,NULL,0,1,22,22,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'elements select - language 1','/elements-select-language-1',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_elements_select',0),(24,1,1611517876,1611517876,1,0,0,0,0,'0',1088,NULL,0,2,22,22,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'elements select - language 2','/elements-select-language-2',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_elements_select',0),(25,1,1611517876,1611517876,1,0,0,0,0,'0',1056,NULL,0,3,22,22,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'elements select - language 3','/elements-select-language-3',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_elements_select',0),(26,1,1611517876,1611517876,1,0,0,0,0,'0',1040,NULL,0,4,22,22,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'elements select - language 4','/elements-select-language-4',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_elements_select',0),(27,1,1611517876,1611517876,1,0,0,0,0,'0',1536,NULL,0,0,0,0,NULL,0,'',0,0,0,0,1,0,31,27,0,'elements special','/elements-special',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_elements_special',0),(28,1,1611517876,1611517876,1,0,0,0,0,'0',1408,NULL,0,1,27,27,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'elements special - language 1','/elements-special-language-1',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_elements_special',0),(29,1,1611517876,1611517876,1,0,0,0,0,'0',1344,NULL,0,2,27,27,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'elements special - language 2','/elements-special-language-2',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_elements_special',0),(30,1,1611517876,1611517876,1,0,0,0,0,'0',1312,NULL,0,3,27,27,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'elements special - language 3','/elements-special-language-3',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_elements_special',0),(31,1,1611517876,1611517876,1,0,0,0,0,'0',1296,NULL,0,4,27,27,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'elements special - language 4','/elements-special-language-4',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_elements_special',0),(32,1,1611517876,1611517876,1,0,0,0,0,'0',1792,NULL,0,0,0,0,NULL,0,'',0,0,0,0,1,0,31,27,0,'elements t3editor','/elements-t3editor',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_elements_t3editor',0),(33,1,1611517876,1611517876,1,0,0,0,0,'0',1664,NULL,0,1,32,32,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'elements t3editor - language 1','/elements-t3editor-language-1',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_elements_t3editor',0),(34,1,1611517876,1611517876,1,0,0,0,0,'0',1600,NULL,0,2,32,32,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'elements t3editor - language 2','/elements-t3editor-language-2',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_elements_t3editor',0),(35,1,1611517876,1611517876,1,0,0,0,0,'0',1568,NULL,0,3,32,32,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'elements t3editor - language 3','/elements-t3editor-language-3',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_elements_t3editor',0),(36,1,1611517876,1611517876,1,0,0,0,0,'0',1552,NULL,0,4,32,32,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'elements t3editor - language 4','/elements-t3editor-language-4',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_elements_t3editor',0),(37,1,1611517876,1611517876,1,0,0,0,0,'0',2048,NULL,0,0,0,0,NULL,0,'',0,0,0,0,1,0,31,27,0,'flex','/flex',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_flex',0),(38,1,1611517876,1611517876,1,0,0,0,0,'0',1920,NULL,0,1,37,37,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'flex - language 1','/flex-language-1',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_flex',0),(39,1,1611517876,1611517876,1,0,0,0,0,'0',1856,NULL,0,2,37,37,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'flex - language 2','/flex-language-2',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_flex',0),(40,1,1611517876,1611517876,1,0,0,0,0,'0',1824,NULL,0,3,37,37,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'flex - language 3','/flex-language-3',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_flex',0),(41,1,1611517876,1611517876,1,0,0,0,0,'0',1808,NULL,0,4,37,37,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'flex - language 4','/flex-language-4',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_flex',0),(42,1,1611517876,1611517876,1,0,0,0,0,'0',2304,NULL,0,0,0,0,NULL,0,'',0,0,0,0,1,0,31,27,0,'inline 11','/inline-11',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_11',0),(43,1,1611517876,1611517876,1,0,0,0,0,'0',2176,NULL,0,1,42,42,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline 11 - language 1','/inline-11-language-1',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_11',0),(44,1,1611517876,1611517876,1,0,0,0,0,'0',2112,NULL,0,2,42,42,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline 11 - language 2','/inline-11-language-2',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_11',0),(45,1,1611517876,1611517876,1,0,0,0,0,'0',2080,NULL,0,3,42,42,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline 11 - language 3','/inline-11-language-3',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_11',0),(46,1,1611517876,1611517876,1,0,0,0,0,'0',2064,NULL,0,4,42,42,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline 11 - language 4','/inline-11-language-4',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_11',0),(47,1,1611517876,1611517876,1,0,0,0,0,'0',2560,NULL,0,0,0,0,NULL,0,'',0,0,0,0,1,0,31,27,0,'inline 1n','/inline-1n',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_1n',0),(48,1,1611517876,1611517876,1,0,0,0,0,'0',2432,NULL,0,1,47,47,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline 1n - language 1','/inline-1n-language-1',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_1n',0),(49,1,1611517876,1611517876,1,0,0,0,0,'0',2368,NULL,0,2,47,47,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline 1n - language 2','/inline-1n-language-2',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_1n',0),(50,1,1611517876,1611517876,1,0,0,0,0,'0',2336,NULL,0,3,47,47,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline 1n - language 3','/inline-1n-language-3',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_1n',0),(51,1,1611517876,1611517876,1,0,0,0,0,'0',2320,NULL,0,4,47,47,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline 1n - language 4','/inline-1n-language-4',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_1n',0),(52,1,1611517876,1611517876,1,0,0,0,0,'0',2816,NULL,0,0,0,0,NULL,0,'',0,0,0,0,1,0,31,27,0,'inline 1n1n','/inline-1n1n',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_1n1n',0),(53,1,1611517876,1611517876,1,0,0,0,0,'0',2688,NULL,0,1,52,52,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline 1n1n - language 1','/inline-1n1n-language-1',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_1n1n',0),(54,1,1611517876,1611517876,1,0,0,0,0,'0',2624,NULL,0,2,52,52,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline 1n1n - language 2','/inline-1n1n-language-2',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_1n1n',0),(55,1,1611517876,1611517876,1,0,0,0,0,'0',2592,NULL,0,3,52,52,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline 1n1n - language 3','/inline-1n1n-language-3',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_1n1n',0),(56,1,1611517876,1611517876,1,0,0,0,0,'0',2576,NULL,0,4,52,52,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline 1n1n - language 4','/inline-1n1n-language-4',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_1n1n',0),(57,1,1611517876,1611517876,1,0,0,0,0,'0',3072,NULL,0,0,0,0,NULL,0,'',0,0,0,0,1,0,31,27,0,'inline 1nnol10n','/inline-1nnol10n',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_1nnol10n',0),(58,1,1611517876,1611517876,1,0,0,0,0,'0',2944,NULL,0,1,57,57,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline 1nnol10n - language 1','/inline-1nnol10n-language-1',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_1nnol10n',0),(59,1,1611517876,1611517876,1,0,0,0,0,'0',2880,NULL,0,2,57,57,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline 1nnol10n - language 2','/inline-1nnol10n-language-2',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_1nnol10n',0),(60,1,1611517876,1611517876,1,0,0,0,0,'0',2848,NULL,0,3,57,57,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline 1nnol10n - language 3','/inline-1nnol10n-language-3',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_1nnol10n',0),(61,1,1611517876,1611517876,1,0,0,0,0,'0',2832,NULL,0,4,57,57,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline 1nnol10n - language 4','/inline-1nnol10n-language-4',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_1nnol10n',0),(62,1,1611517876,1611517876,1,0,0,0,0,'0',3328,NULL,0,0,0,0,NULL,0,'',0,0,0,0,1,0,31,27,0,'inline expand','/inline-expand',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_expand',0),(63,1,1611517876,1611517876,1,0,0,0,0,'0',3200,NULL,0,1,62,62,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline expand - language 1','/inline-expand-language-1',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_expand',0),(64,1,1611517876,1611517876,1,0,0,0,0,'0',3136,NULL,0,2,62,62,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline expand - language 2','/inline-expand-language-2',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_expand',0),(65,1,1611517876,1611517876,1,0,0,0,0,'0',3104,NULL,0,3,62,62,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline expand - language 3','/inline-expand-language-3',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_expand',0),(66,1,1611517876,1611517876,1,0,0,0,0,'0',3088,NULL,0,4,62,62,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline expand - language 4','/inline-expand-language-4',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_expand',0),(67,1,1611517876,1611517876,1,0,0,0,0,'0',3584,NULL,0,0,0,0,NULL,0,'',0,0,0,0,1,0,31,27,0,'inline expandsingle','/inline-expandsingle',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_expandsingle',0),(68,1,1611517876,1611517876,1,0,0,0,0,'0',3456,NULL,0,1,67,67,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline expandsingle - language 1','/inline-expandsingle-language-1',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_expandsingle',0),(69,1,1611517876,1611517876,1,0,0,0,0,'0',3392,NULL,0,2,67,67,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline expandsingle - language 2','/inline-expandsingle-language-2',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_expandsingle',0),(70,1,1611517876,1611517876,1,0,0,0,0,'0',3360,NULL,0,3,67,67,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline expandsingle - language 3','/inline-expandsingle-language-3',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_expandsingle',0),(71,1,1611517876,1611517876,1,0,0,0,0,'0',3344,NULL,0,4,67,67,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline expandsingle - language 4','/inline-expandsingle-language-4',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_expandsingle',0),(72,1,1611517876,1611517876,1,0,0,0,0,'0',3840,NULL,0,0,0,0,NULL,0,'',0,0,0,0,1,0,31,27,0,'inline fal','/inline-fal',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_fal',0),(73,1,1611517876,1611517876,1,0,0,0,0,'0',3712,NULL,0,1,72,72,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline fal - language 1','/inline-fal-language-1',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_fal',0),(74,1,1611517876,1611517876,1,0,0,0,0,'0',3648,NULL,0,2,72,72,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline fal - language 2','/inline-fal-language-2',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_fal',0),(75,1,1611517876,1611517876,1,0,0,0,0,'0',3616,NULL,0,3,72,72,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline fal - language 3','/inline-fal-language-3',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_fal',0),(76,1,1611517876,1611517876,1,0,0,0,0,'0',3600,NULL,0,4,72,72,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline fal - language 4','/inline-fal-language-4',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_fal',0),(77,1,1611517876,1611517876,1,0,0,0,0,'0',4096,NULL,0,0,0,0,NULL,0,'',0,0,0,0,1,0,31,27,0,'inline foreignrecorddefaults','/inline-foreignrecorddefaults',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_foreignrecorddefaults',0),(78,1,1611517876,1611517876,1,0,0,0,0,'0',3968,NULL,0,1,77,77,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline foreignrecorddefaults - language 1','/inline-foreignrecorddefaults-language-1',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_foreignrecorddefaults',0),(79,1,1611517876,1611517876,1,0,0,0,0,'0',3904,NULL,0,2,77,77,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline foreignrecorddefaults - language 2','/inline-foreignrecorddefaults-language-2',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_foreignrecorddefaults',0),(80,1,1611517876,1611517876,1,0,0,0,0,'0',3872,NULL,0,3,77,77,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline foreignrecorddefaults - language 3','/inline-foreignrecorddefaults-language-3',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_foreignrecorddefaults',0),(81,1,1611517876,1611517876,1,0,0,0,0,'0',3856,NULL,0,4,77,77,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline foreignrecorddefaults - language 4','/inline-foreignrecorddefaults-language-4',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_foreignrecorddefaults',0),(82,1,1611517876,1611517876,1,0,0,0,0,'0',4352,NULL,0,0,0,0,NULL,0,'',0,0,0,0,1,0,31,27,0,'inline mm','/inline-mm',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_mm',0),(83,1,1611517876,1611517876,1,0,0,0,0,'0',4224,NULL,0,1,82,82,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline mm - language 1','/inline-mm-language-1',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_mm',0),(84,1,1611517876,1611517876,1,0,0,0,0,'0',4160,NULL,0,2,82,82,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline mm - language 2','/inline-mm-language-2',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_mm',0),(85,1,1611517876,1611517876,1,0,0,0,0,'0',4128,NULL,0,3,82,82,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline mm - language 3','/inline-mm-language-3',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_mm',0),(86,1,1611517876,1611517876,1,0,0,0,0,'0',4112,NULL,0,4,82,82,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline mm - language 4','/inline-mm-language-4',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_mm',0),(87,1,1611517876,1611517876,1,0,0,0,0,'0',4608,NULL,0,0,0,0,NULL,0,'',0,0,0,0,1,0,31,27,0,'inline mn','/inline-mn',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_mn',0),(88,1,1611517876,1611517876,1,0,0,0,0,'0',4480,NULL,0,1,87,87,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline mn - language 1','/inline-mn-language-1',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_mn',0),(89,1,1611517876,1611517876,1,0,0,0,0,'0',4416,NULL,0,2,87,87,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline mn - language 2','/inline-mn-language-2',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_mn',0),(90,1,1611517876,1611517876,1,0,0,0,0,'0',4384,NULL,0,3,87,87,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline mn - language 3','/inline-mn-language-3',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_mn',0),(91,1,1611517876,1611517876,1,0,0,0,0,'0',4368,NULL,0,4,87,87,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline mn - language 4','/inline-mn-language-4',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_mn',0),(92,1,1611517876,1611517876,1,0,0,0,0,'0',4864,NULL,0,0,0,0,NULL,0,'',0,0,0,0,1,0,31,27,0,'inline mngroup','/inline-mngroup',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_mngroup',0),(93,1,1611517876,1611517876,1,0,0,0,0,'0',4736,NULL,0,1,92,92,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline mngroup - language 1','/inline-mngroup-language-1',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_mngroup',0),(94,1,1611517876,1611517876,1,0,0,0,0,'0',4672,NULL,0,2,92,92,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline mngroup - language 2','/inline-mngroup-language-2',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_mngroup',0),(95,1,1611517876,1611517876,1,0,0,0,0,'0',4640,NULL,0,3,92,92,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline mngroup - language 3','/inline-mngroup-language-3',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_mngroup',0),(96,1,1611517876,1611517876,1,0,0,0,0,'0',4624,NULL,0,4,92,92,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline mngroup - language 4','/inline-mngroup-language-4',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_mngroup',0),(97,1,1611517876,1611517876,1,0,0,0,0,'0',5120,NULL,0,0,0,0,NULL,0,'',0,0,0,0,1,0,31,27,0,'inline mnsymmetric','/inline-mnsymmetric',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_mnsymmetric',0),(98,1,1611517876,1611517876,1,0,0,0,0,'0',4992,NULL,0,1,97,97,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline mnsymmetric - language 1','/inline-mnsymmetric-language-1',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_mnsymmetric',0),(99,1,1611517876,1611517876,1,0,0,0,0,'0',4928,NULL,0,2,97,97,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline mnsymmetric - language 2','/inline-mnsymmetric-language-2',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_mnsymmetric',0),(100,1,1611517876,1611517876,1,0,0,0,0,'0',4896,NULL,0,3,97,97,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline mnsymmetric - language 3','/inline-mnsymmetric-language-3',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_mnsymmetric',0),(101,1,1611517876,1611517876,1,0,0,0,0,'0',4880,NULL,0,4,97,97,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline mnsymmetric - language 4','/inline-mnsymmetric-language-4',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_mnsymmetric',0),(102,1,1611517876,1611517876,1,0,0,0,0,'0',5376,NULL,0,0,0,0,NULL,0,'',0,0,0,0,1,0,31,27,0,'inline parentnosoftdelete','/inline-parentnosoftdelete',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_parentnosoftdelete',0),(103,1,1611517876,1611517876,1,0,0,0,0,'0',5248,NULL,0,1,102,102,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline parentnosoftdelete - language 1','/inline-parentnosoftdelete-language-1',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_parentnosoftdelete',0),(104,1,1611517876,1611517876,1,0,0,0,0,'0',5184,NULL,0,2,102,102,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline parentnosoftdelete - language 2','/inline-parentnosoftdelete-language-2',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_parentnosoftdelete',0),(105,1,1611517876,1611517876,1,0,0,0,0,'0',5152,NULL,0,3,102,102,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline parentnosoftdelete - language 3','/inline-parentnosoftdelete-language-3',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_parentnosoftdelete',0),(106,1,1611517876,1611517876,1,0,0,0,0,'0',5136,NULL,0,4,102,102,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline parentnosoftdelete - language 4','/inline-parentnosoftdelete-language-4',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_parentnosoftdelete',0),(107,1,1611517876,1611517876,1,0,0,0,0,'0',5632,NULL,0,0,0,0,NULL,0,'',0,0,0,0,1,0,31,27,0,'inline usecombination','/inline-usecombination',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_usecombination',0),(108,1,1611517876,1611517876,1,0,0,0,0,'0',5504,NULL,0,1,107,107,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline usecombination - language 1','/inline-usecombination-language-1',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_usecombination',0),(109,1,1611517876,1611517876,1,0,0,0,0,'0',5440,NULL,0,2,107,107,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline usecombination - language 2','/inline-usecombination-language-2',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_usecombination',0),(110,1,1611517876,1611517876,1,0,0,0,0,'0',5408,NULL,0,3,107,107,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline usecombination - language 3','/inline-usecombination-language-3',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_usecombination',0),(111,1,1611517876,1611517876,1,0,0,0,0,'0',5392,NULL,0,4,107,107,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline usecombination - language 4','/inline-usecombination-language-4',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_usecombination',0),(112,1,1611517876,1611517876,1,0,0,0,0,'0',5888,NULL,0,0,0,0,NULL,0,'',0,0,0,0,1,0,31,27,0,'inline usecombinationbox','/inline-usecombinationbox',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_usecombinationbox',0),(113,1,1611517876,1611517876,1,0,0,0,0,'0',5760,NULL,0,1,112,112,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline usecombinationbox - language 1','/inline-usecombinationbox-language-1',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_usecombinationbox',0),(114,1,1611517876,1611517876,1,0,0,0,0,'0',5696,NULL,0,2,112,112,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline usecombinationbox - language 2','/inline-usecombinationbox-language-2',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_usecombinationbox',0),(115,1,1611517876,1611517876,1,0,0,0,0,'0',5664,NULL,0,3,112,112,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline usecombinationbox - language 3','/inline-usecombinationbox-language-3',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_usecombinationbox',0),(116,1,1611517876,1611517876,1,0,0,0,0,'0',5648,NULL,0,4,112,112,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'inline usecombinationbox - language 4','/inline-usecombinationbox-language-4',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_inline_usecombinationbox',0),(117,1,1611517876,1611517876,1,0,0,0,0,'0',6144,NULL,0,0,0,0,NULL,0,'',0,0,0,0,1,0,31,27,0,'palette','/palette',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_palette',0),(118,1,1611517876,1611517876,1,0,0,0,0,'0',6016,NULL,0,1,117,117,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'palette - language 1','/palette-language-1',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_palette',0),(119,1,1611517876,1611517876,1,0,0,0,0,'0',5952,NULL,0,2,117,117,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'palette - language 2','/palette-language-2',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_palette',0),(120,1,1611517876,1611517876,1,0,0,0,0,'0',5920,NULL,0,3,117,117,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'palette - language 3','/palette-language-3',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_palette',0),(121,1,1611517876,1611517876,1,0,0,0,0,'0',5904,NULL,0,4,117,117,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'palette - language 4','/palette-language-4',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_palette',0),(122,1,1611517876,1611517876,1,0,0,0,0,'0',6400,NULL,0,0,0,0,NULL,0,'',0,0,0,0,1,0,31,27,0,'required','/required',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_required',0),(123,1,1611517876,1611517876,1,0,0,0,0,'0',6272,NULL,0,1,122,122,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'required - language 1','/required-language-1',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_required',0),(124,1,1611517876,1611517876,1,0,0,0,0,'0',6208,NULL,0,2,122,122,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'required - language 2','/required-language-2',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_required',0),(125,1,1611517876,1611517876,1,0,0,0,0,'0',6176,NULL,0,3,122,122,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'required - language 3','/required-language-3',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_required',0),(126,1,1611517876,1611517876,1,0,0,0,0,'0',6160,NULL,0,4,122,122,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'required - language 4','/required-language-4',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_required',0),(127,1,1611517876,1611517876,1,0,0,0,0,'0',6656,NULL,0,0,0,0,NULL,0,'',0,0,0,0,1,0,31,27,0,'type','/type',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_type',0),(128,1,1611517876,1611517876,1,0,0,0,0,'0',6528,NULL,0,1,127,127,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'type - language 1','/type-language-1',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_type',0),(129,1,1611517876,1611517876,1,0,0,0,0,'0',6464,NULL,0,2,127,127,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'type - language 2','/type-language-2',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_type',0),(130,1,1611517876,1611517876,1,0,0,0,0,'0',6432,NULL,0,3,127,127,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'type - language 3','/type-language-3',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_type',0),(131,1,1611517876,1611517876,1,0,0,0,0,'0',6416,NULL,0,4,127,127,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'type - language 4','/type-language-4',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_type',0),(132,1,1611517876,1611517876,1,0,0,0,0,'0',6912,NULL,0,0,0,0,NULL,0,'',0,0,0,0,1,0,31,27,0,'valuesdefault','/valuesdefault',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_valuesdefault',0),(133,1,1611517876,1611517876,1,0,0,0,0,'0',6784,NULL,0,1,132,132,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'valuesdefault - language 1','/valuesdefault-language-1',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_valuesdefault',0),(134,1,1611517876,1611517876,1,0,0,0,0,'0',6720,NULL,0,2,132,132,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'valuesdefault - language 2','/valuesdefault-language-2',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_valuesdefault',0),(135,1,1611517876,1611517876,1,0,0,0,0,'0',6688,NULL,0,3,132,132,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'valuesdefault - language 3','/valuesdefault-language-3',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_valuesdefault',0),(136,1,1611517876,1611517876,1,0,0,0,0,'0',6672,NULL,0,4,132,132,'{\"starttime\":\"parent\",\"endtime\":\"parent\",\"nav_hide\":\"parent\",\"url\":\"parent\",\"lastUpdated\":\"parent\",\"newUntil\":\"parent\",\"no_search\":\"parent\",\"shortcut\":\"parent\",\"shortcut_mode\":\"parent\",\"content_from_pid\":\"parent\",\"author\":\"parent\",\"author_email\":\"parent\",\"media\":\"parent\",\"og_image\":\"parent\",\"twitter_image\":\"parent\"}',0,'',0,0,0,0,1,0,31,27,0,'valuesdefault - language 4','/valuesdefault-language-4',1,NULL,0,0,'',0,0,'',0,'',0,0,NULL,0,'',0,NULL,0,0,NULL,'',0,'','','',0,0,0,0,0,0,'','',NULL,0,'',0,0,'',NULL,0,'',NULL,0,'summary','',0.5,'',0,0,'tx_styleguide_valuesdefault',0);
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_be_shortcuts`
--

DROP TABLE IF EXISTS `sys_be_shortcuts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_be_shortcuts` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL DEFAULT 0,
  `route` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `arguments` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sc_group` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `event` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_be_shortcuts`
--

LOCK TABLES `sys_be_shortcuts` WRITE;
/*!40000 ALTER TABLE `sys_be_shortcuts` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_be_shortcuts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_category`
--

DROP TABLE IF EXISTS `sys_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_category` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `title` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `parent` int(11) NOT NULL DEFAULT 0,
  `items` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `category_parent` (`parent`),
  KEY `category_list` (`pid`,`deleted`,`sys_language_uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_category`
--

LOCK TABLES `sys_category` WRITE;
/*!40000 ALTER TABLE `sys_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_category_record_mm`
--

DROP TABLE IF EXISTS `sys_category_record_mm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_category_record_mm` (
  `uid_local` int(11) NOT NULL DEFAULT 0,
  `uid_foreign` int(11) NOT NULL DEFAULT 0,
  `tablenames` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fieldname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sorting_foreign` int(11) NOT NULL DEFAULT 0,
  KEY `uid_local_foreign` (`uid_local`,`uid_foreign`),
  KEY `uid_foreign_tablefield` (`uid_foreign`,`tablenames`(40),`fieldname`(3),`sorting_foreign`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_category_record_mm`
--

LOCK TABLES `sys_category_record_mm` WRITE;
/*!40000 ALTER TABLE `sys_category_record_mm` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_category_record_mm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file`
--

DROP TABLE IF EXISTS `sys_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `last_indexed` int(11) NOT NULL DEFAULT 0,
  `missing` smallint(6) NOT NULL DEFAULT 0,
  `storage` int(11) NOT NULL DEFAULT 0,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `metadata` int(11) NOT NULL DEFAULT 0,
  `identifier` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `identifier_hash` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `folder_hash` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `extension` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mime_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  `sha1` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `size` bigint(20) unsigned NOT NULL DEFAULT 0,
  `creation_date` int(11) NOT NULL DEFAULT 0,
  `modification_date` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `sel01` (`storage`,`identifier_hash`),
  KEY `folder` (`storage`,`folder_hash`),
  KEY `tstamp` (`tstamp`),
  KEY `lastindex` (`last_indexed`),
  KEY `sha1` (`sha1`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file`
--

LOCK TABLES `sys_file` WRITE;
/*!40000 ALTER TABLE `sys_file` DISABLE KEYS */;
INSERT INTO `sys_file` VALUES (1,0,1611517879,0,0,1,'2',0,'/styleguide/bus_lane.jpg','20608641ed9491105193efeaf99217531527c51b','9730fe88194669506249dd7ddc4fb9d582f32293','jpg','image/jpeg','bus_lane.jpg','a6ed52c2b29daa041f2d2658b6c58abdc27b4d54',387681,1611517879,1611517879),(2,0,1611517879,0,0,1,'2',0,'/styleguide/telephone_box.jpg','9a8211469d4cca685f92c6486f2e0e4a696ba92f','9730fe88194669506249dd7ddc4fb9d582f32293','jpg','image/jpeg','telephone_box.jpg','186e837e422468f23815c4b6d3dab8fb0507269a',292600,1611517879,1611517879),(3,0,1611517879,0,0,1,'2',0,'/styleguide/underground.jpg','ef53f2a6bf87e8746df95e250759da556d182ee8','9730fe88194669506249dd7ddc4fb9d582f32293','jpg','image/jpeg','underground.jpg','2057d0067690bf7380f4f13d515144480a491fc0',669410,1611517879,1611517879);
/*!40000 ALTER TABLE `sys_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file_collection`
--

DROP TABLE IF EXISTS `sys_file_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file_collection` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `title` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'static',
  `files` int(11) NOT NULL DEFAULT 0,
  `storage` int(11) NOT NULL DEFAULT 0,
  `folder` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `recursive` smallint(6) NOT NULL DEFAULT 0,
  `category` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file_collection`
--

LOCK TABLES `sys_file_collection` WRITE;
/*!40000 ALTER TABLE `sys_file_collection` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_file_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file_metadata`
--

DROP TABLE IF EXISTS `sys_file_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file_metadata` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `file` int(11) NOT NULL DEFAULT 0,
  `title` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  `width` int(11) NOT NULL DEFAULT 0,
  `height` int(11) NOT NULL DEFAULT 0,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `alternative` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `categories` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `file` (`file`),
  KEY `fal_filelist` (`l10n_parent`,`sys_language_uid`),
  KEY `parent` (`pid`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file_metadata`
--

LOCK TABLES `sys_file_metadata` WRITE;
/*!40000 ALTER TABLE `sys_file_metadata` DISABLE KEYS */;
INSERT INTO `sys_file_metadata` VALUES (1,0,1611517876,1611517876,1,0,0,NULL,0,'',0,0,0,0,1,NULL,1920,1080,NULL,NULL,0),(2,0,1611517876,1611517876,1,0,0,NULL,0,'',0,0,0,0,2,NULL,1920,1080,NULL,NULL,0),(3,0,1611517876,1611517876,1,0,0,NULL,0,'',0,0,0,0,3,NULL,1920,1080,NULL,NULL,0);
/*!40000 ALTER TABLE `sys_file_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file_processedfile`
--

DROP TABLE IF EXISTS `sys_file_processedfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file_processedfile` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `tstamp` int(11) NOT NULL DEFAULT 0,
  `crdate` int(11) NOT NULL DEFAULT 0,
  `storage` int(11) NOT NULL DEFAULT 0,
  `original` int(11) NOT NULL DEFAULT 0,
  `identifier` varchar(512) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  `processing_url` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `configuration` blob DEFAULT NULL,
  `configurationsha1` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `originalfilesha1` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `task_type` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `checksum` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `width` int(11) DEFAULT 0,
  `height` int(11) DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `combined_1` (`original`,`task_type`(100),`configurationsha1`),
  KEY `identifier` (`storage`,`identifier`(180))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file_processedfile`
--

LOCK TABLES `sys_file_processedfile` WRITE;
/*!40000 ALTER TABLE `sys_file_processedfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_file_processedfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file_reference`
--

DROP TABLE IF EXISTS `sys_file_reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file_reference` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `uid_local` int(11) NOT NULL DEFAULT 0,
  `uid_foreign` int(11) NOT NULL DEFAULT 0,
  `tablenames` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fieldname` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sorting_foreign` int(11) NOT NULL DEFAULT 0,
  `table_local` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `alternative` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(1024) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `crop` varchar(4000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `autoplay` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `tablenames_fieldname` (`tablenames`(32),`fieldname`(12)),
  KEY `deleted` (`deleted`),
  KEY `uid_local` (`uid_local`),
  KEY `uid_foreign` (`uid_foreign`),
  KEY `combined_1` (`l10n_parent`,`t3ver_oid`,`t3ver_wsid`,`t3ver_state`,`deleted`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file_reference`
--

LOCK TABLES `sys_file_reference` WRITE;
/*!40000 ALTER TABLE `sys_file_reference` DISABLE KEYS */;
INSERT INTO `sys_file_reference` VALUES (1,22,1611517876,1611517876,1,0,0,0,0,NULL,'',0,0,0,0,1,1,'tx_styleguide_elements_select_single_12_foreign','fal_1',0,'sys_file',NULL,NULL,NULL,'','',0),(2,22,1611517876,1611517876,1,0,0,0,0,NULL,'',0,0,0,0,2,2,'tx_styleguide_elements_select_single_12_foreign','fal_1',0,'sys_file',NULL,NULL,NULL,'','',0),(3,62,1611517876,1611517876,1,0,0,0,0,NULL,'',0,0,0,0,1,1,'tx_styleguide_inline_expand_inline_1_child','inline_fal_1',0,'sys_file',NULL,NULL,NULL,'','',0),(4,62,1611517876,1611517876,1,0,0,0,0,NULL,'',0,0,0,0,2,1,'tx_styleguide_inline_expand_inline_1_child','inline_fal_1',0,'sys_file',NULL,NULL,NULL,'','',0),(5,62,1611517876,1611517876,1,0,0,0,0,NULL,'',0,0,0,0,3,1,'tx_styleguide_inline_expand_inline_1_child','inline_fal_1',0,'sys_file',NULL,NULL,NULL,'','',0),(6,72,1611517876,1611517876,1,0,0,0,0,NULL,'',0,0,0,0,1,1,'tx_styleguide_inline_fal','inline_1',0,'sys_file',NULL,NULL,NULL,'','',0),(7,72,1611517876,1611517876,1,0,0,0,0,NULL,'',0,0,0,0,2,1,'tx_styleguide_inline_fal','inline_1',0,'sys_file',NULL,NULL,NULL,'','',0),(8,72,1611517876,1611517876,1,0,0,0,0,NULL,'',0,0,0,0,3,1,'tx_styleguide_inline_fal','inline_1',0,'sys_file',NULL,NULL,NULL,'','',0),(9,72,1611517876,1611517876,1,0,0,0,0,NULL,'',0,0,0,0,1,1,'tx_styleguide_inline_fal','inline_2',0,'sys_file',NULL,NULL,NULL,'','',0),(10,72,1611517876,1611517876,1,0,0,0,0,NULL,'',0,0,0,0,2,1,'tx_styleguide_inline_fal','inline_2',0,'sys_file',NULL,NULL,NULL,'','',0),(11,72,1611517876,1611517876,1,0,0,0,0,NULL,'',0,0,0,0,3,1,'tx_styleguide_inline_fal','inline_2',0,'sys_file',NULL,NULL,NULL,'','',0),(12,72,1611517876,1611517876,1,0,0,0,0,NULL,'',0,0,0,0,1,1,'tx_styleguide_inline_fal','inline_3',0,'sys_file',NULL,NULL,NULL,'','',0),(13,72,1611517876,1611517876,1,0,0,0,0,NULL,'',0,0,0,0,2,1,'tx_styleguide_inline_fal','inline_3',0,'sys_file',NULL,NULL,NULL,'','',0),(14,72,1611517876,1611517876,1,0,0,0,0,NULL,'',0,0,0,0,3,1,'tx_styleguide_inline_fal','inline_3',0,'sys_file',NULL,NULL,NULL,'','',0),(15,72,1611517876,1611517876,1,0,0,0,0,NULL,'',0,0,0,0,1,1,'tx_styleguide_inline_fal','inline_4',0,'sys_file',NULL,NULL,NULL,'','',0),(16,72,1611517876,1611517876,1,0,0,0,0,NULL,'',0,0,0,0,2,1,'tx_styleguide_inline_fal','inline_4',0,'sys_file',NULL,NULL,NULL,'','',0),(17,72,1611517876,1611517876,1,0,0,0,0,NULL,'',0,0,0,0,3,1,'tx_styleguide_inline_fal','inline_4',0,'sys_file',NULL,NULL,NULL,'','',0),(18,72,1611517876,1611517876,1,0,0,0,0,NULL,'',0,0,0,0,1,1,'tx_styleguide_inline_fal','fal',0,'sys_file',NULL,NULL,NULL,'','',0),(19,72,1611517876,1611517876,1,0,0,0,0,NULL,'',0,0,0,0,2,1,'tx_styleguide_inline_fal','fal',0,'sys_file',NULL,NULL,NULL,'','',0),(20,72,1611517876,1611517876,1,0,0,0,0,NULL,'',0,0,0,0,3,1,'tx_styleguide_inline_fal','fal',0,'sys_file',NULL,NULL,NULL,'','',0),(21,72,1611517876,1611517876,1,0,0,1,0,NULL,'',0,0,0,0,1,2,'tx_styleguide_inline_fal','inline_1',1,'sys_file',NULL,NULL,NULL,'','',0),(22,72,1611517876,1611517876,1,0,0,1,0,NULL,'',0,0,0,0,2,2,'tx_styleguide_inline_fal','inline_1',2,'sys_file',NULL,NULL,NULL,'','',0),(23,72,1611517876,1611517876,1,0,0,1,0,NULL,'',0,0,0,0,3,2,'tx_styleguide_inline_fal','inline_1',3,'sys_file',NULL,NULL,NULL,'','',0),(24,72,1611517876,1611517876,1,0,0,1,0,NULL,'',0,0,0,0,1,2,'tx_styleguide_inline_fal','inline_2',1,'sys_file',NULL,NULL,NULL,'','',0),(25,72,1611517876,1611517876,1,0,0,1,0,NULL,'',0,0,0,0,2,2,'tx_styleguide_inline_fal','inline_2',2,'sys_file',NULL,NULL,NULL,'','',0),(26,72,1611517876,1611517876,1,0,0,1,0,NULL,'',0,0,0,0,3,2,'tx_styleguide_inline_fal','inline_2',3,'sys_file',NULL,NULL,NULL,'','',0),(27,72,1611517876,1611517876,1,0,0,1,0,NULL,'',0,0,0,0,1,2,'tx_styleguide_inline_fal','inline_3',1,'sys_file',NULL,NULL,NULL,'','',0),(28,72,1611517876,1611517876,1,0,0,1,0,NULL,'',0,0,0,0,2,2,'tx_styleguide_inline_fal','inline_3',2,'sys_file',NULL,NULL,NULL,'','',0),(29,72,1611517876,1611517876,1,0,0,1,0,NULL,'',0,0,0,0,3,2,'tx_styleguide_inline_fal','inline_3',3,'sys_file',NULL,NULL,NULL,'','',0),(30,72,1611517876,1611517876,1,0,0,1,0,NULL,'',0,0,0,0,1,2,'tx_styleguide_inline_fal','inline_4',1,'sys_file',NULL,NULL,NULL,'','',0),(31,72,1611517876,1611517876,1,0,0,1,0,NULL,'',0,0,0,0,2,2,'tx_styleguide_inline_fal','inline_4',2,'sys_file',NULL,NULL,NULL,'','',0),(32,72,1611517876,1611517876,1,0,0,1,0,NULL,'',0,0,0,0,3,2,'tx_styleguide_inline_fal','inline_4',3,'sys_file',NULL,NULL,NULL,'','',0),(33,72,1611517876,1611517876,1,0,0,0,0,NULL,'',0,0,0,0,1,2,'tx_styleguide_inline_fal','fal',1,'sys_file',NULL,NULL,NULL,'','',0),(34,72,1611517876,1611517876,1,0,0,0,0,NULL,'',0,0,0,0,2,2,'tx_styleguide_inline_fal','fal',2,'sys_file',NULL,NULL,NULL,'','',0),(35,72,1611517876,1611517876,1,0,0,0,0,NULL,'',0,0,0,0,3,2,'tx_styleguide_inline_fal','fal',3,'sys_file',NULL,NULL,NULL,'','',0),(36,72,1611517876,1611517876,1,0,0,2,6,NULL,'',0,0,0,0,1,3,'tx_styleguide_inline_fal','inline_1',1,'sys_file',NULL,NULL,NULL,'','',0),(37,72,1611517876,1611517876,1,0,0,2,7,NULL,'',0,0,0,0,2,3,'tx_styleguide_inline_fal','inline_1',2,'sys_file',NULL,NULL,NULL,'','',0),(38,72,1611517876,1611517876,1,0,0,2,8,NULL,'',0,0,0,0,3,3,'tx_styleguide_inline_fal','inline_1',3,'sys_file',NULL,NULL,NULL,'','',0),(39,72,1611517876,1611517876,1,0,0,2,9,NULL,'',0,0,0,0,1,3,'tx_styleguide_inline_fal','inline_2',1,'sys_file',NULL,NULL,NULL,'','',0),(40,72,1611517876,1611517876,1,0,0,2,10,NULL,'',0,0,0,0,2,3,'tx_styleguide_inline_fal','inline_2',2,'sys_file',NULL,NULL,NULL,'','',0),(41,72,1611517876,1611517876,1,0,0,2,11,NULL,'',0,0,0,0,3,3,'tx_styleguide_inline_fal','inline_2',3,'sys_file',NULL,NULL,NULL,'','',0),(42,72,1611517876,1611517876,1,0,0,2,12,NULL,'',0,0,0,0,1,3,'tx_styleguide_inline_fal','inline_3',1,'sys_file',NULL,NULL,NULL,'','',0),(43,72,1611517876,1611517876,1,0,0,2,13,NULL,'',0,0,0,0,2,3,'tx_styleguide_inline_fal','inline_3',2,'sys_file',NULL,NULL,NULL,'','',0),(44,72,1611517876,1611517876,1,0,0,2,14,NULL,'',0,0,0,0,3,3,'tx_styleguide_inline_fal','inline_3',3,'sys_file',NULL,NULL,NULL,'','',0),(45,72,1611517876,1611517876,1,0,0,2,15,NULL,'',0,0,0,0,1,3,'tx_styleguide_inline_fal','inline_4',1,'sys_file',NULL,NULL,NULL,'','',0),(46,72,1611517876,1611517876,1,0,0,2,16,NULL,'',0,0,0,0,2,3,'tx_styleguide_inline_fal','inline_4',2,'sys_file',NULL,NULL,NULL,'','',0),(47,72,1611517876,1611517876,1,0,0,2,17,NULL,'',0,0,0,0,3,3,'tx_styleguide_inline_fal','inline_4',3,'sys_file',NULL,NULL,NULL,'','',0),(48,72,1611517876,1611517876,1,0,0,0,0,NULL,'',0,0,0,0,1,3,'tx_styleguide_inline_fal','fal',1,'sys_file',NULL,NULL,NULL,'','',0),(49,72,1611517876,1611517876,1,0,0,0,0,NULL,'',0,0,0,0,2,3,'tx_styleguide_inline_fal','fal',2,'sys_file',NULL,NULL,NULL,'','',0),(50,72,1611517876,1611517876,1,0,0,0,0,NULL,'',0,0,0,0,3,3,'tx_styleguide_inline_fal','fal',3,'sys_file',NULL,NULL,NULL,'','',0),(51,72,1611517876,1611517876,1,0,0,3,6,NULL,'',0,0,0,0,1,4,'tx_styleguide_inline_fal','inline_1',1,'sys_file',NULL,NULL,NULL,'','',0),(52,72,1611517876,1611517876,1,0,0,3,7,NULL,'',0,0,0,0,2,4,'tx_styleguide_inline_fal','inline_1',2,'sys_file',NULL,NULL,NULL,'','',0),(53,72,1611517876,1611517876,1,0,0,3,8,NULL,'',0,0,0,0,3,4,'tx_styleguide_inline_fal','inline_1',3,'sys_file',NULL,NULL,NULL,'','',0),(54,72,1611517876,1611517876,1,0,0,3,9,NULL,'',0,0,0,0,1,4,'tx_styleguide_inline_fal','inline_2',1,'sys_file',NULL,NULL,NULL,'','',0),(55,72,1611517876,1611517876,1,0,0,3,10,NULL,'',0,0,0,0,2,4,'tx_styleguide_inline_fal','inline_2',2,'sys_file',NULL,NULL,NULL,'','',0),(56,72,1611517876,1611517876,1,0,0,3,11,NULL,'',0,0,0,0,3,4,'tx_styleguide_inline_fal','inline_2',3,'sys_file',NULL,NULL,NULL,'','',0),(57,72,1611517876,1611517876,1,0,0,3,12,NULL,'',0,0,0,0,1,4,'tx_styleguide_inline_fal','inline_3',1,'sys_file',NULL,NULL,NULL,'','',0),(58,72,1611517876,1611517876,1,0,0,3,13,NULL,'',0,0,0,0,2,4,'tx_styleguide_inline_fal','inline_3',2,'sys_file',NULL,NULL,NULL,'','',0),(59,72,1611517876,1611517876,1,0,0,3,14,NULL,'',0,0,0,0,3,4,'tx_styleguide_inline_fal','inline_3',3,'sys_file',NULL,NULL,NULL,'','',0),(60,72,1611517876,1611517876,1,0,0,3,15,NULL,'',0,0,0,0,1,4,'tx_styleguide_inline_fal','inline_4',1,'sys_file',NULL,NULL,NULL,'','',0),(61,72,1611517876,1611517876,1,0,0,3,16,NULL,'',0,0,0,0,2,4,'tx_styleguide_inline_fal','inline_4',2,'sys_file',NULL,NULL,NULL,'','',0),(62,72,1611517876,1611517876,1,0,0,3,17,NULL,'',0,0,0,0,3,4,'tx_styleguide_inline_fal','inline_4',3,'sys_file',NULL,NULL,NULL,'','',0),(63,72,1611517876,1611517876,1,0,0,0,0,NULL,'',0,0,0,0,1,4,'tx_styleguide_inline_fal','fal',1,'sys_file',NULL,NULL,NULL,'','',0),(64,72,1611517876,1611517876,1,0,0,0,0,NULL,'',0,0,0,0,2,4,'tx_styleguide_inline_fal','fal',2,'sys_file',NULL,NULL,NULL,'','',0),(65,72,1611517876,1611517876,1,0,0,0,0,NULL,'',0,0,0,0,3,4,'tx_styleguide_inline_fal','fal',3,'sys_file',NULL,NULL,NULL,'','',0),(66,72,1611517876,1611517876,1,0,0,4,0,NULL,'',0,0,0,0,1,5,'tx_styleguide_inline_fal','inline_1',1,'sys_file',NULL,NULL,NULL,'','',0),(67,72,1611517876,1611517876,1,0,0,4,0,NULL,'',0,0,0,0,2,5,'tx_styleguide_inline_fal','inline_1',2,'sys_file',NULL,NULL,NULL,'','',0),(68,72,1611517876,1611517876,1,0,0,4,0,NULL,'',0,0,0,0,3,5,'tx_styleguide_inline_fal','inline_1',3,'sys_file',NULL,NULL,NULL,'','',0),(69,72,1611517876,1611517876,1,0,0,4,0,NULL,'',0,0,0,0,1,5,'tx_styleguide_inline_fal','inline_2',1,'sys_file',NULL,NULL,NULL,'','',0),(70,72,1611517876,1611517876,1,0,0,4,0,NULL,'',0,0,0,0,2,5,'tx_styleguide_inline_fal','inline_2',2,'sys_file',NULL,NULL,NULL,'','',0),(71,72,1611517876,1611517876,1,0,0,4,0,NULL,'',0,0,0,0,3,5,'tx_styleguide_inline_fal','inline_2',3,'sys_file',NULL,NULL,NULL,'','',0),(72,72,1611517876,1611517876,1,0,0,4,0,NULL,'',0,0,0,0,1,5,'tx_styleguide_inline_fal','inline_3',1,'sys_file',NULL,NULL,NULL,'','',0),(73,72,1611517876,1611517876,1,0,0,4,0,NULL,'',0,0,0,0,2,5,'tx_styleguide_inline_fal','inline_3',2,'sys_file',NULL,NULL,NULL,'','',0),(74,72,1611517876,1611517876,1,0,0,4,0,NULL,'',0,0,0,0,3,5,'tx_styleguide_inline_fal','inline_3',3,'sys_file',NULL,NULL,NULL,'','',0),(75,72,1611517876,1611517876,1,0,0,4,0,NULL,'',0,0,0,0,1,5,'tx_styleguide_inline_fal','inline_4',1,'sys_file',NULL,NULL,NULL,'','',0),(76,72,1611517876,1611517876,1,0,0,4,0,NULL,'',0,0,0,0,2,5,'tx_styleguide_inline_fal','inline_4',2,'sys_file',NULL,NULL,NULL,'','',0),(77,72,1611517876,1611517876,1,0,0,4,0,NULL,'',0,0,0,0,3,5,'tx_styleguide_inline_fal','inline_4',3,'sys_file',NULL,NULL,NULL,'','',0),(78,72,1611517876,1611517876,1,0,0,0,0,NULL,'',0,0,0,0,1,5,'tx_styleguide_inline_fal','fal',1,'sys_file',NULL,NULL,NULL,'','',0),(79,72,1611517876,1611517876,1,0,0,0,0,NULL,'',0,0,0,0,2,5,'tx_styleguide_inline_fal','fal',2,'sys_file',NULL,NULL,NULL,'','',0),(80,72,1611517876,1611517876,1,0,0,0,0,NULL,'',0,0,0,0,3,5,'tx_styleguide_inline_fal','fal',3,'sys_file',NULL,NULL,NULL,'','',0),(81,102,1611517876,1611517876,1,0,0,0,0,NULL,'',0,0,0,0,1,1,'tx_styleguide_inline_parentnosoftdelete','inline_1',0,'sys_file',NULL,NULL,NULL,'','',0),(82,102,1611517876,1611517876,1,0,0,0,0,NULL,'',0,0,0,0,2,1,'tx_styleguide_inline_parentnosoftdelete','inline_1',0,'sys_file',NULL,NULL,NULL,'','',0),(83,102,1611517876,1611517876,1,0,0,0,0,NULL,'',0,0,0,0,3,1,'tx_styleguide_inline_parentnosoftdelete','inline_1',0,'sys_file',NULL,NULL,NULL,'','',0),(84,102,1611517876,1611517876,1,0,0,1,0,NULL,'',0,0,0,0,1,2,'tx_styleguide_inline_parentnosoftdelete','inline_1',1,'sys_file',NULL,NULL,NULL,'','',0),(85,102,1611517876,1611517876,1,0,0,1,0,NULL,'',0,0,0,0,2,2,'tx_styleguide_inline_parentnosoftdelete','inline_1',2,'sys_file',NULL,NULL,NULL,'','',0),(86,102,1611517876,1611517876,1,0,0,1,0,NULL,'',0,0,0,0,3,2,'tx_styleguide_inline_parentnosoftdelete','inline_1',3,'sys_file',NULL,NULL,NULL,'','',0),(87,102,1611517876,1611517876,1,0,0,2,81,NULL,'',0,0,0,0,1,3,'tx_styleguide_inline_parentnosoftdelete','inline_1',1,'sys_file',NULL,NULL,NULL,'','',0),(88,102,1611517876,1611517876,1,0,0,2,82,NULL,'',0,0,0,0,2,3,'tx_styleguide_inline_parentnosoftdelete','inline_1',2,'sys_file',NULL,NULL,NULL,'','',0),(89,102,1611517876,1611517876,1,0,0,2,83,NULL,'',0,0,0,0,3,3,'tx_styleguide_inline_parentnosoftdelete','inline_1',3,'sys_file',NULL,NULL,NULL,'','',0),(90,102,1611517876,1611517876,1,0,0,3,81,NULL,'',0,0,0,0,1,4,'tx_styleguide_inline_parentnosoftdelete','inline_1',1,'sys_file',NULL,NULL,NULL,'','',0),(91,102,1611517876,1611517876,1,0,0,3,82,NULL,'',0,0,0,0,2,4,'tx_styleguide_inline_parentnosoftdelete','inline_1',2,'sys_file',NULL,NULL,NULL,'','',0),(92,102,1611517876,1611517876,1,0,0,3,83,NULL,'',0,0,0,0,3,4,'tx_styleguide_inline_parentnosoftdelete','inline_1',3,'sys_file',NULL,NULL,NULL,'','',0),(93,102,1611517876,1611517876,1,0,0,4,0,NULL,'',0,0,0,0,1,5,'tx_styleguide_inline_parentnosoftdelete','inline_1',1,'sys_file',NULL,NULL,NULL,'','',0),(94,102,1611517876,1611517876,1,0,0,4,0,NULL,'',0,0,0,0,2,5,'tx_styleguide_inline_parentnosoftdelete','inline_1',2,'sys_file',NULL,NULL,NULL,'','',0),(95,102,1611517876,1611517876,1,0,0,4,0,NULL,'',0,0,0,0,3,5,'tx_styleguide_inline_parentnosoftdelete','inline_1',3,'sys_file',NULL,NULL,NULL,'','',0);
/*!40000 ALTER TABLE `sys_file_reference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file_storage`
--

DROP TABLE IF EXISTS `sys_file_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_file_storage` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `driver` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  `configuration` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_default` smallint(6) NOT NULL DEFAULT 0,
  `is_browsable` smallint(6) NOT NULL DEFAULT 0,
  `is_public` smallint(6) NOT NULL DEFAULT 0,
  `is_writable` smallint(6) NOT NULL DEFAULT 0,
  `is_online` smallint(6) NOT NULL DEFAULT 1,
  `auto_extract_metadata` smallint(6) NOT NULL DEFAULT 1,
  `processingfolder` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file_storage`
--

LOCK TABLES `sys_file_storage` WRITE;
/*!40000 ALTER TABLE `sys_file_storage` DISABLE KEYS */;
INSERT INTO `sys_file_storage` VALUES (1,0,1611516550,1611516550,0,0,'This is the local fileadmin/ directory. This storage mount has been created automatically by TYPO3.','fileadmin','Local','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"basePath\">\n                    <value index=\"vDEF\">fileadmin/</value>\n                </field>\n                <field index=\"pathType\">\n                    <value index=\"vDEF\">relative</value>\n                </field>\n                <field index=\"caseSensitive\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>',1,1,1,1,1,1,NULL);
/*!40000 ALTER TABLE `sys_file_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_filemounts`
--

DROP TABLE IF EXISTS `sys_filemounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_filemounts` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `base` int(10) unsigned NOT NULL DEFAULT 0,
  `read_only` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_filemounts`
--

LOCK TABLES `sys_filemounts` WRITE;
/*!40000 ALTER TABLE `sys_filemounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_filemounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_history`
--

DROP TABLE IF EXISTS `sys_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_history` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `actiontype` smallint(6) NOT NULL DEFAULT 0,
  `usertype` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'BE',
  `userid` int(10) unsigned DEFAULT NULL,
  `originaluserid` int(10) unsigned DEFAULT NULL,
  `recuid` int(11) NOT NULL DEFAULT 0,
  `tablename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `history_data` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `workspace` int(11) DEFAULT 0,
  `correlation_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `recordident_1` (`tablename`(100),`recuid`),
  KEY `recordident_2` (`tablename`(100),`tstamp`)
) ENGINE=InnoDB AUTO_INCREMENT=440 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_history`
--

LOCK TABLES `sys_history` WRITE;
/*!40000 ALTER TABLE `sys_history` DISABLE KEYS */;
INSERT INTO `sys_history` VALUES (1,1611516554,1,'BE',1,0,3,'be_users','{\"uid\":3,\"pid\":0,\"tstamp\":1611516554,\"crdate\":1611516554,\"cruser_id\":1,\"deleted\":0,\"disable\":0,\"starttime\":0,\"endtime\":0,\"description\":\"\",\"username\":\"autogenerated-6d8b51cdaa\",\"avatar\":0,\"password\":\"$argon2i$v=19$m=65536,t=16,p=1$U0c4ZkVVek42SlREVTV1Wg$\\/MDrTeQvcJUI3g3yVFVYSbNo6TuwhtPISudzp5i2mpU\",\"admin\":1,\"usergroup\":\"\",\"lang\":\"\",\"email\":\"\",\"db_mountpoints\":\"\",\"options\":3,\"realName\":\"\",\"userMods\":\"\",\"allowed_languages\":\"\",\"uc\":null,\"file_mountpoints\":\"\",\"file_permissions\":\"readFolder,writeFolder,addFolder,renameFolder,moveFolder,deleteFolder,readFile,writeFile,addFile,renameFile,replaceFile,moveFile,copyFile,deleteFile\",\"workspace_perms\":1,\"TSconfig\":\"\",\"lastlogin\":0,\"workspace_id\":0,\"category_perms\":\"\",\"password_reset_token\":\"\",\"tx_examples_mobile\":\"\",\"tx_styleguide_isdemorecord\":0}',0,'0400$531d5cc68269245586ca86e5f7c66361:0c759eb140de7eba987dfc32521df385'),(2,1611516583,2,'BE',1,0,3,'be_users','{\"oldRecord\":{\"username\":\"autogenerated-6d8b51cdaa\",\"password\":\"$argon2i$v=19$m=65536,t=16,p=1$U0c4ZkVVek42SlREVTV1Wg$\\/MDrTeQvcJUI3g3yVFVYSbNo6TuwhtPISudzp5i2mpU\"},\"newRecord\":{\"username\":\"pptr_admin\",\"password\":\"$argon2i$v=19$m=65536,t=16,p=1$NWdxMWx0d1g3b2ZQTGF3Rg$cVsGshJeKDHWXbtbLHPNgoyPH2keNOy9Z1ZBkkavjRM\"}}',0,'0400$6c3cf2e8c16123a8aca32e9426649f6d:0c759eb140de7eba987dfc32521df385'),(3,1611517876,1,'BE',1,0,1,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:e175f7045d7ccbfb26ffcf279422c2e5'),(4,1611517876,1,'BE',1,0,2,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:f11830df10b4b0bca2db34810c2241b3'),(5,1611517876,1,'BE',1,0,3,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:fe15eeb7d49e64e2cea91ab53fcf0db1'),(6,1611517876,1,'BE',1,0,4,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:412add0b3eb6ec8f1cb6710aea92e21e'),(7,1611517876,1,'BE',1,0,5,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:7ef5a4e3e11db8ac3fea4d7a75468161'),(8,1611517876,1,'BE',1,0,6,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:c75354c439a48dbde16b03ac553a080d'),(9,1611517876,1,'BE',1,0,7,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:df50bb24cbce671cf0d61f42fbbef601'),(10,1611517876,1,'BE',1,0,8,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:595375f2fb9f014e091eb08fbc51ec88'),(11,1611517876,1,'BE',1,0,9,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:c5e7fa6b7b8146bdcdc78407b052e1d7'),(12,1611517876,1,'BE',1,0,10,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:e904af5a60392ab3165f5849f5877e45'),(13,1611517876,1,'BE',1,0,11,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:51bca2bcf14079cc366c99de31802400'),(14,1611517876,1,'BE',1,0,12,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:d6f57183d4ec29f4a568a174f36b861b'),(15,1611517876,1,'BE',1,0,13,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:8a89606121863fe3a2ec2ea63ba83d69'),(16,1611517876,1,'BE',1,0,14,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:aaa274fb7a5f76c9749f1b2c8fba84a4'),(17,1611517876,1,'BE',1,0,15,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:c97934f122918253f51c81fbe45fd105'),(18,1611517876,1,'BE',1,0,16,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:878fab4218e507eb25dda6ac21dd7ff1'),(19,1611517876,1,'BE',1,0,17,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:dd30e16e220c1cff5911b320aa60dbce'),(20,1611517876,1,'BE',1,0,18,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:9e9e8c5ba4be654320a3cd25d73d01a4'),(21,1611517876,1,'BE',1,0,19,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:25dbd94d40a6ff54757b6e36bf898997'),(22,1611517876,1,'BE',1,0,20,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:1d0206225cc3f30f7ba150ff3aae8ab7'),(23,1611517876,1,'BE',1,0,21,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:bb4ab293ec9d3ccfe43678d078f6cea0'),(24,1611517876,1,'BE',1,0,22,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:e5087395befe41329009e7b123017494'),(25,1611517876,1,'BE',1,0,23,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:7e88f7aa7664c6f494370160b60358a1'),(26,1611517876,1,'BE',1,0,24,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:219ad4d34a3e23c6ccf2ca87da6bc52b'),(27,1611517876,1,'BE',1,0,25,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:464961a1483e7dda27d23c882ff696bb'),(28,1611517876,1,'BE',1,0,26,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:544939248209022b223d317bc97b7099'),(29,1611517876,1,'BE',1,0,27,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:97019c60b3ac7f8b98007c072afa2f0f'),(30,1611517876,1,'BE',1,0,28,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:aa68f552fa168869c47f8dbefb43cba0'),(31,1611517876,1,'BE',1,0,29,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:2d7ab27da714dae3c89a6e0cb79b80cd'),(32,1611517876,1,'BE',1,0,30,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:e3e225390eee037c1380949b378763b1'),(33,1611517876,1,'BE',1,0,31,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:9cb7b2b3fac90492135e3538aed4605a'),(34,1611517876,1,'BE',1,0,32,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:302984e7412d7a45766e1d6304831138'),(35,1611517876,1,'BE',1,0,33,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:0c3ed5b51e5eff03577c1c2f671f9fbe'),(36,1611517876,1,'BE',1,0,34,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:152f249a1550628c00eb2837d4cfde70'),(37,1611517876,1,'BE',1,0,35,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:d58411788d5a726dba77a4228008d89f'),(38,1611517876,1,'BE',1,0,36,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:baa7a09b75230872aacb0cfcf5051237'),(39,1611517876,1,'BE',1,0,37,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:711f7fd735d383d3e32b503dd056ca77'),(40,1611517876,1,'BE',1,0,38,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:25fb0f8c54125efeb15a71bcd7ab0dae'),(41,1611517876,1,'BE',1,0,39,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:f8a7770703417fcd54288c2180819c52'),(42,1611517876,1,'BE',1,0,40,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:7cda874357e9b43e55f32e92e735b3f8'),(43,1611517876,1,'BE',1,0,41,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:72c156ab8075d295e6bed13d44a3899f'),(44,1611517876,1,'BE',1,0,42,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:44dacbb46da3eeda7bf3a298d3f8dcdf'),(45,1611517876,1,'BE',1,0,43,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:d00c6994241112f65826f8dda1afa4db'),(46,1611517876,1,'BE',1,0,44,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:99cee0b66191b5b1b299f6957b8d046f'),(47,1611517876,1,'BE',1,0,45,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:d5c8a0c399b70b593af4e702ea1ff918'),(48,1611517876,1,'BE',1,0,46,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:e8adec7f7fc01007a1fc847e41d3f0c8'),(49,1611517876,1,'BE',1,0,47,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:c2d3f3895ebb62a7f0918358495feb90'),(50,1611517876,1,'BE',1,0,48,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:7281e4156dc7c00da5e8e8f12d1ad645'),(51,1611517876,1,'BE',1,0,49,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:81e6b08ac1d0937f00907cc283f89f88'),(52,1611517876,1,'BE',1,0,50,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:671da757bfb02238463b8b779450e7f1'),(53,1611517876,1,'BE',1,0,51,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:5c5552cdbd37b0d7a00d7bee803a84b9'),(54,1611517876,1,'BE',1,0,52,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:eac43127adf688163af4c91393ae5b52'),(55,1611517876,1,'BE',1,0,53,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:60b47c38b54ea9484946816deb210a0e'),(56,1611517876,1,'BE',1,0,54,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:7b311257b3050241474e7db89cab4819'),(57,1611517876,1,'BE',1,0,55,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:085a4605348cd07ca76bf90f23a64611'),(58,1611517876,1,'BE',1,0,56,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:f7d5ae7112f81c9c5489570127872f29'),(59,1611517876,1,'BE',1,0,57,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:342de781cc87083f78d06a82c68f09f4'),(60,1611517876,1,'BE',1,0,58,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:ab21e322e42a7bdfabb904f5462e4c02'),(61,1611517876,1,'BE',1,0,59,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:4433f049eb08150ef22f96b06e4856b1'),(62,1611517876,1,'BE',1,0,60,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:5ab4163aa2745e5a0113db40c70dc8f4'),(63,1611517876,1,'BE',1,0,61,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:56660b3f54e5664e7301c75c63113d07'),(64,1611517876,1,'BE',1,0,62,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:24aebf1ddb9e283704201212e1ca1eb2'),(65,1611517876,1,'BE',1,0,63,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:0089143ede545095718c11b0f1a63339'),(66,1611517876,1,'BE',1,0,64,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:d483efb03977925709dcaec58241fe0c'),(67,1611517876,1,'BE',1,0,65,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:47f778231b3d851f3b07a2ce1fdd8e12'),(68,1611517876,1,'BE',1,0,66,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:05134d12cc76495250000f898f31578f'),(69,1611517876,1,'BE',1,0,67,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:5236c6270d799c6db813705708029016'),(70,1611517876,1,'BE',1,0,68,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:9105568a561791188690e88d66398289'),(71,1611517876,1,'BE',1,0,69,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:21a77b57cc66169e3eb72e42ce38df67'),(72,1611517876,1,'BE',1,0,70,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:32f4fcfb7755e949f03e294ddf32b88c'),(73,1611517876,1,'BE',1,0,71,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:d3125aee5307b61915d2ec678d85eeab'),(74,1611517876,1,'BE',1,0,72,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:f77427d34bbdc385d0ddfb2743aa1ca9'),(75,1611517876,1,'BE',1,0,73,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:a042e2be8fc0d5f5686afa5ee094dd32'),(76,1611517876,1,'BE',1,0,74,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:91f9124db9124c1285aed218c57194a5'),(77,1611517876,1,'BE',1,0,75,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:f7c2cfd732fdefe67437a120cc6e6ba6'),(78,1611517876,1,'BE',1,0,76,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:6c16d892cdfda6aeafd6cd764f0617e2'),(79,1611517876,1,'BE',1,0,77,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:ff4aeac58c87ecf3e0ec6300cc072c30'),(80,1611517876,1,'BE',1,0,78,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:16cd189ad56501704da39f788681ee11'),(81,1611517876,1,'BE',1,0,79,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:94b6dcb7ae63e915ecf170a8b54f94a3'),(82,1611517876,1,'BE',1,0,80,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:1a14a8152e46296c2fd70e28a6b4ac7d'),(83,1611517876,1,'BE',1,0,81,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:ca827a60c52c9083b5079476424befbf'),(84,1611517876,1,'BE',1,0,82,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:17fddf6d55d080cdd20bd2fc8dc20b29'),(85,1611517876,1,'BE',1,0,83,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:b6c13e61254f5267b8588c5a0f429b18'),(86,1611517876,1,'BE',1,0,84,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:ace6f70fd2d63e681da17bcf891abe6a'),(87,1611517876,1,'BE',1,0,85,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:fc647492dc3fc3aabf4da32517308129'),(88,1611517876,1,'BE',1,0,86,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:6f82413b267d75e5ae58733b06aef0c3'),(89,1611517876,1,'BE',1,0,87,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:77796dc29f1b1eb3beacf1a769312355'),(90,1611517876,1,'BE',1,0,88,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:ccd0b2b9c5204c9be39a14a94000dca4'),(91,1611517876,1,'BE',1,0,89,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:314ecbd06cbf56176c619bce6e0a109b'),(92,1611517876,1,'BE',1,0,90,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:25355c4a210565cf0c96d3f6778f2b0e'),(93,1611517876,1,'BE',1,0,91,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:797a51661468a0f8a584b1f316d94c9d'),(94,1611517876,1,'BE',1,0,92,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:52cbce8fb12ceff9fa67a3d191fc82d1'),(95,1611517876,1,'BE',1,0,93,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:1734754f601ef4556cc0af878ec5f591'),(96,1611517876,1,'BE',1,0,94,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:bcec5b67bf14e303ba659dc57ae02028'),(97,1611517876,1,'BE',1,0,95,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:4387ee526af338715d396483f55b800a'),(98,1611517876,1,'BE',1,0,96,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:973e862f97bbc67dfbc5b27b2eef3be1'),(99,1611517876,1,'BE',1,0,97,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:9732cf57bac6de4ad69bec108a2ee647'),(100,1611517876,1,'BE',1,0,98,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:f39d20391a70254c1b8c55506d6294c1'),(101,1611517876,1,'BE',1,0,99,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:67c921f4e963140b844f9b471d167cb7'),(102,1611517876,1,'BE',1,0,100,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:5ad3106f083c7a35fc022266b98dc3bd'),(103,1611517876,1,'BE',1,0,101,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:eca93d8ae5fb22a4c97a7375d1c26ff9'),(104,1611517876,1,'BE',1,0,102,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:4db0f97632f88eb17ef9d21a3b297e72'),(105,1611517876,1,'BE',1,0,103,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:c2c077d79a2195c1f1d093373d3bce2e'),(106,1611517876,1,'BE',1,0,104,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:ec03d9eeb31a99da17e12477c9fa3ecb'),(107,1611517876,1,'BE',1,0,105,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:7aeded22f59f348247c4f5ab8a85606e'),(108,1611517876,1,'BE',1,0,106,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:3b701a08bfa2add936c2e143d38b2cc1'),(109,1611517876,1,'BE',1,0,107,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:7e3e0dc6c2b1ab3e9942ae5bd2fb101e'),(110,1611517876,1,'BE',1,0,108,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:705ecdba5e5a8ca24d4ba90983e0f540'),(111,1611517876,1,'BE',1,0,109,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:fea96227acde8543cd3f07f81d9821e6'),(112,1611517876,1,'BE',1,0,110,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:1d2b6f3ce92aa9543840f5fb91dcbfd7'),(113,1611517876,1,'BE',1,0,111,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:a79d3bb5fb55dd49209d2ed071a151ed'),(114,1611517876,1,'BE',1,0,112,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:cd19e608176bfe86f36b1bad8c27e4af'),(115,1611517876,1,'BE',1,0,113,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:460dbff638d84caf5c404ed4f8caf399'),(116,1611517876,1,'BE',1,0,114,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:3d2a6f4e05dc80dbb9262947e5175d29'),(117,1611517876,1,'BE',1,0,115,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:8804488c3451be0e9a824e9b0a761c77'),(118,1611517876,1,'BE',1,0,116,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:1727a484d0a52da1d981c41d5132bace'),(119,1611517876,1,'BE',1,0,117,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:08dc484ebaa4ca203e298757bfe98a4c'),(120,1611517876,1,'BE',1,0,118,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:016f83767049d2906533d141df6b5da4'),(121,1611517876,1,'BE',1,0,119,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:d73961ef1889452b6fdd65d29b100021'),(122,1611517876,1,'BE',1,0,120,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:86ded70d3dca454358707ba6b056e908'),(123,1611517876,1,'BE',1,0,121,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:ecdc276a9f7690524abb1eaaa69e88b5'),(124,1611517876,1,'BE',1,0,122,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:99f7a5f6704de750c42364432f9aed72'),(125,1611517876,1,'BE',1,0,123,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:93229b1d91b401bad72a490678a8982d'),(126,1611517876,1,'BE',1,0,124,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:712d96ba7d2353f5e303619e937119b7'),(127,1611517876,1,'BE',1,0,125,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:c38f6a6c61ca4802f3c091c866f17ffc'),(128,1611517876,1,'BE',1,0,126,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:0a272fa8ed6ecdb32e5b29bc8ca375d6'),(129,1611517876,1,'BE',1,0,127,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:0b5914fe94d1d4f97f7d7dbecdf5671f'),(130,1611517876,1,'BE',1,0,128,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:890c9182182f258a600589b1a749bee9'),(131,1611517876,1,'BE',1,0,129,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:f6f070625f4e008a8aa7dbf5a3af614d'),(132,1611517876,1,'BE',1,0,130,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:13c9ef28351ae39eede2ea8392e3b184'),(133,1611517876,1,'BE',1,0,131,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:8b31e3e6fb525ac0be266ce825ea9af2'),(134,1611517876,1,'BE',1,0,132,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:50498fcfc1d672537e1fc75f16b5922f'),(135,1611517876,1,'BE',1,0,133,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:99460b40b5c8f5e72e946669c5179ab7'),(136,1611517876,1,'BE',1,0,134,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:8d9e16f3a39911741169d84f818709d1'),(137,1611517876,1,'BE',1,0,135,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:442291eb70764e7b558dd15cbbf4a63d'),(138,1611517876,1,'BE',1,0,136,'pages','[]',0,'0400$09943e4116b349be26674cf4b494946e:8d4d399df8b1cb9e959bc9e057368b40'),(139,1611517876,1,'BE',1,0,2,'tx_styleguide_elements_basic','[]',0,'0400$5880133708e86ae910f045b33b40ed60:3865106e2ba5ce8d0d05fe6bca4c15d2'),(140,1611517876,1,'BE',1,0,3,'tx_styleguide_elements_basic','[]',0,'0400$2f42a695dfd9927c139c7a496bfa285c:a2234b980be6536bf3d0d4bf5ac041fd'),(141,1611517876,1,'BE',1,0,4,'tx_styleguide_elements_basic','[]',0,'0400$8b4889503090483bafe90b4270c765e6:cc37ba43eefa596871faa34d8d05097e'),(142,1611517876,1,'BE',1,0,5,'tx_styleguide_elements_basic','[]',0,'0400$2aaab2dadd66a2546fe715ebc34374d2:78fe4cae3bf4770ea3361d8a9203cc4d'),(143,1611517876,1,'BE',1,0,2,'tx_styleguide_elements_group','[]',0,'0400$3dd3e535ae299817caa3571179886509:15a20997a6f5bc0b2f92e93cb85f4dfb'),(144,1611517876,1,'BE',1,0,3,'tx_styleguide_elements_group','[]',0,'0400$dc158bf2e5ac259403b60b54faf9f209:8484607ca2148eddb72067b92be5d908'),(145,1611517876,1,'BE',1,0,4,'tx_styleguide_elements_group','[]',0,'0400$0fa757f040853f8ca2b8a344459be651:6021dc3747c8dbb5eecc085b8f14c196'),(146,1611517876,1,'BE',1,0,5,'tx_styleguide_elements_group','[]',0,'0400$c34b047668e468d69f5b56ecdf531939:46706aeed5f25c4c8f2a720196e1d5a3'),(147,1611517876,1,'BE',1,0,2,'tx_styleguide_elements_rte_inline_1_child','[]',0,'0400$7ba372cd5ea232d09e2bf50b62c21c9b:e325878f4619c85dc8c043d5897efc26'),(148,1611517876,1,'BE',1,0,2,'tx_styleguide_elements_rte_flex_1_inline_1_child','[]',0,'0400$52ae3b9df421a922ed6ac5342ec1c552:f7a03840e13a8088dc9ed8834a3707d5'),(149,1611517876,1,'BE',1,0,2,'tx_styleguide_elements_rte','[]',0,'0400$f714027c98394b15281b28315d8323dc:987054a4148c5a5880cfa2e1bc6e1270'),(150,1611517876,1,'BE',1,0,3,'tx_styleguide_elements_rte_inline_1_child','[]',0,'0400$b868eb3dc7116388efa8ee80e01a2189:d0a1fa645080c1efe08d9d261bd7642a'),(151,1611517876,1,'BE',1,0,3,'tx_styleguide_elements_rte_flex_1_inline_1_child','[]',0,'0400$ae35d7eacf6cac1f3bb7ad99afb6d1ea:6da56d5b7edf500f294ba56a0ebf47cb'),(152,1611517876,1,'BE',1,0,3,'tx_styleguide_elements_rte','[]',0,'0400$8958fa2670de6bdfde0e4d560927a940:573b6b2a78d265c51b2e9c198c1b1afb'),(153,1611517876,1,'BE',1,0,4,'tx_styleguide_elements_rte_inline_1_child','[]',0,'0400$ca436950c1462b570ec3282dbadf391a:b75e7fadf69b697deb78a052c6a97db0'),(154,1611517876,1,'BE',1,0,4,'tx_styleguide_elements_rte_flex_1_inline_1_child','[]',0,'0400$e9188ef4f3d10678f919f71847f5f10a:ab2368bc85348a8e9e2800af1919f019'),(155,1611517876,1,'BE',1,0,4,'tx_styleguide_elements_rte','[]',0,'0400$e734f47d563dae7e5d65554075eb1697:670fca95b627e39c9685940f31148fac'),(156,1611517876,1,'BE',1,0,5,'tx_styleguide_elements_rte_inline_1_child','[]',0,'0400$6ba81c26896db8ec549e8612a9a9367e:cfcee589440f7e4adf8eab7944986be8'),(157,1611517876,1,'BE',1,0,5,'tx_styleguide_elements_rte_flex_1_inline_1_child','[]',0,'0400$b3e43674d153e8dfd58216dbbba30bf4:cc99bae8360c7417d383b97584deedc1'),(158,1611517876,1,'BE',1,0,5,'tx_styleguide_elements_rte','[]',0,'0400$c568c1b92c377fa50c1ee1c9e8f532a2:5bb095bb1e8f500ffaf87993ba9995ee'),(159,1611517876,1,'BE',1,0,1,'sys_file_reference','[]',0,'0400$b00e12ddc0531be7ef65df8105dc0a8e:4cf496f597e7b095ce8b755e6cec3c0c'),(160,1611517876,1,'BE',1,0,2,'sys_file_reference','[]',0,'0400$a91855f00c0e3fcf5406e11925cb4bc1:814fc0f720dfab882655a795e23a5b66'),(161,1611517876,1,'BE',1,0,2,'tx_styleguide_elements_select','[]',0,'0400$a6b0b00e15712abd8626790dcb6c5656:8a932ff934eba0907cb1f2da4327a05c'),(162,1611517876,1,'BE',1,0,3,'tx_styleguide_elements_select','[]',0,'0400$330619e6a52c5005bca28743df868d43:f36fcca4ed9d7b6ab67bb3c6b5a278de'),(163,1611517876,1,'BE',1,0,4,'tx_styleguide_elements_select','[]',0,'0400$4fc691e1a427637ba612b1c16f4ef3ed:8c0430a3c816197bbaef946cb68fc30f'),(164,1611517876,1,'BE',1,0,5,'tx_styleguide_elements_select','[]',0,'0400$1c3fb89f9f3940096bd3c08d788025d4:3ad41de369045c39269d3bb1c2aec33c'),(165,1611517876,1,'BE',1,0,2,'tx_styleguide_elements_special','[]',0,'0400$834196585a22f8a047b30aba3f1b3ff1:dbb8bb18682a59f9cf9ad0863dccede5'),(166,1611517876,1,'BE',1,0,3,'tx_styleguide_elements_special','[]',0,'0400$bfe432bccdb8190faf5bbf8f90ac59d5:86ec48e7d5199a3d94e4fddc86bbba9a'),(167,1611517876,1,'BE',1,0,4,'tx_styleguide_elements_special','[]',0,'0400$0a18283f58811d2dd9b64fff32badfea:54eb46731d3829a60c7bb16fd3a5343d'),(168,1611517876,1,'BE',1,0,5,'tx_styleguide_elements_special','[]',0,'0400$1f216c6eb5d66707cd8eadc7c2d10a83:fb2ab598ec37b15d634a3c2f3b071809'),(169,1611517876,1,'BE',1,0,2,'tx_styleguide_elements_t3editor_inline_1_child','[]',0,'0400$b190804dc50e2a9a414b7a3d1a2cf726:605f858971027669022ca84933367cd0'),(170,1611517876,1,'BE',1,0,2,'tx_styleguide_elements_t3editor_flex_1_inline_1_child','[]',0,'0400$093466eaa6cd834e9623a32d3194c1ef:cd1c66ddd9871b1239b0db73c1aedb31'),(171,1611517876,1,'BE',1,0,2,'tx_styleguide_elements_t3editor','[]',0,'0400$55c8fdfca22615163d24be84d52aa094:c4b81c69ffd14d4c29e63e770c1780f4'),(172,1611517876,1,'BE',1,0,3,'tx_styleguide_elements_t3editor_inline_1_child','[]',0,'0400$c93aa03c9a7d93a19f94809c1aef0841:1e66221fd95e43f16ea5b096c6a4ea8b'),(173,1611517876,1,'BE',1,0,3,'tx_styleguide_elements_t3editor_flex_1_inline_1_child','[]',0,'0400$8d320374ff19eec5cf448ca9a053befd:f56f1a4fcb4ec37d0f25927fdd44e579'),(174,1611517876,1,'BE',1,0,3,'tx_styleguide_elements_t3editor','[]',0,'0400$c82692a050ac941b90a0c3b686e6879f:1df2eddeb0a8e76016e511bc1e00b5c2'),(175,1611517876,1,'BE',1,0,4,'tx_styleguide_elements_t3editor_inline_1_child','[]',0,'0400$4bcb6435f3874be1187bc75b2c703d29:042fc254e68169ca733ddba06b594e25'),(176,1611517876,1,'BE',1,0,4,'tx_styleguide_elements_t3editor_flex_1_inline_1_child','[]',0,'0400$3620fa077f6622b3aaee6a2bbe635f15:65f631810246f18300cc6e486a4d3556'),(177,1611517876,1,'BE',1,0,4,'tx_styleguide_elements_t3editor','[]',0,'0400$2529249eb84ebceab3af189fde711673:9592cdbe286c86dd2ff7764af2d9e83e'),(178,1611517876,1,'BE',1,0,5,'tx_styleguide_elements_t3editor_inline_1_child','[]',0,'0400$bbeb8c606a9abe9deda614726c6bd3ae:493eb6c372be9b7e5ffd36e240876c48'),(179,1611517876,1,'BE',1,0,5,'tx_styleguide_elements_t3editor_flex_1_inline_1_child','[]',0,'0400$5db738294e468937abfa5beefd456a22:9d3a39b9ea5de331d1371ec1f4b323c4'),(180,1611517876,1,'BE',1,0,5,'tx_styleguide_elements_t3editor','[]',0,'0400$42d89c398a55ef98bec23ddc802beeeb:e20391717c00c4820bb72e8611d1ab54'),(181,1611517876,1,'BE',1,0,2,'tx_styleguide_flex_flex_3_inline_1_child','[]',0,'0400$c60c86a6ac0c8544e2dcc86c2b286086:1ea1df07a2a55f9f81eb3ef726438294'),(182,1611517876,1,'BE',1,0,2,'tx_styleguide_flex','[]',0,'0400$86f7aa9fa77166f3702219ca5d40d74c:c3c0c72c6eec270d15b7ceb4c06b40cc'),(183,1611517876,1,'BE',1,0,3,'tx_styleguide_flex_flex_3_inline_1_child','[]',0,'0400$85fff83e1c4431f48f420960135872c7:0ffdae3e7f3767128287df71aae667c3'),(184,1611517876,1,'BE',1,0,3,'tx_styleguide_flex','[]',0,'0400$5c8482ccd75ec12612ee1b421236b82e:47a85936cb84e24eb1392355cc353da4'),(185,1611517876,1,'BE',1,0,4,'tx_styleguide_flex_flex_3_inline_1_child','[]',0,'0400$86e7178fa916bb755289e444d93a4012:f700198ed7d0c31494a7bc84d777461e'),(186,1611517876,1,'BE',1,0,4,'tx_styleguide_flex','[]',0,'0400$173f4997c3ad7bef1ca8ff5f691939e8:20fa0eb96fee0da306bb004e3dd7c596'),(187,1611517876,1,'BE',1,0,5,'tx_styleguide_flex_flex_3_inline_1_child','[]',0,'0400$446db29261624e5d510d647a325df213:083927f37642c9fde8596b0b428da801'),(188,1611517876,1,'BE',1,0,5,'tx_styleguide_flex','[]',0,'0400$94980272d8807c791e9bacfa1ec98aa8:491cb8bd375ef2fb955033eaf8bf0e8d'),(189,1611517876,1,'BE',1,0,2,'tx_styleguide_inline_11','[]',0,'0400$fa806901a09e8031c94f3a612d6f2b76:bb0932aa89523504e8716c16aa1e76f4'),(190,1611517876,1,'BE',1,0,3,'tx_styleguide_inline_11','[]',0,'0400$d13c9065c8365322f9656c9ebe602737:2deaf701182b5b66096a17d6b3a37aa3'),(191,1611517876,1,'BE',1,0,4,'tx_styleguide_inline_11','[]',0,'0400$25cf3d19cf88cc7f9320f7aed711d627:580554bf29fabda9eb820fb37e31a58e'),(192,1611517876,1,'BE',1,0,5,'tx_styleguide_inline_11','[]',0,'0400$f5db2a383a9ed34e0fc77f86bb6ccec3:9661ab711cacaf834106ee7af52281fc'),(193,1611517876,1,'BE',1,0,2,'tx_styleguide_inline_1n_child','[]',0,'0400$21207766f755f92ae24fc218e44709dc:5dfedb8de4b6532d682113d49c7f8e20'),(194,1611517876,1,'BE',1,0,2,'tx_styleguide_inline_1n','[]',0,'0400$ce5056cb048cfe7baceb3aa92fbb207b:9f3ee388eb676c453c9d1c8e1d119927'),(195,1611517876,1,'BE',1,0,3,'tx_styleguide_inline_1n_child','[]',0,'0400$a0db217f435b68d26bd4cddf68f356ad:5d698ac31907172602c4079909eaea43'),(196,1611517876,1,'BE',1,0,3,'tx_styleguide_inline_1n','[]',0,'0400$58a86e03a8bcb8a343c00d46a9deb7c5:152248999d2ac0d7449a963be1acee28'),(197,1611517876,1,'BE',1,0,4,'tx_styleguide_inline_1n_child','[]',0,'0400$cba3bdb4a3887fa8265395b337aab659:f5d72bd16a677bcf85f395a9731e4138'),(198,1611517876,1,'BE',1,0,4,'tx_styleguide_inline_1n','[]',0,'0400$f04403907c9d1b317d28631417fa3e38:ab122668cbbd7981b08c34aef77760b0'),(199,1611517876,1,'BE',1,0,5,'tx_styleguide_inline_1n_child','[]',0,'0400$bbe660160e07b842bb4dc09b78d59045:1398a4472030de821f69187cfe585708'),(200,1611517876,1,'BE',1,0,5,'tx_styleguide_inline_1n','[]',0,'0400$ee8e80205c868bbb96e08b904297ff96:8da5393ecda96f51fe141e58db5f433a'),(201,1611517876,1,'BE',1,0,2,'tx_styleguide_inline_1n1n_childchild','[]',0,'0400$c48a83871b6980c975c0e50d0786ff4b:eab08f7a5ec6199586cbd47d37edc410'),(202,1611517876,1,'BE',1,0,2,'tx_styleguide_inline_1n1n_child','[]',0,'0400$2a919f783d0c44e0f3528ac043c25338:c06bb6ccd234c1930aec20bb830d1a79'),(203,1611517876,1,'BE',1,0,2,'tx_styleguide_inline_1n1n','[]',0,'0400$4a687950275862a20e414342844b0296:8e7bb192de35d1b1d4910d170b82cdc5'),(204,1611517876,1,'BE',1,0,3,'tx_styleguide_inline_1n1n_childchild','[]',0,'0400$727c05ef7d60275d8aad7b50e7f88c03:d3de483cc357025115f98e0916873262'),(205,1611517876,1,'BE',1,0,3,'tx_styleguide_inline_1n1n_child','[]',0,'0400$9a48758a686eeddc4fbdb5f9a14850eb:081a9a9852d8771e1dab72dcf36e76db'),(206,1611517876,1,'BE',1,0,3,'tx_styleguide_inline_1n1n','[]',0,'0400$93e02090acc42cafd296e3179db3323d:5820dbd55fe716181bfb0a80c6d3d177'),(207,1611517876,1,'BE',1,0,4,'tx_styleguide_inline_1n1n_childchild','[]',0,'0400$02114c02543429673138f92aac04742f:157715d430407e391fd9da6606c25665'),(208,1611517876,1,'BE',1,0,4,'tx_styleguide_inline_1n1n_child','[]',0,'0400$3856957048e66d96562c86de48197c29:ffe29057776ff8862d9f0c206e60b8be'),(209,1611517876,1,'BE',1,0,4,'tx_styleguide_inline_1n1n','[]',0,'0400$0d68ddc5567d7b755bbeb49a0888e459:279330312338180f23f0d2e546b1371d'),(210,1611517876,1,'BE',1,0,5,'tx_styleguide_inline_1n1n_childchild','[]',0,'0400$05be6f03cce9cf505afda8bb50c8142e:2a397e485833c25d3030fa049b12de8e'),(211,1611517876,1,'BE',1,0,5,'tx_styleguide_inline_1n1n_child','[]',0,'0400$f5e0e7c6a9302e871af41de347e32dcb:33c6e929265baa35b94eddc063ed186d'),(212,1611517876,1,'BE',1,0,5,'tx_styleguide_inline_1n1n','[]',0,'0400$0e143b3ca8b818b7ea0a1e1400ae7b97:9a7c6ef9525f1ecaaab19ced75ddeff4'),(213,1611517876,1,'BE',1,0,2,'tx_styleguide_inline_1nnol10n','[]',0,'0400$9d257965f374bc61b0cec4046fea4e8d:1672872f820d5b49c0b67d4c3cf5b49d'),(214,1611517876,1,'BE',1,0,2,'tx_styleguide_inline_1nnol10n_child','{\"uid\":2,\"pid\":57,\"tstamp\":1611517876,\"crdate\":1611517876,\"cruser_id\":1,\"deleted\":0,\"disable\":0,\"sorting\":256,\"parentid\":1,\"parenttable\":\"tx_styleguide_inline_1nnol10n\",\"input_1\":\"lipsum\"}',0,'0400$21296a0f525243ede947905a2f6488f5:f6f0806670d37d5c487eee90a447f4b4'),(215,1611517876,1,'BE',1,0,3,'tx_styleguide_inline_1nnol10n','[]',0,'0400$7401b3e72b243b50f38658acfeed035a:a19f9cf486d293c85f0cd59d324728f3'),(216,1611517876,1,'BE',1,0,3,'tx_styleguide_inline_1nnol10n_child','{\"uid\":3,\"pid\":57,\"tstamp\":1611517876,\"crdate\":1611517876,\"cruser_id\":1,\"deleted\":0,\"disable\":0,\"sorting\":256,\"parentid\":1,\"parenttable\":\"tx_styleguide_inline_1nnol10n\",\"input_1\":\"lipsum\"}',0,'0400$5492106d600ef2b3e6d67de07f6385b4:5e582107411d8bbd533f216ebafd6291'),(217,1611517876,1,'BE',1,0,4,'tx_styleguide_inline_1nnol10n','[]',0,'0400$e425c71514c3090d204d50f506d010d5:6eb99cb7cc26a06f0c20619defa74bbf'),(218,1611517876,1,'BE',1,0,5,'tx_styleguide_inline_1nnol10n','[]',0,'0400$5e48c456f8330a8aabf8aa7f8f5305ae:dad61bdfd45f17d7124a43be79f96407'),(219,1611517876,1,'BE',1,0,3,'sys_file_reference','[]',0,'0400$22f6f8b8f264e310e3b7e2dec11d0e21:d2c609347a4764200256b39b9425159a'),(220,1611517876,1,'BE',1,0,4,'sys_file_reference','[]',0,'0400$22f6f8b8f264e310e3b7e2dec11d0e21:cea5fcd7b97871880cfe3717d6b52ef4'),(221,1611517876,1,'BE',1,0,5,'sys_file_reference','[]',0,'0400$22f6f8b8f264e310e3b7e2dec11d0e21:5f15a1453f67b933ed3314381f5d67e4'),(222,1611517876,1,'BE',1,0,2,'tx_styleguide_inline_expand_inline_1_child','[]',0,'0400$9320880bb723bbcdb1a96c1d80d54d1f:626450fcdf9f8e83afeb1b6607986571'),(223,1611517876,1,'BE',1,0,2,'tx_styleguide_inline_expand','[]',0,'0400$55fd18942b5d3b15e6b07c0d4dc9ac15:973bf666e429ce17b2bfe97d6ebc1896'),(224,1611517876,1,'BE',1,0,3,'tx_styleguide_inline_expand_inline_1_child','[]',0,'0400$1283247f628d8e18dd844f1ed3e30b60:b5829f6a3cd279a418566a1368c06e4f'),(225,1611517876,1,'BE',1,0,3,'tx_styleguide_inline_expand','[]',0,'0400$49bbad93ee1bdd9c99ece1fe7b5b3ea4:9bf70cc09a38cc32fe90fd3dc19db0ed'),(226,1611517876,1,'BE',1,0,4,'tx_styleguide_inline_expand_inline_1_child','[]',0,'0400$dc50f79124ba661951780509da3752e9:a951cca55a2c15f7441cd880639fc32d'),(227,1611517876,1,'BE',1,0,4,'tx_styleguide_inline_expand','[]',0,'0400$5abf56f5434db32010a695b316b488cc:fb539038b7959aaa6e182b8fb50dc05f'),(228,1611517876,1,'BE',1,0,5,'tx_styleguide_inline_expand_inline_1_child','[]',0,'0400$9b4558c48f8128a3ebb8d9c387ce7f97:493f4bfd1dfb6389cf715f1b0fabef46'),(229,1611517876,1,'BE',1,0,5,'tx_styleguide_inline_expand','[]',0,'0400$e15bb7d490fa7d4c1f7a883ada95bc99:c28ffdd717e60ad442868bed9f82136f'),(230,1611517876,1,'BE',1,0,4,'tx_styleguide_inline_expandsingle_child','[]',0,'0400$1561c0863f87b73abe1759afe5a330dc:a54c2eac461503929002104f6ac2d08e'),(231,1611517876,1,'BE',1,0,5,'tx_styleguide_inline_expandsingle_child','[]',0,'0400$807894101190506e30a22090d67e8fe9:69daa2dc93c666784ee24b60ee1e099c'),(232,1611517876,1,'BE',1,0,6,'tx_styleguide_inline_expandsingle_child','[]',0,'0400$a7c25596275ecb1df288ab5bf5d08530:501a477c01ff1789867872f3bd3a48d2'),(233,1611517876,1,'BE',1,0,2,'tx_styleguide_inline_expandsingle','[]',0,'0400$f8faab68e4a406c9e44d54cd63dad0d7:7315411dfd028cbcb4976cfcf29a2201'),(234,1611517876,1,'BE',1,0,7,'tx_styleguide_inline_expandsingle_child','[]',0,'0400$d485d3ca9dd7b15f50a2519c0d80d5f1:1714d5efb5e7a3222324deb014725e72'),(235,1611517876,1,'BE',1,0,8,'tx_styleguide_inline_expandsingle_child','[]',0,'0400$e02c146c5433ca1610c2121cb3a83657:60cfea091299b4d33a9621fe884d6be5'),(236,1611517876,1,'BE',1,0,9,'tx_styleguide_inline_expandsingle_child','[]',0,'0400$1e41cea3fde094f873d7e81ed8e4370e:3cb19af6b3fa73dd37258640cdc34cee'),(237,1611517876,1,'BE',1,0,3,'tx_styleguide_inline_expandsingle','[]',0,'0400$8c17735f5aca16cc3465856a36ebf590:173134f0d0c5f225269c9e7a4e5a536a'),(238,1611517876,1,'BE',1,0,10,'tx_styleguide_inline_expandsingle_child','[]',0,'0400$2a988b7a81acffa8cc599a513d7eff7d:6dc90668fe3e4a416f617010fae17804'),(239,1611517876,1,'BE',1,0,11,'tx_styleguide_inline_expandsingle_child','[]',0,'0400$f3376fe479f6a56fe45ca69667373f2f:57355db4f18232127291d79df65c828c'),(240,1611517876,1,'BE',1,0,12,'tx_styleguide_inline_expandsingle_child','[]',0,'0400$2e79e85e8109db391d2af75b72507c37:80d3fdbe962ad764d89766eb9ff3481d'),(241,1611517876,1,'BE',1,0,4,'tx_styleguide_inline_expandsingle','[]',0,'0400$e90230c20bc8025ddd1501732d5a0022:9c8f0b0075c3e030ae37997e08a54e1c'),(242,1611517876,1,'BE',1,0,13,'tx_styleguide_inline_expandsingle_child','[]',0,'0400$8744106fe3fea9e184cd29badda1520e:f906e5c48c292ec7723ada43e72b6029'),(243,1611517876,1,'BE',1,0,14,'tx_styleguide_inline_expandsingle_child','[]',0,'0400$96cbef017f00942eea63bd0affcf5e42:fee38ca0965938ed583128bcbe713446'),(244,1611517876,1,'BE',1,0,15,'tx_styleguide_inline_expandsingle_child','[]',0,'0400$3009d413fe0eb682c9843089af408e94:78e242c1aa093ff302c212f53ee83211'),(245,1611517876,1,'BE',1,0,5,'tx_styleguide_inline_expandsingle','[]',0,'0400$163f82d14e9325d3d3ce91686b757aca:7168f95416a06edb81855d5dfeb30430'),(246,1611517876,1,'BE',1,0,6,'sys_file_reference','[]',0,'0400$a6dd9a5612862668f59818f72733cfb7:768f9cd4e98812f969df7ebe17f11b50'),(247,1611517876,1,'BE',1,0,7,'sys_file_reference','[]',0,'0400$a6dd9a5612862668f59818f72733cfb7:117c97010b9af15cb554d115dba4e316'),(248,1611517876,1,'BE',1,0,8,'sys_file_reference','[]',0,'0400$a6dd9a5612862668f59818f72733cfb7:5ff44a4f59fb3bfbe13a2c3ed1d0bd8b'),(249,1611517876,1,'BE',1,0,9,'sys_file_reference','[]',0,'0400$fd44f76d5da476a81ce39b25588dd1bd:729356755eb8ee035abf6b9b02e20c8f'),(250,1611517876,1,'BE',1,0,10,'sys_file_reference','[]',0,'0400$fd44f76d5da476a81ce39b25588dd1bd:b34a074e38840d41041eaee66c42bb0d'),(251,1611517876,1,'BE',1,0,11,'sys_file_reference','[]',0,'0400$fd44f76d5da476a81ce39b25588dd1bd:b70904b959c6d327947fc437df028f6f'),(252,1611517876,1,'BE',1,0,12,'sys_file_reference','[]',0,'0400$fc555b4e2d5c884f3702eec53b3c0f70:fef2cecc4ff45c64d73fc27195ee5748'),(253,1611517876,1,'BE',1,0,13,'sys_file_reference','[]',0,'0400$fc555b4e2d5c884f3702eec53b3c0f70:5e1f4fea56ad8d21a419f2b59b059abf'),(254,1611517876,1,'BE',1,0,14,'sys_file_reference','[]',0,'0400$fc555b4e2d5c884f3702eec53b3c0f70:2207c2b650522ebf0efd90eaad3962af'),(255,1611517876,1,'BE',1,0,15,'sys_file_reference','[]',0,'0400$cb192f76812289b44a4461224dadec8c:53cbb769126fb106e07a09de5e196b60'),(256,1611517876,1,'BE',1,0,16,'sys_file_reference','[]',0,'0400$cb192f76812289b44a4461224dadec8c:5a9ade48273ee95d803333aed1c78820'),(257,1611517876,1,'BE',1,0,17,'sys_file_reference','[]',0,'0400$cb192f76812289b44a4461224dadec8c:78ba90db28917b77e8d54ca398316d0e'),(258,1611517876,1,'BE',1,0,18,'sys_file_reference','[]',0,'0400$35c682efd961555f944432c23c741ae9:c9d27ac33ea45c5163a9ef7a25d8e7c7'),(259,1611517876,1,'BE',1,0,19,'sys_file_reference','[]',0,'0400$35c682efd961555f944432c23c741ae9:7008e0248119dc3a255a0170bf6e9370'),(260,1611517876,1,'BE',1,0,20,'sys_file_reference','[]',0,'0400$35c682efd961555f944432c23c741ae9:97d0d1c7a42cd9603b2010379c1e4e4d'),(261,1611517876,1,'BE',1,0,21,'sys_file_reference','[]',0,'0400$a6ab64897e15564b7983cc0acd9ef3ab:bd8e6a36b477d61e04d92cfd10d00f96'),(262,1611517876,1,'BE',1,0,22,'sys_file_reference','[]',0,'0400$7c025f57d9745c41bead36a1d102bf6a:d6a5725e5b31cdd97b9c53c992e81850'),(263,1611517876,1,'BE',1,0,23,'sys_file_reference','[]',0,'0400$6e4fb8b527e4ed4f617aa406d19624f4:a4b81cbb471961a3c12b21861b94f4e1'),(264,1611517876,1,'BE',1,0,24,'sys_file_reference','[]',0,'0400$5c331d3a7214051ca9f5bb11c54e4449:ec378d8e96f494986de35c9be84dff5c'),(265,1611517876,1,'BE',1,0,25,'sys_file_reference','[]',0,'0400$d866cf08a3870bf951dcc663f06fe7f5:5ce305fb03b44e2e5ced3360656e263a'),(266,1611517876,1,'BE',1,0,26,'sys_file_reference','[]',0,'0400$96c9856e09a76d37a14193055eb6fdd6:2190384e72cbe31d01b0259338cca742'),(267,1611517876,1,'BE',1,0,27,'sys_file_reference','[]',0,'0400$f73a9b7f6939466cc9b7e3dcbb98cf74:dd318efa0f8b108e87c8725b284b77c4'),(268,1611517876,1,'BE',1,0,28,'sys_file_reference','[]',0,'0400$821c2bdf5300500a9167ab5b1083ac35:59425f1ffdef0b99239b8bcfbe5ba5e9'),(269,1611517876,1,'BE',1,0,29,'sys_file_reference','[]',0,'0400$519f388ecb5f55c1b8371d137ac0a61e:b242d4aecdf71ef1fd418f92b6b759e2'),(270,1611517876,1,'BE',1,0,30,'sys_file_reference','[]',0,'0400$4bc779b7ddca67b3c4f1176a9e66d05f:8567b700a7babdbf06fe14b610c41b11'),(271,1611517876,1,'BE',1,0,31,'sys_file_reference','[]',0,'0400$483a1bdad58c86c8696d3fe3f547eef7:a49807a2b4589c06cba1b54ee8ff5b0b'),(272,1611517876,1,'BE',1,0,32,'sys_file_reference','[]',0,'0400$b2cfd9648c615c25c97ebc0c1e3ec3c6:39d48e4eee405666728355d4f43660d5'),(273,1611517876,1,'BE',1,0,33,'sys_file_reference','[]',0,'0400$a4c2d496fcb99fbb33b13fe9b17c9859:d1a319dd1808a8a7d690531c136ea304'),(274,1611517876,1,'BE',1,0,34,'sys_file_reference','[]',0,'0400$a4c2d496fcb99fbb33b13fe9b17c9859:305d1fe50c2aa1143642eca6940718b4'),(275,1611517876,1,'BE',1,0,35,'sys_file_reference','[]',0,'0400$a4c2d496fcb99fbb33b13fe9b17c9859:64261f0ce2585a14a29aa5c2ee36ec50'),(276,1611517876,1,'BE',1,0,2,'tx_styleguide_inline_fal','[]',0,'0400$37b4cffb82abfab7538f8bbc5954d2d5:839e975fe72d3d350be3369289e35602'),(277,1611517876,1,'BE',1,0,36,'sys_file_reference','[]',0,'0400$4edef802ab7d4617cbd707a283be0e9a:bbbca4ca3aa54248c26ce1e6a7ce7d5d'),(278,1611517876,1,'BE',1,0,37,'sys_file_reference','[]',0,'0400$22a18802c8b6ccde13f0359e472a457a:e1ca626f78bf3a5c2eeb7d40b085ddff'),(279,1611517876,1,'BE',1,0,38,'sys_file_reference','[]',0,'0400$d623fad6f20c884a318ba5909eb36d93:c5d124145c563e90db4b312b017e10a7'),(280,1611517876,1,'BE',1,0,39,'sys_file_reference','[]',0,'0400$beba65293e46e29a36fad3253cda901c:e4ab59ae42d0e2e224b589caed52ad80'),(281,1611517876,1,'BE',1,0,40,'sys_file_reference','[]',0,'0400$2f91364243fb30738f172fa0ea106bd9:2366ea13aeaa959ba384cfd90a0ef3e8'),(282,1611517876,1,'BE',1,0,41,'sys_file_reference','[]',0,'0400$869635cbf5f9aa4d11723abbd9859487:19c8584dd5bba095e1e9e14d48d2bbbf'),(283,1611517876,1,'BE',1,0,42,'sys_file_reference','[]',0,'0400$bf64829154f84cc6da7f19a183a83f11:7a5b44578f910fd982a3ce6fc61d2bbf'),(284,1611517876,1,'BE',1,0,43,'sys_file_reference','[]',0,'0400$c29c73ec7dcfafb30cf1d61b32459ec1:17ca0a6178d323f36fa88baa7aec74b7'),(285,1611517876,1,'BE',1,0,44,'sys_file_reference','[]',0,'0400$5cbc95120200e511508a919e52da0911:07aa68050ff2833e036a1fa71d7a273e'),(286,1611517876,1,'BE',1,0,45,'sys_file_reference','[]',0,'0400$c4c9e802273435ee14c8acc00c1939f9:f59c54abe9804a9ad756ea862d4d98dd'),(287,1611517876,1,'BE',1,0,46,'sys_file_reference','[]',0,'0400$7b63407cb1277f6be71ee3ca860ce67e:a82fe300f8818691e26d3b3c2d4b5fa0'),(288,1611517876,1,'BE',1,0,47,'sys_file_reference','[]',0,'0400$c5625dbb51da726b37807b68daf68d2d:fc1fba2d9912fd8b6cce486c76462505'),(289,1611517876,1,'BE',1,0,48,'sys_file_reference','[]',0,'0400$6ac7b6214178192e1c57ccdc588b57d0:9e3219b05be463b314874a1adbcf2b5e'),(290,1611517876,1,'BE',1,0,49,'sys_file_reference','[]',0,'0400$6ac7b6214178192e1c57ccdc588b57d0:0e8c433b34c1fd4f4ae9a061ccb09721'),(291,1611517876,1,'BE',1,0,50,'sys_file_reference','[]',0,'0400$6ac7b6214178192e1c57ccdc588b57d0:902264ba03b37b98e3054fe6e0ac78de'),(292,1611517876,1,'BE',1,0,3,'tx_styleguide_inline_fal','[]',0,'0400$0961fc6c5af784523f1c958b2bc0ec18:e7947cb1322b8a51f3928c1e1e838f88'),(293,1611517876,1,'BE',1,0,51,'sys_file_reference','[]',0,'0400$5f511540395dd689032ca86788ca5ebb:f45cb0133a0b84bf3af8df74daaaec05'),(294,1611517876,1,'BE',1,0,52,'sys_file_reference','[]',0,'0400$2275c07ea09144144f7d082cf32fbb09:d159988b9372d0a1b4337d072afdace0'),(295,1611517876,1,'BE',1,0,53,'sys_file_reference','[]',0,'0400$e608f7b96df0a60626b5f0a6f835a8f4:ebbc291abfc3937486693c03bcb03e97'),(296,1611517876,1,'BE',1,0,54,'sys_file_reference','[]',0,'0400$c3f7763f9f9a749e12876b74d965e681:6cbf46653537b279a7362dfb1585e148'),(297,1611517876,1,'BE',1,0,55,'sys_file_reference','[]',0,'0400$7089cfc3eec1ee63e93cd43668652513:792f91d3d47d9478abdc612d70aafb47'),(298,1611517876,1,'BE',1,0,56,'sys_file_reference','[]',0,'0400$588ae431bb920c3fba10f619fb6a7283:25a91a2b727d25ff655e9b255cacc0a0'),(299,1611517876,1,'BE',1,0,57,'sys_file_reference','[]',0,'0400$6b85e3405f43f25fd5c5e6a0ff8294c9:cbc528397be67f09cf3fd652610a606e'),(300,1611517876,1,'BE',1,0,58,'sys_file_reference','[]',0,'0400$17c46bd276b244e7be8d9c436c7627c7:bb22e0e215a54488b349328455f1385e'),(301,1611517876,1,'BE',1,0,59,'sys_file_reference','[]',0,'0400$443b54b5b480a8e92a631a2ba47c9801:45ed3098102d64c6d020129c0d74f1b5'),(302,1611517876,1,'BE',1,0,60,'sys_file_reference','[]',0,'0400$31ee527e3c4a650f4aca1bdebf424d31:009c0aa309d94e8b6cd8a661c2bdf35f'),(303,1611517876,1,'BE',1,0,61,'sys_file_reference','[]',0,'0400$0609312b1228d4df3fb11e8321ff8252:892c666d0dc845555874708c8b3075b4'),(304,1611517876,1,'BE',1,0,62,'sys_file_reference','[]',0,'0400$ddc25939fdec460ab1fc1e81171d3d67:06d44e200d0c062584ecd38948bb9556'),(305,1611517876,1,'BE',1,0,63,'sys_file_reference','[]',0,'0400$464a4ecc857bebc1ec2a027f49a8ec3b:a216f874e153c39e8adbba873e471bde'),(306,1611517876,1,'BE',1,0,64,'sys_file_reference','[]',0,'0400$464a4ecc857bebc1ec2a027f49a8ec3b:675d236edc59cd312aa6d04a80e9d963'),(307,1611517876,1,'BE',1,0,65,'sys_file_reference','[]',0,'0400$464a4ecc857bebc1ec2a027f49a8ec3b:326fb0dfba474427f518b89715893e7c'),(308,1611517876,1,'BE',1,0,4,'tx_styleguide_inline_fal','[]',0,'0400$3487959c621610bb1da9d0b17bd8fd02:ee645f1b916aba1d267706afd565e170'),(309,1611517876,1,'BE',1,0,66,'sys_file_reference','[]',0,'0400$ce9a235f511e04f2c9ec332a1a635c51:2b0fe35076e1e391a3e83c3b7162c7ec'),(310,1611517876,1,'BE',1,0,67,'sys_file_reference','[]',0,'0400$4c17ff65d913186a7bd5548e3f41c7b8:cd6a7a4fd90f1a69d96806ed95e5862b'),(311,1611517876,1,'BE',1,0,68,'sys_file_reference','[]',0,'0400$bd55a3d372d3bbf2fb00dbc784330b01:e1c29c3442b72ac11d7be05b311e2d90'),(312,1611517876,1,'BE',1,0,69,'sys_file_reference','[]',0,'0400$a8d2b63b7c3d7540c656ce6c07fbf4fc:1d5472c35d0341e8fa474416da8a6516'),(313,1611517876,1,'BE',1,0,70,'sys_file_reference','[]',0,'0400$88183b8404e743e9c2495d3e4ec8b383:b624a292c9b8bdb945b57299947c88e8'),(314,1611517876,1,'BE',1,0,71,'sys_file_reference','[]',0,'0400$f9fe7ef5046bdc065aef5cdd87db3194:bbe9507439cde1895c08825b7c0d125f'),(315,1611517876,1,'BE',1,0,72,'sys_file_reference','[]',0,'0400$cd2a1ceab1a29d6e8e8d7de1e4ccff41:72916afc1503411a274755375b89ed1e'),(316,1611517876,1,'BE',1,0,73,'sys_file_reference','[]',0,'0400$bae6fcc486485339666c34842a848695:22e7efa6daf6922717c368001e8afd1f'),(317,1611517876,1,'BE',1,0,74,'sys_file_reference','[]',0,'0400$ac903f2dc882c607f75d40542fe1593a:d72f0b89473fbcf40fea534cdaa2a23d'),(318,1611517876,1,'BE',1,0,75,'sys_file_reference','[]',0,'0400$ebb25ced478b43aaef51920c39b981e9:67945e308fedb27ce08b6b7b20fd6a23'),(319,1611517876,1,'BE',1,0,76,'sys_file_reference','[]',0,'0400$5345e8298adfdbc26cd63980336d4e6f:004052c30e21cf03cae346e71fd367c4'),(320,1611517876,1,'BE',1,0,77,'sys_file_reference','[]',0,'0400$92b49478da7b60f4aef0bf1c14184b04:02b74e6b95367882a33fadfeb1172142'),(321,1611517876,1,'BE',1,0,78,'sys_file_reference','[]',0,'0400$4a99a9fc2ff16e9463f507cd8a082b41:9d93ff564ed492db98c5583488b7e071'),(322,1611517876,1,'BE',1,0,79,'sys_file_reference','[]',0,'0400$4a99a9fc2ff16e9463f507cd8a082b41:14e496ba89b95472541e154c0c18d0be'),(323,1611517876,1,'BE',1,0,80,'sys_file_reference','[]',0,'0400$4a99a9fc2ff16e9463f507cd8a082b41:e23e8d987976b2e50ad79be3e273d1e7'),(324,1611517876,1,'BE',1,0,5,'tx_styleguide_inline_fal','[]',0,'0400$8e6e827337d7c258d1d22f7c7aaed8f4:a1619a319ac8108a0d8298076c6161df'),(325,1611517876,1,'BE',1,0,2,'tx_styleguide_inline_foreignrecorddefaults_child','[]',0,'0400$f74a9983cef93d69079ed702e5d2719e:9db9d961c8bdb5b8984c6a534706cd3d'),(326,1611517876,1,'BE',1,0,2,'tx_styleguide_inline_foreignrecorddefaults','[]',0,'0400$c6044f4bf1af0dcf4aea54d4a7c958ed:8beb0c3e73cd06ab9bc9d4bcbf454354'),(327,1611517876,1,'BE',1,0,3,'tx_styleguide_inline_foreignrecorddefaults_child','[]',0,'0400$11d78b2327893860936808d3f54cb887:d86f2c43bfeceee9b5212f87eef68735'),(328,1611517876,1,'BE',1,0,3,'tx_styleguide_inline_foreignrecorddefaults','[]',0,'0400$6edf605539138d5e39bda6da3f3fd522:fce174a2d95e299921bf2724ecf0cc57'),(329,1611517876,1,'BE',1,0,4,'tx_styleguide_inline_foreignrecorddefaults_child','[]',0,'0400$dc9d846e6eed69c0eaad98545fd91194:3af11efdd44b94af184efd80105106f0'),(330,1611517876,1,'BE',1,0,4,'tx_styleguide_inline_foreignrecorddefaults','[]',0,'0400$854a599df2dd42ce227c6469fc0651c6:06616a123ef584f660528521a9b60405'),(331,1611517876,1,'BE',1,0,5,'tx_styleguide_inline_foreignrecorddefaults_child','[]',0,'0400$a1ba0941461f4e7d4791655ab4bfa24a:ac465bd295c84b4e782f23738f8888fe'),(332,1611517876,1,'BE',1,0,5,'tx_styleguide_inline_foreignrecorddefaults','[]',0,'0400$b9aaa1b95636710b34fa84fa3c8bfa9c:21abfc1073583084a7945b8010a48f91'),(333,1611517876,1,'BE',1,0,2,'tx_styleguide_inline_mm','[]',0,'0400$56a478a78857f14ce9c74e8c1cc0b4c6:f868f9f02b06001e8d04205654833708'),(334,1611517876,1,'BE',1,0,3,'tx_styleguide_inline_mm','[]',0,'0400$58d84f745da9399cdfae52286e075819:6f1b5b633c0144cc8403b6ae0a547f4f'),(335,1611517876,1,'BE',1,0,4,'tx_styleguide_inline_mm','[]',0,'0400$4447c14fdebf75983bbbcbf47b9a6958:bab964e927f0401a7949c6e66b80183d'),(336,1611517876,1,'BE',1,0,5,'tx_styleguide_inline_mm','[]',0,'0400$c4e045161acbfaced15218019bd053aa:2afa218af9bf9060eaa5e0f30773c924'),(337,1611517876,1,'BE',1,0,2,'tx_styleguide_inline_mn','[]',0,'0400$1bd7f34f3df8cbb1bb5c8c0fd6d12fb0:85119761db25606f7be4acad20a1f4fc'),(338,1611517876,1,'BE',1,0,3,'tx_styleguide_inline_mn','[]',0,'0400$ab1188be5a4a2f179a8a45da7ba787e6:52315db09f70e0ec3d174ba5ef630124'),(339,1611517876,1,'BE',1,0,4,'tx_styleguide_inline_mn','[]',0,'0400$c2ebdecf5a7f1e081e46da15f30f5804:1388f71d742689bbb34f16c8dd0ce95c'),(340,1611517876,1,'BE',1,0,5,'tx_styleguide_inline_mn','[]',0,'0400$7efcffcce7c0841f9ed5cb6e113ec8f6:df5f3b7a474a1a9532af55e4f926c9b6'),(341,1611517876,1,'BE',1,0,2,'tx_styleguide_inline_mngroup','[]',0,'0400$260a016a80ed5c5b6588e2bcf24e1eb9:540ce16ad14a8188a89f013eb6d9405c'),(342,1611517876,1,'BE',1,0,3,'tx_styleguide_inline_mngroup','[]',0,'0400$a0229cff9463201617c1cdf13d8a3403:b0146a480c49a1125b9a1538c72eca8b'),(343,1611517876,1,'BE',1,0,4,'tx_styleguide_inline_mngroup','[]',0,'0400$3682e8f56dcfd793c6a81ca1029dad14:f3fbc1096ae0f4a2a28e9cd3772b0c0b'),(344,1611517876,1,'BE',1,0,5,'tx_styleguide_inline_mngroup','[]',0,'0400$fd3e85039a9a20a100d1f30d79ba40af:b8171bc2de46353957e2f7741c668a8e'),(345,1611517876,1,'BE',1,0,2,'tx_styleguide_inline_mnsymmetric','[]',0,'0400$7861079eab1922fa95e6defb9485fadf:57c321f9e3204833dbf109f172ce254c'),(346,1611517876,1,'BE',1,0,3,'tx_styleguide_inline_mnsymmetric','[]',0,'0400$676fe903c4a17a29a70777418b3aed97:52f1fa610671b14e8596274d20d3dc72'),(347,1611517876,1,'BE',1,0,4,'tx_styleguide_inline_mnsymmetric','[]',0,'0400$0a5781aa5d23fb0551430c82a274fb59:b1cea4bfd2746f62d19020db4060d4a7'),(348,1611517876,1,'BE',1,0,5,'tx_styleguide_inline_mnsymmetric','[]',0,'0400$f2e2d56e280a5f3ca3c7e6a51b578cf5:8e20063924a5a002f09ea96bd7234d8b'),(349,1611517876,1,'BE',1,0,7,'tx_styleguide_inline_mnsymmetric','[]',0,'0400$d65ea247625c3a49f3e9dd19e6a280ca:0e59990bde5c9bf3a48db2fd0b1cac69'),(350,1611517876,1,'BE',1,0,8,'tx_styleguide_inline_mnsymmetric','[]',0,'0400$509185c290444862ee976d41e1108d2a:c9ec28c73a463013db8e278ff03ef334'),(351,1611517876,1,'BE',1,0,9,'tx_styleguide_inline_mnsymmetric','[]',0,'0400$c20f869fa4bd015d3ed51371c8ae4c67:2bb8ef58607c3947e7b0d6f4e1ba022a'),(352,1611517876,1,'BE',1,0,10,'tx_styleguide_inline_mnsymmetric','[]',0,'0400$4121eacad055003cae0bed78330a6233:7fb6a7fc21953e731be97e401d33ba0f'),(353,1611517876,1,'BE',1,0,12,'tx_styleguide_inline_mnsymmetric','[]',0,'0400$0a176f6d7569f2c534fdca175e6bcb6d:2a9749e22fba1c226776f21befc9a938'),(354,1611517876,1,'BE',1,0,13,'tx_styleguide_inline_mnsymmetric','[]',0,'0400$8783b6a638204e47229333ac2197e9b1:dc4b8c159a96508774c916bd13b4ac8d'),(355,1611517876,1,'BE',1,0,14,'tx_styleguide_inline_mnsymmetric','[]',0,'0400$3598d6e1ba72c49d139a714c41acfb0c:efd4e0d01c24fc7dc45e495012c68b60'),(356,1611517876,1,'BE',1,0,15,'tx_styleguide_inline_mnsymmetric','[]',0,'0400$6369777108082161eecd0b7ac0b61660:a0915cb2928c16fd2c79fd5ad339785b'),(357,1611517876,1,'BE',1,0,17,'tx_styleguide_inline_mnsymmetric','[]',0,'0400$319b48e1071033fed592eae6c1e521a4:0aaf1105df1848cc6f6b5766555ddc55'),(358,1611517876,1,'BE',1,0,18,'tx_styleguide_inline_mnsymmetric','[]',0,'0400$5a0a43f97da3536c8842e756565c8f3d:73137e91f26996f25330fdfa192c2ec5'),(359,1611517876,1,'BE',1,0,19,'tx_styleguide_inline_mnsymmetric','[]',0,'0400$8c80d144fed36431e005763eb1a570fd:1b1bdd06db91fda48b73fe041c37ea36'),(360,1611517876,1,'BE',1,0,20,'tx_styleguide_inline_mnsymmetric','[]',0,'0400$f4cb97af1a2b78c87559344376545e43:50826cfbbbc806079f0f49a3cbca7c2e'),(361,1611517876,1,'BE',1,0,81,'sys_file_reference','[]',0,'0400$7274cbbc1562213dcc6fb30cd7a8a2f8:b2e5f3610eb0d47813eaa1957bf8bbcf'),(362,1611517876,1,'BE',1,0,82,'sys_file_reference','[]',0,'0400$7274cbbc1562213dcc6fb30cd7a8a2f8:384ff8df51f3f177798bc16720d9a247'),(363,1611517876,1,'BE',1,0,83,'sys_file_reference','[]',0,'0400$7274cbbc1562213dcc6fb30cd7a8a2f8:db9e27ff6f57406f4e34874d73b466d3'),(364,1611517876,1,'BE',1,0,84,'sys_file_reference','[]',0,'0400$ae07102be8d9cd6e709f1412c61ba1f7:47830aad4cb2d6db721cba3ed5fcc196'),(365,1611517876,1,'BE',1,0,85,'sys_file_reference','[]',0,'0400$76a17d7babeeef39f4e7d0dc89d9d3b1:4ebef965545c026af29dfe936a64f486'),(366,1611517876,1,'BE',1,0,86,'sys_file_reference','[]',0,'0400$5262a2a5467d809f76f6daf57c1b8294:ec102e3114d35e673a307670579a5255'),(367,1611517876,1,'BE',1,0,2,'tx_styleguide_inline_parentnosoftdelete','[]',0,'0400$79a52c814ccaba20757afb912e92214c:14c0a9432d7d9713911f92c59e27413d'),(368,1611517876,1,'BE',1,0,87,'sys_file_reference','[]',0,'0400$d435360eae6dcec11116fbd946119d73:5033fce715021ffc033a5ed11ce59537'),(369,1611517876,1,'BE',1,0,88,'sys_file_reference','[]',0,'0400$0e3f5ec26799e0973392851f8363ec6e:9564f369d3ea54f37ff238ec34af0fb7'),(370,1611517876,1,'BE',1,0,89,'sys_file_reference','[]',0,'0400$4f6eb5b4052b4bc23f91c529761f879f:3b8811a4fef22c3527c3ff6d073b9db3'),(371,1611517876,1,'BE',1,0,3,'tx_styleguide_inline_parentnosoftdelete','[]',0,'0400$9a67f806b7fbdf6ef29fe69d29cf0f9d:8f2cebae6460c6fafa168a89542b7291'),(372,1611517876,1,'BE',1,0,90,'sys_file_reference','[]',0,'0400$5e90abf24c1ef5df49e3d5951126de7c:53de7f29d4caf8ca05c2b0df463494ce'),(373,1611517876,1,'BE',1,0,91,'sys_file_reference','[]',0,'0400$870676e446d8b62a97c25ac81c8e7a00:96a92f8302817c6690a6adb2c432e50e'),(374,1611517876,1,'BE',1,0,92,'sys_file_reference','[]',0,'0400$865dc7bb43893ef34e94493456780f38:b416ad2af38c8c80dc23c11112d4fb74'),(375,1611517876,1,'BE',1,0,4,'tx_styleguide_inline_parentnosoftdelete','[]',0,'0400$4700f6ac24e038bdbcfab2f683268b33:a7a0b40d645460aa3efc86a64eb08104'),(376,1611517876,1,'BE',1,0,93,'sys_file_reference','[]',0,'0400$b3b3cf23a8d71cc4ac955df835156aed:187d613fd0e32f9c81c9075355837163'),(377,1611517876,1,'BE',1,0,94,'sys_file_reference','[]',0,'0400$6b2425023e14b5feeb0e34a98127aba3:b77d507a5971dc14ec6fd2958acf7fb5'),(378,1611517876,1,'BE',1,0,95,'sys_file_reference','[]',0,'0400$52375130f679a770c90a029d30b97cf2:d131d3be6b46b53eed0cc467c9781ee2'),(379,1611517876,1,'BE',1,0,5,'tx_styleguide_inline_parentnosoftdelete','[]',0,'0400$32c2cd9b19723a1e46c4fa876b051463:a2e7366852837b49c582dade7d72ebe9'),(380,1611517876,1,'BE',1,0,3,'tx_styleguide_inline_usecombination_mm','[]',0,'0400$ae51c3c07c427c0b3de614c5a17b6cad:f7d3a2cb7a7d09fd09d80407258d81b0'),(381,1611517876,1,'BE',1,0,4,'tx_styleguide_inline_usecombination_mm','[]',0,'0400$ff894277a40456412640259d66fa27cc:c5454e2ea26d6b9236ef6be2661844f9'),(382,1611517876,1,'BE',1,0,2,'tx_styleguide_inline_usecombination','[]',0,'0400$884998c596c8858bc97f7b53eb69d3e5:dc40c00485a1a6e0accf21092214bd3b'),(383,1611517876,1,'BE',1,0,5,'tx_styleguide_inline_usecombination_mm','[]',0,'0400$bedc33ed43e832bccf053ef60e290ec3:7d59535d5b6e4a1ec9ec207071c1ad7c'),(384,1611517876,1,'BE',1,0,6,'tx_styleguide_inline_usecombination_mm','[]',0,'0400$3dbae3b1f3bb3d3d9732a1ec707a1093:bae3a3fefcb1882abad9a9b456ee3772'),(385,1611517876,1,'BE',1,0,3,'tx_styleguide_inline_usecombination','[]',0,'0400$b96137fd2bf1609442f3599bf211bc8b:76c1c1732e70ec3fc4999bab77ab9937'),(386,1611517876,1,'BE',1,0,7,'tx_styleguide_inline_usecombination_mm','[]',0,'0400$43cdc0e446749f83e2720a63dccef128:ada556bdf2796e3c628deeb98a1506c0'),(387,1611517876,1,'BE',1,0,8,'tx_styleguide_inline_usecombination_mm','[]',0,'0400$a0bb735af1af916df773a898887dbdf8:b82fd24931a8bfd43a6947b8328daf7b'),(388,1611517876,1,'BE',1,0,4,'tx_styleguide_inline_usecombination','[]',0,'0400$d54cc3e315c1b79d553ce2751751904d:a6c1e00495aba28628799692cca2fe95'),(389,1611517876,1,'BE',1,0,9,'tx_styleguide_inline_usecombination_mm','[]',0,'0400$a8be5a4939400dbddbcb08bff58b98ba:24ff6f3fde337e59354b5bce680edbae'),(390,1611517876,1,'BE',1,0,10,'tx_styleguide_inline_usecombination_mm','[]',0,'0400$a29c89c5324e0ee7c2075312401c6556:856724618d0d6c1a227668ccaba4634f'),(391,1611517876,1,'BE',1,0,5,'tx_styleguide_inline_usecombination','[]',0,'0400$1260c534e5c42dfa58029578b808872b:b8d22452f67394e8e624851fa5c8a23d'),(392,1611517876,1,'BE',1,0,3,'tx_styleguide_inline_usecombinationbox_mm','[]',0,'0400$edbffa4d7adcf4d36a8084b5a2ca9c38:ba264d4f2a9b010ff533f9a3512b50b1'),(393,1611517876,1,'BE',1,0,4,'tx_styleguide_inline_usecombinationbox_mm','[]',0,'0400$21fb0510e4230c9d1cac8cb9c7755c7a:cfabf70e13b25ab5d62266f9aa67359c'),(394,1611517876,1,'BE',1,0,2,'tx_styleguide_inline_usecombinationbox','[]',0,'0400$d55b4e5fc366a4b0a8356cbb57547499:fc796151cec531e51443ff772b8eead7'),(395,1611517876,1,'BE',1,0,5,'tx_styleguide_inline_usecombinationbox_mm','[]',0,'0400$9a48dd2b417635a1c89d3d247fad855d:87e55c4fe9d89cd63c2d3269372ea893'),(396,1611517876,1,'BE',1,0,6,'tx_styleguide_inline_usecombinationbox_mm','[]',0,'0400$a6a59111ed4f1d4a7de6dd7f6050e186:d529096b4ce33b0c9dbde6ab107a1abd'),(397,1611517876,1,'BE',1,0,3,'tx_styleguide_inline_usecombinationbox','[]',0,'0400$d8ea4ad2f279e7b1ed6b33c06ab590f2:49afd2e9a734e15f11ae79dcaffaa9ec'),(398,1611517876,1,'BE',1,0,7,'tx_styleguide_inline_usecombinationbox_mm','[]',0,'0400$3a2a8c49abded03a81fd66634bafd14b:749f919ac7f70b18fff264fb357c9c8c'),(399,1611517876,1,'BE',1,0,8,'tx_styleguide_inline_usecombinationbox_mm','[]',0,'0400$ae4425751c3258f42c0425286b57b425:fc107851e655a11f690b31c7820a70a3'),(400,1611517876,1,'BE',1,0,4,'tx_styleguide_inline_usecombinationbox','[]',0,'0400$4da74cd761b8f73564ee6215df641fab:d103c78ae8b80c4bcac4ffcbfa60a90f'),(401,1611517876,1,'BE',1,0,9,'tx_styleguide_inline_usecombinationbox_mm','[]',0,'0400$486412145f2fce12205ac1b55a3c1a74:eb90632ca2f0d9c12be9277ab1a924fd'),(402,1611517876,1,'BE',1,0,10,'tx_styleguide_inline_usecombinationbox_mm','[]',0,'0400$3c415c3a7e8e2da8af1a8555597d1663:654b268cf3746b8e317bde5cb14e45c7'),(403,1611517876,1,'BE',1,0,5,'tx_styleguide_inline_usecombinationbox','[]',0,'0400$40a394fc76419451e58c322af2300bdb:c3a2e77d2c0dd5cad76e504c365887c3'),(404,1611517876,1,'BE',1,0,2,'tx_styleguide_palette','[]',0,'0400$fd4e3659693b4ad2c793fc0649e653b2:33977b5c04daf7c800da4a23883a573c'),(405,1611517876,1,'BE',1,0,3,'tx_styleguide_palette','[]',0,'0400$c67a70a03f41eebb3c1b5315a42f8dac:d15f51df293683240b19c00860b92310'),(406,1611517876,1,'BE',1,0,4,'tx_styleguide_palette','[]',0,'0400$e72495e6d6d689379893a4c30740d664:41710b6b57a6995485c8f2c4f7ea2042'),(407,1611517876,1,'BE',1,0,5,'tx_styleguide_palette','[]',0,'0400$8ea056c1012fea1d328e3077631a14d4:ec6cf337f680de3a7eefaefc9bd2de0b'),(408,1611517876,1,'BE',1,0,2,'tx_styleguide_required_rte_2_child','[]',0,'0400$e9fda082b920706eddf756774140afc2:1e7c21961db8df3d8f99d27de569d1f3'),(409,1611517876,1,'BE',1,0,2,'tx_styleguide_required_inline_1_child','[]',0,'0400$bf2c03e44f59e74770b1db141d5b02af:32058712ca60b63ed4de06e93c92af8a'),(410,1611517876,1,'BE',1,0,2,'tx_styleguide_required_inline_2_child','[]',0,'0400$ac2fc655208529f45e470b4d609feab4:aeabec3e3eabfd5acacb7569854ec442'),(411,1611517876,1,'BE',1,0,2,'tx_styleguide_required_inline_3_child','[]',0,'0400$727cdf3c093fa4d5703532449b1cacf9:77d9458913cf2bcfa6df5e93ad48d786'),(412,1611517876,1,'BE',1,0,2,'tx_styleguide_required_flex_2_inline_1_child','[]',0,'0400$d5a1c30abb3500627963ae239bd8a652:db6c2b6ffbb55f22ee9fbf36d84f63e7'),(413,1611517876,1,'BE',1,0,2,'tx_styleguide_required','[]',0,'0400$4f17afff5eef8295cdaf008d7f689d5e:cee82000e7a815bf076193d9f1dc552c'),(414,1611517876,1,'BE',1,0,3,'tx_styleguide_required_rte_2_child','[]',0,'0400$1f110f2c47172ccf1bf62e4f638f5e30:2b588ce33b75844a7c48e7e274fe8f87'),(415,1611517876,1,'BE',1,0,3,'tx_styleguide_required_inline_1_child','[]',0,'0400$7f7b77c46c274b86d828d93ef1c4ed6b:49a9cb2768884d45f4d3069a7b997019'),(416,1611517876,1,'BE',1,0,3,'tx_styleguide_required_inline_2_child','[]',0,'0400$d034ede2d61e6fbc0f4ecf99a4445023:54fd9b6e195fdf1b12f42d24b89382d7'),(417,1611517876,1,'BE',1,0,3,'tx_styleguide_required_inline_3_child','[]',0,'0400$3b7f87aae9977c6e9769abb15071f6ae:942e91d10455479468f3a65f6a4ab345'),(418,1611517876,1,'BE',1,0,3,'tx_styleguide_required_flex_2_inline_1_child','[]',0,'0400$6bf89ac898af1728ea1769cdefe8b212:6675180d7ae8ec4858659bc358a0aac9'),(419,1611517876,1,'BE',1,0,3,'tx_styleguide_required','[]',0,'0400$864a1b4d9774b1a790f2f6f0c4856ee1:74ca34e5d93d090ee508820775a7d8b1'),(420,1611517876,1,'BE',1,0,4,'tx_styleguide_required_rte_2_child','[]',0,'0400$2bf960efcdb9411585f6571a31e5ed71:c57c9accb05bce2bcb6d9e15708bb881'),(421,1611517876,1,'BE',1,0,4,'tx_styleguide_required_inline_1_child','[]',0,'0400$5c68060819a8916f28c7a053ae799446:9f2f66a43a8cde7f0371235ac38f3f8f'),(422,1611517876,1,'BE',1,0,4,'tx_styleguide_required_inline_2_child','[]',0,'0400$5d18648b2ac98e6d05ee09b1db6f11fc:90cbd87f451cd45a53429558ce751e3b'),(423,1611517876,1,'BE',1,0,4,'tx_styleguide_required_inline_3_child','[]',0,'0400$ecae579c2bf7cea55d95b3cebaf64200:5c228cadf77dbf4af28933607752422b'),(424,1611517876,1,'BE',1,0,4,'tx_styleguide_required_flex_2_inline_1_child','[]',0,'0400$d521d6fef13ab597b665a3310d5c33ec:546b7eb340b427bed717eb296d61b654'),(425,1611517876,1,'BE',1,0,4,'tx_styleguide_required','[]',0,'0400$5731ada6dd36aed0eafc92598b41e1be:3057de7ee4d376c532ffe283306febf5'),(426,1611517876,1,'BE',1,0,5,'tx_styleguide_required_rte_2_child','[]',0,'0400$1cada51f4a8bb7cb1d75e25b28508ab1:2d1b29eac06b5bffee7e2ab2d04b12a9'),(427,1611517876,1,'BE',1,0,5,'tx_styleguide_required_inline_1_child','[]',0,'0400$3beb2e6ff37474591e5b40ec243f7c98:dfcb9928658b49b32567c744d5b80ff1'),(428,1611517876,1,'BE',1,0,5,'tx_styleguide_required_inline_2_child','[]',0,'0400$5e8d30497db75a86c1dbb99f4f863526:7a19f6eb63852b1b2a2f2f6201b4f4f0'),(429,1611517876,1,'BE',1,0,5,'tx_styleguide_required_inline_3_child','[]',0,'0400$33f6e8ac356137d3d236bd605eca670a:d8298ee402c47eec90ebb776dfaee105'),(430,1611517876,1,'BE',1,0,5,'tx_styleguide_required_flex_2_inline_1_child','[]',0,'0400$fdbf24b55476ef1238c89d2ce144c0f5:bf732faca0ffff79c3e5008bed2e38b5'),(431,1611517876,1,'BE',1,0,5,'tx_styleguide_required','[]',0,'0400$39d42abcc7a3f38e5f93a7d833b3978b:4abd84376b2c2390ac41e3e8e887f5a5'),(432,1611517876,1,'BE',1,0,2,'tx_styleguide_type','[]',0,'0400$d8b2c18df9eae49b8eb563644fec03d5:f72b9155842d75b6ef1941c4efca19c8'),(433,1611517876,1,'BE',1,0,3,'tx_styleguide_type','[]',0,'0400$a99e753c209496026e3ce5d250371fdd:44bcfff3cd948fb9f6482f7ae4044858'),(434,1611517876,1,'BE',1,0,4,'tx_styleguide_type','[]',0,'0400$bf3d1a037c19216c689517ad7d6588fc:7f73cdea990b30a5bee12648c39f7041'),(435,1611517876,1,'BE',1,0,5,'tx_styleguide_type','[]',0,'0400$bf1a397c07234f33fcdacde4cf7ce836:065900ac3ca02937e098fb360a9d3ac2'),(436,1611517876,1,'BE',1,0,2,'tx_styleguide_valuesdefault','[]',0,'0400$f5f68285ce01f5b1722f17773390ee80:34d3a1afbce8dd43a8c64a4bfe0c5068'),(437,1611517876,1,'BE',1,0,3,'tx_styleguide_valuesdefault','[]',0,'0400$8c246be7521efd80f838940c7aad9b0a:ed74f1e21c06287302c55cb27b4d862c'),(438,1611517876,1,'BE',1,0,4,'tx_styleguide_valuesdefault','[]',0,'0400$79ec393e393143cfb2ed271efd391991:cde8cdb3add67796b3f8e45bc361cc05'),(439,1611517876,1,'BE',1,0,5,'tx_styleguide_valuesdefault','[]',0,'0400$10cc5266afc6d2b878ea8efecf7ebd05:748cec184e8f81b9cb916e60ef791d6b');
/*!40000 ALTER TABLE `sys_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_language`
--

DROP TABLE IF EXISTS `sys_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_language` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `title` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `flag` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `language_isocode` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tx_styleguide_isdemorecord` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`hidden`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_language`
--

LOCK TABLES `sys_language` WRITE;
/*!40000 ALTER TABLE `sys_language` DISABLE KEYS */;
INSERT INTO `sys_language` VALUES (1,0,0,0,0,'styleguide demo language danish','dk','da',1),(2,0,0,0,0,'styleguide demo language german','de','de',1),(3,0,0,0,0,'styleguide demo language french','fr','fr',1),(4,0,0,0,0,'styleguide demo language spanish','es','es',1);
/*!40000 ALTER TABLE `sys_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_lockedrecords`
--

DROP TABLE IF EXISTS `sys_lockedrecords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_lockedrecords` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `record_table` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `record_uid` int(11) NOT NULL DEFAULT 0,
  `record_pid` int(11) NOT NULL DEFAULT 0,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `feuserid` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `event` (`userid`,`tstamp`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_lockedrecords`
--

LOCK TABLES `sys_lockedrecords` WRITE;
/*!40000 ALTER TABLE `sys_lockedrecords` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_lockedrecords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_log`
--

DROP TABLE IF EXISTS `sys_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_log` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `userid` int(10) unsigned NOT NULL DEFAULT 0,
  `action` smallint(5) unsigned NOT NULL DEFAULT 0,
  `recuid` int(10) unsigned NOT NULL DEFAULT 0,
  `tablename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `recpid` int(11) NOT NULL DEFAULT 0,
  `error` smallint(5) unsigned NOT NULL DEFAULT 0,
  `details` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` smallint(5) unsigned NOT NULL DEFAULT 0,
  `details_nr` smallint(6) NOT NULL DEFAULT 0,
  `IP` varchar(39) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `log_data` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `event_pid` int(11) NOT NULL DEFAULT -1,
  `workspace` int(11) NOT NULL DEFAULT 0,
  `NEWid` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `request_id` varchar(13) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `time_micro` double NOT NULL DEFAULT 0,
  `component` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `level` smallint(5) unsigned NOT NULL DEFAULT 0,
  `message` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `event` (`userid`,`event_pid`),
  KEY `recuidIdx` (`recuid`),
  KEY `user_auth` (`type`,`action`,`tstamp`),
  KEY `request` (`request_id`),
  KEY `combined_1` (`tstamp`,`type`,`userid`),
  KEY `errorcount` (`tstamp`,`error`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log`
--

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
INSERT INTO `sys_log` VALUES (1,0,1611516543,1,1,0,'',0,0,'User %s logged in from ###IP###',255,1,'172.18.0.6','a:1:{i:0;s:5:\"admin\";}',-1,-99,'','',0,'',0,NULL,NULL),(2,0,1611516554,1,1,3,'be_users',0,0,'Record \'%s\' (%s) was inserted on page \'%s\' (%s)',1,10,'172.18.0.6','a:4:{i:0;s:24:\"autogenerated-6d8b51cdaa\";i:1;s:10:\"be_users:3\";i:2;s:12:\"[root-level]\";i:3;i:0;}',0,0,'NEW600dca86e1c16381966449','',0,'',0,NULL,NULL),(3,0,1611516583,1,2,3,'be_users',0,0,'Record \'%s\' (%s) was updated. (Online).',1,10,'172.18.0.6','a:3:{i:0;s:10:\"pptr_admin\";i:1;s:10:\"be_users:3\";s:7:\"history\";s:1:\"2\";}',0,0,'','',0,'',0,NULL,NULL),(4,0,1611516586,1,2,0,'',0,0,'User %s logged out from TYPO3 Backend',255,1,'172.18.0.6','a:1:{i:0;s:5:\"admin\";}',-1,0,'','',0,'',0,NULL,NULL),(5,0,1611516593,3,1,0,'',0,0,'User %s logged in from ###IP###',255,1,'172.18.0.6','a:1:{i:0;s:10:\"pptr_admin\";}',-1,-99,'','',0,'',0,NULL,NULL),(6,0,1611517857,1,1,0,'',0,0,'User %s logged in from ###IP###',255,1,'172.18.0.6','a:1:{i:0;s:5:\"admin\";}',-1,-99,'','',0,'',0,NULL,NULL),(7,0,1611517876,1,1,2,'tx_styleguide_inline_1nnol10n_child',0,0,'Record \'%s\' (%s) was inserted on page \'%s\' (%s)',1,10,'172.18.0.6','a:4:{i:0;s:6:\"lipsum\";i:1;s:37:\"tx_styleguide_inline_1nnol10n_child:2\";i:2;s:15:\"inline 1nnol10n\";i:3;i:57;}',57,0,'NEW600dcfbf48c70977830975','',0,'',0,NULL,NULL),(8,0,1611517876,1,1,3,'tx_styleguide_inline_1nnol10n_child',0,0,'Record \'%s\' (%s) was inserted on page \'%s\' (%s)',1,10,'172.18.0.6','a:4:{i:0;s:6:\"lipsum\";i:1;s:37:\"tx_styleguide_inline_1nnol10n_child:3\";i:2;s:15:\"inline 1nnol10n\";i:3;i:57;}',57,0,'NEW600dcfbf55d7c501759369','',0,'',0,NULL,NULL);
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_news`
--

DROP TABLE IF EXISTS `sys_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_news` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_news`
--

LOCK TABLES `sys_news` WRITE;
/*!40000 ALTER TABLE `sys_news` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_note`
--

DROP TABLE IF EXISTS `sys_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_note` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `personal` smallint(5) unsigned NOT NULL DEFAULT 0,
  `category` smallint(5) unsigned NOT NULL DEFAULT 0,
  `position` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_note`
--

LOCK TABLES `sys_note` WRITE;
/*!40000 ALTER TABLE `sys_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_refindex`
--

DROP TABLE IF EXISTS `sys_refindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_refindex` (
  `hash` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tablename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `recuid` int(11) NOT NULL DEFAULT 0,
  `field` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `flexpointer` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `softref_key` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `softref_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sorting` int(11) NOT NULL DEFAULT 0,
  `workspace` int(11) NOT NULL DEFAULT 0,
  `ref_table` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ref_uid` int(11) NOT NULL DEFAULT 0,
  `ref_string` varchar(1024) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`hash`),
  KEY `lookup_rec` (`tablename`(100),`recuid`),
  KEY `lookup_uid` (`ref_table`(100),`ref_uid`),
  KEY `lookup_string` (`ref_string`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_refindex`
--

LOCK TABLES `sys_refindex` WRITE;
/*!40000 ALTER TABLE `sys_refindex` DISABLE KEYS */;
INSERT INTO `sys_refindex` VALUES ('00434bebc0a48955b7f8f8107b593c61','tx_styleguide_inline_fal',2,'inline_1','','','',1,0,'sys_file_reference',22,''),('0047c3e818d8e6e945e1d883a9a6520a','pages',55,'l10n_parent','','','',0,0,'pages',52,''),('00b0fafbf6888dedff1f68d72866a415','tx_styleguide_inline_1n_child',4,'l10n_source','','','',0,0,'tx_styleguide_inline_1n_child',3,''),('00e28358e7a474f48b7ee17959068541','tx_styleguide_elements_group',5,'group_db_1','','','',1,0,'be_groups',2,''),('00fce6096943f3d7a36cf90e27f65848','tx_styleguide_inline_mnsymmetric',19,'l10n_parent','','','',0,0,'tx_styleguide_inline_mnsymmetric',16,''),('0124e5452568e1fbfc5a000418430e11','tx_styleguide_elements_special',4,'l10n_source','','','',0,0,'tx_styleguide_elements_special',3,''),('01443ba4e6f007480bc8abf2c18bf773','tx_styleguide_inline_expandsingle',2,'inline_1','','','',2,0,'tx_styleguide_inline_expandsingle_child',6,''),('015bc091709c61270ea0f174258ee298','sys_file_reference',42,'l10n_parent','','','',0,0,'sys_file_reference',12,''),('017f70948cbacd834ea86b3062908633','tx_styleguide_inline_fal',2,'inline_flex_1','sInline/lDEF/fal/vDEF/','','',1,0,'sys_file_reference',34,''),('01995ae2d50ba1a37461f13b1cec9a17','pages',40,'l10n_parent','','','',0,0,'pages',37,''),('01bfaa53cc04165efa37fbb820d51aa2','tx_styleguide_inline_fal',3,'inline_4','','','',0,0,'sys_file_reference',45,''),('01c5541b78f22f31b640e3c5be9d3caa','tx_styleguide_required_rte_2_child',4,'l10n_source','','','',0,0,'tx_styleguide_required_rte_2_child',3,''),('01c767c492b48c6bc7df214a8253f558','tx_styleguide_inline_usecombinationbox_mm',3,'select_child','','','',0,0,'tx_styleguide_inline_usecombinationbox_child',1,''),('01cb89ec40d12cff5964d64c889c6703','tx_styleguide_inline_1n_child',4,'select_tree_1','','','',0,0,'pages',1,''),('01e7eb8d436577239599b0eef9d379e5','pages',65,'l10n_parent','','','',0,0,'pages',62,''),('02d91f7d6915369564c3b40a8ca1ee55','tx_styleguide_required_inline_1_child',4,'l10n_source','','','',0,0,'tx_styleguide_required_inline_1_child',3,''),('02f082955c9b5c1f92d7d71712587a4c','tx_styleguide_elements_select',2,'select_single_12','','','',0,0,'tx_styleguide_elements_select_single_12_foreign',2,''),('0336ef0f80dc0594370f622f47ed4dc7','tx_styleguide_elements_select',3,'select_multiplesidebyside_6','','','',0,0,'tx_styleguide_staticdata',1,''),('03385ce531544362fd2bb0913b7c82f7','tx_styleguide_inline_1n_child',5,'group_db_1','','','',0,0,'tx_styleguide_staticdata',1,''),('0358093cf109c11fc89b3b48d109ab14','tx_styleguide_inline_1n',5,'inline_1','','','',0,0,'tx_styleguide_inline_1n_child',5,''),('03f45d81b78766b6fa350ada3b8f93db','tx_styleguide_elements_t3editor_inline_1_child',5,'l10n_source','','','',0,0,'tx_styleguide_elements_t3editor_inline_1_child',4,''),('042bf0c7c73d8789952f0428482b75d0','pages',49,'sys_language_uid','','','',0,0,'sys_language',2,''),('04856ab25bd15ce0f391be8456cacf4d','tx_styleguide_inline_1n1n',4,'inline_1','','','',0,0,'tx_styleguide_inline_1n1n_child',4,''),('04d48126b24ea84f917c8038f07971f2','tx_styleguide_inline_mm',5,'l10n_source','','','',0,0,'tx_styleguide_inline_mm',4,''),('04fcdfd394a3f77ee3c3c9c31f25a05f','tx_styleguide_inline_usecombination_mm',3,'select_child','','','',0,0,'tx_styleguide_inline_usecombination_child',1,''),('05047997d5251d7f98d9ef5818a6f715','tx_styleguide_elements_group',3,'group_requestUpdate_1','','','',1,0,'be_groups',2,''),('0518493cf9e5d0b7b929058c6ba05456','tx_styleguide_elements_group',2,'group_db_9','','','',1,0,'be_groups',2,''),('051dda092d52fdc1bcc3a32af8ac87ca','tx_styleguide_elements_select',5,'select_tree_5','','','',0,0,'pages',1,''),('0534dd22d52165834a8174a5149877fc','tx_styleguide_elements_group',5,'group_requestUpdate_1','','','',1,0,'be_groups',2,''),('05475bbb8db8a71294bcd8f3067a9a28','sys_file_reference',37,'uid_local','','','',0,0,'sys_file',2,''),('05bd76491a6af4f90ba5080c0cd01686','tx_styleguide_required',5,'flex_2','sInline/lDEF/inline_1/vDEF/','','',0,0,'tx_styleguide_required_flex_2_inline_1_child',5,''),('065e2c5b41703101cc3592bc32df6b08','pages',44,'l10n_parent','','','',0,0,'pages',42,''),('06fe7e56578a3d6ff236147aa5ef8da7','tx_styleguide_elements_group',2,'group_db_9','','','',0,0,'be_groups',1,''),('070eed4f87a701fb13d9f509bac44699','pages',103,'l10n_parent','','','',0,0,'pages',102,''),('07210fef1f9b49de3c4dd4d1997f7897','tx_styleguide_inline_mnsymmetric',3,'l10n_parent','','','',0,0,'tx_styleguide_inline_mnsymmetric',1,''),('0736e0c9e525ea58031d6da9aeeef02a','tx_styleguide_inline_usecombinationbox',5,'inline_1','','','',1,0,'tx_styleguide_inline_usecombinationbox_mm',10,''),('0748947f3bdeb13d9e56632ae7248d7e','sys_file_reference',25,'sys_language_uid','','','',0,0,'sys_language',1,''),('0749b96c673915c9c8a958d816f563ad','pages',89,'l10n_parent','','','',0,0,'pages',87,''),('0770e150260177626c50a0b7c86ffa39','tx_styleguide_elements_group',2,'group_db_2','','','',3,0,'be_users',5,''),('07746f4a7a65825b8817b0175a4f3f6c','pages',126,'sys_language_uid','','','',0,0,'sys_language',4,''),('078fe68a99f6fa427027aa6eaee2a120','tx_styleguide_inline_usecombinationbox',2,'sys_language_uid','','','',0,0,'sys_language',1,''),('0798790e5b28e5e55af8ffafebf39b8a','pages',83,'sys_language_uid','','','',0,0,'sys_language',1,''),('07a41ea9268400edc16e383ce1b3eb90','tx_styleguide_elements_select',3,'flex_1','sSection/lDEF/section_1/el/1/container_1/el/select_tree_1/vDEF/','','',0,0,'pages',1,''),('07a7709ccbe8638876bb5563fb643945','tx_styleguide_elements_rte_inline_1_child',2,'sys_language_uid','','','',0,0,'sys_language',1,''),('07d219f8dcee139800cd9394ac3b2ebe','tx_styleguide_inline_usecombination',4,'l10n_parent','','','',0,0,'tx_styleguide_inline_usecombination',1,''),('07d7bd83b7c0697e5bccea186c271234','tx_styleguide_inline_fal',2,'inline_flex_1','sInline/lDEF/fal/vDEF/','','',2,0,'sys_file_reference',35,''),('08588b54686334cc7a1989cb705e3af6','tx_styleguide_inline_usecombinationbox_mm',7,'sys_language_uid','','','',0,0,'sys_language',3,''),('088be75ecca36202570f98d0463330c9','pages',125,'l10n_parent','','','',0,0,'pages',122,''),('08d66c1e2208e91f7278c0f1f68a52ea','sys_file_reference',39,'uid_local','','','',0,0,'sys_file',1,''),('08ea7ec9e038baf4ed9a0cc0856aeaf7','pages',39,'l10n_parent','','','',0,0,'pages',37,''),('08ff23717fff34acba8f03935a02bc60','tx_styleguide_inline_expand_inline_1_child',5,'select_tree_1','','','',2,0,'pages',12,''),('0910804df4bb783f3937e73faa4c2429','pages',14,'l10n_parent','','','',0,0,'pages',12,''),('09debb99cb2635ef842ee3cca77819bd','pages',83,'l10n_parent','','','',0,0,'pages',82,''),('0a3b3f86a7bb8b1ae30dc0b4b813968e','tx_styleguide_inline_expandsingle',5,'inline_1','','','',2,0,'tx_styleguide_inline_expandsingle_child',15,''),('0a3ecef0e8431b7262324c1f4138ec41','pages',4,'sys_language_uid','','','',0,0,'sys_language',2,''),('0ab46220cab4e28fc9976d53e70c3550','pages',59,'sys_language_uid','','','',0,0,'sys_language',2,''),('0b0d18cde9ad7c02fdfbbc68905f9f92','tx_styleguide_inline_expandsingle',2,'inline_1','','','',0,0,'tx_styleguide_inline_expandsingle_child',4,''),('0b1118bcb40a1d7f335cf26d35169989','sys_file_reference',32,'uid_local','','','',0,0,'sys_file',3,''),('0b5fd6a60b4cbbc6be2afcb55ea8c7a1','sys_file_reference',90,'l10n_parent','','','',0,0,'sys_file_reference',81,''),('0b934a73feb18020f6d3bfff744079fc','pages',134,'l10n_parent','','','',0,0,'pages',132,''),('0bccc78a93f34494d6462119b6a46fb4','pages',45,'sys_language_uid','','','',0,0,'sys_language',3,''),('0bfadfa30a1d4ab94a2c962ce08430f1','sys_file_reference',77,'sys_language_uid','','','',0,0,'sys_language',4,''),('0c1124358e0933133572e516b0f56eba','tx_styleguide_required_inline_2_child',5,'sys_language_uid','','','',0,0,'sys_language',4,''),('0c944db53b9a90456a5990f59acc6081','tx_styleguide_required',4,'l10n_source','','','',0,0,'tx_styleguide_required',3,''),('0c9dd5bfd52f559c9cf628f12df2175a','tx_styleguide_required',5,'select_5','','','',1,0,'pages',7,''),('0ca0765603256b6bb0948fc3adc4c267','pages',105,'l10n_parent','','','',0,0,'pages',102,''),('0cf6225e44850327ab72cfd4c9740168','tx_styleguide_required_inline_3_child',4,'l10n_parent','','','',0,0,'tx_styleguide_required_inline_3_child',1,''),('0d209db0c27a041506ba656b16255cb5','sys_file_reference',51,'l10n_parent','','','',0,0,'sys_file_reference',6,''),('0d29b0d19fdb0eb8725946dee46c0451','tx_styleguide_inline_usecombination',4,'inline_1','','','',0,0,'tx_styleguide_inline_usecombination_mm',7,''),('0d2d40cbcb9e5e0ec341e99674b12660','tx_styleguide_elements_select',2,'flex_1','sSection/lDEF/section_1/el/1/container_1/el/select_multiplesidebyside_1/vDEF/','','',1,0,'tx_styleguide_staticdata',2,''),('0d33a03200ce104ab219898b40046366','pages',104,'sys_language_uid','','','',0,0,'sys_language',2,''),('0d47105f758a6b8b09fc19066f0f1501','sys_file_reference',88,'sys_language_uid','','','',0,0,'sys_language',2,''),('0d7b9802276e90a16cd022edbc1e8ab5','tx_styleguide_elements_group',3,'group_db_1','','','',3,0,'be_users',5,''),('0d7e89e5df5a043467ce78493cb260ba','tx_styleguide_elements_select',2,'flex_1','sSection/lDEF/section_1/el/1/container_1/el/select_multiplesidebyside_1/vDEF/','','',0,0,'tx_styleguide_staticdata',1,''),('0d8feee92624eb496e9ece95b960816a','tx_styleguide_palette',5,'sys_language_uid','','','',0,0,'sys_language',4,''),('0ea6cc78d8b135d56e0d7e4570740fca','tx_styleguide_inline_mnsymmetric',8,'l10n_parent','','','',0,0,'tx_styleguide_inline_mnsymmetric',6,''),('0ea7be8a598da68f825f11d020882eb9','tx_styleguide_inline_fal',5,'inline_3','','','',0,0,'sys_file_reference',72,''),('0f1fb8bcbc1d1c76f5a384346004312c','tx_styleguide_elements_basic',3,'l10n_parent','','','',0,0,'tx_styleguide_elements_basic',1,''),('0f6150b40f370057e926e1ea3abcf2d8','sys_file_reference',19,'uid_local','','','',0,0,'sys_file',2,''),('0fe30d271bb765fe34d6aef3460b2a13','tx_styleguide_required',5,'select_5','','','',2,0,'pages',12,''),('0fe3a5c6e4fece448b1b4fbf374f4805','tx_styleguide_elements_select',5,'select_tree_2','','','',1,0,'pages',12,''),('102d2bd099983e2843a156d43a86964e','tx_styleguide_elements_special',3,'l10n_source','','','',0,0,'tx_styleguide_elements_special',1,''),('1078e40946cef714e98ce89330182ba2','sys_file_reference',59,'uid_local','','','',0,0,'sys_file',3,''),('108ef75ff0f0e2389d348f33fe6063c1','tx_styleguide_inline_mnsymmetric',17,'l10n_source','','','',0,0,'tx_styleguide_inline_mnsymmetric',16,''),('10a2640a9265801fd8f91af7885aa67f','tx_styleguide_inline_expandsingle',2,'l10n_source','','','',0,0,'tx_styleguide_inline_expandsingle',1,''),('113f7d2df80a4daeea172e66d1fa6b52','pages',46,'sys_language_uid','','','',0,0,'sys_language',4,''),('119a55f5f6caa6d928b8315a232dfef2','tx_styleguide_elements_select',4,'select_tree_3','','','',0,0,'pages',1,''),('11a898a1eb2c826b1052875eace87446','sys_file_reference',14,'uid_local','','','',0,0,'sys_file',3,''),('11a9de83148a54071c8bc66ad8c770ce','tx_styleguide_inline_usecombinationbox',4,'l10n_source','','','',0,0,'tx_styleguide_inline_usecombinationbox',3,''),('11aad0d86302486490fadb6c9ecab528','tx_styleguide_inline_mnsymmetric',18,'l10n_parent','','','',0,0,'tx_styleguide_inline_mnsymmetric',16,''),('11c86a4d1c0c0def74e681045d256c87','tx_styleguide_type',2,'sys_language_uid','','','',0,0,'sys_language',1,''),('11ce4e065954eb6d24628e385501b23a','sys_file_reference',39,'sys_language_uid','','','',0,0,'sys_language',2,''),('11eb16d2a56962b42325780b5dfeb113','sys_file_reference',31,'uid_local','','','',0,0,'sys_file',2,''),('1212b657bb151998c99af0518d76e43d','tx_styleguide_inline_1n1n',5,'inline_1','','','',0,0,'tx_styleguide_inline_1n1n_child',5,''),('1234d70c29546f5b93620002a290ecfc','tx_styleguide_elements_group',3,'group_db_1','','','',2,0,'be_users',4,''),('123aa8b4ea2ad8cc3b9c96ad59b91089','tx_styleguide_inline_usecombination',3,'sys_language_uid','','','',0,0,'sys_language',2,''),('126334bba005b0bce585200e9845cb28','tx_styleguide_flex',4,'l10n_parent','','','',0,0,'tx_styleguide_flex',1,''),('12cef18cca01dac7c2afd5948417d536','tx_styleguide_required',3,'group_1','','','',0,0,'tx_styleguide_staticdata',1,''),('12f8ee64aa07cb2a9cbaf2c21e9d3af9','tx_styleguide_elements_group',2,'group_db_1','','','',1,0,'be_groups',2,''),('131173f66ac1b561d0860e21222058df','tx_styleguide_inline_usecombinationbox_mm',9,'select_child','','','',0,0,'tx_styleguide_inline_usecombinationbox_child',1,''),('134c872df33075ba9241a34580e6f7a0','tx_styleguide_inline_1n1n_childchild',2,'l10n_source','','','',0,0,'tx_styleguide_inline_1n1n_childchild',1,''),('135130e00419b906062542a1468e5efe','tx_styleguide_elements_select',4,'select_tree_4','','','',2,0,'pages',12,''),('1372116031e9fab6f671318a2f2328a5','tx_styleguide_required_inline_3_child',5,'l10n_source','','','',0,0,'tx_styleguide_required_inline_3_child',4,''),('13736a880f519376de6cf0c64b156d17','tx_styleguide_elements_group',5,'group_db_8','','','',0,0,'tx_styleguide_staticdata',1,''),('13748d223872f571d9a8477a1df361dd','tx_styleguide_inline_mm',2,'l10n_source','','','',0,0,'tx_styleguide_inline_mm',1,''),('14220232378387d8a45afba62758e884','pages',100,'sys_language_uid','','','',0,0,'sys_language',3,''),('1428b1afbfcbf90be575b1a5c707e838','tx_styleguide_type',5,'l10n_source','','','',0,0,'tx_styleguide_type',4,''),('147fa88328b62d161caad7f5a6871400','tx_styleguide_elements_select',4,'select_tree_4','','','',1,0,'pages',7,''),('14a0023ed9fd48adc3d234acd49d8901','tx_styleguide_elements_select',5,'select_tree_2','','','',0,0,'pages',7,''),('14a2a577370b144317cc768c47c5e1c9','pages',113,'sys_language_uid','','','',0,0,'sys_language',1,''),('14fee26b455ec5ba50836d10b89feca1','tx_styleguide_inline_1n_child',2,'select_tree_1','','','',2,0,'pages',12,''),('15136a97d0b920c2164eebf6e69696c5','pages',29,'l10n_parent','','','',0,0,'pages',27,''),('158e28acf094c5c2bd6172e53f64409f','tx_styleguide_elements_t3editor_inline_1_child',5,'sys_language_uid','','','',0,0,'sys_language',4,''),('158f4f885fa3b03cb80597d0550575f3','tx_styleguide_inline_mnsymmetric',9,'sys_language_uid','','','',0,0,'sys_language',3,''),('1614a948006751962566e43e39349cc7','tx_styleguide_required_rte_2_child',3,'l10n_source','','','',0,0,'tx_styleguide_required_rte_2_child',1,''),('168219c75e780df0bfe29bf88c7c0aa0','tx_styleguide_required',3,'select_5','','','',1,0,'pages',7,''),('1683e9df11e44bd876d213821a9cb689','tx_styleguide_elements_t3editor_inline_1_child',2,'sys_language_uid','','','',0,0,'sys_language',1,''),('168c75a2d42314ac45b5db2cbdfb9934','tx_styleguide_inline_1n_child',3,'l10n_parent','','','',0,0,'tx_styleguide_inline_1n_child',1,''),('16b832efa95810f7e3b3c8feb5c62b8f','tx_styleguide_elements_select',3,'select_single_12','','','',0,0,'tx_styleguide_elements_select_single_12_foreign',2,''),('16bcf8879c0ec1608124afd6a29dce68','tx_styleguide_elements_select',5,'flex_1','sMultiplesidebyside/lDEF/select_multiplesidebyside_1/vDEF/','','',0,0,'tx_styleguide_staticdata',1,''),('16da22a2848d935f11f16e4c491b6d17','tx_styleguide_elements_select',2,'select_tree_1','','','',1,0,'pages',7,''),('17118066a78971824d760437a222da55','tx_styleguide_inline_1n_child',3,'group_db_1','','','',0,0,'tx_styleguide_staticdata',1,''),('1762756de837187447c5148ac838ecfb','tx_styleguide_required_inline_1_child',3,'sys_language_uid','','','',0,0,'sys_language',2,''),('1781f229b24cf9b13c749a8734d0a3b2','tx_styleguide_inline_mn',4,'sys_language_uid','','','',0,0,'sys_language',3,''),('17d3646e0d8b368a3fb7b1f823812c76','sys_file_reference',95,'uid_local','','','',0,0,'sys_file',3,''),('17d84c19d7024754b54cf8e29544c494','tx_styleguide_inline_mngroup',4,'l10n_source','','','',0,0,'tx_styleguide_inline_mngroup',3,''),('17ee615ef2fee60e3af0210fa1b6f1e4','tx_styleguide_inline_usecombinationbox',3,'inline_1','','','',1,0,'tx_styleguide_inline_usecombinationbox_mm',6,''),('184c6f51b5b47de37d6b3f78bdd3375f','tx_styleguide_required_inline_2_child',2,'l10n_source','','','',0,0,'tx_styleguide_required_inline_2_child',1,''),('18a721955393c1a04ec80d7723ee4a5b','tx_styleguide_inline_usecombination_mm',6,'select_parent','','','',0,0,'tx_styleguide_inline_usecombination',3,''),('18b6bda94d3aaa6be1d463579566ce16','sys_file_reference',10,'uid_local','','','',0,0,'sys_file',2,''),('191c7b842770e3fc84838b07c4b96a42','pages',9,'sys_language_uid','','','',0,0,'sys_language',2,''),('198705a90908115ed3cc9c8c31e86d33','tx_styleguide_elements_rte',5,'l10n_source','','','',0,0,'tx_styleguide_elements_rte',4,''),('19a762e0fb4212a72b5c26c7e9aec38e','pages',28,'sys_language_uid','','','',0,0,'sys_language',1,''),('1a8a24da4492000f12f476ef19c3a3a7','pages',16,'sys_language_uid','','','',0,0,'sys_language',4,''),('1a90fb4cd50c9b9851ccc9488bc07538','sys_file_reference',84,'sys_language_uid','','','',0,0,'sys_language',1,''),('1af34e603a7bb7c9b161344fe1a08815','tx_styleguide_inline_usecombination',5,'inline_1','','','',1,0,'tx_styleguide_inline_usecombination_mm',10,''),('1b378366812bd1ad436fa8f62b6a8f1e','pages',93,'l10n_parent','','','',0,0,'pages',92,''),('1b6cb92bce5801b40e327b03576f4ad1','tx_styleguide_required_inline_3_child',5,'sys_language_uid','','','',0,0,'sys_language',4,''),('1b8f2145a727823b5693bc9b2377d700','pages',70,'l10n_parent','','','',0,0,'pages',67,''),('1b9292c94ec9c4620362ed2d7d98a115','tx_styleguide_elements_group',2,'flex_1','sDb/lDEF/group_db_2/vDEF/','','',0,0,'tx_styleguide_staticdata',1,''),('1b9b690fea7216d4caad939a76d13319','tx_styleguide_inline_expand',3,'l10n_source','','','',0,0,'tx_styleguide_inline_expand',1,''),('1bb220b66468f70b78fb269cdbec2653','sys_file_reference',36,'l10n_parent','','','',0,0,'sys_file_reference',6,''),('1bbc4061faab92a5446fb42c41ce78d5','tx_styleguide_required',2,'select_5','','','',0,0,'pages',1,''),('1bd7c14df0070050d3b376e48d0ee149','tx_styleguide_elements_select',2,'select_tree_2','','','',1,0,'pages',12,''),('1c21b750a637728a3984b17beab95239','tx_styleguide_elements_group',5,'group_db_9','','','',3,0,'be_users',5,''),('1c9b8784c1518ef7b22704c4fc698ca9','sys_file',2,'storage','','','',0,0,'sys_file_storage',1,''),('1cb336a6b526dbd628d00d557f44a560','tx_styleguide_elements_select',3,'l10n_parent','','','',0,0,'tx_styleguide_elements_select',1,''),('1d0321ee0b7ca8d33c2d86a5cf290120','pages',75,'l10n_parent','','','',0,0,'pages',72,''),('1d14a993fe7c44bff1ce5104b8a04776','sys_file_reference',23,'uid_local','','','',0,0,'sys_file',3,''),('1d1e01e0840c5945680a3793f99d8a59','sys_file_reference',94,'uid_local','','','',0,0,'sys_file',2,''),('1d5b96cd4e1a587b0c8caf1e575fd841','tx_styleguide_elements_rte',5,'rte_flex_1','sInline/lDEF/inline_1/vDEF/','','',0,0,'tx_styleguide_elements_rte_flex_1_inline_1_child',5,''),('1d9349ea735d37884d03bbeff40d4d6b','tx_styleguide_elements_group',5,'group_db_2','','','',0,0,'be_groups',1,''),('1dbdb5626ce1dd4aff9d45fa0bb492b2','tx_styleguide_inline_parentnosoftdelete',5,'inline_1','','','',0,0,'sys_file_reference',93,''),('1dd64df67e4250e389688a04a1eeb8b6','pages',73,'sys_language_uid','','','',0,0,'sys_language',1,''),('1e03ad5a0fb4c3e285f6dde177913946','tx_styleguide_inline_expandsingle_child',11,'l10n_source','','','',0,0,'tx_styleguide_inline_expandsingle_child',8,''),('1e31a63f4011a90b042f48d85e1501cf','tx_styleguide_inline_mm',4,'l10n_source','','','',0,0,'tx_styleguide_inline_mm',3,''),('1e3a3a97f0e570a9d32029ae006aafaa','tx_styleguide_inline_1n_child',2,'select_tree_1','','','',1,0,'pages',7,''),('1e61bf04e0dadec4e8bea904292dadfa','tx_styleguide_elements_t3editor',3,'l10n_parent','','','',0,0,'tx_styleguide_elements_t3editor',1,''),('1e9404a9eabe882b5f643400f46bc230','sys_file_reference',58,'l10n_parent','','','',0,0,'sys_file_reference',13,''),('1eba340dac563a956a974f90bb54db78','tx_styleguide_inline_fal',3,'inline_2','','','',0,0,'sys_file_reference',39,''),('1f5719d3eafa7c833228edff51bee31f','tx_styleguide_inline_usecombination',3,'l10n_parent','','','',0,0,'tx_styleguide_inline_usecombination',1,''),('1f8f43b0b8ed5dc05a2164d5d0fea728','tx_styleguide_inline_usecombinationbox_mm',7,'l10n_source','','','',0,0,'tx_styleguide_inline_usecombinationbox_mm',5,''),('1fb64354f6e093e2169b3c13cb875bc6','tx_styleguide_elements_t3editor',5,'l10n_source','','','',0,0,'tx_styleguide_elements_t3editor',4,''),('1fba7c423a8e9adc93c8fb43108a57f0','tx_styleguide_inline_mn',2,'l10n_source','','','',0,0,'tx_styleguide_inline_mn',1,''),('1fcff87032bb12b2bc6312dce60fee26','sys_file_reference',47,'sys_language_uid','','','',0,0,'sys_language',2,''),('201052471da5a48bd2542f506c7921cb','sys_file_reference',73,'uid_local','','','',0,0,'sys_file',2,''),('206131149ab20feb0d3e1edc3c637d7e','tx_styleguide_elements_select',4,'select_single_3','','','',0,0,'tx_styleguide_staticdata',-2,''),('2066f3b060f89314139d1a62c62a3c05','pages',131,'l10n_parent','','','',0,0,'pages',127,''),('21406475382ab92c9e1ca70ce2c08bd3','sys_file_reference',92,'uid_local','','','',0,0,'sys_file',3,''),('21b187cbefedb95b8e742b0e96013a00','tx_styleguide_elements_select',2,'select_tree_5','','','',0,0,'pages',1,''),('21c482d918f778bad31789b126866ca7','tx_styleguide_required_rte_2_child',3,'l10n_parent','','','',0,0,'tx_styleguide_required_rte_2_child',1,''),('21fcb0b330cc4b36608c72d77f8ea2c3','tx_styleguide_inline_1n1n_child',2,'l10n_source','','','',0,0,'tx_styleguide_inline_1n1n_child',1,''),('21ff785fed407a68d59e28f86ba1eb96','pages',73,'l10n_parent','','','',0,0,'pages',72,''),('228677f3acab5c4d172623a3904f35a2','pages',108,'l10n_parent','','','',0,0,'pages',107,''),('22a9683f5f1a873171a1e861c7841cc0','sys_file_reference',54,'sys_language_uid','','','',0,0,'sys_language',3,''),('22e724a4a9dbe0d05b66b0120eb26eb3','tx_styleguide_inline_foreignrecorddefaults',4,'inline_1','','','',0,0,'tx_styleguide_inline_foreignrecorddefaults_child',4,''),('23004cef30d7077bed730e26c1a0fb76','pages',36,'sys_language_uid','','','',0,0,'sys_language',4,''),('233fde8b021abb5a375a7524867765ae','tx_styleguide_type',5,'sys_language_uid','','','',0,0,'sys_language',4,''),('234514fd10356cfc0dbda5ebc304ea79','tx_styleguide_inline_expandsingle_child',10,'l10n_parent','','','',0,0,'tx_styleguide_inline_expandsingle_child',1,''),('2419b2d7e4550746bf05139492ec24a4','tx_styleguide_elements_select',3,'select_tree_4','','','',0,0,'pages',1,''),('242c41c021bb0a6d7c693a12e584218b','tx_styleguide_inline_fal',4,'inline_2','','','',1,0,'sys_file_reference',55,''),('244921cdcb9158fe7bb17a35f00b5280','tx_styleguide_inline_1n1n_child',2,'inline_1','','','',0,0,'tx_styleguide_inline_1n1n_childchild',2,''),('246d436396dcfdfae30d1c437d4cc8d7','tx_styleguide_inline_usecombination',4,'l10n_source','','','',0,0,'tx_styleguide_inline_usecombination',3,''),('24abec8f137a9060aa8e7b7c676e6021','tx_styleguide_elements_t3editor',5,'t3editor_inline_1','','','',0,0,'tx_styleguide_elements_t3editor_inline_1_child',5,''),('24b61502396ae29ef15dc880f6876c07','tx_styleguide_inline_1n_child',2,'select_tree_1','','','',0,0,'pages',1,''),('24b6cbead6bb134bf5a03b1282015ce7','pages',36,'l10n_parent','','','',0,0,'pages',32,''),('24d47b29aa969cf4db8635e76dd1c386','sys_file',3,'storage','','','',0,0,'sys_file_storage',1,''),('25637b15e166d43c4074f739f9f3acf7','tx_styleguide_inline_parentnosoftdelete',4,'l10n_source','','','',0,0,'tx_styleguide_inline_parentnosoftdelete',3,''),('259767dac18c153dc37046547b4c5ceb','tx_styleguide_elements_select',2,'flex_1','sTree/lDEF/select_tree_2/vDEF/','','',2,0,'pages',12,''),('25a4f31888ecd5cc206b9952ef0456fc','tx_styleguide_required',2,'sys_language_uid','','','',0,0,'sys_language',1,''),('25d4e6095be18caa91fa011f98c504a8','tx_styleguide_inline_mnsymmetric',19,'sys_language_uid','','','',0,0,'sys_language',3,''),('269624697da0201a11708a129ba183b5','tx_styleguide_elements_t3editor',2,'t3editor_inline_1','','','',0,0,'tx_styleguide_elements_t3editor_inline_1_child',2,''),('26eafe16be9f2a97b26a0579d1660f2b','tx_styleguide_elements_select',4,'flex_1','sTree/lDEF/select_tree_2/vDEF/','','',2,0,'pages',12,''),('277db99e1f540613a1cc46630775abe3','sys_file_reference',37,'sys_language_uid','','','',0,0,'sys_language',2,''),('27800c00dfb058c92406e072fe54c550','sys_file_reference',83,'uid_local','','','',0,0,'sys_file',3,''),('27c6e845b8ff71446fb4d8eb7e6912e4','tx_styleguide_inline_fal',2,'inline_3','','','',0,0,'sys_file_reference',27,''),('27cbc9cee9de0d063053add6412832d5','tx_styleguide_inline_usecombinationbox_mm',9,'l10n_source','','','',0,0,'tx_styleguide_inline_usecombinationbox_mm',7,''),('27cd35b950bf04ec428ad676b6ba59fb','sys_file_reference',69,'sys_language_uid','','','',0,0,'sys_language',4,''),('280924be10d4fe2d62a55666c01fa575','tx_styleguide_inline_expandsingle_child',9,'l10n_parent','','','',0,0,'tx_styleguide_inline_expandsingle_child',3,''),('28b2cce94719a1d500ec028b94a87008','tx_styleguide_inline_expand_inline_1_child',2,'select_tree_1','','','',0,0,'pages',1,''),('28d053d62967c484d6d6d87ea8607328','tx_styleguide_elements_group',5,'group_db_7','','','',0,0,'be_users',4,''),('28d4a4132d9483fff784b88a945c2d79','pages',101,'l10n_parent','','','',0,0,'pages',97,''),('28ff45567975afc87ebbebf65b638ec1','sys_file_reference',45,'uid_local','','','',0,0,'sys_file',1,''),('29035fdf779bf98a5331d7835b2831a9','tx_styleguide_inline_mn',3,'l10n_parent','','','',0,0,'tx_styleguide_inline_mn',1,''),('292504f184e330495d78a903d4af92c8','pages',49,'l10n_parent','','','',0,0,'pages',47,''),('29642f6c34ad13edbd4531b0972296be','tx_styleguide_inline_11',4,'l10n_parent','','','',0,0,'tx_styleguide_inline_11',1,''),('2990bc0acb1bb9a05768316f9fabfe28','tx_styleguide_required',3,'l10n_parent','','','',0,0,'tx_styleguide_required',1,''),('29ac8fbe9830125032377b7e92cdc380','sys_file_reference',75,'uid_local','','','',0,0,'sys_file',1,''),('29c913652f90ba1cc3669fa78979586d','tx_styleguide_inline_fal',3,'inline_1','','','',0,0,'sys_file_reference',36,''),('29d4c672fa4339675d0341f238a1b12a','sys_file_reference',17,'uid_local','','','',0,0,'sys_file',3,''),('2a0c8419059231b7c2e07cfcc39b41b4','tx_styleguide_inline_fal',5,'inline_flex_1','sInline/lDEF/fal/vDEF/','','',0,0,'sys_file_reference',78,''),('2a2e84343774beee7f0789cef991dd62','tx_styleguide_required',3,'select_5','','','',2,0,'pages',12,''),('2a76807abe643ed3496ade974920308d','tx_styleguide_elements_group',5,'group_requestUpdate_1','','','',2,0,'be_users',4,''),('2a974accc41a6af8b386ea6db762575b','tx_styleguide_required_inline_1_child',3,'l10n_parent','','','',0,0,'tx_styleguide_required_inline_1_child',1,''),('2addb17b35d475aee5b3ec2b7f25ccc8','tx_styleguide_elements_select',5,'select_multiplesidebyside_6','','','',0,0,'tx_styleguide_staticdata',1,''),('2b47efa7eacfb6d87f6f43a6de065d0e','pages',134,'sys_language_uid','','','',0,0,'sys_language',2,''),('2b4b44518874ea8e5409f97092e8efae','tx_styleguide_inline_mnsymmetric',10,'sys_language_uid','','','',0,0,'sys_language',4,''),('2ba0c03877627953e8620f2ded6fa8f5','tx_styleguide_inline_expandsingle_child',10,'l10n_source','','','',0,0,'tx_styleguide_inline_expandsingle_child',7,''),('2bba7acc4d38d25d093f2d8eb6c21e41','pages',86,'sys_language_uid','','','',0,0,'sys_language',4,''),('2bd844e2b817bd3387f060db5ff89d5c','tx_styleguide_elements_group',4,'group_db_7','','','',1,0,'be_users',5,''),('2c125e4538eaa7b34a9d8b5a8aa44052','tx_styleguide_elements_group',2,'group_db_1','','','',2,0,'be_users',4,''),('2c28442c8be0c577525a5e7bbb559119','tx_styleguide_elements_rte_inline_1_child',3,'sys_language_uid','','','',0,0,'sys_language',2,''),('2c35eac0773b90e68fff480f2bf5a146','tx_styleguide_elements_select',3,'flex_1','sTree/lDEF/select_tree_2/vDEF/','','',1,0,'pages',7,''),('2cbfe75de6e3698a49dfb3fd44f6e6b6','tx_styleguide_inline_fal',3,'inline_3','','','',0,0,'sys_file_reference',42,''),('2cf57381d6a9168ae5714f8d64f3e48a','tx_styleguide_elements_select',5,'select_tree_5','','','',1,0,'pages',7,''),('2cf9d0ff7167160b8c59afb39deace54','pages',81,'l10n_parent','','','',0,0,'pages',77,''),('2db5980f96d4c46cd26ec08dd38093a9','tx_styleguide_inline_usecombinationbox',2,'inline_1','','','',0,0,'tx_styleguide_inline_usecombinationbox_mm',3,''),('2dce9a18ffb9efaea7b956d6231be92b','tx_styleguide_elements_group',2,'group_db_7','','','',0,0,'be_users',4,''),('2df079afb48ea33e23c86d54916c138b','tx_styleguide_inline_usecombinationbox',4,'inline_1','','','',0,0,'tx_styleguide_inline_usecombinationbox_mm',7,''),('2e474594d2ff5831367200a5769d3ff7','tx_styleguide_elements_select',4,'flex_1','sTree/lDEF/select_tree_2/vDEF/','','',1,0,'pages',7,''),('2e646d59bf770f5f332cc228491378ed','tx_styleguide_inline_1n',4,'l10n_parent','','','',0,0,'tx_styleguide_inline_1n',1,''),('2e712db8660807c8405700e2a0e6e90f','tx_styleguide_inline_parentnosoftdelete',3,'l10n_parent','','','',0,0,'tx_styleguide_inline_parentnosoftdelete',1,''),('2efabce2e51a37757ab50071580ae0a0','tx_styleguide_elements_group',2,'group_requestUpdate_1','','','',3,0,'be_users',5,''),('2f53ab3c965c0b98f9f605e3424acf6f','tx_styleguide_elements_select',5,'flex_1','sTree/lDEF/select_tree_1/vDEF/','','',1,0,'pages',7,''),('2f6b6bc182ea5e3e6dcc67d2818f04e6','sys_file_reference',85,'uid_local','','','',0,0,'sys_file',2,''),('2f79e36297778cc43947ebb8aea9704e','tx_styleguide_inline_usecombination',2,'inline_1','','','',1,0,'tx_styleguide_inline_usecombination_mm',4,''),('2f7b9f4adb16463374b839a5e465dfdc','tx_styleguide_required',4,'select_5','','','',1,0,'pages',7,''),('2f7cfd0456274abe81dc6a3fce26e2f9','tx_styleguide_required_inline_2_child',3,'l10n_source','','','',0,0,'tx_styleguide_required_inline_2_child',1,''),('2fe83aa0074b3ce80e0479cfab515777','tx_styleguide_elements_t3editor',4,'t3editor_inline_1','','','',0,0,'tx_styleguide_elements_t3editor_inline_1_child',4,''),('306a99d50c58168c240ab10936222dd1','pages',26,'sys_language_uid','','','',0,0,'sys_language',4,''),('30e46a8b0c38a52422f0a5f2acdd8a3c','pages',6,'sys_language_uid','','','',0,0,'sys_language',4,''),('30f78ff088c73f0934c1f7947c6d9215','pages',121,'sys_language_uid','','','',0,0,'sys_language',4,''),('310738a00e1ac93d977136dc31bf0862','tx_styleguide_required_inline_1_child',5,'l10n_source','','','',0,0,'tx_styleguide_required_inline_1_child',4,''),('310ac6885eea1bd04c2290e5f76abd36','tx_styleguide_inline_fal',4,'inline_3','','','',0,0,'sys_file_reference',57,''),('3144ecfcc790f5a9994c41f8f3c67201','tx_styleguide_inline_fal',2,'inline_2','','','',0,0,'sys_file_reference',24,''),('314be57aae4dce27e7282464752a03b1','tx_styleguide_inline_expand',4,'inline_1','','','',0,0,'tx_styleguide_inline_expand_inline_1_child',4,''),('31a4d70217f78fc49c0d295c89601ea7','tx_styleguide_elements_select',5,'flex_1','sTree/lDEF/select_tree_2/vDEF/','','',0,0,'pages',1,''),('31ad768f03880867864c9bfcfb179009','tx_styleguide_elements_select',4,'flex_1','sSection/lDEF/section_1/el/1/container_1/el/select_tree_1/vDEF/','','',0,0,'pages',1,''),('31dd8515d557ee2d600deed1c87f535d','pages',123,'sys_language_uid','','','',0,0,'sys_language',1,''),('3234123ee64ccc16d9cecf1d611eccc1','tx_styleguide_elements_group',4,'group_db_4','','','',0,0,'tx_styleguide_staticdata',1,''),('326a14059267b18d6097b327f3f438c6','tx_styleguide_inline_1nnol10n',3,'l10n_parent','','','',0,0,'tx_styleguide_inline_1nnol10n',1,''),('32cf8a1e50f50cf8a8b0da802aa99f66','sys_file_reference',47,'l10n_parent','','','',0,0,'sys_file_reference',17,''),('3379f2929a722142bed2cf83dcf5cacc','tx_styleguide_inline_usecombination_mm',5,'sys_language_uid','','','',0,0,'sys_language',2,''),('337f6c46f3b537a47a5561d91faef545','sys_file_reference',62,'sys_language_uid','','','',0,0,'sys_language',3,''),('33931c4ed13d48e1642b53982045e5a8','tx_styleguide_inline_foreignrecorddefaults',5,'l10n_source','','','',0,0,'tx_styleguide_inline_foreignrecorddefaults',4,''),('33c0cbd88b3a8d1977fe325d007c5ddd','pages',103,'sys_language_uid','','','',0,0,'sys_language',1,''),('33c4ad6320743675b64b93c0f005ed14','tx_styleguide_inline_mnsymmetric',4,'l10n_source','','','',0,0,'tx_styleguide_inline_mnsymmetric',3,''),('34136de76a5970b342b54de591e81a54','tx_styleguide_elements_group',4,'group_db_1','','','',1,0,'be_groups',2,''),('341fa585419763136d18852987f39e3d','pages',105,'sys_language_uid','','','',0,0,'sys_language',3,''),('34526594d84f19029ea0b453485edcfb','tx_styleguide_elements_select',2,'select_tree_4','','','',1,0,'pages',7,''),('3488f3a846b13b82a4e2b589a78f4f1b','tx_styleguide_elements_group',2,'group_db_2','','','',2,0,'be_users',4,''),('34a4588144e2f36da04f5b214d27f265','tx_styleguide_elements_rte_inline_1_child',4,'l10n_parent','','','',0,0,'tx_styleguide_elements_rte_inline_1_child',1,''),('34b791feaf041829ed4f1e26fde564ab','tx_styleguide_inline_11',2,'l10n_source','','','',0,0,'tx_styleguide_inline_11',1,''),('34d76399525632445c8356a932b1409d','tx_styleguide_inline_fal',3,'l10n_parent','','','',0,0,'tx_styleguide_inline_fal',1,''),('3536bde894bd79764d2fcb213b4f8098','tx_styleguide_elements_select',2,'select_tree_5','','','',1,0,'pages',7,''),('3569ca3e3d062f5333d3731054798699','tx_styleguide_elements_select',4,'flex_1','sSection/lDEF/section_1/el/1/container_1/el/select_tree_1/vDEF/','','',2,0,'pages',12,''),('35a7195cdbc817e2e63a2ce055b04b45','sys_file_reference',93,'sys_language_uid','','','',0,0,'sys_language',4,''),('35cb507a728947e6be0567fd77114d44','tx_styleguide_elements_t3editor',5,'t3editor_flex_1','sInline/lDEF/inline_1/vDEF/','','',0,0,'tx_styleguide_elements_t3editor_flex_1_inline_1_child',5,''),('36039dfed8d4767d0ef7f6c4e09de0a7','pages',21,'sys_language_uid','','','',0,0,'sys_language',4,''),('3706a9343bd6c49dab051166f8154260','sys_file_reference',61,'sys_language_uid','','','',0,0,'sys_language',3,''),('372b533bb6d551d596bda239261afaa8','tx_styleguide_elements_group',5,'flex_1','sDb/lDEF/group_db_2/vDEF/','','',0,0,'tx_styleguide_staticdata',1,''),('37980ac6509a77ef5fe36360a052bd58','tx_styleguide_inline_fal',5,'inline_2','','','',1,0,'sys_file_reference',70,''),('37bd2880da0888d2742641da4c58a6e6','pages',63,'sys_language_uid','','','',0,0,'sys_language',1,''),('37c56b5ba66fe2518741b90bf78d0bdb','tx_styleguide_inline_fal',4,'inline_3','','','',2,0,'sys_file_reference',59,''),('381bac76a54a74d85578f00c6d6739c9','tx_styleguide_inline_fal',5,'inline_1','','','',0,0,'sys_file_reference',66,''),('382de85a827c1c8e9f4f3c282c57ab0f','tx_styleguide_required_inline_1_child',2,'sys_language_uid','','','',0,0,'sys_language',1,''),('38390b0ff2965a427294a72854d58c08','tx_styleguide_inline_1n',3,'l10n_parent','','','',0,0,'tx_styleguide_inline_1n',1,''),('38c99f18573ee63f127add062eb05cae','tx_styleguide_elements_select',5,'select_tree_4','','','',1,0,'pages',7,''),('392c9e732dc428654469600622827f5e','tx_styleguide_elements_rte_inline_1_child',3,'l10n_source','','','',0,0,'tx_styleguide_elements_rte_inline_1_child',1,''),('39433ea4a82060704109046e4828d3c8','sys_file',1,'storage','','','',0,0,'sys_file_storage',1,''),('396477b3750567385df7a809c2946508','tx_styleguide_elements_group',2,'group_db_2','','','',0,0,'be_groups',1,''),('397d5dc755a01a8b045dd0a39dbb8cd1','tx_styleguide_inline_expandsingle',4,'l10n_source','','','',0,0,'tx_styleguide_inline_expandsingle',3,''),('3996f210d2f975b0abcf92bd29b8cf26','sys_file_reference',45,'l10n_parent','','','',0,0,'sys_file_reference',15,''),('39b46feb999a438eaec69de398941f1a','tx_styleguide_elements_rte_inline_1_child',5,'l10n_source','','','',0,0,'tx_styleguide_elements_rte_inline_1_child',4,''),('39dc745bfc7d4c82757d1cbf22985418','sys_file_reference',53,'l10n_parent','','','',0,0,'sys_file_reference',8,''),('39f6dbf9fed69bae33ce3f38063f5c9c','tx_styleguide_elements_group',4,'group_db_9','','','',1,0,'be_groups',2,''),('39fb2b6860f9d9c2afcf84d5b50349d0','pages',68,'sys_language_uid','','','',0,0,'sys_language',1,''),('3ab56de2eb8e1f9c45c4b051c26e9f65','tx_styleguide_inline_usecombinationbox_mm',8,'l10n_source','','','',0,0,'tx_styleguide_inline_usecombinationbox_mm',6,''),('3b2c9ecc2065b922e936c0fabafd9cdc','tx_styleguide_elements_t3editor',3,'t3editor_flex_1','sInline/lDEF/inline_1/vDEF/','','',0,0,'tx_styleguide_elements_t3editor_flex_1_inline_1_child',3,''),('3b4ef2f49b62c2fd74870611289b2646','pages',69,'l10n_parent','','','',0,0,'pages',67,''),('3b6c277251e48f9db1330a4b86927966','tx_styleguide_inline_mnsymmetric',15,'sys_language_uid','','','',0,0,'sys_language',4,''),('3ba1e8d86d094c48e6e53035f4a3772f','tx_styleguide_inline_mn',3,'l10n_source','','','',0,0,'tx_styleguide_inline_mn',1,''),('3ba8a7efd1be4850c6f239216858df83','tx_styleguide_elements_t3editor',4,'l10n_source','','','',0,0,'tx_styleguide_elements_t3editor',3,''),('3bd3b5a6088356c8d0f9e84dc5ffe3a6','tx_styleguide_inline_fal',2,'inline_1','','','',0,0,'sys_file_reference',21,''),('3bfedf1dd09f2bc617a9a65164c4c879','tx_styleguide_inline_mngroup',5,'l10n_source','','','',0,0,'tx_styleguide_inline_mngroup',4,''),('3c0f39eec43677232e97a3dbd187c312','tx_styleguide_inline_1n1n',3,'inline_1','','','',0,0,'tx_styleguide_inline_1n1n_child',3,''),('3c1ef0405b0a3f74b70d1b0393b2549c','tx_styleguide_type',4,'l10n_source','','','',0,0,'tx_styleguide_type',3,''),('3c6e1a75ed8f349c6d4da27d1b8f142b','tx_styleguide_inline_1n1n_childchild',3,'l10n_parent','','','',0,0,'tx_styleguide_inline_1n1n_childchild',1,''),('3c9944fa420e8e88663ac9c768fe9248','tx_styleguide_inline_mnsymmetric',10,'l10n_source','','','',0,0,'tx_styleguide_inline_mnsymmetric',9,''),('3cdc81d733303c586994859738b0e7e6','sys_file_reference',54,'uid_local','','','',0,0,'sys_file',1,''),('3d09c4599f1445c808528d09c5b6e1e6','pages',21,'l10n_parent','','','',0,0,'pages',17,''),('3d147e5831963bbd079545d03ef77163','pages',10,'sys_language_uid','','','',0,0,'sys_language',3,''),('3d209406d383790e3998b75cfed14d0a','tx_styleguide_inline_mngroup',4,'l10n_parent','','','',0,0,'tx_styleguide_inline_mngroup',1,''),('3d51c550d31c41dbc08b2c73d4fb6c4f','tx_styleguide_inline_mngroup',3,'l10n_source','','','',0,0,'tx_styleguide_inline_mngroup',1,''),('3d7ecb3493eb084cfdb919a9bb4d92ea','tx_styleguide_elements_group',3,'flex_1','sDb/lDEF/group_db_2/vDEF/','','',0,0,'tx_styleguide_staticdata',1,''),('3d9245d9eb202bcf9d08865072a5ed0b','tx_styleguide_elements_rte',3,'l10n_parent','','','',0,0,'tx_styleguide_elements_rte',1,''),('3da8ec2da535bb42440cc409db134cb5','sys_file_reference',36,'sys_language_uid','','','',0,0,'sys_language',2,''),('3dd135af4d22c3cd12b84c09976c5be5','pages',10,'l10n_parent','','','',0,0,'pages',7,''),('3dd508fa36d1ee49deb3e09c3c81708f','tx_styleguide_inline_1n1n',3,'l10n_source','','','',0,0,'tx_styleguide_inline_1n1n',1,''),('3dd9af2bd5f26de4a8551b5a386299ae','sys_file_reference',65,'uid_local','','','',0,0,'sys_file',3,''),('3e0083d88a4755a3d992742603ca795f','tx_styleguide_inline_fal',5,'inline_3','','','',1,0,'sys_file_reference',73,''),('3e2f48c8a0d2b64b7c8a96b96daa9cc7','pages',100,'l10n_parent','','','',0,0,'pages',97,''),('3e871f09364795407521487957a6d16c','tx_styleguide_elements_group',4,'group_db_2','','','',2,0,'be_users',4,''),('3e88c61d597296a33b0a9ef7bf5cbae2','tx_styleguide_inline_fal',5,'inline_4','','','',2,0,'sys_file_reference',77,''),('3e8d6fdc773fd7925da7d6cf7c149e6d','tx_styleguide_inline_usecombination_mm',4,'select_child','','','',0,0,'tx_styleguide_inline_usecombination_child',2,''),('3eb9892d83efdcdb5a24dec2285fe889','tx_styleguide_elements_select',5,'flex_1','sSection/lDEF/section_1/el/1/container_1/el/select_multiplesidebyside_1/vDEF/','','',0,0,'tx_styleguide_staticdata',1,''),('3edfae02474bcc87b357c98b32168b1d','sys_file_reference',46,'uid_local','','','',0,0,'sys_file',2,''),('3f7ed17ffdc7e58083f9beb2f321971d','tx_styleguide_inline_1n1n',4,'l10n_source','','','',0,0,'tx_styleguide_inline_1n1n',3,''),('3f9d2657a17849152c7a7901f11dbcb9','tx_styleguide_inline_expandsingle',3,'l10n_parent','','','',0,0,'tx_styleguide_inline_expandsingle',1,''),('402b2201dcbd44d988f7daacbb6a80f2','tx_styleguide_elements_select',3,'select_tree_2','','','',1,0,'pages',12,''),('40690b9758acea13fc67243a4309299b','pages',15,'l10n_parent','','','',0,0,'pages',12,''),('40790886fbc37057eaf1dd5e09556757','tx_styleguide_inline_1n',4,'inline_1','','','',0,0,'tx_styleguide_inline_1n_child',4,''),('408388be4b8b3bf4ae49457e4a9705b9','tx_styleguide_elements_group',2,'group_requestUpdate_1','','','',1,0,'be_groups',2,''),('408638522671f589d151886026ce0779','tx_styleguide_elements_select',2,'flex_1','sTree/lDEF/select_tree_1/vDEF/','','',0,0,'pages',1,''),('408bb853954a83f083ed3ffc61fffd46','tx_styleguide_inline_foreignrecorddefaults',3,'l10n_parent','','','',0,0,'tx_styleguide_inline_foreignrecorddefaults',1,''),('409fa7c9b71afb6c5092a5c9dd2fe122','sys_file_reference',79,'uid_local','','','',0,0,'sys_file',2,''),('40c5024379b93fb2a246e6b154cc96af','tx_styleguide_inline_parentnosoftdelete',5,'sys_language_uid','','','',0,0,'sys_language',4,''),('40e98b4fe804369c3d77d2f82980a80c','pages',121,'l10n_parent','','','',0,0,'pages',117,''),('40f2e82089dc59dedae35e5c9a0308dc','tx_styleguide_elements_select',4,'select_tree_2','','','',0,0,'pages',7,''),('411aaeed9b05158cad51afdf81dd3f99','pages',11,'sys_language_uid','','','',0,0,'sys_language',4,''),('41360e8f52a674fb38bd0be1434220bb','tx_styleguide_inline_fal',5,'inline_2','','','',2,0,'sys_file_reference',71,''),('415fb256bd18d6c5cf97b240491cdc84','tx_styleguide_elements_select',3,'flex_1','sTree/lDEF/select_tree_1/vDEF/','','',2,0,'pages',12,''),('416263947fae9f341980ea84ba4571c5','tx_styleguide_elements_t3editor_inline_1_child',3,'sys_language_uid','','','',0,0,'sys_language',2,''),('4176adcb8e6a5b59737253f0ba897259','tx_styleguide_inline_fal',3,'inline_4','','','',2,0,'sys_file_reference',47,''),('417de9c3f96365566be8fdf9733d8a0c','tx_styleguide_inline_usecombinationbox',5,'sys_language_uid','','','',0,0,'sys_language',4,''),('41af944f538c1f19aa8a49006926339d','tx_styleguide_inline_fal',4,'inline_flex_1','sInline/lDEF/fal/vDEF/','','',0,0,'sys_file_reference',63,''),('41df61fae99e59b1d83fee008d952cea','tx_styleguide_inline_fal',4,'inline_1','','','',1,0,'sys_file_reference',52,''),('420d9730493178182cbc70b51fd5882f','tx_styleguide_inline_mnsymmetric',3,'sys_language_uid','','','',0,0,'sys_language',2,''),('42239a33140a1bfeb119652725373149','tx_styleguide_elements_select',4,'flex_1','sSection/lDEF/section_1/el/1/container_1/el/select_tree_1/vDEF/','','',1,0,'pages',7,''),('423f1cc1117bff58945babfe9a140017','pages',79,'l10n_parent','','','',0,0,'pages',77,''),('42fde10529922b34ba37b5f675b7e944','pages',93,'sys_language_uid','','','',0,0,'sys_language',1,''),('4318140179d4ae60102a044b61acc0f3','tx_styleguide_flex',4,'l10n_source','','','',0,0,'tx_styleguide_flex',3,''),('433fe0fb998aeb1754c598eb53ec8389','tx_styleguide_inline_expandsingle_child',13,'l10n_source','','','',0,0,'tx_styleguide_inline_expandsingle_child',10,''),('434766d65153a721fc39942dc7e5f4dc','tx_styleguide_inline_fal',4,'inline_1','','','',0,0,'sys_file_reference',51,''),('4364aa73a7b1bd30cf4cff216c1c61c6','tx_styleguide_inline_expandsingle_child',12,'l10n_source','','','',0,0,'tx_styleguide_inline_expandsingle_child',9,''),('439dc19713c93c0a8bc2f87c3dba2c51','tx_styleguide_inline_expand_inline_1_child',4,'l10n_parent','','','',0,0,'tx_styleguide_inline_expand_inline_1_child',1,''),('43e645c16a12cfd81c42741ddce76bac','tx_styleguide_inline_1n1n_childchild',5,'l10n_source','','','',0,0,'tx_styleguide_inline_1n1n_childchild',4,''),('43fcd323d9b64f2fbcc6b0ff0554c052','tx_styleguide_valuesdefault',5,'l10n_source','','','',0,0,'tx_styleguide_valuesdefault',4,''),('442d3f344987adb1a9a984caf679f4c5','tx_styleguide_inline_usecombination_mm',8,'select_parent','','','',0,0,'tx_styleguide_inline_usecombination',4,''),('445dd2771f0ac36976dbb94fa7deeba2','tx_styleguide_inline_fal',2,'inline_3','','','',1,0,'sys_file_reference',28,''),('44ab8afc9f07deb0f5d2a21215b2b7df','pages',94,'sys_language_uid','','','',0,0,'sys_language',2,''),('44dbb5b1f611bde5b14128c3a1de31d1','pages',61,'l10n_parent','','','',0,0,'pages',57,''),('457c2050b429664843f2fcd29db21cfc','pages',3,'sys_language_uid','','','',0,0,'sys_language',1,''),('4584573feffbe12f45571f404d92c008','tx_styleguide_inline_mnsymmetric',13,'sys_language_uid','','','',0,0,'sys_language',2,''),('45a234825a4c021e3dc8c4c8367413d0','tx_styleguide_elements_rte_inline_1_child',4,'l10n_source','','','',0,0,'tx_styleguide_elements_rte_inline_1_child',3,''),('46591bee09d82836bea63fdfaadc4087','pages',81,'sys_language_uid','','','',0,0,'sys_language',4,''),('466dd2239dda3a73876645aaec89addb','pages',130,'sys_language_uid','','','',0,0,'sys_language',3,''),('4680b882026328d7ca2f4ca9176d55fe','tx_styleguide_elements_group',4,'l10n_source','','','',0,0,'tx_styleguide_elements_group',3,''),('4688354e3bfe517fa19158b98dba678e','tx_styleguide_type',3,'sys_language_uid','','','',0,0,'sys_language',2,''),('46ca49d846697645cc50992054d47a34','tx_styleguide_inline_mnsymmetric',15,'l10n_source','','','',0,0,'tx_styleguide_inline_mnsymmetric',14,''),('46f2dd2bada33f6d212d535e5c0a0a15','pages',76,'sys_language_uid','','','',0,0,'sys_language',4,''),('470ff1c22555adf6567d3ee41e0809db','pages',115,'l10n_parent','','','',0,0,'pages',112,''),('4790e3584a80e96db0e514d9ab9df7f6','tx_styleguide_inline_fal',4,'inline_2','','','',2,0,'sys_file_reference',56,''),('47915e5a5c4646cb75d21e18b2a10d9d','tx_styleguide_inline_usecombination_mm',9,'select_child','','','',0,0,'tx_styleguide_inline_usecombination_child',1,''),('47ac97daddb76cb9250ec8dc8c15a80f','tx_styleguide_inline_usecombinationbox',3,'l10n_parent','','','',0,0,'tx_styleguide_inline_usecombinationbox',1,''),('47eb76ea4a24ed15c01dfadb04dbb2b0','tx_styleguide_elements_select',3,'flex_1','sTree/lDEF/select_tree_1/vDEF/','','',0,0,'pages',1,''),('485f2d817fcf5bb654623ea53271093e','pages',5,'l10n_parent','','','',0,0,'pages',2,''),('487a44b4f798c13f2f4706ad57f2181b','pages',85,'l10n_parent','','','',0,0,'pages',82,''),('4885c9c3b752a4cd5343a04529630dec','tx_styleguide_inline_mm',2,'sys_language_uid','','','',0,0,'sys_language',1,''),('48cdf2bc119b1b2b9fb38e89a21f0132','tx_styleguide_inline_usecombination',3,'inline_1','','','',0,0,'tx_styleguide_inline_usecombination_mm',5,''),('49560f1f326d0d63807864e4d530698d','tx_styleguide_inline_mnsymmetric',13,'l10n_parent','','','',0,0,'tx_styleguide_inline_mnsymmetric',11,''),('499f3fd8f07948eafc3163838939511b','pages',31,'sys_language_uid','','','',0,0,'sys_language',4,''),('49af8257b8c3ae58639901a194a1fcd0','tx_styleguide_elements_select',5,'flex_1','sSection/lDEF/section_1/el/1/container_1/el/select_multiplesidebyside_1/vDEF/','','',1,0,'tx_styleguide_staticdata',2,''),('49e5c20f543dbd86fd584b073f1628e9','tx_styleguide_inline_usecombination_mm',3,'select_parent','','','',0,0,'tx_styleguide_inline_usecombination',2,''),('4a1d10d0f3bf5918fef62df4abc6fd7b','tx_styleguide_elements_t3editor',2,'l10n_source','','','',0,0,'tx_styleguide_elements_t3editor',1,''),('4a5fafdc3a94bc6dddeac45ad12a03bd','tx_styleguide_elements_select',3,'flex_1','sMultiplesidebyside/lDEF/select_multiplesidebyside_1/vDEF/','','',1,0,'tx_styleguide_staticdata',2,''),('4ad27761e81ff330954e9e384518b006','tx_styleguide_inline_usecombination_mm',8,'select_child','','','',0,0,'tx_styleguide_inline_usecombination_child',2,''),('4adb00d399d768e0c50fdffeecfe6755','sys_file_reference',40,'sys_language_uid','','','',0,0,'sys_language',2,''),('4b8a2898069ca1bf7275ecb92a001efe','sys_file_reference',22,'sys_language_uid','','','',0,0,'sys_language',1,''),('4bb4eba97682f8886bffa6488ee77ba6','tx_styleguide_inline_mn',3,'sys_language_uid','','','',0,0,'sys_language',2,''),('4bc222975249c1fe07c114d25f2abd1b','tx_styleguide_elements_t3editor',4,'t3editor_flex_1','sInline/lDEF/inline_1/vDEF/','','',0,0,'tx_styleguide_elements_t3editor_flex_1_inline_1_child',4,''),('4bc2b2ada55715d53a71b536325fa8d0','sys_file_reference',82,'uid_local','','','',0,0,'sys_file',2,''),('4c16e6db9d78977246cccb049b04b019','pages',114,'sys_language_uid','','','',0,0,'sys_language',2,''),('4ccc18b99eabed9ebafd7a8f123e3782','tx_styleguide_elements_select',2,'select_tree_4','','','',0,0,'pages',1,''),('4cd7f1f525e05736bcb1b8a4d31f7429','tx_styleguide_inline_usecombinationbox_mm',8,'l10n_parent','','','',0,0,'tx_styleguide_inline_usecombinationbox_mm',2,''),('4cdad9c279b0186524e690fd441c56a5','pages',94,'l10n_parent','','','',0,0,'pages',92,''),('4d05a2c4100f4be38aba009e913af76c','sys_file_reference',73,'sys_language_uid','','','',0,0,'sys_language',4,''),('4d6ed0fb0592a79e6c6628746f75d665','sys_file_reference',33,'uid_local','','','',0,0,'sys_file',1,''),('4d7204f4d6315896603ac436603f5508','sys_file_reference',15,'uid_local','','','',0,0,'sys_file',1,''),('4dacbbae9280fb46795ea0662af55a0b','pages',136,'sys_language_uid','','','',0,0,'sys_language',4,''),('4db0f49352b7e468043c181db54726e6','tx_styleguide_elements_group',5,'group_db_4','','','',0,0,'tx_styleguide_staticdata',1,''),('4e51ac1dccb62d697e1a270e4cee10bf','pages',96,'sys_language_uid','','','',0,0,'sys_language',4,''),('4e80fae06f4b7545b4a5066834a45232','pages',31,'l10n_parent','','','',0,0,'pages',27,''),('4ee9f79fa90365cbb6f71299cb21d1c0','tx_styleguide_type',4,'sys_language_uid','','','',0,0,'sys_language',3,''),('4f0054bbeb656087472eed517d545dc7','pages',51,'sys_language_uid','','','',0,0,'sys_language',4,''),('4f331c0c468056d9acf60c096c360d67','tx_styleguide_elements_select',5,'flex_1','sTree/lDEF/select_tree_1/vDEF/','','',0,0,'pages',1,''),('4f3821bd599ce8eb29b92bee2c4d5bf8','tx_styleguide_inline_11',4,'l10n_source','','','',0,0,'tx_styleguide_inline_11',3,''),('4f38fd065a6ed82458e12be1f965359f','sys_file_reference',92,'l10n_parent','','','',0,0,'sys_file_reference',83,''),('4f9d2b3f5dc162ff2d729e219b4d4c65','tx_styleguide_required_inline_1_child',2,'l10n_source','','','',0,0,'tx_styleguide_required_inline_1_child',1,''),('4fa50fee58c33a8b2cff6e0a287522d1','tx_styleguide_elements_rte',3,'rte_inline_1','','','',0,0,'tx_styleguide_elements_rte_inline_1_child',3,''),('4fc0f7053850fc938cdb48084dfbdeee','pages',26,'l10n_parent','','','',0,0,'pages',22,''),('4fe570b04ab0bbb00972da1fbeb71661','tx_styleguide_inline_usecombinationbox_mm',5,'l10n_source','','','',0,0,'tx_styleguide_inline_usecombinationbox_mm',1,''),('501b074233b747d7c7961f69ce252bbe','tx_styleguide_elements_group',4,'group_db_7','','','',0,0,'be_users',4,''),('50277a060c7557a77d12b5ea3752f561','tx_styleguide_inline_usecombination_mm',6,'l10n_parent','','','',0,0,'tx_styleguide_inline_usecombination_mm',2,''),('50281749e3ade13cd5b89190a435accb','pages',119,'l10n_parent','','','',0,0,'pages',117,''),('50418841fddcfced3ba6e5ac4ce6181d','tx_styleguide_inline_usecombination',3,'inline_1','','','',1,0,'tx_styleguide_inline_usecombination_mm',6,''),('505bb11d79348f3164b5b8659c6153ec','tx_styleguide_required',3,'flex_2','sInline/lDEF/inline_1/vDEF/','','',0,0,'tx_styleguide_required_flex_2_inline_1_child',3,''),('505d2e551d9189be449c46ba3f377f1d','tx_styleguide_inline_mnsymmetric',14,'l10n_parent','','','',0,0,'tx_styleguide_inline_mnsymmetric',11,''),('507533c953fcd9be16b0ce7297b2e2ab','tx_styleguide_inline_usecombinationbox_mm',5,'sys_language_uid','','','',0,0,'sys_language',2,''),('509889494498e77aff2ef9a7a05fd25e','pages',4,'l10n_parent','','','',0,0,'pages',2,''),('50bde20be12ea6e413a769a6d0698531','tx_styleguide_inline_expand_inline_1_child',5,'sys_language_uid','','','',0,0,'sys_language',4,''),('50c6692eaaa49d22a104d65694702ccc','tx_styleguide_flex',3,'flex_3','sInline/lDEF/inline_1/vDEF/','','',0,0,'tx_styleguide_flex_flex_3_inline_1_child',3,''),('50d1780d1ccf59357541e6f81ec054e3','tx_styleguide_inline_usecombination_mm',4,'l10n_source','','','',0,0,'tx_styleguide_inline_usecombination_mm',2,''),('50e00ac0093f0c165f1a389a4cca434a','tx_styleguide_palette',5,'l10n_source','','','',0,0,'tx_styleguide_palette',4,''),('51021169ab0661e98b1d833df38e157c','sys_file_reference',18,'uid_local','','','',0,0,'sys_file',1,''),('515a744b44277218e82d6f4f57420251','tx_styleguide_inline_usecombinationbox_mm',5,'select_child','','','',0,0,'tx_styleguide_inline_usecombinationbox_child',1,''),('5177465f3e2358619d0d7f39d2bbfc5e','tx_styleguide_inline_fal',5,'inline_3','','','',2,0,'sys_file_reference',74,''),('51c99d6acf37b1546b841d2c7aad79a5','pages',66,'sys_language_uid','','','',0,0,'sys_language',4,''),('51f161038bc02027328dda0850dc4bc9','tx_styleguide_inline_usecombination_mm',7,'l10n_parent','','','',0,0,'tx_styleguide_inline_usecombination_mm',1,''),('51f6d2cff05f244c3e9a83cbb89f3867','tx_styleguide_inline_fal',5,'inline_2','','','',0,0,'sys_file_reference',69,''),('5264c20dfe00cbb013773bb1ef8732a2','tx_styleguide_elements_group',2,'group_db_3','','','',0,0,'tx_styleguide_staticdata',1,''),('52dd9a141345aff3e24446edd158c978','pages',60,'sys_language_uid','','','',0,0,'sys_language',3,''),('530d0f1b298819bcfa74356df8ef1a7e','sys_file_reference',90,'uid_local','','','',0,0,'sys_file',1,''),('5387568a4292dcd5a70206c4ec393ecf','tx_styleguide_elements_t3editor_inline_1_child',3,'l10n_parent','','','',0,0,'tx_styleguide_elements_t3editor_inline_1_child',1,''),('53b263297be25f4c82978db77b24c9e3','pages',133,'l10n_parent','','','',0,0,'pages',132,''),('53bd6050ee0f4186e8e743bbfb865b19','tx_styleguide_required',3,'rte_2','','','',0,0,'tx_styleguide_required_rte_2_child',3,''),('53f364722fd32ff9a405dea84b866e99','tx_styleguide_elements_select',2,'flex_1','sTree/lDEF/select_tree_1/vDEF/','','',2,0,'pages',12,''),('542049fca632df8c86ee6c830bbaa6c5','tx_styleguide_palette',2,'l10n_source','','','',0,0,'tx_styleguide_palette',1,''),('54d8b139e3a73fec806888d9362c1dc1','tx_styleguide_elements_group',2,'group_db_9','','','',3,0,'be_users',5,''),('555179bca74bc501abbfe6621deaa186','tx_styleguide_elements_select',3,'select_tree_1','','','',0,0,'pages',1,''),('55a4d2f790c6442a4008863c9b9b1fdd','tx_styleguide_elements_rte',2,'rte_flex_1','sInline/lDEF/inline_1/vDEF/','','',0,0,'tx_styleguide_elements_rte_flex_1_inline_1_child',2,''),('55d65e6c3bc9d5f16f09568d0eb9861e','tx_styleguide_elements_t3editor_inline_1_child',4,'sys_language_uid','','','',0,0,'sys_language',3,''),('55e90b8e888394c9e2600e0e99414d5e','sys_file_reference',60,'uid_local','','','',0,0,'sys_file',1,''),('562bb740c3cedeacdfaf5bfba467955e','tx_styleguide_elements_group',5,'group_db_1','','','',0,0,'be_groups',1,''),('5698edae2d3147414f523191645447d4','pages',89,'sys_language_uid','','','',0,0,'sys_language',2,''),('56b8fa922e00fe1c44b85ee978d2c721','pages',18,'l10n_parent','','','',0,0,'pages',17,''),('56c0916919a5619105695db569cb6da3','tx_styleguide_type',2,'l10n_source','','','',0,0,'tx_styleguide_type',1,''),('56d490dbacc8c75fd7960ddffbefc448','tx_styleguide_inline_expandsingle',5,'inline_1','','','',0,0,'tx_styleguide_inline_expandsingle_child',13,''),('56f3db0a9fcdb4e89bfffb2d5b06704b','tx_styleguide_inline_expandsingle',3,'l10n_source','','','',0,0,'tx_styleguide_inline_expandsingle',1,''),('57a6c56b2ed99ad34e8cfcdcd6cb9297','tx_styleguide_inline_usecombinationbox',5,'l10n_source','','','',0,0,'tx_styleguide_inline_usecombinationbox',4,''),('587a5d41c1f654b725f46f93d801904f','tx_styleguide_inline_mnsymmetric',14,'l10n_source','','','',0,0,'tx_styleguide_inline_mnsymmetric',13,''),('5895919575910b07aade3e5d86bf5246','tx_styleguide_required_inline_3_child',3,'l10n_parent','','','',0,0,'tx_styleguide_required_inline_3_child',1,''),('58e441251001530216255fb4944cc9bc','tx_styleguide_inline_usecombinationbox',3,'inline_1','','','',0,0,'tx_styleguide_inline_usecombinationbox_mm',5,''),('58edcaf5a1330e48ec30a47ccd9cc061','tx_styleguide_elements_group',4,'group_db_9','','','',3,0,'be_users',5,''),('594f20edfb1a4b8d4c9008ca7a3837de','tx_styleguide_inline_1nnol10n',4,'inline_1','','','',0,0,'tx_styleguide_inline_1nnol10n_child',3,''),('5a259b2d1191aff7e2c4ff4600816949','pages',46,'l10n_parent','','','',0,0,'pages',42,''),('5a3ab62a8cb92dd413d0f2ccd09231a1','pages',125,'sys_language_uid','','','',0,0,'sys_language',3,''),('5a44a588602063aa274a7e9ec6ce535c','tx_styleguide_required',4,'group_1','','','',0,0,'tx_styleguide_staticdata',1,''),('5a6b8714b5433412d15cba7c266fb295','pages',136,'l10n_parent','','','',0,0,'pages',132,''),('5a7d9a21d62f627624f0f65751e1b7b7','sys_file_reference',62,'uid_local','','','',0,0,'sys_file',3,''),('5a857a3b137393cb10810deb2cfff7cc','tx_styleguide_elements_group',4,'flex_1','sDb/lDEF/group_db_2/vDEF/','','',0,0,'tx_styleguide_staticdata',1,''),('5a87fde655149e65d1ae8026cd284c61','tx_styleguide_inline_usecombination_mm',5,'select_parent','','','',0,0,'tx_styleguide_inline_usecombination',3,''),('5aa57985326988a5178d6446d3aadc58','sys_file_reference',4,'uid_local','','','',0,0,'sys_file',2,''),('5b4769888b8c377eaf2403e36d5c9268','tx_styleguide_elements_rte',4,'rte_inline_1','','','',0,0,'tx_styleguide_elements_rte_inline_1_child',4,''),('5be3049e29a8637cb2e9db026ab3004e','pages',63,'l10n_parent','','','',0,0,'pages',62,''),('5bedcdf54546b0d0f2842fd1de0ed4d9','sys_file_reference',63,'uid_local','','','',0,0,'sys_file',1,''),('5c2477b169c0f8225e63a467a6496150','tx_styleguide_inline_usecombination_mm',8,'l10n_source','','','',0,0,'tx_styleguide_inline_usecombination_mm',6,''),('5c723794f42497f84697a6bfb4f7a82d','tx_styleguide_required',2,'group_1','','','',0,0,'tx_styleguide_staticdata',1,''),('5c77d8280b2b7d3d72cf79f8fc8681d1','tx_styleguide_elements_rte',4,'l10n_parent','','','',0,0,'tx_styleguide_elements_rte',1,''),('5cd4bd3aebb0838b9d93ff52a9abc643','sys_file_reference',80,'uid_local','','','',0,0,'sys_file',3,''),('5d48697b13407f38773911b1e30b966a','tx_styleguide_inline_mm',5,'sys_language_uid','','','',0,0,'sys_language',4,''),('5d8d857cf5a0e11eb5d4c08189638555','tx_styleguide_inline_mnsymmetric',5,'l10n_source','','','',0,0,'tx_styleguide_inline_mnsymmetric',4,''),('5e09e94cf0af99f38760142af294c69f','sys_file_reference',60,'sys_language_uid','','','',0,0,'sys_language',3,''),('5e376535786fe52b2a23164c637456b4','tx_styleguide_required_inline_1_child',5,'sys_language_uid','','','',0,0,'sys_language',4,''),('5e41e5316e2af6e155263d07cd5f1ec3','pages',13,'sys_language_uid','','','',0,0,'sys_language',1,''),('5ec5a351bca0e9ace5ae9ec0ac5305df','tx_styleguide_elements_select',2,'select_tree_2','','','',0,0,'pages',7,''),('5edde27eced0823079eccb5368de298d','tx_styleguide_inline_fal',3,'inline_flex_1','sInline/lDEF/fal/vDEF/','','',1,0,'sys_file_reference',49,''),('5ef6f22307358fb330861dcd18f9b95e','tx_styleguide_inline_expand_inline_1_child',3,'select_tree_1','','','',0,0,'pages',1,''),('5f57c4e6d7766ddea726a33103a08472','tx_styleguide_elements_group',2,'group_db_8','','','',0,0,'tx_styleguide_staticdata',1,''),('5f6f992b1b55ffcdcc399173c3fdeef2','tx_styleguide_inline_11',3,'l10n_parent','','','',0,0,'tx_styleguide_inline_11',1,''),('5fdbb0d0fe07a12ea618dde4368bf33f','tx_styleguide_inline_usecombinationbox_mm',6,'select_parent','','','',0,0,'tx_styleguide_inline_usecombinationbox',3,''),('601c82e7250ea4e7ac959155ddf77cc2','tx_styleguide_flex',3,'l10n_parent','','','',0,0,'tx_styleguide_flex',1,''),('602723b9f0aa3b260b8528dc57bc27ef','tx_styleguide_elements_rte',4,'rte_flex_1','sInline/lDEF/inline_1/vDEF/','','',0,0,'tx_styleguide_elements_rte_flex_1_inline_1_child',4,''),('6061cce28a70a2c1bfea9db6ff18605e','sys_file_reference',57,'uid_local','','','',0,0,'sys_file',1,''),('6072c659d149684c418021818ff71e0a','tx_styleguide_elements_select',3,'select_tree_5','','','',2,0,'pages',12,''),('60cb1aad34ada211c719bed272aae57f','tx_styleguide_required',3,'select_5','','','',0,0,'pages',1,''),('61705f1b2997c68b141771e3834f8a51','sys_file_reference',20,'uid_local','','','',0,0,'sys_file',3,''),('617477a629b45393786c4fe7c816bd3a','tx_styleguide_inline_usecombination',2,'sys_language_uid','','','',0,0,'sys_language',1,''),('61d7310f89a371ac12a539865f5d78ba','pages',74,'sys_language_uid','','','',0,0,'sys_language',2,''),('6202f34159f4163823d7e36d4c1ecb78','tx_styleguide_elements_select',2,'flex_1','sSection/lDEF/section_1/el/1/container_1/el/select_tree_1/vDEF/','','',2,0,'pages',12,''),('620e84175ff0d221eb86438309cb394b','tx_styleguide_elements_select',4,'flex_1','sSection/lDEF/section_1/el/1/container_1/el/select_multiplesidebyside_1/vDEF/','','',0,0,'tx_styleguide_staticdata',1,''),('624db5e064959c9b3e56907cd61d2165','tx_styleguide_inline_1n_child',3,'select_tree_1','','','',1,0,'pages',7,''),('6282cded867d356814af0f9812cbb2f8','pages',41,'sys_language_uid','','','',0,0,'sys_language',4,''),('629941ef30f565a7d9bc5c4bd713fea2','tx_styleguide_inline_fal',2,'inline_4','','','',0,0,'sys_file_reference',30,''),('62eddbb4c8eb1f3321e8cedde6ff466a','pages',20,'sys_language_uid','','','',0,0,'sys_language',3,''),('631efe8f2a45b94de2f4c2b14e515b16','pages',113,'l10n_parent','','','',0,0,'pages',112,''),('63d7e739b56e8c21474857558148fc49','tx_styleguide_inline_expandsingle_child',12,'l10n_parent','','','',0,0,'tx_styleguide_inline_expandsingle_child',3,''),('6444646ff3b2680bc9f9549e80b2b231','sys_file_reference',44,'l10n_parent','','','',0,0,'sys_file_reference',14,''),('64544b4d6d0f7500ef69005e2afa409d','tx_styleguide_inline_usecombinationbox_mm',8,'sys_language_uid','','','',0,0,'sys_language',3,''),('645d695047c5342314e731dca3c577f2','pages',116,'l10n_parent','','','',0,0,'pages',112,''),('6466c5a00d0ec7d9aafecf469197f37e','tx_styleguide_elements_select',3,'select_tree_4','','','',2,0,'pages',12,''),('649406a34a865afbf45bc9c4d8ea4482','tx_styleguide_inline_fal',5,'inline_1','','','',1,0,'sys_file_reference',67,''),('650545ae45b65676289857dd6d74eaef','tx_styleguide_elements_group',2,'group_db_4','','','',0,0,'tx_styleguide_staticdata',1,''),('65232e13df177230679768f38b7a62e0','pages',90,'l10n_parent','','','',0,0,'pages',87,''),('6565deef9abb11401716fbfc4d4620b9','tx_styleguide_elements_group',2,'group_requestUpdate_1','','','',0,0,'be_groups',1,''),('65e5186f9de5bf08393bd85cc4f3c712','tx_styleguide_required',4,'sys_language_uid','','','',0,0,'sys_language',3,''),('66258f0c550865be4c7663e31f2e589d','tx_styleguide_elements_select',3,'flex_1','sSection/lDEF/section_1/el/1/container_1/el/select_multiplesidebyside_1/vDEF/','','',1,0,'tx_styleguide_staticdata',2,''),('6684c951fc14b0bc2f33799ae9a0d02b','sys_file_reference',39,'l10n_parent','','','',0,0,'sys_file_reference',9,''),('66a826550b4d186937583c4ad8359697','tx_styleguide_inline_1nnol10n',5,'l10n_source','','','',0,0,'tx_styleguide_inline_1nnol10n',4,''),('66fd1cff2482d638e4eda4ebd8c7f7db','tx_styleguide_inline_1n_child',3,'l10n_source','','','',0,0,'tx_styleguide_inline_1n_child',1,''),('677f45cb86da7e2986667fe854c82b93','tx_styleguide_valuesdefault',2,'l10n_source','','','',0,0,'tx_styleguide_valuesdefault',1,''),('678ec0c3d76d44b3cc6dd3957d7c5b74','tx_styleguide_elements_group',5,'flex_1','sDb/lDEF/group_db_1/vDEF/','','',0,0,'tx_styleguide_staticdata',1,''),('67b2dea1fa64302c33cc577d1f80e56a','tx_styleguide_elements_group',3,'group_db_2','','','',1,0,'be_groups',2,''),('67b90e6dccc1d6b9f30da2d36966db9b','sys_file_reference',11,'uid_local','','','',0,0,'sys_file',3,''),('67e8a113c5a96a9c5ded4ef7d73b33d4','sys_file_reference',94,'sys_language_uid','','','',0,0,'sys_language',4,''),('67fee3dbd7ccf940a99cada84aecb4c5','sys_file_reference',89,'l10n_parent','','','',0,0,'sys_file_reference',83,''),('681716ebe48cae3bf71d95e7e0c71046','tx_styleguide_inline_fal',4,'inline_4','','','',1,0,'sys_file_reference',61,''),('681a8a6b9f02d5c64d444cce2637496e','tx_styleguide_type',3,'l10n_parent','','','',0,0,'tx_styleguide_type',1,''),('681cf51fef6b92bd54e4baaddd8874ce','tx_styleguide_inline_mngroup',3,'l10n_parent','','','',0,0,'tx_styleguide_inline_mngroup',1,''),('684b782eb4152487b84277d69de0c328','tx_styleguide_elements_select',5,'select_tree_1','','','',1,0,'pages',7,''),('68b9d5d8eb6ed09b09549ecacb38b266','tx_styleguide_inline_usecombination_mm',7,'sys_language_uid','','','',0,0,'sys_language',3,''),('68bc9f3cb6f570acc945aee0c5cf9e0c','sys_file_reference',90,'sys_language_uid','','','',0,0,'sys_language',3,''),('690a0009d3fb49bd617f7d811495c848','tx_styleguide_elements_group',3,'group_db_9','','','',0,0,'be_groups',1,''),('69c851a27dc5b4896007c55434cc5495','pages',129,'l10n_parent','','','',0,0,'pages',127,''),('69ebef1608f114e5c707efe8bff21a20','tx_styleguide_inline_fal',4,'inline_3','','','',1,0,'sys_file_reference',58,''),('6a3125d3b77f2e2ce85b234ac5470061','tx_styleguide_inline_mm',4,'l10n_parent','','','',0,0,'tx_styleguide_inline_mm',1,''),('6a6e9bc63b252e009cb86b945fa9de27','tx_styleguide_inline_fal',3,'inline_3','','','',2,0,'sys_file_reference',44,''),('6a7af35c8ba05a79d2e5e360470db345','tx_styleguide_elements_group',3,'group_requestUpdate_1','','','',2,0,'be_users',4,''),('6ac84a0ea7ced2fcdef6c315b53d4b62','tx_styleguide_inline_usecombinationbox',2,'l10n_source','','','',0,0,'tx_styleguide_inline_usecombinationbox',1,''),('6acc64bb21a53f6fcd515727fccf321f','tx_styleguide_elements_select',4,'flex_1','sTree/lDEF/select_tree_2/vDEF/','','',0,0,'pages',1,''),('6acd70ea3b3acf38e3ffb06099210c16','tx_styleguide_elements_group',3,'group_db_7','','','',1,0,'be_users',5,''),('6b3e2e40b4d88df3132168dc1b58c6f7','tx_styleguide_inline_foreignrecorddefaults',3,'l10n_source','','','',0,0,'tx_styleguide_inline_foreignrecorddefaults',1,''),('6c427fc13d6d6e209c666059f62efc01','tx_styleguide_elements_group',2,'group_db_5','','','',0,0,'be_users',4,''),('6c71390c385ad3ccba89e7ea3411e957','tx_styleguide_elements_group',4,'group_requestUpdate_1','','','',0,0,'be_groups',1,''),('6d150a5f04758c69f8d6906c143ff44a','tx_styleguide_inline_usecombinationbox',3,'l10n_source','','','',0,0,'tx_styleguide_inline_usecombinationbox',1,''),('6d263c8efa7bd1d253453c7b182278de','sys_file_reference',41,'sys_language_uid','','','',0,0,'sys_language',2,''),('6d94f1aac3d323ed94106013b7a47b13','tx_styleguide_elements_group',3,'group_db_3','','','',0,0,'tx_styleguide_staticdata',1,''),('6d96735c221b74b1927ae4da251aa6c2','tx_styleguide_inline_expand',3,'inline_1','','','',0,0,'tx_styleguide_inline_expand_inline_1_child',3,''),('6db9a397aac7f72ff33689c539888107','tx_styleguide_elements_select',3,'select_tree_5','','','',0,0,'pages',1,''),('6dc449940bb527a0d8efa9d8cf2d7cbd','tx_styleguide_inline_expandsingle',4,'inline_1','','','',0,0,'tx_styleguide_inline_expandsingle_child',10,''),('6de4109c1be0a1a08d0267c5d5b28a74','tx_styleguide_elements_select',4,'flex_1','sTree/lDEF/select_tree_1/vDEF/','','',0,0,'pages',1,''),('6e272d29806d9e0cc9a6f91496256c2f','tx_styleguide_inline_parentnosoftdelete',2,'inline_1','','','',0,0,'sys_file_reference',84,''),('6e86056019aeae576604ee5cc88d3901','tx_styleguide_inline_11',3,'l10n_source','','','',0,0,'tx_styleguide_inline_11',1,''),('6ed37a8efafa3e38c53d5252b1a26497','tx_styleguide_elements_select',5,'select_multiplesidebyside_6','','','',1,0,'tx_styleguide_staticdata',2,''),('6f52bfdcc58eee939099effd3705edcd','tx_styleguide_inline_usecombination',4,'inline_1','','','',1,0,'tx_styleguide_inline_usecombination_mm',8,''),('6f7bcd6a5ebd9a379a57b2879a6ef493','pages',124,'sys_language_uid','','','',0,0,'sys_language',2,''),('6f7cf16f8533edf5fbda954942bd2514','tx_styleguide_elements_basic',2,'l10n_source','','','',0,0,'tx_styleguide_elements_basic',1,''),('6fba76cc424ae7c792f0cf27eddd8aa7','tx_styleguide_elements_rte',2,'l10n_source','','','',0,0,'tx_styleguide_elements_rte',1,''),('701b1e2983ee609695e43bda9b923c15','tx_styleguide_inline_usecombinationbox_mm',3,'l10n_source','','','',0,0,'tx_styleguide_inline_usecombinationbox_mm',1,''),('7024153bbc6540cc30a44ef78d1554a5','tx_styleguide_required',2,'inline_2','','','',0,0,'tx_styleguide_required_inline_2_child',2,''),('7047ceab0ce14326a1a2afe478d94664','tx_styleguide_elements_select',4,'select_multiplesidebyside_6','','','',0,0,'tx_styleguide_staticdata',1,''),('70770613c73f7004b2ea038bab2f9f11','tx_styleguide_inline_parentnosoftdelete',5,'inline_1','','','',1,0,'sys_file_reference',94,''),('70b19cf76ea8e6a9e841c0874d2ab152','tx_styleguide_type',4,'l10n_parent','','','',0,0,'tx_styleguide_type',1,''),('70e5ad7c93433d9a1f2f50bbf8543df0','tx_styleguide_inline_foreignrecorddefaults',4,'l10n_parent','','','',0,0,'tx_styleguide_inline_foreignrecorddefaults',1,''),('712617715c3fc9ad7a95755984b08695','tx_styleguide_inline_usecombination_mm',4,'select_parent','','','',0,0,'tx_styleguide_inline_usecombination',2,''),('716b6becdeef364dc9a1a8d38df91046','tx_styleguide_elements_group',5,'group_requestUpdate_1','','','',3,0,'be_users',5,''),('716bef183c2f59253dce13224a94cf6c','tx_styleguide_inline_mnsymmetric',2,'l10n_source','','','',0,0,'tx_styleguide_inline_mnsymmetric',1,''),('71ca9ee1496b59dcda086b29159ebc1b','sys_file_reference',86,'sys_language_uid','','','',0,0,'sys_language',1,''),('71f4f23d5eb7c9daa88a3e43d1430cad','tx_styleguide_elements_group',3,'l10n_parent','','','',0,0,'tx_styleguide_elements_group',1,''),('72464cbace198001a4850d8bd3206b69','pages',48,'sys_language_uid','','','',0,0,'sys_language',1,''),('72562628f337a41d2d4e23eceb001394','tx_styleguide_inline_mnsymmetric',9,'l10n_source','','','',0,0,'tx_styleguide_inline_mnsymmetric',8,''),('725d0f83ac1cef5764228088f0bbc6c1','tx_styleguide_inline_usecombinationbox',5,'inline_1','','','',0,0,'tx_styleguide_inline_usecombinationbox_mm',9,''),('728001e87fbf156230bd2677d3c6f7b1','tx_styleguide_inline_1n1n_child',4,'l10n_parent','','','',0,0,'tx_styleguide_inline_1n1n_child',1,''),('7309d0c8a8a813dbc97d323e743878c7','pages',16,'l10n_parent','','','',0,0,'pages',12,''),('7323318baa0f0523e8344b8ebe9187df','pages',101,'sys_language_uid','','','',0,0,'sys_language',4,''),('73457f84c9a3d67ac2b03a86e8cd7268','tx_styleguide_inline_expand_inline_1_child',3,'sys_language_uid','','','',0,0,'sys_language',2,''),('7349989562e155d3b946a16483f9d124','pages',18,'sys_language_uid','','','',0,0,'sys_language',1,''),('739900836134654900b46254ab9fd607','tx_styleguide_inline_usecombination_mm',5,'l10n_parent','','','',0,0,'tx_styleguide_inline_usecombination_mm',1,''),('73ba971933267d51e76fe4b1991cdfe6','tx_styleguide_inline_1n1n_child',5,'inline_1','','','',0,0,'tx_styleguide_inline_1n1n_childchild',5,''),('73eb3b343d058c9bae7c7db7c6b4f644','pages',54,'l10n_parent','','','',0,0,'pages',52,''),('742f42912d8dfd3c610d31ba87082ff9','tx_styleguide_elements_select',4,'l10n_parent','','','',0,0,'tx_styleguide_elements_select',1,''),('74a71b418d1ca9932f4095510ab0867c','tx_styleguide_inline_usecombinationbox_mm',7,'select_parent','','','',0,0,'tx_styleguide_inline_usecombinationbox',4,''),('7507e94ec31e47d9ef940424a84ddce0','tx_styleguide_required',2,'select_5','','','',2,0,'pages',12,''),('751e8efcab8a68978859c400754a7f22','pages',71,'sys_language_uid','','','',0,0,'sys_language',4,''),('758712e42ed3266852440f00f136cd3f','tx_styleguide_elements_group',4,'group_requestUpdate_1','','','',3,0,'be_users',5,''),('75b684b7916e8ea947a23e19cdcecc8c','tx_styleguide_valuesdefault',2,'sys_language_uid','','','',0,0,'sys_language',1,''),('75bd6b171378b435f0108f8e440a016f','pages',24,'sys_language_uid','','','',0,0,'sys_language',2,''),('75cc3ade2f569ff215e946dfba6f19ce','tx_styleguide_elements_group',3,'group_db_4','','','',0,0,'tx_styleguide_staticdata',1,''),('763a25c12c4c53209b44f504de81ecad','sys_file_reference',30,'uid_local','','','',0,0,'sys_file',1,''),('773613c088d82db175e13a557a8aa03d','sys_file_reference',55,'l10n_parent','','','',0,0,'sys_file_reference',10,''),('77385446b1c32e235d3a2455eb2b3c8f','tx_styleguide_inline_1n1n_child',3,'l10n_source','','','',0,0,'tx_styleguide_inline_1n1n_child',1,''),('7744b9b94ace1774f53eeae13ea49174','pages',79,'sys_language_uid','','','',0,0,'sys_language',2,''),('7745238ada3c91020ecc80b146cc7719','tx_styleguide_inline_mngroup',4,'sys_language_uid','','','',0,0,'sys_language',3,''),('7760e93e700888ea91a3548c7f8dc337','sys_file_reference',13,'uid_local','','','',0,0,'sys_file',2,''),('77768a2ac6ca02ebbe41b22bfde2bc5c','tx_styleguide_inline_expandsingle',3,'inline_1','','','',2,0,'tx_styleguide_inline_expandsingle_child',9,''),('778a65ada61d683e29bd2dc801eba2f9','sys_file_reference',42,'sys_language_uid','','','',0,0,'sys_language',2,''),('779049cc1600e3185a524e836cc152d1','pages',50,'l10n_parent','','','',0,0,'pages',47,''),('77c6b765cdd63019270803b51e08f1b0','tx_styleguide_inline_expand',2,'l10n_source','','','',0,0,'tx_styleguide_inline_expand',1,''),('77d968231c539e1d8a4bbb3deacbadad','tx_styleguide_inline_expandsingle',4,'inline_1','','','',2,0,'tx_styleguide_inline_expandsingle_child',12,''),('77f5855211aff5ed30019673b9edcea3','tx_styleguide_inline_parentnosoftdelete',3,'l10n_source','','','',0,0,'tx_styleguide_inline_parentnosoftdelete',1,''),('77f84da238d4c4c74488aa0e5c4b675f','tx_styleguide_inline_expand',2,'inline_1','','','',0,0,'tx_styleguide_inline_expand_inline_1_child',2,''),('77fd303b3eab816fd44ee1a60bf237b1','pages',55,'sys_language_uid','','','',0,0,'sys_language',3,''),('7807b7c953022d32d906286e9795d27b','tx_styleguide_inline_foreignrecorddefaults',2,'inline_1','','','',0,0,'tx_styleguide_inline_foreignrecorddefaults_child',2,''),('787f4c0c5c1b4d102b18712b58431f58','sys_file_reference',44,'sys_language_uid','','','',0,0,'sys_language',2,''),('7893a8e860c45310e52b0090840970f2','tx_styleguide_inline_expandsingle_child',8,'l10n_parent','','','',0,0,'tx_styleguide_inline_expandsingle_child',2,''),('789706a031f83e69de29d5ec3a3a4aac','tx_styleguide_inline_mnsymmetric',7,'sys_language_uid','','','',0,0,'sys_language',1,''),('7897589be8204dfcdae6a85020e4d700','tx_styleguide_elements_select',5,'flex_1','sSection/lDEF/section_1/el/1/container_1/el/select_tree_1/vDEF/','','',2,0,'pages',12,''),('78c586ed3b5c418f6a6bab05c08588a4','sys_file_reference',88,'uid_local','','','',0,0,'sys_file',2,''),('79265d39490c29cf8442e07758821b7f','tx_styleguide_palette',4,'l10n_parent','','','',0,0,'tx_styleguide_palette',1,''),('798bf0bdb4d8ff7151e82e3eb6d3c04a','tx_styleguide_inline_1n1n',3,'l10n_parent','','','',0,0,'tx_styleguide_inline_1n1n',1,''),('79d093f4f0a4992f4f6673470c8b5040','tx_styleguide_elements_select',3,'select_multiplesidebyside_6','','','',1,0,'tx_styleguide_staticdata',2,''),('79e9a94b125e57d32c09739c8b5ad309','sys_file_reference',1,'uid_local','','','',0,0,'sys_file',1,''),('79f2ac53db0d1b69fd2433c6aba877f7','tx_styleguide_elements_group',4,'group_db_3','','','',0,0,'tx_styleguide_staticdata',1,''),('7a0c0c0a1613194de37d8a95cd445650','tx_styleguide_required',5,'select_5','','','',0,0,'pages',1,''),('7aa832be39849648698b5b3afb8b92a4','tx_styleguide_elements_group',4,'group_db_2','','','',0,0,'be_groups',1,''),('7abde212a6e8d7ce400568657f8e7bb0','tx_styleguide_inline_1n_child',4,'select_tree_1','','','',2,0,'pages',12,''),('7b37a98177baff7b5406c1b4342384e4','tx_styleguide_inline_expandsingle',5,'inline_1','','','',1,0,'tx_styleguide_inline_expandsingle_child',14,''),('7b4aeffa3128ae22d1f92cfa03b64f8f','tx_styleguide_elements_select',2,'flex_1','sTree/lDEF/select_tree_2/vDEF/','','',0,0,'pages',1,''),('7b728756b564c30bc39510d31ef32fe7','pages',64,'l10n_parent','','','',0,0,'pages',62,''),('7b7c856120692e4e1e4beee029ce9e32','sys_file_reference',56,'sys_language_uid','','','',0,0,'sys_language',3,''),('7b7e75ebcfcb106cb4e8e64c2dbb42c6','tx_styleguide_type',3,'l10n_source','','','',0,0,'tx_styleguide_type',1,''),('7bacbbdafb5607c78448e5d0fb7d78c1','tx_styleguide_inline_usecombination',3,'l10n_source','','','',0,0,'tx_styleguide_inline_usecombination',1,''),('7bbec28b140108a070e8797f5c0bf386','sys_file_reference',72,'uid_local','','','',0,0,'sys_file',1,''),('7c4ad44c43b9be98006339abac2422a6','sys_file_reference',34,'uid_local','','','',0,0,'sys_file',2,''),('7c57fd6d310009a2d2f6d8aafaaed79c','tx_styleguide_inline_1n',3,'inline_1','','','',0,0,'tx_styleguide_inline_1n_child',3,''),('7cfdadb38cd5f84f630e231de259bef3','tx_styleguide_elements_select',2,'select_tree_5','','','',2,0,'pages',12,''),('7d236a5b9afeede1c192c685deec971d','tx_styleguide_elements_t3editor_inline_1_child',3,'l10n_source','','','',0,0,'tx_styleguide_elements_t3editor_inline_1_child',1,''),('7d23d06c4579851e968900b1dc81237f','pages',98,'l10n_parent','','','',0,0,'pages',97,''),('7d2754e1369db3d23a2b66be2cbe68e2','tx_styleguide_elements_select',5,'flex_1','sSection/lDEF/section_1/el/1/container_1/el/select_tree_1/vDEF/','','',1,0,'pages',7,''),('7d32e79eff8697444c5a4bba2fb4a5e7','sys_file_reference',87,'l10n_parent','','','',0,0,'sys_file_reference',81,''),('7d9142e4d63fc0d9dc09433855ee3e28','tx_styleguide_elements_basic',4,'l10n_parent','','','',0,0,'tx_styleguide_elements_basic',1,''),('7de24f8cf065ec599a2549890541b45f','tx_styleguide_inline_mn',5,'sys_language_uid','','','',0,0,'sys_language',4,''),('7e0d84049658484cae1c44c1d8790d47','pages',43,'sys_language_uid','','','',0,0,'sys_language',1,''),('7e3d76d3bce129428ebb69127c6650d5','tx_styleguide_inline_expand_inline_1_child',3,'l10n_source','','','',0,0,'tx_styleguide_inline_expand_inline_1_child',1,''),('7e5464d28540444efc1e8dd767d5c88c','tx_styleguide_elements_group',5,'group_db_2','','','',3,0,'be_users',5,''),('7e6cb328de4e7fe5d81ee36641ebf7d6','tx_styleguide_palette',2,'sys_language_uid','','','',0,0,'sys_language',1,''),('7ec4abb8e98e26618c248a5bf6a8dcaf','tx_styleguide_inline_fal',4,'inline_4','','','',2,0,'sys_file_reference',62,''),('7efb27e9f99f970cee78ae054e009808','tx_styleguide_inline_fal',2,'inline_4','','','',1,0,'sys_file_reference',31,''),('801f83561b2f21326e33748be727afec','pages',54,'sys_language_uid','','','',0,0,'sys_language',2,''),('80214e17f39614b068208f83c4affa6e','tx_styleguide_elements_group',5,'group_db_2','','','',2,0,'be_users',4,''),('8041e6afead34c349def1a0447f820dc','tx_styleguide_inline_1n1n',4,'l10n_parent','','','',0,0,'tx_styleguide_inline_1n1n',1,''),('80a7115b216b564f632d4bd72cfd1f4c','pages',13,'l10n_parent','','','',0,0,'pages',12,''),('80a7bab7f42747969e884ae97afa7393','tx_styleguide_inline_mngroup',2,'l10n_source','','','',0,0,'tx_styleguide_inline_mngroup',1,''),('80bb3e5395381ae24affe8e8eb246c4a','sys_file_reference',70,'sys_language_uid','','','',0,0,'sys_language',4,''),('80bba2629ed64b6a84717f039b8c66e4','tx_styleguide_inline_foreignrecorddefaults_child',2,'l10n_source','','','',0,0,'tx_styleguide_inline_foreignrecorddefaults_child',1,''),('80bfb94f39bc3aeeb22587cc092c6808','pages',135,'l10n_parent','','','',0,0,'pages',132,''),('81133c17a0a14e9cc577b5de6d414e93','sys_file_reference',53,'uid_local','','','',0,0,'sys_file',3,''),('811c51ad9d9eb1e72e79b1ea6701b319','sys_file_reference',87,'uid_local','','','',0,0,'sys_file',1,''),('811c60eabad7ef97778fc6f05fdfbd32','tx_styleguide_elements_select',5,'select_tree_4','','','',2,0,'pages',12,''),('8147b01bb57fab4a598cb61a9eafa679','tx_styleguide_inline_usecombination_mm',10,'select_parent','','','',0,0,'tx_styleguide_inline_usecombination',5,''),('819836cb4168ccc266ab8dfb60219f5f','tx_styleguide_inline_parentnosoftdelete',2,'l10n_source','','','',0,0,'tx_styleguide_inline_parentnosoftdelete',1,''),('81cb527ecae04306a9a7826bd5152d25','tx_styleguide_inline_mnsymmetric',8,'l10n_source','','','',0,0,'tx_styleguide_inline_mnsymmetric',6,''),('825f682e34b0beb82272c311d5b7292f','tx_styleguide_elements_select',3,'flex_1','sTree/lDEF/select_tree_2/vDEF/','','',2,0,'pages',12,''),('82b937e96de73df9f0ed6610b49ca7f2','sys_file_reference',59,'sys_language_uid','','','',0,0,'sys_language',3,''),('82d7d64e264db241a37e50020ec34f3f','tx_styleguide_elements_select',5,'flex_1','sTree/lDEF/select_tree_2/vDEF/','','',2,0,'pages',12,''),('82f76bf41dfaaf561a5ac2480cb48bdf','tx_styleguide_inline_parentnosoftdelete',3,'sys_language_uid','','','',0,0,'sys_language',2,''),('8308ddd14f9a57c974db111c381fefea','sys_file_reference',69,'uid_local','','','',0,0,'sys_file',1,''),('832290437beacfdeee88e513c058cadf','sys_file_reference',46,'l10n_parent','','','',0,0,'sys_file_reference',16,''),('833d51fedf69452835ab811d9bfbe7ce','sys_file_reference',78,'uid_local','','','',0,0,'sys_file',1,''),('835bc2724ed5527d92087f4c3d5e5588','sys_file_reference',55,'sys_language_uid','','','',0,0,'sys_language',3,''),('83691d3ae57d8366d1dea606164b5261','pages',85,'sys_language_uid','','','',0,0,'sys_language',3,''),('8384da8e412355a90f978b83d14d0fd0','tx_styleguide_inline_expandsingle',4,'inline_1','','','',1,0,'tx_styleguide_inline_expandsingle_child',11,''),('83aeea43aa2f611f58c884bef41b4786','tx_styleguide_elements_select',5,'flex_1','sSection/lDEF/section_1/el/1/container_1/el/select_tree_1/vDEF/','','',0,0,'pages',1,''),('83cfc8ed720653f4e563cce512f085cc','tx_styleguide_inline_usecombinationbox_mm',5,'l10n_parent','','','',0,0,'tx_styleguide_inline_usecombinationbox_mm',1,''),('83d234918b524c8c3348f819c6d43df7','tx_styleguide_inline_usecombination_mm',8,'sys_language_uid','','','',0,0,'sys_language',3,''),('841c1e31c72d607e212ea6d55909a21b','sys_file_reference',38,'uid_local','','','',0,0,'sys_file',3,''),('8435b72c733a83ad2a4b036bad51c4c5','tx_styleguide_inline_expandsingle_child',15,'l10n_source','','','',0,0,'tx_styleguide_inline_expandsingle_child',12,''),('85479616fc3366451cbb16f71f92662c','sys_file_reference',3,'uid_local','','','',0,0,'sys_file',1,''),('8558888604d2abea4bb0a723e91d8ed3','tx_styleguide_inline_usecombination_mm',5,'l10n_source','','','',0,0,'tx_styleguide_inline_usecombination_mm',1,''),('85840834019257494a28b98192a1d187','pages',80,'l10n_parent','','','',0,0,'pages',77,''),('85b26418f9cd6474d1c79c75f3dbad13','sys_file_reference',84,'uid_local','','','',0,0,'sys_file',1,''),('85b4eb30e3ae9988b3c8c164927460e7','pages',84,'l10n_parent','','','',0,0,'pages',82,''),('85e866a42850206545edaee277195a25','sys_file_reference',57,'sys_language_uid','','','',0,0,'sys_language',3,''),('86133b40801192e65e6032413a882ffa','tx_styleguide_elements_select',4,'flex_1','sSection/lDEF/section_1/el/1/container_1/el/select_multiplesidebyside_1/vDEF/','','',1,0,'tx_styleguide_staticdata',2,''),('866b149417572e98a87da3b18d3b91a4','tx_styleguide_elements_select',4,'flex_1','sMultiplesidebyside/lDEF/select_multiplesidebyside_1/vDEF/','','',1,0,'tx_styleguide_staticdata',2,''),('8670cccae4bf09792a2dea62e2f45d2f','pages',74,'l10n_parent','','','',0,0,'pages',72,''),('8675d27e5f205862e76ef759138c028a','sys_file_reference',40,'l10n_parent','','','',0,0,'sys_file_reference',10,''),('869e427be4caa2a4ce2bc1dc6f785300','sys_file_reference',88,'l10n_parent','','','',0,0,'sys_file_reference',82,''),('878c000e4acec8e5d228a3ffb3fc12d0','pages',19,'l10n_parent','','','',0,0,'pages',17,''),('87d36908addd3ed00a8069b0f6365dbb','tx_styleguide_inline_expand_inline_1_child',4,'sys_language_uid','','','',0,0,'sys_language',3,''),('880edbbd4a942a3df35dd5b692a1952a','tx_styleguide_elements_rte_inline_1_child',2,'l10n_source','','','',0,0,'tx_styleguide_elements_rte_inline_1_child',1,''),('88819f9317881794cebae485dad8b671','tx_styleguide_inline_expandsingle_child',5,'l10n_source','','','',0,0,'tx_styleguide_inline_expandsingle_child',2,''),('8891f4ed3143199bab08e45b21342f1f','pages',78,'sys_language_uid','','','',0,0,'sys_language',1,''),('89392fcd2fd9df56b0ec0b2aa23654a9','tx_styleguide_inline_expand',5,'inline_1','','','',0,0,'tx_styleguide_inline_expand_inline_1_child',5,''),('899affd9cf8f2c7dd84a64965f530c0a','tx_styleguide_inline_parentnosoftdelete',2,'inline_1','','','',2,0,'sys_file_reference',86,''),('89bd37162a55ba0de0ddc9ca80454db7','tx_styleguide_flex',2,'flex_3','sInline/lDEF/inline_1/vDEF/','','',0,0,'tx_styleguide_flex_flex_3_inline_1_child',2,''),('89c2e4c9c614cdc269e4c4ba8db1060c','tx_styleguide_inline_1n1n_childchild',3,'l10n_source','','','',0,0,'tx_styleguide_inline_1n1n_childchild',1,''),('89d2d1835d3d01ef3ae2be5e949c105d','tx_styleguide_inline_foreignrecorddefaults_child',4,'l10n_source','','','',0,0,'tx_styleguide_inline_foreignrecorddefaults_child',3,''),('89d8d7765b113a4700f78065425c7790','tx_styleguide_required_inline_2_child',3,'l10n_parent','','','',0,0,'tx_styleguide_required_inline_2_child',1,''),('89dd6e7d35df9ea74157b16545d9fceb','tx_styleguide_inline_usecombination_mm',6,'sys_language_uid','','','',0,0,'sys_language',2,''),('8a0e658e9648b21aa53e6f96dcfc5fad','tx_styleguide_inline_expandsingle_child',11,'l10n_parent','','','',0,0,'tx_styleguide_inline_expandsingle_child',2,''),('8a1cc0afee24c8fda86a6691326e1591','tx_styleguide_inline_1n1n_child',3,'inline_1','','','',0,0,'tx_styleguide_inline_1n1n_childchild',3,''),('8a1f332fd59ddf4cd7c42cbf99cd6f28','tx_styleguide_required_inline_3_child',4,'sys_language_uid','','','',0,0,'sys_language',3,''),('8a28b26c1d99796053952dce01b6aa4c','pages',80,'sys_language_uid','','','',0,0,'sys_language',3,''),('8a4ad51e95ec642cf30d660340036148','tx_styleguide_elements_group',2,'group_db_1','','','',3,0,'be_users',5,''),('8a4e0b9b94d5cb36dd2d3292b7d0d944','pages',53,'sys_language_uid','','','',0,0,'sys_language',1,''),('8a97b14bb593460a3225a20d8ed9e487','tx_styleguide_elements_t3editor',2,'t3editor_flex_1','sInline/lDEF/inline_1/vDEF/','','',0,0,'tx_styleguide_elements_t3editor_flex_1_inline_1_child',2,''),('8aa4d567f106ac08ae0a75a8c9a76512','pages',124,'l10n_parent','','','',0,0,'pages',122,''),('8acd6417c6856c92c050e5ab42683cc7','pages',109,'l10n_parent','','','',0,0,'pages',107,''),('8ace1b70390e217f8b8bae6e38162d1b','tx_styleguide_inline_fal',4,'inline_2','','','',0,0,'sys_file_reference',54,''),('8b14288ff886747f1d57562fa14602ec','tx_styleguide_inline_1n_child',5,'l10n_source','','','',0,0,'tx_styleguide_inline_1n_child',4,''),('8b2d32d2cc3be291a1928a2ccb5f02c5','pages',38,'l10n_parent','','','',0,0,'pages',37,''),('8b574d2de9908dde9415c655c9dd60aa','tx_styleguide_inline_fal',2,'inline_3','','','',2,0,'sys_file_reference',29,''),('8b6ed2c73c27d19b5ee519b9ee83d625','tx_styleguide_inline_fal',5,'inline_4','','','',0,0,'sys_file_reference',75,''),('8b94d5595f7cf43e2ab38f5ae46e20c7','tx_styleguide_inline_1n1n_childchild',4,'l10n_source','','','',0,0,'tx_styleguide_inline_1n1n_childchild',3,''),('8b964b5dfa9c2fe85b135c565305b521','tx_styleguide_elements_group',4,'group_db_8','','','',0,0,'tx_styleguide_staticdata',1,''),('8b97dbc733574e99978de166fed5390f','tx_styleguide_elements_select',4,'select_tree_5','','','',2,0,'pages',12,''),('8baaba66ead69395184ef51654afe124','sys_file_reference',92,'sys_language_uid','','','',0,0,'sys_language',3,''),('8bf969de2d51983d036ebb1e5d15735d','pages',75,'sys_language_uid','','','',0,0,'sys_language',3,''),('8bfb10d77d76f0e71269340b39817df7','tx_styleguide_required_rte_2_child',5,'l10n_source','','','',0,0,'tx_styleguide_required_rte_2_child',4,''),('8c03475a32b7489715f01c658054c36b','tx_styleguide_inline_usecombination_mm',3,'sys_language_uid','','','',0,0,'sys_language',1,''),('8c3066f868eb7431fee6d56c3e76f277','sys_file_reference',21,'uid_local','','','',0,0,'sys_file',1,''),('8c8b93bd3ab412fa102e9c1769c3116a','tx_styleguide_elements_select',5,'select_tree_3','','','',0,0,'pages',1,''),('8c9541ffa28678e5fec8be5549925b24','tx_styleguide_elements_group',5,'group_db_9','','','',0,0,'be_groups',1,''),('8d0135294b644454dfc4c4000cd6bd0c','tx_styleguide_inline_expand_inline_1_child',5,'select_tree_1','','','',1,0,'pages',7,''),('8d5a448498bcb1a12bdb10a60fc5feea','tx_styleguide_inline_usecombinationbox_mm',7,'select_child','','','',0,0,'tx_styleguide_inline_usecombinationbox_child',1,''),('8d7a9b448a67fd10692ec49f01eefd12','tx_styleguide_inline_1n1n',2,'inline_1','','','',0,0,'tx_styleguide_inline_1n1n_child',2,''),('8d7f03d30d32124c178ced108e34df9c','tx_styleguide_required',3,'sys_language_uid','','','',0,0,'sys_language',2,''),('8e0598a991f2e2a14abcab97dd894c63','sys_file_reference',28,'sys_language_uid','','','',0,0,'sys_language',1,''),('8e1b3ce0342576bbe809bf2d7d87c81f','tx_styleguide_inline_1n',2,'l10n_source','','','',0,0,'tx_styleguide_inline_1n',1,''),('8e3dcecd4d9c1c2255fa2083201f1a41','tx_styleguide_inline_usecombination_mm',7,'select_child','','','',0,0,'tx_styleguide_inline_usecombination_child',1,''),('8e47df42a14e319bb612ea8632d23deb','pages',71,'l10n_parent','','','',0,0,'pages',67,''),('8e70f6ca2b431f519c0c8e8057f65ebd','tx_styleguide_inline_expand_inline_1_child',3,'l10n_parent','','','',0,0,'tx_styleguide_inline_expand_inline_1_child',1,''),('8e738eebeb4b95c3722ca03f93e977db','pages',88,'sys_language_uid','','','',0,0,'sys_language',1,''),('8e75ffcdf6cdccde61be98e779463649','tx_styleguide_inline_fal',3,'inline_1','','','',1,0,'sys_file_reference',37,''),('8eace5dc14b93d5c51fa21a21e023534','tx_styleguide_elements_special',2,'l10n_source','','','',0,0,'tx_styleguide_elements_special',1,''),('8eaee4175657affdadda5ca9959675cb','tx_styleguide_valuesdefault',4,'sys_language_uid','','','',0,0,'sys_language',3,''),('8ec3e45187b878caa2438a3b029a0e06','tx_styleguide_inline_1nnol10n',2,'l10n_source','','','',0,0,'tx_styleguide_inline_1nnol10n',1,''),('8ed2402b673070277aa3ef9955dc30dd','pages',39,'sys_language_uid','','','',0,0,'sys_language',2,''),('8f9f6159aa3075d87dc89bf0e7fece83','sys_file_reference',89,'sys_language_uid','','','',0,0,'sys_language',2,''),('8fa4f8b8d611432433549f26bd016901','tx_styleguide_elements_group',4,'group_db_1','','','',3,0,'be_users',5,''),('8fac643e2de6b21d16b70b77df20a36c','tx_styleguide_inline_expandsingle_child',8,'l10n_source','','','',0,0,'tx_styleguide_inline_expandsingle_child',2,''),('8ff0e5e6daf0c275a86f41b3f7fa2ffe','tx_styleguide_required',2,'select_5','','','',1,0,'pages',7,''),('9010904f6bd5bfd6bc8b8eb7efb81061','tx_styleguide_inline_expand_inline_1_child',2,'select_tree_1','','','',1,0,'pages',7,''),('90389966bca1075d6ec5760f1e7e2a18','tx_styleguide_elements_select',2,'select_tree_1','','','',0,0,'pages',1,''),('90389f7efda5d92a307715bf4ce668d3','sys_file_reference',46,'sys_language_uid','','','',0,0,'sys_language',2,''),('9051d85b7d4ba929178b01ab758ea188','tx_styleguide_inline_mn',5,'l10n_source','','','',0,0,'tx_styleguide_inline_mn',4,''),('907a71795b5401e4d183a9a7b366d377','tx_styleguide_elements_select',2,'select_multiplesidebyside_6','','','',1,0,'tx_styleguide_staticdata',2,''),('9089f483e253b01d44a96d49c7a080c6','pages',120,'sys_language_uid','','','',0,0,'sys_language',3,''),('90a190fb8396e29511ec3c01ea5552e8','tx_styleguide_inline_usecombinationbox_mm',6,'select_child','','','',0,0,'tx_styleguide_inline_usecombinationbox_child',2,''),('90b006cb78ac696bfc4dc7e49ffb98ab','tx_styleguide_elements_rte_inline_1_child',4,'sys_language_uid','','','',0,0,'sys_language',3,''),('90e9b63456df6007fedc5468470aa608','tx_styleguide_inline_usecombination',4,'sys_language_uid','','','',0,0,'sys_language',3,''),('91c28eee77139b9f43328f86845c3edd','sys_file_reference',22,'uid_local','','','',0,0,'sys_file',2,''),('91db26050124fe072b2451d29cb5f23e','tx_styleguide_elements_select',3,'select_tree_2','','','',0,0,'pages',7,''),('9229ec8c54fbed21e0dfee9b8aaccb27','tx_styleguide_elements_select',4,'select_tree_4','','','',0,0,'pages',1,''),('92d9807334b2e6b1c43c619eaa368066','pages',5,'sys_language_uid','','','',0,0,'sys_language',3,''),('92de34ce21911d76b05c796f63ec1df3','tx_styleguide_valuesdefault',4,'l10n_source','','','',0,0,'tx_styleguide_valuesdefault',3,''),('9361d28c33344a1f12c2c434e73c9b90','tx_styleguide_inline_mnsymmetric',4,'l10n_parent','','','',0,0,'tx_styleguide_inline_mnsymmetric',1,''),('9396b776591f7d0d6cbd5bb4127660a6','tx_styleguide_flex',3,'l10n_source','','','',0,0,'tx_styleguide_flex',1,''),('94079c30e180d66a2784867f9bdcd570','pages',106,'l10n_parent','','','',0,0,'pages',102,''),('9472027f2225b435ae01cceef0c7e5c0','tx_styleguide_elements_group',4,'group_requestUpdate_1','','','',2,0,'be_users',4,''),('9472d74a6138009898a5cb20cbb32385','pages',48,'l10n_parent','','','',0,0,'pages',47,''),('947ec4ccc724dac47f1aea6491934793','tx_styleguide_required',2,'group_2','','','',0,0,'tx_styleguide_staticdata',1,''),('9487301b1f5aba202b3b61364c3e2fec','tx_styleguide_inline_expandsingle_child',7,'l10n_source','','','',0,0,'tx_styleguide_inline_expandsingle_child',1,''),('948e555b41b1825f8c8a7628d5c8390a','tx_styleguide_inline_parentnosoftdelete',4,'inline_1','','','',0,0,'sys_file_reference',90,''),('9493f4f29a7ebde3b4c5971c45f2ccc4','tx_styleguide_required',4,'inline_2','','','',0,0,'tx_styleguide_required_inline_2_child',4,''),('94b328d6b7cb6df5a7e160120bd848ba','tx_styleguide_elements_select',4,'select_tree_5','','','',1,0,'pages',7,''),('95077c79ed800f8850d12064bcf9b597','tx_styleguide_inline_mnsymmetric',19,'l10n_source','','','',0,0,'tx_styleguide_inline_mnsymmetric',18,''),('958bc21db8822f5d902f426e0ad32cde','tx_styleguide_elements_select',2,'select_tree_1','','','',2,0,'pages',12,''),('958fe31005c633ef042d3d333e4c7b07','tx_styleguide_elements_group',5,'group_db_5','','','',1,0,'be_users',5,''),('95f866cff0c953f41b2ccf0d81c177b9','tx_styleguide_inline_expand_inline_1_child',4,'l10n_source','','','',0,0,'tx_styleguide_inline_expand_inline_1_child',3,''),('960579f1d5d64c4ad09d86ffa48e13ac','tx_styleguide_inline_expand_inline_1_child',2,'sys_language_uid','','','',0,0,'sys_language',1,''),('96a94f3b9d689ca3442e2f4d3b5f5ef8','pages',110,'l10n_parent','','','',0,0,'pages',107,''),('96d0535a8f01d54e7423a5ae699d8c6f','sys_file_reference',12,'uid_local','','','',0,0,'sys_file',1,''),('9708d43da6206d127f0328244f4f5e77','tx_styleguide_inline_usecombinationbox_mm',3,'select_parent','','','',0,0,'tx_styleguide_inline_usecombinationbox',2,''),('974d208993f92517bbd0e76434a4882a','pages',60,'l10n_parent','','','',0,0,'pages',57,''),('9758d0bd1bce1bb16b42e0e9d2c251d9','tx_styleguide_inline_1n_child',3,'select_tree_1','','','',2,0,'pages',12,''),('976bde2c66528fe228f527ed842f4b18','sys_file_reference',2,'uid_local','','','',0,0,'sys_file',2,''),('977a99abf6da2f025b6551fae1f5c703','tx_styleguide_required_inline_3_child',3,'sys_language_uid','','','',0,0,'sys_language',2,''),('97833d807c5cfd430468873541b5294d','sys_file_reference',40,'uid_local','','','',0,0,'sys_file',2,''),('97b21e8620fd987166f5ef3f9af39301','pages',109,'sys_language_uid','','','',0,0,'sys_language',2,''),('97b9014645a37d80ddede7af0856a6c8','tx_styleguide_required_inline_2_child',4,'l10n_parent','','','',0,0,'tx_styleguide_required_inline_2_child',1,''),('97e9ca7f97575f460d8b649b33b8a448','tx_styleguide_valuesdefault',5,'sys_language_uid','','','',0,0,'sys_language',4,''),('981e180651294b7a8e56f74cbb594e23','pages',20,'l10n_parent','','','',0,0,'pages',17,''),('985bc3579e3b8ca9c681eb15ac4dd92b','tx_styleguide_required',4,'inline_3','','','',0,0,'tx_styleguide_required_inline_3_child',4,''),('987d58da08240382d188ad258bf9f4c2','sys_file_reference',16,'uid_local','','','',0,0,'sys_file',2,''),('988b756c35d2b351d87f5115ff806ff5','tx_styleguide_inline_1n_child',4,'l10n_parent','','','',0,0,'tx_styleguide_inline_1n_child',1,''),('98a43ad3a751482e68d01c80862a880e','tx_styleguide_elements_group',3,'group_db_9','','','',1,0,'be_groups',2,''),('98a5482648c807dfcd0654a48ca42648','tx_styleguide_inline_parentnosoftdelete',5,'l10n_source','','','',0,0,'tx_styleguide_inline_parentnosoftdelete',4,''),('98c9fd042b54da7a4ee56a804aa31a15','pages',91,'sys_language_uid','','','',0,0,'sys_language',4,''),('98cc550e326649765cb505212721fdb8','tx_styleguide_elements_select',5,'flex_1','sMultiplesidebyside/lDEF/select_multiplesidebyside_1/vDEF/','','',1,0,'tx_styleguide_staticdata',2,''),('99177ce719254d80fa4efffc0f594b9f','pages',120,'l10n_parent','','','',0,0,'pages',117,''),('9965652794dd66b8e3e1dcd2b2fa8b85','tx_styleguide_inline_mnsymmetric',9,'l10n_parent','','','',0,0,'tx_styleguide_inline_mnsymmetric',6,''),('998b97d158968f49ac5098ed7fc91314','sys_file_reference',9,'uid_local','','','',0,0,'sys_file',1,''),('9990055b8ca3320321652c26f2491101','tx_styleguide_inline_usecombinationbox_mm',6,'l10n_parent','','','',0,0,'tx_styleguide_inline_usecombinationbox_mm',2,''),('9a012bf7bea1c0c101a63fc752e92ce3','tx_styleguide_inline_usecombinationbox_mm',4,'l10n_source','','','',0,0,'tx_styleguide_inline_usecombinationbox_mm',2,''),('9a0642a5af7d39190cc02110ad51d717','sys_file_reference',42,'uid_local','','','',0,0,'sys_file',1,''),('9a4a02f236345b760aeb3913f2aa05e8','sys_file_reference',44,'uid_local','','','',0,0,'sys_file',3,''),('9a4b1e0883d8011b69c8a77ae8081b8b','tx_styleguide_elements_group',2,'group_requestUpdate_1','','','',2,0,'be_users',4,''),('9ab0a9aada51c4304e7279029b8757ca','tx_styleguide_inline_fal',5,'inline_flex_1','sInline/lDEF/fal/vDEF/','','',1,0,'sys_file_reference',79,''),('9ab13c81477caa7eeeeb54c4e8889a49','tx_styleguide_required_inline_1_child',4,'sys_language_uid','','','',0,0,'sys_language',3,''),('9add3e3650b9af9f1cee3f2a6eb40ad4','pages',25,'l10n_parent','','','',0,0,'pages',22,''),('9b3b80daaf9b2a5d810b34ec2dc941bf','tx_styleguide_inline_mnsymmetric',8,'sys_language_uid','','','',0,0,'sys_language',2,''),('9b3e08b4193881ed086581db82d31527','sys_file_reference',74,'sys_language_uid','','','',0,0,'sys_language',4,''),('9b4c9b94168a6d95dc0325a16f1cea93','tx_styleguide_elements_select',3,'l10n_source','','','',0,0,'tx_styleguide_elements_select',1,''),('9bdef185f1bc9d56aeac1147f976701d','tx_styleguide_elements_select',4,'select_single_12','','','',0,0,'tx_styleguide_elements_select_single_12_foreign',2,''),('9bfe4c443d6040de0d6536e9f885427b','tx_styleguide_inline_fal',3,'inline_2','','','',2,0,'sys_file_reference',41,''),('9c29d1aad1a5ba1511a5e33dca4af7d0','tx_styleguide_inline_fal',2,'inline_flex_1','sInline/lDEF/fal/vDEF/','','',0,0,'sys_file_reference',33,''),('9c43f69161efbfcdca9d391a916b4c0e','tx_styleguide_inline_expand_inline_1_child',3,'select_tree_1','','','',1,0,'pages',7,''),('9c44a3514c004e680647365a2fb77e5f','sys_file_reference',36,'uid_local','','','',0,0,'sys_file',1,''),('9c8ea432459b121b02497c7f21d8d81a','sys_file_reference',76,'uid_local','','','',0,0,'sys_file',2,''),('9caa8256a99e1a28b73acb55b352ceb9','tx_styleguide_required',2,'inline_1','','','',0,0,'tx_styleguide_required_inline_1_child',2,''),('9cac66a14bc8b4931831dd22b21c64fc','pages',78,'l10n_parent','','','',0,0,'pages',77,''),('9cd50d28893218fd8bea1149496ff2ae','tx_styleguide_elements_group',3,'group_db_8','','','',0,0,'tx_styleguide_staticdata',1,''),('9d40b5018f29a315f02b407d6044d7b7','tx_styleguide_inline_1n1n_child',4,'l10n_source','','','',0,0,'tx_styleguide_inline_1n1n_child',3,''),('9d5d466c2ff082628afe845c74ccc9ed','sys_file_reference',38,'sys_language_uid','','','',0,0,'sys_language',2,''),('9d6f876668eaf05e323a33171aed42b6','tx_styleguide_inline_fal',4,'inline_flex_1','sInline/lDEF/fal/vDEF/','','',2,0,'sys_file_reference',65,''),('9d77ce80d390f18685b44b65be601542','tx_styleguide_inline_usecombination_mm',6,'select_child','','','',0,0,'tx_styleguide_inline_usecombination_child',2,''),('9e1a6d274996c0197bd739ab9605f1ec','tx_styleguide_elements_special',4,'l10n_parent','','','',0,0,'tx_styleguide_elements_special',1,''),('9e4368b2cccd03d3977157deeb126734','pages',28,'l10n_parent','','','',0,0,'pages',27,''),('9ea1cfc94f303dd810bfa3cff144836b','tx_styleguide_inline_mm',4,'sys_language_uid','','','',0,0,'sys_language',3,''),('9ecfa9fe11cdee60f67112f665dd3503','pages',128,'sys_language_uid','','','',0,0,'sys_language',1,''),('9f224e0de0887a925ba64fb9dcb4cbfa','tx_styleguide_required',2,'rte_2','','','',0,0,'tx_styleguide_required_rte_2_child',2,''),('9f2427592dadab9c9232ba6f60e64726','tx_styleguide_inline_usecombinationbox',4,'sys_language_uid','','','',0,0,'sys_language',3,''),('9f5e9685483550823feda8526b8d5991','pages',58,'l10n_parent','','','',0,0,'pages',57,''),('9f60ce03803e24cbb9f4b3f65b638a20','tx_styleguide_required_inline_2_child',2,'sys_language_uid','','','',0,0,'sys_language',1,''),('9f70bc4d77ae999971b3ee61aed23dc4','tx_styleguide_elements_select',3,'select_tree_5','','','',1,0,'pages',7,''),('9f74efa11accc673c7e4701e5113b83a','pages',23,'l10n_parent','','','',0,0,'pages',22,''),('9fe8c8e51816c369c31d39f98eed25cc','tx_styleguide_inline_1n',4,'l10n_source','','','',0,0,'tx_styleguide_inline_1n',3,''),('a0208e5bf81f438e7e2e81214a70d5e3','tx_styleguide_inline_mm',3,'l10n_parent','','','',0,0,'tx_styleguide_inline_mm',1,''),('a102df8688b608916057ac4ad733be91','sys_file_reference',30,'sys_language_uid','','','',0,0,'sys_language',1,''),('a10a7f1df2a32bfa91f436f423628e1f','tx_styleguide_elements_select',2,'select_tree_3','','','',0,0,'pages',1,''),('a1110285c9836a99bcda3c8d7e773f99','pages',86,'l10n_parent','','','',0,0,'pages',82,''),('a11f07a0d38fa39fbb38e6ffd244f95d','pages',59,'l10n_parent','','','',0,0,'pages',57,''),('a16c0449285e27df98672377de020559','tx_styleguide_inline_parentnosoftdelete',4,'sys_language_uid','','','',0,0,'sys_language',3,''),('a16d2de2c3fb83457d1dcff392d22b83','tx_styleguide_required_inline_2_child',4,'sys_language_uid','','','',0,0,'sys_language',3,''),('a1cd4caaadebb62e5090ed36d54dcffa','tx_styleguide_inline_usecombinationbox_mm',9,'sys_language_uid','','','',0,0,'sys_language',4,''),('a1e9afad989f4e07560b4c6e7e2c1f1a','tx_styleguide_elements_rte_inline_1_child',3,'l10n_parent','','','',0,0,'tx_styleguide_elements_rte_inline_1_child',1,''),('a1ea871c9b18ce096979affa680a4f67','tx_styleguide_inline_mnsymmetric',3,'l10n_source','','','',0,0,'tx_styleguide_inline_mnsymmetric',1,''),('a2742ffddcca1424ba21f15fafdcdc56','sys_file_reference',77,'uid_local','','','',0,0,'sys_file',3,''),('a2abc73b5c8f35d23657faee922d4a9d','tx_styleguide_elements_select',2,'flex_1','sMultiplesidebyside/lDEF/select_multiplesidebyside_1/vDEF/','','',0,0,'tx_styleguide_staticdata',1,''),('a2c95ff8f485ebb619e8b851d28a0b22','tx_styleguide_elements_group',3,'l10n_source','','','',0,0,'tx_styleguide_elements_group',1,''),('a2d62edc2c13207024dab309894d2200','sys_file_reference',26,'uid_local','','','',0,0,'sys_file',3,''),('a320d82024695801207c36b187418b4d','tx_styleguide_inline_11',5,'l10n_source','','','',0,0,'tx_styleguide_inline_11',4,''),('a360647423e215a8689df00cd425f257','tx_styleguide_elements_group',3,'group_requestUpdate_1','','','',0,0,'be_groups',1,''),('a3cdd6c1475279c6554be334f02c043a','sys_file_reference',24,'sys_language_uid','','','',0,0,'sys_language',1,''),('a4271fe0f36f44bf4de4da3291368652','pages',111,'sys_language_uid','','','',0,0,'sys_language',4,''),('a486d41adceac16c2c508b274be14ba0','pages',116,'sys_language_uid','','','',0,0,'sys_language',4,''),('a537a14a42f4c1152b135217a9b8276f','tx_styleguide_elements_select',4,'select_tree_2','','','',1,0,'pages',12,''),('a53af5a08b4b6540efb89158e2b7179f','tx_styleguide_elements_group',3,'group_db_1','','','',0,0,'be_groups',1,''),('a546196c69a8aa160f354e1154aca9de','tx_styleguide_elements_select',2,'flex_1','sSection/lDEF/section_1/el/1/container_1/el/select_tree_1/vDEF/','','',0,0,'pages',1,''),('a54c77e32dcb4ebf22bf6edae1e61ead','tx_styleguide_inline_fal',4,'inline_4','','','',0,0,'sys_file_reference',60,''),('a5746712c8406028d8018414c1a7a288','tx_styleguide_elements_group',4,'flex_1','sDb/lDEF/group_db_1/vDEF/','','',0,0,'tx_styleguide_staticdata',1,''),('a578724f1f9e65c6005f855fe166db44','tx_styleguide_inline_usecombinationbox_mm',8,'select_parent','','','',0,0,'tx_styleguide_inline_usecombinationbox',4,''),('a5a6ef9c079657221e6dc9e629ab3e0e','tx_styleguide_inline_usecombinationbox_mm',9,'select_parent','','','',0,0,'tx_styleguide_inline_usecombinationbox',5,''),('a5b0eb15d61a06c14d0c4612716fd255','sys_file_reference',41,'l10n_parent','','','',0,0,'sys_file_reference',11,''),('a63d6674570a7f7b0818f44a9467ec8c','pages',19,'sys_language_uid','','','',0,0,'sys_language',2,''),('a65eb1134753540e141018bebb64adea','tx_styleguide_required_rte_2_child',5,'sys_language_uid','','','',0,0,'sys_language',4,''),('a6ab7d585a0e0a540aff758bbc26b41e','pages',118,'l10n_parent','','','',0,0,'pages',117,''),('a6bdb5ab093ce159a98a5cca0b37892d','tx_styleguide_inline_foreignrecorddefaults_child',4,'l10n_parent','','','',0,0,'tx_styleguide_inline_foreignrecorddefaults_child',1,''),('a74861d39675eac89552c3886104dbd7','tx_styleguide_elements_select',4,'select_tree_1','','','',0,0,'pages',1,''),('a76e89e6905d0739027ef7e020a32fc7','tx_styleguide_required_rte_2_child',2,'l10n_source','','','',0,0,'tx_styleguide_required_rte_2_child',1,''),('a7d2e984b353051b5be348291260f44b','tx_styleguide_elements_select',2,'flex_1','sMultiplesidebyside/lDEF/select_multiplesidebyside_1/vDEF/','','',1,0,'tx_styleguide_staticdata',2,''),('a806c780f767c221f1675e8d7751f53f','tx_styleguide_elements_rte',2,'rte_inline_1','','','',0,0,'tx_styleguide_elements_rte_inline_1_child',2,''),('a80fccb1cefe3c6724ab1c30c177842f','sys_file_reference',51,'sys_language_uid','','','',0,0,'sys_language',3,''),('a81fa924a8859c78cfa1a9399ddce23f','pages',15,'sys_language_uid','','','',0,0,'sys_language',3,''),('a83b0477502c2707b1a834d77c5d927e','pages',8,'l10n_parent','','','',0,0,'pages',7,''),('a87c7338492ce711f0ee9c854183e79a','tx_styleguide_inline_1n_child',4,'group_db_1','','','',0,0,'tx_styleguide_staticdata',1,''),('a8cb534af8df2f3c96cd3f9c67aa2db4','tx_styleguide_inline_usecombination_mm',6,'l10n_source','','','',0,0,'tx_styleguide_inline_usecombination_mm',2,''),('a8f1d797e24e88e48a2419cd4e402b58','tx_styleguide_inline_fal',4,'l10n_source','','','',0,0,'tx_styleguide_inline_fal',3,''),('a8f91ce61c1994cdb71a0ca7b57425b7','tx_styleguide_required',5,'inline_2','','','',0,0,'tx_styleguide_required_inline_2_child',5,''),('a91e2b561cd9d312818828ec49af4864','tx_styleguide_elements_select',5,'flex_1','sTree/lDEF/select_tree_1/vDEF/','','',2,0,'pages',12,''),('a9421d36c2da9a6733eef0bc08a2a8ed','tx_styleguide_elements_select',4,'select_tree_1','','','',2,0,'pages',12,''),('a9c2d069dca1bd8f2a05ec088c801241','tx_styleguide_inline_usecombinationbox',2,'inline_1','','','',1,0,'tx_styleguide_inline_usecombinationbox_mm',4,''),('a9d87b652db54dffe53d4bb41c7f4667','tx_styleguide_inline_usecombination_mm',9,'select_parent','','','',0,0,'tx_styleguide_inline_usecombination',5,''),('a9da987e6ec939c2538c53043be0d0d6','tx_styleguide_required_rte_2_child',3,'sys_language_uid','','','',0,0,'sys_language',2,''),('aacce38debf83f349e70ce51f8a145a1','tx_styleguide_elements_rte_inline_1_child',5,'sys_language_uid','','','',0,0,'sys_language',4,''),('aaece584d7c5dec587f61081fb2ac0e3','sys_file_reference',23,'sys_language_uid','','','',0,0,'sys_language',1,''),('aaf53b699a82a4e50634afa51167b1a3','sys_file_reference',57,'l10n_parent','','','',0,0,'sys_file_reference',12,''),('ab1b755906e3f2c937bb893a52d657eb','tx_styleguide_elements_select',3,'select_tree_1','','','',1,0,'pages',7,''),('ac5b877a60dab13dc9dfd8b41fc8036d','tx_styleguide_inline_expandsingle',3,'inline_1','','','',1,0,'tx_styleguide_inline_expandsingle_child',8,''),('ac5daebf0e44360aacdc3b123b1c1f38','tx_styleguide_inline_usecombinationbox_mm',6,'l10n_source','','','',0,0,'tx_styleguide_inline_usecombinationbox_mm',2,''),('ac6cd330aa99f0b86ade1ff9d5fb7898','tx_styleguide_inline_mnsymmetric',12,'l10n_source','','','',0,0,'tx_styleguide_inline_mnsymmetric',11,''),('ac967ed8874266e39a9f6e90b228a201','tx_styleguide_elements_group',2,'group_db_7','','','',1,0,'be_users',5,''),('acb2f34afa001d8a651e440334e24b2f','tx_styleguide_elements_t3editor_inline_1_child',4,'l10n_source','','','',0,0,'tx_styleguide_elements_t3editor_inline_1_child',3,''),('ad1dee87f4420b23eb1995cc507ce10c','tx_styleguide_elements_group',5,'group_db_7','','','',1,0,'be_users',5,''),('ad5c7169406d6c1cc7c8a052070d4f7b','tx_styleguide_elements_select',2,'l10n_source','','','',0,0,'tx_styleguide_elements_select',1,''),('ad955aeaa9a8214c7fb8203a7b8eb232','tx_styleguide_inline_mnsymmetric',4,'sys_language_uid','','','',0,0,'sys_language',3,''),('ada806cc2ccc1dd2d755af0275a5885a','tx_styleguide_elements_t3editor_inline_1_child',2,'l10n_source','','','',0,0,'tx_styleguide_elements_t3editor_inline_1_child',1,''),('adfe4cdcfc1a768d2f96936d2a2f179f','tx_styleguide_inline_expand_inline_1_child',2,'l10n_source','','','',0,0,'tx_styleguide_inline_expand_inline_1_child',1,''),('ae5762316fe6c26f4cbed9af5f95a25e','tx_styleguide_inline_usecombinationbox_mm',8,'select_child','','','',0,0,'tx_styleguide_inline_usecombinationbox_child',2,''),('aee74ce60f46b931f730ec3b1055d2e6','sys_file_reference',35,'uid_local','','','',0,0,'sys_file',3,''),('af1851f193935105fcf44fd408d523d5','pages',133,'sys_language_uid','','','',0,0,'sys_language',1,''),('af31d13bf85d226e6297596b36f93086','tx_styleguide_inline_parentnosoftdelete',3,'inline_1','','','',2,0,'sys_file_reference',89,''),('afa70eee34ea1fb357db4b7c35c4e06a','tx_styleguide_elements_select',2,'flex_1','sSection/lDEF/section_1/el/1/container_1/el/select_tree_1/vDEF/','','',1,0,'pages',7,''),('b0033942653171d2ff4fdce91530429f','tx_styleguide_elements_select',3,'flex_1','sSection/lDEF/section_1/el/1/container_1/el/select_tree_1/vDEF/','','',1,0,'pages',7,''),('b041d0aa31e5866984afbc87c12493e1','pages',76,'l10n_parent','','','',0,0,'pages',72,''),('b0679c9a484eb4742022636d6fe27c91','tx_styleguide_required',4,'l10n_parent','','','',0,0,'tx_styleguide_required',1,''),('b14c8c1434b26bcbda180bb3ca2fec8c','pages',111,'l10n_parent','','','',0,0,'pages',107,''),('b154c9b03ed31e7a29277460f1d3ed00','pages',88,'l10n_parent','','','',0,0,'pages',87,''),('b176a78c2f8c9e88c0b6bb59ccd90857','sys_file_reference',27,'uid_local','','','',0,0,'sys_file',1,''),('b1a601c640c114868d79e3f666dee99d','sys_file_reference',60,'l10n_parent','','','',0,0,'sys_file_reference',15,''),('b1bec8d7604a805b2b2f2219d8b77aea','tx_styleguide_inline_1n_child',3,'select_tree_1','','','',0,0,'pages',1,''),('b1c14d8943951fd400a2753d28544490','tx_styleguide_elements_group',5,'group_requestUpdate_1','','','',0,0,'be_groups',1,''),('b1d1f92f9678fdf07952feacaaf0e0ed','tx_styleguide_inline_usecombinationbox_mm',7,'l10n_parent','','','',0,0,'tx_styleguide_inline_usecombinationbox_mm',1,''),('b211a7d370d359df90eebf2639b14663','sys_file_reference',45,'sys_language_uid','','','',0,0,'sys_language',2,''),('b22587cbdcb10a1d6349f3418532171d','pages',53,'l10n_parent','','','',0,0,'pages',52,''),('b24477fc40eb669e0d9edfc3a9c34a1b','pages',108,'sys_language_uid','','','',0,0,'sys_language',1,''),('b2e26989d21ae1e1613ef68bf6296ade','pages',128,'l10n_parent','','','',0,0,'pages',127,''),('b2fdfeccf5c9e0e953039bdac4f40870','sys_file_reference',43,'sys_language_uid','','','',0,0,'sys_language',2,''),('b30d5efdd772ae951031a6c29c5cb899','tx_styleguide_elements_select',5,'l10n_source','','','',0,0,'tx_styleguide_elements_select',4,''),('b31781f9ed5578bfcb4beed463c519d4','tx_styleguide_elements_group',4,'group_db_5','','','',1,0,'be_users',5,''),('b36750709741c02770823bd2af1bec72','pages',51,'l10n_parent','','','',0,0,'pages',47,''),('b39a26d9c616385728669fc0534d8e00','sys_file_reference',54,'l10n_parent','','','',0,0,'sys_file_reference',9,''),('b3a7c7a701ac752d99adf3d85c5c9f18','pages',43,'l10n_parent','','','',0,0,'pages',42,''),('b3cb93ee73fd566f54e4e75b3c73c3fc','pages',30,'l10n_parent','','','',0,0,'pages',27,''),('b40f6d533273ce513c52c198189aa5d7','tx_styleguide_inline_fal',3,'inline_3','','','',1,0,'sys_file_reference',43,''),('b45d3925109a019176ec67e2489d7adb','tx_styleguide_elements_group',4,'l10n_parent','','','',0,0,'tx_styleguide_elements_group',1,''),('b4a731e469408bf4851fe8b9a0f6a43b','pages',11,'l10n_parent','','','',0,0,'pages',7,''),('b4e0fd818e11ed5ffec234645b7fd66f','tx_styleguide_elements_group',3,'group_db_5','','','',1,0,'be_users',5,''),('b4e180ae51f8fb2a62df74f451c6cb44','tx_styleguide_valuesdefault',3,'l10n_source','','','',0,0,'tx_styleguide_valuesdefault',1,''),('b51da5c7934988b2a1afbccf2fbc9633','tx_styleguide_inline_fal',2,'inline_1','','','',2,0,'sys_file_reference',23,''),('b5388481792874144f29278d5301517e','pages',114,'l10n_parent','','','',0,0,'pages',112,''),('b561d956c56be591a04d2ec22ea25b80','tx_styleguide_required',3,'inline_3','','','',0,0,'tx_styleguide_required_inline_3_child',3,''),('b5f6b98dfb7e105c3a2612f38868aca4','sys_file_reference',26,'sys_language_uid','','','',0,0,'sys_language',1,''),('b6589ec8101c70c3a315a51d8570d970','tx_styleguide_palette',3,'sys_language_uid','','','',0,0,'sys_language',2,''),('b6919c68c2b09fa11014b39de7911b98','pages',69,'sys_language_uid','','','',0,0,'sys_language',2,''),('b6bb8242d6f094b3576381d7e8412e6c','tx_styleguide_inline_mnsymmetric',5,'sys_language_uid','','','',0,0,'sys_language',4,''),('b6d5b71212fd3db81ffb4bf9b022d1fc','pages',110,'sys_language_uid','','','',0,0,'sys_language',3,''),('b6f09bc31beb793023f602c3d7300667','pages',61,'sys_language_uid','','','',0,0,'sys_language',4,''),('b76cce59620577674af1ec63411b6ab9','sys_file_reference',68,'sys_language_uid','','','',0,0,'sys_language',4,''),('b860c95a7cf012467e4fc633576b26ee','pages',40,'sys_language_uid','','','',0,0,'sys_language',3,''),('b86e7007b65c243fd79f4c71587d6fc4','tx_styleguide_elements_group',5,'group_db_1','','','',3,0,'be_users',5,''),('b8b38cd580e73658b7e799678964d8b9','tx_styleguide_inline_1n1n',2,'l10n_source','','','',0,0,'tx_styleguide_inline_1n1n',1,''),('b8dd98da7c2fbd7720ebf38ae0ad4866','tx_styleguide_inline_mm',3,'l10n_source','','','',0,0,'tx_styleguide_inline_mm',1,''),('b92f02d3bd9f2d5aefa1b4bc4c376b01','tx_styleguide_elements_select',5,'select_tree_4','','','',0,0,'pages',1,''),('b999fe8dcd7a5ac4c274889ec7eaa491','tx_styleguide_inline_expand',4,'l10n_parent','','','',0,0,'tx_styleguide_inline_expand',1,''),('bb09320a01348fea4caa64fc5790a91f','sys_file_reference',55,'uid_local','','','',0,0,'sys_file',2,''),('bb25b4bf04d10372fae6b8444ba8c85b','tx_styleguide_elements_select',2,'select_tree_4','','','',2,0,'pages',12,''),('bb516ff0c7cc02178189374062126428','tx_styleguide_required_rte_2_child',4,'sys_language_uid','','','',0,0,'sys_language',3,''),('bb5ab9d8bbb907a92e014927ebc8cad4','tx_styleguide_inline_mngroup',5,'sys_language_uid','','','',0,0,'sys_language',4,''),('bb9d43bc47b0eff6ff89800b0c7a3beb','tx_styleguide_required',4,'select_5','','','',0,0,'pages',1,''),('bbca9dc1e95b776d3668ab44ac3ee6cd','tx_styleguide_elements_group',4,'group_db_2','','','',3,0,'be_users',5,''),('bc01d496cadb8b995898566b05574369','tx_styleguide_required',5,'l10n_source','','','',0,0,'tx_styleguide_required',4,''),('bc82f16628812dea9c634867ebec3e8f','tx_styleguide_inline_expandsingle_child',7,'l10n_parent','','','',0,0,'tx_styleguide_inline_expandsingle_child',1,''),('bc8918b60e5bd5d19d84caf73702c255','tx_styleguide_inline_fal',5,'inline_flex_1','sInline/lDEF/fal/vDEF/','','',2,0,'sys_file_reference',80,''),('bca3671759232e73ee78fd383a09b314','tx_styleguide_inline_usecombinationbox_mm',10,'sys_language_uid','','','',0,0,'sys_language',4,''),('bcc921e003da199d4210e875f4e75edc','sys_file_reference',59,'l10n_parent','','','',0,0,'sys_file_reference',14,''),('bce254d147151291131961977cd1adb5','tx_styleguide_inline_fal',2,'inline_2','','','',2,0,'sys_file_reference',26,''),('bd1d8417f1676c2e1a8faf7252d82b2f','tx_styleguide_inline_fal',3,'l10n_source','','','',0,0,'tx_styleguide_inline_fal',1,''),('bd5abdeb617f4c135a255ae406f03257','tx_styleguide_inline_foreignrecorddefaults',4,'l10n_source','','','',0,0,'tx_styleguide_inline_foreignrecorddefaults',3,''),('be502d800784d2f6616f579e925a3d64','tx_styleguide_required',3,'l10n_source','','','',0,0,'tx_styleguide_required',1,''),('be7fd310a51e35b4079cf5194628f41a','tx_styleguide_palette',4,'sys_language_uid','','','',0,0,'sys_language',3,''),('bec32de0dd64ca83ff03fe54e067994c','tx_styleguide_inline_expand_inline_1_child',4,'select_tree_1','','','',1,0,'pages',7,''),('bee22b10131e0eef6609a21a0c367347','tx_styleguide_required',5,'group_1','','','',0,0,'tx_styleguide_staticdata',1,''),('bf19da605a1eb9e962dd682b61f0cbf6','tx_styleguide_elements_group',2,'l10n_source','','','',0,0,'tx_styleguide_elements_group',1,''),('bf342fd6e635a49f0ade0fccf34c8c1b','tx_styleguide_inline_foreignrecorddefaults_child',3,'l10n_source','','','',0,0,'tx_styleguide_inline_foreignrecorddefaults_child',1,''),('bf8470e108f9c54ef3e0888c06be72dd','tx_styleguide_inline_expand_inline_1_child',4,'select_tree_1','','','',0,0,'pages',1,''),('bfa72838b8a84294e99000b240dfaa2e','tx_styleguide_inline_fal',2,'inline_2','','','',1,0,'sys_file_reference',25,''),('c03d2e0e467a5818afb4527e6f855fb4','sys_file_reference',43,'uid_local','','','',0,0,'sys_file',2,''),('c0b361ce65ea65c75d8f6686fe6a5006','pages',70,'sys_language_uid','','','',0,0,'sys_language',3,''),('c1367aa64956926b44d236a3028d70d2','tx_styleguide_required',4,'rte_2','','','',0,0,'tx_styleguide_required_rte_2_child',4,''),('c13acfbd0178be92402035babbd0fa57','tx_styleguide_inline_fal',3,'inline_4','','','',1,0,'sys_file_reference',46,''),('c1a540b4376c26c1dddca571bf17392c','tx_styleguide_required_inline_2_child',4,'l10n_source','','','',0,0,'tx_styleguide_required_inline_2_child',3,''),('c1a61d916f69e1426edd58a78926d183','sys_file_reference',70,'uid_local','','','',0,0,'sys_file',2,''),('c1ad5a47d14877c14b2c2dcd8d64c74e','tx_styleguide_inline_1nnol10n',4,'l10n_parent','','','',0,0,'tx_styleguide_inline_1nnol10n',1,''),('c1b2026544bc60663915638088d41cdb','tx_styleguide_inline_parentnosoftdelete',2,'inline_1','','','',1,0,'sys_file_reference',85,''),('c1c5c68ba5b06840989672c5508cba08','sys_file_reference',85,'sys_language_uid','','','',0,0,'sys_language',1,''),('c1c635d51dd82580e48eae407b71961a','tx_styleguide_inline_expandsingle',4,'l10n_parent','','','',0,0,'tx_styleguide_inline_expandsingle',1,''),('c22bdd1831c0d828e6491a6244565958','tx_styleguide_elements_group',5,'group_db_9','','','',2,0,'be_users',4,''),('c27db7042da40ee89e9d2002012c1cab','tx_styleguide_inline_usecombination',5,'sys_language_uid','','','',0,0,'sys_language',4,''),('c2ece0210949c55c66c04adc6103d836','tx_styleguide_elements_group',3,'group_db_7','','','',0,0,'be_users',4,''),('c2f42eb38ea38f681984a19a1895fac4','pages',41,'l10n_parent','','','',0,0,'pages',37,''),('c323d65e3ae9a76d47be1406adeced4f','tx_styleguide_elements_select',4,'select_tree_1','','','',1,0,'pages',7,''),('c36f8d843d75b0c683daf6e020211414','tx_styleguide_inline_usecombinationbox',4,'inline_1','','','',1,0,'tx_styleguide_inline_usecombinationbox_mm',8,''),('c391a6dd4e94f6e53e98856563cb8d9c','tx_styleguide_inline_parentnosoftdelete',4,'l10n_parent','','','',0,0,'tx_styleguide_inline_parentnosoftdelete',1,''),('c3d113963c8bb10ed169345026731f4b','tx_styleguide_required_inline_1_child',4,'l10n_parent','','','',0,0,'tx_styleguide_required_inline_1_child',1,''),('c3efdb5e06f8807ff4422840352c3449','pages',84,'sys_language_uid','','','',0,0,'sys_language',2,''),('c43d9eb9a214ef18813ef177e3d5aad3','tx_styleguide_required',5,'inline_3','','','',0,0,'tx_styleguide_required_inline_3_child',5,''),('c475829223aaf8cb5e0c74379bcbe0d7','tx_styleguide_inline_1n_child',5,'select_tree_1','','','',1,0,'pages',7,''),('c475f82050e21313fff73ef1d8f1453f','tx_styleguide_inline_expand',4,'l10n_source','','','',0,0,'tx_styleguide_inline_expand',3,''),('c4816152897dd353f6e585861d6b5006','pages',131,'sys_language_uid','','','',0,0,'sys_language',4,''),('c48eb82fb5132dcfd5de13dd3957aee5','tx_styleguide_elements_group',4,'group_db_2','','','',1,0,'be_groups',2,''),('c49596f6eb15a51203e2ef8fb2d145fd','tx_styleguide_inline_1n_child',5,'select_tree_1','','','',0,0,'pages',1,''),('c52ac104124755681bb23def2c989217','tx_styleguide_inline_parentnosoftdelete',3,'inline_1','','','',1,0,'sys_file_reference',88,''),('c535bd6e829564ed395dd75692046141','pages',126,'l10n_parent','','','',0,0,'pages',122,''),('c54bd75684273d3e37d26266b7df5fbe','pages',33,'l10n_parent','','','',0,0,'pages',32,''),('c54fb690a694057db2617820b666262e','tx_styleguide_elements_group',5,'group_db_5','','','',0,0,'be_users',4,''),('c5bc98dd4d38b3fe44ecc41c9e1acf8c','tx_styleguide_inline_mn',2,'sys_language_uid','','','',0,0,'sys_language',1,''),('c5c116c6300c9002efd8a88315505b54','tx_styleguide_elements_group',5,'group_db_3','','','',0,0,'tx_styleguide_staticdata',1,''),('c5d5be8059014232b1e2d3cb9d8b3a6b','tx_styleguide_elements_group',5,'group_db_2','','','',1,0,'be_groups',2,''),('c643c419ac2f4aaef874ee57ea632e98','pages',95,'l10n_parent','','','',0,0,'pages',92,''),('c6847a620ad0c62a7d3986d7ffbf6ef7','tx_styleguide_inline_usecombination_mm',10,'sys_language_uid','','','',0,0,'sys_language',4,''),('c6901f9fdb9164ad42d8046cf08353b8','tx_styleguide_inline_expandsingle_child',6,'l10n_source','','','',0,0,'tx_styleguide_inline_expandsingle_child',3,''),('c6d4644f0427b8061fbe9d695d2b07f6','tx_styleguide_elements_select',3,'select_tree_3','','','',0,0,'pages',1,''),('c6f28366d1e765b63d80fc78f0bae4e5','tx_styleguide_elements_group',2,'group_db_1','','','',0,0,'be_groups',1,''),('c70bebedc48b0d1ff1656da0aacd86a1','tx_styleguide_inline_expand',5,'l10n_source','','','',0,0,'tx_styleguide_inline_expand',4,''),('c70d7cf6048b64f6bbf30412cb90f76c','pages',118,'sys_language_uid','','','',0,0,'sys_language',1,''),('c792ddea63a66c81c2b7b262c248f77d','tx_styleguide_elements_select',3,'flex_1','sMultiplesidebyside/lDEF/select_multiplesidebyside_1/vDEF/','','',0,0,'tx_styleguide_staticdata',1,''),('c79c52e90029fb262a94725bec029e37','sys_file_reference',87,'sys_language_uid','','','',0,0,'sys_language',2,''),('c7b6bd10e32c0f3e7b5b53e8f85c33c6','tx_styleguide_required_rte_2_child',2,'sys_language_uid','','','',0,0,'sys_language',1,''),('c809fc9c856a4cb0d1172d5930bb8231','pages',64,'sys_language_uid','','','',0,0,'sys_language',2,''),('c8648be2853d17dc8299cc95f0f2df74','tx_styleguide_inline_fal',3,'inline_flex_1','sInline/lDEF/fal/vDEF/','','',0,0,'sys_file_reference',48,''),('c898932e429fb188726fc8c30bab2bb6','tx_styleguide_inline_usecombinationbox_mm',3,'sys_language_uid','','','',0,0,'sys_language',1,''),('c8a951d5991e27a7a4e04562d7e35a07','tx_styleguide_required',2,'flex_2','sInline/lDEF/inline_1/vDEF/','','',0,0,'tx_styleguide_required_flex_2_inline_1_child',2,''),('c8d16d9f030c9c7e41e07e9aa86449dd','tx_styleguide_elements_select',3,'select_single_3','','','',0,0,'tx_styleguide_staticdata',-2,''),('c8d4d28a20b06e82750d5520e5f52498','tx_styleguide_elements_group',2,'group_db_5','','','',1,0,'be_users',5,''),('c90dec561784ec397f808f6a7580e361','sys_file_reference',56,'l10n_parent','','','',0,0,'sys_file_reference',11,''),('c91f840d6d72e3a1ce0ff7c7bd57990b','tx_styleguide_elements_group',4,'group_db_1','','','',0,0,'be_groups',1,''),('c9569c8ace0c7b9337cc79887125c33d','tx_styleguide_inline_expand_inline_1_child',5,'select_tree_1','','','',0,0,'pages',1,''),('c973d9b0e91d4f3f85dba6e34b0b2a35','tx_styleguide_palette',3,'l10n_source','','','',0,0,'tx_styleguide_palette',1,''),('c9ea623f6ff45590a2843bc8650254dd','tx_styleguide_required',4,'inline_1','','','',0,0,'tx_styleguide_required_inline_1_child',4,''),('c9f6c1b0d7e9cdc495bb577d636212b5','tx_styleguide_elements_select',2,'select_single_3','','','',0,0,'tx_styleguide_staticdata',-2,''),('ca4823e1bb39b3cf264191435b504ff1','pages',23,'sys_language_uid','','','',0,0,'sys_language',1,''),('ca90c7313e533c159961ffa107e9be68','sys_file_reference',66,'sys_language_uid','','','',0,0,'sys_language',4,''),('cab3769dda7320422b04951cd38b9861','sys_file_reference',67,'sys_language_uid','','','',0,0,'sys_language',4,''),('cafb46de821433efb88ce70e23f0be46','sys_file_reference',76,'sys_language_uid','','','',0,0,'sys_language',4,''),('cb19f047110522a5844221fd264ca952','pages',29,'sys_language_uid','','','',0,0,'sys_language',2,''),('cb89b8b1febe70acb86f1f83a6a33dab','sys_file_reference',47,'uid_local','','','',0,0,'sys_file',3,''),('cbe63b129f5c149838bee5b1eb323a73','sys_file_reference',61,'uid_local','','','',0,0,'sys_file',2,''),('cbf1bbdc27126d8053930998a5110927','pages',66,'l10n_parent','','','',0,0,'pages',62,''),('cbf30975d57148434e4f2898ae5527c7','tx_styleguide_inline_expand_inline_1_child',5,'l10n_source','','','',0,0,'tx_styleguide_inline_expand_inline_1_child',4,''),('cc1913a2fed45be2243c3cf83db569d7','tx_styleguide_elements_rte',3,'rte_flex_1','sInline/lDEF/inline_1/vDEF/','','',0,0,'tx_styleguide_elements_rte_flex_1_inline_1_child',3,''),('cc1e6f04b2ed969bc5f4e5c38f151478','tx_styleguide_elements_basic',4,'l10n_source','','','',0,0,'tx_styleguide_elements_basic',3,''),('cc4d289d475b42fdb4eebd93efe4630d','tx_styleguide_elements_group',5,'group_db_1','','','',2,0,'be_users',4,''),('cc63c43ed7398cb5c5a512d5a8b36cb5','pages',56,'l10n_parent','','','',0,0,'pages',52,''),('cca855d55b837c84d8c27d991f19b3a0','tx_styleguide_inline_usecombinationbox_mm',4,'sys_language_uid','','','',0,0,'sys_language',1,''),('cccccb82bf9995ee742e598293cd30bb','tx_styleguide_inline_usecombination_mm',9,'l10n_source','','','',0,0,'tx_styleguide_inline_usecombination_mm',7,''),('ccce99f53e1864e9c59c0021ae063471','tx_styleguide_inline_mnsymmetric',17,'sys_language_uid','','','',0,0,'sys_language',1,''),('cd6bfef58810761d496ca37f40272aa6','sys_file_reference',24,'uid_local','','','',0,0,'sys_file',1,''),('cdad2dd49ca731ddb81f9e3520c228c8','tx_styleguide_elements_select',2,'flex_1','sTree/lDEF/select_tree_1/vDEF/','','',1,0,'pages',7,''),('cdaf246f812e634c31e12f101c61c5e9','tx_styleguide_inline_mnsymmetric',12,'sys_language_uid','','','',0,0,'sys_language',1,''),('cdbb503dfea9788424eb740489ea06bd','tx_styleguide_required',3,'group_2','','','',0,0,'tx_styleguide_staticdata',1,''),('cdc34d041a8a3b7201aea1f1e13481d4','tx_styleguide_inline_usecombination_mm',7,'l10n_source','','','',0,0,'tx_styleguide_inline_usecombination_mm',5,''),('ce55ce615db1c50d94767d5078a2b57d','tx_styleguide_valuesdefault',3,'l10n_parent','','','',0,0,'tx_styleguide_valuesdefault',1,''),('ce8462020b245d64e21b99174b4b4a4c','sys_file_reference',89,'uid_local','','','',0,0,'sys_file',3,''),('ce95b9740b7dc2f3d932fb6e5f1181ae','tx_styleguide_elements_select',3,'flex_1','sSection/lDEF/section_1/el/1/container_1/el/select_multiplesidebyside_1/vDEF/','','',0,0,'tx_styleguide_staticdata',1,''),('cfbd7a47867529d1dee2ecbd3959e191','tx_styleguide_inline_usecombination_mm',3,'l10n_source','','','',0,0,'tx_styleguide_inline_usecombination_mm',1,''),('cfdc1d2fcd1225b409ab117c1deac474','pages',65,'sys_language_uid','','','',0,0,'sys_language',3,''),('d005be9957c64487c1c9113027872749','sys_file_reference',27,'sys_language_uid','','','',0,0,'sys_language',1,''),('d024df2bddd0f827af443a141fb94f33','sys_file_reference',67,'uid_local','','','',0,0,'sys_file',2,''),('d08fcd3d1350d1cf00013e3f4e826869','tx_styleguide_required',5,'sys_language_uid','','','',0,0,'sys_language',4,''),('d0af868dfceee7a3ef7e4d737149fc67','tx_styleguide_inline_usecombination',5,'inline_1','','','',0,0,'tx_styleguide_inline_usecombination_mm',9,''),('d0f5afc6c7a0a7fc4f3d27969e22bb84','sys_file_reference',52,'l10n_parent','','','',0,0,'sys_file_reference',7,''),('d1346ca9338262ff3c1b9406f82bcb61','tx_styleguide_elements_select',5,'select_tree_5','','','',2,0,'pages',12,''),('d14164a103757770c4d02802639b4afc','pages',91,'l10n_parent','','','',0,0,'pages',87,''),('d158ecda8971c31f13bc605c88c8ecad','tx_styleguide_inline_usecombinationbox_mm',10,'select_parent','','','',0,0,'tx_styleguide_inline_usecombinationbox',5,''),('d15d6863932d3144be39584be9284889','tx_styleguide_elements_select',2,'flex_1','sTree/lDEF/select_tree_2/vDEF/','','',1,0,'pages',7,''),('d1857915ff3af2913f7e188ab09a4716','tx_styleguide_inline_1n',5,'l10n_source','','','',0,0,'tx_styleguide_inline_1n',4,''),('d1941576dcb91c5e1b43ae3974bd937d','tx_styleguide_inline_fal',4,'l10n_parent','','','',0,0,'tx_styleguide_inline_fal',1,''),('d1e71d5ccf9b2aa9cb2bfcae573762ac','tx_styleguide_elements_group',3,'flex_1','sDb/lDEF/group_db_1/vDEF/','','',0,0,'tx_styleguide_staticdata',1,''),('d21eced43695184b75e2934f5c999a74','tx_styleguide_elements_special',5,'l10n_source','','','',0,0,'tx_styleguide_elements_special',4,''),('d2495e3a4b3aaeab99c76bec1bb8f3c2','tx_styleguide_inline_foreignrecorddefaults',2,'l10n_source','','','',0,0,'tx_styleguide_inline_foreignrecorddefaults',1,''),('d2551441d37766a2b4817872182bd092','sys_file_reference',29,'sys_language_uid','','','',0,0,'sys_language',1,''),('d2797298c118a267c32970a44347c6c1','pages',98,'sys_language_uid','','','',0,0,'sys_language',1,''),('d286c199b86bb6b1c65b1fe70e11074b','tx_styleguide_elements_group',3,'group_db_1','','','',1,0,'be_groups',2,''),('d2a6f143ff8ea36c855f2d0c9ac4e54f','tx_styleguide_inline_mnsymmetric',18,'l10n_source','','','',0,0,'tx_styleguide_inline_mnsymmetric',16,''),('d2b35ca34ad1d4d07a49543944ff0870','tx_styleguide_inline_foreignrecorddefaults_child',5,'l10n_source','','','',0,0,'tx_styleguide_inline_foreignrecorddefaults_child',4,''),('d2c31259d2f6e2a9dfafcee64ac6c51b','sys_file_reference',28,'uid_local','','','',0,0,'sys_file',2,''),('d2df3bd29e26dd8e993812fe0f7f2708','tx_styleguide_elements_group',5,'group_db_9','','','',1,0,'be_groups',2,''),('d2eac083cb646f7e3313279f8d976852','tx_styleguide_elements_group',3,'group_db_2','','','',2,0,'be_users',4,''),('d35a01d72a9ef605c6b7fe65ae931814','tx_styleguide_elements_group',2,'flex_1','sDb/lDEF/group_db_1/vDEF/','','',0,0,'tx_styleguide_staticdata',1,''),('d35a6d3d0582e7f4747ecdd4c8f31f3e','pages',35,'sys_language_uid','','','',0,0,'sys_language',3,''),('d3b55b9d77872f045ea75e9f9dc34428','tx_styleguide_elements_select',3,'flex_1','sTree/lDEF/select_tree_2/vDEF/','','',0,0,'pages',1,''),('d3cc9f71e93f6d221879475c93de75cb','tx_styleguide_required_inline_3_child',4,'l10n_source','','','',0,0,'tx_styleguide_required_inline_3_child',3,''),('d3cdbcd1d90f0898a37c1113eb384525','tx_styleguide_inline_fal',5,'inline_1','','','',2,0,'sys_file_reference',68,''),('d3d3ac12b4a0828f2459fc93f29ee58c','sys_file_reference',68,'uid_local','','','',0,0,'sys_file',3,''),('d3de2b29f1ebd62459792816ba639df9','sys_file_reference',86,'uid_local','','','',0,0,'sys_file',3,''),('d3f685fc7f0cf9ac6aa6f4855b10463b','tx_styleguide_required_inline_3_child',3,'l10n_source','','','',0,0,'tx_styleguide_required_inline_3_child',1,''),('d41213626e64677cecb3518aba50325b','tx_styleguide_elements_select',4,'select_multiplesidebyside_6','','','',1,0,'tx_styleguide_staticdata',2,''),('d416f2db396bce4c66c16ba5c265244d','sys_file_reference',6,'uid_local','','','',0,0,'sys_file',1,''),('d43506c73ce94c95d01b93d7eb719cda','tx_styleguide_inline_1n1n',5,'l10n_source','','','',0,0,'tx_styleguide_inline_1n1n',4,''),('d43ec6a6cd67afb9575ba63a76719caf','tx_styleguide_elements_group',4,'group_db_9','','','',2,0,'be_users',4,''),('d479bfd4dd26e20cf4b0193a85d8333f','sys_file_reference',72,'sys_language_uid','','','',0,0,'sys_language',4,''),('d49b0d1e424e5dfab02bce92be24372d','pages',56,'sys_language_uid','','','',0,0,'sys_language',4,''),('d4b9a7a357d3cfae0b9e04c4a4c516e9','pages',135,'sys_language_uid','','','',0,0,'sys_language',3,''),('d4dc43b7de1a6503416163ac9d3f314b','pages',96,'l10n_parent','','','',0,0,'pages',92,''),('d4de08dc427a7605e4147343ed5893e3','tx_styleguide_inline_expandsingle_child',14,'l10n_source','','','',0,0,'tx_styleguide_inline_expandsingle_child',11,''),('d4e9948b237842250beefae0c4711fd6','tx_styleguide_elements_select',3,'select_tree_1','','','',2,0,'pages',12,''),('d5376e1bf8022ec82371de83b2326bec','pages',30,'sys_language_uid','','','',0,0,'sys_language',3,''),('d5d3ce402a43b1a25ecfab490b239ec4','sys_file_reference',50,'uid_local','','','',0,0,'sys_file',3,''),('d5de389b43a024b2ff12c012fce3e8ae','sys_file_reference',75,'sys_language_uid','','','',0,0,'sys_language',4,''),('d5e57a835e2bab7087f2bf69c01dfe3c','tx_styleguide_elements_select',2,'select_multiplesidebyside_6','','','',0,0,'tx_styleguide_staticdata',1,''),('d6aba3b249134e10dbdf9f85def845d9','sys_file_reference',91,'sys_language_uid','','','',0,0,'sys_language',3,''),('d6ac0a741d63a07c7d2e6f8c36a6e8b1','tx_styleguide_palette',4,'l10n_source','','','',0,0,'tx_styleguide_palette',3,''),('d6b3478913f781892eae1f2c2f6027f1','tx_styleguide_required',5,'inline_1','','','',0,0,'tx_styleguide_required_inline_1_child',5,''),('d7567d74eb60be42948bd77fb442bcba','tx_styleguide_inline_expand_inline_1_child',4,'select_tree_1','','','',2,0,'pages',12,''),('d77d9601c2470bc01115d964c6bdaf25','tx_styleguide_inline_1n1n_child',5,'l10n_source','','','',0,0,'tx_styleguide_inline_1n1n_child',4,''),('d78bc1389f041440a7cb68201ea9b182','tx_styleguide_elements_group',3,'group_db_9','','','',3,0,'be_users',5,''),('d7eabd7710e36ccbf73690a0674f8c81','tx_styleguide_inline_expand_inline_1_child',2,'select_tree_1','','','',2,0,'pages',12,''),('d8095a3792791b5495095bd8b3d3a690','tx_styleguide_inline_usecombination',5,'l10n_source','','','',0,0,'tx_styleguide_inline_usecombination',4,''),('d826e6eef0ecdf13510e6edd569621a2','tx_styleguide_elements_group',3,'group_db_2','','','',3,0,'be_users',5,''),('d83f6351c9e2114c3758ae7810398a5f','tx_styleguide_inline_expandsingle',2,'inline_1','','','',1,0,'tx_styleguide_inline_expandsingle_child',5,''),('d909450c9a46de637bea57f82f299f0b','tx_styleguide_inline_mnsymmetric',18,'sys_language_uid','','','',0,0,'sys_language',2,''),('d94534887056877705ac2f88e2d239d8','tx_styleguide_elements_rte',5,'rte_inline_1','','','',0,0,'tx_styleguide_elements_rte_inline_1_child',5,''),('d9b572e7f9185e37914acb5005a8ca1f','pages',119,'sys_language_uid','','','',0,0,'sys_language',2,''),('d9e5f692b0119c0fe00550bdbc33c717','tx_styleguide_inline_fal',3,'inline_1','','','',2,0,'sys_file_reference',38,''),('d9fb5d3ad1a13ad79610211bd48f53b6','tx_styleguide_elements_select',4,'flex_1','sTree/lDEF/select_tree_1/vDEF/','','',1,0,'pages',7,''),('da6a705f101639721d1917433a44279d','tx_styleguide_elements_basic',3,'l10n_source','','','',0,0,'tx_styleguide_elements_basic',1,''),('da77f8c7257bb0c9d1c7f0f10715483d','sys_file_reference',31,'sys_language_uid','','','',0,0,'sys_language',1,''),('da9abf2ff4622eb22cccefe5cda5e05d','sys_file_reference',29,'uid_local','','','',0,0,'sys_file',3,''),('dabcb81e78d9ca2e5665b90165764449','tx_styleguide_inline_expand_inline_1_child',3,'select_tree_1','','','',2,0,'pages',12,''),('daf1d7d958cf9586bd79c9eb59f125a8','pages',38,'sys_language_uid','','','',0,0,'sys_language',1,''),('db4baf80941f4fbefd06fb82f79c1e7b','tx_styleguide_inline_mn',4,'l10n_parent','','','',0,0,'tx_styleguide_inline_mn',1,''),('db4f45a2b1dd1e608972ea6b77ee5dfe','tx_styleguide_inline_fal',5,'l10n_source','','','',0,0,'tx_styleguide_inline_fal',4,''),('db823c8af61722c71a174376860671aa','tx_styleguide_elements_special',3,'l10n_parent','','','',0,0,'tx_styleguide_elements_special',1,''),('db98b32f0dacb821dd08d05af142d568','tx_styleguide_inline_1n1n_child',3,'l10n_parent','','','',0,0,'tx_styleguide_inline_1n1n_child',1,''),('dbdd5ad6accccd1810755eb4eef7becb','tx_styleguide_required',4,'select_5','','','',2,0,'pages',12,''),('dc3378bb5a6c3c6188e67a98763d8a26','tx_styleguide_elements_group',2,'group_db_9','','','',2,0,'be_users',4,''),('dcadc8270bf58d082ad8159084d9a712','tx_styleguide_inline_mnsymmetric',20,'l10n_source','','','',0,0,'tx_styleguide_inline_mnsymmetric',19,''),('dcf6e72bf654aca48f7fc5243468b150','tx_styleguide_inline_expandsingle',3,'inline_1','','','',0,0,'tx_styleguide_inline_expandsingle_child',7,''),('dd12ce07e7006a9d61d54f4fd658d812','sys_file_reference',93,'uid_local','','','',0,0,'sys_file',1,''),('dd4f7118698cd8687f0f76aa5330720d','sys_file_reference',53,'sys_language_uid','','','',0,0,'sys_language',3,''),('dd8d7cd8ca382f7de31811ce9dff7159','sys_file_reference',56,'uid_local','','','',0,0,'sys_file',3,''),('ddad9e5d57fddb516eda98a1e91416e2','tx_styleguide_inline_usecombination_mm',5,'select_child','','','',0,0,'tx_styleguide_inline_usecombination_child',1,''),('ddbf7458fedc2f73fb9acc044e232880','sys_file_reference',52,'uid_local','','','',0,0,'sys_file',2,''),('ddc690645ce1a07bee81b4ae710a68b0','pages',123,'l10n_parent','','','',0,0,'pages',122,''),('ddddf157f130c778f9ddacc9d0a88307','tx_styleguide_required_inline_1_child',3,'l10n_source','','','',0,0,'tx_styleguide_required_inline_1_child',1,''),('ddfb86bd4db33f5ae188c1f052687cd8','tx_styleguide_elements_t3editor',3,'l10n_source','','','',0,0,'tx_styleguide_elements_t3editor',1,''),('de4fd3168cce322dd5b577562dddd3eb','tx_styleguide_required_inline_3_child',2,'sys_language_uid','','','',0,0,'sys_language',1,''),('de6b744d34b27f6045489a8e07f219c4','tx_styleguide_flex',2,'l10n_source','','','',0,0,'tx_styleguide_flex',1,''),('de8ef16617c79770d01c849bad82274c','tx_styleguide_inline_mnsymmetric',14,'sys_language_uid','','','',0,0,'sys_language',3,''),('dec1dfc4513abbec784c7b62514f0f07','tx_styleguide_inline_1n_child',4,'select_tree_1','','','',1,0,'pages',7,''),('df27a1d8b32a38a908c6a7e7d5100881','sys_file_reference',49,'uid_local','','','',0,0,'sys_file',2,''),('df80bbf7ff076e8fad9a82d852b4f67c','pages',33,'sys_language_uid','','','',0,0,'sys_language',1,''),('dfa8a74f3b1f05d3f341aa0e73b27de8','tx_styleguide_inline_fal',4,'inline_flex_1','sInline/lDEF/fal/vDEF/','','',1,0,'sys_file_reference',64,''),('dfc1d0642e0f4ea89311430073055c15','tx_styleguide_elements_group',2,'group_db_2','','','',1,0,'be_groups',2,''),('e0fdfa1651801ac1e91a3abdec8b89b5','tx_styleguide_inline_1n',3,'l10n_source','','','',0,0,'tx_styleguide_inline_1n',1,''),('e129f4fa784193d8826475e37e4b60f7','tx_styleguide_inline_usecombination_mm',10,'l10n_source','','','',0,0,'tx_styleguide_inline_usecombination_mm',8,''),('e14f6921d89e29e4c8fc40a71401194e','tx_styleguide_inline_parentnosoftdelete',5,'inline_1','','','',2,0,'sys_file_reference',95,''),('e159e078acbe9b040e927f3c0a2b74fc','tx_styleguide_flex',5,'l10n_source','','','',0,0,'tx_styleguide_flex',4,''),('e16263d7fa3a82da6a2007547c7a8209','tx_styleguide_inline_usecombinationbox_mm',4,'select_parent','','','',0,0,'tx_styleguide_inline_usecombinationbox',2,''),('e1b3e7c93d741fd814aec3006c9ffdef','pages',90,'sys_language_uid','','','',0,0,'sys_language',3,''),('e1f752e8f4153e19353c42b3a9011ab9','sys_file_reference',71,'uid_local','','','',0,0,'sys_file',3,''),('e20ded184d73fae1aa8a435c09f68237','tx_styleguide_inline_usecombination_mm',9,'sys_language_uid','','','',0,0,'sys_language',4,''),('e2119553c58d8bfa7420097567e6b81c','tx_styleguide_elements_group',4,'group_db_5','','','',0,0,'be_users',4,''),('e250f2fc23368637cb1d662baa8d3ea3','sys_file_reference',32,'sys_language_uid','','','',0,0,'sys_language',1,''),('e2735628d20521554b5eaeb13f518350','pages',9,'l10n_parent','','','',0,0,'pages',7,''),('e29910575e2e9bd40cb84a8a4f604a95','tx_styleguide_inline_mngroup',3,'sys_language_uid','','','',0,0,'sys_language',2,''),('e2df80fe0421d1f35caed333481edce7','sys_file_reference',41,'uid_local','','','',0,0,'sys_file',3,''),('e340533086d7309d18bfec2df997c02b','tx_styleguide_elements_group',3,'group_requestUpdate_1','','','',3,0,'be_users',5,''),('e3641bfb8adfc61c9ffb1b18d3aaf07f','tx_styleguide_inline_1nnol10n',3,'inline_1','','','',0,0,'tx_styleguide_inline_1nnol10n_child',2,''),('e3f26482aa95cd9d62c6bb17791884dc','tx_styleguide_required',2,'l10n_source','','','',0,0,'tx_styleguide_required',1,''),('e42af95f200e03fd14ed10376017ba10','tx_styleguide_inline_mnsymmetric',20,'sys_language_uid','','','',0,0,'sys_language',4,''),('e4563c09ea58d760723fe2d1973824b6','pages',14,'sys_language_uid','','','',0,0,'sys_language',2,''),('e4a98163435cf619971f9915c3675160','tx_styleguide_required',4,'group_2','','','',0,0,'tx_styleguide_staticdata',1,''),('e4d7721480cfe9fa102f8555c17a5c19','tx_styleguide_elements_select',5,'select_single_12','','','',0,0,'tx_styleguide_elements_select_single_12_foreign',2,''),('e4f10a9b70ed6dea52cbc87e0729d5f4','tx_styleguide_elements_t3editor',4,'l10n_parent','','','',0,0,'tx_styleguide_elements_t3editor',1,''),('e5037bb5b55f1574e5c601692dcc4304','tx_styleguide_elements_group',4,'group_db_9','','','',0,0,'be_groups',1,''),('e5504857ca95649219a44a13f3009e1f','tx_styleguide_inline_usecombinationbox_mm',10,'select_child','','','',0,0,'tx_styleguide_inline_usecombinationbox_child',2,''),('e58b7039c700bb6b069532151acc07be','tx_styleguide_inline_usecombination_mm',4,'sys_language_uid','','','',0,0,'sys_language',1,''),('e5b9938270784b972f3f8d32a3bd299b','sys_file_reference',71,'sys_language_uid','','','',0,0,'sys_language',4,''),('e5fedff60f28c33b01ab1e29bfc0832c','pages',115,'sys_language_uid','','','',0,0,'sys_language',3,''),('e60f09645b52d90efaba06a7320b418f','tx_styleguide_inline_1n',2,'inline_1','','','',0,0,'tx_styleguide_inline_1n_child',2,''),('e62de4cb3978387015408abafe786715','pages',58,'sys_language_uid','','','',0,0,'sys_language',1,''),('e69b700e450244a975301dff3d99ac5b','tx_styleguide_inline_fal',2,'inline_4','','','',2,0,'sys_file_reference',32,''),('e6c425bb00d3bdd4373342a775f5b819','pages',95,'sys_language_uid','','','',0,0,'sys_language',3,''),('e70c99bfc2551e37110a37ad43ed1206','sys_file_reference',91,'l10n_parent','','','',0,0,'sys_file_reference',82,''),('e72e7f3e315c23c3fab43cc0d6df5a20','tx_styleguide_elements_t3editor',3,'t3editor_inline_1','','','',0,0,'tx_styleguide_elements_t3editor_inline_1_child',3,''),('e7cdc2e4c094172bf0a9dd1419dbd961','tx_styleguide_elements_select',4,'select_tree_5','','','',0,0,'pages',1,''),('e8144a8ce9ceb879a6320b6a3927fdcd','sys_file_reference',51,'uid_local','','','',0,0,'sys_file',1,''),('e82a606a8145b65bd79a8d6646d0dcbb','tx_styleguide_required',3,'inline_2','','','',0,0,'tx_styleguide_required_inline_2_child',3,''),('e845eb389095ceafe9773e23ae5e0862','tx_styleguide_inline_usecombination',2,'inline_1','','','',0,0,'tx_styleguide_inline_usecombination_mm',3,''),('e853bf070794ff60c7e1ed503379d183','tx_styleguide_required',5,'rte_2','','','',0,0,'tx_styleguide_required_rte_2_child',5,''),('e8588eec6e2ca66d22238760e70dc4f2','tx_styleguide_inline_fal',3,'inline_flex_1','sInline/lDEF/fal/vDEF/','','',2,0,'sys_file_reference',50,''),('e87f4f5f4644b85869fcb9578374fca4','tx_styleguide_required',2,'inline_3','','','',0,0,'tx_styleguide_required_inline_3_child',2,''),('e8e9a831e2bb10640ea1cb41ddc757a4','sys_file_reference',52,'sys_language_uid','','','',0,0,'sys_language',3,''),('e9ada562f5e2aba4ec942257a12fbdd5','tx_styleguide_elements_group',4,'group_requestUpdate_1','','','',1,0,'be_groups',2,''),('eab732f4ba2a3c9c369e83d02b5843c9','tx_styleguide_elements_rte',4,'l10n_source','','','',0,0,'tx_styleguide_elements_rte',3,''),('ead0221840fe0ada9e3a3b8c6c8d73df','tx_styleguide_inline_mnsymmetric',2,'sys_language_uid','','','',0,0,'sys_language',1,''),('ead578df264e1661bd7ae697ade7bf34','tx_styleguide_inline_usecombinationbox',4,'l10n_parent','','','',0,0,'tx_styleguide_inline_usecombinationbox',1,''),('eb1492a2a3bb18662c1a82a250e7d951','tx_styleguide_valuesdefault',4,'l10n_parent','','','',0,0,'tx_styleguide_valuesdefault',1,''),('eb63a55378544296f720afbc58cb7821','tx_styleguide_inline_1n_child',5,'select_tree_1','','','',2,0,'pages',12,''),('eb89425c440202e518319365802184f1','tx_styleguide_inline_1nnol10n',3,'l10n_source','','','',0,0,'tx_styleguide_inline_1nnol10n',1,''),('ec1bc34abc7597c90476b0d1f37e95ca','tx_styleguide_required',3,'inline_1','','','',0,0,'tx_styleguide_required_inline_1_child',3,''),('ec24aa755716879c31a61cc9e34f17d7','sys_file_reference',5,'uid_local','','','',0,0,'sys_file',3,''),('ec5bfdb8d52d0b91184690fd6a57c4cf','pages',45,'l10n_parent','','','',0,0,'pages',42,''),('eca8b618f116c707204544b6bba3d817','tx_styleguide_inline_1n_child',2,'group_db_1','','','',0,0,'tx_styleguide_staticdata',1,''),('ecd124d38ff7b8be6d876d95cb50331f','sys_file_reference',7,'uid_local','','','',0,0,'sys_file',2,''),('ed09f9d70f69a66800c2cb871a6da0c5','tx_styleguide_inline_parentnosoftdelete',4,'inline_1','','','',2,0,'sys_file_reference',92,''),('ed25feb36da9ee4135fcfae782c15e66','tx_styleguide_inline_expand',3,'l10n_parent','','','',0,0,'tx_styleguide_inline_expand',1,''),('eda73c90dafc985df71b0a6c0b5a069b','tx_styleguide_elements_group',3,'group_db_9','','','',2,0,'be_users',4,''),('ede007ee43171eb1e5bfa62995d12a36','tx_styleguide_elements_select',5,'flex_1','sTree/lDEF/select_tree_2/vDEF/','','',1,0,'pages',7,''),('eeae8ac6aa4d3701bee6f8b31fa3c91a','pages',130,'l10n_parent','','','',0,0,'pages',127,''),('efada7c1b29919a971c9bacce20ab68d','pages',99,'l10n_parent','','','',0,0,'pages',97,''),('efdb37b9cbd7ffe54c6c32b91dc65c40','tx_styleguide_inline_1n1n_child',4,'inline_1','','','',0,0,'tx_styleguide_inline_1n1n_childchild',4,''),('f008030f65e60e0ff6b11ffc1ea6af58','tx_styleguide_elements_select',4,'flex_1','sMultiplesidebyside/lDEF/select_multiplesidebyside_1/vDEF/','','',0,0,'tx_styleguide_staticdata',1,''),('f0259c7da34d1ed2f39f58b82d7e8a3b','pages',3,'l10n_parent','','','',0,0,'pages',2,''),('f0265406bc7faa9f2bdd5f2e34141faa','tx_styleguide_inline_mnsymmetric',13,'l10n_source','','','',0,0,'tx_styleguide_inline_mnsymmetric',11,''),('f03edef714efa1252d36c984819fc9d0','tx_styleguide_inline_parentnosoftdelete',4,'inline_1','','','',1,0,'sys_file_reference',91,''),('f06c2a725c00c7a1c0fb1347b440bb64','tx_styleguide_inline_fal',4,'inline_1','','','',2,0,'sys_file_reference',53,''),('f076e26c76d803dcb484c5e69eeefd64','tx_styleguide_elements_select',4,'flex_1','sTree/lDEF/select_tree_1/vDEF/','','',2,0,'pages',12,''),('f0888102e41c3425874fc0b9c47d3449','pages',44,'sys_language_uid','','','',0,0,'sys_language',2,''),('f08f4138a06be83fefe1bc06218895f6','pages',35,'l10n_parent','','','',0,0,'pages',32,''),('f0ca640c12bcf57545755e4a58cf73f8','tx_styleguide_inline_1n_child',2,'l10n_source','','','',0,0,'tx_styleguide_inline_1n_child',1,''),('f0dfed8de4828b435023e85b42cef79b','sys_file_reference',25,'uid_local','','','',0,0,'sys_file',2,''),('f0efc913f2aaff38f1a49cc6e72d90c8','pages',129,'sys_language_uid','','','',0,0,'sys_language',2,''),('f0f80f90519f905344c4cff0748fbe54','tx_styleguide_elements_t3editor_inline_1_child',4,'l10n_parent','','','',0,0,'tx_styleguide_elements_t3editor_inline_1_child',1,''),('f19dda39b05a98abc07af3eb17bf945f','pages',68,'l10n_parent','','','',0,0,'pages',67,''),('f1beb45fe69e4ecae8db1e1f0247cb41','sys_file_reference',38,'l10n_parent','','','',0,0,'sys_file_reference',8,''),('f1f3ae591c1800c93a82c49ae307a023','pages',34,'l10n_parent','','','',0,0,'pages',32,''),('f1f8eb5383a64fa6a6dc1671d2d56e68','tx_styleguide_elements_select',4,'l10n_source','','','',0,0,'tx_styleguide_elements_select',3,''),('f22fa296663c47e53ae4d9721b371d13','tx_styleguide_inline_mm',3,'sys_language_uid','','','',0,0,'sys_language',2,''),('f2828423f71e71b622601bb1f3d9fd8d','sys_file_reference',58,'sys_language_uid','','','',0,0,'sys_language',3,''),('f28ca681946c99127966935377b9f5db','tx_styleguide_elements_select',3,'flex_1','sSection/lDEF/section_1/el/1/container_1/el/select_tree_1/vDEF/','','',2,0,'pages',12,''),('f36bbc978fb9e230b49a410bf93f6d4f','tx_styleguide_elements_select',5,'select_single_3','','','',0,0,'tx_styleguide_staticdata',-2,''),('f389f25bdc46be8a6ec3692b98e1f1b9','tx_styleguide_inline_usecombination',2,'l10n_source','','','',0,0,'tx_styleguide_inline_usecombination',1,''),('f3be8adc27833574de5a06a626c511c8','tx_styleguide_required_rte_2_child',4,'l10n_parent','','','',0,0,'tx_styleguide_required_rte_2_child',1,''),('f3d448078fc29b737db21067ac16e1b7','tx_styleguide_inline_fal',2,'l10n_source','','','',0,0,'tx_styleguide_inline_fal',1,''),('f40bba1f39a105dc0a068218abe241b7','sys_file_reference',58,'uid_local','','','',0,0,'sys_file',2,''),('f40eae2fa72c077d781f579a6376cd1f','pages',34,'sys_language_uid','','','',0,0,'sys_language',2,''),('f412d35b85b845fed7aacbafa4b6520f','tx_styleguide_required_inline_3_child',2,'l10n_source','','','',0,0,'tx_styleguide_required_inline_3_child',1,''),('f463341a4bc0b471f9c6f0cf90a44c08','sys_file_reference',64,'uid_local','','','',0,0,'sys_file',2,''),('f47c13f8483c9fca8149dcccb19e891e','tx_styleguide_inline_fal',5,'inline_4','','','',1,0,'sys_file_reference',76,''),('f4b7279be2fe69b3e77c7f4ec28937b4','pages',99,'sys_language_uid','','','',0,0,'sys_language',2,''),('f4f499dc419f0326652cc001ba62aa49','tx_styleguide_elements_select',3,'select_tree_4','','','',1,0,'pages',7,''),('f5040d28c17b2497cd8caac3200caba2','tx_styleguide_inline_expandsingle_child',9,'l10n_source','','','',0,0,'tx_styleguide_inline_expandsingle_child',3,''),('f52e0dd4664a29a5e35272a00cc2cb61','tx_styleguide_elements_basic',5,'l10n_source','','','',0,0,'tx_styleguide_elements_basic',4,''),('f557e60e4f5a716bfe7522a64b7b2190','tx_styleguide_inline_mnsymmetric',7,'l10n_source','','','',0,0,'tx_styleguide_inline_mnsymmetric',6,''),('f5ac5b21b1be75d6999d54711c4b3b2b','pages',106,'sys_language_uid','','','',0,0,'sys_language',4,''),('f5b7851ebab86b22f143083f8cef66f4','sys_file_reference',95,'sys_language_uid','','','',0,0,'sys_language',4,''),('f5bfe369cfd5399372d71b874421ca2e','sys_file_reference',37,'l10n_parent','','','',0,0,'sys_file_reference',7,''),('f5cf016a7a4ad74771b0557884f9ff12','tx_styleguide_inline_mngroup',2,'sys_language_uid','','','',0,0,'sys_language',1,''),('f5d7096a6cae6df5989ee9aee5453b5c','tx_styleguide_elements_rte',3,'l10n_source','','','',0,0,'tx_styleguide_elements_rte',1,''),('f648f3dd7f33aefbdc759b85c2614831','tx_styleguide_inline_usecombination_mm',7,'select_parent','','','',0,0,'tx_styleguide_inline_usecombination',4,''),('f68808dffedff8b5509290b3911e1c26','tx_styleguide_inline_usecombination_mm',8,'l10n_parent','','','',0,0,'tx_styleguide_inline_usecombination_mm',2,''),('f6b9da0795c8d6abbe49f15d80ece70d','tx_styleguide_elements_select',5,'select_tree_1','','','',0,0,'pages',1,''),('f72b8104d3128ebb6ed8f0ad790b4ad3','tx_styleguide_valuesdefault',3,'sys_language_uid','','','',0,0,'sys_language',2,''),('f796a23f368a5dcd786b73760094d078','tx_styleguide_elements_select',3,'flex_1','sTree/lDEF/select_tree_1/vDEF/','','',1,0,'pages',7,''),('f7c2964587727c42932f6ec24913289a','tx_styleguide_inline_parentnosoftdelete',3,'inline_1','','','',0,0,'sys_file_reference',87,''),('f823bad8f25b0999872d794373200bf1','tx_styleguide_required_inline_2_child',5,'l10n_source','','','',0,0,'tx_styleguide_required_inline_2_child',4,''),('f838dd336b59ae4b91b559e1c4e9db87','tx_styleguide_palette',3,'l10n_parent','','','',0,0,'tx_styleguide_palette',1,''),('f84b880624a42e85c170a6d7a08eaa68','pages',8,'sys_language_uid','','','',0,0,'sys_language',1,''),('f8a981fb8a2b8e261e7bc08f0c31d71b','tx_styleguide_inline_usecombination_mm',10,'select_child','','','',0,0,'tx_styleguide_inline_usecombination_child',2,''),('f8ac684aa31c44202bd6f7f8ffe33815','tx_styleguide_inline_usecombinationbox_mm',4,'select_child','','','',0,0,'tx_styleguide_inline_usecombinationbox_child',2,''),('f8df11254827e8a478832cb90eb9d7ef','pages',50,'sys_language_uid','','','',0,0,'sys_language',3,''),('f987244759b6aeea99405facda814f5b','sys_file_reference',48,'uid_local','','','',0,0,'sys_file',1,''),('f9e6b21b183924e896ee6d4b1ce17dbf','pages',6,'l10n_parent','','','',0,0,'pages',2,''),('fa0d578d90eb62d7230fe2eb400abbdb','tx_styleguide_inline_usecombinationbox_mm',10,'l10n_source','','','',0,0,'tx_styleguide_inline_usecombinationbox_mm',8,''),('fa2bad75e938bb26f7231b7bc1e36e5f','tx_styleguide_inline_usecombinationbox',3,'sys_language_uid','','','',0,0,'sys_language',2,''),('fa34d081268717a67714624759a3655c','pages',24,'l10n_parent','','','',0,0,'pages',22,''),('fa4661151bb64d3e6db4938e8a6bb11e','tx_styleguide_inline_foreignrecorddefaults',3,'inline_1','','','',0,0,'tx_styleguide_inline_foreignrecorddefaults_child',3,''),('fa6b5c9f2f3fd95cbcae164305654a2f','sys_file_reference',21,'sys_language_uid','','','',0,0,'sys_language',1,''),('fad2018d818d690a896a06895bab9916','tx_styleguide_inline_foreignrecorddefaults',5,'inline_1','','','',0,0,'tx_styleguide_inline_foreignrecorddefaults_child',5,''),('fad203badc1ce19c7c6f5bf9db74b1b2','tx_styleguide_inline_mn',4,'l10n_source','','','',0,0,'tx_styleguide_inline_mn',3,''),('faf3a2e619b205ce2b88195d6104583e','tx_styleguide_inline_parentnosoftdelete',2,'sys_language_uid','','','',0,0,'sys_language',1,''),('fafb4cc78f5304ed93beba4c50d5081d','pages',25,'sys_language_uid','','','',0,0,'sys_language',3,''),('fb23e4713b44b1c6f899a9a989b5fbc3','tx_styleguide_inline_expandsingle_child',4,'l10n_source','','','',0,0,'tx_styleguide_inline_expandsingle_child',1,''),('fb4f1db8b7434e2711d5aa4ccf6edca8','sys_file_reference',81,'uid_local','','','',0,0,'sys_file',1,''),('fbc57094ced0cfa9ec4be5a88f5dbf7a','sys_file_reference',91,'uid_local','','','',0,0,'sys_file',2,''),('fbcaeb1c766578525a2db2c5a03daeff','pages',104,'l10n_parent','','','',0,0,'pages',102,''),('fbd730665c2ef7f13ef61730768cc203','tx_styleguide_flex',4,'flex_3','sInline/lDEF/inline_1/vDEF/','','',0,0,'tx_styleguide_flex_flex_3_inline_1_child',4,''),('fc237d974c9f7c0486a6f2a4c59cddb2','tx_styleguide_elements_select',5,'select_tree_1','','','',2,0,'pages',12,''),('fc4994bfff86fc8f8cac7fe066f2e380','sys_file_reference',8,'uid_local','','','',0,0,'sys_file',3,''),('fc8c9704a2ba1c21ba78738106c48c20','tx_styleguide_required',4,'flex_2','sInline/lDEF/inline_1/vDEF/','','',0,0,'tx_styleguide_required_flex_2_inline_1_child',4,''),('fca1e54bff3ae3f27e7897d836390b0f','sys_file_reference',62,'l10n_parent','','','',0,0,'sys_file_reference',17,''),('fca90dd8053fabda50f6532649ac0056','tx_styleguide_inline_1nnol10n',4,'l10n_source','','','',0,0,'tx_styleguide_inline_1nnol10n',3,''),('fcaabf37a9fa5233329a4d02abcc70e5','tx_styleguide_inline_expandsingle',5,'l10n_source','','','',0,0,'tx_styleguide_inline_expandsingle',4,''),('fcdd17a56e6d6d35d2330bb956019298','tx_styleguide_flex',5,'flex_3','sInline/lDEF/inline_1/vDEF/','','',0,0,'tx_styleguide_flex_flex_3_inline_1_child',5,''),('fcf248fe2dd91f42de6a34a5614aa5da','tx_styleguide_elements_group',4,'group_db_1','','','',2,0,'be_users',4,''),('fcf5df0691ad6c727bbb2a5f3c9b269f','tx_styleguide_elements_group',3,'group_db_5','','','',0,0,'be_users',4,''),('fd06a25af2c3f780bcf30449eabb08df','tx_styleguide_inline_foreignrecorddefaults_child',3,'l10n_parent','','','',0,0,'tx_styleguide_inline_foreignrecorddefaults_child',1,''),('fd15d59b72fb4176900336818d06afd3','tx_styleguide_elements_group',3,'group_db_2','','','',0,0,'be_groups',1,''),('fd517dd26c41c67b64455534f3344ae4','sys_file_reference',74,'uid_local','','','',0,0,'sys_file',3,''),('fd76ba6d14561343184f362d3cf045a5','tx_styleguide_inline_usecombinationbox_mm',5,'select_parent','','','',0,0,'tx_styleguide_inline_usecombinationbox',3,''),('fe0048fb69ee7f3693df635c0c1e6d64','sys_file_reference',43,'l10n_parent','','','',0,0,'sys_file_reference',13,''),('fe018198260a2066bc8d7781d3357583','sys_file_reference',66,'uid_local','','','',0,0,'sys_file',1,''),('fe2297620093556568e64e0a24c7fead','tx_styleguide_inline_fal',3,'inline_2','','','',1,0,'sys_file_reference',40,''),('ff4d06f55ed9a850dcecd51b167e041e','sys_file_reference',61,'l10n_parent','','','',0,0,'sys_file_reference',16,''),('ff5076057bda406c4caa193a8572fe38','tx_styleguide_required',5,'group_2','','','',0,0,'tx_styleguide_staticdata',1,''),('ff58cbe6fa9ec6a9357f35ed47d06ec7','tx_styleguide_required_inline_2_child',3,'sys_language_uid','','','',0,0,'sys_language',2,''),('ff6ed4f08dc0438998e7636eda85eb12','tx_styleguide_inline_usecombinationbox_mm',6,'sys_language_uid','','','',0,0,'sys_language',2,''),('ff7ab9a7a7ed4f802a4a3a0313741bab','tx_styleguide_elements_group',5,'l10n_source','','','',0,0,'tx_styleguide_elements_group',4,''),('ffc10abedd6b8b4a6b474865c85d2847','tx_styleguide_inline_1n1n_childchild',4,'l10n_parent','','','',0,0,'tx_styleguide_inline_1n1n_childchild',1,'');
/*!40000 ALTER TABLE `sys_refindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_registry`
--

DROP TABLE IF EXISTS `sys_registry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_registry` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_namespace` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `entry_key` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `entry_value` mediumblob DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `entry_identifier` (`entry_namespace`,`entry_key`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_registry`
--

LOCK TABLES `sys_registry` WRITE;
/*!40000 ALTER TABLE `sys_registry` DISABLE KEYS */;
INSERT INTO `sys_registry` VALUES (1,'installUpdate','TYPO3\\CMS\\Form\\Hooks\\FormFileExtensionUpdate','i:1;'),(2,'installUpdate','TYPO3\\CMS\\Install\\Updates\\RsaauthExtractionUpdate','i:1;'),(3,'installUpdate','TYPO3\\CMS\\Install\\Updates\\FeeditExtractionUpdate','i:1;'),(4,'installUpdate','TYPO3\\CMS\\Install\\Updates\\TaskcenterExtractionUpdate','i:1;'),(5,'installUpdate','TYPO3\\CMS\\Install\\Updates\\SysActionExtractionUpdate','i:1;'),(6,'installUpdate','TYPO3\\CMS\\Install\\Updates\\ShortcutRecordsMigration','i:1;'),(7,'installUpdate','TYPO3\\CMS\\Install\\Updates\\CollectionsExtractionUpdate','i:1;'),(8,'installUpdate','TYPO3\\CMS\\Felogin\\Updates\\MigrateFeloginPlugins','i:1;'),(9,'installUpdateRows','rowUpdatersDone','a:4:{i:0;s:69:\"TYPO3\\CMS\\Install\\Updates\\RowUpdater\\WorkspaceVersionRecordsMigration\";i:1;s:66:\"TYPO3\\CMS\\Install\\Updates\\RowUpdater\\L18nDiffsourceToJsonMigration\";i:2;s:77:\"TYPO3\\CMS\\Install\\Updates\\RowUpdater\\WorkspaceMovePlaceholderRemovalMigration\";i:3;s:76:\"TYPO3\\CMS\\Install\\Updates\\RowUpdater\\WorkspaceNewPlaceholderRemovalMigration\";}'),(10,'extensionDataImport','typo3/sysext/core/ext_tables_static+adt.sql','s:0:\"\";'),(11,'extensionDataImport','typo3/sysext/extbase/ext_tables_static+adt.sql','s:0:\"\";'),(12,'extensionDataImport','typo3/sysext/fluid/ext_tables_static+adt.sql','s:0:\"\";'),(13,'extensionDataImport','typo3/sysext/frontend/ext_tables_static+adt.sql','s:0:\"\";'),(14,'extensionDataImport','typo3/sysext/fluid_styled_content/ext_tables_static+adt.sql','s:0:\"\";'),(15,'extensionDataImport','typo3/sysext/filelist/ext_tables_static+adt.sql','s:0:\"\";'),(16,'extensionDataImport','typo3/sysext/impexp/ext_tables_static+adt.sql','s:0:\"\";'),(17,'extensionDataImport','typo3/sysext/form/ext_tables_static+adt.sql','s:0:\"\";'),(18,'extensionDataImport','typo3/sysext/install/ext_tables_static+adt.sql','s:0:\"\";'),(19,'extensionDataImport','typo3/sysext/recordlist/ext_tables_static+adt.sql','s:0:\"\";'),(20,'extensionDataImport','typo3/sysext/backend/ext_tables_static+adt.sql','s:0:\"\";'),(21,'extensionDataImport','typo3/sysext/setup/ext_tables_static+adt.sql','s:0:\"\";'),(22,'extensionDataImport','typo3/sysext/rte_ckeditor/ext_tables_static+adt.sql','s:0:\"\";'),(23,'extensionDataImport','typo3/sysext/belog/ext_tables_static+adt.sql','s:0:\"\";'),(24,'extensionDataImport','typo3/sysext/beuser/ext_tables_static+adt.sql','s:0:\"\";'),(25,'extensionDataImport','typo3/sysext/dashboard/ext_tables_static+adt.sql','s:0:\"\";'),(26,'extensionDataImport','typo3/sysext/extensionmanager/ext_tables_static+adt.sql','s:0:\"\";'),(27,'extensionDataImport','typo3/sysext/felogin/ext_tables_static+adt.sql','s:0:\"\";'),(28,'extensionDataImport','typo3/sysext/info/ext_tables_static+adt.sql','s:0:\"\";'),(29,'extensionDataImport','typo3/sysext/lowlevel/ext_tables_static+adt.sql','s:0:\"\";'),(30,'extensionDataImport','typo3/sysext/reports/ext_tables_static+adt.sql','s:0:\"\";'),(31,'extensionDataImport','typo3/sysext/seo/ext_tables_static+adt.sql','s:0:\"\";'),(32,'extensionDataImport','typo3/sysext/sys_note/ext_tables_static+adt.sql','s:0:\"\";'),(33,'extensionDataImport','typo3/sysext/t3editor/ext_tables_static+adt.sql','s:0:\"\";'),(34,'extensionDataImport','typo3/sysext/tstemplate/ext_tables_static+adt.sql','s:0:\"\";'),(35,'extensionDataImport','typo3/sysext/viewpage/ext_tables_static+adt.sql','s:0:\"\";'),(36,'extensionDataImport','typo3conf/ext/examples/ext_tables_static+adt.sql','s:0:\"\";'),(37,'extensionDataImport','typo3conf/ext/screenshots/ext_tables_static+adt.sql','s:0:\"\";'),(38,'extensionDataImport','typo3conf/ext/store_inventory/ext_tables_static+adt.sql','s:0:\"\";'),(39,'extensionDataImport','typo3conf/ext/styleguide/ext_tables_static+adt.sql','s:0:\"\";'),(41,'core','formProtectionSessionToken:3','s:64:\"83df34b010ae60ea822403d365de70da9eb8b01caa6b8cc545be30b642d11e98\";'),(42,'core','formProtectionSessionToken:1','s:64:\"7dc0e5c8b7fd31af8b7f7b2e6aa3eb95e70df553a82ce06b9dd9f47d697a96f8\";');
/*!40000 ALTER TABLE `sys_registry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_template`
--

DROP TABLE IF EXISTS `sys_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_template` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `root` smallint(5) unsigned NOT NULL DEFAULT 0,
  `clear` smallint(5) unsigned NOT NULL DEFAULT 0,
  `include_static_file` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `constants` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `config` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `basedOn` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  `includeStaticAfterBasedOn` smallint(5) unsigned NOT NULL DEFAULT 0,
  `static_file_mode` smallint(5) unsigned NOT NULL DEFAULT 0,
  `tx_impexp_origuid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `roottemplate` (`deleted`,`hidden`,`root`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_template`
--

LOCK TABLES `sys_template` WRITE;
/*!40000 ALTER TABLE `sys_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tt_content`
--

DROP TABLE IF EXISTS `tt_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tt_content` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rowDescription` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `starttime` int(10) unsigned NOT NULL DEFAULT 0,
  `endtime` int(10) unsigned NOT NULL DEFAULT 0,
  `fe_group` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `sorting` int(11) NOT NULL DEFAULT 0,
  `editlock` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l18n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l18n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `CType` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `header` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `header_position` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `bodytext` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `bullets_type` smallint(5) unsigned NOT NULL DEFAULT 0,
  `uploads_description` smallint(5) unsigned NOT NULL DEFAULT 0,
  `uploads_type` smallint(5) unsigned NOT NULL DEFAULT 0,
  `assets` int(10) unsigned NOT NULL DEFAULT 0,
  `image` int(10) unsigned NOT NULL DEFAULT 0,
  `imagewidth` int(10) unsigned NOT NULL DEFAULT 0,
  `imageorient` smallint(5) unsigned NOT NULL DEFAULT 0,
  `imagecols` smallint(5) unsigned NOT NULL DEFAULT 0,
  `imageborder` smallint(5) unsigned NOT NULL DEFAULT 0,
  `media` int(10) unsigned NOT NULL DEFAULT 0,
  `layout` int(10) unsigned NOT NULL DEFAULT 0,
  `frame_class` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `cols` int(10) unsigned NOT NULL DEFAULT 0,
  `space_before_class` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `space_after_class` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `records` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `pages` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `colPos` int(10) unsigned NOT NULL DEFAULT 0,
  `subheader` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `header_link` varchar(1024) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `image_zoom` smallint(5) unsigned NOT NULL DEFAULT 0,
  `header_layout` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `list_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sectionIndex` smallint(5) unsigned NOT NULL DEFAULT 0,
  `linkToTop` smallint(5) unsigned NOT NULL DEFAULT 0,
  `file_collections` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `filelink_size` smallint(5) unsigned NOT NULL DEFAULT 0,
  `filelink_sorting` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filelink_sorting_direction` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `target` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date` int(10) unsigned NOT NULL DEFAULT 0,
  `recursive` smallint(5) unsigned NOT NULL DEFAULT 0,
  `imageheight` int(10) unsigned NOT NULL DEFAULT 0,
  `pi_flexform` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `accessibility_title` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `accessibility_bypass` smallint(5) unsigned NOT NULL DEFAULT 0,
  `accessibility_bypass_text` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `selected_categories` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_field` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `table_class` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `table_caption` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `table_delimiter` smallint(5) unsigned NOT NULL DEFAULT 0,
  `table_enclosure` smallint(5) unsigned NOT NULL DEFAULT 0,
  `table_header_position` smallint(5) unsigned NOT NULL DEFAULT 0,
  `table_tfoot` smallint(5) unsigned NOT NULL DEFAULT 0,
  `tx_impexp_origuid` int(11) NOT NULL DEFAULT 0,
  `categories` int(11) NOT NULL DEFAULT 0,
  `tx_examples_noprint` smallint(6) NOT NULL DEFAULT 0,
  `tx_examples_separator` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `tx_examples_main_category` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`sorting`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`),
  KEY `language` (`l18n_parent`,`sys_language_uid`),
  KEY `translation_source` (`l10n_source`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tt_content`
--

LOCK TABLES `tt_content` WRITE;
/*!40000 ALTER TABLE `tt_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `tt_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_examples_dummy`
--

DROP TABLE IF EXISTS `tx_examples_dummy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_examples_dummy` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(11) NOT NULL DEFAULT 0,
  `crdate` int(11) NOT NULL DEFAULT 0,
  `cruser_id` int(11) NOT NULL DEFAULT 0,
  `deleted` smallint(6) NOT NULL DEFAULT 0,
  `hidden` smallint(6) NOT NULL DEFAULT 0,
  `record_type` smallint(6) NOT NULL DEFAULT 0,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `some_date` int(11) NOT NULL DEFAULT 0,
  `enforce_date` smallint(6) NOT NULL DEFAULT 0,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_examples_dummy`
--

LOCK TABLES `tx_examples_dummy` WRITE;
/*!40000 ALTER TABLE `tx_examples_dummy` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_examples_dummy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_examples_haiku`
--

DROP TABLE IF EXISTS `tx_examples_haiku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_examples_haiku` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(11) NOT NULL DEFAULT 0,
  `crdate` int(11) NOT NULL DEFAULT 0,
  `cruser_id` int(11) NOT NULL DEFAULT 0,
  `deleted` smallint(6) NOT NULL DEFAULT 0,
  `hidden` smallint(6) NOT NULL DEFAULT 0,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `poem` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` int(11) NOT NULL DEFAULT 0,
  `season` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `weirdness` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `color` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `angle` int(11) NOT NULL DEFAULT 0,
  `reference_page` int(11) NOT NULL DEFAULT 0,
  `related_records` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `related_content` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_examples_haiku`
--

LOCK TABLES `tx_examples_haiku` WRITE;
/*!40000 ALTER TABLE `tx_examples_haiku` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_examples_haiku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_examples_log`
--

DROP TABLE IF EXISTS `tx_examples_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_examples_log` (
  `request_id` varchar(13) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `time_micro` double NOT NULL DEFAULT 0,
  `component` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `level` smallint(5) unsigned NOT NULL DEFAULT 0,
  `message` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `request` (`request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_examples_log`
--

LOCK TABLES `tx_examples_log` WRITE;
/*!40000 ALTER TABLE `tx_examples_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_examples_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_extensionmanager_domain_model_extension`
--

DROP TABLE IF EXISTS `tx_extensionmanager_domain_model_extension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_extensionmanager_domain_model_extension` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `extension_key` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `repository` int(11) NOT NULL DEFAULT 1,
  `remote` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ter',
  `version` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `alldownloadcounter` int(10) unsigned NOT NULL DEFAULT 0,
  `downloadcounter` int(10) unsigned NOT NULL DEFAULT 0,
  `title` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT 0,
  `review_state` int(11) NOT NULL DEFAULT 0,
  `category` int(11) NOT NULL DEFAULT 0,
  `last_updated` int(10) unsigned NOT NULL DEFAULT 0,
  `serialized_dependencies` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `author_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `author_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ownerusername` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `md5hash` varchar(35) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `update_comment` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `authorcompany` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `integer_version` int(11) NOT NULL DEFAULT 0,
  `current_version` int(11) NOT NULL DEFAULT 0,
  `lastreviewedversion` int(11) NOT NULL DEFAULT 0,
  `documentation_link` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `versionextrepo` (`extension_key`,`version`,`remote`),
  KEY `index_extrepo` (`extension_key`,`remote`),
  KEY `index_versionrepo` (`integer_version`,`remote`,`extension_key`),
  KEY `index_currentversions` (`current_version`,`review_state`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_extensionmanager_domain_model_extension`
--

LOCK TABLES `tx_extensionmanager_domain_model_extension` WRITE;
/*!40000 ALTER TABLE `tx_extensionmanager_domain_model_extension` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_extensionmanager_domain_model_extension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_impexp_presets`
--

DROP TABLE IF EXISTS `tx_impexp_presets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_impexp_presets` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `user_uid` int(10) unsigned NOT NULL DEFAULT 0,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `public` smallint(6) NOT NULL DEFAULT 0,
  `item_uid` int(11) NOT NULL DEFAULT 0,
  `preset_data` blob DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `lookup` (`item_uid`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_impexp_presets`
--

LOCK TABLES `tx_impexp_presets` WRITE;
/*!40000 ALTER TABLE `tx_impexp_presets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_impexp_presets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_storeinventory_domain_model_product`
--

DROP TABLE IF EXISTS `tx_storeinventory_domain_model_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_storeinventory_domain_model_product` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_storeinventory_domain_model_product`
--

LOCK TABLES `tx_storeinventory_domain_model_product` WRITE;
/*!40000 ALTER TABLE `tx_storeinventory_domain_model_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_storeinventory_domain_model_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_elements_basic`
--

DROP TABLE IF EXISTS `tx_styleguide_elements_basic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_elements_basic` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `input_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_2` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_3` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_4` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_5` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_8` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_9` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_10` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_11` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_12` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_13` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_14` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_15` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_16` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_19` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_20` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_21` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_22` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_23` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_24` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_25` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_26` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_27` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_28` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_29` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_30` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_31` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_32` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_33` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_34` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_35` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_36` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_37` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_38` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_39` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_40` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_41` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_42` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `inputdatetime_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `inputdatetime_2` date DEFAULT NULL,
  `inputdatetime_3` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `inputdatetime_4` datetime DEFAULT NULL,
  `inputdatetime_5` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `inputdatetime_6` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `inputdatetime_7` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `inputdatetime_8` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `inputdatetime_9` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `inputdatetime_10` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_2` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_3` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_4` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_5` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_6` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_7` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_8` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_9` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_10` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_11` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_12` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_13` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_14` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_15` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_16` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_17` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_18` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_19` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `checkbox_1` int(11) NOT NULL DEFAULT 0,
  `checkbox_2` int(11) NOT NULL DEFAULT 0,
  `checkbox_3` int(11) NOT NULL DEFAULT 0,
  `checkbox_4` int(11) NOT NULL DEFAULT 0,
  `checkbox_6` int(11) NOT NULL DEFAULT 0,
  `checkbox_7` int(11) NOT NULL DEFAULT 0,
  `checkbox_8` int(11) NOT NULL DEFAULT 0,
  `checkbox_9` int(11) NOT NULL DEFAULT 0,
  `checkbox_10` int(11) NOT NULL DEFAULT 0,
  `checkbox_11` int(11) NOT NULL DEFAULT 0,
  `checkbox_12` int(11) NOT NULL DEFAULT 0,
  `checkbox_13` int(11) NOT NULL DEFAULT 0,
  `checkbox_14` int(11) NOT NULL DEFAULT 0,
  `checkbox_15` int(11) NOT NULL DEFAULT 0,
  `checkbox_16` int(11) NOT NULL DEFAULT 0,
  `checkbox_17` int(11) NOT NULL DEFAULT 0,
  `checkbox_18` int(11) NOT NULL DEFAULT 0,
  `checkbox_19` int(11) NOT NULL DEFAULT 0,
  `checkbox_20` int(11) NOT NULL DEFAULT 0,
  `checkbox_21` int(11) NOT NULL DEFAULT 0,
  `checkbox_22` int(11) NOT NULL DEFAULT 0,
  `checkbox_23` int(11) NOT NULL DEFAULT 0,
  `checkbox_24` int(11) NOT NULL DEFAULT 0,
  `checkbox_25` int(11) NOT NULL DEFAULT 0,
  `checkbox_26` int(11) NOT NULL DEFAULT 0,
  `radio_1` int(11) NOT NULL DEFAULT 0,
  `radio_2` int(11) NOT NULL DEFAULT 0,
  `radio_3` int(11) NOT NULL DEFAULT 0,
  `radio_4` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `radio_5` int(11) NOT NULL DEFAULT 0,
  `radio_6` int(11) NOT NULL DEFAULT 0,
  `none_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `none_2` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `none_3` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `none_4` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `none_5` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `passthrough_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `passthrough_2` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `flex_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_elements_basic`
--

LOCK TABLES `tx_styleguide_elements_basic` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_elements_basic` DISABLE KEYS */;
INSERT INTO `tx_styleguide_elements_basic` VALUES (1,7,1611517876,1611517876,1,0,0,0,0,0,0,NULL,0,'',0,0,0,0,'lipsum','lipsum','lip','lipsum','lipsum42','5.23','42','ab12','lipsum','8047cfaac755e5c7f77af066123980a5','lipsum','lipsum','42','lipsum','lipsum','lipsum','lipsum','lipsum','LIPSUM','1960','0','input_26','lipsum','lipsum','https://typo3.org','0','14.5','42','Summer','#FF8700','Summer','Summer','#FF8700','https://typo3.org','foo@example.com','lipsum','https://typo3.org','#FF8700','-315619200','1960-01-01','-315599778','1960-01-01 05:42:23','19380','19422','-315619200','-315599778','19380','19422','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','This textbox has wrap set to \"off\", so these long paragraphs should appear in one line: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean non luctus elit. In sed nunc velit. Donec gravida eros sollicitudin ligula mollis id eleifend mauris laoreet. Donec turpis magna, pulvinar id pretium eu, blandit et nisi. Nulla facilisi. Vivamus pharetra orci sed nunc auctor condimentum. Aenean volutpat posuere scelerisque. Nullam sed dolor justo. Pellentesque id tellus nunc, id sodales diam. Sed rhoncus risus a enim lacinia tincidunt. Aliquam ut neque augue.','This textbox has wrap set to \"virtual\", so these long paragraphs should appear in multiple lines (wrapped at the end of the textbox): Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean non luctus elit. In sed nunc velit. Donec gravida eros sollicitudin ligula mollis id eleifend mauris laoreet. Donec turpis magna, pulvinar id pretium eu, blandit et nisi. Nulla facilisi. Vivamus pharetra orci sed nunc auctor condimentum. Aenean volutpat posuere scelerisque. Nullam sed dolor justo. Pellentesque id tellus nunc, id sodales diam. Sed rhoncus risus a enim lacinia tincidunt. Aliquam ut neque augue.','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','-315599778','Bacon ipsum dolor sit strong','text_12','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','Dummy Text for Option 2','row1 col1|row1 col2\nrow2 col1|row3 col2\nrow2 col1|row3 col2','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','row1 col1|row1 col2\nrow2 col1|row3 col2\nrow2 col1|row3 col2',0,0,2,2,2,0,0,2,2,2,2,2,2,2,2,0,0,0,2,0,0,0,2,0,0,2,2,2,'bar',2,2,'lipsum','lipsum','lipsum','lipsum','-315599778','lipsum','42','lipsum','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sInput\">\n            <language index=\"lDEF\">\n                <field index=\"input_1\">\n                    <value index=\"vDEF\">https://typo3.org</value>\n                </field>\n                <field index=\"input_2\">\n                    <value index=\"vDEF\">row1 col1|row1 col2\nrow2 col1|row3 col2\nrow2 col1|row3 col2</value>\n                </field>\n                <field index=\"input_3\">\n                    <value index=\"vDEF\">bar</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sInputDateTime\">\n            <language index=\"lDEF\">\n                <field index=\"inputDateTime_1\">\n                    <value index=\"vDEF\">-315619200</value>\n                </field>\n                <field index=\"inputDateTime_2\">\n                    <value index=\"vDEF\">1960-01-01</value>\n                </field>\n                <field index=\"inputDateTime_3\">\n                    <value index=\"vDEF\">-315599778</value>\n                </field>\n                <field index=\"inputDateTime_4\">\n                    <value index=\"vDEF\">0000-00-00 00:00:00</value>\n                </field>\n                <field index=\"inputDateTime_5\">\n                    <value index=\"vDEF\">19380</value>\n                </field>\n                <field index=\"inputDateTime_6\">\n                    <value index=\"vDEF\">19422</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sText\">\n            <language index=\"lDEF\">\n                <field index=\"text_1\">\n                    <value index=\"vDEF\">Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sCheck\">\n            <language index=\"lDEF\">\n                <field index=\"check_1\">\n                    <value index=\"vDEF\">2</value>\n                </field>\n                <field index=\"check_2\">\n                    <value index=\"vDEF\">2</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sRadio\">\n            <language index=\"lDEF\">\n                <field index=\"radio_1\">\n                    <value index=\"vDEF\">2</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sPassthrough\">\n            <language index=\"lDEF\">\n                <field index=\"passthrough_1\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>'),(2,7,1611517876,1611517876,1,0,0,256,1,0,1,NULL,1,'',0,0,0,0,'[Translate to styleguide demo language danish:] lipsum','[Translate to styleguide demo language danish:] lipsum','lip','lipsum','lipsum42','5.23','42','ab12','lipsum','8047cfaac755e5c7f77af066123980a5','lipsum','lipsum','42','lipsum','lipsum','lipsumPHPfoo-evaluate','lipsum0','lipsum0','LIPSUM','1960','0','input_26','lipsum','lipsum','https://typo3.org','0','14.50','42','Summer','#FF8700','Summer','Summer','#FF8700','https://typo3.org','foo@example.com','lipsum','https://typo3.org','#FF8700','-315619200','1960-01-01','-315599778','1960-01-01 05:42:23','19380','19422','-315619200','-315599778','19380','19422','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','[Translate to styleguide demo language danish:] Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','This textbox has wrap set to \"off\", so these long paragraphs should appear in one line: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean non luctus elit. In sed nunc velit. Donec gravida eros sollicitudin ligula mollis id eleifend mauris laoreet. Donec turpis magna, pulvinar id pretium eu, blandit et nisi. Nulla facilisi. Vivamus pharetra orci sed nunc auctor condimentum. Aenean volutpat posuere scelerisque. Nullam sed dolor justo. Pellentesque id tellus nunc, id sodales diam. Sed rhoncus risus a enim lacinia tincidunt. Aliquam ut neque augue.','This textbox has wrap set to \"virtual\", so these long paragraphs should appear in multiple lines (wrapped at the end of the textbox): Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean non luctus elit. In sed nunc velit. Donec gravida eros sollicitudin ligula mollis id eleifend mauris laoreet. Donec turpis magna, pulvinar id pretium eu, blandit et nisi. Nulla facilisi. Vivamus pharetra orci sed nunc auctor condimentum. Aenean volutpat posuere scelerisque. Nullam sed dolor justo. Pellentesque id tellus nunc, id sodales diam. Sed rhoncus risus a enim lacinia tincidunt. Aliquam ut neque augue.','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.PHPfoo-evaluate','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','-315599778','Bacon ipsum dolor sit strong','text_12','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','Dummy Text for Option 2','row1 col1|row1 col2\nrow2 col1|row3 col2\nrow2 col1|row3 col2','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','row1 col1|row1 col2\nrow2 col1|row3 col2\nrow2 col1|row3 col2',0,0,2,2,2,0,0,2,2,2,2,2,2,2,2,0,0,0,2,0,0,0,2,0,0,2,2,2,'bar',2,2,NULL,NULL,NULL,NULL,NULL,'lipsum','42','lipsum','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sInput\">\n            <language index=\"lDEF\">\n                <field index=\"input_1\">\n                    <value index=\"vDEF\">https://typo3.org</value>\n                </field>\n                <field index=\"input_2\">\n                    <value index=\"vDEF\">row1 col1|row1 col2\nrow2 col1|row3 col2\nrow2 col1|row3 col2</value>\n                </field>\n                <field index=\"input_3\">\n                    <value index=\"vDEF\">bar</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sInputDateTime\">\n            <language index=\"lDEF\">\n                <field index=\"inputDateTime_1\">\n                    <value index=\"vDEF\">-315619200</value>\n                </field>\n                <field index=\"inputDateTime_2\">\n                    <value index=\"vDEF\">1960-01-01</value>\n                </field>\n                <field index=\"inputDateTime_3\">\n                    <value index=\"vDEF\">-315599778</value>\n                </field>\n                <field index=\"inputDateTime_4\">\n                    <value index=\"vDEF\">0000-00-00 00:00:00</value>\n                </field>\n                <field index=\"inputDateTime_5\">\n                    <value index=\"vDEF\">19380</value>\n                </field>\n                <field index=\"inputDateTime_6\">\n                    <value index=\"vDEF\">19422</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sText\">\n            <language index=\"lDEF\">\n                <field index=\"text_1\">\n                    <value index=\"vDEF\">Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sCheck\">\n            <language index=\"lDEF\">\n                <field index=\"check_1\">\n                    <value index=\"vDEF\">2</value>\n                </field>\n                <field index=\"check_2\">\n                    <value index=\"vDEF\">2</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sRadio\">\n            <language index=\"lDEF\">\n                <field index=\"radio_1\">\n                    <value index=\"vDEF\">2</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sPassthrough\">\n            <language index=\"lDEF\">\n                <field index=\"passthrough_1\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>'),(3,7,1611517876,1611517876,1,0,0,128,2,1,1,'{\"input_1\":\"parent\"}',1,'',0,0,0,0,'lipsum','[Translate to styleguide demo language german:] lipsum','lip','lipsum','lipsum42','5.23','42','ab12','lipsum','8047cfaac755e5c7f77af066123980a5','lipsum','lipsum','42','lipsum','lipsum','lipsumPHPfoo-evaluate','lipsum1','lipsum1','LIPSUM','1960','0','input_26','lipsum','lipsum','https://typo3.org','0','14.50','42','Summer','#FF8700','Summer','Summer','#FF8700','https://typo3.org','foo@example.com','lipsum','https://typo3.org','#FF8700','-315619200','1960-01-01','-315599778','1960-01-01 05:42:23','19380','19422','-315619200','-315599778','19380','19422','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','[Translate to styleguide demo language german:] Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','This textbox has wrap set to \"off\", so these long paragraphs should appear in one line: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean non luctus elit. In sed nunc velit. Donec gravida eros sollicitudin ligula mollis id eleifend mauris laoreet. Donec turpis magna, pulvinar id pretium eu, blandit et nisi. Nulla facilisi. Vivamus pharetra orci sed nunc auctor condimentum. Aenean volutpat posuere scelerisque. Nullam sed dolor justo. Pellentesque id tellus nunc, id sodales diam. Sed rhoncus risus a enim lacinia tincidunt. Aliquam ut neque augue.','This textbox has wrap set to \"virtual\", so these long paragraphs should appear in multiple lines (wrapped at the end of the textbox): Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean non luctus elit. In sed nunc velit. Donec gravida eros sollicitudin ligula mollis id eleifend mauris laoreet. Donec turpis magna, pulvinar id pretium eu, blandit et nisi. Nulla facilisi. Vivamus pharetra orci sed nunc auctor condimentum. Aenean volutpat posuere scelerisque. Nullam sed dolor justo. Pellentesque id tellus nunc, id sodales diam. Sed rhoncus risus a enim lacinia tincidunt. Aliquam ut neque augue.','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.PHPfoo-evaluate','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','-315599778','Bacon ipsum dolor sit strong','text_12','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','Dummy Text for Option 2','row1 col1|row1 col2\nrow2 col1|row3 col2\nrow2 col1|row3 col2','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','row1 col1|row1 col2\nrow2 col1|row3 col2\nrow2 col1|row3 col2',0,0,2,2,2,0,0,2,2,2,2,2,2,2,2,0,0,0,2,0,0,0,2,0,0,2,2,2,'bar',2,2,NULL,NULL,NULL,NULL,NULL,'lipsum','42','lipsum','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sInput\">\n            <language index=\"lDEF\">\n                <field index=\"input_1\">\n                    <value index=\"vDEF\">https://typo3.org</value>\n                </field>\n                <field index=\"input_2\">\n                    <value index=\"vDEF\">row1 col1|row1 col2\nrow2 col1|row3 col2\nrow2 col1|row3 col2</value>\n                </field>\n                <field index=\"input_3\">\n                    <value index=\"vDEF\">bar</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sInputDateTime\">\n            <language index=\"lDEF\">\n                <field index=\"inputDateTime_1\">\n                    <value index=\"vDEF\">-315619200</value>\n                </field>\n                <field index=\"inputDateTime_2\">\n                    <value index=\"vDEF\">1960-01-01</value>\n                </field>\n                <field index=\"inputDateTime_3\">\n                    <value index=\"vDEF\">-315599778</value>\n                </field>\n                <field index=\"inputDateTime_4\">\n                    <value index=\"vDEF\">0000-00-00 00:00:00</value>\n                </field>\n                <field index=\"inputDateTime_5\">\n                    <value index=\"vDEF\">19380</value>\n                </field>\n                <field index=\"inputDateTime_6\">\n                    <value index=\"vDEF\">19422</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sText\">\n            <language index=\"lDEF\">\n                <field index=\"text_1\">\n                    <value index=\"vDEF\">Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sCheck\">\n            <language index=\"lDEF\">\n                <field index=\"check_1\">\n                    <value index=\"vDEF\">2</value>\n                </field>\n                <field index=\"check_2\">\n                    <value index=\"vDEF\">2</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sRadio\">\n            <language index=\"lDEF\">\n                <field index=\"radio_1\">\n                    <value index=\"vDEF\">2</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sPassthrough\">\n            <language index=\"lDEF\">\n                <field index=\"passthrough_1\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>'),(4,7,1611517876,1611517876,1,0,0,192,3,1,3,'{\"input_1\":\"parent\"}',3,'',0,0,0,0,'lipsum','[Translate to styleguide demo language french:] [Translate to styleguide demo language german:] lipsum','lip','lipsum','lipsum42','5.23','42','ab12','lipsum','8047cfaac755e5c7f77af066123980a5','lipsum','lipsum','42','lipsum','lipsum','lipsumPHPfoo-evaluatePHPfoo-evaluate','lipsum10','lipsum10','LIPSUM','1960','0','input_26','lipsum','lipsum','https://typo3.org','0','14.50','42','Summer','#FF8700','Summer','Summer','#FF8700','https://typo3.org','foo@example.com','lipsum','https://typo3.org','#FF8700','-315619200','1960-01-01','-315599778','1960-01-01 05:42:23','19380','19422','-315619200','-315599778','19380','19422','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','[Translate to styleguide demo language french:] [Translate to styleguide demo language german:] Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','This textbox has wrap set to \"off\", so these long paragraphs should appear in one line: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean non luctus elit. In sed nunc velit. Donec gravida eros sollicitudin ligula mollis id eleifend mauris laoreet. Donec turpis magna, pulvinar id pretium eu, blandit et nisi. Nulla facilisi. Vivamus pharetra orci sed nunc auctor condimentum. Aenean volutpat posuere scelerisque. Nullam sed dolor justo. Pellentesque id tellus nunc, id sodales diam. Sed rhoncus risus a enim lacinia tincidunt. Aliquam ut neque augue.','This textbox has wrap set to \"virtual\", so these long paragraphs should appear in multiple lines (wrapped at the end of the textbox): Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean non luctus elit. In sed nunc velit. Donec gravida eros sollicitudin ligula mollis id eleifend mauris laoreet. Donec turpis magna, pulvinar id pretium eu, blandit et nisi. Nulla facilisi. Vivamus pharetra orci sed nunc auctor condimentum. Aenean volutpat posuere scelerisque. Nullam sed dolor justo. Pellentesque id tellus nunc, id sodales diam. Sed rhoncus risus a enim lacinia tincidunt. Aliquam ut neque augue.','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.PHPfoo-evaluatePHPfoo-evaluate','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','-315599778','Bacon ipsum dolor sit strong','text_12','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','Dummy Text for Option 2','row1 col1|row1 col2\nrow2 col1|row3 col2\nrow2 col1|row3 col2','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','row1 col1|row1 col2\nrow2 col1|row3 col2\nrow2 col1|row3 col2',0,0,2,2,2,0,0,2,2,2,2,2,2,2,2,0,0,0,2,0,0,0,2,0,0,2,2,2,'bar',2,2,NULL,NULL,NULL,NULL,NULL,'lipsum','42','lipsum','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sInput\">\n            <language index=\"lDEF\">\n                <field index=\"input_1\">\n                    <value index=\"vDEF\">https://typo3.org</value>\n                </field>\n                <field index=\"input_2\">\n                    <value index=\"vDEF\">row1 col1|row1 col2\nrow2 col1|row3 col2\nrow2 col1|row3 col2</value>\n                </field>\n                <field index=\"input_3\">\n                    <value index=\"vDEF\">bar</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sInputDateTime\">\n            <language index=\"lDEF\">\n                <field index=\"inputDateTime_1\">\n                    <value index=\"vDEF\">-315619200</value>\n                </field>\n                <field index=\"inputDateTime_2\">\n                    <value index=\"vDEF\">1960-01-01</value>\n                </field>\n                <field index=\"inputDateTime_3\">\n                    <value index=\"vDEF\">-315599778</value>\n                </field>\n                <field index=\"inputDateTime_4\">\n                    <value index=\"vDEF\">0000-00-00 00:00:00</value>\n                </field>\n                <field index=\"inputDateTime_5\">\n                    <value index=\"vDEF\">19380</value>\n                </field>\n                <field index=\"inputDateTime_6\">\n                    <value index=\"vDEF\">19422</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sText\">\n            <language index=\"lDEF\">\n                <field index=\"text_1\">\n                    <value index=\"vDEF\">Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sCheck\">\n            <language index=\"lDEF\">\n                <field index=\"check_1\">\n                    <value index=\"vDEF\">2</value>\n                </field>\n                <field index=\"check_2\">\n                    <value index=\"vDEF\">2</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sRadio\">\n            <language index=\"lDEF\">\n                <field index=\"radio_1\">\n                    <value index=\"vDEF\">2</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sPassthrough\">\n            <language index=\"lDEF\">\n                <field index=\"passthrough_1\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>'),(5,7,1611517876,1611517876,1,0,0,224,4,0,4,'{\"input_1\":\"parent\"}',4,'',0,0,0,0,'[Translate to styleguide demo language spanish:] lipsum','[Translate to styleguide demo language spanish:] [Translate to styleguide demo language french:] [Translate to styleguide demo language german:] lipsum','lip','lipsum','lipsum42','5.23','42','ab12','lipsum','8047cfaac755e5c7f77af066123980a5','lipsum','lipsum','42','lipsum','lipsum','lipsumPHPfoo-evaluatePHPfoo-evaluatePHPfoo-evaluate','lipsum100','lipsum100','LIPSUM','1960','0','input_26','lipsum','lipsum','https://typo3.org','0','14.50','42','Summer','#FF8700','Summer','Summer','#FF8700','https://typo3.org','foo@example.com','lipsum','https://typo3.org','#FF8700','-315619200','1960-01-01','-315599778','1960-01-01 05:42:23','19380','19422','-315619200','-315599778','19380','19422','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','[Translate to styleguide demo language spanish:] [Translate to styleguide demo language french:] [Translate to styleguide demo language german:] Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','This textbox has wrap set to \"off\", so these long paragraphs should appear in one line: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean non luctus elit. In sed nunc velit. Donec gravida eros sollicitudin ligula mollis id eleifend mauris laoreet. Donec turpis magna, pulvinar id pretium eu, blandit et nisi. Nulla facilisi. Vivamus pharetra orci sed nunc auctor condimentum. Aenean volutpat posuere scelerisque. Nullam sed dolor justo. Pellentesque id tellus nunc, id sodales diam. Sed rhoncus risus a enim lacinia tincidunt. Aliquam ut neque augue.','This textbox has wrap set to \"virtual\", so these long paragraphs should appear in multiple lines (wrapped at the end of the textbox): Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean non luctus elit. In sed nunc velit. Donec gravida eros sollicitudin ligula mollis id eleifend mauris laoreet. Donec turpis magna, pulvinar id pretium eu, blandit et nisi. Nulla facilisi. Vivamus pharetra orci sed nunc auctor condimentum. Aenean volutpat posuere scelerisque. Nullam sed dolor justo. Pellentesque id tellus nunc, id sodales diam. Sed rhoncus risus a enim lacinia tincidunt. Aliquam ut neque augue.','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.PHPfoo-evaluatePHPfoo-evaluatePHPfoo-evaluate','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','-315599778','Bacon ipsum dolor sit strong','text_12','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','Dummy Text for Option 2','row1 col1|row1 col2\nrow2 col1|row3 col2\nrow2 col1|row3 col2','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','row1 col1|row1 col2\nrow2 col1|row3 col2\nrow2 col1|row3 col2',0,0,2,2,2,0,0,2,2,2,2,2,2,2,2,0,0,0,2,0,0,0,2,0,0,2,2,2,'bar',2,2,NULL,NULL,NULL,NULL,NULL,'lipsum','42','lipsum','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sInput\">\n            <language index=\"lDEF\">\n                <field index=\"input_1\">\n                    <value index=\"vDEF\">https://typo3.org</value>\n                </field>\n                <field index=\"input_2\">\n                    <value index=\"vDEF\">row1 col1|row1 col2\nrow2 col1|row3 col2\nrow2 col1|row3 col2</value>\n                </field>\n                <field index=\"input_3\">\n                    <value index=\"vDEF\">bar</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sInputDateTime\">\n            <language index=\"lDEF\">\n                <field index=\"inputDateTime_1\">\n                    <value index=\"vDEF\">-315619200</value>\n                </field>\n                <field index=\"inputDateTime_2\">\n                    <value index=\"vDEF\">1960-01-01</value>\n                </field>\n                <field index=\"inputDateTime_3\">\n                    <value index=\"vDEF\">-315599778</value>\n                </field>\n                <field index=\"inputDateTime_4\">\n                    <value index=\"vDEF\">0000-00-00 00:00:00</value>\n                </field>\n                <field index=\"inputDateTime_5\">\n                    <value index=\"vDEF\">19380</value>\n                </field>\n                <field index=\"inputDateTime_6\">\n                    <value index=\"vDEF\">19422</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sText\">\n            <language index=\"lDEF\">\n                <field index=\"text_1\">\n                    <value index=\"vDEF\">Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sCheck\">\n            <language index=\"lDEF\">\n                <field index=\"check_1\">\n                    <value index=\"vDEF\">2</value>\n                </field>\n                <field index=\"check_2\">\n                    <value index=\"vDEF\">2</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sRadio\">\n            <language index=\"lDEF\">\n                <field index=\"radio_1\">\n                    <value index=\"vDEF\">2</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sPassthrough\">\n            <language index=\"lDEF\">\n                <field index=\"passthrough_1\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>');
/*!40000 ALTER TABLE `tx_styleguide_elements_basic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_elements_group`
--

DROP TABLE IF EXISTS `tx_styleguide_elements_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_elements_group` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `group_db_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_db_2` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_db_3` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_db_4` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_db_5` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_db_7` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_db_8` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_db_9` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_folder_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_requestUpdate_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `flex_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_elements_group`
--

LOCK TABLES `tx_styleguide_elements_group` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_elements_group` DISABLE KEYS */;
INSERT INTO `tx_styleguide_elements_group` VALUES (1,12,1611517876,1611517876,1,0,0,0,0,0,0,NULL,0,'',0,0,0,0,'be_groups_1,be_groups_2,be_users_4,be_users_5','be_groups_1,be_groups_2,be_users_4,be_users_5','1','1','4,5','4,5','1','be_groups_1,be_groups_2,be_users_4,be_users_5','1:/styleguide/','be_groups_1,be_groups_2,be_users_4,be_users_5','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDb\">\n            <language index=\"lDEF\">\n                <field index=\"group_db_1\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n                <field index=\"group_db_2\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>'),(2,12,1611517876,1611517876,1,0,0,256,1,0,1,NULL,1,'',0,0,0,0,'be_groups_1,be_groups_2,be_users_4,be_users_5','be_groups_1,be_groups_2,be_users_4,be_users_5','1','1','4,5','4,5','1','be_groups_1,be_groups_2,be_users_4,be_users_5','1:/styleguide/','be_groups_1,be_groups_2,be_users_4,be_users_5','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDb\">\n            <language index=\"lDEF\">\n                <field index=\"group_db_1\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n                <field index=\"group_db_2\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>'),(3,12,1611517876,1611517876,1,0,0,128,2,1,1,NULL,1,'',0,0,0,0,'be_groups_1,be_groups_2,be_users_4,be_users_5','be_groups_1,be_groups_2,be_users_4,be_users_5','1','1','4,5','4,5','1','be_groups_1,be_groups_2,be_users_4,be_users_5','1:/styleguide/','be_groups_1,be_groups_2,be_users_4,be_users_5','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDb\">\n            <language index=\"lDEF\">\n                <field index=\"group_db_1\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n                <field index=\"group_db_2\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>'),(4,12,1611517876,1611517876,1,0,0,192,3,1,3,NULL,3,'',0,0,0,0,'be_groups_1,be_groups_2,be_users_4,be_users_5','be_groups_1,be_groups_2,be_users_4,be_users_5','1','1','4,5','4,5','1','be_groups_1,be_groups_2,be_users_4,be_users_5','1:/styleguide/','be_groups_1,be_groups_2,be_users_4,be_users_5','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDb\">\n            <language index=\"lDEF\">\n                <field index=\"group_db_1\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n                <field index=\"group_db_2\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>'),(5,12,1611517876,1611517876,1,0,0,224,4,0,4,NULL,4,'',0,0,0,0,'be_groups_1,be_groups_2,be_users_4,be_users_5','be_groups_1,be_groups_2,be_users_4,be_users_5','1','1','4,5','4,5','1','be_groups_1,be_groups_2,be_users_4,be_users_5','1:/styleguide/','be_groups_1,be_groups_2,be_users_4,be_users_5','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDb\">\n            <language index=\"lDEF\">\n                <field index=\"group_db_1\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n                <field index=\"group_db_2\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>');
/*!40000 ALTER TABLE `tx_styleguide_elements_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_elements_rte`
--

DROP TABLE IF EXISTS `tx_styleguide_elements_rte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_elements_rte` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `rte_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `rte_2` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `rte_3` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `rte_inline_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `rte_flex_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_palette_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `rte_palette_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_elements_rte`
--

LOCK TABLES `tx_styleguide_elements_rte` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_elements_rte` DISABLE KEYS */;
INSERT INTO `tx_styleguide_elements_rte` VALUES (1,17,1611517876,1611517876,1,0,0,0,0,0,0,NULL,0,'',0,0,0,0,'Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','rte_2','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','1','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sGeneral\">\n            <language index=\"lDEF\">\n                <field index=\"rte_1\">\n                    <value index=\"vDEF\">Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.</value>\n                </field>\n                <field index=\"rte.2\">\n                    <value index=\"vDEF\">Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sSections\">\n            <language index=\"lDEF\">\n                <field index=\"section_1\">\n                    <el index=\"el\">\n                        <section index=\"1\">\n                            <itemType index=\"container_1\">\n                                <el>\n                                    <field index=\"rte_1\">\n                                        <value index=\"vDEF\">Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.</value>\n                                    </field>\n                                </el>\n                            </itemType>\n                        </section>\n                    </el>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sInline\">\n            <language index=\"lDEF\">\n                <field index=\"inline_1\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','lipsum','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.'),(2,17,1611517876,1611517876,1,0,0,256,1,0,1,NULL,1,'',0,0,0,0,'Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','rte_2','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','1','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sGeneral\">\n            <language index=\"lDEF\">\n                <field index=\"rte_1\">\n                    <value index=\"vDEF\">Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.</value>\n                </field>\n                <field index=\"rte.2\">\n                    <value index=\"vDEF\">Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sSections\">\n            <language index=\"lDEF\">\n                <field index=\"section_1\">\n                    <el index=\"el\">\n                        <section index=\"1\">\n                            <itemType index=\"container_1\">\n                                <el>\n                                    <field index=\"rte_1\">\n                                        <value index=\"vDEF\">Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.</value>\n                                    </field>\n                                </el>\n                            </itemType>\n                        </section>\n                    </el>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sInline\">\n            <language index=\"lDEF\">\n                <field index=\"inline_1\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','lipsum','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.'),(3,17,1611517876,1611517876,1,0,0,128,2,1,1,NULL,1,'',0,0,0,0,'Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','rte_2','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','1','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sGeneral\">\n            <language index=\"lDEF\">\n                <field index=\"rte_1\">\n                    <value index=\"vDEF\">Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.</value>\n                </field>\n                <field index=\"rte.2\">\n                    <value index=\"vDEF\">Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sSections\">\n            <language index=\"lDEF\">\n                <field index=\"section_1\">\n                    <el index=\"el\">\n                        <section index=\"1\">\n                            <itemType index=\"container_1\">\n                                <el>\n                                    <field index=\"rte_1\">\n                                        <value index=\"vDEF\">Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.</value>\n                                    </field>\n                                </el>\n                            </itemType>\n                        </section>\n                    </el>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sInline\">\n            <language index=\"lDEF\">\n                <field index=\"inline_1\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','lipsum','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.'),(4,17,1611517876,1611517876,1,0,0,192,3,1,3,NULL,3,'',0,0,0,0,'Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','rte_2','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','1','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sGeneral\">\n            <language index=\"lDEF\">\n                <field index=\"rte_1\">\n                    <value index=\"vDEF\">Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.</value>\n                </field>\n                <field index=\"rte.2\">\n                    <value index=\"vDEF\">Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sSections\">\n            <language index=\"lDEF\">\n                <field index=\"section_1\">\n                    <el index=\"el\">\n                        <section index=\"1\">\n                            <itemType index=\"container_1\">\n                                <el>\n                                    <field index=\"rte_1\">\n                                        <value index=\"vDEF\">Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.</value>\n                                    </field>\n                                </el>\n                            </itemType>\n                        </section>\n                    </el>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sInline\">\n            <language index=\"lDEF\">\n                <field index=\"inline_1\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','lipsum','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.'),(5,17,1611517876,1611517876,1,0,0,224,4,0,4,NULL,4,'',0,0,0,0,'Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','rte_2','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','1','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sGeneral\">\n            <language index=\"lDEF\">\n                <field index=\"rte_1\">\n                    <value index=\"vDEF\">Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.</value>\n                </field>\n                <field index=\"rte.2\">\n                    <value index=\"vDEF\">Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sSections\">\n            <language index=\"lDEF\">\n                <field index=\"section_1\">\n                    <el index=\"el\">\n                        <section index=\"1\">\n                            <itemType index=\"container_1\">\n                                <el>\n                                    <field index=\"rte_1\">\n                                        <value index=\"vDEF\">Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.</value>\n                                    </field>\n                                </el>\n                            </itemType>\n                        </section>\n                    </el>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sInline\">\n            <language index=\"lDEF\">\n                <field index=\"inline_1\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','lipsum','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.');
/*!40000 ALTER TABLE `tx_styleguide_elements_rte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_elements_rte_flex_1_inline_1_child`
--

DROP TABLE IF EXISTS `tx_styleguide_elements_rte_flex_1_inline_1_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_elements_rte_flex_1_inline_1_child` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `parentid` int(11) NOT NULL DEFAULT 0,
  `parenttable` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `rte_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_elements_rte_flex_1_inline_1_child`
--

LOCK TABLES `tx_styleguide_elements_rte_flex_1_inline_1_child` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_elements_rte_flex_1_inline_1_child` DISABLE KEYS */;
INSERT INTO `tx_styleguide_elements_rte_flex_1_inline_1_child` VALUES (1,17,0,0,0,0,0,0,0,0,0,NULL,'lipsum',1,'tx_styleguide_elements_rte','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.'),(2,17,1611517876,1611517876,1,0,0,1,0,0,0,NULL,'lipsum',2,'tx_styleguide_elements_rte','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.'),(3,17,1611517876,1611517876,1,0,0,1,0,0,0,NULL,'lipsum',3,'tx_styleguide_elements_rte','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.'),(4,17,1611517876,1611517876,1,0,0,1,0,0,0,NULL,'lipsum',4,'tx_styleguide_elements_rte','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.'),(5,17,1611517876,1611517876,1,0,0,1,0,0,0,NULL,'lipsum',5,'tx_styleguide_elements_rte','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.');
/*!40000 ALTER TABLE `tx_styleguide_elements_rte_flex_1_inline_1_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_elements_rte_inline_1_child`
--

DROP TABLE IF EXISTS `tx_styleguide_elements_rte_inline_1_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_elements_rte_inline_1_child` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `parentid` int(11) NOT NULL DEFAULT 0,
  `parenttable` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `rte_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_elements_rte_inline_1_child`
--

LOCK TABLES `tx_styleguide_elements_rte_inline_1_child` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_elements_rte_inline_1_child` DISABLE KEYS */;
INSERT INTO `tx_styleguide_elements_rte_inline_1_child` VALUES (1,17,0,0,0,0,0,0,0,0,0,NULL,'lipsum',1,'tx_styleguide_elements_rte','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.'),(2,17,1611517876,1611517876,1,0,0,1025,1,0,1,NULL,'lipsum',2,'tx_styleguide_elements_rte','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.'),(3,17,1611517876,1611517876,1,0,0,1,2,1,1,NULL,'lipsum',3,'tx_styleguide_elements_rte','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.'),(4,17,1611517876,1611517876,1,0,0,1,3,1,3,NULL,'lipsum',4,'tx_styleguide_elements_rte','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.'),(5,17,1611517876,1611517876,1,0,0,1,4,0,4,NULL,'lipsum',5,'tx_styleguide_elements_rte','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.');
/*!40000 ALTER TABLE `tx_styleguide_elements_rte_inline_1_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_elements_select`
--

DROP TABLE IF EXISTS `tx_styleguide_elements_select`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_elements_select` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `select_single_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `select_single_2` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `select_single_3` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `select_single_4` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `select_single_5` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `select_single_7` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `select_single_8` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `select_single_10` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `select_single_11` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `select_single_12` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `select_single_13` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `select_single_14` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `select_single_15` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `select_singlebox_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `select_singlebox_2` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `select_checkbox_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `select_checkbox_2` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `select_checkbox_3` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `select_checkbox_4` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `select_checkbox_5` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `select_checkbox_6` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `select_multiplesidebyside_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `select_multiplesidebyside_2` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `select_multiplesidebyside_3` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `select_multiplesidebyside_5` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `select_multiplesidebyside_6` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `select_multiplesidebyside_7` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `select_multiplesidebyside_8` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `select_multiplesidebyside_9` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `select_tree_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `select_tree_2` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `select_tree_3` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `select_tree_4` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `select_tree_5` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `select_tree_6` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `flex_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `select_requestUpdate_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_elements_select`
--

LOCK TABLES `tx_styleguide_elements_select` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_elements_select` DISABLE KEYS */;
INSERT INTO `tx_styleguide_elements_select` VALUES (1,22,1611517876,1611517876,1,0,0,0,0,0,0,NULL,0,'',0,0,0,0,'bar','bar','-2','foo2','foo2','','1','2','2','2','bar','','','2','2','2','2','2','2','1','1','2','1','2','2','1,2','2','1,2','2','1,7,12','7,12','1','1,7,12','1,7,12','','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sSingle\">\n            <language index=\"lDEF\">\n                <field index=\"select_single_1\">\n                    <value index=\"vDEF\">foo2</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sCheckbox\">\n            <language index=\"lDEF\">\n                <field index=\"select_checkxox_1\">\n                    <value index=\"vDEF\">2</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sTree\">\n            <language index=\"lDEF\">\n                <field index=\"select_tree_1\">\n                    <value index=\"vDEF\">1,7,12</value>\n                </field>\n                <field index=\"select_tree_2_condition\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"select_tree_2\">\n                    <value index=\"vDEF\">1,7,12</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sMultiplesidebyside\">\n            <language index=\"lDEF\">\n                <field index=\"select_multiplesidebyside_1\">\n                    <value index=\"vDEF\">1,2</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sSection\">\n            <language index=\"lDEF\">\n                <field index=\"section_1\">\n                    <el index=\"el\">\n                        <section index=\"1\">\n                            <itemType index=\"container_1\">\n                                <el>\n                                    <field index=\"select_tree_1\">\n                                        <value index=\"vDEF\">1,7,12</value>\n                                    </field>\n                                    <field index=\"select_multiplesidebyside_1\">\n                                        <value index=\"vDEF\">1,2</value>\n                                    </field>\n                                </el>\n                            </itemType>\n                        </section>\n                    </el>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','bar'),(2,22,1611517876,1611517876,1,0,0,256,1,0,1,NULL,1,'',0,0,0,0,'bar','bar','-2','foo2','foo2','','1','2','2','2','bar','','0','2','2','2','2','2','2','1','1','2','1','2','2','1,2','2','0','2','1,7,12','7,12','1','1,7,12','1,7,12','','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sSingle\">\n            <language index=\"lDEF\">\n                <field index=\"select_single_1\">\n                    <value index=\"vDEF\">foo2</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sCheckbox\">\n            <language index=\"lDEF\">\n                <field index=\"select_checkxox_1\">\n                    <value index=\"vDEF\">2</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sTree\">\n            <language index=\"lDEF\">\n                <field index=\"select_tree_1\">\n                    <value index=\"vDEF\">1,7,12</value>\n                </field>\n                <field index=\"select_tree_2_condition\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"select_tree_2\">\n                    <value index=\"vDEF\">1,7,12</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sMultiplesidebyside\">\n            <language index=\"lDEF\">\n                <field index=\"select_multiplesidebyside_1\">\n                    <value index=\"vDEF\">1,2</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sSection\">\n            <language index=\"lDEF\">\n                <field index=\"section_1\">\n                    <el index=\"el\">\n                        <section index=\"1\">\n                            <itemType index=\"container_1\">\n                                <el>\n                                    <field index=\"select_tree_1\">\n                                        <value index=\"vDEF\">1,7,12</value>\n                                    </field>\n                                    <field index=\"select_multiplesidebyside_1\">\n                                        <value index=\"vDEF\">1,2</value>\n                                    </field>\n                                </el>\n                            </itemType>\n                        </section>\n                    </el>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','bar'),(3,22,1611517876,1611517876,1,0,0,128,2,1,1,'{\"select_tree_1\":\"parent\"}',1,'',0,0,0,0,'bar','bar','-2','foo2','foo2','','1','2','2','2','bar','','0','2','2','2','2','2','2','1','1','2','1','2','2','1,2','2','0','2','1,7,12','7,12','1','1,7,12','1,7,12','','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sSingle\">\n            <language index=\"lDEF\">\n                <field index=\"select_single_1\">\n                    <value index=\"vDEF\">foo2</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sCheckbox\">\n            <language index=\"lDEF\">\n                <field index=\"select_checkxox_1\">\n                    <value index=\"vDEF\">2</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sTree\">\n            <language index=\"lDEF\">\n                <field index=\"select_tree_1\">\n                    <value index=\"vDEF\">1,7,12</value>\n                </field>\n                <field index=\"select_tree_2_condition\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"select_tree_2\">\n                    <value index=\"vDEF\">1,7,12</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sMultiplesidebyside\">\n            <language index=\"lDEF\">\n                <field index=\"select_multiplesidebyside_1\">\n                    <value index=\"vDEF\">1,2</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sSection\">\n            <language index=\"lDEF\">\n                <field index=\"section_1\">\n                    <el index=\"el\">\n                        <section index=\"1\">\n                            <itemType index=\"container_1\">\n                                <el>\n                                    <field index=\"select_tree_1\">\n                                        <value index=\"vDEF\">1,7,12</value>\n                                    </field>\n                                    <field index=\"select_multiplesidebyside_1\">\n                                        <value index=\"vDEF\">1,2</value>\n                                    </field>\n                                </el>\n                            </itemType>\n                        </section>\n                    </el>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','bar'),(4,22,1611517876,1611517876,1,0,0,192,3,1,3,'{\"select_tree_1\":\"parent\"}',3,'',0,0,0,0,'bar','bar','-2','foo2','foo2','','1','2','2','2','bar','','0','2','2','2','2','2','2','1','1','2','1','2','2','1,2','2','0','2','1,7,12','7,12','1','1,7,12','1,7,12','','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sSingle\">\n            <language index=\"lDEF\">\n                <field index=\"select_single_1\">\n                    <value index=\"vDEF\">foo2</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sCheckbox\">\n            <language index=\"lDEF\">\n                <field index=\"select_checkxox_1\">\n                    <value index=\"vDEF\">2</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sTree\">\n            <language index=\"lDEF\">\n                <field index=\"select_tree_1\">\n                    <value index=\"vDEF\">1,7,12</value>\n                </field>\n                <field index=\"select_tree_2_condition\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"select_tree_2\">\n                    <value index=\"vDEF\">1,7,12</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sMultiplesidebyside\">\n            <language index=\"lDEF\">\n                <field index=\"select_multiplesidebyside_1\">\n                    <value index=\"vDEF\">1,2</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sSection\">\n            <language index=\"lDEF\">\n                <field index=\"section_1\">\n                    <el index=\"el\">\n                        <section index=\"1\">\n                            <itemType index=\"container_1\">\n                                <el>\n                                    <field index=\"select_tree_1\">\n                                        <value index=\"vDEF\">1,7,12</value>\n                                    </field>\n                                    <field index=\"select_multiplesidebyside_1\">\n                                        <value index=\"vDEF\">1,2</value>\n                                    </field>\n                                </el>\n                            </itemType>\n                        </section>\n                    </el>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','bar'),(5,22,1611517876,1611517876,1,0,0,224,4,0,4,'{\"select_tree_1\":\"parent\"}',4,'',0,0,0,0,'bar','bar','-2','foo2','foo2','','1','2','2','2','bar','','0','2','2','2','2','2','2','1','1','2','1','2','2','1,2','2','0','2','1,7,12','7,12','1','1,7,12','1,7,12','','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sSingle\">\n            <language index=\"lDEF\">\n                <field index=\"select_single_1\">\n                    <value index=\"vDEF\">foo2</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sCheckbox\">\n            <language index=\"lDEF\">\n                <field index=\"select_checkxox_1\">\n                    <value index=\"vDEF\">2</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sTree\">\n            <language index=\"lDEF\">\n                <field index=\"select_tree_1\">\n                    <value index=\"vDEF\">1,7,12</value>\n                </field>\n                <field index=\"select_tree_2_condition\">\n                    <value index=\"vDEF\">0</value>\n                </field>\n                <field index=\"select_tree_2\">\n                    <value index=\"vDEF\">1,7,12</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sMultiplesidebyside\">\n            <language index=\"lDEF\">\n                <field index=\"select_multiplesidebyside_1\">\n                    <value index=\"vDEF\">1,2</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sSection\">\n            <language index=\"lDEF\">\n                <field index=\"section_1\">\n                    <el index=\"el\">\n                        <section index=\"1\">\n                            <itemType index=\"container_1\">\n                                <el>\n                                    <field index=\"select_tree_1\">\n                                        <value index=\"vDEF\">1,7,12</value>\n                                    </field>\n                                    <field index=\"select_multiplesidebyside_1\">\n                                        <value index=\"vDEF\">1,2</value>\n                                    </field>\n                                </el>\n                            </itemType>\n                        </section>\n                    </el>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','bar');
/*!40000 ALTER TABLE `tx_styleguide_elements_select` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_elements_select_multiplesidebyside_8_mm`
--

DROP TABLE IF EXISTS `tx_styleguide_elements_select_multiplesidebyside_8_mm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_elements_select_multiplesidebyside_8_mm` (
  `uid_local` int(11) NOT NULL DEFAULT 0,
  `uid_foreign` int(11) NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  KEY `uid_local` (`uid_local`),
  KEY `uid_foreign` (`uid_foreign`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_elements_select_multiplesidebyside_8_mm`
--

LOCK TABLES `tx_styleguide_elements_select_multiplesidebyside_8_mm` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_elements_select_multiplesidebyside_8_mm` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_styleguide_elements_select_multiplesidebyside_8_mm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_elements_select_single_12_foreign`
--

DROP TABLE IF EXISTS `tx_styleguide_elements_select_single_12_foreign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_elements_select_single_12_foreign` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `fal_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_elements_select_single_12_foreign`
--

LOCK TABLES `tx_styleguide_elements_select_single_12_foreign` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_elements_select_single_12_foreign` DISABLE KEYS */;
INSERT INTO `tx_styleguide_elements_select_single_12_foreign` VALUES (1,22,0,0,0,0,0,0,0,0,0,NULL,'lipsum','1'),(2,22,0,0,0,0,0,0,0,0,0,NULL,'lipsum','1');
/*!40000 ALTER TABLE `tx_styleguide_elements_select_single_12_foreign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_elements_select_single_15_mm`
--

DROP TABLE IF EXISTS `tx_styleguide_elements_select_single_15_mm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_elements_select_single_15_mm` (
  `uid_local` int(11) NOT NULL DEFAULT 0,
  `uid_foreign` int(11) NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  KEY `uid_local` (`uid_local`),
  KEY `uid_foreign` (`uid_foreign`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_elements_select_single_15_mm`
--

LOCK TABLES `tx_styleguide_elements_select_single_15_mm` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_elements_select_single_15_mm` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_styleguide_elements_select_single_15_mm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_elements_special`
--

DROP TABLE IF EXISTS `tx_styleguide_elements_special`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_elements_special` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `special_custom_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `special_exclude_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `special_explicitvalues_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `special_languages_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `special_modlistgroup_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `special_pagetypes_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `special_tables_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `special_tables_2` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `special_tables_3` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `special_usermods_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_elements_special`
--

LOCK TABLES `tx_styleguide_elements_special` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_elements_special` DISABLE KEYS */;
INSERT INTO `tx_styleguide_elements_special` VALUES (1,27,1611517876,1611517876,1,0,0,0,0,0,0,NULL,0,'',0,0,0,0,'','','','','','','','','',''),(2,27,1611517876,1611517876,1,0,0,256,1,0,1,NULL,1,'',0,0,0,0,'','','','','','','','','',''),(3,27,1611517876,1611517876,1,0,0,128,2,1,1,NULL,1,'',0,0,0,0,'','','','','','','','','',''),(4,27,1611517876,1611517876,1,0,0,192,3,1,3,NULL,3,'',0,0,0,0,'','','','','','','','','',''),(5,27,1611517876,1611517876,1,0,0,224,4,0,4,NULL,4,'',0,0,0,0,'','','','','','','','','','');
/*!40000 ALTER TABLE `tx_styleguide_elements_special` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_elements_t3editor`
--

DROP TABLE IF EXISTS `tx_styleguide_elements_t3editor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_elements_t3editor` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `t3editor_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3editor_reload_1` int(11) NOT NULL DEFAULT 0,
  `t3editor_inline_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3editor_flex_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_elements_t3editor`
--

LOCK TABLES `tx_styleguide_elements_t3editor` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_elements_t3editor` DISABLE KEYS */;
INSERT INTO `tx_styleguide_elements_t3editor` VALUES (1,32,1611517876,1611517876,1,0,0,0,0,0,0,NULL,0,'',0,0,0,0,'Bacon ipsum dolor sit <strong>strong amet capicola</strong> jerky pork chop rump shoulder shank. Shankle strip <a href=\"#\">steak pig salami link</a>. Leberkas shoulder ham hock cow salami bacon <em>em pork pork</em> chop, jerky pork belly drumstick ham. Tri-tip strip steak sirloin prosciutto pastrami. Corned beef venison tenderloin, biltong meatball pork tongue short ribs jowl cow hamburger strip steak. Doner turducken jerky short loin chuck filet mignon.',1,'1','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sGeneral\">\n            <language index=\"lDEF\">\n                <field index=\"t3editor_1\">\n                    <value index=\"vDEF\">Bacon ipsum dolor sit &lt;strong&gt;strong amet capicola&lt;/strong&gt; jerky pork chop rump shoulder shank. Shankle strip &lt;a href=&quot;#&quot;&gt;steak pig salami link&lt;/a&gt;. Leberkas shoulder ham hock cow salami bacon &lt;em&gt;em pork pork&lt;/em&gt; chop, jerky pork belly drumstick ham. Tri-tip strip steak sirloin prosciutto pastrami. Corned beef venison tenderloin, biltong meatball pork tongue short ribs jowl cow hamburger strip steak. Doner turducken jerky short loin chuck filet mignon.</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sSection\">\n            <language index=\"lDEF\">\n                <field index=\"section_1\">\n                    <el index=\"el\">\n                        <section index=\"1\">\n                            <itemType index=\"container_1\">\n                                <el>\n                                    <field index=\"t3editor_1\">\n                                        <value index=\"vDEF\">Bacon ipsum dolor sit &lt;strong&gt;strong amet capicola&lt;/strong&gt; jerky pork chop rump shoulder shank. Shankle strip &lt;a href=&quot;#&quot;&gt;steak pig salami link&lt;/a&gt;. Leberkas shoulder ham hock cow salami bacon &lt;em&gt;em pork pork&lt;/em&gt; chop, jerky pork belly drumstick ham. Tri-tip strip steak sirloin prosciutto pastrami. Corned beef venison tenderloin, biltong meatball pork tongue short ribs jowl cow hamburger strip steak. Doner turducken jerky short loin chuck filet mignon.</value>\n                                    </field>\n                                </el>\n                            </itemType>\n                        </section>\n                    </el>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sInline\">\n            <language index=\"lDEF\">\n                <field index=\"inline_1\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>'),(2,32,1611517876,1611517876,1,0,0,256,1,0,1,NULL,1,'',0,0,0,0,'Bacon ipsum dolor sit <strong>strong amet capicola</strong> jerky pork chop rump shoulder shank. Shankle strip <a href=\"#\">steak pig salami link</a>. Leberkas shoulder ham hock cow salami bacon <em>em pork pork</em> chop, jerky pork belly drumstick ham. Tri-tip strip steak sirloin prosciutto pastrami. Corned beef venison tenderloin, biltong meatball pork tongue short ribs jowl cow hamburger strip steak. Doner turducken jerky short loin chuck filet mignon.',1,'1','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sGeneral\">\n            <language index=\"lDEF\">\n                <field index=\"t3editor_1\">\n                    <value index=\"vDEF\">Bacon ipsum dolor sit &lt;strong&gt;strong amet capicola&lt;/strong&gt; jerky pork chop rump shoulder shank. Shankle strip &lt;a href=&quot;#&quot;&gt;steak pig salami link&lt;/a&gt;. Leberkas shoulder ham hock cow salami bacon &lt;em&gt;em pork pork&lt;/em&gt; chop, jerky pork belly drumstick ham. Tri-tip strip steak sirloin prosciutto pastrami. Corned beef venison tenderloin, biltong meatball pork tongue short ribs jowl cow hamburger strip steak. Doner turducken jerky short loin chuck filet mignon.</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sSection\">\n            <language index=\"lDEF\">\n                <field index=\"section_1\">\n                    <el index=\"el\">\n                        <section index=\"1\">\n                            <itemType index=\"container_1\">\n                                <el>\n                                    <field index=\"t3editor_1\">\n                                        <value index=\"vDEF\">Bacon ipsum dolor sit &lt;strong&gt;strong amet capicola&lt;/strong&gt; jerky pork chop rump shoulder shank. Shankle strip &lt;a href=&quot;#&quot;&gt;steak pig salami link&lt;/a&gt;. Leberkas shoulder ham hock cow salami bacon &lt;em&gt;em pork pork&lt;/em&gt; chop, jerky pork belly drumstick ham. Tri-tip strip steak sirloin prosciutto pastrami. Corned beef venison tenderloin, biltong meatball pork tongue short ribs jowl cow hamburger strip steak. Doner turducken jerky short loin chuck filet mignon.</value>\n                                    </field>\n                                </el>\n                            </itemType>\n                        </section>\n                    </el>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sInline\">\n            <language index=\"lDEF\">\n                <field index=\"inline_1\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>'),(3,32,1611517876,1611517876,1,0,0,128,2,1,1,NULL,1,'',0,0,0,0,'Bacon ipsum dolor sit <strong>strong amet capicola</strong> jerky pork chop rump shoulder shank. Shankle strip <a href=\"#\">steak pig salami link</a>. Leberkas shoulder ham hock cow salami bacon <em>em pork pork</em> chop, jerky pork belly drumstick ham. Tri-tip strip steak sirloin prosciutto pastrami. Corned beef venison tenderloin, biltong meatball pork tongue short ribs jowl cow hamburger strip steak. Doner turducken jerky short loin chuck filet mignon.',1,'1','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sGeneral\">\n            <language index=\"lDEF\">\n                <field index=\"t3editor_1\">\n                    <value index=\"vDEF\">Bacon ipsum dolor sit &lt;strong&gt;strong amet capicola&lt;/strong&gt; jerky pork chop rump shoulder shank. Shankle strip &lt;a href=&quot;#&quot;&gt;steak pig salami link&lt;/a&gt;. Leberkas shoulder ham hock cow salami bacon &lt;em&gt;em pork pork&lt;/em&gt; chop, jerky pork belly drumstick ham. Tri-tip strip steak sirloin prosciutto pastrami. Corned beef venison tenderloin, biltong meatball pork tongue short ribs jowl cow hamburger strip steak. Doner turducken jerky short loin chuck filet mignon.</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sSection\">\n            <language index=\"lDEF\">\n                <field index=\"section_1\">\n                    <el index=\"el\">\n                        <section index=\"1\">\n                            <itemType index=\"container_1\">\n                                <el>\n                                    <field index=\"t3editor_1\">\n                                        <value index=\"vDEF\">Bacon ipsum dolor sit &lt;strong&gt;strong amet capicola&lt;/strong&gt; jerky pork chop rump shoulder shank. Shankle strip &lt;a href=&quot;#&quot;&gt;steak pig salami link&lt;/a&gt;. Leberkas shoulder ham hock cow salami bacon &lt;em&gt;em pork pork&lt;/em&gt; chop, jerky pork belly drumstick ham. Tri-tip strip steak sirloin prosciutto pastrami. Corned beef venison tenderloin, biltong meatball pork tongue short ribs jowl cow hamburger strip steak. Doner turducken jerky short loin chuck filet mignon.</value>\n                                    </field>\n                                </el>\n                            </itemType>\n                        </section>\n                    </el>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sInline\">\n            <language index=\"lDEF\">\n                <field index=\"inline_1\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>'),(4,32,1611517876,1611517876,1,0,0,192,3,1,3,NULL,3,'',0,0,0,0,'Bacon ipsum dolor sit <strong>strong amet capicola</strong> jerky pork chop rump shoulder shank. Shankle strip <a href=\"#\">steak pig salami link</a>. Leberkas shoulder ham hock cow salami bacon <em>em pork pork</em> chop, jerky pork belly drumstick ham. Tri-tip strip steak sirloin prosciutto pastrami. Corned beef venison tenderloin, biltong meatball pork tongue short ribs jowl cow hamburger strip steak. Doner turducken jerky short loin chuck filet mignon.',1,'1','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sGeneral\">\n            <language index=\"lDEF\">\n                <field index=\"t3editor_1\">\n                    <value index=\"vDEF\">Bacon ipsum dolor sit &lt;strong&gt;strong amet capicola&lt;/strong&gt; jerky pork chop rump shoulder shank. Shankle strip &lt;a href=&quot;#&quot;&gt;steak pig salami link&lt;/a&gt;. Leberkas shoulder ham hock cow salami bacon &lt;em&gt;em pork pork&lt;/em&gt; chop, jerky pork belly drumstick ham. Tri-tip strip steak sirloin prosciutto pastrami. Corned beef venison tenderloin, biltong meatball pork tongue short ribs jowl cow hamburger strip steak. Doner turducken jerky short loin chuck filet mignon.</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sSection\">\n            <language index=\"lDEF\">\n                <field index=\"section_1\">\n                    <el index=\"el\">\n                        <section index=\"1\">\n                            <itemType index=\"container_1\">\n                                <el>\n                                    <field index=\"t3editor_1\">\n                                        <value index=\"vDEF\">Bacon ipsum dolor sit &lt;strong&gt;strong amet capicola&lt;/strong&gt; jerky pork chop rump shoulder shank. Shankle strip &lt;a href=&quot;#&quot;&gt;steak pig salami link&lt;/a&gt;. Leberkas shoulder ham hock cow salami bacon &lt;em&gt;em pork pork&lt;/em&gt; chop, jerky pork belly drumstick ham. Tri-tip strip steak sirloin prosciutto pastrami. Corned beef venison tenderloin, biltong meatball pork tongue short ribs jowl cow hamburger strip steak. Doner turducken jerky short loin chuck filet mignon.</value>\n                                    </field>\n                                </el>\n                            </itemType>\n                        </section>\n                    </el>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sInline\">\n            <language index=\"lDEF\">\n                <field index=\"inline_1\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>'),(5,32,1611517876,1611517876,1,0,0,224,4,0,4,NULL,4,'',0,0,0,0,'Bacon ipsum dolor sit <strong>strong amet capicola</strong> jerky pork chop rump shoulder shank. Shankle strip <a href=\"#\">steak pig salami link</a>. Leberkas shoulder ham hock cow salami bacon <em>em pork pork</em> chop, jerky pork belly drumstick ham. Tri-tip strip steak sirloin prosciutto pastrami. Corned beef venison tenderloin, biltong meatball pork tongue short ribs jowl cow hamburger strip steak. Doner turducken jerky short loin chuck filet mignon.',1,'1','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sGeneral\">\n            <language index=\"lDEF\">\n                <field index=\"t3editor_1\">\n                    <value index=\"vDEF\">Bacon ipsum dolor sit &lt;strong&gt;strong amet capicola&lt;/strong&gt; jerky pork chop rump shoulder shank. Shankle strip &lt;a href=&quot;#&quot;&gt;steak pig salami link&lt;/a&gt;. Leberkas shoulder ham hock cow salami bacon &lt;em&gt;em pork pork&lt;/em&gt; chop, jerky pork belly drumstick ham. Tri-tip strip steak sirloin prosciutto pastrami. Corned beef venison tenderloin, biltong meatball pork tongue short ribs jowl cow hamburger strip steak. Doner turducken jerky short loin chuck filet mignon.</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sSection\">\n            <language index=\"lDEF\">\n                <field index=\"section_1\">\n                    <el index=\"el\">\n                        <section index=\"1\">\n                            <itemType index=\"container_1\">\n                                <el>\n                                    <field index=\"t3editor_1\">\n                                        <value index=\"vDEF\">Bacon ipsum dolor sit &lt;strong&gt;strong amet capicola&lt;/strong&gt; jerky pork chop rump shoulder shank. Shankle strip &lt;a href=&quot;#&quot;&gt;steak pig salami link&lt;/a&gt;. Leberkas shoulder ham hock cow salami bacon &lt;em&gt;em pork pork&lt;/em&gt; chop, jerky pork belly drumstick ham. Tri-tip strip steak sirloin prosciutto pastrami. Corned beef venison tenderloin, biltong meatball pork tongue short ribs jowl cow hamburger strip steak. Doner turducken jerky short loin chuck filet mignon.</value>\n                                    </field>\n                                </el>\n                            </itemType>\n                        </section>\n                    </el>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sInline\">\n            <language index=\"lDEF\">\n                <field index=\"inline_1\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>');
/*!40000 ALTER TABLE `tx_styleguide_elements_t3editor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_elements_t3editor_flex_1_inline_1_child`
--

DROP TABLE IF EXISTS `tx_styleguide_elements_t3editor_flex_1_inline_1_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_elements_t3editor_flex_1_inline_1_child` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `parentid` int(11) NOT NULL DEFAULT 0,
  `parenttable` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3editor_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_elements_t3editor_flex_1_inline_1_child`
--

LOCK TABLES `tx_styleguide_elements_t3editor_flex_1_inline_1_child` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_elements_t3editor_flex_1_inline_1_child` DISABLE KEYS */;
INSERT INTO `tx_styleguide_elements_t3editor_flex_1_inline_1_child` VALUES (1,32,0,0,0,0,0,0,0,0,0,NULL,'lipsum',1,'tx_styleguide_elements_t3editor','Bacon ipsum dolor sit <strong>strong amet capicola</strong> jerky pork chop rump shoulder shank. Shankle strip <a href=\"#\">steak pig salami link</a>. Leberkas shoulder ham hock cow salami bacon <em>em pork pork</em> chop, jerky pork belly drumstick ham. Tri-tip strip steak sirloin prosciutto pastrami. Corned beef venison tenderloin, biltong meatball pork tongue short ribs jowl cow hamburger strip steak. Doner turducken jerky short loin chuck filet mignon.'),(2,32,1611517876,1611517876,1,0,0,1,0,0,0,NULL,'lipsum',2,'tx_styleguide_elements_t3editor','Bacon ipsum dolor sit <strong>strong amet capicola</strong> jerky pork chop rump shoulder shank. Shankle strip <a href=\"#\">steak pig salami link</a>. Leberkas shoulder ham hock cow salami bacon <em>em pork pork</em> chop, jerky pork belly drumstick ham. Tri-tip strip steak sirloin prosciutto pastrami. Corned beef venison tenderloin, biltong meatball pork tongue short ribs jowl cow hamburger strip steak. Doner turducken jerky short loin chuck filet mignon.'),(3,32,1611517876,1611517876,1,0,0,1,0,0,0,NULL,'lipsum',3,'tx_styleguide_elements_t3editor','Bacon ipsum dolor sit <strong>strong amet capicola</strong> jerky pork chop rump shoulder shank. Shankle strip <a href=\"#\">steak pig salami link</a>. Leberkas shoulder ham hock cow salami bacon <em>em pork pork</em> chop, jerky pork belly drumstick ham. Tri-tip strip steak sirloin prosciutto pastrami. Corned beef venison tenderloin, biltong meatball pork tongue short ribs jowl cow hamburger strip steak. Doner turducken jerky short loin chuck filet mignon.'),(4,32,1611517876,1611517876,1,0,0,1,0,0,0,NULL,'lipsum',4,'tx_styleguide_elements_t3editor','Bacon ipsum dolor sit <strong>strong amet capicola</strong> jerky pork chop rump shoulder shank. Shankle strip <a href=\"#\">steak pig salami link</a>. Leberkas shoulder ham hock cow salami bacon <em>em pork pork</em> chop, jerky pork belly drumstick ham. Tri-tip strip steak sirloin prosciutto pastrami. Corned beef venison tenderloin, biltong meatball pork tongue short ribs jowl cow hamburger strip steak. Doner turducken jerky short loin chuck filet mignon.'),(5,32,1611517876,1611517876,1,0,0,1,0,0,0,NULL,'lipsum',5,'tx_styleguide_elements_t3editor','Bacon ipsum dolor sit <strong>strong amet capicola</strong> jerky pork chop rump shoulder shank. Shankle strip <a href=\"#\">steak pig salami link</a>. Leberkas shoulder ham hock cow salami bacon <em>em pork pork</em> chop, jerky pork belly drumstick ham. Tri-tip strip steak sirloin prosciutto pastrami. Corned beef venison tenderloin, biltong meatball pork tongue short ribs jowl cow hamburger strip steak. Doner turducken jerky short loin chuck filet mignon.');
/*!40000 ALTER TABLE `tx_styleguide_elements_t3editor_flex_1_inline_1_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_elements_t3editor_inline_1_child`
--

DROP TABLE IF EXISTS `tx_styleguide_elements_t3editor_inline_1_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_elements_t3editor_inline_1_child` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `parentid` int(11) NOT NULL DEFAULT 0,
  `parenttable` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3editor_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_elements_t3editor_inline_1_child`
--

LOCK TABLES `tx_styleguide_elements_t3editor_inline_1_child` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_elements_t3editor_inline_1_child` DISABLE KEYS */;
INSERT INTO `tx_styleguide_elements_t3editor_inline_1_child` VALUES (1,32,0,0,0,0,0,0,0,0,0,NULL,'lipsum',1,'tx_styleguide_elements_t3editor','Bacon ipsum dolor sit <strong>strong amet capicola</strong> jerky pork chop rump shoulder shank. Shankle strip <a href=\"#\">steak pig salami link</a>. Leberkas shoulder ham hock cow salami bacon <em>em pork pork</em> chop, jerky pork belly drumstick ham. Tri-tip strip steak sirloin prosciutto pastrami. Corned beef venison tenderloin, biltong meatball pork tongue short ribs jowl cow hamburger strip steak. Doner turducken jerky short loin chuck filet mignon.'),(2,32,1611517876,1611517876,1,0,0,1025,1,0,1,NULL,'lipsum',2,'tx_styleguide_elements_t3editor','Bacon ipsum dolor sit <strong>strong amet capicola</strong> jerky pork chop rump shoulder shank. Shankle strip <a href=\"#\">steak pig salami link</a>. Leberkas shoulder ham hock cow salami bacon <em>em pork pork</em> chop, jerky pork belly drumstick ham. Tri-tip strip steak sirloin prosciutto pastrami. Corned beef venison tenderloin, biltong meatball pork tongue short ribs jowl cow hamburger strip steak. Doner turducken jerky short loin chuck filet mignon.'),(3,32,1611517876,1611517876,1,0,0,1,2,1,1,NULL,'lipsum',3,'tx_styleguide_elements_t3editor','Bacon ipsum dolor sit <strong>strong amet capicola</strong> jerky pork chop rump shoulder shank. Shankle strip <a href=\"#\">steak pig salami link</a>. Leberkas shoulder ham hock cow salami bacon <em>em pork pork</em> chop, jerky pork belly drumstick ham. Tri-tip strip steak sirloin prosciutto pastrami. Corned beef venison tenderloin, biltong meatball pork tongue short ribs jowl cow hamburger strip steak. Doner turducken jerky short loin chuck filet mignon.'),(4,32,1611517876,1611517876,1,0,0,1,3,1,3,NULL,'lipsum',4,'tx_styleguide_elements_t3editor','Bacon ipsum dolor sit <strong>strong amet capicola</strong> jerky pork chop rump shoulder shank. Shankle strip <a href=\"#\">steak pig salami link</a>. Leberkas shoulder ham hock cow salami bacon <em>em pork pork</em> chop, jerky pork belly drumstick ham. Tri-tip strip steak sirloin prosciutto pastrami. Corned beef venison tenderloin, biltong meatball pork tongue short ribs jowl cow hamburger strip steak. Doner turducken jerky short loin chuck filet mignon.'),(5,32,1611517876,1611517876,1,0,0,1,4,0,4,NULL,'lipsum',5,'tx_styleguide_elements_t3editor','Bacon ipsum dolor sit <strong>strong amet capicola</strong> jerky pork chop rump shoulder shank. Shankle strip <a href=\"#\">steak pig salami link</a>. Leberkas shoulder ham hock cow salami bacon <em>em pork pork</em> chop, jerky pork belly drumstick ham. Tri-tip strip steak sirloin prosciutto pastrami. Corned beef venison tenderloin, biltong meatball pork tongue short ribs jowl cow hamburger strip steak. Doner turducken jerky short loin chuck filet mignon.');
/*!40000 ALTER TABLE `tx_styleguide_elements_t3editor_inline_1_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_flex`
--

DROP TABLE IF EXISTS `tx_styleguide_flex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_flex` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `flex_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `flex_2` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `flex_3` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `flex_4` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `flex_4_select_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `flex_5` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `flex_6` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `flex_6_select_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `flex_7` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `flex_7_select_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_flex`
--

LOCK TABLES `tx_styleguide_flex` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_flex` DISABLE KEYS */;
INSERT INTO `tx_styleguide_flex` VALUES (1,37,1611517876,1611517876,1,0,0,0,0,0,0,NULL,0,'',0,0,0,0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sSheetdescription_1\">\n            <language index=\"lDEF\">\n                <field index=\"input_1\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sSheetdescription_2\">\n            <language index=\"lDEF\">\n                <field index=\"input_2\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sSection\">\n            <language index=\"lDEF\">\n                <field index=\"section_1\">\n                    <el index=\"el\">\n                        <section index=\"1\">\n                            <itemType index=\"container_1\">\n                                <el>\n                                    <field index=\"input_1\">\n                                        <value index=\"vDEF\">lipsum</value>\n                                    </field>\n                                    <field index=\"input_2\">\n                                        <value index=\"vDEF\">#FF8700</value>\n                                    </field>\n                                </el>\n                            </itemType>\n                        </section>\n                        <section index=\"2\">\n                            <itemType index=\"container_2\">\n                                <el>\n                                    <field index=\"text_1\">\n                                        <value index=\"vDEF\">foo</value>\n                                    </field>\n                                </el>\n                            </itemType>\n                        </section>\n                    </el>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sInline\">\n            <language index=\"lDEF\">\n                <field index=\"inline_1\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sheet_1\">\n            <language index=\"lDEF\">\n                <field index=\"select_1\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sheet_2\">\n            <language index=\"lDEF\">\n                <field index=\"input_1\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sheet_3\">\n            <language index=\"lDEF\">\n                <field index=\"input_2\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','1','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"input_1\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n                <field index=\"input_2\">\n                    <value index=\"vDEF\">foo</value>\n                </field>\n                <field index=\"passthrough_1\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n                <field index=\"passthrough_2\">\n                    <value index=\"vDEF\">passthrough default</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sheet_1\">\n            <language index=\"lDEF\">\n                <field index=\"select_1\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n                <field index=\"select_2\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n                <field index=\"input_1\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n                <field index=\"input_2\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n                <field index=\"input_3\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sheet_2\">\n            <language index=\"lDEF\">\n                <field index=\"input_1\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sheet_3\">\n            <language index=\"lDEF\">\n                <field index=\"input_1\">\n                    <value index=\"vDEF\">foo</value>\n                </field>\n                <field index=\"input_2\">\n                    <value index=\"vDEF\">bar</value>\n                </field>\n                <field index=\"input_3\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','1','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sheet_1\">\n            <language index=\"lDEF\">\n                <field index=\"select_1\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n                <field index=\"section_1\">\n                    <el index=\"el\">\n                        <section index=\"1\">\n                            <itemType index=\"container_1\">\n                                <el>\n                                    <field index=\"select_2\">\n                                        <value index=\"vDEF\">1</value>\n                                    </field>\n                                    <field index=\"input_1\">\n                                        <value index=\"vDEF\">lipsum</value>\n                                    </field>\n                                    <field index=\"input_2\">\n                                        <value index=\"vDEF\">lipsum</value>\n                                    </field>\n                                    <field index=\"input_3\">\n                                        <value index=\"vDEF\">lipsum</value>\n                                    </field>\n                                    <field index=\"input_4\">\n                                        <value index=\"vDEF\">lipsum</value>\n                                    </field>\n                                    <field index=\"input_5\">\n                                        <value index=\"vDEF\">lipsum</value>\n                                    </field>\n                                    <field index=\"input_6\">\n                                        <value index=\"vDEF\">lipsum</value>\n                                    </field>\n                                </el>\n                            </itemType>\n                        </section>\n                    </el>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sheet_2\">\n            <language index=\"lDEF\">\n                <field index=\"select_1\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','1'),(2,37,1611517876,1611517876,1,0,0,256,1,0,1,NULL,1,'',0,0,0,0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sSheetdescription_1\">\n            <language index=\"lDEF\">\n                <field index=\"input_1\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sSheetdescription_2\">\n            <language index=\"lDEF\">\n                <field index=\"input_2\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sSection\">\n            <language index=\"lDEF\">\n                <field index=\"section_1\">\n                    <el index=\"el\">\n                        <section index=\"1\">\n                            <itemType index=\"container_1\">\n                                <el>\n                                    <field index=\"input_1\">\n                                        <value index=\"vDEF\">lipsum</value>\n                                    </field>\n                                    <field index=\"input_2\">\n                                        <value index=\"vDEF\">#FF8700</value>\n                                    </field>\n                                </el>\n                            </itemType>\n                        </section>\n                        <section index=\"2\">\n                            <itemType index=\"container_2\">\n                                <el>\n                                    <field index=\"text_1\">\n                                        <value index=\"vDEF\">foo</value>\n                                    </field>\n                                </el>\n                            </itemType>\n                        </section>\n                    </el>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sInline\">\n            <language index=\"lDEF\">\n                <field index=\"inline_1\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sheet_1\">\n            <language index=\"lDEF\">\n                <field index=\"select_1\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sheet_2\">\n            <language index=\"lDEF\">\n                <field index=\"input_1\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sheet_3\">\n            <language index=\"lDEF\">\n                <field index=\"input_2\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','1','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"input_1\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n                <field index=\"input_2\">\n                    <value index=\"vDEF\">foo</value>\n                </field>\n                <field index=\"passthrough_1\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n                <field index=\"passthrough_2\">\n                    <value index=\"vDEF\">passthrough default</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sheet_1\">\n            <language index=\"lDEF\">\n                <field index=\"select_1\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n                <field index=\"select_2\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n                <field index=\"input_1\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n                <field index=\"input_2\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n                <field index=\"input_3\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sheet_2\">\n            <language index=\"lDEF\">\n                <field index=\"input_1\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sheet_3\">\n            <language index=\"lDEF\">\n                <field index=\"input_1\">\n                    <value index=\"vDEF\">foo</value>\n                </field>\n                <field index=\"input_2\">\n                    <value index=\"vDEF\">bar</value>\n                </field>\n                <field index=\"input_3\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','1','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sheet_1\">\n            <language index=\"lDEF\">\n                <field index=\"select_1\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n                <field index=\"section_1\">\n                    <el index=\"el\">\n                        <section index=\"1\">\n                            <itemType index=\"container_1\">\n                                <el>\n                                    <field index=\"select_2\">\n                                        <value index=\"vDEF\">1</value>\n                                    </field>\n                                    <field index=\"input_1\">\n                                        <value index=\"vDEF\">lipsum</value>\n                                    </field>\n                                    <field index=\"input_2\">\n                                        <value index=\"vDEF\">lipsum</value>\n                                    </field>\n                                    <field index=\"input_3\">\n                                        <value index=\"vDEF\">lipsum</value>\n                                    </field>\n                                    <field index=\"input_4\">\n                                        <value index=\"vDEF\">lipsum</value>\n                                    </field>\n                                    <field index=\"input_5\">\n                                        <value index=\"vDEF\">lipsum</value>\n                                    </field>\n                                    <field index=\"input_6\">\n                                        <value index=\"vDEF\">lipsum</value>\n                                    </field>\n                                </el>\n                            </itemType>\n                        </section>\n                    </el>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sheet_2\">\n            <language index=\"lDEF\">\n                <field index=\"select_1\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','1'),(3,37,1611517876,1611517876,1,0,0,128,2,1,1,NULL,1,'',0,0,0,0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sSheetdescription_1\">\n            <language index=\"lDEF\">\n                <field index=\"input_1\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sSheetdescription_2\">\n            <language index=\"lDEF\">\n                <field index=\"input_2\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sSection\">\n            <language index=\"lDEF\">\n                <field index=\"section_1\">\n                    <el index=\"el\">\n                        <section index=\"1\">\n                            <itemType index=\"container_1\">\n                                <el>\n                                    <field index=\"input_1\">\n                                        <value index=\"vDEF\">lipsum</value>\n                                    </field>\n                                    <field index=\"input_2\">\n                                        <value index=\"vDEF\">#FF8700</value>\n                                    </field>\n                                </el>\n                            </itemType>\n                        </section>\n                        <section index=\"2\">\n                            <itemType index=\"container_2\">\n                                <el>\n                                    <field index=\"text_1\">\n                                        <value index=\"vDEF\">foo</value>\n                                    </field>\n                                </el>\n                            </itemType>\n                        </section>\n                    </el>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sInline\">\n            <language index=\"lDEF\">\n                <field index=\"inline_1\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sheet_1\">\n            <language index=\"lDEF\">\n                <field index=\"select_1\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sheet_2\">\n            <language index=\"lDEF\">\n                <field index=\"input_1\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sheet_3\">\n            <language index=\"lDEF\">\n                <field index=\"input_2\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','1','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"input_1\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n                <field index=\"input_2\">\n                    <value index=\"vDEF\">foo</value>\n                </field>\n                <field index=\"passthrough_1\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n                <field index=\"passthrough_2\">\n                    <value index=\"vDEF\">passthrough default</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sheet_1\">\n            <language index=\"lDEF\">\n                <field index=\"select_1\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n                <field index=\"select_2\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n                <field index=\"input_1\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n                <field index=\"input_2\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n                <field index=\"input_3\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sheet_2\">\n            <language index=\"lDEF\">\n                <field index=\"input_1\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sheet_3\">\n            <language index=\"lDEF\">\n                <field index=\"input_1\">\n                    <value index=\"vDEF\">foo</value>\n                </field>\n                <field index=\"input_2\">\n                    <value index=\"vDEF\">bar</value>\n                </field>\n                <field index=\"input_3\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','1','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sheet_1\">\n            <language index=\"lDEF\">\n                <field index=\"select_1\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n                <field index=\"section_1\">\n                    <el index=\"el\">\n                        <section index=\"1\">\n                            <itemType index=\"container_1\">\n                                <el>\n                                    <field index=\"select_2\">\n                                        <value index=\"vDEF\">1</value>\n                                    </field>\n                                    <field index=\"input_1\">\n                                        <value index=\"vDEF\">lipsum</value>\n                                    </field>\n                                    <field index=\"input_2\">\n                                        <value index=\"vDEF\">lipsum</value>\n                                    </field>\n                                    <field index=\"input_3\">\n                                        <value index=\"vDEF\">lipsum</value>\n                                    </field>\n                                    <field index=\"input_4\">\n                                        <value index=\"vDEF\">lipsum</value>\n                                    </field>\n                                    <field index=\"input_5\">\n                                        <value index=\"vDEF\">lipsum</value>\n                                    </field>\n                                    <field index=\"input_6\">\n                                        <value index=\"vDEF\">lipsum</value>\n                                    </field>\n                                </el>\n                            </itemType>\n                        </section>\n                    </el>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sheet_2\">\n            <language index=\"lDEF\">\n                <field index=\"select_1\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','1'),(4,37,1611517876,1611517876,1,0,0,192,3,1,3,NULL,3,'',0,0,0,0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sSheetdescription_1\">\n            <language index=\"lDEF\">\n                <field index=\"input_1\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sSheetdescription_2\">\n            <language index=\"lDEF\">\n                <field index=\"input_2\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sSection\">\n            <language index=\"lDEF\">\n                <field index=\"section_1\">\n                    <el index=\"el\">\n                        <section index=\"1\">\n                            <itemType index=\"container_1\">\n                                <el>\n                                    <field index=\"input_1\">\n                                        <value index=\"vDEF\">lipsum</value>\n                                    </field>\n                                    <field index=\"input_2\">\n                                        <value index=\"vDEF\">#FF8700</value>\n                                    </field>\n                                </el>\n                            </itemType>\n                        </section>\n                        <section index=\"2\">\n                            <itemType index=\"container_2\">\n                                <el>\n                                    <field index=\"text_1\">\n                                        <value index=\"vDEF\">foo</value>\n                                    </field>\n                                </el>\n                            </itemType>\n                        </section>\n                    </el>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sInline\">\n            <language index=\"lDEF\">\n                <field index=\"inline_1\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sheet_1\">\n            <language index=\"lDEF\">\n                <field index=\"select_1\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sheet_2\">\n            <language index=\"lDEF\">\n                <field index=\"input_1\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sheet_3\">\n            <language index=\"lDEF\">\n                <field index=\"input_2\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','1','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"input_1\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n                <field index=\"input_2\">\n                    <value index=\"vDEF\">foo</value>\n                </field>\n                <field index=\"passthrough_1\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n                <field index=\"passthrough_2\">\n                    <value index=\"vDEF\">passthrough default</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sheet_1\">\n            <language index=\"lDEF\">\n                <field index=\"select_1\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n                <field index=\"select_2\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n                <field index=\"input_1\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n                <field index=\"input_2\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n                <field index=\"input_3\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sheet_2\">\n            <language index=\"lDEF\">\n                <field index=\"input_1\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sheet_3\">\n            <language index=\"lDEF\">\n                <field index=\"input_1\">\n                    <value index=\"vDEF\">foo</value>\n                </field>\n                <field index=\"input_2\">\n                    <value index=\"vDEF\">bar</value>\n                </field>\n                <field index=\"input_3\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','1','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sheet_1\">\n            <language index=\"lDEF\">\n                <field index=\"select_1\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n                <field index=\"section_1\">\n                    <el index=\"el\">\n                        <section index=\"1\">\n                            <itemType index=\"container_1\">\n                                <el>\n                                    <field index=\"select_2\">\n                                        <value index=\"vDEF\">1</value>\n                                    </field>\n                                    <field index=\"input_1\">\n                                        <value index=\"vDEF\">lipsum</value>\n                                    </field>\n                                    <field index=\"input_2\">\n                                        <value index=\"vDEF\">lipsum</value>\n                                    </field>\n                                    <field index=\"input_3\">\n                                        <value index=\"vDEF\">lipsum</value>\n                                    </field>\n                                    <field index=\"input_4\">\n                                        <value index=\"vDEF\">lipsum</value>\n                                    </field>\n                                    <field index=\"input_5\">\n                                        <value index=\"vDEF\">lipsum</value>\n                                    </field>\n                                    <field index=\"input_6\">\n                                        <value index=\"vDEF\">lipsum</value>\n                                    </field>\n                                </el>\n                            </itemType>\n                        </section>\n                    </el>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sheet_2\">\n            <language index=\"lDEF\">\n                <field index=\"select_1\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','1'),(5,37,1611517876,1611517876,1,0,0,224,4,0,4,NULL,4,'',0,0,0,0,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sSheetdescription_1\">\n            <language index=\"lDEF\">\n                <field index=\"input_1\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sSheetdescription_2\">\n            <language index=\"lDEF\">\n                <field index=\"input_2\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sSection\">\n            <language index=\"lDEF\">\n                <field index=\"section_1\">\n                    <el index=\"el\">\n                        <section index=\"1\">\n                            <itemType index=\"container_1\">\n                                <el>\n                                    <field index=\"input_1\">\n                                        <value index=\"vDEF\">lipsum</value>\n                                    </field>\n                                    <field index=\"input_2\">\n                                        <value index=\"vDEF\">#FF8700</value>\n                                    </field>\n                                </el>\n                            </itemType>\n                        </section>\n                        <section index=\"2\">\n                            <itemType index=\"container_2\">\n                                <el>\n                                    <field index=\"text_1\">\n                                        <value index=\"vDEF\">foo</value>\n                                    </field>\n                                </el>\n                            </itemType>\n                        </section>\n                    </el>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sInline\">\n            <language index=\"lDEF\">\n                <field index=\"inline_1\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sheet_1\">\n            <language index=\"lDEF\">\n                <field index=\"select_1\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sheet_2\">\n            <language index=\"lDEF\">\n                <field index=\"input_1\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sheet_3\">\n            <language index=\"lDEF\">\n                <field index=\"input_2\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','1','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"input_1\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n                <field index=\"input_2\">\n                    <value index=\"vDEF\">foo</value>\n                </field>\n                <field index=\"passthrough_1\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n                <field index=\"passthrough_2\">\n                    <value index=\"vDEF\">passthrough default</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sheet_1\">\n            <language index=\"lDEF\">\n                <field index=\"select_1\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n                <field index=\"select_2\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n                <field index=\"input_1\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n                <field index=\"input_2\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n                <field index=\"input_3\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sheet_2\">\n            <language index=\"lDEF\">\n                <field index=\"input_1\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sheet_3\">\n            <language index=\"lDEF\">\n                <field index=\"input_1\">\n                    <value index=\"vDEF\">foo</value>\n                </field>\n                <field index=\"input_2\">\n                    <value index=\"vDEF\">bar</value>\n                </field>\n                <field index=\"input_3\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','1','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sheet_1\">\n            <language index=\"lDEF\">\n                <field index=\"select_1\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n                <field index=\"section_1\">\n                    <el index=\"el\">\n                        <section index=\"1\">\n                            <itemType index=\"container_1\">\n                                <el>\n                                    <field index=\"select_2\">\n                                        <value index=\"vDEF\">1</value>\n                                    </field>\n                                    <field index=\"input_1\">\n                                        <value index=\"vDEF\">lipsum</value>\n                                    </field>\n                                    <field index=\"input_2\">\n                                        <value index=\"vDEF\">lipsum</value>\n                                    </field>\n                                    <field index=\"input_3\">\n                                        <value index=\"vDEF\">lipsum</value>\n                                    </field>\n                                    <field index=\"input_4\">\n                                        <value index=\"vDEF\">lipsum</value>\n                                    </field>\n                                    <field index=\"input_5\">\n                                        <value index=\"vDEF\">lipsum</value>\n                                    </field>\n                                    <field index=\"input_6\">\n                                        <value index=\"vDEF\">lipsum</value>\n                                    </field>\n                                </el>\n                            </itemType>\n                        </section>\n                    </el>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sheet_2\">\n            <language index=\"lDEF\">\n                <field index=\"select_1\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','1');
/*!40000 ALTER TABLE `tx_styleguide_flex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_flex_flex_3_inline_1_child`
--

DROP TABLE IF EXISTS `tx_styleguide_flex_flex_3_inline_1_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_flex_flex_3_inline_1_child` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `parentid` int(11) NOT NULL DEFAULT 0,
  `parenttable` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_flex_flex_3_inline_1_child`
--

LOCK TABLES `tx_styleguide_flex_flex_3_inline_1_child` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_flex_flex_3_inline_1_child` DISABLE KEYS */;
INSERT INTO `tx_styleguide_flex_flex_3_inline_1_child` VALUES (1,37,0,0,0,0,0,0,0,0,0,NULL,'lipsum',1,'tx_styleguide_flex','lipsum'),(2,37,1611517876,1611517876,1,0,0,1,0,0,0,NULL,'lipsum',2,'tx_styleguide_flex','lipsum'),(3,37,1611517876,1611517876,1,0,0,1,0,0,0,NULL,'lipsum',3,'tx_styleguide_flex','lipsum'),(4,37,1611517876,1611517876,1,0,0,1,0,0,0,NULL,'lipsum',4,'tx_styleguide_flex','lipsum'),(5,37,1611517876,1611517876,1,0,0,1,0,0,0,NULL,'lipsum',5,'tx_styleguide_flex','lipsum');
/*!40000 ALTER TABLE `tx_styleguide_flex_flex_3_inline_1_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_inline_11`
--

DROP TABLE IF EXISTS `tx_styleguide_inline_11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_inline_11` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `inline_1` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_inline_11`
--

LOCK TABLES `tx_styleguide_inline_11` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_inline_11` DISABLE KEYS */;
INSERT INTO `tx_styleguide_inline_11` VALUES (1,42,1611517876,1611517876,1,0,0,0,0,0,0,NULL,0,'',0,0,0,0,0),(2,42,1611517876,1611517876,1,0,0,256,1,0,1,NULL,1,'',0,0,0,0,0),(3,42,1611517876,1611517876,1,0,0,128,2,1,1,NULL,1,'',0,0,0,0,0),(4,42,1611517876,1611517876,1,0,0,192,3,1,3,NULL,3,'',0,0,0,0,0),(5,42,1611517876,1611517876,1,0,0,224,4,0,4,NULL,4,'',0,0,0,0,0);
/*!40000 ALTER TABLE `tx_styleguide_inline_11` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_inline_11_child`
--

DROP TABLE IF EXISTS `tx_styleguide_inline_11_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_inline_11_child` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `input_1` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_inline_11_child`
--

LOCK TABLES `tx_styleguide_inline_11_child` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_inline_11_child` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_styleguide_inline_11_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_inline_1n`
--

DROP TABLE IF EXISTS `tx_styleguide_inline_1n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_inline_1n` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `inline_1` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_inline_1n`
--

LOCK TABLES `tx_styleguide_inline_1n` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_inline_1n` DISABLE KEYS */;
INSERT INTO `tx_styleguide_inline_1n` VALUES (1,47,1611517876,1611517876,1,0,0,0,0,0,0,NULL,0,'',0,0,0,0,1),(2,47,1611517876,1611517876,1,0,0,256,1,0,1,NULL,1,'',0,0,0,0,1),(3,47,1611517876,1611517876,1,0,0,128,2,1,1,NULL,1,'',0,0,0,0,1),(4,47,1611517876,1611517876,1,0,0,192,3,1,3,NULL,3,'',0,0,0,0,1),(5,47,1611517876,1611517876,1,0,0,224,4,0,4,NULL,4,'',0,0,0,0,1);
/*!40000 ALTER TABLE `tx_styleguide_inline_1n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_inline_1n1n`
--

DROP TABLE IF EXISTS `tx_styleguide_inline_1n1n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_inline_1n1n` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `inline_1` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_inline_1n1n`
--

LOCK TABLES `tx_styleguide_inline_1n1n` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_inline_1n1n` DISABLE KEYS */;
INSERT INTO `tx_styleguide_inline_1n1n` VALUES (1,52,1611517876,1611517876,1,0,0,0,0,0,0,NULL,0,'',0,0,0,0,1),(2,52,1611517876,1611517876,1,0,0,256,1,0,1,NULL,1,'',0,0,0,0,1),(3,52,1611517876,1611517876,1,0,0,128,2,1,1,NULL,1,'',0,0,0,0,1),(4,52,1611517876,1611517876,1,0,0,192,3,1,3,NULL,3,'',0,0,0,0,1),(5,52,1611517876,1611517876,1,0,0,224,4,0,4,NULL,4,'',0,0,0,0,1);
/*!40000 ALTER TABLE `tx_styleguide_inline_1n1n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_inline_1n1n_child`
--

DROP TABLE IF EXISTS `tx_styleguide_inline_1n1n_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_inline_1n1n_child` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `parentid` int(11) NOT NULL DEFAULT 0,
  `parenttable` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `inline_1` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_inline_1n1n_child`
--

LOCK TABLES `tx_styleguide_inline_1n1n_child` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_inline_1n1n_child` DISABLE KEYS */;
INSERT INTO `tx_styleguide_inline_1n1n_child` VALUES (1,52,0,0,0,0,0,0,0,0,0,NULL,0,'',0,0,0,0,1,'tx_styleguide_inline_1n1n',1),(2,52,1611517876,1611517876,1,0,0,1025,1,0,1,NULL,1,'',0,0,0,0,2,'tx_styleguide_inline_1n1n',1),(3,52,1611517876,1611517876,1,0,0,1,2,1,1,NULL,1,'',0,0,0,0,3,'tx_styleguide_inline_1n1n',1),(4,52,1611517876,1611517876,1,0,0,1,3,1,3,NULL,3,'',0,0,0,0,4,'tx_styleguide_inline_1n1n',1),(5,52,1611517876,1611517876,1,0,0,1,4,0,4,NULL,4,'',0,0,0,0,5,'tx_styleguide_inline_1n1n',1);
/*!40000 ALTER TABLE `tx_styleguide_inline_1n1n_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_inline_1n1n_childchild`
--

DROP TABLE IF EXISTS `tx_styleguide_inline_1n1n_childchild`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_inline_1n1n_childchild` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `parentid` int(11) NOT NULL DEFAULT 0,
  `parenttable` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_inline_1n1n_childchild`
--

LOCK TABLES `tx_styleguide_inline_1n1n_childchild` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_inline_1n1n_childchild` DISABLE KEYS */;
INSERT INTO `tx_styleguide_inline_1n1n_childchild` VALUES (1,52,0,0,0,0,0,0,0,0,0,NULL,0,'',0,0,0,0,1,'tx_styleguide_inline_1n1n_child','lipsum'),(2,52,1611517876,1611517876,1,0,0,1025,1,0,1,NULL,1,'',0,0,0,0,2,'tx_styleguide_inline_1n1n_child','[Translate to styleguide demo language danish:] lipsum'),(3,52,1611517876,1611517876,1,0,0,1,2,1,1,NULL,1,'',0,0,0,0,3,'tx_styleguide_inline_1n1n_child','[Translate to styleguide demo language german:] lipsum'),(4,52,1611517876,1611517876,1,0,0,1,3,1,3,NULL,3,'',0,0,0,0,4,'tx_styleguide_inline_1n1n_child','[Translate to styleguide demo language french:] [Translate to styleguide demo language german:] lipsum'),(5,52,1611517876,1611517876,1,0,0,1,4,0,4,NULL,4,'',0,0,0,0,5,'tx_styleguide_inline_1n1n_child','[Translate to styleguide demo language spanish:] [Translate to styleguide demo language french:] [Translate to styleguide demo language german:] lipsum');
/*!40000 ALTER TABLE `tx_styleguide_inline_1n1n_childchild` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_inline_1n_child`
--

DROP TABLE IF EXISTS `tx_styleguide_inline_1n_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_inline_1n_child` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `disable` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `parentid` int(11) NOT NULL DEFAULT 0,
  `parenttable` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_2` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_db_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `select_tree_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`disable`),
  KEY `translation_source` (`l10n_source`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_inline_1n_child`
--

LOCK TABLES `tx_styleguide_inline_1n_child` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_inline_1n_child` DISABLE KEYS */;
INSERT INTO `tx_styleguide_inline_1n_child` VALUES (1,47,0,0,0,0,0,0,0,0,0,NULL,'',1,'tx_styleguide_inline_1n','lipsum','#FF8700','1','1,7,12'),(2,47,1611517876,1611517876,1,0,0,1025,1,0,1,NULL,'',2,'tx_styleguide_inline_1n','[Translate to styleguide demo language danish:] lipsum','#FF8700','1','1,7,12'),(3,47,1611517876,1611517876,1,0,0,1,2,1,1,NULL,'',3,'tx_styleguide_inline_1n','[Translate to styleguide demo language german:] lipsum','#FF8700','1','1,7,12'),(4,47,1611517876,1611517876,1,0,0,1,3,1,3,NULL,'',4,'tx_styleguide_inline_1n','[Translate to styleguide demo language french:] [Translate to styleguide demo language german:] lipsum','#FF8700','1','1,7,12'),(5,47,1611517876,1611517876,1,0,0,1,4,0,4,NULL,'',5,'tx_styleguide_inline_1n','[Translate to styleguide demo language spanish:] [Translate to styleguide demo language french:] [Translate to styleguide demo language german:] lipsum','#FF8700','1','1,7,12');
/*!40000 ALTER TABLE `tx_styleguide_inline_1n_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_inline_1nnol10n`
--

DROP TABLE IF EXISTS `tx_styleguide_inline_1nnol10n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_inline_1nnol10n` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `inline_1` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_inline_1nnol10n`
--

LOCK TABLES `tx_styleguide_inline_1nnol10n` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_inline_1nnol10n` DISABLE KEYS */;
INSERT INTO `tx_styleguide_inline_1nnol10n` VALUES (1,57,1611517876,1611517876,1,0,0,0,0,0,0,NULL,0,'',0,0,0,0,1),(2,57,1611517876,1611517876,1,0,0,256,1,0,1,NULL,1,'',0,0,0,0,0),(3,57,1611517876,1611517876,1,0,0,128,2,1,1,NULL,1,'',0,0,0,0,1),(4,57,1611517876,1611517876,1,0,0,192,3,1,3,NULL,3,'',0,0,0,0,1),(5,57,1611517876,1611517876,1,0,0,224,4,0,4,NULL,4,'',0,0,0,0,0);
/*!40000 ALTER TABLE `tx_styleguide_inline_1nnol10n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_inline_1nnol10n_child`
--

DROP TABLE IF EXISTS `tx_styleguide_inline_1nnol10n_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_inline_1nnol10n_child` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `disable` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `parentid` int(11) NOT NULL DEFAULT 0,
  `parenttable` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`disable`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_inline_1nnol10n_child`
--

LOCK TABLES `tx_styleguide_inline_1nnol10n_child` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_inline_1nnol10n_child` DISABLE KEYS */;
INSERT INTO `tx_styleguide_inline_1nnol10n_child` VALUES (1,57,0,0,0,0,0,0,1,'tx_styleguide_inline_1nnol10n','lipsum'),(2,57,1611517876,1611517876,1,0,0,513,3,'tx_styleguide_inline_1nnol10n','lipsum'),(3,57,1611517876,1611517876,1,0,0,1,4,'tx_styleguide_inline_1nnol10n','lipsum');
/*!40000 ALTER TABLE `tx_styleguide_inline_1nnol10n_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_inline_expand`
--

DROP TABLE IF EXISTS `tx_styleguide_inline_expand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_inline_expand` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `inline_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_inline_expand`
--

LOCK TABLES `tx_styleguide_inline_expand` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_inline_expand` DISABLE KEYS */;
INSERT INTO `tx_styleguide_inline_expand` VALUES (1,62,1611517876,1611517876,1,0,0,0,0,0,0,NULL,0,'',0,0,0,0,'1'),(2,62,1611517876,1611517876,1,0,0,256,1,0,1,NULL,1,'',0,0,0,0,'1'),(3,62,1611517876,1611517876,1,0,0,128,2,1,1,NULL,1,'',0,0,0,0,'1'),(4,62,1611517876,1611517876,1,0,0,192,3,1,3,NULL,3,'',0,0,0,0,'1'),(5,62,1611517876,1611517876,1,0,0,224,4,0,4,NULL,4,'',0,0,0,0,'1');
/*!40000 ALTER TABLE `tx_styleguide_inline_expand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_inline_expand_inline_1_child`
--

DROP TABLE IF EXISTS `tx_styleguide_inline_expand_inline_1_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_inline_expand_inline_1_child` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `parentid` int(11) NOT NULL DEFAULT 0,
  `parenttable` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dummy_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `inline_fal_1` int(11) NOT NULL DEFAULT 0,
  `rte_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `select_tree_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3editor_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_inline_expand_inline_1_child`
--

LOCK TABLES `tx_styleguide_inline_expand_inline_1_child` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_inline_expand_inline_1_child` DISABLE KEYS */;
INSERT INTO `tx_styleguide_inline_expand_inline_1_child` VALUES (1,62,0,0,0,0,0,0,0,0,0,NULL,'lipsum',1,'tx_styleguide_inline_expand','lipsum',3,'Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','1,7,12','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.'),(2,62,1611517876,1611517876,1,0,0,1025,1,0,1,NULL,'lipsum',2,'tx_styleguide_inline_expand','lipsum',0,'Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','1,7,12','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.'),(3,62,1611517876,1611517876,1,0,0,1,2,1,1,NULL,'lipsum',3,'tx_styleguide_inline_expand','lipsum',0,'Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','1,7,12','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.'),(4,62,1611517876,1611517876,1,0,0,1,3,1,3,NULL,'lipsum',4,'tx_styleguide_inline_expand','lipsum',0,'Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','1,7,12','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.'),(5,62,1611517876,1611517876,1,0,0,1,4,0,4,NULL,'lipsum',5,'tx_styleguide_inline_expand','lipsum',0,'Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','1,7,12','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.');
/*!40000 ALTER TABLE `tx_styleguide_inline_expand_inline_1_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_inline_expandsingle`
--

DROP TABLE IF EXISTS `tx_styleguide_inline_expandsingle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_inline_expandsingle` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `inline_1` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_inline_expandsingle`
--

LOCK TABLES `tx_styleguide_inline_expandsingle` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_inline_expandsingle` DISABLE KEYS */;
INSERT INTO `tx_styleguide_inline_expandsingle` VALUES (1,67,1611517876,1611517876,1,0,0,0,0,0,0,NULL,0,'',0,0,0,0,3),(2,67,1611517876,1611517876,1,0,0,256,1,0,1,NULL,1,'',0,0,0,0,3),(3,67,1611517876,1611517876,1,0,0,128,2,1,1,NULL,1,'',0,0,0,0,3),(4,67,1611517876,1611517876,1,0,0,192,3,1,3,NULL,3,'',0,0,0,0,3),(5,67,1611517876,1611517876,1,0,0,224,4,0,4,NULL,4,'',0,0,0,0,3);
/*!40000 ALTER TABLE `tx_styleguide_inline_expandsingle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_inline_expandsingle_child`
--

DROP TABLE IF EXISTS `tx_styleguide_inline_expandsingle_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_inline_expandsingle_child` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `parentid` int(11) NOT NULL DEFAULT 0,
  `parenttable` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_inline_expandsingle_child`
--

LOCK TABLES `tx_styleguide_inline_expandsingle_child` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_inline_expandsingle_child` DISABLE KEYS */;
INSERT INTO `tx_styleguide_inline_expandsingle_child` VALUES (1,67,0,0,0,0,0,0,0,0,0,NULL,0,'',0,0,0,0,1,'tx_styleguide_inline_expandsingle','lipsum1'),(2,67,0,0,0,0,0,0,0,0,0,NULL,0,'',0,0,0,0,1,'tx_styleguide_inline_expandsingle','lipsum2'),(3,67,0,0,0,0,0,0,0,0,0,NULL,0,'',0,0,0,0,1,'tx_styleguide_inline_expandsingle','lipsum3'),(4,67,1611517876,1611517876,1,0,0,3585,1,0,1,NULL,1,'',0,0,0,0,2,'tx_styleguide_inline_expandsingle','[Translate to styleguide demo language danish:] lipsum1'),(5,67,1611517876,1611517876,1,0,0,3586,1,0,2,NULL,2,'',0,0,0,0,2,'tx_styleguide_inline_expandsingle','[Translate to styleguide demo language danish:] lipsum2'),(6,67,1611517876,1611517876,1,0,0,3587,1,0,3,NULL,3,'',0,0,0,0,2,'tx_styleguide_inline_expandsingle','[Translate to styleguide demo language danish:] lipsum3'),(7,67,1611517876,1611517876,1,0,0,1,2,1,1,NULL,1,'',0,0,0,0,3,'tx_styleguide_inline_expandsingle','[Translate to styleguide demo language german:] lipsum1'),(8,67,1611517876,1611517876,1,0,0,1538,2,2,2,NULL,2,'',0,0,0,0,3,'tx_styleguide_inline_expandsingle','[Translate to styleguide demo language german:] lipsum2'),(9,67,1611517876,1611517876,1,0,0,2051,2,3,3,NULL,3,'',0,0,0,0,3,'tx_styleguide_inline_expandsingle','[Translate to styleguide demo language german:] lipsum3'),(10,67,1611517876,1611517876,1,0,0,1,3,1,7,NULL,7,'',0,0,0,0,4,'tx_styleguide_inline_expandsingle','[Translate to styleguide demo language french:] [Translate to styleguide demo language german:] lipsum1'),(11,67,1611517876,1611517876,1,0,0,514,3,2,8,NULL,8,'',0,0,0,0,4,'tx_styleguide_inline_expandsingle','[Translate to styleguide demo language french:] [Translate to styleguide demo language german:] lipsum2'),(12,67,1611517876,1611517876,1,0,0,1027,3,3,9,NULL,9,'',0,0,0,0,4,'tx_styleguide_inline_expandsingle','[Translate to styleguide demo language french:] [Translate to styleguide demo language german:] lipsum3'),(13,67,1611517876,1611517876,1,0,0,1,4,0,10,NULL,10,'',0,0,0,0,5,'tx_styleguide_inline_expandsingle','[Translate to styleguide demo language spanish:] [Translate to styleguide demo language french:] [Translate to styleguide demo language german:] lipsum1'),(14,67,1611517876,1611517876,1,0,0,2,4,0,11,NULL,11,'',0,0,0,0,5,'tx_styleguide_inline_expandsingle','[Translate to styleguide demo language spanish:] [Translate to styleguide demo language french:] [Translate to styleguide demo language german:] lipsum2'),(15,67,1611517876,1611517876,1,0,0,3,4,0,12,NULL,12,'',0,0,0,0,5,'tx_styleguide_inline_expandsingle','[Translate to styleguide demo language spanish:] [Translate to styleguide demo language french:] [Translate to styleguide demo language german:] lipsum3');
/*!40000 ALTER TABLE `tx_styleguide_inline_expandsingle_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_inline_fal`
--

DROP TABLE IF EXISTS `tx_styleguide_inline_fal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_inline_fal` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `inline_1` int(11) NOT NULL DEFAULT 0,
  `inline_2` int(11) NOT NULL DEFAULT 0,
  `inline_3` int(11) NOT NULL DEFAULT 0,
  `inline_4` int(11) NOT NULL DEFAULT 0,
  `inline_flex_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_inline_fal`
--

LOCK TABLES `tx_styleguide_inline_fal` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_inline_fal` DISABLE KEYS */;
INSERT INTO `tx_styleguide_inline_fal` VALUES (1,72,1611517876,1611517876,1,0,0,0,0,0,0,NULL,0,'',0,0,0,0,3,3,3,3,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sInline\">\n            <language index=\"lDEF\">\n                <field index=\"fal\">\n                    <value index=\"vDEF\">3</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>'),(2,72,1611517876,1611517876,1,0,0,256,1,0,1,NULL,1,'',0,0,0,0,3,3,3,3,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sInline\">\n            <language index=\"lDEF\">\n                <field index=\"fal\">\n                    <value index=\"vDEF\">3</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>'),(3,72,1611517876,1611517876,1,0,0,128,2,1,1,'{\"inline_4\":\"parent\"}',1,'',0,0,0,0,3,3,3,3,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sInline\">\n            <language index=\"lDEF\">\n                <field index=\"fal\">\n                    <value index=\"vDEF\">3</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>'),(4,72,1611517876,1611517876,1,0,0,192,3,1,3,'{\"inline_4\":\"parent\"}',3,'',0,0,0,0,3,3,3,3,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sInline\">\n            <language index=\"lDEF\">\n                <field index=\"fal\">\n                    <value index=\"vDEF\">3</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>'),(5,72,1611517876,1611517876,1,0,0,224,4,0,4,'{\"inline_4\":\"parent\"}',4,'',0,0,0,0,3,3,3,3,'<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sInline\">\n            <language index=\"lDEF\">\n                <field index=\"fal\">\n                    <value index=\"vDEF\">3</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>');
/*!40000 ALTER TABLE `tx_styleguide_inline_fal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_inline_foreignrecorddefaults`
--

DROP TABLE IF EXISTS `tx_styleguide_inline_foreignrecorddefaults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_inline_foreignrecorddefaults` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `inline_1` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_inline_foreignrecorddefaults`
--

LOCK TABLES `tx_styleguide_inline_foreignrecorddefaults` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_inline_foreignrecorddefaults` DISABLE KEYS */;
INSERT INTO `tx_styleguide_inline_foreignrecorddefaults` VALUES (1,77,1611517876,1611517876,1,0,0,0,0,0,0,NULL,0,'',0,0,0,0,1),(2,77,1611517876,1611517876,1,0,0,256,1,0,1,NULL,1,'',0,0,0,0,1),(3,77,1611517876,1611517876,1,0,0,128,2,1,1,NULL,1,'',0,0,0,0,1),(4,77,1611517876,1611517876,1,0,0,192,3,1,3,NULL,3,'',0,0,0,0,1),(5,77,1611517876,1611517876,1,0,0,224,4,0,4,NULL,4,'',0,0,0,0,1);
/*!40000 ALTER TABLE `tx_styleguide_inline_foreignrecorddefaults` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_inline_foreignrecorddefaults_child`
--

DROP TABLE IF EXISTS `tx_styleguide_inline_foreignrecorddefaults_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_inline_foreignrecorddefaults_child` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `parentid` int(11) NOT NULL DEFAULT 0,
  `parenttable` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_inline_foreignrecorddefaults_child`
--

LOCK TABLES `tx_styleguide_inline_foreignrecorddefaults_child` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_inline_foreignrecorddefaults_child` DISABLE KEYS */;
INSERT INTO `tx_styleguide_inline_foreignrecorddefaults_child` VALUES (1,77,0,0,0,0,0,0,0,0,0,NULL,0,'',0,0,0,0,1,'tx_styleguide_inline_foreignrecorddefaults','lipsum'),(2,77,1611517876,1611517876,1,0,0,1025,1,0,1,NULL,1,'',0,0,0,0,2,'tx_styleguide_inline_foreignrecorddefaults','[Translate to styleguide demo language danish:] lipsum'),(3,77,1611517876,1611517876,1,0,0,1,2,1,1,NULL,1,'',0,0,0,0,3,'tx_styleguide_inline_foreignrecorddefaults','[Translate to styleguide demo language german:] lipsum'),(4,77,1611517876,1611517876,1,0,0,1,3,1,3,NULL,3,'',0,0,0,0,4,'tx_styleguide_inline_foreignrecorddefaults','[Translate to styleguide demo language french:] [Translate to styleguide demo language german:] lipsum'),(5,77,1611517876,1611517876,1,0,0,1,4,0,4,NULL,4,'',0,0,0,0,5,'tx_styleguide_inline_foreignrecorddefaults','[Translate to styleguide demo language spanish:] [Translate to styleguide demo language french:] [Translate to styleguide demo language german:] lipsum');
/*!40000 ALTER TABLE `tx_styleguide_inline_foreignrecorddefaults_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_inline_mm`
--

DROP TABLE IF EXISTS `tx_styleguide_inline_mm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_inline_mm` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `title` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  `inline_1` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_inline_mm`
--

LOCK TABLES `tx_styleguide_inline_mm` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_inline_mm` DISABLE KEYS */;
INSERT INTO `tx_styleguide_inline_mm` VALUES (1,82,1611517876,1611517876,1,0,0,0,0,0,0,NULL,0,'lipsum',0,0,0,0,'lipsum',0),(2,82,1611517876,1611517876,1,0,0,256,1,0,1,NULL,1,'lipsum',0,0,0,0,'[Translate to styleguide demo language danish:] lipsum',0),(3,82,1611517876,1611517876,1,0,0,128,2,1,1,NULL,1,'lipsum',0,0,0,0,'[Translate to styleguide demo language german:] lipsum',0),(4,82,1611517876,1611517876,1,0,0,192,3,1,3,NULL,3,'lipsum',0,0,0,0,'[Translate to styleguide demo language french:] [Translate to styleguide demo language german:] lipsum',0),(5,82,1611517876,1611517876,1,0,0,224,4,0,4,NULL,4,'lipsum',0,0,0,0,'[Translate to styleguide demo language spanish:] [Translate to styleguide demo language french:] [Translate to styleguide demo language german:] lipsum',0);
/*!40000 ALTER TABLE `tx_styleguide_inline_mm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_inline_mm_child`
--

DROP TABLE IF EXISTS `tx_styleguide_inline_mm_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_inline_mm_child` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `title` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  `parents` int(11) NOT NULL DEFAULT 0,
  `inline_2` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_inline_mm_child`
--

LOCK TABLES `tx_styleguide_inline_mm_child` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_inline_mm_child` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_styleguide_inline_mm_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_inline_mm_child_childchild_rel`
--

DROP TABLE IF EXISTS `tx_styleguide_inline_mm_child_childchild_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_inline_mm_child_childchild_rel` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uid_local` int(11) NOT NULL DEFAULT 0,
  `uid_foreign` int(11) NOT NULL DEFAULT 0,
  `tablenames` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sorting_foreign` int(11) NOT NULL DEFAULT 0,
  `ident` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `uid_local` (`uid_local`),
  KEY `uid_foreign` (`uid_foreign`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_inline_mm_child_childchild_rel`
--

LOCK TABLES `tx_styleguide_inline_mm_child_childchild_rel` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_inline_mm_child_childchild_rel` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_styleguide_inline_mm_child_childchild_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_inline_mm_child_rel`
--

DROP TABLE IF EXISTS `tx_styleguide_inline_mm_child_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_inline_mm_child_rel` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uid_local` int(11) NOT NULL DEFAULT 0,
  `uid_foreign` int(11) NOT NULL DEFAULT 0,
  `tablenames` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sorting_foreign` int(11) NOT NULL DEFAULT 0,
  `ident` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `uid_local` (`uid_local`),
  KEY `uid_foreign` (`uid_foreign`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_inline_mm_child_rel`
--

LOCK TABLES `tx_styleguide_inline_mm_child_rel` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_inline_mm_child_rel` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_styleguide_inline_mm_child_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_inline_mm_childchild`
--

DROP TABLE IF EXISTS `tx_styleguide_inline_mm_childchild`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_inline_mm_childchild` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `title` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  `parents` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_inline_mm_childchild`
--

LOCK TABLES `tx_styleguide_inline_mm_childchild` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_inline_mm_childchild` DISABLE KEYS */;
/*!40000 ALTER TABLE `tx_styleguide_inline_mm_childchild` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_inline_mn`
--

DROP TABLE IF EXISTS `tx_styleguide_inline_mn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_inline_mn` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `input_1` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  `inline_1` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_inline_mn`
--

LOCK TABLES `tx_styleguide_inline_mn` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_inline_mn` DISABLE KEYS */;
INSERT INTO `tx_styleguide_inline_mn` VALUES (1,87,1611517876,1611517876,1,0,0,0,0,0,0,NULL,0,'lipsum',0,0,0,0,'lipsum',2),(2,87,1611517876,1611517876,1,0,0,256,1,0,1,NULL,1,'lipsum',0,0,0,0,'[Translate to styleguide demo language danish:] lipsum',0),(3,87,1611517876,1611517876,1,0,0,128,2,1,1,NULL,1,'lipsum',0,0,0,0,'[Translate to styleguide demo language german:] lipsum',0),(4,87,1611517876,1611517876,1,0,0,192,3,1,3,NULL,3,'lipsum',0,0,0,0,'[Translate to styleguide demo language french:] [Translate to styleguide demo language german:] lipsum',0),(5,87,1611517876,1611517876,1,0,0,224,4,0,4,NULL,4,'lipsum',0,0,0,0,'[Translate to styleguide demo language spanish:] [Translate to styleguide demo language french:] [Translate to styleguide demo language german:] lipsum',0);
/*!40000 ALTER TABLE `tx_styleguide_inline_mn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_inline_mn_child`
--

DROP TABLE IF EXISTS `tx_styleguide_inline_mn_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_inline_mn_child` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `input_1` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  `parents` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_inline_mn_child`
--

LOCK TABLES `tx_styleguide_inline_mn_child` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_inline_mn_child` DISABLE KEYS */;
INSERT INTO `tx_styleguide_inline_mn_child` VALUES (1,87,1611517876,1611517876,1,0,0,0,0,0,0,NULL,0,'lipsum',0,0,0,0,'lipsum1',0),(2,87,1611517876,1611517876,1,0,0,0,0,0,0,NULL,0,'lipsum',0,0,0,0,'lipsum2',0),(3,87,1611517876,1611517876,1,0,0,0,0,0,0,NULL,0,'lipsum',0,0,0,0,'lipsum3',0),(4,87,1611517876,1611517876,1,0,0,0,0,0,0,NULL,0,'lipsum',0,0,0,0,'lipsum4',0);
/*!40000 ALTER TABLE `tx_styleguide_inline_mn_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_inline_mn_mm`
--

DROP TABLE IF EXISTS `tx_styleguide_inline_mn_mm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_inline_mn_mm` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `parentid` int(11) NOT NULL DEFAULT 0,
  `childid` int(11) NOT NULL DEFAULT 0,
  `parentsort` int(11) NOT NULL DEFAULT 0,
  `childsort` int(11) NOT NULL DEFAULT 0,
  `check_1` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_inline_mn_mm`
--

LOCK TABLES `tx_styleguide_inline_mn_mm` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_inline_mn_mm` DISABLE KEYS */;
INSERT INTO `tx_styleguide_inline_mn_mm` VALUES (1,87,1611517876,1611517876,1,0,0,0,0,0,NULL,0,NULL,0,0,0,0,1,1,0,0,0),(2,87,1611517876,1611517876,1,0,0,0,0,0,NULL,0,NULL,0,0,0,0,1,2,0,0,0);
/*!40000 ALTER TABLE `tx_styleguide_inline_mn_mm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_inline_mngroup`
--

DROP TABLE IF EXISTS `tx_styleguide_inline_mngroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_inline_mngroup` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `input_1` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  `inline_1` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_inline_mngroup`
--

LOCK TABLES `tx_styleguide_inline_mngroup` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_inline_mngroup` DISABLE KEYS */;
INSERT INTO `tx_styleguide_inline_mngroup` VALUES (1,92,1611517876,1611517876,1,0,0,0,0,0,0,NULL,0,'lipsum',0,0,0,0,'lipsum',2),(2,92,1611517876,1611517876,1,0,0,256,1,0,1,NULL,1,'lipsum',0,0,0,0,'[Translate to styleguide demo language danish:] lipsum',0),(3,92,1611517876,1611517876,1,0,0,128,2,1,1,NULL,1,'lipsum',0,0,0,0,'[Translate to styleguide demo language german:] lipsum',0),(4,92,1611517876,1611517876,1,0,0,192,3,1,3,NULL,3,'lipsum',0,0,0,0,'[Translate to styleguide demo language french:] [Translate to styleguide demo language german:] lipsum',0),(5,92,1611517876,1611517876,1,0,0,224,4,0,4,NULL,4,'lipsum',0,0,0,0,'[Translate to styleguide demo language spanish:] [Translate to styleguide demo language french:] [Translate to styleguide demo language german:] lipsum',0);
/*!40000 ALTER TABLE `tx_styleguide_inline_mngroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_inline_mngroup_child`
--

DROP TABLE IF EXISTS `tx_styleguide_inline_mngroup_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_inline_mngroup_child` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `input_1` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  `parents` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_inline_mngroup_child`
--

LOCK TABLES `tx_styleguide_inline_mngroup_child` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_inline_mngroup_child` DISABLE KEYS */;
INSERT INTO `tx_styleguide_inline_mngroup_child` VALUES (1,92,1611517876,1611517876,1,0,0,0,0,0,0,NULL,0,'lipsum',0,0,0,0,'lipsum',0),(2,92,1611517876,1611517876,1,0,0,0,0,0,0,NULL,0,'lipsum',0,0,0,0,'lipsum',0),(3,92,1611517876,1611517876,1,0,0,0,0,0,0,NULL,0,'lipsum',0,0,0,0,'lipsum',0),(4,92,1611517876,1611517876,1,0,0,0,0,0,0,NULL,0,'lipsum',0,0,0,0,'lipsum',0);
/*!40000 ALTER TABLE `tx_styleguide_inline_mngroup_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_inline_mngroup_mm`
--

DROP TABLE IF EXISTS `tx_styleguide_inline_mngroup_mm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_inline_mngroup_mm` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `parentid` int(11) NOT NULL DEFAULT 0,
  `childid` int(11) NOT NULL DEFAULT 0,
  `parentsort` int(11) NOT NULL DEFAULT 0,
  `childsort` int(11) NOT NULL DEFAULT 0,
  `check_1` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_inline_mngroup_mm`
--

LOCK TABLES `tx_styleguide_inline_mngroup_mm` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_inline_mngroup_mm` DISABLE KEYS */;
INSERT INTO `tx_styleguide_inline_mngroup_mm` VALUES (1,92,1611517876,1611517876,1,0,0,0,0,0,NULL,0,NULL,0,0,0,0,1,1,0,0,0),(2,92,1611517876,1611517876,1,0,0,0,0,0,NULL,0,NULL,0,0,0,0,1,2,0,0,0);
/*!40000 ALTER TABLE `tx_styleguide_inline_mngroup_mm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_inline_mnsymmetric`
--

DROP TABLE IF EXISTS `tx_styleguide_inline_mnsymmetric`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_inline_mnsymmetric` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `input_1` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  `branches` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_inline_mnsymmetric`
--

LOCK TABLES `tx_styleguide_inline_mnsymmetric` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_inline_mnsymmetric` DISABLE KEYS */;
INSERT INTO `tx_styleguide_inline_mnsymmetric` VALUES (1,97,1611517876,1611517876,1,0,0,0,0,0,0,NULL,0,'lipsum',0,0,0,0,'lipsum1',2),(2,97,1611517876,1611517876,1,0,0,3328,1,0,1,NULL,1,'lipsum',0,0,0,0,'[Translate to styleguide demo language danish:] lipsum1',0),(3,97,1611517876,1611517876,1,0,0,3200,2,1,1,NULL,1,'lipsum',0,0,0,0,'[Translate to styleguide demo language german:] lipsum1',0),(4,97,1611517876,1611517876,1,0,0,3264,3,1,3,NULL,3,'lipsum',0,0,0,0,'[Translate to styleguide demo language french:] [Translate to styleguide demo language german:] lipsum1',0),(5,97,1611517876,1611517876,1,0,0,3296,4,0,4,NULL,4,'lipsum',0,0,0,0,'[Translate to styleguide demo language spanish:] [Translate to styleguide demo language french:] [Translate to styleguide demo language german:] lipsum1',0),(6,97,1611517876,1611517876,1,0,0,0,0,0,0,NULL,0,'lipsum',0,0,0,0,'lipsum6',0),(7,97,1611517876,1611517876,1,0,0,2816,1,0,6,NULL,6,'lipsum',0,0,0,0,'[Translate to styleguide demo language danish:] lipsum6',0),(8,97,1611517876,1611517876,1,0,0,2304,2,6,6,NULL,6,'lipsum',0,0,0,0,'[Translate to styleguide demo language german:] lipsum6',0),(9,97,1611517876,1611517876,1,0,0,2560,3,6,8,NULL,8,'lipsum',0,0,0,0,'[Translate to styleguide demo language french:] [Translate to styleguide demo language german:] lipsum6',0),(10,97,1611517876,1611517876,1,0,0,2688,4,0,9,NULL,9,'lipsum',0,0,0,0,'[Translate to styleguide demo language spanish:] [Translate to styleguide demo language french:] [Translate to styleguide demo language german:] lipsum6',0),(11,97,1611517876,1611517876,1,0,0,0,0,0,0,NULL,0,'lipsum',0,0,0,0,'lipsum11',0),(12,97,1611517876,1611517876,1,0,0,1792,1,0,11,NULL,11,'lipsum',0,0,0,0,'[Translate to styleguide demo language danish:] lipsum11',0),(13,97,1611517876,1611517876,1,0,0,1280,2,11,11,NULL,11,'lipsum',0,0,0,0,'[Translate to styleguide demo language german:] lipsum11',0),(14,97,1611517876,1611517876,1,0,0,1536,3,11,13,NULL,13,'lipsum',0,0,0,0,'[Translate to styleguide demo language french:] [Translate to styleguide demo language german:] lipsum11',0),(15,97,1611517876,1611517876,1,0,0,1664,4,0,14,NULL,14,'lipsum',0,0,0,0,'[Translate to styleguide demo language spanish:] [Translate to styleguide demo language french:] [Translate to styleguide demo language german:] lipsum11',0),(16,97,1611517876,1611517876,1,0,0,0,0,0,0,NULL,0,'lipsum',0,0,0,0,'lipsum16',0),(17,97,1611517876,1611517876,1,0,0,768,1,0,16,NULL,16,'lipsum',0,0,0,0,'[Translate to styleguide demo language danish:] lipsum16',0),(18,97,1611517876,1611517876,1,0,0,256,2,16,16,NULL,16,'lipsum',0,0,0,0,'[Translate to styleguide demo language german:] lipsum16',0),(19,97,1611517876,1611517876,1,0,0,512,3,16,18,NULL,18,'lipsum',0,0,0,0,'[Translate to styleguide demo language french:] [Translate to styleguide demo language german:] lipsum16',0),(20,97,1611517876,1611517876,1,0,0,640,4,0,19,NULL,19,'lipsum',0,0,0,0,'[Translate to styleguide demo language spanish:] [Translate to styleguide demo language french:] [Translate to styleguide demo language german:] lipsum16',0);
/*!40000 ALTER TABLE `tx_styleguide_inline_mnsymmetric` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_inline_mnsymmetric_mm`
--

DROP TABLE IF EXISTS `tx_styleguide_inline_mnsymmetric_mm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_inline_mnsymmetric_mm` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `hotelid` int(11) NOT NULL DEFAULT 0,
  `branchid` int(11) NOT NULL DEFAULT 0,
  `hotelsort` int(11) NOT NULL DEFAULT 0,
  `branchsort` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_inline_mnsymmetric_mm`
--

LOCK TABLES `tx_styleguide_inline_mnsymmetric_mm` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_inline_mnsymmetric_mm` DISABLE KEYS */;
INSERT INTO `tx_styleguide_inline_mnsymmetric_mm` VALUES (1,97,1611517876,1611517876,1,0,0,0,0,0,NULL,0,NULL,0,0,0,0,1,6,0,0),(2,97,1611517876,1611517876,1,0,0,0,0,0,NULL,0,NULL,0,0,0,0,1,11,0,0);
/*!40000 ALTER TABLE `tx_styleguide_inline_mnsymmetric_mm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_inline_parentnosoftdelete`
--

DROP TABLE IF EXISTS `tx_styleguide_inline_parentnosoftdelete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_inline_parentnosoftdelete` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `inline_1` int(11) NOT NULL DEFAULT 0,
  `text_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`hidden`),
  KEY `translation_source` (`l10n_source`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_inline_parentnosoftdelete`
--

LOCK TABLES `tx_styleguide_inline_parentnosoftdelete` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_inline_parentnosoftdelete` DISABLE KEYS */;
INSERT INTO `tx_styleguide_inline_parentnosoftdelete` VALUES (1,102,1611517876,1611517876,1,0,0,0,0,NULL,'lipsum',0,0,0,0,3,'lipsum'),(2,102,1611517876,1611517876,1,0,1,0,1,NULL,'lipsum',0,0,0,0,3,'lipsum'),(3,102,1611517876,1611517876,1,0,2,1,1,NULL,'lipsum',0,0,0,0,3,'lipsum'),(4,102,1611517876,1611517876,1,0,3,1,3,NULL,'lipsum',0,0,0,0,3,'lipsum'),(5,102,1611517876,1611517876,1,0,4,0,4,NULL,'lipsum',0,0,0,0,3,'lipsum');
/*!40000 ALTER TABLE `tx_styleguide_inline_parentnosoftdelete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_inline_usecombination`
--

DROP TABLE IF EXISTS `tx_styleguide_inline_usecombination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_inline_usecombination` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `inline_1` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_inline_usecombination`
--

LOCK TABLES `tx_styleguide_inline_usecombination` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_inline_usecombination` DISABLE KEYS */;
INSERT INTO `tx_styleguide_inline_usecombination` VALUES (1,107,1611517876,1611517876,1,0,0,0,0,0,0,NULL,0,'lipsum',0,0,0,0,2),(2,107,1611517876,1611517876,1,0,0,256,1,0,1,NULL,1,'lipsum',0,0,0,0,2),(3,107,1611517876,1611517876,1,0,0,128,2,1,1,NULL,1,'lipsum',0,0,0,0,2),(4,107,1611517876,1611517876,1,0,0,192,3,1,3,NULL,3,'lipsum',0,0,0,0,2),(5,107,1611517876,1611517876,1,0,0,224,4,0,4,NULL,4,'lipsum',0,0,0,0,2);
/*!40000 ALTER TABLE `tx_styleguide_inline_usecombination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_inline_usecombination_child`
--

DROP TABLE IF EXISTS `tx_styleguide_inline_usecombination_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_inline_usecombination_child` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `input_1` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_inline_usecombination_child`
--

LOCK TABLES `tx_styleguide_inline_usecombination_child` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_inline_usecombination_child` DISABLE KEYS */;
INSERT INTO `tx_styleguide_inline_usecombination_child` VALUES (1,107,0,0,0,0,0,0,0,0,NULL,'lipsum','lipsum1'),(2,107,0,0,0,0,0,0,0,0,NULL,'lipsum','lipsum2'),(3,107,0,0,0,0,0,0,0,0,NULL,'lipsum','lipsum3'),(4,107,0,0,0,0,0,0,0,0,NULL,'lipsum','lipsum4');
/*!40000 ALTER TABLE `tx_styleguide_inline_usecombination_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_inline_usecombination_mm`
--

DROP TABLE IF EXISTS `tx_styleguide_inline_usecombination_mm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_inline_usecombination_mm` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `select_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `select_child` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_inline_usecombination_mm`
--

LOCK TABLES `tx_styleguide_inline_usecombination_mm` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_inline_usecombination_mm` DISABLE KEYS */;
INSERT INTO `tx_styleguide_inline_usecombination_mm` VALUES (1,107,0,0,0,0,0,0,0,0,NULL,NULL,1,1),(2,107,0,0,0,0,0,0,0,0,NULL,NULL,1,2),(3,107,1611517876,1611517876,1,0,0,1,0,1,NULL,NULL,2,1),(4,107,1611517876,1611517876,1,0,0,1,0,2,NULL,NULL,2,2),(5,107,1611517876,1611517876,1,0,0,2,1,1,NULL,NULL,3,1),(6,107,1611517876,1611517876,1,0,0,2,2,2,NULL,NULL,3,2),(7,107,1611517876,1611517876,1,0,0,3,1,5,NULL,NULL,4,1),(8,107,1611517876,1611517876,1,0,0,3,2,6,NULL,NULL,4,2),(9,107,1611517876,1611517876,1,0,0,4,0,7,NULL,NULL,5,1),(10,107,1611517876,1611517876,1,0,0,4,0,8,NULL,NULL,5,2);
/*!40000 ALTER TABLE `tx_styleguide_inline_usecombination_mm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_inline_usecombinationbox`
--

DROP TABLE IF EXISTS `tx_styleguide_inline_usecombinationbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_inline_usecombinationbox` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `inline_1` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_inline_usecombinationbox`
--

LOCK TABLES `tx_styleguide_inline_usecombinationbox` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_inline_usecombinationbox` DISABLE KEYS */;
INSERT INTO `tx_styleguide_inline_usecombinationbox` VALUES (1,112,1611517876,1611517876,1,0,0,0,0,0,0,NULL,0,'lipsum',0,0,0,0,2),(2,112,1611517876,1611517876,1,0,0,256,1,0,1,NULL,1,'lipsum',0,0,0,0,2),(3,112,1611517876,1611517876,1,0,0,128,2,1,1,NULL,1,'lipsum',0,0,0,0,2),(4,112,1611517876,1611517876,1,0,0,192,3,1,3,NULL,3,'lipsum',0,0,0,0,2),(5,112,1611517876,1611517876,1,0,0,224,4,0,4,NULL,4,'lipsum',0,0,0,0,2);
/*!40000 ALTER TABLE `tx_styleguide_inline_usecombinationbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_inline_usecombinationbox_child`
--

DROP TABLE IF EXISTS `tx_styleguide_inline_usecombinationbox_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_inline_usecombinationbox_child` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `input_1` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_inline_usecombinationbox_child`
--

LOCK TABLES `tx_styleguide_inline_usecombinationbox_child` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_inline_usecombinationbox_child` DISABLE KEYS */;
INSERT INTO `tx_styleguide_inline_usecombinationbox_child` VALUES (1,112,0,0,0,0,0,0,0,0,NULL,'lipsum','lipsum1'),(2,112,0,0,0,0,0,0,0,0,NULL,'lipsum','lipsum2'),(3,112,0,0,0,0,0,0,0,0,NULL,'lipsum','lipsum3'),(4,112,0,0,0,0,0,0,0,0,NULL,'lipsum','lipsum4');
/*!40000 ALTER TABLE `tx_styleguide_inline_usecombinationbox_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_inline_usecombinationbox_mm`
--

DROP TABLE IF EXISTS `tx_styleguide_inline_usecombinationbox_mm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_inline_usecombinationbox_mm` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `select_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `select_child` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_inline_usecombinationbox_mm`
--

LOCK TABLES `tx_styleguide_inline_usecombinationbox_mm` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_inline_usecombinationbox_mm` DISABLE KEYS */;
INSERT INTO `tx_styleguide_inline_usecombinationbox_mm` VALUES (1,112,0,0,0,0,0,0,0,0,NULL,NULL,1,1),(2,112,0,0,0,0,0,0,0,0,NULL,NULL,1,2),(3,112,1611517876,1611517876,1,0,0,1,0,1,NULL,NULL,2,1),(4,112,1611517876,1611517876,1,0,0,1,0,2,NULL,NULL,2,2),(5,112,1611517876,1611517876,1,0,0,2,1,1,NULL,NULL,3,1),(6,112,1611517876,1611517876,1,0,0,2,2,2,NULL,NULL,3,2),(7,112,1611517876,1611517876,1,0,0,3,1,5,NULL,NULL,4,1),(8,112,1611517876,1611517876,1,0,0,3,2,6,NULL,NULL,4,2),(9,112,1611517876,1611517876,1,0,0,4,0,7,NULL,NULL,5,1),(10,112,1611517876,1611517876,1,0,0,4,0,8,NULL,NULL,5,2);
/*!40000 ALTER TABLE `tx_styleguide_inline_usecombinationbox_mm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_palette`
--

DROP TABLE IF EXISTS `tx_styleguide_palette`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_palette` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `palette_1_1` int(11) NOT NULL DEFAULT 0,
  `palette_1_3` int(11) NOT NULL DEFAULT 0,
  `palette_2_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `palette_3_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `palette_3_2` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `palette_4_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `palette_4_2` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `palette_4_3` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `palette_4_4` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `palette_5_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `palette_5_2` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `palette_6_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `palette_7_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_palette`
--

LOCK TABLES `tx_styleguide_palette` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_palette` DISABLE KEYS */;
INSERT INTO `tx_styleguide_palette` VALUES (1,117,1611517876,1611517876,1,0,0,0,0,0,0,NULL,0,'lipsum',0,0,0,0,1,1,'lipsum','lipsum','lipsum','lipsum','lipsum','lipsum','lipsum','lipsum','lipsum','lipsum','lipsum'),(2,117,1611517876,1611517876,1,0,0,256,1,0,1,NULL,1,'lipsum',0,0,0,0,1,1,'lipsum','lipsum','lipsum','lipsum','lipsum','lipsum','lipsum','lipsum','lipsum','lipsum','lipsum'),(3,117,1611517876,1611517876,1,0,0,128,2,1,1,NULL,1,'lipsum',0,0,0,0,1,1,'lipsum','lipsum','lipsum','lipsum','lipsum','lipsum','lipsum','lipsum','lipsum','lipsum','lipsum'),(4,117,1611517876,1611517876,1,0,0,192,3,1,3,NULL,3,'lipsum',0,0,0,0,1,1,'lipsum','lipsum','lipsum','lipsum','lipsum','lipsum','lipsum','lipsum','lipsum','lipsum','lipsum'),(5,117,1611517876,1611517876,1,0,0,224,4,0,4,NULL,4,'lipsum',0,0,0,0,1,1,'lipsum','lipsum','lipsum','lipsum','lipsum','lipsum','lipsum','lipsum','lipsum','lipsum','lipsum');
/*!40000 ALTER TABLE `tx_styleguide_palette` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_required`
--

DROP TABLE IF EXISTS `tx_styleguide_required`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_required` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `notrequired_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_2` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_3` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `select_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `select_2` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `select_3` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `select_4` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `select_5` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_2` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `rte_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `rte_2` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `inline_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `inline_2` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `inline_3` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `flex_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `flex_2` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `palette_input_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `palette_input_2` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_required`
--

LOCK TABLES `tx_styleguide_required` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_required` DISABLE KEYS */;
INSERT INTO `tx_styleguide_required` VALUES (1,122,1611517876,1611517876,1,0,0,0,0,0,0,NULL,0,'lipsum',0,0,0,0,'lipsum','lipsum','-315619200','https://typo3.org','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','2,3','2','2','2','1,7,12','1','1','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','1','1','1','1','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"text_1\">\n                    <value index=\"vDEF\">Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sGeneral\">\n            <language index=\"lDEF\">\n                <field index=\"input_1\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sSections\">\n            <language index=\"lDEF\">\n                <field index=\"section_1\">\n                    <el index=\"el\">\n                        <section index=\"1\">\n                            <itemType index=\"container_1\">\n                                <el>\n                                    <field index=\"input_1\">\n                                        <value index=\"vDEF\">lipsum</value>\n                                    </field>\n                                </el>\n                            </itemType>\n                        </section>\n                    </el>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sInline\">\n            <language index=\"lDEF\">\n                <field index=\"inline_1\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','lipsum','lipsum'),(2,122,1611517876,1611517876,1,0,0,256,1,0,1,NULL,1,'lipsum',0,0,0,0,'lipsum','lipsum','-315619200','https://typo3.org','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','2,3','2','2','2','1,7,12','1','1','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','1','1','1','1','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"text_1\">\n                    <value index=\"vDEF\">Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sGeneral\">\n            <language index=\"lDEF\">\n                <field index=\"input_1\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sSections\">\n            <language index=\"lDEF\">\n                <field index=\"section_1\">\n                    <el index=\"el\">\n                        <section index=\"1\">\n                            <itemType index=\"container_1\">\n                                <el>\n                                    <field index=\"input_1\">\n                                        <value index=\"vDEF\">lipsum</value>\n                                    </field>\n                                </el>\n                            </itemType>\n                        </section>\n                    </el>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sInline\">\n            <language index=\"lDEF\">\n                <field index=\"inline_1\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','lipsum','lipsum'),(3,122,1611517876,1611517876,1,0,0,128,2,1,1,NULL,1,'lipsum',0,0,0,0,'lipsum','lipsum','-315619200','https://typo3.org','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','2,3','2','2','2','1,7,12','1','1','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','1','1','1','1','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"text_1\">\n                    <value index=\"vDEF\">Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sGeneral\">\n            <language index=\"lDEF\">\n                <field index=\"input_1\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sSections\">\n            <language index=\"lDEF\">\n                <field index=\"section_1\">\n                    <el index=\"el\">\n                        <section index=\"1\">\n                            <itemType index=\"container_1\">\n                                <el>\n                                    <field index=\"input_1\">\n                                        <value index=\"vDEF\">lipsum</value>\n                                    </field>\n                                </el>\n                            </itemType>\n                        </section>\n                    </el>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sInline\">\n            <language index=\"lDEF\">\n                <field index=\"inline_1\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','lipsum','lipsum'),(4,122,1611517876,1611517876,1,0,0,192,3,1,3,NULL,3,'lipsum',0,0,0,0,'lipsum','lipsum','-315619200','https://typo3.org','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','2,3','2','2','2','1,7,12','1','1','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','1','1','1','1','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"text_1\">\n                    <value index=\"vDEF\">Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sGeneral\">\n            <language index=\"lDEF\">\n                <field index=\"input_1\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sSections\">\n            <language index=\"lDEF\">\n                <field index=\"section_1\">\n                    <el index=\"el\">\n                        <section index=\"1\">\n                            <itemType index=\"container_1\">\n                                <el>\n                                    <field index=\"input_1\">\n                                        <value index=\"vDEF\">lipsum</value>\n                                    </field>\n                                </el>\n                            </itemType>\n                        </section>\n                    </el>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sInline\">\n            <language index=\"lDEF\">\n                <field index=\"inline_1\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','lipsum','lipsum'),(5,122,1611517876,1611517876,1,0,0,224,4,0,4,NULL,4,'lipsum',0,0,0,0,'lipsum','lipsum','-315619200','https://typo3.org','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','2,3','2','2','2','1,7,12','1','1','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.','1','1','1','1','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sDEF\">\n            <language index=\"lDEF\">\n                <field index=\"text_1\">\n                    <value index=\"vDEF\">Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','<?xml version=\"1.0\" encoding=\"utf-8\" standalone=\"yes\" ?>\n<T3FlexForms>\n    <data>\n        <sheet index=\"sGeneral\">\n            <language index=\"lDEF\">\n                <field index=\"input_1\">\n                    <value index=\"vDEF\">lipsum</value>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sSections\">\n            <language index=\"lDEF\">\n                <field index=\"section_1\">\n                    <el index=\"el\">\n                        <section index=\"1\">\n                            <itemType index=\"container_1\">\n                                <el>\n                                    <field index=\"input_1\">\n                                        <value index=\"vDEF\">lipsum</value>\n                                    </field>\n                                </el>\n                            </itemType>\n                        </section>\n                    </el>\n                </field>\n            </language>\n        </sheet>\n        <sheet index=\"sInline\">\n            <language index=\"lDEF\">\n                <field index=\"inline_1\">\n                    <value index=\"vDEF\">1</value>\n                </field>\n            </language>\n        </sheet>\n    </data>\n</T3FlexForms>','lipsum','lipsum');
/*!40000 ALTER TABLE `tx_styleguide_required` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_required_flex_2_inline_1_child`
--

DROP TABLE IF EXISTS `tx_styleguide_required_flex_2_inline_1_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_required_flex_2_inline_1_child` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `parentid` int(11) NOT NULL DEFAULT 0,
  `parenttable` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_required_flex_2_inline_1_child`
--

LOCK TABLES `tx_styleguide_required_flex_2_inline_1_child` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_required_flex_2_inline_1_child` DISABLE KEYS */;
INSERT INTO `tx_styleguide_required_flex_2_inline_1_child` VALUES (1,122,0,0,0,0,0,0,0,0,0,NULL,'lipsum',1,'tx_styleguide_required','lipsum'),(2,122,1611517876,1611517876,1,0,0,1,0,0,0,NULL,'lipsum',2,'tx_styleguide_required','lipsum'),(3,122,1611517876,1611517876,1,0,0,1,0,0,0,NULL,'lipsum',3,'tx_styleguide_required','lipsum'),(4,122,1611517876,1611517876,1,0,0,1,0,0,0,NULL,'lipsum',4,'tx_styleguide_required','lipsum'),(5,122,1611517876,1611517876,1,0,0,1,0,0,0,NULL,'lipsum',5,'tx_styleguide_required','lipsum');
/*!40000 ALTER TABLE `tx_styleguide_required_flex_2_inline_1_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_required_inline_1_child`
--

DROP TABLE IF EXISTS `tx_styleguide_required_inline_1_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_required_inline_1_child` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `parentid` int(11) NOT NULL DEFAULT 0,
  `parenttable` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_required_inline_1_child`
--

LOCK TABLES `tx_styleguide_required_inline_1_child` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_required_inline_1_child` DISABLE KEYS */;
INSERT INTO `tx_styleguide_required_inline_1_child` VALUES (1,122,0,0,0,0,0,0,0,0,0,NULL,'lipsum',1,'tx_styleguide_required','lipsum'),(2,122,1611517876,1611517876,1,0,0,1025,1,0,1,NULL,'lipsum',2,'tx_styleguide_required','lipsum'),(3,122,1611517876,1611517876,1,0,0,1,2,1,1,NULL,'lipsum',3,'tx_styleguide_required','lipsum'),(4,122,1611517876,1611517876,1,0,0,1,3,1,3,NULL,'lipsum',4,'tx_styleguide_required','lipsum'),(5,122,1611517876,1611517876,1,0,0,1,4,0,4,NULL,'lipsum',5,'tx_styleguide_required','lipsum');
/*!40000 ALTER TABLE `tx_styleguide_required_inline_1_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_required_inline_2_child`
--

DROP TABLE IF EXISTS `tx_styleguide_required_inline_2_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_required_inline_2_child` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `parentid` int(11) NOT NULL DEFAULT 0,
  `parenttable` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_required_inline_2_child`
--

LOCK TABLES `tx_styleguide_required_inline_2_child` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_required_inline_2_child` DISABLE KEYS */;
INSERT INTO `tx_styleguide_required_inline_2_child` VALUES (1,122,0,0,0,0,0,0,0,0,0,NULL,'lipsum',1,'tx_styleguide_required','lipsum'),(2,122,1611517876,1611517876,1,0,0,1025,1,0,1,NULL,'lipsum',2,'tx_styleguide_required','lipsum'),(3,122,1611517876,1611517876,1,0,0,1,2,1,1,NULL,'lipsum',3,'tx_styleguide_required','lipsum'),(4,122,1611517876,1611517876,1,0,0,1,3,1,3,NULL,'lipsum',4,'tx_styleguide_required','lipsum'),(5,122,1611517876,1611517876,1,0,0,1,4,0,4,NULL,'lipsum',5,'tx_styleguide_required','lipsum');
/*!40000 ALTER TABLE `tx_styleguide_required_inline_2_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_required_inline_3_child`
--

DROP TABLE IF EXISTS `tx_styleguide_required_inline_3_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_required_inline_3_child` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `parentid` int(11) NOT NULL DEFAULT 0,
  `parenttable` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_required_inline_3_child`
--

LOCK TABLES `tx_styleguide_required_inline_3_child` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_required_inline_3_child` DISABLE KEYS */;
INSERT INTO `tx_styleguide_required_inline_3_child` VALUES (1,122,0,0,0,0,0,0,0,0,0,NULL,'lipsum',1,'tx_styleguide_required','lipsum'),(2,122,1611517876,1611517876,1,0,0,1025,1,0,1,NULL,'lipsum',2,'tx_styleguide_required','lipsum'),(3,122,1611517876,1611517876,1,0,0,1,2,1,1,NULL,'lipsum',3,'tx_styleguide_required','lipsum'),(4,122,1611517876,1611517876,1,0,0,1,3,1,3,NULL,'lipsum',4,'tx_styleguide_required','lipsum'),(5,122,1611517876,1611517876,1,0,0,1,4,0,4,NULL,'lipsum',5,'tx_styleguide_required','lipsum');
/*!40000 ALTER TABLE `tx_styleguide_required_inline_3_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_required_rte_2_child`
--

DROP TABLE IF EXISTS `tx_styleguide_required_rte_2_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_required_rte_2_child` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `parentid` int(11) NOT NULL DEFAULT 0,
  `parenttable` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `rte_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_required_rte_2_child`
--

LOCK TABLES `tx_styleguide_required_rte_2_child` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_required_rte_2_child` DISABLE KEYS */;
INSERT INTO `tx_styleguide_required_rte_2_child` VALUES (1,122,0,0,0,0,0,0,0,0,0,NULL,'lipsum',1,'tx_styleguide_required','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.'),(2,122,1611517876,1611517876,1,0,0,1025,1,0,1,NULL,'lipsum',2,'tx_styleguide_required','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.'),(3,122,1611517876,1611517876,1,0,0,1,2,1,1,NULL,'lipsum',3,'tx_styleguide_required','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.'),(4,122,1611517876,1611517876,1,0,0,1,3,1,3,NULL,'lipsum',4,'tx_styleguide_required','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.'),(5,122,1611517876,1611517876,1,0,0,1,4,0,4,NULL,'lipsum',5,'tx_styleguide_required','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.');
/*!40000 ALTER TABLE `tx_styleguide_required_rte_2_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_staticdata`
--

DROP TABLE IF EXISTS `tx_styleguide_staticdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_staticdata` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  `value_1` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_staticdata`
--

LOCK TABLES `tx_styleguide_staticdata` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_staticdata` DISABLE KEYS */;
INSERT INTO `tx_styleguide_staticdata` VALUES (1,2,'foo'),(2,2,'bar'),(3,2,'foofoo'),(4,2,'foobar');
/*!40000 ALTER TABLE `tx_styleguide_staticdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_type`
--

DROP TABLE IF EXISTS `tx_styleguide_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_type` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `type` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_type`
--

LOCK TABLES `tx_styleguide_type` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_type` DISABLE KEYS */;
INSERT INTO `tx_styleguide_type` VALUES (1,127,1611517876,1611517876,1,0,0,0,0,0,0,NULL,0,'lipsum',0,0,0,0,'test','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.'),(2,127,1611517876,1611517876,1,0,0,256,1,0,1,NULL,1,'lipsum',0,0,0,0,'test','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.'),(3,127,1611517876,1611517876,1,0,0,128,2,1,1,NULL,1,'lipsum',0,0,0,0,'test','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.'),(4,127,1611517876,1611517876,1,0,0,192,3,1,3,NULL,3,'lipsum',0,0,0,0,'test','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.'),(5,127,1611517876,1611517876,1,0,0,224,4,0,4,NULL,4,'lipsum',0,0,0,0,'test','Bacon ipsum dolor sit strong amet capicola jerky pork chop rump shoulder shank. Shankle strip steak pig salami link.');
/*!40000 ALTER TABLE `tx_styleguide_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_styleguide_valuesdefault`
--

DROP TABLE IF EXISTS `tx_styleguide_valuesdefault`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_styleguide_valuesdefault` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `tstamp` int(10) unsigned NOT NULL DEFAULT 0,
  `crdate` int(10) unsigned NOT NULL DEFAULT 0,
  `cruser_id` int(10) unsigned NOT NULL DEFAULT 0,
  `deleted` smallint(5) unsigned NOT NULL DEFAULT 0,
  `hidden` smallint(5) unsigned NOT NULL DEFAULT 0,
  `sorting` int(11) NOT NULL DEFAULT 0,
  `sys_language_uid` int(11) NOT NULL DEFAULT 0,
  `l10n_parent` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_source` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_state` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `t3_origuid` int(10) unsigned NOT NULL DEFAULT 0,
  `l10n_diffsource` mediumblob DEFAULT NULL,
  `t3ver_oid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_wsid` int(10) unsigned NOT NULL DEFAULT 0,
  `t3ver_state` smallint(6) NOT NULL DEFAULT 0,
  `t3ver_stage` int(11) NOT NULL DEFAULT 0,
  `input_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_2` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_3` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `checkbox_1` int(11) NOT NULL DEFAULT 0,
  `checkbox_2` int(11) NOT NULL DEFAULT 0,
  `checkbox_3` int(11) NOT NULL DEFAULT 0,
  `radio_1` int(11) NOT NULL DEFAULT 0,
  `select_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `select_2` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parent` (`pid`,`deleted`,`hidden`),
  KEY `translation_source` (`l10n_source`),
  KEY `t3ver_oid` (`t3ver_oid`,`t3ver_wsid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_styleguide_valuesdefault`
--

LOCK TABLES `tx_styleguide_valuesdefault` WRITE;
/*!40000 ALTER TABLE `tx_styleguide_valuesdefault` DISABLE KEYS */;
INSERT INTO `tx_styleguide_valuesdefault` VALUES (1,132,1611517876,1611517876,1,0,0,0,0,0,0,NULL,0,'lipsum',0,0,0,0,'Default value','0','3','text_12',1,1,5,2,'2','1,3'),(2,132,1611517876,1611517876,1,0,0,256,1,0,1,NULL,1,'lipsum',0,0,0,0,'Default value','0','3','text_12',1,1,5,2,'2','1,3'),(3,132,1611517876,1611517876,1,0,0,128,2,1,1,NULL,1,'lipsum',0,0,0,0,'Default value','0','3','text_12',1,1,5,2,'2','1,3'),(4,132,1611517876,1611517876,1,0,0,192,3,1,3,NULL,3,'lipsum',0,0,0,0,'Default value','0','3','text_12',1,1,5,2,'2','1,3'),(5,132,1611517876,1611517876,1,0,0,224,4,0,4,NULL,4,'lipsum',0,0,0,0,'Default value','0','3','text_12',1,1,5,2,'2','1,3');
/*!40000 ALTER TABLE `tx_styleguide_valuesdefault` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-24 19:52:40
