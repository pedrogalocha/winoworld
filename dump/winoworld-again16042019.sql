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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (1,'Noob','Fraco, um ninguém','sob_1.jpg',NULL),(2,'Soldado','Sempre alerta no ataque as criaturas.','soldier.png',1),(3,'Engenheiro ','Responsável por manutenção dos suprimentos','eng.png',2),(4,'Cientista','Novas pesquisas e inovação.','cientista.png',3),(5,'Batedor','Monitoria e comunicação','finisher.png',4);
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
  `efeito` varchar(95) DEFAULT NULL,
  `nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habilidades`
--

LOCK TABLES `habilidades` WRITE;
/*!40000 ALTER TABLE `habilidades` DISABLE KEYS */;
INSERT INTO `habilidades` VALUES (1,'Tank Nato','+10 de HP','Level 1: Tank Nato'),(2,'El Matador','+2 para cada chamado feito.','Level 2: El Matador'),(3,'Missao Dada e Missao Cumprida','-2 min em cada chamado.','Level 3: Missao Dada e Missao Cumprida'),(4,'Tank Nato Aprimorado','+10 de HP','Level 4: Tank Nato Aprimorado'),(5,'Maestria em chamado','+1 para cada chamado feito.','Level 5: Maestria em chamado'),(6,'Mecanico de Campo','+50 para conserto.','Level 1: Mecanico de Campo'),(7,'Barreira','-6 de Dano tomado.','Level 2: Barreira'),(8,'Engenharia','+10 de vida.','Level 3: Engenharia'),(9,'Mecanico Aprimorado ','+50 para conserto.','Level 4: Mecanico Aprimorado '),(10,'Barricada avançada','-10 em dano recebido.','Levle 5: Barricada avançada'),(13,'Eureka','+100 Pontos por modulo desenvolvido/atualizado','Levle 1: Eureka'),(14,'Documentado','+100 para cada modulo e sistema documentado.','Level 2: Documentado'),(15,'Esta na Hora','+200 para cada modulo entregue no prazo.','Level 3: Esta na Hora'),(16,'Eureka +','+100 pontos por modulo.','Level 4: Eureka +'),(17,'Documentado +','+100 por modulo documentado.','Level 5: Documentado +'),(18,'Encontrai','+50 Para problema relatado e tratado com fornecedor (GSE)','Level 1: Encontrai'),(19,'Cambio Desligo','+100 para cada ação Telecom','Level 2: Cambio Desligo'),(20,'Validando Comunicações','+50 por custo telecom.','Level 3: Validando Comunicações'),(21,'Comunicação','+1 para cada canal movimentado.','Level 4: Comunicação'),(22,'Econtrei +','+50 Para problema relatado e tratado com fornecedor (GSE)','Level 5: Econtrei +');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habilidades_kit`
--

LOCK TABLES `habilidades_kit` WRITE;
/*!40000 ALTER TABLE `habilidades_kit` DISABLE KEYS */;
INSERT INTO `habilidades_kit` VALUES (1,1,2,3,4,5),(2,6,7,8,9,10),(3,13,14,15,16,17),(4,18,19,20,21,22);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level`
--

