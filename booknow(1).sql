-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 03, 2023 at 03:09 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `booknow`
--

-- --------------------------------------------------------

--
-- Table structure for table `librarybuku`
--

CREATE TABLE `librarybuku` (
  `idUser` int(12) NOT NULL,
  `idBuku` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `idPembayaran` int(12) NOT NULL,
  `idPembelian` int(12) NOT NULL,
  `idUser` int(12) NOT NULL,
  `idBuku` int(12) NOT NULL,
  `totalHarga` int(50) NOT NULL,
  `metodePembayaran` enum('Gopay','OVO') NOT NULL,
  `jumlahProduk` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `idPembelian` int(12) NOT NULL,
  `idUser` int(12) NOT NULL,
  `idBuku` int(12) NOT NULL,
  `jumlahProduk` int(100) NOT NULL,
  `totalHarga` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `produkbuku`
--

CREATE TABLE `produkbuku` (
  `idBuku` int(12) NOT NULL,
  `judulBuku` varchar(50) NOT NULL,
  `idPenulis` int(12) NOT NULL,
  `genreBuku` enum('Romance','Horror','Comedy') NOT NULL,
  `hargaBuku` int(50) NOT NULL,
  `ratingBuku` float NOT NULL,
  `deskripsiBuku` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `idReview` int(12) NOT NULL,
  `idPembeli` int(12) NOT NULL,
  `idBuku` int(12) NOT NULL,
  `ratingBuku` float NOT NULL,
  `komenReview` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `useradmin`
--

CREATE TABLE `useradmin` (
  `idAdmin` int(12) NOT NULL,
  `namaAdmin` varchar(50) NOT NULL,
  `emailAdmin` varchar(255) NOT NULL,
  `usernameAdmin` varchar(50) NOT NULL,
  `passwordAdmin` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `useradmin`
--

INSERT INTO `useradmin` (`idAdmin`, `namaAdmin`, `emailAdmin`, `usernameAdmin`, `passwordAdmin`) VALUES
(1, 'Tom', 'tom123@gmail.com', 'tom', 'tomfreddy'),
(2, 'sam', 'Sukapura, Bandung', 'Sam', 'Samhardy');

-- --------------------------------------------------------

--
-- Table structure for table `userpembeli`
--

CREATE TABLE `userpembeli` (
  `idPembeli` int(12) NOT NULL,
  `namaPembeli` varchar(50) NOT NULL,
  `bDatePembeli` date NOT NULL,
  `emailPembeli` varchar(255) NOT NULL,
  `noPembeli` varchar(12) NOT NULL,
  `alamatPembeli` text NOT NULL,
  `usernamePembeli` varchar(50) NOT NULL,
  `passwordPembeli` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userpembeli`
--

INSERT INTO `userpembeli` (`idPembeli`, `namaPembeli`, `bDatePembeli`, `emailPembeli`, `noPembeli`, `alamatPembeli`, `usernamePembeli`, `passwordPembeli`) VALUES
(1, 'Farhan Faturahman', '2002-12-01', 'faturahmanfarhanff@student.telkomuniversity.ac.id', '081395974218', 'Dukuh Zamrud, Bekasi', 'Faeyns', 'TommyAnjay'),
(2, 'Tommy', '2023-11-01', 'tommyanjay@gmail.com', '081328142751', 'Sukapura, Bandung', 'tommy', 'tommyanjaygaming'),
(3, 'Sammy', '2023-10-03', 'sammay@gmail.com', '', 'Sukabirus, Bandung', 'sammayy', 'bausammy');

-- --------------------------------------------------------

--
-- Table structure for table `userpenulis`
--

CREATE TABLE `userpenulis` (
  `idPenulis` int(12) NOT NULL,
  `namaPenulis` varchar(50) NOT NULL,
  `bDatePenulis` date NOT NULL,
  `emailPenulis` varchar(255) NOT NULL,
  `noPenulis` varchar(12) NOT NULL,
  `alamatPenulis` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userpenulis`
--

INSERT INTO `userpenulis` (`idPenulis`, `namaPenulis`, `bDatePenulis`, `emailPenulis`, `noPenulis`, `alamatPenulis`) VALUES
(1, 'Faeyns', '2002-12-01', 'faturahmanfarhanff@student.telkomuniversity.ac.id', '081395974218', 'Dukuh Zamrud, Bekasi');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `librarybuku`
--
ALTER TABLE `librarybuku`
  ADD PRIMARY KEY (`idUser`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`idPembayaran`),
  ADD KEY `idPembelian` (`idPembelian`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`idPembelian`),
  ADD KEY `idUser` (`idUser`);

--
-- Indexes for table `produkbuku`
--
ALTER TABLE `produkbuku`
  ADD PRIMARY KEY (`idBuku`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`idReview`),
  ADD KEY `idBuku` (`idBuku`);

--
-- Indexes for table `useradmin`
--
ALTER TABLE `useradmin`
  ADD PRIMARY KEY (`idAdmin`);

--
-- Indexes for table `userpembeli`
--
ALTER TABLE `userpembeli`
  ADD PRIMARY KEY (`idPembeli`);

--
-- Indexes for table `userpenulis`
--
ALTER TABLE `userpenulis`
  ADD PRIMARY KEY (`idPenulis`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `idPembayaran` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `idPembelian` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produkbuku`
--
ALTER TABLE `produkbuku`
  MODIFY `idBuku` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `idReview` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `useradmin`
--
ALTER TABLE `useradmin`
  MODIFY `idAdmin` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `userpembeli`
--
ALTER TABLE `userpembeli`
  MODIFY `idPembeli` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `librarybuku`
--
ALTER TABLE `librarybuku`
  ADD CONSTRAINT `idLibrary` FOREIGN KEY (`idUser`) REFERENCES `userpembeli` (`idPembeli`);

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `idPembelian` FOREIGN KEY (`idPembelian`) REFERENCES `pembelian` (`idPembelian`);

--
-- Constraints for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `idUser` FOREIGN KEY (`idUser`) REFERENCES `userpembeli` (`idPembeli`);

--
-- Constraints for table `produkbuku`
--
ALTER TABLE `produkbuku`
  ADD CONSTRAINT `idPenulis` FOREIGN KEY (`idPenulis`) REFERENCES `userpenulis` (`idPenulis`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `idBuku` FOREIGN KEY (`idBuku`) REFERENCES `produkbuku` (`idBuku`);

--
-- Constraints for table `userpenulis`
--
ALTER TABLE `userpenulis`
  ADD CONSTRAINT `idPembeli` FOREIGN KEY (`idPenulis`) REFERENCES `userpembeli` (`idPembeli`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
