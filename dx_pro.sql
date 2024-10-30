-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versi server:                 8.0.30 - MySQL Community Server - GPL
-- OS Server:                    Win64
-- HeidiSQL Versi:               12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Membuang struktur basisdata untuk edel.db
CREATE DATABASE IF NOT EXISTS `edel.db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `edel.db`;

-- membuang struktur untuk table edel.db.admin
CREATE TABLE IF NOT EXISTS `admin` (
  `id_admin` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `nama_lengkap` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel edel.db.admin: ~1 rows (lebih kurang)
INSERT INTO `admin` (`id_admin`, `username`, `password`, `nama_lengkap`) VALUES
	(1, 'illuziz', 'd54d1702ad0f8326224b817c796763c9', 'septeo putra');

-- membuang struktur untuk table edel.db.likes
CREATE TABLE IF NOT EXISTS `likes` (
  `id_likes` int NOT NULL AUTO_INCREMENT,
  `id_pelanggan` int NOT NULL,
  `id_produk` int NOT NULL,
  PRIMARY KEY (`id_likes`),
  KEY `id_pelanggan` (`id_pelanggan`),
  KEY `id_produk` (`id_produk`),
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`),
  CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel edel.db.likes: ~0 rows (lebih kurang)

-- membuang struktur untuk table edel.db.pelanggan
CREATE TABLE IF NOT EXISTS `pelanggan` (
  `id_pelanggan` int NOT NULL AUTO_INCREMENT,
  `email_pelanggan` varchar(100) DEFAULT NULL,
  `password_pelanggan` varchar(50) DEFAULT NULL,
  `nama_pelanggan` varchar(100) DEFAULT NULL,
  `telepon_pelanggan` varchar(15) DEFAULT NULL,
  `alamat_pelanggan` varchar(100) NOT NULL,
  `foto_profil` varchar(100) NOT NULL,
  PRIMARY KEY (`id_pelanggan`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel edel.db.pelanggan: ~1 rows (lebih kurang)
INSERT INTO `pelanggan` (`id_pelanggan`, `email_pelanggan`, `password_pelanggan`, `nama_pelanggan`, `telepon_pelanggan`, `alamat_pelanggan`, `foto_profil`) VALUES
	(4, 'septeo@gmail.com', 'd54d1702ad0f8326224b817c796763c9', 'septeo putra', '085325633101', 'Asrama Putra Telkom University, Bandung, Jawa Barat', '4.jpg');

-- membuang struktur untuk table edel.db.pembelian
CREATE TABLE IF NOT EXISTS `pembelian` (
  `id_pembelian` int NOT NULL AUTO_INCREMENT,
  `tanggal_pembelian` date DEFAULT NULL,
  `jumlah_pembelian` int NOT NULL,
  `ongkir` int NOT NULL,
  `total_pembelian` int DEFAULT NULL,
  `id_pelanggan` int DEFAULT NULL,
  PRIMARY KEY (`id_pembelian`),
  KEY `id_pelanggan` (`id_pelanggan`),
  CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel edel.db.pembelian: ~0 rows (lebih kurang)

-- membuang struktur untuk table edel.db.pembelian_produk
CREATE TABLE IF NOT EXISTS `pembelian_produk` (
  `id_pembelian_produk` int NOT NULL AUTO_INCREMENT,
  `jumlah` int DEFAULT NULL,
  `id_pembelian` int DEFAULT NULL,
  `id_produk` int DEFAULT NULL,
  PRIMARY KEY (`id_pembelian_produk`),
  KEY `id_pembelian` (`id_pembelian`),
  KEY `id_produk` (`id_produk`),
  CONSTRAINT `pembelian_produk_ibfk_1` FOREIGN KEY (`id_pembelian`) REFERENCES `pembelian` (`id_pembelian`),
  CONSTRAINT `pembelian_produk_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel edel.db.pembelian_produk: ~0 rows (lebih kurang)

-- membuang struktur untuk table edel.db.produk
CREATE TABLE IF NOT EXISTS `produk` (
  `id_produk` int NOT NULL AUTO_INCREMENT,
  `nama_produk` varchar(100) DEFAULT NULL,
  `harga_produk` int DEFAULT NULL,
  `stok` int DEFAULT NULL,
  `foto_produk` varchar(100) DEFAULT NULL,
  `deskripsi_produk` text,
  `likes` int NOT NULL,
  `id_warung` int DEFAULT NULL,
  PRIMARY KEY (`id_produk`),
  KEY `id_warung` (`id_warung`),
  CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`id_warung`) REFERENCES `warung` (`id_warung`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel edel.db.produk: ~12 rows (lebih kurang)
INSERT INTO `produk` (`id_produk`, `nama_produk`, `harga_produk`, `stok`, `foto_produk`, `deskripsi_produk`, `likes`, `id_warung`) VALUES
	(1, 'Nasi Goreng', 15000, 4, '7.jpg', 'Nasi Goreng enak dengan campuran telor, sosis, baso, ayam', 2, 1),
	(2, 'Bakso', 10000, 2, '9.jpg', 'Bakso yang terbuat dari daging sapi berkualitas dan halal, dijamin sehat', 1, 2),
	(3, 'Ayam Goreng', 20000, 10, '6.jpg', 'Menggunakan daging segar yang sehat dan lezzat', 1, 3),
	(4, 'Es Teh', 5000, 0, '11.jpg', 'Teh segar pengobat dahaga', 2, 3),
	(5, 'Soto Ayam', 12000, 16, '5.jpg', 'Menu soto yang dicampur dengan ayam dan telor', 3, 1),
	(6, 'Es Jeruk', 4000, 16, '12.jpg', 'Terbuat dari jeruk alami yang sehat dan manis', 2, 1),
	(7, 'Kopi Jos', 6000, 0, '16.jpg', 'Terbuat dari kopi pilihan yaitu kopi kapal api', 1, 2),
	(8, 'Martabak', 15000, 16, '10.jpg', 'Martabak telor dengan campuran daging dan kornet', 0, 2),
	(9, 'Soup Buah', 15000, 16, '13.jpg', 'Es buah dengan campuran beraneka buah-buahan dan kuah sirup', 0, 3),
	(10, 'Sate Ayam', 11000, 16, '1.jpg', 'Sate ayam lezat dengan bumbu kacang', 0, 1),
	(11, 'Gado gado', 14000, 16, '2.jpg', 'Gado gado lengkap sayuran dan telor', 0, 2),
	(12, 'Kopi Susu', 7000, 1, '15.jpg', '			Kopi nikmat penambah stamina		', 0, 3);

-- membuang struktur untuk table edel.db.warung
CREATE TABLE IF NOT EXISTS `warung` (
  `id_warung` int NOT NULL AUTO_INCREMENT,
  `nama_warung` varchar(50) DEFAULT NULL,
  `alamat_warung` varchar(100) NOT NULL,
  `telepon_warung` varchar(15) NOT NULL,
  PRIMARY KEY (`id_warung`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel edel.db.warung: ~3 rows (lebih kurang)
INSERT INTO `warung` (`id_warung`, `nama_warung`, `alamat_warung`, `telepon_warung`) VALUES
	(1, 'Munjul', 'Sukabirus, Bandung', '081234567888'),
	(2, 'Mekdun', 'Gang PGA, Sukabirus, Dayeuhkolot, Bandung', '081234567990'),
	(3, 'Kantin Tiana', 'Sukapura, Dayeuhkolot, Bandung', '085324543166');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
