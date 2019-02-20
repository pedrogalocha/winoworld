-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: winoworld
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(45) DEFAULT NULL,
  `descricao` varchar(50) DEFAULT NULL,
  `id_habilidade` int(11) DEFAULT NULL,
  `avatar` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (1,'Otario','Nenhuma',NULL,NULL),(2,'Soldado','Pronto para batalha sempre.',1,'soldier.png'),(3,'Engenheiro','Aquele que mantem os equipamentos funcionando.',2,'enginer.png'),(4,'Cientista','Inovador, sempre buscando solução',3,'cientista.png'),(5,'Batedor','Aquele que fica atento e alerta a equipe',4,'batedor.png');
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classe_aux`
--

DROP TABLE IF EXISTS `classe_aux`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classe_aux` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_classe` int(11) DEFAULT NULL,
  `id_player` int(11) DEFAULT NULL,
  `level_up` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classe_aux`
--

LOCK TABLES `classe_aux` WRITE;
/*!40000 ALTER TABLE `classe_aux` DISABLE KEYS */;
INSERT INTO `classe_aux` VALUES (1,1,1,0),(2,2,1,0),(3,3,1,0);
/*!40000 ALTER TABLE `classe_aux` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conquistas`
--

DROP TABLE IF EXISTS `conquistas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conquistas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_con` varchar(45) NOT NULL,
  `xp` varchar(45) DEFAULT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `imagem` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conquistas`
--

LOCK TABLES `conquistas` WRITE;
/*!40000 ALTER TABLE `conquistas` DISABLE KEYS */;
INSERT INTO `conquistas` VALUES (1,'Iniciando a Caçada','20','Mate 100 Zumbis','pau-no-gato.png'),(2,'Finisher','50','Finalize uma tarefa dentro do prazo','finisher.png');
/*!40000 ALTER TABLE `conquistas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conquistas_feitas`
--

DROP TABLE IF EXISTS `conquistas_feitas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conquistas_feitas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jogador_id` int(11) NOT NULL,
  `conquista_id` int(11) NOT NULL,
  `data` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conquistas_feitas`
--

LOCK TABLES `conquistas_feitas` WRITE;
/*!40000 ALTER TABLE `conquistas_feitas` DISABLE KEYS */;
INSERT INTO `conquistas_feitas` VALUES (1,1,1,'2019-02-13 00:00:00'),(2,1,2,'2019-02-13 00:00:00');
/*!40000 ALTER TABLE `conquistas_feitas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habilidades`
--

DROP TABLE IF EXISTS `habilidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `habilidades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `desc` varchar(250) DEFAULT NULL,
  `efeito` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habilidades`
--

LOCK TABLES `habilidades` WRITE;
/*!40000 ALTER TABLE `habilidades` DISABLE KEYS */;
INSERT INTO `habilidades` VALUES (1,'Tank Nato','Devido a sempre estar em combates, cria grande resistência e recebe +10 de HP',NULL),(2,'El Matador','Especializado em eliminar zumbis, ele consegue facilmente fazer a limpa na área,recebendo +1 Para Cada Chamado feito',NULL),(3,'Missão dada é missão cumprida','-2 Min em cada chamado feito.',NULL),(4,'Tank Nato Aprimorado','+10 de HP / Redução de Dano 2',NULL),(5,'Maestria em tipo de chamado ','quando é escolhido a maestria em um tipo de chamado, você ganha +2 naquele tipo de chamado.',NULL),(6,'Mecânico de campo','+50 para cada conserto de periférico.',NULL),(7,'Controlador','+500 para cada levantamento e revisão de estoque no inventário. ',NULL),(8,'Engenheiro da Computação','+25 para cada máquina consertada',NULL),(9,'Mecânico de campo aprimorado','+25 para cada conserto de periférico / +20 caso o equipamento foi retirado no mesmo dia.',NULL),(10,'Engenheiro da Computação Aprimorado','+25 para cada conserto de máquina / +25 Caso a máquina volte  no mesmo dia para PA.',NULL);
/*!40000 ALTER TABLE `habilidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habilidades_kit`
--

DROP TABLE IF EXISTS `habilidades_kit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `habilidades_kit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hab1` int(11) DEFAULT NULL,
  `hab2` int(11) DEFAULT NULL,
  `hab3` int(11) DEFAULT NULL,
  `hab4` int(11) DEFAULT NULL,
  `hab5` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habilidades_kit`
--

LOCK TABLES `habilidades_kit` WRITE;
/*!40000 ALTER TABLE `habilidades_kit` DISABLE KEYS */;
INSERT INTO `habilidades_kit` VALUES (1,1,2,3,4,5),(2,6,7,8,9,10);
/*!40000 ALTER TABLE `habilidades_kit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `level`
--

DROP TABLE IF EXISTS `level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `level` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `level` int(11) DEFAULT NULL,
  `requisitos` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level`
--

LOCK TABLES `level` WRITE;
/*!40000 ALTER TABLE `level` DISABLE KEYS */;
INSERT INTO `level` VALUES (1,0,0),(2,1,3000);
/*!40000 ALTER TABLE `level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `class_id` int(11) NOT NULL,
  `hp` int(11) DEFAULT NULL,
  `abilities` varchar(200) DEFAULT NULL,
  `patent` varchar(20) DEFAULT NULL,
  `level_id` int(11) DEFAULT NULL,
  `xp` int(11) DEFAULT NULL,
  `users_id` int(11) NOT NULL,
  `avatar` varchar(45) DEFAULT NULL,
  `glpi_id` int(11) DEFAULT NULL,
  `zumbis_mortos` int(11) DEFAULT NULL,
  `tma` time(4) DEFAULT NULL,
  `liberado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (1,'Joao Uchiashi',2,50,NULL,NULL,1,223,2,'sob_3.png',968,121,'00:20:28.0000',1);
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_task` varchar(100) NOT NULL,
  `xp` double NOT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `descricao_task` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,'Eliminar Zumbi',1,'Chamados','Atender chamado é o principio do suporte, existem inúmeros, cada chamado feito corresponde a 1 ponto.'),(2,'Manutenção de equipamento',50,'Conserto Perifericos','Consertar um periferico poupa dinheiro para empresa.'),(3,'Tempo de missão diaria',50,'SLA-20','Manter o SLA abaixo de 20 minutos diario, significa um bom tempo de atendimento.'),(4,'Pensar e criar formas melhores de derrotar os zumbis',100,'Inovação','Solucionar um problema operacional ou de staff, melhora desempenho da empresa em um todo.'),(5,'Atualizar registro de missões e sobre as criaturas',50,'Base de Conhecimento','Manter atualizado a base de conhecimento faz com que toda equipe tenha acesso informações importantes para prosseguir com um atendimento.'),(6,'Movimentar os equipamentos entre lugares.',25,'Movimentação de equipamentos','Movimentar equipamentos não é uma tarefa muito legal, porém aquele que o faz ajuda manter a empresa de acordo com seu alinhamento estrategico.'),(7,'Alterar os canais de comunicação da equipe',0.5,'Movimentação de Canais','Movimentar rotas mantem a organização e bom custo do Telecom.'),(8,'Modificações na torre de rádio.',100,'Ações Telecom','Implantação de Rotas, Servidores'),(9,'Patrulhas e alertas sobre possiveis ataques.',50,'Monitoria de problemas','Identificar problemas sistemicos ou de infra e trata-los (Incluso Abertura de chamado GSE)'),(10,'Atualizar registros sobre o que temos em estoque.',50,'Atualizar Controles','Atualizar qualquer controle que tenha sido alterado'),(11,'Rotinas dentro da base.',250,'Procedimentos TI','Limpeza do TI, CPD, arquivo,etc..'),(12,'Reconhecimento de campo proximo a base.',25,'Checklist','Ronda das PA\'s, Transbordo, OCS, diario');
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_feita`
--

DROP TABLE IF EXISTS `task_feita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_feita` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) DEFAULT NULL,
  `data_conclusao` datetime DEFAULT NULL,
  `player_id` int(11) DEFAULT NULL,
  `xp_total` varchar(45) DEFAULT NULL,
  `quantidade` varchar(45) DEFAULT NULL,
  `n_chamado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_feita`
--

LOCK TABLES `task_feita` WRITE;
/*!40000 ALTER TABLE `task_feita` DISABLE KEYS */;
INSERT INTO `task_feita` VALUES (1,1,'2019-02-13 00:00:00',1,'50','50','4650'),(22,1,'2019-02-13 00:00:00',1,'2','2',NULL),(23,2,'2019-02-13 00:00:00',1,'50','2','5231');
/*!40000 ALTER TABLE `task_feita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `adm` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'pedro.galocha','631542aQ1','Administrador'),(2,'joao.uchiashi','123','Jogador');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-20 16:20:42
