-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 15 Jan 2020 pada 07.05
-- Versi server: 10.3.16-MariaDB
-- Versi PHP: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `penggajian`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `username` varchar(25) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('1', '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_gaji`
--

CREATE TABLE `tbl_gaji` (
  `id_gaji` int(3) NOT NULL,
  `id_karyawan` varchar(5) NOT NULL,
  `gaji_kotor` int(9) NOT NULL,
  `jam_lembur` int(2) NOT NULL,
  `jumlah_lembur` int(8) NOT NULL,
  `pajak` int(8) NOT NULL,
  `total_tunjangan` int(8) NOT NULL,
  `gaji_bersih` int(8) NOT NULL,
  `bulan` int(2) NOT NULL,
  `tahun` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_gaji`
--

INSERT INTO `tbl_gaji` (`id_gaji`, `id_karyawan`, `gaji_kotor`, `jam_lembur`, `jumlah_lembur`, `pajak`, `total_tunjangan`, `gaji_bersih`, `bulan`, `tahun`) VALUES
(21, '12', 18720000, 1, 120000, 1872000, 6600000, 20592000, 0, 0000),
(22, '1', 21300000, 2, 300000, 2130000, 6000000, 23430000, 1, 2001),
(23, '1', 21150000, 1, 150000, 2115000, 6000000, 23265000, 1, 2020),
(24, 'qw', 6360000, 4, 160000, 636000, 2200000, 6996000, 2, 2000),
(25, '1', 21450000, 3, 450000, 2145000, 6000000, 23595000, 2, 2020),
(26, '1', 21300000, 2, 300000, 2130000, 6000000, 23430000, 3, 2020),
(27, '1', 21750000, 5, 750000, 2175000, 6000000, 23925000, 4, 2020),
(28, '1', 21600000, 4, 600000, 2160000, 6000000, 23760000, 5, 2020);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_jabatan`
--

CREATE TABLE `tbl_jabatan` (
  `id_jabatan` int(2) NOT NULL,
  `nama_jabatan` varchar(15) NOT NULL,
  `gaji_pokok` int(8) NOT NULL,
  `upah_lembur` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_jabatan`
--

INSERT INTO `tbl_jabatan` (`id_jabatan`, `nama_jabatan`, `gaji_pokok`, `upah_lembur`) VALUES
(1, 'CEO', 20000000, 200000),
(2, 'CTO', 15000000, 150000),
(3, 'CFO', 12000000, 120000),
(4, 'CMO', 12000000, 120000),
(5, 'COO', 15000000, 150000),
(6, 'System Analyst', 12000000, 120000),
(7, 'Programmer', 8000000, 80000),
(8, 'Office Boy', 4000000, 40000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_karyawan`
--

CREATE TABLE `tbl_karyawan` (
  `id_karyawan` varchar(5) NOT NULL,
  `nama_karyawan` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `tmp_lahir` varchar(20) NOT NULL,
  `tgl_lahir` varchar(18) NOT NULL,
  `jk` int(1) NOT NULL,
  `id_jabatan` int(2) NOT NULL,
  `status_nikah` int(11) NOT NULL,
  `jml_anak` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_karyawan`
--

INSERT INTO `tbl_karyawan` (`id_karyawan`, `nama_karyawan`, `alamat`, `no_hp`, `tmp_lahir`, `tgl_lahir`, `jk`, `id_jabatan`, `status_nikah`, `jml_anak`, `username`, `password`) VALUES
('1', 'Richard Hendricks', 'Jl. Delima No.86, Berlin, German', '03012219009', 'Vienna, Austria', '02 Februari 1998', 1, 5, 1, 0, '1', '1'),
('12', 'Nikola Tesla', 'Smiljan, Lika, Kroasia', '-', 'Smiljan, Kroasia', '10 Juli 18', 1, 2, 0, 0, '123', '123'),
('qw', 'Reinhard The Dragon', 'Jl. Manggis No. 09, Depok, Jawa Barat', '089561522516', 'Depok', '1987-12-12', 1, 8, 0, 0, '111', '111'),
('stn', 'Felix Steiner', 'Jl. Kencana No. 108, München, Jerman', '03018293981', 'Berlin', '1996-06-04', 1, 6, 1, 3, 'asd', '123');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `tbl_gaji`
--
ALTER TABLE `tbl_gaji`
  ADD PRIMARY KEY (`id_gaji`),
  ADD KEY `id_karyawan` (`id_karyawan`);

--
-- Indeks untuk tabel `tbl_jabatan`
--
ALTER TABLE `tbl_jabatan`
  ADD PRIMARY KEY (`id_jabatan`);

--
-- Indeks untuk tabel `tbl_karyawan`
--
ALTER TABLE `tbl_karyawan`
  ADD PRIMARY KEY (`id_karyawan`),
  ADD KEY `id_jabatan` (`id_jabatan`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_gaji`
--
ALTER TABLE `tbl_gaji`
  MODIFY `id_gaji` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `tbl_jabatan`
--
ALTER TABLE `tbl_jabatan`
  MODIFY `id_jabatan` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2147483648;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
