/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50045
Source Host           : localhost:3306
Source Database       : auth

Target Server Type    : MYSQL
Target Server Version : 50045
File Encoding         : 65001

Date: 2012-04-18 13:05:03
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT 'Identifier',
  `username` varchar(32) NOT NULL default '',
  `sha_pass_hash` varchar(40) NOT NULL default '',
  `sessionkey` varchar(80) NOT NULL default '',
  `v` varchar(64) NOT NULL default '',
  `s` varchar(64) NOT NULL default '',
  `email` varchar(254) NOT NULL default '',
  `joindate` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `last_ip` varchar(15) NOT NULL default '127.0.0.1',
  `failed_logins` int(10) unsigned NOT NULL default '0',
  `locked` tinyint(3) unsigned NOT NULL default '0',
  `last_login` timestamp NOT NULL default '0000-00-00 00:00:00',
  `online` tinyint(3) unsigned NOT NULL default '0',
  `expansion` tinyint(3) unsigned NOT NULL default '2',
  `mutetime` bigint(20) NOT NULL default '0',
  `locale` tinyint(3) unsigned NOT NULL default '0',
  `os` varchar(3) NOT NULL default '',
  `recruiter` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `idx_username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Account System';

-- ----------------------------
-- Records of account
-- ----------------------------

-- ----------------------------
-- Table structure for `account_access`
-- ----------------------------
DROP TABLE IF EXISTS `account_access`;
CREATE TABLE `account_access` (
  `id` int(10) unsigned NOT NULL,
  `gmlevel` tinyint(3) unsigned NOT NULL,
  `RealmID` int(11) NOT NULL default '-1',
  PRIMARY KEY  (`id`,`RealmID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_access
-- ----------------------------

-- ----------------------------
-- Table structure for `account_banned`
-- ----------------------------
DROP TABLE IF EXISTS `account_banned`;
CREATE TABLE `account_banned` (
  `id` int(10) unsigned NOT NULL default '0' COMMENT 'Account id',
  `bandate` int(10) unsigned NOT NULL default '0',
  `unbandate` int(10) unsigned NOT NULL default '0',
  `bannedby` varchar(50) NOT NULL,
  `banreason` varchar(255) NOT NULL,
  `active` tinyint(3) unsigned NOT NULL default '1',
  PRIMARY KEY  (`id`,`bandate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Ban List';

-- ----------------------------
-- Records of account_banned
-- ----------------------------

-- ----------------------------
-- Table structure for `account_premium`
-- ----------------------------
DROP TABLE IF EXISTS `account_premium`;
CREATE TABLE `account_premium` (
  `id` int(11) NOT NULL default '0' COMMENT 'Account id',
  `setdate` bigint(40) NOT NULL default '0',
  `unsetdate` bigint(40) NOT NULL default '0',
  `premium_type` tinyint(4) unsigned NOT NULL default '1',
  `gm` varchar(12) NOT NULL default '',
  `active` tinyint(4) NOT NULL default '1',
  PRIMARY KEY  (`id`,`setdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Premium Accounts';

-- ----------------------------
-- Records of account_premium
-- ----------------------------

-- ----------------------------
-- Table structure for `ip_banned`
-- ----------------------------
DROP TABLE IF EXISTS `ip_banned`;
CREATE TABLE `ip_banned` (
  `ip` varchar(15) NOT NULL default '127.0.0.1',
  `bandate` int(10) unsigned NOT NULL,
  `unbandate` int(10) unsigned NOT NULL,
  `bannedby` varchar(50) NOT NULL default '[Console]',
  `banreason` varchar(255) NOT NULL default 'no reason',
  PRIMARY KEY  (`ip`,`bandate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Banned IPs';

-- ----------------------------
-- Records of ip_banned
-- ----------------------------

-- ----------------------------
-- Table structure for `logs`
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `time` int(10) unsigned NOT NULL,
  `realm` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `string` text character set latin1
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logs
-- ----------------------------

-- ----------------------------
-- Table structure for `realmcharacters`
-- ----------------------------
DROP TABLE IF EXISTS `realmcharacters`;
CREATE TABLE `realmcharacters` (
  `realmid` int(10) unsigned NOT NULL default '0',
  `acctid` int(10) unsigned NOT NULL,
  `numchars` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`realmid`,`acctid`),
  KEY `acctid` (`acctid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Realm Character Tracker';

-- ----------------------------
-- Records of realmcharacters
-- ----------------------------

-- ----------------------------
-- Table structure for `realmlist`
-- ----------------------------
DROP TABLE IF EXISTS `realmlist`;
CREATE TABLE `realmlist` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(32) NOT NULL default '',
  `address` varchar(255) NOT NULL default '127.0.0.1',
  `port` smallint(5) unsigned NOT NULL default '8085',
  `icon` tinyint(3) unsigned NOT NULL default '0',
  `flag` tinyint(3) unsigned NOT NULL default '2',
  `timezone` tinyint(3) unsigned NOT NULL default '0',
  `allowedSecurityLevel` tinyint(3) unsigned NOT NULL default '0',
  `population` float unsigned NOT NULL default '0',
  `gamebuild` int(10) unsigned NOT NULL default '12340',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `idx_name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Realm System';

-- ----------------------------
-- Records of realmlist
-- ----------------------------
INSERT INTO `realmlist` VALUES ('1', 'gamesv', '127.0.0.1', '8085', '0', '0', '1', '0', '0', '12340');

-- ----------------------------
-- Table structure for `uptime`
-- ----------------------------
DROP TABLE IF EXISTS `uptime`;
CREATE TABLE `uptime` (
  `realmid` int(10) unsigned NOT NULL,
  `starttime` int(10) unsigned NOT NULL default '0',
  `uptime` int(10) unsigned NOT NULL default '0',
  `maxplayers` smallint(5) unsigned NOT NULL default '0',
  `revision` varchar(255) NOT NULL default 'Trinitycore',
  PRIMARY KEY  (`realmid`,`starttime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Uptime system';

-- ----------------------------
-- Records of uptime
-- ----------------------------
INSERT INTO `uptime` VALUES ('1', '1334727716', '0', '0', 'MMOCore  rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1334728519', '0', '0', 'MMOCore  rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1334728804', '0', '0', 'MMOCore  rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1334729379', '0', '0', 'MMOCore  rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1334729776', '0', '0', 'MMOCore  rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1334730108', '0', '0', 'MMOCore  rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1334731605', '0', '0', 'GSVCore  rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1334731658', '0', '0', 'GSVCore  rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1334731983', '0', '0', 'GSVCore  rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1334732236', '0', '0', 'GSVCore  rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1334732592', '0', '0', 'GSVCore  rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1334732849', '0', '0', 'GSVCore  rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1334733866', '0', '0', 'GSVCore  rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1334734468', '0', '0', 'GSVCore  rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1334734703', '600', '0', 'GSVCore  rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Release)');
INSERT INTO `uptime` VALUES ('1', '1334735410', '0', '0', 'GSVCore  rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Release)');
