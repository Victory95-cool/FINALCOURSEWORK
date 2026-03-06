-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 06, 2026 at 12:27 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `finalcoursework`
--

-- --------------------------------------------------------

--
-- Table structure for table `film`
--

CREATE TABLE `film` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `genre` varchar(100) DEFAULT NULL,
  `release_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `film`
--

INSERT INTO `film` (`id`, `title`, `genre`, `release_date`, `created_at`) VALUES
(1, 'Inception', NULL, '0000-00-00 00:00:00', '2026-03-06 17:25:45'),
(2, 'Interstellar', NULL, '0000-00-00 00:00:00', '2026-03-06 17:25:45'),
(3, 'The Dark Knight', NULL, '0000-00-00 00:00:00', '2026-03-06 17:25:45'),
(4, 'Avatar', NULL, '0000-00-00 00:00:00', '2026-03-06 17:25:45'),
(5, 'Titanic', NULL, '0000-00-00 00:00:00', '2026-03-06 17:25:45');

-- --------------------------------------------------------

--
-- Table structure for table `genrefilms`
--

CREATE TABLE `genrefilms` (
  `id` int(11) NOT NULL,
  `film_id` int(11) NOT NULL,
  `review_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `review_text` varchar(255) DEFAULT NULL,
  `review_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `genrefilms`
--

INSERT INTO `genrefilms` (`id`, `film_id`, `review_id`, `rating`, `review_text`, `review_date`) VALUES
(1, 1, 1, 0, NULL, NULL),
(2, 2, 1, 0, NULL, NULL),
(3, 3, 2, 0, NULL, NULL),
(4, 4, 5, 0, NULL, NULL),
(5, 5, 4, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `id` int(11) NOT NULL,
  `review_text` text NOT NULL,
  `rating` int(11) NOT NULL CHECK (`rating` between 1 and 10),
  `image` varchar(255) DEFAULT NULL,
  `review_date` datetime DEFAULT current_timestamp(),
  `reviewers_id` int(11) NOT NULL,
  `film_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`id`, `review_text`, `rating`, `image`, `review_date`, `reviewers_id`, `film_id`) VALUES
(1, 'Mind-blowing concept and stunning visuals.', 5, 'inception.jpg', '2026-03-06 00:00:00', 1, 1),
(2, 'A beautiful story about space and humanity.', 5, 'interstellar.jpg', '2026-03-06 00:00:00', 2, 2),
(3, 'Heath Ledger delivers an unforgettable Joker.', 5, 'darkknight.jpg', '2026-03-06 00:00:00', 3, 3),
(4, 'Visually spectacular world building.', 4, 'avatar.jpg', '2026-03-06 00:00:00', 4, 4),
(5, 'A timeless romance that still moves audiences.', 5, 'titanic.jpg', '2026-03-06 00:00:00', 5, 5),
(6, 'Complex plot but very rewarding to watch.', 4, 'inception2.jpg', '2026-03-06 00:00:00', 6, 1),
(7, 'One of the best superhero films ever made.', 5, 'darkknight2.jpg', '2026-03-06 00:00:00', 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `reviewers`
--

CREATE TABLE `reviewers` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviewers`
--

INSERT INTO `reviewers` (`id`, `username`, `phone_number`, `email`, `created_at`) VALUES
(1, 'Alice Nguyen', '0901234567', 'alice@gmail.com', '2026-03-06 17:28:51'),
(2, 'Brian Tran', '0902345678', 'brian@gmail.com', '2026-03-06 17:28:51'),
(3, 'Charlie Pham', '0903456789', 'charlie@gmail.com', '2026-03-06 17:28:51'),
(4, 'David Le', '0904567890', 'david@gmail.com', '2026-03-06 17:28:51'),
(5, 'Emma Vu', '0905678901', 'emma@gmail.com', '2026-03-06 17:28:51'),
(6, 'Frank Hoang', '0906789012', 'frank@gmail.com', '2026-03-06 17:28:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `genrefilms`
--
ALTER TABLE `genrefilms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_genrefilms_film` (`film_id`),
  ADD KEY `fk_genrefilms_review` (`review_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_review_reviewers` (`reviewers_id`),
  ADD KEY `fk_review_film` (`film_id`);

--
-- Indexes for table `reviewers`
--
ALTER TABLE `reviewers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `film`
--
ALTER TABLE `film`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `genrefilms`
--
ALTER TABLE `genrefilms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `reviewers`
--
ALTER TABLE `reviewers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `genrefilms`
--
ALTER TABLE `genrefilms`
  ADD CONSTRAINT `fk_genrefilms_film` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_genrefilms_review` FOREIGN KEY (`review_id`) REFERENCES `review` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `fk_review_film` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_review_reviewers` FOREIGN KEY (`reviewers_id`) REFERENCES `reviewers` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
