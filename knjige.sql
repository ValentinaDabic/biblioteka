-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 15, 2025 at 05:31 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `biblio-sfera`
--

-- --------------------------------------------------------

--
-- Table structure for table `knjige`
--

CREATE TABLE `knjige` (
  `id` int(11) NOT NULL,
  `naslov` varchar(100) NOT NULL,
  `autor` varchar(100) NOT NULL,
  `cijena` varchar(100) NOT NULL,
  `slika` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `knjige`
--

INSERT INTO `knjige` (`id`, `naslov`, `autor`, `cijena`, `slika`) VALUES
(1, '48 zakona moći', 'Robert Greene', '16KM', 'https://biblioner.ba/wp-content/uploads/2020/05/robert-grin-48_zakona_moci_vv.jpg'),
(2, 'Veliki iskorak', 'Tara Mor', '20KM', 'https://biblioner.ba/wp-content/uploads/2021/04/veliki_iskorak_vv.jpg'),
(3, '1984 – Životinjska farma', 'George Orwell', '20KM', 'https://biblioner.ba/wp-content/uploads/2021/02/1984_farma_kontrast.jpg'),
(4, 'Kum', 'Mario Puzo', '25KM', 'https://mybook.ba/wp-content/uploads/2022/08/38958_org.webp'),
(5, 'Amajlija', 'Roberto Bolaño', '13KM', 'https://biblioner.ba/wp-content/uploads/2021/03/amajlija_roberto.jpg'),
(6, 'Bajkovita čudovišta', 'Alberto Mangel', '18KM', 'https://biblioner.ba/wp-content/uploads/2021/06/bajkovita_cudovista_drakula_alisa_supermen_i_drugi_knjizevni_prijatelji_vv.jpg'),
(7, 'Trilogija Gvendi', 'Stephen King, Richard Chizmar', '47KM', 'https://mybook.ba/wp-content/uploads/2025/01/1724244092-image-6.webp'),
(8, 'Uhvati zeca V izdanje', 'Lana Bastašić', '28KM', 'https://mybook.ba/wp-content/uploads/2025/02/1648321084.png'),
(9, 'Tajne niti', 'Sara Paborn', '24KM', 'https://mybook.ba/wp-content/uploads/2025/01/1734419200-Tajne-niti.webp'),
(10, 'Male traume', 'Meg Arroll', '19KM', 'https://mybook.ba/wp-content/uploads/2025/01/1726230404-image-14.webp'),
(11, 'Ja sam Frida', 'Caroline Bernard', '21KM', 'https://mybook.ba/wp-content/uploads/2025/01/1729663792-Ja-sam-Frida.webp'),
(12, 'Umrijeti bez stresa', 'Vedrana Rudan', '26KM', 'https://mybook.ba/wp-content/uploads/2025/01/1734074549-Umrijeti-bez-stresa.webp');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `knjige`
--
ALTER TABLE `knjige`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `knjige`
--
ALTER TABLE `knjige`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
