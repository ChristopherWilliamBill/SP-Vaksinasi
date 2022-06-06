CREATE TABLE Masyarakat(
    IdM INT PRIMARY KEY,
    email VARCHAR(50),
    noHP VARCHAR(15),
    nama VARCHAR(50),
    alamat VARCHAR(50),
    NIK INT,
    tglLahir DATE,
    jenisKelamin VARCHAR(6),
)

CREATE TABLE Kota(
    IdKota INT PRIMARY KEY,
    namaKota VARCHAR(50)
)

CREATE TABLE Lokasi(
    IdLokasi INT PRIMARY KEY,
    namaLokasi VARCHAR(50),
    IdKota INT FOREIGN KEY REFERENCES Kota(IdKota)
)

CREATE TABLE KegiatanVaksinasi(
    IdKegiatan INT PRIMARY KEY,
    kuota INT,
    waktu TIME,
    tanggal DATE,
    IdLokasi INT FOREIGN KEY REFERENCES Lokasi(IdLokasi),
    IdPenyelenggara INT FOREIGN KEY REFERENCES Penyelenggara(IdPenyelenggara)
)

CREATE TABLE Penyelenggara(
    IdPenyelenggara INT PRIMARY KEY,
    nama VARCHAR(50),
    urutanTahapan VARCHAR(15),
    IdLokasi INT FOREIGN KEY REFERENCES Lokasi(IdLokasi)
)

CREATE TABLE Tahapan(
    IdTahapan INT PRIMARY KEY,
    namaTahapan VARCHAR(30)
)

CREATE TABLE Vaksin(
    IdVaksin INT PRIMARY KEY,
    namaVaksin VARCHAR(30)
)

CREATE TABLE Sertifikat(
    IdSertifikat INT PRIMARY KEY,
    noDosis INT,
    tanggalVaksin DATE,
    IdVaksin INT FOREIGN KEY REFERENCES Vaksin(IdVaksin),
    IdLokasi INT FOREIGN KEY REFERENCES Lokasi(IdLokasi),
    IdM INT FOREIGN KEY REFERENCES Masyarakat(IdM)
)

CREATE TABLE Pendaftaran(
    IdP INT PRIMARY KEY,
    tanggalP DATE,
    statusP VARCHAR(30),
    IdM INT FOREIGN KEY REFERENCES Masyarakat(IdM),
    IdKegiatan INT FOREIGN KEY REFERENCES KegiatanVaksinasi(IdKegiatan)
)

CREATE TABLE Kesehatan(
    IdKesehatan INT PRIMARY KEY,
    komorbid VARCHAR(30),
    suhuTubuh INT,
    tanggalTerkenaCovid INT,
    tensi VARCHAR(10),
    IdM INT FOREIGN KEY REFERENCES Masyarakat(IdM)
)

CREATE TABLE Mengikuti(
    IdM INT PRIMARY KEY,
    IdKegiatan INT,
    jamAkhir TIME,
    jamAwal TIME,
    IdTahapan INT FOREIGN KEY REFERENCES Tahapan(IdTahapan),
    tanggal DATE
)

CREATE TABLE Memberikan(
    IdKegiatan INT PRIMARY KEY,
    IdVaksin INT
)

INSERT INTO Kota VALUES(1, "Jakarta");
INSERT INTO Kota VALUES(2, "Bandung");
INSERT INTO Kota VALUES(3, "Surabaya");

INSERT INTO Lokasi VALUES(1, "Lokasi1", 1);
INSERT INTO Lokasi VALUES(2, "Lokasi2", 1);
INSERT INTO Lokasi VALUES(3, "Lokasi3", 2);
INSERT INTO Lokasi VALUES(4, "Lokasi4", 2);
INSERT INTO Lokasi VALUES(5, "Lokasi5", 3);

INSERT INTO Masyarakat VALUES(1, "abcde@gmail.com", "08123412341", "Andy", "Jalan ABCD No. 1", 3576441280091810, "1988-10-12", "Pria");
INSERT INTO Masyarakat VALUES(2, "qwerty@gmail.com", "08771771811", "Bob", "Jalan Mangga No. 32", 35764380011810, "1977-12-21", "Pria");
INSERT INTO Masyarakat VALUES(3, "asdf@gmail.com", "085651616881", "Clara", "Jalan Jeruk No. 11", 3576443280095810, "1991-01-27", "Wanita");
INSERT INTO Masyarakat VALUES(4, "zxcv@gmail.com", "08122120992", "Dave", "Jalan Apel No. 20", 3176441288093810, "1999-04-06", "Pria");
INSERT INTO Masyarakat VALUES(5, "nmnmnmn@gmail.com", "08718818811", "Eve", "Jalan Nanas No. 10", 3276441283092810, "1993-11-25", "Wanita");
INSERT INTO Masyarakat VALUES(6, "opopopo@gmail.com", "08342121212", "Flora", "Jalan Pisang No. 66", 3666441280691860, "1980-07-02", "Wanita");
INSERT INTO Masyarakat VALUES(7, "jkjkjkjkjk@gmail.com", "08221122113", "Greg", "Jalan Jambu No. 8", 3626341280291860, "1989-06-11", "Pria");
INSERT INTO Masyarakat VALUES(8, "cdcdcdcdc@gmail.com", "08442421242", "Hardy", "Jalan Pepaya No. 9", 3996441280691060, "1969-08-13", "Pria");
INSERT INTO Masyarakat VALUES(9, "dfdfdfdfdf@gmail.com", "08991991911", "Intan", "Jalan Sirsak No. 23", 3060441280601860, "1990-10-20", "Wanita");
INSERT INTO Masyarakat VALUES(10, "wkwkwkwkwk@gmail.com", "08171772212", "Joko", "Jalan Manggis No. 31", 3116441210691860, "1996-11-01", "Pria");

