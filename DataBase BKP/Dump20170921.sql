-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bpm2gp
-- ------------------------------------------------------
-- Server version	5.5.5-10.2.6-MariaDB

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
-- Table structure for table `associationconf`
--

DROP TABLE IF EXISTS `associationconf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `associationconf` (
  `Id` varchar(40) NOT NULL,
  `DtCreation` datetime DEFAULT NULL,
  `idLanguage` varchar(40) DEFAULT NULL,
  `idGenre` varchar(40) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idLanguage` (`idLanguage`),
  KEY `idGenre` (`idGenre`),
  CONSTRAINT `FKE80744B51E209D62` FOREIGN KEY (`idLanguage`) REFERENCES `modelinglanguage` (`Id`),
  CONSTRAINT `FKE80744B58D3AFCEE` FOREIGN KEY (`idGenre`) REFERENCES `gamegenre` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `associationconf`
--

LOCK TABLES `associationconf` WRITE;
/*!40000 ALTER TABLE `associationconf` DISABLE KEYS */;
INSERT INTO `associationconf` VALUES ('63c6df26-0931-4427-add3-7ebbe917be11','2017-09-21 13:27:39','02611a6e-0baa-411b-9a07-e21c383718d4','e53814d2-6677-40d9-ab63-e96ad093b459','Default modeling mapping'),('c34f66b0-44a4-415d-9af3-d8fd1cc82447','2017-09-21 09:25:47','02611a6e-0baa-411b-9a07-e21c383718d4','936f7a7a-4b2e-4728-9262-cd9cbeb8759e','PRG');
/*!40000 ALTER TABLE `associationconf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `associationconfelements`
--

DROP TABLE IF EXISTS `associationconfelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `associationconfelements` (
  `Id` varchar(40) NOT NULL,
  `idLanguageElement` varchar(40) DEFAULT NULL,
  `idGenreElement` varchar(40) DEFAULT NULL,
  `idAssociation` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idLanguageElement` (`idLanguageElement`),
  KEY `idGenreElement` (`idGenreElement`),
  KEY `idAssociation` (`idAssociation`),
  CONSTRAINT `FKA6629BFC3B7BE5F1` FOREIGN KEY (`idAssociation`) REFERENCES `associationconf` (`Id`),
  CONSTRAINT `FKA6629BFC7F92B532` FOREIGN KEY (`idGenreElement`) REFERENCES `gamegenreelement` (`Id`),
  CONSTRAINT `FKA6629BFC8A35720A` FOREIGN KEY (`idLanguageElement`) REFERENCES `modelinglanguageelement` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `associationconfelements`
--

LOCK TABLES `associationconfelements` WRITE;
/*!40000 ALTER TABLE `associationconfelements` DISABLE KEYS */;
/*!40000 ALTER TABLE `associationconfelements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `designer`
--

DROP TABLE IF EXISTS `designer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `designer` (
  `Id` varchar(40) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `ShortBio` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `designer`
--

LOCK TABLES `designer` WRITE;
/*!40000 ALTER TABLE `designer` DISABLE KEYS */;
INSERT INTO `designer` VALUES ('7c53a0df-cd41-4bb9-9dc1-bdd001f5c8ba','João',NULL),('c86a7d55-8980-42dc-8879-d37bd9c05398','Tadeu Classe',NULL);
/*!40000 ALTER TABLE `designer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `designers`
--

DROP TABLE IF EXISTS `designers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `designers` (
  `idProject` varchar(40) NOT NULL,
  `idDesigner` varchar(40) NOT NULL,
  KEY `idDesigner` (`idDesigner`),
  KEY `idProject` (`idProject`),
  CONSTRAINT `FKFA7685E3638896E9` FOREIGN KEY (`idDesigner`) REFERENCES `designer` (`Id`),
  CONSTRAINT `FKFA7685E36BCBAFA8` FOREIGN KEY (`idProject`) REFERENCES `project` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `designers`
--

LOCK TABLES `designers` WRITE;
/*!40000 ALTER TABLE `designers` DISABLE KEYS */;
INSERT INTO `designers` VALUES ('345a828f-8073-4873-baa2-fe7f60015631','c86a7d55-8980-42dc-8879-d37bd9c05398'),('3817467d-d483-46b6-8e3d-15867dc28376','c86a7d55-8980-42dc-8879-d37bd9c05398');
/*!40000 ALTER TABLE `designers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gamegenre`
--

DROP TABLE IF EXISTS `gamegenre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gamegenre` (
  `Id` varchar(40) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `RegisterDate` datetime DEFAULT NULL,
  `IsConstant` tinyint(1) DEFAULT NULL,
  `idDesigner` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idDesigner` (`idDesigner`),
  CONSTRAINT `FK77BA5441638896E9` FOREIGN KEY (`idDesigner`) REFERENCES `designer` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gamegenre`
--

LOCK TABLES `gamegenre` WRITE;
/*!40000 ALTER TABLE `gamegenre` DISABLE KEYS */;
INSERT INTO `gamegenre` VALUES ('1ddaef68-830a-4916-aee7-da1ed335b4f9','Simulation Games','This is the description of simulation game genres.','2017-09-19 16:39:20',0,'c86a7d55-8980-42dc-8879-d37bd9c05398'),('936f7a7a-4b2e-4728-9262-cd9cbeb8759e','RPG Game','Role Playing Game','2017-09-19 16:38:55',0,'c86a7d55-8980-42dc-8879-d37bd9c05398'),('e53814d2-6677-40d9-ab63-e96ad093b459','Adventure Game','Adventure Game','2017-09-19 16:32:13',0,'c86a7d55-8980-42dc-8879-d37bd9c05398');
/*!40000 ALTER TABLE `gamegenre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gamegenreelement`
--

DROP TABLE IF EXISTS `gamegenreelement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gamegenreelement` (
  `Id` varchar(40) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `idGenre` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idGenre` (`idGenre`),
  CONSTRAINT `FK518FD6B98D3AFCEE` FOREIGN KEY (`idGenre`) REFERENCES `gamegenre` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gamegenreelement`
--

LOCK TABLES `gamegenreelement` WRITE;
/*!40000 ALTER TABLE `gamegenreelement` DISABLE KEYS */;
INSERT INTO `gamegenreelement` VALUES ('0883d525-11a1-4e70-afba-468d06d54def','Narrative','The way in which a story is told and the representational process involved/storytelling','e53814d2-6677-40d9-ab63-e96ad093b459'),('2c690334-badd-4d59-baf1-3c6f317dc68d','User interface ','The observable on-screen features which allow the user to communicate in a meaningful way with the computer via the selection of text, graphics, sound and animation.','e53814d2-6677-40d9-ab63-e96ad093b459'),('4b830c26-11c1-487b-92e6-541a804e6512','Quest','A set of tasks.','e53814d2-6677-40d9-ab63-e96ad093b459'),('535aa5e1-51ef-4615-a49b-c350ee12b40f','Problem Solution','Cognitive processing directed at achieving a goal when no solution method is obvious to the player.','e53814d2-6677-40d9-ab63-e96ad093b459'),('5a15c1e8-dfd0-4fed-89ee-bce4fbba3b45','Interaction','Action that occurs between two or more objects that have an effect upon one another.','e53814d2-6677-40d9-ab63-e96ad093b459'),('65e86a8e-148b-49dd-8585-aaf140b9998a','Reward','Motivation in achievement likes score/mark.','e53814d2-6677-40d9-ab63-e96ad093b459'),('800e41c7-c213-497b-ace7-f8945a5a343f','Game world','The game environment like island, cave system, magic world and their relevant populations.','e53814d2-6677-40d9-ab63-e96ad093b459'),('81fac1e4-751f-41a4-97c0-af3b3f29e9a7','Game rules','The rules governing the operation and the functions of characters and objects/items in the game world.','e53814d2-6677-40d9-ab63-e96ad093b459'),('8434d9a4-4d9a-4271-b851-1dd2e8badc2d','Stories','A series of activity that associated with task or goal that needs to be accomplished.','e53814d2-6677-40d9-ab63-e96ad093b459'),('8c345c78-29e7-4631-b442-7f927eeabcfa','Events','Some happening that can change the story.','e53814d2-6677-40d9-ab63-e96ad093b459'),('9246494a-0ea0-4506-90a9-9bc95fb21052','Title','Title of game, fase, phase and etc.','e53814d2-6677-40d9-ab63-e96ad093b459'),('935c75a4-43f0-462a-96c7-53ca7792dedc','Levels','The sequence of challenge.','e53814d2-6677-40d9-ab63-e96ad093b459'),('9d15c7ce-1e78-44d7-9d4d-c9fe34985596','Problem','Situation that must be solved','e53814d2-6677-40d9-ab63-e96ad093b459'),('9e161b27-b7c9-4f27-b620-d9f0b839995f','Feedback','Output/information about reactions to  a  player\'s performance of a task.','e53814d2-6677-40d9-ab63-e96ad093b459'),('b09e5d8f-4719-49ba-800d-221bc79efbb6','Guidance','Advice or information aimed at resolving a problem.','e53814d2-6677-40d9-ab63-e96ad093b459'),('baa242d7-2c41-40a1-94fa-b4f78e69f797','Plot','A set of events as they relate to each other. Plot breaks down a story into events dealing with exposition, the rising action, climax, falling action, and resolution.','e53814d2-6677-40d9-ab63-e96ad093b459'),('c0b15cd8-2538-40db-87ee-91f0cfd52d2a','Theme','The underlying moral theme of the game.','e53814d2-6677-40d9-ab63-e96ad093b459'),('c412d856-0210-4bfc-ae81-e13e87e48902','Player','Gamer/ the user play the game.','e53814d2-6677-40d9-ab63-e96ad093b459'),('c8543f9b-51ed-4bc1-a742-ca8c51c05993','Goal','Objective/ aim are target for player.','e53814d2-6677-40d9-ab63-e96ad093b459'),('c9e9f425-4d5b-41e7-9e4b-529cedfc75a3','Task','An assignment to be accomplished.','e53814d2-6677-40d9-ab63-e96ad093b459'),('e65adc27-0398-4e53-8da9-91541ecc64c2','Scenes','A scene describes a specific place within the game world.','e53814d2-6677-40d9-ab63-e96ad093b459'),('e6905414-7ebc-4e0a-9d0f-f940fface963','Characters','Player and non-player characters (NPC) prefer to process certain traits or attributes.','e53814d2-6677-40d9-ab63-e96ad093b459'),('f6f0474f-c1e5-41c1-8ac4-f093c793e8df','Text, graphics  and sound','Game involves a combination of text, graphics and sound.','e53814d2-6677-40d9-ab63-e96ad093b459'),('fabbf9c1-ad85-4fc0-97ae-077b24c6926a','Objects / Itens','The player are usually collected and used objects/items to solve problems.','e53814d2-6677-40d9-ab63-e96ad093b459');
/*!40000 ALTER TABLE `gamegenreelement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelinglanguage`
--

DROP TABLE IF EXISTS `modelinglanguage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modelinglanguage` (
  `Id` varchar(40) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Version` varchar(255) DEFAULT NULL,
  `RegisterDate` datetime DEFAULT NULL,
  `IsConstant` tinyint(1) DEFAULT NULL,
  `Inactive` tinyint(1) DEFAULT NULL,
  `idDesigner` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idDesigner` (`idDesigner`),
  CONSTRAINT `FK29C26C96638896E9` FOREIGN KEY (`idDesigner`) REFERENCES `designer` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelinglanguage`
--

LOCK TABLES `modelinglanguage` WRITE;
/*!40000 ALTER TABLE `modelinglanguage` DISABLE KEYS */;
INSERT INTO `modelinglanguage` VALUES ('02611a6e-0baa-411b-9a07-e21c383718d4','BPMN','Business Process Modeling and Notation','v.2.0','2017-09-13 16:21:02',1,0,'c86a7d55-8980-42dc-8879-d37bd9c05398');
/*!40000 ALTER TABLE `modelinglanguage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelinglanguageelement`
--

DROP TABLE IF EXISTS `modelinglanguageelement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modelinglanguageelement` (
  `Id` varchar(40) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Description` longtext DEFAULT NULL,
  `Metamodel` varchar(255) DEFAULT NULL,
  `idElement` varchar(40) DEFAULT NULL,
  `idLanguage` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idElement` (`idElement`),
  KEY `idLanguage` (`idLanguage`),
  CONSTRAINT `FK7783E0701E209D62` FOREIGN KEY (`idLanguage`) REFERENCES `modelinglanguage` (`Id`),
  CONSTRAINT `FK7783E070FBF1887E` FOREIGN KEY (`idElement`) REFERENCES `modelinglanguageelement` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelinglanguageelement`
--

LOCK TABLES `modelinglanguageelement` WRITE;
/*!40000 ALTER TABLE `modelinglanguageelement` DISABLE KEYS */;
INSERT INTO `modelinglanguageelement` VALUES ('00cb5176-2968-4c82-97eb-d703fa32b2d6','Data Store','It element represent the storage of data.','bpmn:DataStoreReference',NULL,'02611a6e-0baa-411b-9a07-e21c383718d4'),('07c73d87-4967-41ad-94a8-79c5eb39d12d','Intermediate Catch Event','It is a event that happening in a process that can change the normal flow, starts or finish something. In this case the event is catched by something.','bpmn:IntermediateCatchEvent',NULL,'02611a6e-0baa-411b-9a07-e21c383718d4'),('12760d74-6660-42b8-b4b6-a6d6d92c563d','Rules','The rules guide the process, its interaction, flows and conditions.',NULL,NULL,'02611a6e-0baa-411b-9a07-e21c383718d4'),('133f0e58-af1d-4032-9e99-2561398dd41e','Recieve Task','It is a simple taks, but is especified by execution form. In this case it is performed on recieve something.','bpmn:ReceiveTask','187cb2f6-c4c5-4c98-ae16-dde26bab992d','02611a6e-0baa-411b-9a07-e21c383718d4'),('187cb2f6-c4c5-4c98-ae16-dde26bab992d','Task','Tasks are works that must performed by someone in the process. Task is simple, and perfomed by people or systems.','bpmn:Task ',NULL,'02611a6e-0baa-411b-9a07-e21c383718d4'),('1db2c686-bee2-4c5f-a387-e51129a93099','User Task','It is a simple taks, but is especified by execution form. In this case it is performed by a user into the process.','bpmn:UserTask','187cb2f6-c4c5-4c98-ae16-dde26bab992d','02611a6e-0baa-411b-9a07-e21c383718d4'),('2ad1a82c-de68-4a4c-adb8-71e196d3dd92','Manual Task','It is a simple taks, but is especified by execution form. In this case it is executed manually.','bpmn:ManualTask','187cb2f6-c4c5-4c98-ae16-dde26bab992d','02611a6e-0baa-411b-9a07-e21c383718d4'),('2d3de4bf-04eb-483b-90fb-11c8e0b2e1f9','Annotation','It represent some extra information on the process.','bpmn:TextAnnotation',NULL,'02611a6e-0baa-411b-9a07-e21c383718d4'),('31f62978-9307-4248-8c46-3a74693d346e','Business Rule Task','It is a simple taks, but is especified by execution form. In this case it is performed on business rule activate.','bpmn:BusinessRuleTask','187cb2f6-c4c5-4c98-ae16-dde26bab992d','02611a6e-0baa-411b-9a07-e21c383718d4'),('3a72681e-9709-4b32-bd7f-0f758401683d','Parallel Gateway','The gateways controls the rules and requiriments, changing the flow sequence. This gateway is responsable for parallel flow, performing all paths, and join the responses on the end.','bpmn:ParallelGateway',NULL,'02611a6e-0baa-411b-9a07-e21c383718d4'),('3edd387f-9a65-4186-98b8-6b6b59cc1257','Instance (Course)','This is a execution example of the process. It show happenings, rules, flows, artifactis, narratives and others artifcats userfull to the process description.',NULL,NULL,'02611a6e-0baa-411b-9a07-e21c383718d4'),('3ff6eb07-ef1c-421d-ab49-15aa118a9bba','Send Task','It is a simple taks, but is especified by execution form. In this case it is about a message send.','bpmn:SendTask','187cb2f6-c4c5-4c98-ae16-dde26bab992d','02611a6e-0baa-411b-9a07-e21c383718d4'),('4771d5db-716e-4970-be18-f3ceead8fa2c','Service Task','It is a simple taks, but is especified by execution form. In this case it is performed by a service','bpmn:ServiceTask','187cb2f6-c4c5-4c98-ae16-dde26bab992d','02611a6e-0baa-411b-9a07-e21c383718d4'),('4c79d552-a2f2-4dee-8e15-139fa512b82e','Message Flow','This flow represents the communication among entities, generally among different participants.','bpmn:MessageFlow',NULL,'02611a6e-0baa-411b-9a07-e21c383718d4'),('585fc96e-55f9-4ea4-b1cc-6f264982a54b','Sequence Flow','This flow represents a temporal order (sequence) that actions happening.','bpmn:SequenceFlow',NULL,'02611a6e-0baa-411b-9a07-e21c383718d4'),('7031ba7d-e92a-43a0-892e-b7928d1d8635','Lane','Lane is a person, department, organization, etc. Responsable for tasks execution. They are rules in the process.','bpmn:Lane',NULL,'02611a6e-0baa-411b-9a07-e21c383718d4'),('76e33acc-579d-48a7-bb92-d512422c5a10','Exclusive Gateway','The gateways controls the rules and requiriments, changing the flow sequence. This gateway is responsable for exclusive flow, performing only path.','bpmn:ExclusiveGateway',NULL,'02611a6e-0baa-411b-9a07-e21c383718d4'),('7cd3338b-dc8b-44f8-8926-f4c1ff54c637','Participant (Black Box or Pool)','It is a participant. Is a person, system, organization, departmen, etc. tha permorf something.','bpmn:Participant',NULL,'02611a6e-0baa-411b-9a07-e21c383718d4'),('7d7508af-fd61-4079-bdf7-9493caf9dfce','Start Event','It is some begining happening in the process.','bpmn:StartEvent',NULL,'02611a6e-0baa-411b-9a07-e21c383718d4'),('7f9f69bc-7557-43e4-b577-01d55c6bb674','Process','A business process. Temporal activities sequence to perform a business objective.','bpmn:Process',NULL,'02611a6e-0baa-411b-9a07-e21c383718d4'),('8544baa4-df76-42ee-b8c5-3989f386f0b9','Data Object','It element means a data object as data base, systems, files, forms, etc.','bpmn:DataObjectReference',NULL,'02611a6e-0baa-411b-9a07-e21c383718d4'),('953242b2-9fec-48df-bddb-85ae96a0bd04','End Event','It is a end happening on a process.','bpmn:EndEvent',NULL,'02611a6e-0baa-411b-9a07-e21c383718d4'),('b439ec98-26c5-4821-bf21-15f2e9347532','Boundary Event','It is a event that happening in a some task boundary. It can change de process flow.','bpmn:BoundaryEvent',NULL,'02611a6e-0baa-411b-9a07-e21c383718d4'),('c72cbb03-598f-4432-bd4e-1badadf598da','Localization','Places and physic localizations of organizational interest',NULL,NULL,'02611a6e-0baa-411b-9a07-e21c383718d4'),('c74d0c0e-a718-4e3b-a317-6d5c45272d50','Association','This represents the connection among tasks and artifacts (resources)','bpmn:Association',NULL,'02611a6e-0baa-411b-9a07-e21c383718d4'),('c77945ab-f948-4118-ac1e-0d8b2e522d76','Intermidiate Throw Event','It is a event that happening in a process that can change the normal flow, starts or finish something. In this case the event is triggered by something.','bpmn:IntermediateThrowEvent',NULL,'02611a6e-0baa-411b-9a07-e21c383718d4'),('d5621be3-5f72-46bf-99bf-04ef9693367f','Script Task','It is a simple taks, but is especified by execution form. In this case it is performed by a script (automatic)','bpmn:ScriptTask','187cb2f6-c4c5-4c98-ae16-dde26bab992d','02611a6e-0baa-411b-9a07-e21c383718d4'),('d5e6470c-b6ec-4e3f-818c-0d0152f23277','Inclusive Gateway','The gateways controls the rules and requiriments, changing the flow sequence. This gateway is responsable for inclusive flow, could (or not) perform all or single path. It join the responses on the end.','bpmn:InclusiveGateway',NULL,'02611a6e-0baa-411b-9a07-e21c383718d4'),('f0b005f3-7094-4f2e-bbe6-ab3636878428','Objectives (Goals)','Goal situation of the process.',NULL,NULL,'02611a6e-0baa-411b-9a07-e21c383718d4'),('f2c042e2-48b9-4545-b470-6153eaddf0f0','Event Based Gateway','The gateways controls the rules and requiriments, changing the flow sequence. This gateway depends of a event to follow some path.','bpmn:EventBasedGateway',NULL,'02611a6e-0baa-411b-9a07-e21c383718d4'),('f4446772-5d65-47ed-89af-0d307e21bc68','Sub Process','This is a compused task. Its mean that this element is compused by another tasks, but they could hidde the simple tasks.','bpmn:SubProcess',NULL,'02611a6e-0baa-411b-9a07-e21c383718d4');
/*!40000 ALTER TABLE `modelinglanguageelement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `Id` varchar(40) NOT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Description` longtext DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `LastUpdate` datetime DEFAULT NULL,
  `BpmnModelPath` varchar(255) DEFAULT NULL,
  `BpmnModel` longblob DEFAULT NULL,
  `Inactive` tinyint(1) DEFAULT NULL,
  `idDesigner` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idDesigner` (`idDesigner`),
  CONSTRAINT `FKCFC6D85A638896E9` FOREIGN KEY (`idDesigner`) REFERENCES `designer` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES ('345a828f-8073-4873-baa2-fe7f60015631','Desaparecidos RJ','This game is based on service process of missing people discover from Rio de Janeiro\'s civil police. The main goal of this game is to explore the sub-process of people missing notification. It is game uses a real scenario as narrative backgroud to the game.','2017-09-14 13:00:37','2017-09-14 13:00:37','D:\\Projetos Doutorado\\ProcessModel2GameProject\\BPM2Game\\files\\bpmn\\345a828f-8073-4873-baa2-fe7f60015631.txt',NULL,0,'c86a7d55-8980-42dc-8879-d37bd9c05398'),('3817467d-d483-46b6-8e3d-15867dc28376','P1',NULL,'2017-09-14 18:02:10','2017-09-14 18:02:10','D:\\Projetos Doutorado\\ProcessModel2GameProject\\BPM2Game\\files\\bpmn\\3817467d-d483-46b6-8e3d-15867dc28376.txt',NULL,0,'c86a7d55-8980-42dc-8879-d37bd9c05398');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `idDesigner` varchar(40) NOT NULL,
  `idProject` varchar(40) NOT NULL,
  KEY `idProject` (`idProject`),
  KEY `idDesigner` (`idDesigner`),
  CONSTRAINT `FK6E25D85A638896E9` FOREIGN KEY (`idDesigner`) REFERENCES `designer` (`Id`),
  CONSTRAINT `FK6E25D85A6BCBAFA8` FOREIGN KEY (`idProject`) REFERENCES `project` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `Id` varchar(40) NOT NULL,
  `UserName` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `IdDesigner` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IdDesigner` (`IdDesigner`),
  CONSTRAINT `FK7185C17C638896E9` FOREIGN KEY (`IdDesigner`) REFERENCES `designer` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('90ff785f-e79d-4aa1-b851-e4b62404bd8b','Tadeu Classe','tadeu.classe@gmail.com','tadeuclasse','c86a7d55-8980-42dc-8879-d37bd9c05398'),('f557da17-506d-4791-b9f9-abc90870c182','João','joao@123.com','123456','7c53a0df-cd41-4bb9-9dc1-bdd001f5c8ba');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bpm2gp'
--

--
-- Dumping routines for database 'bpm2gp'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-21 15:48:39