LOCK TABLES `level` WRITE;
/*!40000 ALTER TABLE `level` DISABLE KEYS */;
INSERT INTO `level` VALUES (1,0,NULL),(2,1,'3000'),(3,2,'7000'),(4,3,'12000'),(5,4,'18000'),(6,5,'26000');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (1,'João Uchiashi','5',38,60,'finisher.png',4702,0,0,1,2,968,200,'00:15:34',2960),(2,'Giovani Di Nolla','3',10,60,'eng.png',4820,0,0,2,2,945,303,'00:26:06',3123),(3,'Paulo Aquino','4',14,60,'cientista.png',4315,0,0,3,2,972,88,'00:28:30',1588),(4,'Fabio Santos','5',38,60,'finisher.png',4814,0,0,4,2,63,27,'00:18:58',2342),(5,'Teste User','4',70,70,'sob_1.png',1139,0,0,5,2,47,21,'00:23:48',1121);
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
  `desc` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (8,'Manutenção de equipamento',50,'Consertar um periférico poupa dinheiro para empresa.'),(9,'Pensar e criar formas melhores de derrotar os zumbis',100,'Solucionar um problema operacional ou de staff, melhora desempenho da empresa em um todo.'),(10,'Atualizar registro de missões e sobre as criaturas',50,'Manter atualizado a base de conhecimento faz com que toda equipe tenha acesso informações importantes para prosseguir com um atendimento.'),(11,'Movimentar os equipamentos entre lugares.',25,'Movimentar equipamentos não é uma tarefa muito legal, porém aquele que o faz ajuda manter a empresa de acordo com seu alinhamento estratégico.'),(12,'Alterar os canais de comunicação da equipe',1,'Movimentar rotas mantem a organização e bom custo do Telecom.'),(13,'Modificações na torre de rádio.',100,'Implantação de Rotas, Servidores'),(14,'Patrulhas e alertas sobre possíveis ataques.',50,'Identificar problemas sistemicos ou de infra e trata-los (Incluso Abertura de chamado GSE)'),(15,'Atualizar registros sobre o que temos em estoque.',10,'Atualizar qualquer controle que tenha sido alterado'),(16,'Rotinas dentro da base.',50,'Limpeza do TI, CPD, arquivo, etc..'),(17,'Reconhecimento de campo proximo a base.',25,'Ronda das PA\'s, Transbordo, OCS, diário.'),(18,'SLA Semanal',100,'SLA ABAIXO DOS 20 na semana.');
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
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_feita`
--

LOCK TABLES `task_feita` WRITE;
/*!40000 ALTER TABLE `task_feita` DISABLE KEYS */;
INSERT INTO `task_feita` VALUES (1,9,'2019-03-06 16:20:02',4,400,4,0,NULL,NULL),(2,9,'2019-03-06 16:20:19',1,400,4,0,NULL,NULL),(3,9,'2019-03-06 16:20:39',2,200,2,0,NULL,NULL),(4,9,'2019-03-06 16:21:23',3,200,2,0,NULL,''),(5,9,'2019-03-06 16:21:50',3,100,1,0,NULL,''),(6,8,'2019-03-07 08:28:16',0,100,2,19084,5,NULL),(7,8,'2019-03-07 09:56:58',2,300,6,0,NULL,NULL),(8,8,'2019-03-07 09:57:15',3,50,1,0,NULL,NULL),(9,8,'2019-03-07 09:57:32',0,300,6,0,5,NULL),(10,13,'2019-03-07 11:59:38',1,100,1,0,NULL,NULL),(11,9,'2019-03-11 17:00:50',3,600,6,0,NULL,NULL),(12,13,'2019-03-13 11:11:34',4,400,4,0,NULL,NULL),(13,9,'2019-03-13 11:12:21',4,100,1,0,NULL,NULL),(14,9,'2019-03-13 11:12:24',3,100,1,0,NULL,NULL),(15,9,'2019-03-14 09:14:00',3,100,1,0,NULL,'Atualização Site Wocc'),(16,12,'2019-03-15 14:55:44',1,150,150,0,NULL,NULL),(17,8,'2019-03-15 14:55:59',2,100,2,0,NULL,NULL),(18,12,'2019-03-15 14:56:20',1,100,100,0,NULL,NULL),(19,12,'2019-03-15 14:56:57',4,100,100,0,NULL,NULL),(20,12,'2019-03-19 09:40:00',4,1,1,0,NULL,NULL),(21,12,'2019-03-19 09:41:11',4,159,159,0,NULL,NULL),(22,8,'2019-03-19 09:43:46',2,150,3,0,NULL,NULL),(23,8,'2019-03-19 13:19:20',2,200,4,0,NULL,NULL),(24,9,'2019-03-19 16:25:18',3,200,2,0,NULL,'Cadastro Turno/ Validar Checklist - Sistema Checklist'),(25,13,'2019-03-19 16:55:37',4,200,2,0,NULL,NULL),(26,17,'2019-03-20 09:37:26',2,25,1,0,NULL,NULL),(27,17,'2019-03-20 09:37:39',3,25,1,0,NULL,'Checklist feito hoje'),(28,9,'2019-03-20 10:17:44',3,100,1,0,NULL,'Front End - Beholder 1.0 - Visão TI Checklist.'),(29,12,'2019-03-20 16:24:13',1,30,30,0,NULL,'Retirado canais CTZ '),(31,12,'2019-03-20 16:30:08',4,366,366,0,NULL,'Mudança da rota ctz para bv_telecom, pois a rota ctz esta com problema de caixa postal'),(33,9,'2019-03-22 12:55:42',3,500,5,0,NULL,'Criação de sistema de votação da CIPA com criptografia para não identificar voto.'),(34,12,'2019-03-22 13:08:37',1,266,266,0,NULL,'Devolvendo canais CTZ - Rota normalizada'),(35,17,'2019-03-25 09:25:10',3,25,1,0,NULL,'Checklist Telecobrança.'),(36,17,'2019-03-25 11:23:51',4,25,1,0,NULL,'Chekclist Sistema Winover dia 23/0'),(37,13,'2019-03-25 11:26:03',4,100,1,0,NULL,'Cabeamento Chipera Claro  '),(38,17,'2019-03-25 11:28:54',4,25,1,0,NULL,'Organização Arquivo TI - dia 20/03'),(39,11,'2019-03-25 11:34:53',3,25,1,0,NULL,'Organização de equipamentos do T.I'),(40,9,'2019-03-25 14:25:42',3,100,1,0,NULL,'Login Checklist '),(41,12,'2019-03-25 17:18:34',4,10,10,0,NULL,'configuração com 10 Canais Claro_gsm_chipera '),(42,13,'2019-03-25 17:20:09',4,100,1,0,NULL,'Rodizio Manual dos Chips Khomp 58810 '),(43,11,'2019-03-25 20:48:45',1,25,1,0,NULL,'ORGANIZAÇÃO SALA TI'),(44,9,'2019-03-25 20:49:28',1,100,1,0,NULL,'check list matutino'),(45,9,'2019-03-25 20:49:49',1,100,1,0,NULL,'Check List Noturno'),(46,17,'2019-03-26 11:33:10',3,25,1,0,NULL,'Checklist Operacional.'),(47,17,'2019-03-26 11:34:24',3,25,1,0,NULL,'Checklist Sistêmico '),(48,17,'2019-03-26 14:37:50',2,25,1,0,NULL,'Checklist'),(49,9,'2019-03-26 14:50:04',3,100,1,0,NULL,'Modulo de Leitura de dados Beholder.'),(50,17,'2019-03-27 07:50:03',4,25,1,0,NULL,'Chekclist Sistema Winover dia 27/03'),(51,17,'2019-03-27 11:31:06',2,25,1,0,NULL,'check list matutino'),(52,17,'2019-03-27 11:32:39',1,25,1,0,NULL,'check list noturno - 26/03/2019'),(53,17,'2019-03-27 11:52:01',3,25,1,0,NULL,'Checklist Telecobrança.'),(54,12,'2019-03-27 14:24:02',1,80,80,0,NULL,'Solicitação por email do Fernando. 80 canais Vonex_sip para BV'),(55,17,'2019-03-28 09:20:01',3,25,1,0,NULL,'Checklist Telecobrança.'),(56,17,'2019-03-28 09:20:22',3,25,1,0,NULL,'Checklist Sistêmico.'),(57,8,'2019-03-28 10:34:18',2,50,1,0,NULL,'Formatar maquina Vinicius'),(58,9,'2019-03-28 10:36:37',2,100,1,0,NULL,'Desenvolvimento de Batch para encerrar processos'),(59,12,'2019-03-28 12:14:50',4,64,64,0,NULL,'Rodizio Manual dos Chips Khomp CLARO'),(60,9,'2019-03-28 16:16:18',3,100,1,0,NULL,'Modulo de integração com o banco do login/logout - Cheklist'),(61,14,'2019-03-28 16:41:19',3,50,1,8526,NULL,'Olos: ECS indisponíveis'),(62,9,'2019-03-29 17:43:42',3,100,1,0,NULL,'Atualização do Modulo de Leitura de dados Beholder.'),(63,17,'2019-03-30 08:29:32',4,25,1,0,NULL,'Chekclist Sistema Winover dia 30/03'),(64,16,'2019-03-30 08:29:53',4,250,1,0,NULL,'Chekclist PA´s Winover dia 30/03'),(65,13,'2019-03-30 08:36:10',4,100,1,0,NULL,'Criação da LCR para nova campanha VERDECARD '),(66,17,'2019-03-30 10:32:24',2,25,1,0,NULL,'Checklist noturno'),(67,8,'2019-03-30 10:32:43',2,150,3,0,NULL,'Conserto de CPUs'),(68,17,'2019-04-01 11:51:22',2,25,1,0,NULL,'Checklist'),(69,14,'2019-04-01 12:25:59',3,50,1,47178,NULL,'Chamado Lentidão intersic Claro'),(70,17,'2019-04-02 07:57:53',3,25,1,0,NULL,'Checklist Sistêmico '),(71,9,'2019-04-08 10:26:17',4,200,2,0,NULL,'VPN Olos e Winover'),(72,17,'2019-04-08 10:27:00',4,25,1,0,NULL,'Chekclist Sistema Winover dia 06/04'),(73,17,'2019-04-08 10:27:19',4,25,1,0,NULL,'Chekclist Sistema Winover dia 08/04'),(74,8,'2019-04-08 14:41:59',5,50,1,123,NULL,'aes'),(75,9,'2019-04-08 14:42:53',5,100,1,12,NULL,'Teste'),(76,9,'2019-04-08 14:43:41',5,100,1,123,NULL,'TEste2'),(77,9,'2019-04-08 14:44:29',5,100,1,123,NULL,'testee'),(78,9,'2019-04-08 14:45:07',5,100,1,123,NULL,'teste'),(79,9,'2019-04-08 14:45:22',5,200,2,123,NULL,'teste'),(80,9,'2019-04-08 14:46:06',5,100,1,123,NULL,'tese'),(81,9,'2019-04-08 14:46:33',5,200,1,123,NULL,'testee'),(82,8,'2019-04-08 15:46:28',2,100,2,0,NULL,'Consertos de CPUs Bruna SUP e Bruna PLAN. '),(83,16,'2019-04-08 15:48:52',2,50,1,0,NULL,'Limpeza sábado'),(84,14,'2019-04-08 15:49:42',2,50,1,48069,NULL,'Chamado de lentidão e intermitência Intersic Claro e Net'),(85,16,'2019-04-08 15:51:00',2,50,1,8598875,NULL,'Chamado de Problemas na aba FINANCEIRO do NETSMS'),(86,9,'2019-04-08 15:51:50',4,100,1,1968,NULL,'Verificação e validação dos SW da Winover'),(87,9,'2019-04-09 07:22:05',3,100,1,0,NULL,'Modulo completo do checklist Operador'),(88,17,'2019-04-09 07:42:36',3,25,1,0,NULL,'Checklist Telecobrança.'),(89,17,'2019-04-09 07:43:14',3,25,1,0,NULL,'Checklist Operação'),(90,14,'2019-04-09 07:58:04',5,100,1,123,NULL,'teste'),(91,14,'2019-04-09 07:58:31',5,50,1,123,NULL,'teste'),(92,13,'2019-04-09 08:54:51',4,100,1,0,NULL,'Rodizio Manual dos Chips Khomp CLARO'),(93,14,'2019-04-09 14:01:03',3,50,1,48254,NULL,'Erro ao gerar mailling Intersic Claro.'),(94,8,'2019-04-09 14:34:41',1,100,2,110818,NULL,'consertado maquinas 154 e 260 no dia 03/04'),(95,14,'2019-04-09 14:51:20',1,50,1,8601584,NULL,'chamado no NETSMS, erro ao enviar email'),(96,14,'2019-04-09 14:53:32',1,50,1,48325,NULL,'aberto chamado 48325  na MFM para duvidas do planejamento para implantação de um sistema novo'),(97,14,'2019-04-09 16:32:21',4,150,3,0,NULL,'Cabeamento novo LINK CLARO e MK pro SW CORE e Embratel para talkeen'),(98,11,'2019-04-09 16:36:39',4,25,1,9147,NULL,'Alteração nome de rota das Khomp´s'),(99,17,'2019-04-09 17:19:44',1,25,1,0,NULL,'Correção maquinas duplicadas OCS'),(100,17,'2019-04-09 20:23:17',1,25,1,0,NULL,'transbordo fechado'),(101,17,'2019-04-09 21:00:08',1,25,1,0,NULL,'CHECK LIST NOTURNO - 09/04/2019'),(102,14,'2019-04-10 11:24:26',2,50,1,8606648,NULL,'Queda Geral no NetSMS'),(103,8,'2019-04-10 11:24:40',2,100,2,0,NULL,'Conserto de CPUs'),(104,8,'2019-04-10 11:32:03',3,100,2,0,NULL,'Troca fonte Bruna Sup, Limpeza maquina 0252.'),(105,14,'2019-04-10 12:24:59',2,50,1,48441,NULL,'Lentidão do intersic'),(106,8,'2019-04-10 13:35:53',1,50,1,0,NULL,'Verificado e arrumado equipamento PA0004, com muito travamento e problemas com pausas no login logout'),(107,9,'2019-04-10 13:37:38',3,200,1,0,NULL,'Modulo de pesquisa Beholder'),(108,14,'2019-04-10 13:41:38',1,50,1,112442,NULL,'IMPLANTAÇÃO PROJETO VERDCARD, ABERTO CHAMADO IP3. chamado no GSE'),(109,9,'2019-04-10 13:43:41',3,200,1,0,NULL,'Modulo de validação checklist Operador'),(110,14,'2019-04-10 15:15:54',1,100,2,48469,NULL,'ABERTO CHAMADO 48469  PARA MFM INTERSIC NET E CLARO INDISPONIVEL'),(111,17,'2019-04-10 15:16:47',1,25,1,0,NULL,'CHAT FECHADO 09/04/2019'),(112,9,'2019-04-10 15:18:59',1,100,1,0,NULL,'Implantação/atualização NEO - CREFISA - 09/04/2019'),(113,12,'2019-04-10 15:29:38',4,100,100,0,NULL,'Movimentação CTZ 100 canais '),(114,14,'2019-04-10 15:34:26',4,100,1,9130,NULL,'ECS08 Telecom Olos'),(115,16,'2019-04-10 15:40:48',1,150,3,0,NULL,'Movimentado cabos de rede no CPD'),(116,17,'2019-04-10 15:40:50',4,25,1,0,NULL,'Chekclist Sistema Winover dia 10/04'),(117,17,'2019-04-10 16:21:34',1,25,1,0,NULL,'Enviado Custo Telecom'),(119,17,'2019-04-10 20:23:33',1,25,1,0,NULL,'realizado transbordo noturno'),(120,17,'2019-04-10 20:48:45',1,25,1,0,NULL,'CHEK LIST NOTURNO - APENAS PA0252 SEM MONITOR'),(121,17,'2019-04-11 07:04:12',4,25,1,0,NULL,'Chekclist Sistema Winover dia 11/04'),(122,9,'2019-04-11 08:49:15',3,200,1,0,NULL,'Programa para deletar o usuário da maquina / regedit'),(123,17,'2019-04-11 10:55:15',4,25,1,0,NULL,'Custo Telecom 11/04'),(124,8,'2019-04-11 13:13:45',3,50,1,0,NULL,'Limpeza maquina 151'),(125,8,'2019-04-11 14:27:52',2,50,1,0,NULL,'Manutenção Headset'),(126,8,'2019-04-11 15:25:23',3,150,3,0,NULL,'Manutenção das .bats operação'),(127,8,'2019-04-11 15:53:54',2,50,1,0,NULL,'head'),(128,14,'2019-04-11 18:56:09',1,50,1,8614476,NULL,'Lentidão NETSMS. Aberto chamado na NET e no GSE'),(129,10,'2019-04-11 19:52:30',1,50,1,0,NULL,'ATUALIZADO CONTROLE DE TELECOM'),(130,17,'2019-04-11 20:22:52',1,25,1,0,NULL,'TRANSBORDO NOTURNO'),(131,17,'2019-04-11 20:51:55',1,25,1,0,NULL,'CHEK LIST NOTURNO - Não identificado equipamentos danificados'),(132,14,'2019-04-12 07:03:59',4,100,1,48652,NULL,'Jobs Interisc NET'),(133,17,'2019-04-12 07:04:14',4,25,1,0,NULL,'Chekclist Sistema Winover dia 12/04'),(134,14,'2019-04-12 09:11:21',4,100,1,1987,NULL,'Firewall MK e SW \"MEED\"'),(135,10,'2019-04-12 09:17:48',4,50,1,0,NULL,'Cabeamento para o novo SW '),(136,12,'2019-04-12 10:11:21',1,45,45,0,NULL,'Mudar canais Khomp, alterado status'),(137,17,'2019-04-12 10:19:55',4,25,1,0,NULL,'Custo Telecom 12/04'),(138,16,'2019-04-12 10:57:39',1,50,1,0,NULL,'arruma sala arquivo TI'),(139,14,'2019-04-12 11:09:47',4,100,1,190411004,NULL,'76 Telecom lan to lan fora '),(140,8,'2019-04-12 11:16:42',1,100,2,0,NULL,'Consertado 2 headset'),(141,16,'2019-04-12 11:23:50',4,50,1,0,NULL,'Organização Arquivo TI - dia 12/04'),(142,8,'2019-04-12 11:27:34',2,250,5,0,NULL,'Manutenção Headset'),(143,14,'2019-04-12 11:28:09',2,50,1,48676,NULL,'Lentidão e intermitência Intersic Claro'),(144,8,'2019-04-12 11:38:42',2,100,2,0,NULL,'Manutenção Headset'),(146,16,'2019-04-12 13:02:42',2,100,2,0,NULL,'Organização dos headsets'),(147,8,'2019-04-12 13:04:29',2,800,8,0,NULL,'8 Headsets recuperados'),(148,8,'2019-04-12 13:04:58',4,100,2,0,NULL,'Manutenção HEADSET dia 12/04'),(149,8,'2019-04-12 13:05:42',2,600,6,0,NULL,'6 Heads recuperados'),(150,8,'2019-04-12 13:06:35',1,200,4,0,NULL,'4 Heads recuperados'),(151,12,'2019-04-12 13:08:56',4,48,48,0,NULL,'Movimentação Khomp 11/04'),(152,12,'2019-04-12 13:09:19',4,48,48,0,NULL,'Movimentação Khomp 12/04'),(153,9,'2019-04-12 13:30:40',1,100,1,0,NULL,'SLA abaixo dos 20 - 01/05 à 06/05'),(154,14,'2019-04-12 14:28:27',1,100,1,0,NULL,'aberto chamado na meed 1989  para liberar o aplicativo para ativar o windows'),(155,12,'2019-04-12 16:03:47',1,300,300,0,NULL,'movimentação canais para CTZ. Solicitação Fernando'),(156,10,'2019-04-12 16:04:16',1,50,1,0,NULL,'ATUALIZADO CONTROLE DE TELECOM'),(157,17,'2019-04-12 17:55:19',1,25,1,0,NULL,'Aberto chamado 00009355 para criar nova rota AP_TELEFONIA'),(158,11,'2019-04-12 19:51:06',1,25,1,0,NULL,'Movimentado monitor Supervisor Crefisa para PA0111'),(159,17,'2019-04-12 20:24:35',1,25,1,0,NULL,'TRANSBORDO NOTURNO'),(160,12,'2019-04-12 20:26:13',1,45,45,0,NULL,'Mudar canais Khomp, alterado status'),(161,17,'2019-04-12 20:56:37',1,25,1,0,NULL,'Check List Noturno'),(162,17,'2019-04-13 07:43:05',4,25,1,0,NULL,'Chekclist Sistema Winover dia 13/04'),(163,17,'2019-04-13 07:43:34',4,25,1,0,NULL,'Custo Telecom 13/04'),(164,12,'2019-04-13 07:44:40',4,48,48,0,NULL,'Rodizio Manual dos Chips Khomp CLARO'),(165,14,'2019-04-13 09:15:03',4,100,1,9365,NULL,'Chamado na olos \"operador log\"'),(166,14,'2019-04-13 09:15:35',4,100,1,48795,NULL,'Chamado MFMTI INTERISC CLARO'),(167,8,'2019-04-13 13:35:59',1,100,2,0,NULL,'Conserto PA0117 e limpeza PA0009- Adicionado mais memoria na máquina'),(168,8,'2019-04-13 13:36:00',3,50,1,0,NULL,'Limpeza maquina 97'),(169,17,'2019-04-13 15:39:00',1,25,1,0,NULL,'intersic claro com lentidão. aberto chamado 48802 na MFM'),(170,8,'2019-04-13 15:55:31',3,50,1,0,NULL,'Limpeza maquina 9'),(171,9,'2019-04-13 16:36:50',3,200,1,0,NULL,'Documentação checklist'),(172,8,'2019-04-13 20:49:05',2,50,1,0,NULL,'CPU 99'),(173,17,'2019-04-13 20:51:07',2,50,2,0,NULL,'Transbordo e CHAT'),(174,17,'2019-04-15 07:42:00',4,25,1,0,NULL,'Chekclist Sistema Winover dia 15/04'),(175,12,'2019-04-15 07:42:30',4,48,48,0,NULL,'Rodizio Manual dos Chips Khomp CLARO'),(176,12,'2019-04-15 13:37:58',2,45,45,0,NULL,'Status Khomp sabado - 45 canais'),(177,14,'2019-04-15 14:18:59',4,100,1,1994,NULL,'Reservar Faixa de IP '),(178,12,'2019-04-15 15:09:55',1,75,75,0,NULL,'MOVIMENTADO 75 CANAIS PARA PONTAL SIP - TIRADO 25 DA BV E 50 DA CTZ'),(179,17,'2019-04-15 16:09:32',1,25,1,48912,NULL,'intersic claro com lentidão. aberto chamado  48912 na MFM'),(180,16,'2019-04-15 18:02:48',4,50,1,0,NULL,'Organização TI - dia 15/04'),(181,17,'2019-04-15 18:22:01',1,25,1,0,NULL,'previa de telecom'),(182,16,'2019-04-15 18:22:25',1,50,1,0,NULL,'ORGANIZAÇÃO SALA TI'),(183,11,'2019-04-15 20:22:58',1,50,2,0,NULL,'Movimentado maquinas do planejamento.'),(184,11,'2019-04-15 20:24:14',1,25,1,0,NULL,'movimentado maquina supervisora Bruna'),(185,17,'2019-04-15 20:25:01',1,25,1,0,NULL,'TRANSBORDO NOTURNO'),(186,12,'2019-04-15 20:45:21',1,45,45,0,NULL,'Mudar canais Khomp, alterado status'),(187,16,'2019-04-15 20:54:29',1,50,1,0,NULL,'Check List Noturno'),(188,14,'2019-04-16 10:04:57',2,50,1,48973,NULL,'Intersic NET lento'),(189,14,'2019-04-16 10:05:35',2,50,1,9423,NULL,'Olos problemas e extrema Lentidão'),(190,14,'2019-04-16 10:05:57',2,50,1,9421,NULL,'Import Files Fora'),(191,14,'2019-04-16 10:06:25',2,50,1,9416,NULL,'Lentidão Eaglle'),(192,12,'2019-04-16 10:08:41',4,48,48,0,NULL,'Rodizio Manual dos Chips Khomp CLARO'),(193,17,'2019-04-16 10:10:51',3,25,1,0,NULL,'Checklist Sistêmico '),(194,18,'2019-04-13 21:00:00',1,200,1,0,NULL,'SLA Abaixo dos 20 durante a semana com mais de 20 chamados na semana.'),(195,9,'2019-04-16 12:28:43',4,100,1,9355,NULL,'Criar/Configurar nova rota CTZ_BINA'),(196,14,'2019-04-16 12:43:42',4,100,1,9488,NULL,'Transferência Talkeen / Olos');
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
INSERT INTO `users` VALUES (1,'joao.uchiashi','123','Jogador'),(2,'giovani.souza','123','Jogador'),(3,'paulo.aquino','123','Jogador'),(4,'fabio.santos','123','Jogador'),(5,'teste.user','123','Jogador');
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
INSERT INTO `zumbis_aux` VALUES (1,1,1),(2,1,2),(3,0,3),(4,0,4),(5,0,5);
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

-- Dump completed on 2019-04-16 15:35:53
