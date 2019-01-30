-- MySQL dump 10.17  Distrib 10.3.12-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: drupal
-- ------------------------------------------------------
-- Server version	10.3.12-MariaDB-log

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
-- stop slave statement to make a recovery dump)
--

STOP ALL SLAVES;

--
-- Position to start replication or point-in-time recovery from
--

-- CHANGE MASTER TO MASTER_LOG_FILE='mariadb-bin.000004', MASTER_LOG_POS=928;

--
-- GTID to start replication from
--

CHANGE MASTER TO MASTER_HOST='test', MASTER_USE_GTID=slave_pos;
SET GLOBAL gtid_slave_pos='0-264-14318';

--
-- Table structure for table `cachetags`
--

DROP TABLE IF EXISTS `cachetags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cachetags` (
  `tag` varchar(255) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'Namespace-prefixed tag string.',
  `invalidations` int(11) NOT NULL DEFAULT 0 COMMENT 'Number incremented when the tag is invalidated.',
  PRIMARY KEY (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Cache table for tracking cache tag invalidations.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cachetags`
--

LOCK TABLES `cachetags` WRITE;
/*!40000 ALTER TABLE `cachetags` DISABLE KEYS */;
INSERT INTO `cachetags` VALUES ('4xx-response',60),('block_content_view',2),('breakpoints',34),('comment_view',2),('config:action_list',5),('config:awe_builder.settings',1),('config:block.block.bartik_account_menu',2),('config:block.block.bartik_branding',2),('config:block.block.bartik_breadcrumbs',2),('config:block.block.bartik_content',2),('config:block.block.bartik_footer',2),('config:block.block.bartik_help',2),('config:block.block.bartik_local_actions',2),('config:block.block.bartik_local_tasks',2),('config:block.block.bartik_main_menu',2),('config:block.block.bartik_messages',2),('config:block.block.bartik_page_title',2),('config:block.block.bartik_powered',2),('config:block.block.bartik_search',2),('config:block.block.bartik_tools',2),('config:block.block.block1',1),('config:block.block.block2',1),('config:block.block.bnc_theme_account_menu',1),('config:block.block.bnc_theme_branding',1),('config:block.block.bnc_theme_breadcrumbs',1),('config:block.block.bnc_theme_content',1),('config:block.block.bnc_theme_footer',1),('config:block.block.bnc_theme_help',1),('config:block.block.bnc_theme_local_actions',1),('config:block.block.bnc_theme_local_tasks',1),('config:block.block.bnc_theme_main_menu',1),('config:block.block.bnc_theme_messages',1),('config:block.block.bnc_theme_page_title',1),('config:block.block.bnc_theme_powered',1),('config:block.block.bnc_theme_search',1),('config:block.block.bnc_theme_tools',1),('config:block.block.bootstrap_account_menu',1),('config:block.block.bootstrap_branding',1),('config:block.block.bootstrap_breadcrumbs',1),('config:block.block.bootstrap_content',1),('config:block.block.bootstrap_footer',1),('config:block.block.bootstrap_help',1),('config:block.block.bootstrap_local_actions',1),('config:block.block.bootstrap_local_tasks',1),('config:block.block.bootstrap_main_menu',1),('config:block.block.bootstrap_messages',1),('config:block.block.bootstrap_page_title',1),('config:block.block.bootstrap_powered',1),('config:block.block.bootstrap_search',1),('config:block.block.bootstrap_tools',1),('config:block.block.mainnavigation',1),('config:block.block.seven_breadcrumbs',2),('config:block.block.seven_content',2),('config:block.block.seven_help',2),('config:block.block.seven_local_actions',2),('config:block.block.seven_login',2),('config:block.block.seven_messages',2),('config:block.block.seven_page_title',2),('config:block.block.seven_primary_local_tasks',2),('config:block.block.seven_secondary_local_tasks',2),('config:block_content.type.basic',1),('config:block_content_type_list',2),('config:block_list',2),('config:comment.type.comment',1),('config:comment_type_list',2),('config:config_split_list',1),('config:contact.form.feedback',2),('config:contact.form.personal',1),('config:contact_form_list',4),('config:core.base_field_override.node.page.promote',1),('config:core.date_format.fallback',1),('config:core.date_format.html_date',1),('config:core.date_format.html_datetime',1),('config:core.date_format.html_month',1),('config:core.date_format.html_time',1),('config:core.date_format.html_week',1),('config:core.date_format.html_year',1),('config:core.date_format.html_yearless_date',1),('config:core.date_format.long',1),('config:core.date_format.medium',1),('config:core.date_format.short',1),('config:core.entity_form_display.block_content.basic.default',1),('config:core.entity_form_display.comment.comment.default',1),('config:core.entity_form_display.node.article.default',1),('config:core.entity_form_display.node.page.default',1),('config:core.entity_form_display.user.user.default',1),('config:core.entity_form_mode.user.register',1),('config:core.entity_view_display.block_content.basic.default',1),('config:core.entity_view_display.comment.comment.default',1),('config:core.entity_view_display.node.article.default',1),('config:core.entity_view_display.node.article.rss',1),('config:core.entity_view_display.node.article.teaser',1),('config:core.entity_view_display.node.page.default',1),('config:core.entity_view_display.node.page.teaser',1),('config:core.entity_view_display.user.user.compact',1),('config:core.entity_view_display.user.user.default',1),('config:core.entity_view_mode.block_content.full',1),('config:core.entity_view_mode.comment.full',1),('config:core.entity_view_mode.node.full',1),('config:core.entity_view_mode.node.rss',1),('config:core.entity_view_mode.node.search_index',1),('config:core.entity_view_mode.node.search_result',1),('config:core.entity_view_mode.node.teaser',1),('config:core.entity_view_mode.taxonomy_term.full',1),('config:core.entity_view_mode.user.compact',1),('config:core.entity_view_mode.user.full',1),('config:core.extension',56),('config:core.menu.static_menu_link_overrides',2),('config:editor.editor.basic_html',1),('config:editor.editor.full_html',1),('config:editor_list',2),('config:entity_form_display_list',3),('config:entity_form_mode_list',2),('config:entity_view_display_list',3),('config:entity_view_mode_list',6),('config:field.field.block_content.basic.body',1),('config:field.field.comment.comment.comment_body',1),('config:field.field.node.article.body',1),('config:field.field.node.article.comment',1),('config:field.field.node.article.field_image',1),('config:field.field.node.article.field_tags',1),('config:field.field.node.page.body',1),('config:field.field.user.user.user_picture',1),('config:field.storage.block_content.body',1),('config:field.storage.comment.comment_body',1),('config:field.storage.node.body',1),('config:field.storage.node.comment',1),('config:field.storage.node.field_image',1),('config:field.storage.node.field_tags',1),('config:field.storage.user.user_picture',1),('config:filter.format.basic_html',1),('config:filter.format.full_html',1),('config:filter.format.plain_text',1),('config:filter.format.restricted_html',1),('config:filter_format_list',3),('config:image.style.large',1),('config:image.style.medium',1),('config:image.style.thumbnail',1),('config:image_style_list',2),('config:menu_list',2),('config:node.settings',1),('config:node.type.article',1),('config:node.type.page',1),('config:node_type_list',3),('config:rdf.mapping.comment.comment',1),('config:rdf.mapping.node.article',1),('config:rdf.mapping.node.page',1),('config:rdf.mapping.taxonomy_term.tags',1),('config:rdf.mapping.user.user',1),('config:rdf_mapping_list',2),('config:search.page.node_search',1),('config:search.page.user_search',1),('config:search.settings',1),('config:search_page_list',2),('config:shortcut.set.default',1),('config:shortcut_set_list',2),('config:system.action.comment_delete_action',1),('config:system.action.comment_publish_action',1),('config:system.action.comment_save_action',1),('config:system.action.comment_unpublish_action',1),('config:system.action.node_delete_action',1),('config:system.action.node_make_sticky_action',1),('config:system.action.node_make_unsticky_action',1),('config:system.action.node_promote_action',1),('config:system.action.node_publish_action',1),('config:system.action.node_save_action',1),('config:system.action.node_unpromote_action',1),('config:system.action.node_unpublish_action',1),('config:system.action.user_add_role_action.administrator',1),('config:system.action.user_block_user_action',1),('config:system.action.user_cancel_user_action',1),('config:system.action.user_remove_role_action.administrator',1),('config:system.action.user_unblock_user_action',1),('config:system.date',1),('config:system.file',1),('config:system.menu.account',56),('config:system.menu.admin',57),('config:system.menu.footer',46),('config:system.menu.main',16),('config:system.menu.tools',51),('config:system.site',2),('config:taxonomy.vocabulary.tags',1),('config:taxonomy_vocabulary_list',2),('config:tour.tour.views-ui',1),('config:tour_list',2),('config:update.settings',1),('config:user.role.administrator',1),('config:user.role.anonymous',3),('config:user.role.authenticated',3),('config:user.settings',1),('config:user_role_list',4),('config:views.view.archive',2),('config:views.view.block_content',2),('config:views.view.comment',2),('config:views.view.comments_recent',2),('config:views.view.content',2),('config:views.view.content_recent',2),('config:views.view.files',2),('config:views.view.frontpage',2),('config:views.view.glossary',2),('config:views.view.taxonomy_term',2),('config:views.view.user_admin_people',2),('config:views.view.watchdog',2),('config:views.view.who_s_new',2),('config:views.view.who_s_online',2),('config:view_list',2),('contact_message_view',1),('contextual_links_plugins',56),('element_info_build',56),('entity_bundles',90),('entity_field_info',146),('entity_types',91),('http_response',57),('link_relation_type',56),('local_action',56),('local_task',57),('node_list',3),('node_view',3),('rendered',4),('routes',58),('route_match',57),('taxonomy_term_view',2),('theme_registry',54),('user:1',2),('user_list',3),('user_values',1),('user_view',2),('views_data',3);
/*!40000 ALTER TABLE `cachetags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `cid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comment_type` varchar(32) CHARACTER SET ascii NOT NULL COMMENT 'The ID of the target entity.',
  `uuid` varchar(128) CHARACTER SET ascii NOT NULL,
  `langcode` varchar(12) CHARACTER SET ascii NOT NULL,
  PRIMARY KEY (`cid`),
  UNIQUE KEY `comment_field__uuid__value` (`uuid`),
  KEY `comment_field__comment_type__target_id` (`comment_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The base table for comment entities.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment__comment_body`
--

DROP TABLE IF EXISTS `comment__comment_body`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment__comment_body` (
  `bundle` varchar(128) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to, which for an unversioned entity type is the same as the entity id',
  `langcode` varchar(32) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The language code for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `comment_body_value` longtext NOT NULL,
  `comment_body_format` varchar(255) CHARACTER SET ascii DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`deleted`,`delta`,`langcode`),
  KEY `bundle` (`bundle`),
  KEY `revision_id` (`revision_id`),
  KEY `comment_body_format` (`comment_body_format`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Data storage for comment field comment_body.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment__comment_body`
--

LOCK TABLES `comment__comment_body` WRITE;
/*!40000 ALTER TABLE `comment__comment_body` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment__comment_body` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_entity_statistics`
--

DROP TABLE IF EXISTS `comment_entity_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment_entity_statistics` (
  `entity_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'The entity_id of the entity for which the statistics are compiled.',
  `entity_type` varchar(32) CHARACTER SET ascii NOT NULL DEFAULT 'node' COMMENT 'The entity_type of the entity to which this comment is a reply.',
  `field_name` varchar(32) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The field_name of the field that was used to add this comment.',
  `cid` int(11) NOT NULL DEFAULT 0 COMMENT 'The comment.cid of the last comment.',
  `last_comment_timestamp` int(11) NOT NULL DEFAULT 0 COMMENT 'The Unix timestamp of the last comment that was posted within this node, from comment.changed.',
  `last_comment_name` varchar(60) DEFAULT NULL COMMENT 'The name of the latest author to post a comment on this node, from comment.name.',
  `last_comment_uid` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'The user ID of the latest author to post a comment on this node, from comment.uid.',
  `comment_count` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'The total number of comments on this entity.',
  PRIMARY KEY (`entity_id`,`entity_type`,`field_name`),
  KEY `last_comment_timestamp` (`last_comment_timestamp`),
  KEY `comment_count` (`comment_count`),
  KEY `last_comment_uid` (`last_comment_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Maintains statistics of entity and comments posts to show …';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_entity_statistics`
--

LOCK TABLES `comment_entity_statistics` WRITE;
/*!40000 ALTER TABLE `comment_entity_statistics` DISABLE KEYS */;
INSERT INTO `comment_entity_statistics` VALUES (1,'node','comment',0,1548559335,NULL,1,0),(2,'node','comment',0,1548559410,NULL,1,0);
/*!40000 ALTER TABLE `comment_entity_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_field_data`
--

DROP TABLE IF EXISTS `comment_field_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment_field_data` (
  `cid` int(10) unsigned NOT NULL,
  `comment_type` varchar(32) CHARACTER SET ascii NOT NULL COMMENT 'The ID of the target entity.',
  `langcode` varchar(12) CHARACTER SET ascii NOT NULL,
  `status` tinyint(4) NOT NULL,
  `pid` int(10) unsigned DEFAULT NULL COMMENT 'The ID of the target entity.',
  `entity_id` int(10) unsigned DEFAULT NULL COMMENT 'The ID of the target entity.',
  `subject` varchar(64) DEFAULT NULL,
  `uid` int(10) unsigned DEFAULT NULL COMMENT 'The ID of the target entity.',
  `name` varchar(60) DEFAULT NULL,
  `mail` varchar(254) DEFAULT NULL,
  `homepage` varchar(255) DEFAULT NULL,
  `hostname` varchar(128) DEFAULT NULL,
  `created` int(11) NOT NULL,
  `changed` int(11) DEFAULT NULL,
  `thread` varchar(255) NOT NULL,
  `entity_type` varchar(32) CHARACTER SET ascii DEFAULT NULL,
  `field_name` varchar(32) CHARACTER SET ascii DEFAULT NULL,
  `default_langcode` tinyint(4) NOT NULL,
  PRIMARY KEY (`cid`,`langcode`),
  KEY `comment__id__default_langcode__langcode` (`cid`,`default_langcode`,`langcode`),
  KEY `comment_field__comment_type__target_id` (`comment_type`),
  KEY `comment_field__uid__target_id` (`uid`),
  KEY `comment_field__created` (`created`),
  KEY `comment__status_comment_type` (`status`,`comment_type`,`cid`),
  KEY `comment__status_pid` (`pid`,`status`),
  KEY `comment__num_new` (`entity_id`,`entity_type`,`comment_type`,`status`,`created`,`cid`,`thread`(191)),
  KEY `comment__entity_langcode` (`entity_id`,`entity_type`,`comment_type`,`default_langcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The data table for comment entities.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_field_data`
--

LOCK TABLES `comment_field_data` WRITE;
/*!40000 ALTER TABLE `comment_field_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment_field_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_managed`
--

DROP TABLE IF EXISTS `file_managed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_managed` (
  `fid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(128) CHARACTER SET ascii NOT NULL,
  `langcode` varchar(12) CHARACTER SET ascii NOT NULL,
  `uid` int(10) unsigned DEFAULT NULL COMMENT 'The ID of the target entity.',
  `filename` varchar(255) DEFAULT NULL,
  `uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `filemime` varchar(255) CHARACTER SET ascii DEFAULT NULL,
  `filesize` bigint(20) unsigned DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `created` int(11) DEFAULT NULL,
  `changed` int(11) NOT NULL,
  PRIMARY KEY (`fid`),
  UNIQUE KEY `file_field__uuid__value` (`uuid`),
  KEY `file_field__uid__target_id` (`uid`),
  KEY `file_field__uri` (`uri`(191)),
  KEY `file_field__status` (`status`),
  KEY `file_field__changed` (`changed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The base table for file entities.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_managed`
--

LOCK TABLES `file_managed` WRITE;
/*!40000 ALTER TABLE `file_managed` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_managed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_usage`
--

DROP TABLE IF EXISTS `file_usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_usage` (
  `fid` int(10) unsigned NOT NULL COMMENT 'File ID.',
  `module` varchar(50) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The name of the module that is using the file.',
  `type` varchar(64) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The name of the object type in which the file is used.',
  `id` varchar(64) CHARACTER SET ascii NOT NULL DEFAULT '0' COMMENT 'The primary key of the object using the file.',
  `count` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'The number of times this file is used by this object.',
  PRIMARY KEY (`fid`,`type`,`id`,`module`),
  KEY `type_id` (`type`,`id`),
  KEY `fid_count` (`fid`,`count`),
  KEY `fid_module` (`fid`,`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Track where a file is used.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_usage`
--

LOCK TABLES `file_usage` WRITE;
/*!40000 ALTER TABLE `file_usage` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_usage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node`
--

DROP TABLE IF EXISTS `node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node` (
  `nid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vid` int(10) unsigned DEFAULT NULL,
  `type` varchar(32) CHARACTER SET ascii NOT NULL COMMENT 'The ID of the target entity.',
  `uuid` varchar(128) CHARACTER SET ascii NOT NULL,
  `langcode` varchar(12) CHARACTER SET ascii NOT NULL,
  PRIMARY KEY (`nid`),
  UNIQUE KEY `node_field__uuid__value` (`uuid`),
  UNIQUE KEY `node__vid` (`vid`),
  KEY `node_field__type__target_id` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='The base table for node entities.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node`
--

LOCK TABLES `node` WRITE;
/*!40000 ALTER TABLE `node` DISABLE KEYS */;
INSERT INTO `node` VALUES (1,1,'article','6dd782a9-2094-4736-a0ec-611dc8f5d745','en'),(2,2,'article','d2286778-145a-4259-9d7e-56aab4e2b2e6','en'),(3,3,'test','4eed77ca-95cb-4f13-af40-c47cad8fe4ee','en');
/*!40000 ALTER TABLE `node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node__body`
--

DROP TABLE IF EXISTS `node__body`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node__body` (
  `bundle` varchar(128) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `langcode` varchar(32) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The language code for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `body_value` longtext NOT NULL,
  `body_summary` longtext DEFAULT NULL,
  `body_format` varchar(255) CHARACTER SET ascii DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`deleted`,`delta`,`langcode`),
  KEY `bundle` (`bundle`),
  KEY `revision_id` (`revision_id`),
  KEY `body_format` (`body_format`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Data storage for node field body.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node__body`
--

LOCK TABLES `node__body` WRITE;
/*!40000 ALTER TABLE `node__body` DISABLE KEYS */;
INSERT INTO `node__body` VALUES ('article',0,1,1,'en',0,'<p>Venenat uam ad illa morbi vamus aliquam. Min lectusn faucib lacuse metuscra fringi mus uis consec molest. Leosed vitaenu lacusp que tortorp eclass molestie hendre tesque. Lus sociosqu musetiam enimsed montes culus nuncnunc. Ligula nec ridicul disse necnunc ullamco tate accumsan. Tur esent pornam mauris auguesed venenat justonul aenean dictumdu. Pretium quis lectusa ultric liberom lum massased sollici unc. Hendrer orem massa esent bibend cubilia. Himena rosed nisiinte fames augueph entum sque dapibusc nec. Isse lus faucibus elit esent auctorpr isque malesu.</p>\r\n\r\n<p>Ras sed magnis vallis duifusce non itnunc isque nas quam. Uam platea lorem justonul hac volutpa lacus tique conubia. Proin lacusp elit pretium entum nislin hendre rrased. Liberoa nisl teger est quamnull portamor nullap. Imperdie bibendu ridicul magnaves fusce uis nec nulla disse tesque. Consec tcras enean lobortis taciti esque aesent isque nislqu congued. Tique felis vehicula metussed magna euismod auctorcr. Auris ultric uam quamut llus semper mauris esent. Ecenas natoque ras mussed donec malesuad culus enean. Sedlorem laoreetc ris natoque telluss gravidas portad.</p>\r\n\r\n<p>Venenat uam ad illa morbi vamus aliquam. Min lectusn faucib lacuse metuscra fringi mus uis consec molest. Leosed vitaenu lacusp que tortorp eclass molestie hendre tesque. Lus sociosqu musetiam enimsed montes culus nuncnunc. Ligula nec ridicul disse necnunc ullamco tate accumsan. Tur esent pornam mauris auguesed venenat justonul aenean dictumdu. Pretium quis lectusa ultric liberom lum massased sollici unc. Hendrer orem massa esent bibend cubilia. Himena rosed nisiinte fames augueph entum sque dapibusc nec. Isse lus faucibus elit esent auctorpr isque malesu.</p>\r\n','','basic_html'),('article',0,2,2,'en',0,'<p>Miin itur ssed diam liquam lobortis natis sdonec. Vehicula congue orci eger egestas magnis lum. Libero bibendum dapibus eu fringi risusm quamnull bulum nibhcras. Aesent enimlo min vel volutp iam enimdon volutpa iam mauris. Ligula aesent magnaves rutrum nulla itor. In nulla rproin cursusp sque elementu felisut.</p>\r\n\r\n<p>Leo urnain conubia accumsan sapienv diamin. Loremn pharetr iaculis isse que lacini molest accumsan. Semmaec ornare eu nislin faucibus sim rrased necinte ssed. Ante aliquet luctus tristi lum itur. Tortor enimsus egestas massacra rutrum lus dictums urient lectuss lacusp. Telluss accums nunccras lacusp facilisi ultric dui. Id ultric potent seminteg facili pharetra aesent musetiam sse duis. Estnunc condim leocur cras naeos nas lectusa urient. Roin laoreetc rsed mi class aesent. Bibendu mattisae seminteg nean convall uisque esent liberom bibend faucibus.</p>\r\n\r\n<p>Miin itur ssed diam liquam lobortis natis sdonec. Vehicula congue orci eger egestas magnis lum. Libero bibendum dapibus eu fringi risusm quamnull bulum nibhcras. Aesent enimlo min vel volutp iam enimdon volutpa iam mauris. Ligula aesent magnaves rutrum nulla itor. In nulla rproin cursusp sque elementu felisut.</p>\r\n','','basic_html'),('test',0,3,3,'en',0,'<p>Inceptos iennam daut potenti rhoncusv ulum miin. Accumsan fringi enim lobortis laoree sociosqu viverr nibhphas at massacra. Mus metusd varius velit portad insuspen. Nulla tortor sisut cidunt liquam magnis quamsusp molesti quiscras. Tortor faucibus turpisf sque rosed ndisse libero auctorpr. Sollici pretium sed ctetur min nas que sagittis. Disse consequa dapibusc aenean rutruma ras imperd que. Platea malesu sent morbi diamin cras potent ante metus per. Tsed faucibu aesent varius ger arcualiq pretium lacinia. Egestas turpisn modnam maurisma potenti rfusce cras gravida orci maurisd.</p>\r\n\r\n<p>Senectus facilisi leopelle maurisve iquam quam. Ultricie nec nec cras sodale bibendum. Nislin posuered ipsumves llaut ornare teger enas sceler facilisi. Rosed egetlor necsed tesque lus dapibusc. Maurisd tsed varius estnulla tur teger euismo ger senectus pretiu. Commodo rutruma nequenu rrased egestas tempor. Nuncproi uisque roin pulvinar euismo eleifend puruscra.</p>\r\n\r\n<p>Inceptos iennam daut potenti rhoncusv ulum miin. Accumsan fringi enim lobortis laoree sociosqu viverr nibhphas at massacra. Mus metusd varius velit portad insuspen. Nulla tortor sisut cidunt liquam magnis quamsusp molesti quiscras. Tortor faucibus turpisf sque rosed ndisse libero auctorpr. Sollici pretium sed ctetur min nas que sagittis. Disse consequa dapibusc aenean rutruma ras imperd que. Platea malesu sent morbi diamin cras potent ante metus per. Tsed faucibu aesent varius ger arcualiq pretium lacinia. Egestas turpisn modnam maurisma potenti rfusce cras gravida orci maurisd.</p>\r\n','','basic_html');
/*!40000 ALTER TABLE `node__body` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node__comment`
--

DROP TABLE IF EXISTS `node__comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node__comment` (
  `bundle` varchar(128) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `langcode` varchar(32) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The language code for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `comment_status` int(11) NOT NULL DEFAULT 0 COMMENT 'Whether comments are allowed on this entity: 0 = no, 1 = closed (read only), 2 = open (read/write).',
  PRIMARY KEY (`entity_id`,`deleted`,`delta`,`langcode`),
  KEY `bundle` (`bundle`),
  KEY `revision_id` (`revision_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Data storage for node field comment.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node__comment`
--

LOCK TABLES `node__comment` WRITE;
/*!40000 ALTER TABLE `node__comment` DISABLE KEYS */;
INSERT INTO `node__comment` VALUES ('article',0,1,1,'en',0,2),('article',0,2,2,'en',0,2);
/*!40000 ALTER TABLE `node__comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node__field_image`
--

DROP TABLE IF EXISTS `node__field_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node__field_image` (
  `bundle` varchar(128) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `langcode` varchar(32) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The language code for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_image_target_id` int(10) unsigned NOT NULL COMMENT 'The ID of the file entity.',
  `field_image_alt` varchar(512) DEFAULT NULL COMMENT 'Alternative image text, for the image''s ''alt'' attribute.',
  `field_image_title` varchar(1024) DEFAULT NULL COMMENT 'Image title text, for the image''s ''title'' attribute.',
  `field_image_width` int(10) unsigned DEFAULT NULL COMMENT 'The width of the image in pixels.',
  `field_image_height` int(10) unsigned DEFAULT NULL COMMENT 'The height of the image in pixels.',
  PRIMARY KEY (`entity_id`,`deleted`,`delta`,`langcode`),
  KEY `bundle` (`bundle`),
  KEY `revision_id` (`revision_id`),
  KEY `field_image_target_id` (`field_image_target_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Data storage for node field field_image.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node__field_image`
--

LOCK TABLES `node__field_image` WRITE;
/*!40000 ALTER TABLE `node__field_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `node__field_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node__field_tags`
--

DROP TABLE IF EXISTS `node__field_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node__field_tags` (
  `bundle` varchar(128) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `langcode` varchar(32) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The language code for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_tags_target_id` int(10) unsigned NOT NULL COMMENT 'The ID of the target entity.',
  PRIMARY KEY (`entity_id`,`deleted`,`delta`,`langcode`),
  KEY `bundle` (`bundle`),
  KEY `revision_id` (`revision_id`),
  KEY `field_tags_target_id` (`field_tags_target_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Data storage for node field field_tags.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node__field_tags`
--

LOCK TABLES `node__field_tags` WRITE;
/*!40000 ALTER TABLE `node__field_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `node__field_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node_access`
--

DROP TABLE IF EXISTS `node_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_access` (
  `nid` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'The node.nid this record affects.',
  `langcode` varchar(12) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The language.langcode of this node.',
  `fallback` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT 'Boolean indicating whether this record should be used as a fallback if a language condition is not provided.',
  `gid` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'The grant ID a user must possess in the specified realm to gain this row''s privileges on the node.',
  `realm` varchar(255) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The realm in which the user must possess the grant ID. Modules can define one or more realms by implementing hook_node_grants().',
  `grant_view` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT 'Boolean indicating whether a user with the realm/grant pair can view this node.',
  `grant_update` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT 'Boolean indicating whether a user with the realm/grant pair can edit this node.',
  `grant_delete` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT 'Boolean indicating whether a user with the realm/grant pair can delete this node.',
  PRIMARY KEY (`nid`,`gid`,`realm`,`langcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Identifies which realm/grant pairs a user must possess in…';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_access`
--

LOCK TABLES `node_access` WRITE;
/*!40000 ALTER TABLE `node_access` DISABLE KEYS */;
INSERT INTO `node_access` VALUES (0,'',1,0,'all',1,0,0);
/*!40000 ALTER TABLE `node_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node_field_data`
--

DROP TABLE IF EXISTS `node_field_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_field_data` (
  `nid` int(10) unsigned NOT NULL,
  `vid` int(10) unsigned NOT NULL,
  `type` varchar(32) CHARACTER SET ascii NOT NULL COMMENT 'The ID of the target entity.',
  `langcode` varchar(12) CHARACTER SET ascii NOT NULL,
  `status` tinyint(4) NOT NULL,
  `title` varchar(255) NOT NULL,
  `uid` int(10) unsigned NOT NULL COMMENT 'The ID of the target entity.',
  `created` int(11) NOT NULL,
  `changed` int(11) NOT NULL,
  `promote` tinyint(4) NOT NULL,
  `sticky` tinyint(4) NOT NULL,
  `default_langcode` tinyint(4) NOT NULL,
  `revision_translation_affected` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`nid`,`langcode`),
  KEY `node__id__default_langcode__langcode` (`nid`,`default_langcode`,`langcode`),
  KEY `node__vid` (`vid`),
  KEY `node_field__type__target_id` (`type`),
  KEY `node_field__uid__target_id` (`uid`),
  KEY `node_field__created` (`created`),
  KEY `node_field__changed` (`changed`),
  KEY `node__status_type` (`status`,`type`,`nid`),
  KEY `node__frontpage` (`promote`,`status`,`sticky`,`created`),
  KEY `node__title_type` (`title`(191),`type`(4))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The data table for node entities.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_field_data`
--

LOCK TABLES `node_field_data` WRITE;
/*!40000 ALTER TABLE `node_field_data` DISABLE KEYS */;
INSERT INTO `node_field_data` VALUES (1,1,'article','en',1,'master 1',1,1548559322,1548559335,1,0,1,1),(2,2,'article','en',1,'master 2',1,1548559393,1548559410,1,0,1,1),(3,3,'test','en',1,'test',1,1548559880,1548559896,1,0,1,1);
/*!40000 ALTER TABLE `node_field_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node_field_revision`
--

DROP TABLE IF EXISTS `node_field_revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_field_revision` (
  `nid` int(10) unsigned NOT NULL,
  `vid` int(10) unsigned NOT NULL,
  `langcode` varchar(12) CHARACTER SET ascii NOT NULL,
  `status` tinyint(4) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `uid` int(10) unsigned NOT NULL COMMENT 'The ID of the target entity.',
  `created` int(11) DEFAULT NULL,
  `changed` int(11) DEFAULT NULL,
  `promote` tinyint(4) DEFAULT NULL,
  `sticky` tinyint(4) DEFAULT NULL,
  `default_langcode` tinyint(4) NOT NULL,
  `revision_translation_affected` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`vid`,`langcode`),
  KEY `node__id__default_langcode__langcode` (`nid`,`default_langcode`,`langcode`),
  KEY `node_field__uid__target_id` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The revision data table for node entities.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_field_revision`
--

LOCK TABLES `node_field_revision` WRITE;
/*!40000 ALTER TABLE `node_field_revision` DISABLE KEYS */;
INSERT INTO `node_field_revision` VALUES (1,1,'en',1,'master 1',1,1548559322,1548559335,1,0,1,1),(2,2,'en',1,'master 2',1,1548559393,1548559410,1,0,1,1),(3,3,'en',1,'test',1,1548559880,1548559896,1,0,1,1);
/*!40000 ALTER TABLE `node_field_revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node_revision`
--

DROP TABLE IF EXISTS `node_revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_revision` (
  `nid` int(10) unsigned NOT NULL,
  `vid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `langcode` varchar(12) CHARACTER SET ascii NOT NULL,
  `revision_uid` int(10) unsigned DEFAULT NULL COMMENT 'The ID of the target entity.',
  `revision_timestamp` int(11) DEFAULT NULL,
  `revision_log` longtext DEFAULT NULL,
  `revision_default` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`vid`),
  KEY `node__nid` (`nid`),
  KEY `node_field__langcode` (`langcode`),
  KEY `node_field__revision_uid__target_id` (`revision_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='The revision table for node entities.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_revision`
--

LOCK TABLES `node_revision` WRITE;
/*!40000 ALTER TABLE `node_revision` DISABLE KEYS */;
INSERT INTO `node_revision` VALUES (1,1,'en',1,1548559335,NULL,1),(2,2,'en',1,1548559410,NULL,1),(3,3,'en',1,1548559896,NULL,1);
/*!40000 ALTER TABLE `node_revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node_revision__body`
--

DROP TABLE IF EXISTS `node_revision__body`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_revision__body` (
  `bundle` varchar(128) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `langcode` varchar(32) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The language code for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `body_value` longtext NOT NULL,
  `body_summary` longtext DEFAULT NULL,
  `body_format` varchar(255) CHARACTER SET ascii DEFAULT NULL,
  PRIMARY KEY (`entity_id`,`revision_id`,`deleted`,`delta`,`langcode`),
  KEY `bundle` (`bundle`),
  KEY `revision_id` (`revision_id`),
  KEY `body_format` (`body_format`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Revision archive storage for node field body.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_revision__body`
--

LOCK TABLES `node_revision__body` WRITE;
/*!40000 ALTER TABLE `node_revision__body` DISABLE KEYS */;
INSERT INTO `node_revision__body` VALUES ('article',0,1,1,'en',0,'<p>Venenat uam ad illa morbi vamus aliquam. Min lectusn faucib lacuse metuscra fringi mus uis consec molest. Leosed vitaenu lacusp que tortorp eclass molestie hendre tesque. Lus sociosqu musetiam enimsed montes culus nuncnunc. Ligula nec ridicul disse necnunc ullamco tate accumsan. Tur esent pornam mauris auguesed venenat justonul aenean dictumdu. Pretium quis lectusa ultric liberom lum massased sollici unc. Hendrer orem massa esent bibend cubilia. Himena rosed nisiinte fames augueph entum sque dapibusc nec. Isse lus faucibus elit esent auctorpr isque malesu.</p>\r\n\r\n<p>Ras sed magnis vallis duifusce non itnunc isque nas quam. Uam platea lorem justonul hac volutpa lacus tique conubia. Proin lacusp elit pretium entum nislin hendre rrased. Liberoa nisl teger est quamnull portamor nullap. Imperdie bibendu ridicul magnaves fusce uis nec nulla disse tesque. Consec tcras enean lobortis taciti esque aesent isque nislqu congued. Tique felis vehicula metussed magna euismod auctorcr. Auris ultric uam quamut llus semper mauris esent. Ecenas natoque ras mussed donec malesuad culus enean. Sedlorem laoreetc ris natoque telluss gravidas portad.</p>\r\n\r\n<p>Venenat uam ad illa morbi vamus aliquam. Min lectusn faucib lacuse metuscra fringi mus uis consec molest. Leosed vitaenu lacusp que tortorp eclass molestie hendre tesque. Lus sociosqu musetiam enimsed montes culus nuncnunc. Ligula nec ridicul disse necnunc ullamco tate accumsan. Tur esent pornam mauris auguesed venenat justonul aenean dictumdu. Pretium quis lectusa ultric liberom lum massased sollici unc. Hendrer orem massa esent bibend cubilia. Himena rosed nisiinte fames augueph entum sque dapibusc nec. Isse lus faucibus elit esent auctorpr isque malesu.</p>\r\n','','basic_html'),('article',0,2,2,'en',0,'<p>Miin itur ssed diam liquam lobortis natis sdonec. Vehicula congue orci eger egestas magnis lum. Libero bibendum dapibus eu fringi risusm quamnull bulum nibhcras. Aesent enimlo min vel volutp iam enimdon volutpa iam mauris. Ligula aesent magnaves rutrum nulla itor. In nulla rproin cursusp sque elementu felisut.</p>\r\n\r\n<p>Leo urnain conubia accumsan sapienv diamin. Loremn pharetr iaculis isse que lacini molest accumsan. Semmaec ornare eu nislin faucibus sim rrased necinte ssed. Ante aliquet luctus tristi lum itur. Tortor enimsus egestas massacra rutrum lus dictums urient lectuss lacusp. Telluss accums nunccras lacusp facilisi ultric dui. Id ultric potent seminteg facili pharetra aesent musetiam sse duis. Estnunc condim leocur cras naeos nas lectusa urient. Roin laoreetc rsed mi class aesent. Bibendu mattisae seminteg nean convall uisque esent liberom bibend faucibus.</p>\r\n\r\n<p>Miin itur ssed diam liquam lobortis natis sdonec. Vehicula congue orci eger egestas magnis lum. Libero bibendum dapibus eu fringi risusm quamnull bulum nibhcras. Aesent enimlo min vel volutp iam enimdon volutpa iam mauris. Ligula aesent magnaves rutrum nulla itor. In nulla rproin cursusp sque elementu felisut.</p>\r\n','','basic_html'),('test',0,3,3,'en',0,'<p>Inceptos iennam daut potenti rhoncusv ulum miin. Accumsan fringi enim lobortis laoree sociosqu viverr nibhphas at massacra. Mus metusd varius velit portad insuspen. Nulla tortor sisut cidunt liquam magnis quamsusp molesti quiscras. Tortor faucibus turpisf sque rosed ndisse libero auctorpr. Sollici pretium sed ctetur min nas que sagittis. Disse consequa dapibusc aenean rutruma ras imperd que. Platea malesu sent morbi diamin cras potent ante metus per. Tsed faucibu aesent varius ger arcualiq pretium lacinia. Egestas turpisn modnam maurisma potenti rfusce cras gravida orci maurisd.</p>\r\n\r\n<p>Senectus facilisi leopelle maurisve iquam quam. Ultricie nec nec cras sodale bibendum. Nislin posuered ipsumves llaut ornare teger enas sceler facilisi. Rosed egetlor necsed tesque lus dapibusc. Maurisd tsed varius estnulla tur teger euismo ger senectus pretiu. Commodo rutruma nequenu rrased egestas tempor. Nuncproi uisque roin pulvinar euismo eleifend puruscra.</p>\r\n\r\n<p>Inceptos iennam daut potenti rhoncusv ulum miin. Accumsan fringi enim lobortis laoree sociosqu viverr nibhphas at massacra. Mus metusd varius velit portad insuspen. Nulla tortor sisut cidunt liquam magnis quamsusp molesti quiscras. Tortor faucibus turpisf sque rosed ndisse libero auctorpr. Sollici pretium sed ctetur min nas que sagittis. Disse consequa dapibusc aenean rutruma ras imperd que. Platea malesu sent morbi diamin cras potent ante metus per. Tsed faucibu aesent varius ger arcualiq pretium lacinia. Egestas turpisn modnam maurisma potenti rfusce cras gravida orci maurisd.</p>\r\n','','basic_html');
/*!40000 ALTER TABLE `node_revision__body` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node_revision__comment`
--

DROP TABLE IF EXISTS `node_revision__comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_revision__comment` (
  `bundle` varchar(128) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `langcode` varchar(32) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The language code for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `comment_status` int(11) NOT NULL DEFAULT 0 COMMENT 'Whether comments are allowed on this entity: 0 = no, 1 = closed (read only), 2 = open (read/write).',
  PRIMARY KEY (`entity_id`,`revision_id`,`deleted`,`delta`,`langcode`),
  KEY `bundle` (`bundle`),
  KEY `revision_id` (`revision_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Revision archive storage for node field comment.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_revision__comment`
--

LOCK TABLES `node_revision__comment` WRITE;
/*!40000 ALTER TABLE `node_revision__comment` DISABLE KEYS */;
INSERT INTO `node_revision__comment` VALUES ('article',0,1,1,'en',0,2),('article',0,2,2,'en',0,2);
/*!40000 ALTER TABLE `node_revision__comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node_revision__field_image`
--

DROP TABLE IF EXISTS `node_revision__field_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_revision__field_image` (
  `bundle` varchar(128) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `langcode` varchar(32) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The language code for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_image_target_id` int(10) unsigned NOT NULL COMMENT 'The ID of the file entity.',
  `field_image_alt` varchar(512) DEFAULT NULL COMMENT 'Alternative image text, for the image''s ''alt'' attribute.',
  `field_image_title` varchar(1024) DEFAULT NULL COMMENT 'Image title text, for the image''s ''title'' attribute.',
  `field_image_width` int(10) unsigned DEFAULT NULL COMMENT 'The width of the image in pixels.',
  `field_image_height` int(10) unsigned DEFAULT NULL COMMENT 'The height of the image in pixels.',
  PRIMARY KEY (`entity_id`,`revision_id`,`deleted`,`delta`,`langcode`),
  KEY `bundle` (`bundle`),
  KEY `revision_id` (`revision_id`),
  KEY `field_image_target_id` (`field_image_target_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Revision archive storage for node field field_image.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_revision__field_image`
--

LOCK TABLES `node_revision__field_image` WRITE;
/*!40000 ALTER TABLE `node_revision__field_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `node_revision__field_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node_revision__field_tags`
--

DROP TABLE IF EXISTS `node_revision__field_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_revision__field_tags` (
  `bundle` varchar(128) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `langcode` varchar(32) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The language code for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_tags_target_id` int(10) unsigned NOT NULL COMMENT 'The ID of the target entity.',
  PRIMARY KEY (`entity_id`,`revision_id`,`deleted`,`delta`,`langcode`),
  KEY `bundle` (`bundle`),
  KEY `revision_id` (`revision_id`),
  KEY `field_tags_target_id` (`field_tags_target_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Revision archive storage for node field field_tags.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_revision__field_tags`
--

LOCK TABLES `node_revision__field_tags` WRITE;
/*!40000 ALTER TABLE `node_revision__field_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `node_revision__field_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shortcut`
--

DROP TABLE IF EXISTS `shortcut`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shortcut` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shortcut_set` varchar(32) CHARACTER SET ascii NOT NULL COMMENT 'The ID of the target entity.',
  `uuid` varchar(128) CHARACTER SET ascii NOT NULL,
  `langcode` varchar(12) CHARACTER SET ascii NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shortcut_field__uuid__value` (`uuid`),
  KEY `shortcut_field__shortcut_set__target_id` (`shortcut_set`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='The base table for shortcut entities.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shortcut`
--

LOCK TABLES `shortcut` WRITE;
/*!40000 ALTER TABLE `shortcut` DISABLE KEYS */;
INSERT INTO `shortcut` VALUES (1,'default','4ea2a8c2-46a0-4f70-b771-95718137526a','en'),(2,'default','c6c25184-a165-4345-90a3-82492ce550ef','en');
/*!40000 ALTER TABLE `shortcut` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shortcut_field_data`
--

DROP TABLE IF EXISTS `shortcut_field_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shortcut_field_data` (
  `id` int(10) unsigned NOT NULL,
  `shortcut_set` varchar(32) CHARACTER SET ascii NOT NULL COMMENT 'The ID of the target entity.',
  `langcode` varchar(12) CHARACTER SET ascii NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `link__uri` varchar(2048) DEFAULT NULL COMMENT 'The URI of the link.',
  `link__title` varchar(255) DEFAULT NULL COMMENT 'The link text.',
  `link__options` longblob DEFAULT NULL COMMENT 'Serialized array of options for the link.',
  `default_langcode` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`,`langcode`),
  KEY `shortcut__id__default_langcode__langcode` (`id`,`default_langcode`,`langcode`),
  KEY `shortcut_field__shortcut_set__target_id` (`shortcut_set`),
  KEY `shortcut_field__link__uri` (`link__uri`(30))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The data table for shortcut entities.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shortcut_field_data`
--

LOCK TABLES `shortcut_field_data` WRITE;
/*!40000 ALTER TABLE `shortcut_field_data` DISABLE KEYS */;
INSERT INTO `shortcut_field_data` VALUES (1,'default','en','Add content',-20,'internal:/node/add',NULL,'a:0:{}',1),(2,'default','en','All content',-19,'internal:/admin/content',NULL,'a:0:{}',1);
/*!40000 ALTER TABLE `shortcut_field_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shortcut_set_users`
--

DROP TABLE IF EXISTS `shortcut_set_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shortcut_set_users` (
  `uid` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'The users.uid for this set.',
  `set_name` varchar(32) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The shortcut_set.set_name that will be displayed for this user.',
  PRIMARY KEY (`uid`),
  KEY `set_name` (`set_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Maps users to shortcut sets.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shortcut_set_users`
--

LOCK TABLES `shortcut_set_users` WRITE;
/*!40000 ALTER TABLE `shortcut_set_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `shortcut_set_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxonomy_term__parent`
--

DROP TABLE IF EXISTS `taxonomy_term__parent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxonomy_term__parent` (
  `bundle` varchar(128) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to, which for an unversioned entity type is the same as the entity id',
  `langcode` varchar(32) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The language code for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `parent_target_id` int(10) unsigned NOT NULL COMMENT 'The ID of the target entity.',
  PRIMARY KEY (`entity_id`,`deleted`,`delta`,`langcode`),
  KEY `bundle` (`bundle`),
  KEY `revision_id` (`revision_id`),
  KEY `parent_target_id` (`parent_target_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Data storage for taxonomy_term field parent.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxonomy_term__parent`
--

LOCK TABLES `taxonomy_term__parent` WRITE;
/*!40000 ALTER TABLE `taxonomy_term__parent` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxonomy_term__parent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxonomy_term_data`
--

DROP TABLE IF EXISTS `taxonomy_term_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxonomy_term_data` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vid` varchar(32) CHARACTER SET ascii NOT NULL COMMENT 'The ID of the target entity.',
  `uuid` varchar(128) CHARACTER SET ascii NOT NULL,
  `langcode` varchar(12) CHARACTER SET ascii NOT NULL,
  PRIMARY KEY (`tid`),
  UNIQUE KEY `taxonomy_term_field__uuid__value` (`uuid`),
  KEY `taxonomy_term_field__vid__target_id` (`vid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The base table for taxonomy_term entities.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxonomy_term_data`
--

LOCK TABLES `taxonomy_term_data` WRITE;
/*!40000 ALTER TABLE `taxonomy_term_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxonomy_term_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxonomy_term_field_data`
--

DROP TABLE IF EXISTS `taxonomy_term_field_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxonomy_term_field_data` (
  `tid` int(10) unsigned NOT NULL,
  `vid` varchar(32) CHARACTER SET ascii NOT NULL COMMENT 'The ID of the target entity.',
  `langcode` varchar(12) CHARACTER SET ascii NOT NULL,
  `status` tinyint(4) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description__value` longtext DEFAULT NULL,
  `description__format` varchar(255) CHARACTER SET ascii DEFAULT NULL,
  `weight` int(11) NOT NULL,
  `changed` int(11) DEFAULT NULL,
  `default_langcode` tinyint(4) NOT NULL,
  PRIMARY KEY (`tid`,`langcode`),
  KEY `taxonomy_term__id__default_langcode__langcode` (`tid`,`default_langcode`,`langcode`),
  KEY `taxonomy_term_field__name` (`name`(191)),
  KEY `taxonomy_term__status_vid` (`status`,`vid`,`tid`),
  KEY `taxonomy_term__tree` (`vid`,`weight`,`name`(191)),
  KEY `taxonomy_term__vid_name` (`vid`,`name`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The data table for taxonomy_term entities.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxonomy_term_field_data`
--

LOCK TABLES `taxonomy_term_field_data` WRITE;
/*!40000 ALTER TABLE `taxonomy_term_field_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxonomy_term_field_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_alias`
--

DROP TABLE IF EXISTS `url_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_alias` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'A unique path alias identifier.',
  `source` varchar(255) NOT NULL DEFAULT '' COMMENT 'The Drupal path this alias is for. e.g. node/12.',
  `alias` varchar(255) NOT NULL DEFAULT '' COMMENT 'The alias for this path. e.g. title-of-the-story.',
  `langcode` varchar(12) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The language code this alias is for. if ''und'', the alias will be used for unknown languages. Each Drupal path can have an alias for each supported language.',
  PRIMARY KEY (`pid`),
  KEY `alias_langcode_pid` (`alias`(191),`langcode`,`pid`),
  KEY `source_langcode_pid` (`source`(191),`langcode`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='A list of URL aliases for Drupal paths. a user may visit…';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_alias`
--

LOCK TABLES `url_alias` WRITE;
/*!40000 ALTER TABLE `url_alias` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_alias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user__roles`
--

DROP TABLE IF EXISTS `user__roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user__roles` (
  `bundle` varchar(128) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to, which for an unversioned entity type is the same as the entity id',
  `langcode` varchar(32) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The language code for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `roles_target_id` varchar(255) CHARACTER SET ascii NOT NULL COMMENT 'The ID of the target entity.',
  PRIMARY KEY (`entity_id`,`deleted`,`delta`,`langcode`),
  KEY `bundle` (`bundle`),
  KEY `revision_id` (`revision_id`),
  KEY `roles_target_id` (`roles_target_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Data storage for user field roles.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user__roles`
--

LOCK TABLES `user__roles` WRITE;
/*!40000 ALTER TABLE `user__roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user__roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user__user_picture`
--

DROP TABLE IF EXISTS `user__user_picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user__user_picture` (
  `bundle` varchar(128) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to, which for an unversioned entity type is the same as the entity id',
  `langcode` varchar(32) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The language code for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `user_picture_target_id` int(10) unsigned NOT NULL COMMENT 'The ID of the file entity.',
  `user_picture_alt` varchar(512) DEFAULT NULL COMMENT 'Alternative image text, for the image''s ''alt'' attribute.',
  `user_picture_title` varchar(1024) DEFAULT NULL COMMENT 'Image title text, for the image''s ''title'' attribute.',
  `user_picture_width` int(10) unsigned DEFAULT NULL COMMENT 'The width of the image in pixels.',
  `user_picture_height` int(10) unsigned DEFAULT NULL COMMENT 'The height of the image in pixels.',
  PRIMARY KEY (`entity_id`,`deleted`,`delta`,`langcode`),
  KEY `bundle` (`bundle`),
  KEY `revision_id` (`revision_id`),
  KEY `user_picture_target_id` (`user_picture_target_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Data storage for user field user_picture.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user__user_picture`
--

LOCK TABLES `user__user_picture` WRITE;
/*!40000 ALTER TABLE `user__user_picture` DISABLE KEYS */;
/*!40000 ALTER TABLE `user__user_picture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `uid` int(10) unsigned NOT NULL,
  `uuid` varchar(128) CHARACTER SET ascii NOT NULL,
  `langcode` varchar(12) CHARACTER SET ascii NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `user_field__uuid__value` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The base table for user entities.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (0,'b57d98af-655b-46a1-bb91-8fc2101c0e5d','en'),(1,'5c7d0d80-7333-44c6-9aa5-c9a7003d8b83','en');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_data`
--

DROP TABLE IF EXISTS `users_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_data` (
  `uid` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Primary key: users.uid for user.',
  `module` varchar(50) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The name of the module declaring the variable.',
  `name` varchar(128) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The identifier of the data.',
  `value` longblob DEFAULT NULL COMMENT 'The value.',
  `serialized` tinyint(3) unsigned DEFAULT 0 COMMENT 'Whether value is serialized.',
  PRIMARY KEY (`uid`,`module`,`name`),
  KEY `module` (`module`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores module data as key/value pairs per user.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_data`
--

LOCK TABLES `users_data` WRITE;
/*!40000 ALTER TABLE `users_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_field_data`
--

DROP TABLE IF EXISTS `users_field_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_field_data` (
  `uid` int(10) unsigned NOT NULL,
  `langcode` varchar(12) CHARACTER SET ascii NOT NULL,
  `preferred_langcode` varchar(12) CHARACTER SET ascii DEFAULT NULL,
  `preferred_admin_langcode` varchar(12) CHARACTER SET ascii DEFAULT NULL,
  `name` varchar(60) NOT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `mail` varchar(254) DEFAULT NULL,
  `timezone` varchar(32) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created` int(11) NOT NULL,
  `changed` int(11) DEFAULT NULL,
  `access` int(11) NOT NULL,
  `login` int(11) DEFAULT NULL,
  `init` varchar(254) DEFAULT NULL,
  `default_langcode` tinyint(4) NOT NULL,
  PRIMARY KEY (`uid`,`langcode`),
  UNIQUE KEY `user__name` (`name`,`langcode`),
  KEY `user__id__default_langcode__langcode` (`uid`,`default_langcode`,`langcode`),
  KEY `user_field__mail` (`mail`(191)),
  KEY `user_field__created` (`created`),
  KEY `user_field__access` (`access`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The data table for user entities.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_field_data`
--

LOCK TABLES `users_field_data` WRITE;
/*!40000 ALTER TABLE `users_field_data` DISABLE KEYS */;
INSERT INTO `users_field_data` VALUES (0,'en','en',NULL,'',NULL,NULL,'',0,1548558632,1548558632,0,0,NULL,1),(1,'en','en',NULL,'admin','$S$EGJ85atUnxNhp5fG6jt8Sfp7Oqpq/m/S2Lt318e/ShYJHxgRnBYK','admin@example.com','UTC',1,1548558632,1548558632,1548559842,1548559302,'admin@example.com',1);
/*!40000 ALTER TABLE `users_field_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- start slave statement to make a recovery dump)
--

START ALL SLAVES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-30 17:11:49
