-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 19-Fev-2023 às 03:13
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
  `product_link` varchar(256) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `marketing`
--

INSERT INTO `marketing` (`id`, `affiliate_ad`, `affiliate_link`, `product_link`, `keyword`, `is_active`, `created_at`) VALUES
(2, 'Anúncio de teste', 'https://manualdosvideos.com.br/celular', 'https://google.com', 'teste', 1, '2023-02-18 14:21:00'),
(3, 'Anúncio de teste 2', 'https://manualdosvideos.com.br/celular', 'https://google.com', 'teste', 1, '2023-02-18 14:22:31'),
(4, 'Anúncio de teste 3', 'https://manualdosvideos.com.br/celular', 'https://google.com', 'teste', 1, '2023-02-18 14:23:48');

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
(59, 11, 2, 2, 'teste', '2023-02-18 23:10:22');

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
(91, 11, '2023-02-18 23:10:21');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `device_id` varchar(256) NOT NULL,
  `user_code` varchar(255) NOT NULL,
  `user_code_use` int(11) NOT NULL,
  `bot_use` int(11) NOT NULL,
  `app_use` int(11) NOT NULL,
  `last_entry` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `device_id`, `user_code`, `user_code_use`, `bot_use`, `app_use`, `last_entry`, `created_at`) VALUES
(11, '728b11d65494dc89', 'XPB3N9', 0, 1, 56, '2023-02-18 23:10:21', '2023-02-18 13:05:29');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT de tabela `track_robot`
--
ALTER TABLE `track_robot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
