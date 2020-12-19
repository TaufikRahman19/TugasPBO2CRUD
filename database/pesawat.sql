-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 03 Des 2018 pada 14.24
-- Versi server: 10.1.37-MariaDB
-- Versi PHP: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pesawat`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal`
--

CREATE TABLE `jadwal` (
  `ID_JADWAL` varchar(10) NOT NULL,
  `ID_PESAWAT` varchar(10) DEFAULT NULL,
  `KOTA_AWAL` varchar(10) DEFAULT NULL,
  `KOTA_TUJUAN` varchar(10) DEFAULT NULL,
  `KEBERANGKATAN` varchar(10) DEFAULT NULL,
  `KEDATANGAN` varchar(10) DEFAULT NULL,
  `HARGA` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `jadwal`
--

INSERT INTO `jadwal` (`ID_JADWAL`, `ID_PESAWAT`, `KOTA_AWAL`, `KOTA_TUJUAN`, `KEBERANGKATAN`, `KEDATANGAN`, `HARGA`) VALUES
('JD01', 'PW01', 'KT01', 'KT02', '10:00:00', '11:00:00', 450000),
('JD02', 'PW02', 'KT02', 'KT03', '11:00:00', '12:00:00', 550000),
('JD03', 'PW03', 'KT03', 'KT04', '12:00:00', '13:00:00', 550000),
('JD04', 'PW04', 'KT04', 'KT05', '13:00:00', '14:00:00', 550000),
('JD05', 'PW05', 'KT05', 'KT01', '14:00:00', '15:00:00', 550000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kota`
--

CREATE TABLE `kota` (
  `ID_KOTA` varchar(10) NOT NULL,
  `KOTA` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kota`
--

INSERT INTO `kota` (`ID_KOTA`, `KOTA`) VALUES
('KT01', 'Malang'),
('KT02', 'Surabaya'),
('KT03', 'Jakarta'),
('KT04', 'Bali'),
('KT05', 'Semarang');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemesanan`
--

CREATE TABLE `pemesanan` (
  `ID_PEMESANAN` varchar(10) NOT NULL,
  `ID_JADWAL` varchar(10) DEFAULT NULL,
  `NIK` varchar(16) DEFAULT NULL,
  `NAMA` varchar(100) DEFAULT NULL,
  `TELPON` varchar(16) DEFAULT NULL,
  `JUMLAH_TIKET` int(11) DEFAULT NULL,
  `TOTAL` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesawat`
--

CREATE TABLE `pesawat` (
  `ID_PESAWAT` varchar(10) NOT NULL,
  `MASKAPAI` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pesawat`
--

INSERT INTO `pesawat` (`ID_PESAWAT`, `MASKAPAI`) VALUES
('PW01', 'Garuda Indonesia'),
('PW02', 'Citilink'),
('PW03', 'Sriwijaya'),
('PW04', 'Lion Air'),
('PW05', 'Air Asia');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`ID_JADWAL`),
  ADD KEY `FK_RELATIONSHIP_1` (`ID_PESAWAT`),
  ADD KEY `FK_RELATIONSHIP_2` (`KOTA_TUJUAN`),
  ADD KEY `FK_RELATIONSHIP_3` (`KOTA_AWAL`);

--
-- Indeks untuk tabel `kota`
--
ALTER TABLE `kota`
  ADD PRIMARY KEY (`ID_KOTA`);

--
-- Indeks untuk tabel `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD PRIMARY KEY (`ID_PEMESANAN`),
  ADD KEY `FK_RELATIONSHIP_4` (`ID_JADWAL`);

--
-- Indeks untuk tabel `pesawat`
--
ALTER TABLE `pesawat`
  ADD PRIMARY KEY (`ID_PESAWAT`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `FK_RELATIONSHIP_1` FOREIGN KEY (`ID_PESAWAT`) REFERENCES `pesawat` (`ID_PESAWAT`),
  ADD CONSTRAINT `FK_RELATIONSHIP_2` FOREIGN KEY (`KOTA_TUJUAN`) REFERENCES `kota` (`ID_KOTA`),
  ADD CONSTRAINT `FK_RELATIONSHIP_3` FOREIGN KEY (`KOTA_AWAL`) REFERENCES `kota` (`ID_KOTA`);

--
-- Ketidakleluasaan untuk tabel `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD CONSTRAINT `FK_RELATIONSHIP_4` FOREIGN KEY (`ID_JADWAL`) REFERENCES `jadwal` (`ID_JADWAL`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
