-- Membuat database
CREATE DATABASE mydatabase;
USE mydatabase;

-- Membuat tabel
CREATE TABLE mytable (
	nama VARCHAR(255)
);

CREATE TABLE prodi (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nama VARCHAR(100)
);

CREATE TABLE mahasiswa (
	nim VARCHAR(10) NOT NULL UNIQUE PRIMARY KEY,
	nama VARCHAR(100),
	nilai INT DEFAULT 0,
	id_prodi INT,
	FOREIGN KEY(id_prodi) REFERENCES prodi(id)
);

-- Melihat tabel
SHOW TABLES;

-- Mendeskripsikan tabel
DESCRIBE prodi;

-- Menambah tabel
ALTER TABLE mahasiswa
ADD angkatan INT(10);

-- Mengubah tabel
ALTER TABLE mahasiswa
MODIFY nama VARCHAR(200);

DESCRIBE mahasiswa;

-- Menghapus tabel
ALTER TABLE mahasiswa DROP angkatan;
DESCRIBE mahasiswa;

-- Latihan 1
CREATE DATABASE latihan_01;

CREATE TABLE produk (
	id_produk INT(11) UNIQUE PRIMARY KEY,
	nama_produk VARCHAR(255) NOT NULL,
	harga_produk INT(25) NOT NULL,
	deskripsi_produk VARCHAR(255)
);
-- DROP TABLE produk;

ALTER TABLE produk
MODIFY deskripsi_produk TEXT;

ALTER TABLE produk
ADD jumlah_stok INT;

ALTER TABLE produk
MODIFY deskripsi_produk VARCHAR(255) DEFAULT "Deskripsi Tidak Tersedia";

DESCRIBE produk;

CREATE TABLE penulis (
	id INT(11) PRIMARY KEY AUTO_INCREMENT,
	nama VARCHAR(100) NOT NULL
);

CREATE TABLE buku (
	judul_buku VARCHAR(100) NOT NULL UNIQUE,
	tahun_terbit INT(11),
	id_penulis INT(11),
	id INT(11) PRIMARY KEY AUTO_INCREMENT,
	FOREIGN KEY(id_penulis) REFERENCES penulis(id)
);

-- DROP TABLE penulis;
-- DROP TABLE buku;

DESCRIBE penulis;
DESCRIBE buku;
