-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 03/06/2025 às 20:40
-- Versão do servidor: 8.0.37
-- Versão do PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `biblioteca`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `autores`
--

CREATE TABLE `autores` (
  `id` int NOT NULL,
  `nome` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `autores`
--

INSERT INTO `autores` (`id`, `nome`) VALUES
(1, 'Machado de Assis'),
(2, 'Isaac Asimov'),
(3, 'At labore aliqua Al'),
(4, 'Est est voluptatibu'),
(5, 'Dicta soluta culpa '),
(6, 'Totam et recusandae'),
(7, 'asdfasd');

-- --------------------------------------------------------

--
-- Estrutura para tabela `categorias`
--

CREATE TABLE `categorias` (
  `id` int NOT NULL,
  `nome` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `categorias`
--

INSERT INTO `categorias` (`id`, `nome`) VALUES
(1, 'Romance'),
(2, 'Tecnologia'),
(3, 'Ciência'),
(4, 'Eum culpa do evenie'),
(5, 'Est Nam ipsum labo'),
(6, 'In eum id voluptate');

-- --------------------------------------------------------

--
-- Estrutura para tabela `emprestimos`
--

CREATE TABLE `emprestimos` (
  `id` int NOT NULL,
  `id_livro` int NOT NULL,
  `id_usuario` int NOT NULL,
  `data_emprestimo` date NOT NULL,
  `data_devolucao` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `emprestimos`
--

INSERT INTO `emprestimos` (`id`, `id_livro`, `id_usuario`, `data_emprestimo`, `data_devolucao`) VALUES
(3, 2, 1, '2015-02-05', '2015-02-09'),
(4, 1, 1, '1977-09-15', '1975-04-17');

-- --------------------------------------------------------

--
-- Estrutura para tabela `livroautor`
--

CREATE TABLE `livroautor` (
  `id_livro` int NOT NULL,
  `id_autor` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `livroautor`
--

INSERT INTO `livroautor` (`id_livro`, `id_autor`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `livros`
--

CREATE TABLE `livros` (
  `id` int NOT NULL,
  `titulo` varchar(200) DEFAULT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `ano_publicacao` int DEFAULT NULL,
  `id_categoria` int DEFAULT NULL,
  `autor` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `livros`
--

INSERT INTO `livros` (`id`, `titulo`, `isbn`, `ano_publicacao`, `id_categoria`, `autor`) VALUES
(1, 'Dom Casmurro', '9788594318402', 1899, 1, NULL),
(2, 'Fundação', '9788576572008', 1951, 3, NULL),
(22, 'Et omnis Nam adipisci qui saepe voluptas sit vero laudantium possimus itaque', '75', 2067, 1, NULL),
(23, 'Quos ea quod sit irure numquam veniam dolores nisi aliquam', '89', 1266, 1, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `livro_autor`
--

CREATE TABLE `livro_autor` (
  `livro_id` int NOT NULL,
  `autor_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `senha` varchar(100) DEFAULT NULL,
  `tipo` enum('Estudante','Funcionário') DEFAULT 'Estudante'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`, `tipo`) VALUES
(1, 'Beatae adipisicing a', 'domihydiw@mailinator.com', 'Pa$$w0rd!', 'Estudante'),
(2, 'Henri Okayama', 'henri.okayama@gmail.com', 'henri.okayama@gmail.com', 'Estudante'),
(3, 'Sed laboriosam dele', 'guwymah@mailinator.com', 'Pa$$w0rd!', 'Estudante');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `autores`
--
ALTER TABLE `autores`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `emprestimos`
--
ALTER TABLE `emprestimos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_livro` (`id_livro`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Índices de tabela `livroautor`
--
ALTER TABLE `livroautor`
  ADD PRIMARY KEY (`id_livro`,`id_autor`),
  ADD KEY `id_autor` (`id_autor`);

--
-- Índices de tabela `livros`
--
ALTER TABLE `livros`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `isbn` (`isbn`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Índices de tabela `livro_autor`
--
ALTER TABLE `livro_autor`
  ADD PRIMARY KEY (`livro_id`,`autor_id`),
  ADD KEY `autor_id` (`autor_id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `autores`
--
ALTER TABLE `autores`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `emprestimos`
--
ALTER TABLE `emprestimos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `livros`
--
ALTER TABLE `livros`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `emprestimos`
--
ALTER TABLE `emprestimos`
  ADD CONSTRAINT `emprestimos_ibfk_1` FOREIGN KEY (`id_livro`) REFERENCES `livros` (`id`),
  ADD CONSTRAINT `emprestimos_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Restrições para tabelas `livroautor`
--
ALTER TABLE `livroautor`
  ADD CONSTRAINT `livroautor_ibfk_1` FOREIGN KEY (`id_livro`) REFERENCES `livros` (`id`),
  ADD CONSTRAINT `livroautor_ibfk_2` FOREIGN KEY (`id_autor`) REFERENCES `autores` (`id`);

--
-- Restrições para tabelas `livros`
--
ALTER TABLE `livros`
  ADD CONSTRAINT `livros_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`);

--
-- Restrições para tabelas `livro_autor`
--
ALTER TABLE `livro_autor`
  ADD CONSTRAINT `livro_autor_ibfk_1` FOREIGN KEY (`livro_id`) REFERENCES `livros` (`id`),
  ADD CONSTRAINT `livro_autor_ibfk_2` FOREIGN KEY (`autor_id`) REFERENCES `autores` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