INSERT INTO Tahapan VALUES(1, "pendaftaran");
INSERT INTO Tahapan VALUES(2, "konfirmasi penyelenggara");
INSERT INTO Tahapan VALUES(3, "pendaftaran ulang");
INSERT INTO Tahapan VALUES(4, "cek kesehatan");
INSERT INTO Tahapan VALUES(5, "pemberian vaksin");
INSERT INTO Tahapan VALUES(6, "cetak sertifikat");

INSERT INTO Vaksin VALUES(1, "Sinovac");
INSERT INTO Vaksin VALUES(2, "Pfizer");
INSERT INTO Vaksin VALUES(3, "Astra Zeneca");

INSERT INTO Penyelenggara VALUES(1, "Penyelenggara1", "123456", 1);
INSERT INTO Penyelenggara VALUES(2, "Penyelenggara2", "12456", 1);
INSERT INTO Penyelenggara VALUES(3, "Penyelenggara3", "12345", 2);
INSERT INTO Penyelenggara VALUES(4, "Penyelenggara4", "123456", 2);
INSERT INTO Penyelenggara VALUES(5, "Penyelenggara5", "12456", 3);
INSERT INTO Penyelenggara VALUES(6, "Penyelenggara6", "12345", 4);
INSERT INTO Penyelenggara VALUES(7, "Penyelenggara7", "123456", 5);

INSERT INTO Sertifikat VALUES(1,1,"2021-12-29",1,3,1); 
INSERT INTO Sertifikat VALUES(2,2,"2022-01-28",1,5,1); 
INSERT INTO Sertifikat VALUES(3,1,"2021-12-29",1,3,2); 
INSERT INTO Sertifikat VALUES(4,1,"2022-01-01",2,4,3); 
INSERT INTO Sertifikat VALUES(5,2,"2022-02-01",2,1,3); 
INSERT INTO Sertifikat VALUES(6,1,"2022-02-10",1,2,4); 
INSERT INTO Sertifikat VALUES(7,1,"2021-11-01",1,3,5); 
INSERT INTO Sertifikat VALUES(8,1,"2022-01-01",2,4,6); 
INSERT INTO Sertifikat VALUES(9,2,"2022-02-01",2,1,6); 
INSERT INTO Sertifikat VALUES(10,1,"2022-01-12",1,2,7); 
INSERT INTO Sertifikat VALUES(11,1,"2022-02-10",1,2,8);
INSERT INTO Sertifikat VALUES(12,1,"2021-11-01",1,3,9);
INSERT INTO Sertifikat VALUES(13,2,"2021-12-29",1,3,9); 
INSERT INTO Sertifikat VALUES(14,1,"2022-01-01",2,4,10); 
-- belum ada yang Astra, buat booster saja

INSERT INTO KegiatanVaksinasi VALUES(1, 100, '10:30', "2021-11-01",3,1);
INSERT INTO KegiatanVaksinasi VALUES(2, 150, '13:30', "2021-12-29",3,2);
INSERT INTO KegiatanVaksinasi VALUES(3, 50, '11:30', "2022-01-01",4,3);
INSERT INTO KegiatanVaksinasi VALUES(4, 200, '09:00', "2022-01-12",2,4);
INSERT INTO KegiatanVaksinasi VALUES(5, 120, '07:30', "2022-01-28",5,5);
INSERT INTO KegiatanVaksinasi VALUES(6, 100, '11:15', "2022-02-01",1,6);
INSERT INTO KegiatanVaksinasi VALUES(7, 90, '10:00', "2022-02-10",2,7);
-- yang akan datang belum dibuat

INSERT INTO Memberikan VALUES(1,2);
INSERT INTO Memberikan VALUES(2,2);
INSERT INTO Memberikan VALUES(3,1);
INSERT INTO Memberikan VALUES(4,1);
INSERT INTO Memberikan VALUES(5,1);
INSERT INTO Memberikan VALUES(6,2);
INSERT INTO Memberikan VALUES(7,1);

-- pendaftaran, kesehatan, mengikuti belum ada recordnya