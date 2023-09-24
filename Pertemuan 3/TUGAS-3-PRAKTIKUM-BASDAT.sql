# No 1

-- Membuat database
CREATE DATABASE praktikum3;

USE praktikum3;

-- Membuat tabel
CREATE TABLE `mahasiswa` (
	`NIM` VARCHAR(10) NOT NULL PRIMARY KEY,
	`Nama` VARCHAR(50) NOT NULL,
	`Kelas` CHAR(1) NOT NULL,
	`status` VARCHAR(50) NOT NULL,
	`Nilai` INT(11)
);

DESC mahasiswa;

-- Memasukkan data ke dalam tabel
INSERT INTO mahasiswa
VALUES ('H071241056', 'Kotlina', 'A', 'Hadir', 100),
		 ('H071241060', 'Pitonia', 'A', 'Alfa', 85),
		 ('H071241063', 'Javano', 'A', 'Hadir', 50),
		 ('H071241065', 'Ciplus Kuadra', 'B', 'Hadir', 65),
		 ('H071241066', 'Pihap E', 'B', 'Hadir', 85),
		 ('H071241079', 'Ruby', 'B', 'Alfa', 90);
		 
SELECT * FROM mahasiswa;

# No 2
-- Mengubah nilai dan kelas mahasiswa yang alfa
UPDATE mahasiswa
SET kelas = 'C', nilai = 0
WHERE status = 'Alfa';

SELECT * FROM mahasiswa;

# No 3
-- Menghapus data mahasiswa yang membobol soal ujian
DELETE FROM mahasiswa
WHERE nilai > 90;

SELECT * FROM mahasiswa;

# NO 4
-- Menambahkan data siswa pindahan
INSERT INTO mahasiswa
VALUE ('H071221067', 'Jonathan Kwan', 'B', 'Pindahan', NULL);

SELECT * FROM mahasiswa;

-- Mengubah nilai mahasiswa yang alfa
UPDATE mahasiswa
SET nilai = 50
WHERE STATUS = 'Alfa';

SELECT * FROM mahasiswa;

-- Merombak seluruh kelas menjadi A
UPDATE mahasiswa
SET kelas = 'A';

SELECT * FROM mahasiswa;