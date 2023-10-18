-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 18-Out-2023 às 00:49
-- Versão do servidor: 8.0.31
-- versão do PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `base9.0`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
CREATE TABLE IF NOT EXISTS `funcionario` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `data_admissao` date NOT NULL,
  `em_ferias` tinyint(1) NOT NULL DEFAULT '0',
  `id_setor` bigint UNSIGNED NOT NULL,
  `administrador` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `id_setor` (`id_setor`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`id`, `nome`, `email`, `senha`, `data_admissao`, `em_ferias`, `id_setor`, `administrador`) VALUES
(29, 'Ricardo Silva', 'admin@gmail.com', '9fcc61c4395f16cdf30a8620e027fe94', '2019-01-12', 0, 5, 1),
(38, 'Felipe Silveira', 'felipe@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '2023-08-15', 0, 1, 0),
(40, 'Guilherme Felix', 'guilherme@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '2023-08-15', 0, 4, 0),
(41, 'Luis Fernando Pelek', 'luis@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '2023-07-18', 0, 2, 0),
(42, 'João Victor Szczypior', 'joaovitor@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '2023-07-18', 0, 3, 0),
(44, 'Fernanda Ribas', 'fernanda@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '2017-04-12', 0, 1, 0),
(45, 'Robson Oliveira', 'robson@hotmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '2023-09-06', 0, 3, 0),
(46, 'Tiago Santos', 'tiago@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '2023-08-23', 0, 3, 0),
(55, 'Eduardo Sobutka', 'eduardo@gmail.com', 'a821dddacc138ecdc605c199c796c1f8', '2015-05-24', 0, 6, 0),
(56, 'Isabela Ianisky', 'isabela@hotmail.com', '8789c239de4ba990308a6de46734fcc5', '2020-12-04', 0, 6, 0),
(57, 'Maria Vitória Oliveira', 'maria.goncalves.oliveira21@gmail.com', '7b8ec4f8e892d7deaf7c14991e7da1b7', '2021-06-14', 0, 3, 0),
(58, 'Maurício Skraba', 'mauricio@gmail.com', 'f4ec7709f2d2930ad026712872f39626', '2010-04-23', 0, 3, 0),
(59, 'Airton Gabriel', 'airton@hotmail.com', '0a0a9494c95ad6eaa8f8ddd8711a34fe', '2011-10-25', 0, 6, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `setor`
--

DROP TABLE IF EXISTS `setor`;
CREATE TABLE IF NOT EXISTS `setor` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `setor`
--

INSERT INTO `setor` (`id`, `nome`) VALUES
(6, 'Comercial'),
(5, 'Desenvolvimento'),
(3, 'Infraestrutura'),
(1, 'Marketing'),
(4, 'RH'),
(2, 'Suporte');

-- --------------------------------------------------------

--
-- Estrutura da tabela `solicitacao`
--

DROP TABLE IF EXISTS `solicitacao`;
CREATE TABLE IF NOT EXISTS `solicitacao` (
  `event_id` int NOT NULL AUTO_INCREMENT,
  `ferias_inicio` date DEFAULT NULL,
  `ferias_final` date DEFAULT NULL,
  `analisada` tinyint(1) NOT NULL DEFAULT '0',
  `aprovada` tinyint(1) NOT NULL DEFAULT '0',
  `id_funcionario` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`event_id`),
  KEY `id_funcionario` (`id_funcionario`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `solicitacao`
--

INSERT INTO `solicitacao` (`event_id`, `ferias_inicio`, `ferias_final`, `analisada`, `aprovada`, `id_funcionario`) VALUES
(33, '2023-09-03', '2023-09-21', 1, 1, 29),
(34, '2023-10-08', '2023-10-26', 1, 0, 41),
(36, '2023-11-05', '2023-11-30', 1, 1, 41),
(37, '2023-12-11', '2023-12-21', 1, 0, 41),
(39, '2023-09-05', '2023-09-15', 1, 1, 45),
(40, '2023-09-07', '2023-09-12', 1, 1, 46),
(41, '2023-09-04', '2023-09-20', 1, 0, 41),
(42, '2023-09-03', '2023-09-15', 1, 0, 41),
(43, '2023-10-08', '2023-10-26', 1, 0, 38),
(46, '2023-10-01', '2023-11-02', 1, 1, 29),
(47, '2023-11-02', '2023-12-03', 1, 0, 29),
(49, '2023-10-01', '2023-11-02', 1, 0, 29),
(50, '2023-10-02', '2023-10-12', 0, 0, 38),
(51, '2023-11-30', '2023-12-21', 0, 0, 40),
(52, '2023-10-03', '2023-11-04', 0, 0, 41),
(53, '2023-11-30', '2023-12-14', 0, 0, 42),
(54, '2023-09-06', '2023-09-30', 0, 0, 44),
(55, '2023-12-20', '2024-01-04', 0, 0, 45);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `view_ferias_do_setor`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `view_ferias_do_setor`;
CREATE TABLE IF NOT EXISTS `view_ferias_do_setor` (
`event_id` int
,`ferias_inicio` date
,`ferias_final` date
,`nome_funcionario` varchar(255)
,`nome_setor` varchar(255)
,`id_setor` bigint unsigned
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `view_funcionario_setor`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `view_funcionario_setor`;
CREATE TABLE IF NOT EXISTS `view_funcionario_setor` (
`id_funcionario` bigint unsigned
,`nome_funcionario` varchar(255)
,`nome_setor` varchar(255)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `view_solicitacoes_pendentes`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `view_solicitacoes_pendentes`;
CREATE TABLE IF NOT EXISTS `view_solicitacoes_pendentes` (
`event_id` int
,`nome_funcionario` varchar(255)
,`nome_setor` varchar(255)
,`ferias_inicio` date
,`ferias_final` date
);

-- --------------------------------------------------------

--
-- Estrutura para vista `view_ferias_do_setor`
--
DROP TABLE IF EXISTS `view_ferias_do_setor`;

DROP VIEW IF EXISTS `view_ferias_do_setor`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_ferias_do_setor`  AS SELECT `solicitacao`.`event_id` AS `event_id`, `solicitacao`.`ferias_inicio` AS `ferias_inicio`, `solicitacao`.`ferias_final` AS `ferias_final`, `funcionario`.`nome` AS `nome_funcionario`, `setor`.`nome` AS `nome_setor`, `funcionario`.`id_setor` AS `id_setor` FROM ((`solicitacao` join `funcionario` on((`solicitacao`.`id_funcionario` = `funcionario`.`id`))) join `setor` on((`funcionario`.`id_setor` = `setor`.`id`))) WHERE (`solicitacao`.`aprovada` = 1)  ;

-- --------------------------------------------------------

--
-- Estrutura para vista `view_funcionario_setor`
--
DROP TABLE IF EXISTS `view_funcionario_setor`;

DROP VIEW IF EXISTS `view_funcionario_setor`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_funcionario_setor`  AS SELECT `funcionario`.`id` AS `id_funcionario`, `funcionario`.`nome` AS `nome_funcionario`, `setor`.`nome` AS `nome_setor` FROM (`funcionario` join `setor` on((`funcionario`.`id_setor` = `setor`.`id`)))  ;

-- --------------------------------------------------------

--
-- Estrutura para vista `view_solicitacoes_pendentes`
--
DROP TABLE IF EXISTS `view_solicitacoes_pendentes`;

DROP VIEW IF EXISTS `view_solicitacoes_pendentes`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_solicitacoes_pendentes`  AS SELECT `solicitacao`.`event_id` AS `event_id`, `funcionario`.`nome` AS `nome_funcionario`, `setor`.`nome` AS `nome_setor`, `solicitacao`.`ferias_inicio` AS `ferias_inicio`, `solicitacao`.`ferias_final` AS `ferias_final` FROM ((`solicitacao` join `funcionario` on((`solicitacao`.`id_funcionario` = `funcionario`.`id`))) join `setor` on((`funcionario`.`id_setor` = `setor`.`id`))) WHERE (`solicitacao`.`analisada` = 0)  ;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `funcionario_c1` FOREIGN KEY (`id_setor`) REFERENCES `setor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `solicitacao`
--
ALTER TABLE `solicitacao`
  ADD CONSTRAINT `solicitacao_c1` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
