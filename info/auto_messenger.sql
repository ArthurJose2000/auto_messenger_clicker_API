-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 01-Mar-2023 às 04:57
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `auto_messenger`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `marketing`
--

CREATE TABLE `marketing` (
  `id` int(11) NOT NULL,
  `affiliate_ad` varchar(255) NOT NULL,
  `affiliate_link` varchar(255) NOT NULL,
  `product_image` varchar(256) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `language` varchar(10) DEFAULT NULL,
  `country` varchar(10) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `marketing`
--

INSERT INTO `marketing` (`id`, `affiliate_ad`, `affiliate_link`, `product_image`, `keyword`, `language`, `country`, `is_active`, `created_at`) VALUES
(2, 'Tutorial', 'https://manualdosvideos.com.br/celular', 'tutorial.gif', 'teste', 'pt', 'BR', 1, '2023-02-18 14:21:00'),
(3, 'Anúncio de teste 2', 'https://manualdosvideos.com.br/celular', 'tutorial.gif', 'teste', 'pt', 'BR', 1, '2023-02-18 14:22:31'),
(4, 'Anúncio de teste 3', 'https://manualdosvideos.com.br/celular', 'tutorial.gif', 'teste', 'pt', 'BR', 1, '2023-02-18 14:23:48');

-- --------------------------------------------------------

--
-- Estrutura da tabela `track_marketing`
--

CREATE TABLE `track_marketing` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `marketing_id` int(11) NOT NULL,
  `behavior` int(11) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `track_marketing`
--

INSERT INTO `track_marketing` (`id`, `user_id`, `marketing_id`, `behavior`, `keyword`, `datetime`) VALUES
(41, 11, 4, 1, 'teste', '2023-02-18 22:27:34'),
(42, 11, 4, 2, 'teste', '2023-02-18 22:27:53'),
(43, 11, 3, 1, 'teste', '2023-02-18 22:28:09'),
(44, 11, 3, 2, 'teste', '2023-02-18 22:28:19'),
(45, 11, 4, 1, 'teste', '2023-02-18 22:32:48'),
(46, 11, 4, 1, 'teste', '2023-02-18 22:34:39'),
(47, 11, 4, 1, 'teste', '2023-02-18 22:36:47'),
(48, 11, 4, 1, 'teste', '2023-02-18 22:37:23'),
(49, 11, 3, 1, 'teste', '2023-02-18 22:46:26'),
(50, 11, 4, 1, 'teste', '2023-02-18 22:49:53'),
(51, 11, 3, 1, 'teste', '2023-02-18 22:50:08'),
(52, 11, 3, 1, 'teste', '2023-02-18 22:52:20'),
(53, 11, 2, 1, 'teste', '2023-02-18 22:52:33'),
(54, 11, 3, 1, 'teste', '2023-02-18 22:52:56'),
(55, 11, 4, 1, 'teste', '2023-02-18 22:53:05'),
(56, 11, 2, 1, 'teste', '2023-02-18 23:08:14'),
(57, 11, 2, 2, 'teste', '2023-02-18 23:08:45'),
(58, 11, 2, 1, 'teste', '2023-02-18 23:10:07'),
(59, 11, 2, 2, 'teste', '2023-02-18 23:10:22'),
(60, 11, 2, 1, 'teste', '2023-02-18 23:29:17'),
(61, 11, 3, 1, 'teste', '2023-02-18 23:31:21'),
(62, 11, 4, 1, 'teste', '2023-02-18 23:31:37'),
(63, 11, 4, 1, 'teste', '2023-02-18 23:32:39'),
(64, 11, 3, 1, 'teste', '2023-02-18 23:33:42'),
(65, 11, 3, 1, 'teste', '2023-02-18 23:34:49'),
(66, 11, 2, 1, 'teste', '2023-02-18 23:35:30'),
(67, 11, 4, 1, 'teste', '2023-02-18 23:35:35'),
(68, 11, 2, 1, 'teste', '2023-02-18 23:37:25'),
(69, 11, 2, 3, 'teste', '2023-02-18 23:37:53'),
(70, 11, 2, 2, 'teste', '2023-02-18 23:39:14'),
(71, 11, 4, 1, 'teste', '2023-02-18 23:40:57'),
(72, 11, 4, 3, 'teste', '2023-02-18 23:41:12'),
(73, 11, 2, 1, 'teste', '2023-02-18 23:42:08'),
(74, 11, 3, 1, 'teste', '2023-02-18 23:42:36'),
(75, 11, 3, 1, 'teste', '2023-02-19 02:54:11'),
(76, 11, 4, 1, 'teste', '2023-02-19 02:54:31'),
(77, 11, 4, 1, 'teste', '2023-02-19 02:55:32'),
(78, 11, 2, 1, 'teste', '2023-02-19 02:55:48'),
(79, 11, 2, 3, 'teste', '2023-02-19 02:55:54'),
(80, 11, 2, 2, 'teste', '2023-02-19 02:56:27'),
(81, 11, 2, 1, 'teste', '2023-02-19 03:20:50'),
(82, 11, 4, 1, 'teste', '2023-02-19 03:23:16'),
(83, 11, 3, 1, 'teste', '2023-02-19 03:24:25'),
(84, 11, 2, 1, 'teste', '2023-02-19 03:24:42'),
(85, 11, 2, 2, 'teste', '2023-02-19 03:35:54'),
(86, 11, 2, 1, 'teste', '2023-02-19 11:51:20'),
(87, 11, 2, 2, 'teste', '2023-02-19 11:56:21'),
(88, 11, 3, 1, 'teste', '2023-02-24 10:14:58'),
(89, 11, 4, 1, 'teste', '2023-02-24 10:15:28'),
(90, 11, 4, 1, 'teste', '2023-02-24 10:17:05'),
(91, 11, 3, 1, 'teste', '2023-02-27 01:42:47'),
(92, 11, 3, 2, 'teste', '2023-02-27 01:43:32'),
(93, 14, 4, 1, 'teste', '2023-02-27 01:57:33'),
(94, 15, 3, 1, 'teste', '2023-02-27 02:02:24'),
(95, 15, 2, 1, 'teste', '2023-02-27 02:02:50'),
(96, 15, 3, 1, 'teste', '2023-02-27 02:03:47');

-- --------------------------------------------------------

--
-- Estrutura da tabela `track_robot`
--

CREATE TABLE `track_robot` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `track_robot`
--

INSERT INTO `track_robot` (`id`, `user_id`, `datetime`) VALUES
(83, 10, '2023-02-14 19:59:50'),
(84, 10, '2023-02-14 19:59:57'),
(85, 10, '2023-02-14 19:59:59'),
(86, 10, '2023-02-14 20:00:01'),
(87, 10, '2023-02-14 20:00:03'),
(88, 10, '2023-02-14 20:00:17'),
(89, 10, '2023-02-14 20:01:01'),
(90, 10, '2023-02-14 20:01:06'),
(91, 11, '2023-02-18 23:10:21'),
(92, 11, '2023-02-19 11:52:00'),
(93, 11, '2023-02-19 11:52:14'),
(94, 11, '2023-02-19 11:52:17'),
(95, 11, '2023-02-19 11:52:23'),
(96, 11, '2023-02-19 11:52:26'),
(97, 11, '2023-02-19 11:52:28'),
(98, 11, '2023-02-19 11:52:30'),
(99, 11, '2023-02-19 11:52:36'),
(100, 11, '2023-02-19 11:52:38'),
(101, 11, '2023-02-19 11:52:48'),
(102, 11, '2023-02-19 11:52:51'),
(103, 11, '2023-02-19 11:52:53'),
(104, 11, '2023-02-19 11:52:55'),
(105, 11, '2023-02-19 11:52:56'),
(106, 11, '2023-02-19 11:56:20'),
(107, 11, '2023-02-19 11:56:27'),
(108, 11, '2023-02-19 11:56:29'),
(109, 11, '2023-02-19 11:56:31'),
(110, 11, '2023-02-19 11:56:33'),
(111, 11, '2023-02-19 11:56:34'),
(112, 11, '2023-02-19 11:56:36'),
(113, 11, '2023-02-19 11:56:48'),
(114, 11, '2023-02-19 11:59:52'),
(115, 11, '2023-02-19 11:59:54'),
(116, 11, '2023-02-19 11:59:55'),
(117, 11, '2023-02-19 11:59:57'),
(118, 11, '2023-02-19 11:59:58'),
(119, 11, '2023-02-19 12:00:00'),
(120, 11, '2023-02-19 12:00:01'),
(121, 11, '2023-02-19 12:00:03'),
(122, 11, '2023-02-24 10:17:52'),
(123, 11, '2023-02-24 10:18:00'),
(124, 11, '2023-02-24 10:18:03'),
(125, 11, '2023-02-24 10:18:05'),
(126, 11, '2023-02-24 10:18:07'),
(127, 11, '2023-02-24 10:18:08'),
(128, 11, '2023-02-24 10:18:10'),
(129, 11, '2023-02-24 10:18:11'),
(130, 11, '2023-02-24 10:18:13'),
(131, 11, '2023-02-24 10:18:14'),
(132, 11, '2023-02-24 10:18:16'),
(133, 11, '2023-02-24 10:18:17'),
(134, 11, '2023-02-24 10:18:19'),
(135, 11, '2023-02-24 10:18:20'),
(136, 11, '2023-02-24 10:18:21'),
(137, 11, '2023-02-24 10:18:23'),
(138, 11, '2023-02-24 10:18:24'),
(139, 11, '2023-02-24 10:18:26'),
(140, 11, '2023-02-24 10:18:27'),
(141, 11, '2023-02-24 10:18:29'),
(142, 11, '2023-02-24 10:18:30');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `device_id` varchar(256) NOT NULL,
  `user_code` varchar(255) NOT NULL,
  `is_premium` tinyint(1) DEFAULT NULL,
  `user_code_use` int(11) NOT NULL,
  `bot_use` int(11) NOT NULL,
  `app_use` int(11) NOT NULL,
  `language` varchar(10) DEFAULT NULL,
  `country` varchar(10) DEFAULT NULL,
  `last_entry` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `device_id`, `user_code`, `is_premium`, `user_code_use`, `bot_use`, `app_use`, `language`, `country`, `last_entry`, `created_at`) VALUES
(12, '234abcd3', 'AEAEAE', 0, 0, 0, 0, 'pt', 'BR', '2023-02-19 11:55:39', '2023-02-19 11:55:39'),
(13, '233abcd3', 'AEAEAE', 0, 1, 0, 0, 'pt', 'BR', '2023-02-19 11:57:12', '2023-02-19 11:57:12'),
(15, '728b11d65494dc89', 'M9R3CP', 0, 0, 0, 3, 'pt', 'BR', '2023-02-27 02:03:47', '2023-02-27 02:02:23');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `marketing`
--
ALTER TABLE `marketing`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `track_marketing`
--
ALTER TABLE `track_marketing`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `track_robot`
--
ALTER TABLE `track_robot`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `marketing`
--
ALTER TABLE `marketing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `track_marketing`
--
ALTER TABLE `track_marketing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT de tabela `track_robot`
--
ALTER TABLE `track_robot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
