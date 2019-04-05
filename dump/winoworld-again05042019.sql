-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: winoworld
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(45) DEFAULT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  `avatar` varchar(45) DEFAULT NULL,
  `id_habilidade` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (1,'Noob','Fraco, um ninguém','sob_1.jpg',NULL);
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conquistas`
--

DROP TABLE IF EXISTS `conquistas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `conquistas` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nome_con` varchar(45) DEFAULT NULL,
  `xp` int(11) DEFAULT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `imagem` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conquistas`
--

LOCK TABLES `conquistas` WRITE;
/*!40000 ALTER TABLE `conquistas` DISABLE KEYS */;
/*!40000 ALTER TABLE `conquistas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conquistas_feitas`
--

DROP TABLE IF EXISTS `conquistas_feitas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `conquistas_feitas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conquista_id` int(11) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `jogador_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conquistas_feitas`
--

LOCK TABLES `conquistas_feitas` WRITE;
/*!40000 ALTER TABLE `conquistas_feitas` DISABLE KEYS */;
/*!40000 ALTER TABLE `conquistas_feitas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habilidades`
--

DROP TABLE IF EXISTS `habilidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `habilidades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `desc` varchar(45) DEFAULT NULL,
  `efeito` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habilidades`
--

LOCK TABLES `habilidades` WRITE;
/*!40000 ALTER TABLE `habilidades` DISABLE KEYS */;
/*!40000 ALTER TABLE `habilidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habilidades_kit`
--

DROP TABLE IF EXISTS `habilidades_kit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `habilidades_kit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hab1` int(11) DEFAULT NULL,
  `hab2` int(11) DEFAULT NULL,
  `hab3` int(11) DEFAULT NULL,
  `hab4` int(11) DEFAULT NULL,
  `hab5` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habilidades_kit`
--

LOCK TABLES `habilidades_kit` WRITE;
/*!40000 ALTER TABLE `habilidades_kit` DISABLE KEYS */;
/*!40000 ALTER TABLE `habilidades_kit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `level`
--

DROP TABLE IF EXISTS `level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` int(11) DEFAULT NULL,
  `requisitos` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level`
--

LOCK TABLES `level` WRITE;
/*!40000 ALTER TABLE `level` DISABLE KEYS */;
INSERT INTO `level` VALUES (1,0,NULL);
/*!40000 ALTER TABLE `level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_jogadores`
--

DROP TABLE IF EXISTS `log_jogadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `log_jogadores` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nome_jogador` varchar(45) DEFAULT NULL,
  `xp` int(11) DEFAULT NULL,
  `level_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `tma` time DEFAULT NULL,
  `zumbis_mortos` int(11) DEFAULT NULL,
  `sem_categoria` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_jogadores`
--

LOCK TABLES `log_jogadores` WRITE;
/*!40000 ALTER TABLE `log_jogadores` DISABLE KEYS */;
INSERT INTO `log_jogadores` VALUES (1,'João Uchiashi',0,0,0,'2019-03-01 16:00:30','00:00:00',0,682),(2,'João Uchiashi',0,0,0,'2019-03-01 16:01:57','00:00:00',0,682),(3,'João Uchiashi',0,0,0,'2019-03-01 16:07:57','00:00:00',0,682),(4,'João Uchiashi',0,0,0,'2019-03-01 16:10:59','00:00:00',0,682),(5,'João Uchiashi',0,0,0,'2019-03-01 16:14:01','00:00:00',0,682),(6,'Douglas Dias',512,0,0,'2019-03-12 08:25:16','00:25:31',116,0);
/*!40000 ALTER TABLE `log_jogadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mes_atual`
--

DROP TABLE IF EXISTS `mes_atual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mes_atual` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `inicio_mes` datetime DEFAULT NULL,
  `fim_mes` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mes_atual`
--

LOCK TABLES `mes_atual` WRITE;
/*!40000 ALTER TABLE `mes_atual` DISABLE KEYS */;
INSERT INTO `mes_atual` VALUES (1,'2019-04-01 00:00:00','2019-04-30 23:59:59');
/*!40000 ALTER TABLE `mes_atual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `players` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `class_id` varchar(45) DEFAULT NULL,
  `hp` int(11) DEFAULT NULL,
  `hp_total` int(11) DEFAULT NULL,
  `avatar` varchar(45) DEFAULT NULL,
  `xp` int(11) DEFAULT NULL,
  `liberado` int(11) DEFAULT NULL,
  `chance` int(11) DEFAULT NULL,
  `users_id` int(11) DEFAULT NULL,
  `level_id` int(11) DEFAULT NULL,
  `glpi_id` int(11) DEFAULT NULL,
  `zumbis_mortos` int(11) DEFAULT NULL,
  `tma` time DEFAULT NULL,
  `xp_atual` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (1,'João Uchiashi','1',50,50,'soldier.png',1787,0,0,1,1,968,45,'00:12:29',45),(2,'Giovani Di Nolla','1',50,50,'sob_2.png',1834,0,0,2,1,945,112,'00:28:25',137),(3,'Paulo Aquino','1',50,50,'sob_5.png',2833,0,0,3,1,972,31,'00:35:34',106),(4,'Fabio Santos','1',50,50,'sob_1.png',2480,0,0,4,1,63,8,'00:29:33',8);
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `task` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name_task` varchar(100) DEFAULT NULL,
  `xp` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (8,'Manutenção de equipamento',50),(9,'Pensar e criar formas melhores de derrotar os zumbis',100),(10,'Atualizar registro de missões e sobre as criaturas',50),(11,'Movimentar os equipamentos entre lugares.',25),(12,'Alterar os canais de comunicação da equipe',1),(13,'Modificações na torre de rádio.',100),(14,'Patrulhas e alertas sobre possíveis ataques.',50),(15,'Atualizar registros sobre o que temos em estoque.',50),(16,'Rotinas dentro da base.',250),(17,'Reconhecimento de campo proximo a base.',25);
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_feita`
--

DROP TABLE IF EXISTS `task_feita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `task_feita` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) DEFAULT NULL,
  `data_conclusao` datetime DEFAULT NULL,
  `player_id` int(11) DEFAULT NULL,
  `xp_total` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `n_chamado` int(11) DEFAULT NULL,
  `id_player_log` int(11) DEFAULT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_feita`
--

LOCK TABLES `task_feita` WRITE;
/*!40000 ALTER TABLE `task_feita` DISABLE KEYS */;
INSERT INTO `task_feita` VALUES (1,9,'2019-03-06 16:20:02',4,400,4,0,NULL,NULL),(2,9,'2019-03-06 16:20:19',1,400,4,0,NULL,NULL),(3,9,'2019-03-06 16:20:39',2,200,2,0,NULL,NULL),(4,9,'2019-03-06 16:21:23',3,200,2,0,NULL,''),(5,9,'2019-03-06 16:21:50',3,100,1,0,NULL,''),(6,8,'2019-03-07 08:28:16',0,100,2,19084,5,NULL),(7,8,'2019-03-07 09:56:58',2,300,6,0,NULL,NULL),(8,8,'2019-03-07 09:57:15',3,50,1,0,NULL,NULL),(9,8,'2019-03-07 09:57:32',0,300,6,0,5,NULL),(10,13,'2019-03-07 11:59:38',1,100,1,0,NULL,NULL),(11,9,'2019-03-11 17:00:50',3,600,6,0,NULL,NULL),(12,13,'2019-03-13 11:11:34',4,400,4,0,NULL,NULL),(13,9,'2019-03-13 11:12:21',4,100,1,0,NULL,NULL),(14,9,'2019-03-13 11:12:24',3,100,1,0,NULL,NULL),(15,9,'2019-03-14 09:14:00',3,100,1,0,NULL,'Atualização Site Wocc'),(16,12,'2019-03-15 14:55:44',1,150,150,0,NULL,NULL),(17,8,'2019-03-15 14:55:59',2,100,2,0,NULL,NULL),(18,12,'2019-03-15 14:56:20',1,100,100,0,NULL,NULL),(19,12,'2019-03-15 14:56:57',4,100,100,0,NULL,NULL),(20,12,'2019-03-19 09:40:00',4,1,1,0,NULL,NULL),(21,12,'2019-03-19 09:41:11',4,159,159,0,NULL,NULL),(22,8,'2019-03-19 09:43:46',2,150,3,0,NULL,NULL),(23,8,'2019-03-19 13:19:20',2,200,4,0,NULL,NULL),(24,9,'2019-03-19 16:25:18',3,200,2,0,NULL,'Cadastro Turno/ Validar Checklist - Sistema Checklist'),(25,13,'2019-03-19 16:55:37',4,200,2,0,NULL,NULL),(26,17,'2019-03-20 09:37:26',2,25,1,0,NULL,NULL),(27,17,'2019-03-20 09:37:39',3,25,1,0,NULL,'Checklist feito hoje'),(28,9,'2019-03-20 10:17:44',3,100,1,0,NULL,'Front End - Beholder 1.0 - Visão TI Checklist.'),(29,12,'2019-03-20 16:24:13',1,30,30,0,NULL,'Retirado canais CTZ '),(31,12,'2019-03-20 16:30:08',4,366,366,0,NULL,'Mudança da rota ctz para bv_telecom, pois a rota ctz esta com problema de caixa postal'),(33,9,'2019-03-22 12:55:42',3,500,5,0,NULL,'Criação de sistema de votação da CIPA com criptografia para não identificar voto.'),(34,12,'2019-03-22 13:08:37',1,266,266,0,NULL,'Devolvendo canais CTZ - Rota normalizada'),(35,17,'2019-03-25 09:25:10',3,25,1,0,NULL,'Checklist Telecobrança.'),(36,17,'2019-03-25 11:23:51',4,25,1,0,NULL,'Chekclist Sistema Winover dia 23/0'),(37,13,'2019-03-25 11:26:03',4,100,1,0,NULL,'Cabeamento Chipera Claro  '),(38,17,'2019-03-25 11:28:54',4,25,1,0,NULL,'Organização Arquivo TI - dia 20/03'),(39,11,'2019-03-25 11:34:53',3,25,1,0,NULL,'Organização de equipamentos do T.I'),(40,9,'2019-03-25 14:25:42',3,100,1,0,NULL,'Login Checklist '),(41,12,'2019-03-25 17:18:34',4,10,10,0,NULL,'configuração com 10 Canais Claro_gsm_chipera '),(42,13,'2019-03-25 17:20:09',4,100,1,0,NULL,'Rodizio Manual dos Chips Khomp 58810 '),(43,11,'2019-03-25 20:48:45',1,25,1,0,NULL,'ORGANIZAÇÃO SALA TI'),(44,9,'2019-03-25 20:49:28',1,100,1,0,NULL,'check list matutino'),(45,9,'2019-03-25 20:49:49',1,100,1,0,NULL,'Check List Noturno'),(46,17,'2019-03-26 11:33:10',3,25,1,0,NULL,'Checklist Operacional.'),(47,17,'2019-03-26 11:34:24',3,25,1,0,NULL,'Checklist Sistêmico '),(48,17,'2019-03-26 14:37:50',2,25,1,0,NULL,'Checklist'),(49,9,'2019-03-26 14:50:04',3,100,1,0,NULL,'Modulo de Leitura de dados Beholder.'),(50,17,'2019-03-27 07:50:03',4,25,1,0,NULL,'Chekclist Sistema Winover dia 27/03'),(51,17,'2019-03-27 11:31:06',2,25,1,0,NULL,'check list matutino'),(52,17,'2019-03-27 11:32:39',1,25,1,0,NULL,'check list noturno - 26/03/2019'),(53,17,'2019-03-27 11:52:01',3,25,1,0,NULL,'Checklist Telecobrança.'),(54,12,'2019-03-27 14:24:02',1,80,80,0,NULL,'Solicitação por email do Fernando. 80 canais Vonex_sip para BV'),(55,17,'2019-03-28 09:20:01',3,25,1,0,NULL,'Checklist Telecobrança.'),(56,17,'2019-03-28 09:20:22',3,25,1,0,NULL,'Checklist Sistêmico.'),(57,8,'2019-03-28 10:34:18',2,50,1,0,NULL,'Formatar maquina Vinicius'),(58,9,'2019-03-28 10:36:37',2,100,1,0,NULL,'Desenvolvimento de Batch para encerrar processos'),(59,12,'2019-03-28 12:14:50',4,64,64,0,NULL,'Rodizio Manual dos Chips Khomp CLARO'),(60,9,'2019-03-28 16:16:18',3,100,1,0,NULL,'Modulo de integração com o banco do login/logout - Cheklist'),(61,14,'2019-03-28 16:41:19',3,50,1,8526,NULL,'Olos: ECS indisponíveis'),(62,9,'2019-03-29 17:43:42',3,100,1,0,NULL,'Atualização do Modulo de Leitura de dados Beholder.'),(63,17,'2019-03-30 08:29:32',4,25,1,0,NULL,'Chekclist Sistema Winover dia 30/03'),(64,16,'2019-03-30 08:29:53',4,250,1,0,NULL,'Chekclist PA´s Winover dia 30/03'),(65,13,'2019-03-30 08:36:10',4,100,1,0,NULL,'Criação da LCR para nova campanha VERDECARD '),(66,17,'2019-03-30 10:32:24',2,25,1,0,NULL,'Checklist noturno'),(67,8,'2019-03-30 10:32:43',2,150,3,0,NULL,'Conserto de CPUs'),(68,17,'2019-04-01 11:51:22',2,25,1,0,NULL,'Checklist'),(69,14,'2019-04-01 12:25:59',3,50,1,47178,NULL,'Chamado Lentidão intersic Claro'),(70,17,'2019-04-02 07:57:53',3,25,1,0,NULL,'Checklist Sistêmico ');
/*!40000 ALTER TABLE `task_feita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `adm` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'joao.uchiashi','123','Jogador'),(2,'giovani.souza','123','Jogador'),(3,'paulo.aquino','123','Jogador'),(4,'fabio.santos','123','Jogador'),(5,'douglas.dias','123','Jogador');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zumbis_aux`
--

DROP TABLE IF EXISTS `zumbis_aux`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zumbis_aux` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_zumbis` int(11) DEFAULT NULL,
  `id_player` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zumbis_aux`
--

LOCK TABLES `zumbis_aux` WRITE;
/*!40000 ALTER TABLE `zumbis_aux` DISABLE KEYS */;
INSERT INTO `zumbis_aux` VALUES (1,0,1),(2,0,2),(3,0,3),(4,0,4),(5,1,5);
/*!40000 ALTER TABLE `zumbis_aux` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-05  8:52:18
