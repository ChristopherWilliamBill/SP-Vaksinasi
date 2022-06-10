drop table Memberikan
drop table Mengikuti
drop table Kesehatan
drop table Pendaftaran
drop table Sertifikat
drop table Vaksin
drop table Tahapan
drop table KegiatanVaksinasi
drop table Penyelenggara
drop table Lokasi
drop table Kota
drop table Provinsi
drop table Masyarakat

create table Masyarakat (
	IdM INT IDENTITY(1,1) PRIMARY KEY,
	email VARCHAR(50),
	noHP VARCHAR(50),
	nama VARCHAR(50),
	alamat VARCHAR(50),
	NIK VARCHAR(50),
	tglLahir DATE,
	jenisKelamin VARCHAR(50)
);

CREATE TABLE Provinsi(
    IdProvinsi INT IDENTITY(1,1) PRIMARY KEY,
    namaProvinsi VARCHAR(50)
)

CREATE TABLE Kota(
    IdKota INT IDENTITY(1,1) PRIMARY KEY,
    namaKota VARCHAR(50),
    IdProvinsi INT FOREIGN KEY REFERENCES Provinsi(IdProvinsi)
)

CREATE TABLE Lokasi(
    IdLokasi INT IDENTITY(1,1) PRIMARY KEY,
    namaLokasi VARCHAR(50),
    IdKota INT FOREIGN KEY REFERENCES Kota(IdKota)
)



CREATE TABLE Penyelenggara(
    IdPenyelenggara INT IDENTITY(1,1) PRIMARY KEY,
    nama VARCHAR(50),
    urutanTahapan VARCHAR(15)
)

CREATE TABLE KegiatanVaksinasi(
    IdKegiatan INT IDENTITY(1,1) PRIMARY KEY,
    kuota INT,
    waktu TIME,
    tanggal DATE,
    IdLokasi INT FOREIGN KEY REFERENCES Lokasi(IdLokasi),
    IdPenyelenggara INT FOREIGN KEY REFERENCES Penyelenggara(IdPenyelenggara)
)



CREATE TABLE Tahapan(
    IdTahapan INT IDENTITY(1,1) PRIMARY KEY,
    namaTahapan VARCHAR(30)
)

CREATE TABLE Vaksin(
    IdVaksin INT IDENTITY(1,1) PRIMARY KEY,
    namaVaksin VARCHAR(30)
)

CREATE TABLE Sertifikat(
    IdSertifikat INT IDENTITY(1,1) PRIMARY KEY,
    noDosis INT,
    IdM INT FOREIGN KEY REFERENCES Masyarakat(IdM),
	IdKegiatan INT FOREIGN KEY REFERENCES KegiatanVaksinasi(IdKegiatan)
)

CREATE TABLE Pendaftaran(
    IdP INT IDENTITY(1,1) PRIMARY KEY,
    tanggalP DATE,
    statusP VARCHAR(100),
    IdM INT FOREIGN KEY REFERENCES Masyarakat(IdM),
    IdKegiatan INT FOREIGN KEY REFERENCES KegiatanVaksinasi(IdKegiatan)
)

CREATE TABLE Kesehatan(
    IdKesehatan INT IDENTITY(1,1) PRIMARY KEY,
    komorbid VARCHAR(30),
    suhuTubuh INT,
    tanggalTerkenaCovid DATE,
    tensi VARCHAR(10),
    IdM INT FOREIGN KEY REFERENCES Masyarakat(IdM)
)

CREATE TABLE Mengikuti(
    IdM INT,
    IdKegiatan INT,
    jamAwal TIME,
    jamAkhir TIME,
    IdTahapan INT FOREIGN KEY REFERENCES Tahapan(IdTahapan)
)

CREATE TABLE Memberikan(
    IdKegiatan INT IDENTITY(1,1) PRIMARY KEY,
    IdVaksin INT
)


INSERT INTO PROVINSI VALUES (1,'Jawa Barat');

INSERT INTO Kota (IdKota,namaKota,IdProvinsi)
VALUES
  (1,'Cirebon',1),
  (2,'Bandung',1);


insert into Lokasi (IdLokasi, namaLokasi, IdKota) values (1, '77576 Merchant Way', 1);
insert into Lokasi (IdLokasi, namaLokasi, IdKota) values (2, '8 Morning Junction', 1);
insert into Lokasi (IdLokasi, namaLokasi, IdKota) values (3, '485 Bartelt Way', 2);
insert into Lokasi (IdLokasi, namaLokasi, IdKota) values (4, '71927 Sloan Circle', 2);



INSERT INTO Masyarakat VALUES(1,'Alexander_Coleman4308@cispeto.com','3-863-755-8817','Alexander Coleman','Baltic  Avenue, 9875',1652048539,'1995-08-26 20:12:38Z','Male');
INSERT INTO Masyarakat VALUES(2,'Sharon_Patel2563@brety.org','3-670-805-1013','Sharon Patel','Wakley   Road, 3945',1197769431,'1989-11-15 17:07:43Z','Female');
INSERT INTO Masyarakat VALUES(3,'Noah_Miller52@supunk.biz','2-535-814-3547','Noah Miller','Pine Lane, 558',1887672369,'1984-06-14 02:25:51Z','Male');
INSERT INTO Masyarakat VALUES(4,'Hayden_Samuel2082@supunk.biz','7-060-845-7553','Hayden Samuel','Addison  Hill, 1313',90799864,'1998-11-03 17:21:54Z','Male');
INSERT INTO Masyarakat VALUES(5,'Belinda_Rowlands6194@yahoo.com','6-421-737-2100','Belinda Rowlands','Linda   Route, 7130',2143152866,'1985-11-03 00:17:25Z','Female');
INSERT INTO Masyarakat VALUES(6,'Bob_Holt9158@bungar.biz','7-485-600-1028','Bob Holt','Zealand Rue, 8640',1747128310,'1992-09-13 22:24:02Z','Male');
INSERT INTO Masyarakat VALUES(7,'Melody_Funnell9234@bretoux.com','5-458-011-3188','Melody Funnell','Littlebury  Way, 4180',1986076401,'1981-03-20 13:22:26Z','Female');
INSERT INTO Masyarakat VALUES(8,'Callie_Bright2455@deons.tech','0-020-647-8204','Callie Bright','West Street, 9873',1889122910,'1997-02-27 20:26:55Z','Female');
INSERT INTO Masyarakat VALUES(9,'Tara_Chester9741@qater.org','5-818-220-3780','Tara Chester','Fairholt   Route, 4979',1184303735,'1982-07-02 21:16:19Z','Female');
INSERT INTO Masyarakat VALUES(10,'Eryn_Brown3256@nanoff.biz','0-840-360-2104','Eryn Brown','Durham Road, 9986',454749781,'1987-08-28 00:21:00Z','Female');
INSERT INTO Masyarakat VALUES(11,'Jazmin_Tait4838@twace.org','6-063-125-7623','Jazmin Tait','Geary   Route, 4500',1510590737,'1998-12-15 14:11:23Z','Female');
INSERT INTO Masyarakat VALUES(12,'Piper_Wright5351@eirey.tech','5-032-248-0755','Piper Wright','Union  Lane, 9674',320101216,'1998-01-27 17:17:43Z','Female');
INSERT INTO Masyarakat VALUES(13,'Rick_Daniells7149@atink.com','2-344-577-1142','Rick Daniells','Baylis  Way, 5209',534395856,'1989-06-03 13:30:47Z','Male');
INSERT INTO Masyarakat VALUES(14,'Mayleen_Everett5511@dionrab.com','6-541-400-5081','Mayleen Everett','Marischal  Avenue, 1991',397067238,'1995-11-10 06:46:24Z','Female');
INSERT INTO Masyarakat VALUES(15,'Aeris_Rehman9830@bungar.biz','1-010-551-8481','Aeris Rehman','Burton  Drive, 6328',1040579203,'1982-12-29 13:32:35Z','Female');
INSERT INTO Masyarakat VALUES(16,'Kendra_Jackson9869@bungar.biz','1-878-357-5138','Kendra Jackson','Bond Rue, 4230',1482430937,'1980-09-27 09:02:15Z','Female');
INSERT INTO Masyarakat VALUES(17,'Sloane_Bryson8998@corti.com','0-413-806-1046','Sloane Bryson','Calshot   Alley, 247',1451616154,'1987-11-22 16:45:16Z','Female');
INSERT INTO Masyarakat VALUES(18,'Daniel_Allen2933@mafthy.com','5-003-386-8330','Daniel Allen','Unwin  Vale, 3260',1424811026,'1983-12-16 19:34:57Z','Male');
INSERT INTO Masyarakat VALUES(19,'Chadwick_Raven9338@liret.org','6-472-313-7728','Chadwick Raven','Glenwood Pass, 6308',989211752,'1998-09-30 09:36:40Z','Male');
INSERT INTO Masyarakat VALUES(20,'Jazmin_Clarkson9406@supunk.biz','2-316-820-1153','Jazmin Clarkson','Gathorne   Hill, 856',1772299392,'1993-06-12 18:21:02Z','Female');
INSERT INTO Masyarakat VALUES(21,'Britney_Lunt4319@deavo.com','2-626-420-8807','Britney Lunt','Virginia Street, 9089',2094201897,'1997-08-28 13:33:56Z','Female');
INSERT INTO Masyarakat VALUES(22,'Denis_Oswald5086@vetan.org','8-134-813-6854','Denis Oswald','Hampden  Grove, 6400',1203593539,'1986-06-08 22:37:00Z','Male');
INSERT INTO Masyarakat VALUES(23,'Willow_Zaoui214@womeona.net','8-482-631-7050','Willow Zaoui','Castlereagh   Route, 178',184414367,'1989-06-06 11:14:16Z','Female');
INSERT INTO Masyarakat VALUES(24,'Carissa_Wooldridge5256@qater.org','0-141-126-3805','Carissa Wooldridge','Western   Grove, 2782',1706717490,'1986-11-30 21:22:00Z','Female');
INSERT INTO Masyarakat VALUES(25,'Carrie_Parker1010@guentu.biz','7-314-375-4351','Carrie Parker','Bendall   Rue, 8654',1454903139,'1986-11-18 07:23:00Z','Female');
INSERT INTO Masyarakat VALUES(26,'Valentina_Roth755@nanoff.biz','1-681-245-3228','Valentina Roth','Lonsdale  Crossroad, 5774',1646625416,'2000-01-19 21:01:38Z','Female');
INSERT INTO Masyarakat VALUES(27,'Quinn_Addison6910@dionrab.com','2-157-773-0320','Quinn Addison','Calderwood   Boulevard, 1851',1857634491,'1993-04-12 05:22:31Z','Female');
INSERT INTO Masyarakat VALUES(28,'Alessia_Allwood7672@ubusive.com','1-020-481-2082','Alessia Allwood','Canal  Way, 4395',1037232605,'1991-08-16 10:30:20Z','Female');
INSERT INTO Masyarakat VALUES(29,'Blake_Lambert5167@acrit.org','3-882-273-7466','Blake Lambert','Carltoun   Road, 8112',1492421131,'1997-01-06 10:15:14Z','Female');
INSERT INTO Masyarakat VALUES(30,'Rick_Strong207@typill.biz','3-845-041-7610','Rick Strong','Central  Lane, 7688',1969301499,'1999-09-26 02:10:42Z','Male');
INSERT INTO Masyarakat VALUES(31,'Tyson_Notman447@acrit.org','7-356-578-8488','Tyson Notman','Gatonby   Tunnel, 4102',1711855933,'1992-01-09 06:15:40Z','Male');
INSERT INTO Masyarakat VALUES(32,'Destiny_Morris1667@qater.org','5-312-281-3221','Destiny Morris','Elba  Alley, 981',1448433928,'1981-11-13 06:23:48Z','Female');
INSERT INTO Masyarakat VALUES(33,'Rocco_Gunn5201@nanoff.biz','1-106-627-3703','Rocco Gunn','Calverley  Rue, 1777',2052139810,'1994-07-12 10:02:09Z','Male');
INSERT INTO Masyarakat VALUES(34,'Maxwell_Silva3672@gembat.biz','2-160-666-6116','Maxwell Silva','Camberwell  Rue, 4640',2105067252,'1987-03-16 03:14:02Z','Male');
INSERT INTO Masyarakat VALUES(35,'Andrea_Everett7715@kideod.biz','5-754-100-5540','Andrea Everett','Elystan  Grove, 834',1500259391,'1993-11-01 01:33:02Z','Female');
INSERT INTO Masyarakat VALUES(36,'Erick_Cooper1400@nimogy.biz','7-813-768-8418','Erick Cooper','Carltoun   Street, 9326',1876385694,'1995-01-18 12:05:00Z','Male');
INSERT INTO Masyarakat VALUES(37,'Matthew_Lynch7326@bretoux.com','2-014-871-4730','Matthew Lynch','Wadham  Tunnel, 6922',553969577,'1982-09-05 05:51:55Z','Male');
INSERT INTO Masyarakat VALUES(38,'Paula_Chapman9186@gompie.com','8-651-407-3056','Paula Chapman','Berry  Grove, 6052',1423151756,'1996-01-22 14:23:33Z','Female');
INSERT INTO Masyarakat VALUES(39,'Stacy_Antcliff2685@qater.org','8-723-633-2880','Stacy Antcliff','Cockspur  Tunnel, 3066',1493797461,'1985-09-16 11:09:06Z','Female');
INSERT INTO Masyarakat VALUES(40,'Kurt_Porter5961@womeona.net','8-407-662-2341','Kurt Porter','Queen Drive, 3786',1823597181,'1986-02-16 11:32:36Z','Male');
INSERT INTO Masyarakat VALUES(41,'Noemi_Glynn2600@typill.biz','3-121-415-5768','Noemi Glynn','Kingly  Route, 1709',1455588851,'1996-01-02 07:55:44Z','Female');
INSERT INTO Masyarakat VALUES(42,'Michelle_Neville9528@sheye.org','7-253-353-7034','Michelle Neville','Heritage Alley, 8319',1280114182,'1991-09-17 21:06:37Z','Female');
INSERT INTO Masyarakat VALUES(43,'David_Penn2930@irrepsy.com','7-331-072-3368','David Penn','Lake Tunnel, 4914',1946321824,'1992-10-16 11:21:48Z','Male');
INSERT INTO Masyarakat VALUES(44,'Sonya_Blythe3478@grannar.com','6-317-767-3852','Sonya Blythe','Adams  Rue, 9361',1104607230,'1984-09-29 15:39:09Z','Female');
INSERT INTO Masyarakat VALUES(45,'Carmella_Myatt5503@grannar.com','4-654-652-8534','Carmella Myatt','Coley  Hill, 6172',118495267,'1981-06-23 14:22:55Z','Female');
INSERT INTO Masyarakat VALUES(46,'Denis_Mcleod3324@grannar.com','0-587-807-5238','Denis Mcleod','Vincent  Crossroad, 1899',79311344,'1999-11-30 01:05:34Z','Male');
INSERT INTO Masyarakat VALUES(47,'Sage_Watson2145@kideod.biz','8-266-852-2850','Sage Watson','Bletchley   Vale, 6191',1589564550,'1994-04-10 13:18:14Z','Female');
INSERT INTO Masyarakat VALUES(48,'Mike_Nicholls9706@zorer.org','4-672-484-6387','Mike Nicholls','Egerton  Lane, 2804',517536193,'1994-01-19 01:51:33Z','Male');
INSERT INTO Masyarakat VALUES(49,'Marina_Rixon3260@ubusive.com','3-772-610-6737','Marina Rixon','Abbotswell  Lane, 4326',683894220,'1990-06-26 13:42:37Z','Female');
INSERT INTO Masyarakat VALUES(50,'Tess_Yarlett4920@jiman.org','6-850-152-4801','Tess Yarlett','Longleigh   Avenue, 7346',453775723,'1994-06-05 08:02:51Z','Female');
INSERT INTO Masyarakat VALUES(51,'Leah_Parsons8785@elnee.tech','0-177-666-2882','Leah Parsons','Wager   Rue, 6250',469770198,'1991-12-18 21:53:20Z','Female');
INSERT INTO Masyarakat VALUES(52,'Savannah_Willis8447@bauros.biz','1-515-044-6513','Savannah Willis','Colombo   Rue, 2735',1420902404,'1987-08-06 09:29:44Z','Female');
INSERT INTO Masyarakat VALUES(53,'Fred_Woods843@ubusive.com','2-203-581-8040','Fred Woods','Caldwell   Pass, 9308',1239454168,'1997-02-20 16:04:28Z','Male');
INSERT INTO Masyarakat VALUES(54,'Adalind_Lakey120@tonsy.org','3-523-442-0272','Adalind Lakey','Coleman  Grove, 9418',1769645208,'1985-02-03 10:31:44Z','Female');
INSERT INTO Masyarakat VALUES(55,'Olivia_Mcneill3337@muall.tech','4-586-185-0123','Olivia Mcneill','York Way, 5799',2101603602,'1997-09-07 12:26:08Z','Female');
INSERT INTO Masyarakat VALUES(56,'Dani_Allen3050@sveldo.biz','6-676-350-8607','Dani Allen','Arthur  Boulevard, 753',387034041,'1995-01-31 06:15:37Z','Female');
INSERT INTO Masyarakat VALUES(57,'Harriet_Ward7339@supunk.biz','2-232-114-5541','Harriet Ward','Calderwood   Boulevard, 7114',710850297,'1986-08-08 01:56:32Z','Female');
INSERT INTO Masyarakat VALUES(58,'Alexia_Gray3226@gmail.com','1-044-777-1313','Alexia Gray','Cockspur  Rue, 5067',362197697,'1987-09-19 14:41:33Z','Female');
INSERT INTO Masyarakat VALUES(59,'Doug_Garner9652@cispeto.com','1-735-708-0781','Doug Garner','Kinglake  Vale, 7869',808844432,'1988-07-27 12:55:29Z','Male');
INSERT INTO Masyarakat VALUES(60,'Hazel_Clarkson7218@naiker.biz','8-476-324-4860','Hazel Clarkson','Walnut Hill, 5769',1790335847,'1990-02-04 12:46:30Z','Female');
INSERT INTO Masyarakat VALUES(61,'Aiden_Tutton9487@gembat.biz','4-006-763-6775','Aiden Tutton','Eaglet  Route, 5324',500210037,'1993-11-19 10:10:06Z','Male');
INSERT INTO Masyarakat VALUES(62,'Ellen_Cox3361@typill.biz','1-580-335-7471','Ellen Cox','Camelot   Crossroad, 1494',116489681,'1992-08-12 16:46:41Z','Female');
INSERT INTO Masyarakat VALUES(63,'Cherish_Torres7456@fuliss.net','8-273-146-6760','Cherish Torres','South Way, 3571',1177701291,'2000-03-19 05:51:39Z','Female');
INSERT INTO Masyarakat VALUES(64,'Harry_Chadwick1561@extex.org','2-156-383-1040','Harry Chadwick','Balfour    Avenue, 3178',1369892405,'1990-11-06 16:00:27Z','Male');
INSERT INTO Masyarakat VALUES(65,'Henry_Carter2463@vetan.org','1-251-622-5382','Henry Carter','Cloth  Drive, 4449',675668363,'1994-11-05 06:34:49Z','Male');
INSERT INTO Masyarakat VALUES(66,'Jules_Pearson3094@famism.biz','4-552-726-3126','Jules Pearson','Apollo  Road, 2882',1689202700,'1996-04-11 02:08:25Z','Female');
INSERT INTO Masyarakat VALUES(67,'Fred_Radley7809@twace.org','7-458-336-2116','Fred Radley','Battis   Boulevard, 4954',727229167,'1991-09-30 13:51:10Z','Male');
INSERT INTO Masyarakat VALUES(68,'Jayden_Dyson6231@grannar.com','1-512-470-6106','Jayden Dyson','Camley   Avenue, 7277',346140317,'1980-08-28 11:52:04Z','Male');
INSERT INTO Masyarakat VALUES(69,'Joseph_Wellington7672@corti.com','8-737-141-8327','Joseph Wellington','Hammersmith  Road, 5819',1284543056,'1993-12-07 22:09:27Z','Male');
INSERT INTO Masyarakat VALUES(70,'Bernadette_Burge3460@ovock.tech','3-321-438-3758','Bernadette Burge','Emden   Drive, 9939',1092028706,'1991-11-02 03:10:27Z','Female');

--10 vaksin 3, 20 vaksin 2, 20 vaksin 1, 10 ditolak, 10 baru daftar


INSERT INTO Tahapan VALUES(1, 'pendaftaran');
INSERT INTO Tahapan VALUES(2, 'konfirmasi penyelenggara');
INSERT INTO Tahapan VALUES(3, 'pendaftaran ulang');
INSERT INTO Tahapan VALUES(4, 'cek kesehatan');
INSERT INTO Tahapan VALUES(5, 'pemberian vaksin');
INSERT INTO Tahapan VALUES(6, 'cetak sertifikat');

INSERT INTO Vaksin VALUES(1, 'Sinovac');
INSERT INTO Vaksin VALUES(2, 'Pfizer');
INSERT INTO Vaksin VALUES(3, 'Moderna');

insert into Penyelenggara (IdPenyelenggara, nama, urutanTahapan) values (1, 'Dabfeed', '123456');
insert into Penyelenggara (IdPenyelenggara, nama, urutanTahapan) values (2, 'Kazio', '12345');


insert into KegiatanVaksinasi (IdKegiatan, kuota, waktu, tanggal, IdLokasi, IdPenyelenggara) values (1, 50, '9:00', '2021-06-01', 1, 1);
insert into KegiatanVaksinasi (IdKegiatan, kuota, waktu, tanggal, IdLokasi, IdPenyelenggara) values (2, 50, '9:00', '2021-08-15', 2, 1);
insert into KegiatanVaksinasi (IdKegiatan, kuota, waktu, tanggal, IdLokasi, IdPenyelenggara) values (3, 50, '9:00', '2021-10-02', 3, 2);
insert into KegiatanVaksinasi (IdKegiatan, kuota, waktu, tanggal, IdLokasi, IdPenyelenggara) values (4, 50, '9:00', '2021-12-18', 4, 2);
insert into KegiatanVaksinasi (IdKegiatan, kuota, waktu, tanggal, IdLokasi, IdPenyelenggara) values (5, 50, '9:00', '2022-06-30', 4, 1);


-- belum ada yang Astra, buat booster saja
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (1, 1, 1, 1);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (2, 1, 2, 1);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (3, 1, 3, 1);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (4, 1, 4, 1);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (5, 1, 5, 1);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (6, 1, 6, 1);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (7, 1, 7, 1);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (8, 1, 8, 1);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (9, 1, 9, 1);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (10, 1, 10, 1);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (11, 1, 11, 1);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (12, 1, 12, 1);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (13, 1, 13, 1);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (14, 1, 14, 1);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (15, 1, 15, 1);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (16, 1, 16, 1);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (17, 1, 17, 1);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (18, 1, 18, 1);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (19, 1, 19, 1);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (20, 1, 20, 1);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (21, 1, 21, 1);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (22, 1, 22, 1);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (23, 1, 23, 1);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (24, 1, 24, 1);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (25, 1, 25, 1);

insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (26, 1, 26, 2);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (27, 1, 27, 2);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (28, 1, 28, 2);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (29, 1, 29, 2);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (30, 1, 30, 2);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (31, 1, 31, 2);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (32, 1, 32, 2);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (33, 1, 33, 2);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (34, 1, 34, 2);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (35, 1, 35, 2);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (36, 1, 36, 2);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (37, 1, 37, 2);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (38, 1, 38, 2);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (39, 1, 39, 2);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (40, 1, 40, 2);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (41, 1, 41, 2);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (42, 1, 42, 2);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (43, 1, 43, 2);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (44, 1, 44, 2);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (45, 1, 45, 2);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (46, 1, 46, 2);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (47, 1, 47, 2);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (48, 1, 48, 2);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (49, 1, 49, 2);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (50, 1, 50, 2);


--dosis 2

insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (51, 2, 1, 2);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (52, 2, 2, 2);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (53, 2, 3, 2);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (54, 2, 4, 2);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (55, 2, 5, 2);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (56, 2, 6, 2);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (57, 2, 7, 2);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (58, 2, 8, 2);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (59, 2, 9, 2);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (60, 2, 10, 2);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (61, 2, 11, 2);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (62, 2, 12, 2);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (63, 2, 13, 2);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (64, 2, 14, 2);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (65, 2, 15, 2);

insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (66, 2, 26, 3);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (67, 2, 27, 3);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (68, 2, 28, 3);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (69, 2, 29, 3);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (70, 2, 30, 3);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (71, 2, 31, 3);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (72, 2, 32, 3);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (73, 2, 33, 3);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (74, 2, 34, 3);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (75, 2, 35, 3);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (76, 2, 36, 3);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (77, 2, 37, 3);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (78, 2, 38, 3);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (79, 2, 39, 3);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (80, 2, 40, 3);

--dosis 3

insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (81, 3, 1, 3);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (82, 3, 2, 3);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (83, 3, 3, 3);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (84, 3, 4, 3);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (85, 3, 5, 3);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (86, 3, 26, 4);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (87, 3, 27, 4);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (88, 3, 28, 4);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (89, 3, 29, 4);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (90, 3, 30, 4);


--Memberikan

insert into Memberikan (IdKegiatan, IdVaksin) values (1,1);
insert into Memberikan (IdKegiatan, IdVaksin) values (2,3);
insert into Memberikan (IdKegiatan, IdVaksin) values (3,3);
insert into Memberikan (IdKegiatan, IdVaksin) values (4,2);
insert into Memberikan (IdKegiatan, IdVaksin) values (4,1);
insert into Memberikan (IdKegiatan, IdVaksin) values (5,2);

--pendaftaran

--dosis1
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (1, 'Diterima', 1, 1, '09/26/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (2, 'Diterima', 2, 1, '09/22/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (3, 'Diterima', 3, 1, '09/24/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (4, 'Diterima', 4, 1, '09/30/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (5, 'Diterima', 5, 1, '09/15/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (6, 'Diterima', 6, 1, '09/2/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (7, 'Diterima', 7, 1, '09/13/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (8, 'Diterima', 8, 1, '09/1/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (9, 'Diterima', 9, 1, '09/1/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (10, 'Diterima', 10, 1, '09/26/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (11, 'Diterima', 11, 1, '09/15/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (12, 'Diterima', 12, 1, '09/21/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (13, 'Diterima', 13, 1, '09/8/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (14, 'Diterima', 14, 1, '09/16/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (15, 'Diterima', 15, 1, '09/6/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (16, 'Diterima', 16, 1, '09/21/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (17, 'Diterima', 17, 1, '09/27/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (18, 'Diterima', 18, 1, '09/19/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (19, 'Diterima', 19, 1, '09/2/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (20, 'Diterima', 20, 1, '09/7/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (21, 'Diterima', 21, 1, '09/29/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (22, 'Diterima', 22, 1, '09/30/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (23, 'Diterima', 23, 1, '09/26/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (24, 'Diterima', 24, 1, '09/28/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (25, 'Diterima', 25, 1, '09/1/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (26, 'Diterima', 26, 2, '09/27/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (27, 'Diterima', 27, 2, '09/4/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (28, 'Diterima', 28, 2, '09/15/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (29, 'Diterima', 29, 2, '09/25/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (30, 'Diterima', 30, 2, '09/4/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (31, 'Diterima', 31, 2, '09/17/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (32, 'Diterima', 32, 2, '09/19/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (33, 'Diterima', 33, 2, '09/4/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (34, 'Diterima', 34, 2, '09/23/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (35, 'Diterima', 35, 2, '09/12/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (36, 'Diterima', 36, 2, '09/8/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (37, 'Diterima', 37, 2, '09/2/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (38, 'Diterima', 38, 2, '09/20/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (39, 'Diterima', 39, 2, '09/10/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (40, 'Diterima', 40, 2, '09/6/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (41, 'Diterima', 41, 2, '09/12/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (42, 'Diterima', 42, 2, '09/24/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (43, 'Diterima', 43, 2, '09/7/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (44, 'Diterima', 44, 2, '09/11/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (45, 'Diterima', 45, 2, '09/27/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (46, 'Diterima', 46, 2, '09/7/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (47, 'Diterima', 47, 2, '09/15/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (48, 'Diterima', 48, 2, '09/11/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (49, 'Diterima', 49, 2, '09/20/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (50, 'Diterima', 50, 2, '09/11/2021');

--dosis2

insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (51, 'Diterima', 1, 2, '09/26/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (52, 'Diterima', 2, 2, '09/8/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (53, 'Diterima', 3, 2, '09/22/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (54, 'Diterima', 4, 2, '09/7/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (55, 'Diterima', 5, 2, '09/11/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (56, 'Diterima', 6, 2, '09/3/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (57, 'Diterima', 7, 2, '09/4/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (58, 'Diterima', 8, 2, '09/28/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (59, 'Diterima', 9, 2, '09/12/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (60, 'Diterima', 10, 2, '09/9/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (61, 'Diterima', 11, 2, '09/21/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (62, 'Diterima', 12, 2, '09/18/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (63, 'Diterima', 13, 2, '09/27/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (64, 'Diterima', 14, 2, '09/6/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (65, 'Diterima', 15, 2, '09/22/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (66, 'Diterima', 26, 3, '09/24/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (67, 'Diterima', 27, 3, '09/5/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (68, 'Diterima', 28, 3, '09/30/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (69, 'Diterima', 29, 3, '09/11/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (70, 'Diterima', 30, 3, '09/11/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (71, 'Diterima', 31, 3, '09/28/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (72, 'Diterima', 32, 3, '09/29/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (73, 'Diterima', 33, 3, '09/13/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (74, 'Diterima', 34, 3, '09/5/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (75, 'Diterima', 35, 3, '09/12/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (76, 'Diterima', 36, 3, '09/8/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (77, 'Diterima', 37, 3, '09/16/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (78, 'Diterima', 38, 3, '09/4/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (79, 'Diterima', 39, 3, '09/6/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (80, 'Diterima', 40, 3, '09/2/2021');

--dosis 3

insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (81, 'Diterima', 1, 3, '09/6/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (82, 'Diterima', 2, 3, '09/30/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (83, 'Diterima', 3, 3, '09/3/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (84, 'Diterima', 4, 3, '09/24/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (85, 'Diterima', 5, 3, '09/17/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (86, 'Diterima', 26, 4, '09/30/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (87, 'Diterima', 27, 4, '09/30/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (88, 'Diterima', 28, 4, '09/15/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (89, 'Diterima', 29, 4, '09/8/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (90, 'Diterima', 30, 4, '09/29/2021');

--baru daftar
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (91, 'Menunggu Konfirmasi', 51, 5, '09/4/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (92, 'Menunggu Konfirmasi', 52, 5, '09/28/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (93, 'Menunggu Konfirmasi', 53, 5, '09/21/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (94, 'Menunggu Konfirmasi', 54, 5, '09/22/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (95, 'Menunggu Konfirmasi', 55, 5, '09/16/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (96, 'Menunggu Konfirmasi', 56, 5, '09/17/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (97, 'Menunggu Konfirmasi', 57, 5, '09/3/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (98, 'Menunggu Konfirmasi', 58, 5, '09/6/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (99, 'Menunggu Konfirmasi', 59, 5, '09/11/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (100, 'Menunggu Konfirmasi', 60, 5, '09/13/2021');

--ditolak
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (101, 'Ditolak', 61, 1, '09/26/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (102, 'Ditolak', 62, 1, '09/22/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (103, 'Ditolak', 63, 2, '09/24/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (104, 'Ditolak', 64, 2, '09/30/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (105, 'Ditolak', 65, 3, '09/15/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (106, 'Ditolak', 66, 3, '09/2/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (107, 'Ditolak', 67, 4, '09/13/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (108, 'Ditolak', 68, 4, '09/1/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (109, 'Ditolak', 69, 4, '09/1/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (110, 'Ditolak', 70, 4, '09/26/2021');


--mengikuti
-- kegiatan 1
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (1,1,'9:15','9:36',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (2,1,'9:00','9:49',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (3,1,'9:29','9:36',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (4,1,'9:27','9:55',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (5,1,'9:10','9:44',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (6,1,'9:15','9:40',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (7,1,'9:01','9:52',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (8,1,'9:18','9:39',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (9,1,'9:23','9:41',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (10,1,'9:29','9:37',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (11,1,'9:19','9:51',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (12,1,'9:25','9:41',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (13,1,'9:16','9:34',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (14,1,'9:19','9:48',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (15,1,'9:14','9:39',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (16,1,'9:10','9:53',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (17,1,'9:07','9:51',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (18,1,'9:24','9:35',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (19,1,'9:11','9:45',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (20,1,'9:22','9:50',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (21,1,'9:03','9:45',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (22,1,'9:11','9:45',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (23,1,'9:29','9:31',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (24,1,'9:27','9:59',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (25,1,'9:00','9:48',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (1,1,'10:28','10:32',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (2,1,'10:02','10:57',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (3,1,'10:12','10:53',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (4,1,'10:07','10:35',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (5,1,'10:23','10:32',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (6,1,'10:03','10:36',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (7,1,'10:06','10:59',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (8,1,'10:19','10:35',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (9,1,'10:00','10:57',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (10,1,'10:06','10:38',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (11,1,'10:27','10:43',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (12,1,'10:02','10:52',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (13,1,'10:27','10:59',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (14,1,'10:29','10:40',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (15,1,'10:23','10:40',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (16,1,'10:02','10:44',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (17,1,'10:09','10:36',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (18,1,'10:09','10:51',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (19,1,'10:24','10:51',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (20,1,'10:05','10:54',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (21,1,'10:19','10:43',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (22,1,'10:02','10:42',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (23,1,'10:10','10:48',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (24,1,'10:01','10:53',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (25,1,'10:26','10:44',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (1,1,'11:23','11:31',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (2,1,'11:06','11:45',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (3,1,'11:08','11:49',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (4,1,'11:12','11:47',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (5,1,'11:01','11:48',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (6,1,'11:17','11:48',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (7,1,'11:19','11:48',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (8,1,'11:03','11:37',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (9,1,'11:16','11:30',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (10,1,'11:03','11:55',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (11,1,'11:06','11:42',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (12,1,'11:02','11:53',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (13,1,'11:29','11:51',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (14,1,'11:27','11:58',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (15,1,'11:10','11:53',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (16,1,'11:04','11:46',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (17,1,'11:08','11:54',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (18,1,'11:19','11:32',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (19,1,'11:07','11:53',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (20,1,'11:01','11:44',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (21,1,'11:01','11:33',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (22,1,'11:11','11:58',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (23,1,'11:10','11:42',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (24,1,'11:06','11:56',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (25,1,'11:00','11:52',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (1,1,'12:12','12:47',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (2,1,'12:23','12:35',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (3,1,'12:05','12:51',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (4,1,'12:17','12:31',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (5,1,'12:23','12:34',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (6,1,'12:02','12:43',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (7,1,'12:27','12:55',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (8,1,'12:21','12:36',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (9,1,'12:01','12:30',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (10,1,'12:01','12:35',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (11,1,'12:12','12:43',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (12,1,'12:21','12:58',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (13,1,'12:24','12:53',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (14,1,'12:04','12:30',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (15,1,'12:05','12:48',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (16,1,'12:25','12:41',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (17,1,'12:04','12:34',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (18,1,'12:16','12:56',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (19,1,'12:00','12:52',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (20,1,'12:23','12:38',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (21,1,'12:10','12:40',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (22,1,'12:29','12:33',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (23,1,'12:28','12:43',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (24,1,'12:17','12:54',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (25,1,'12:28','12:56',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (1,1,'13:24','13:52',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (2,1,'13:11','13:51',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (3,1,'13:16','13:55',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (4,1,'13:23','13:59',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (5,1,'13:24','13:48',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (6,1,'13:08','13:54',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (7,1,'13:17','13:58',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (8,1,'13:06','13:50',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (9,1,'13:15','13:55',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (10,1,'13:02','13:53',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (11,1,'13:24','13:48',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (12,1,'13:19','13:36',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (13,1,'13:10','13:42',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (14,1,'13:15','13:31',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (15,1,'13:15','13:39',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (16,1,'13:21','13:33',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (17,1,'13:06','13:58',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (18,1,'13:25','13:37',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (19,1,'13:13','13:30',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (20,1,'13:11','13:52',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (21,1,'13:14','13:49',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (22,1,'13:13','13:41',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (23,1,'13:27','13:36',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (24,1,'13:23','13:39',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (25,1,'13:01','13:33',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (1,1,'14:21','14:31',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (2,1,'14:23','14:45',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (3,1,'14:07','14:36',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (4,1,'14:04','14:49',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (5,1,'14:02','14:43',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (6,1,'14:17','14:50',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (7,1,'14:17','14:58',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (8,1,'14:26','14:37',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (9,1,'14:02','14:58',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (10,1,'14:21','14:40',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (11,1,'14:14','14:43',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (12,1,'14:25','14:33',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (13,1,'14:07','14:52',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (14,1,'14:26','14:52',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (15,1,'14:03','14:52',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (16,1,'14:21','14:30',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (17,1,'14:17','14:38',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (18,1,'14:27','14:49',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (19,1,'14:14','14:31',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (20,1,'14:07','14:41',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (21,1,'14:12','14:49',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (22,1,'14:06','14:38',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (23,1,'14:23','14:57',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (24,1,'14:18','14:32',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (25,1,'14:06','14:50',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (61,1,'09:00','09:54',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (62,1,'09:28','09:44',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (61,1,'10:11','10:43',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (62,1,'10:09','10:52',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (61,1,'11:12','11:50',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (62,1,'11:15','11:36',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (61,1,'12:19','12:44',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (62,1,'12:02','12:48',4);

-- kegiatan 2
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (26 ,2,'9:15','9:36',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (27 ,2,'9:00','9:49',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (28 ,2,'9:29','9:36',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (29 ,2,'9:27','9:55',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (30 ,2,'9:10','9:44',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (31 ,2,'9:15','9:40',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (32 ,2,'9:01','9:52',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (33 ,2,'9:18','9:39',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (34 ,2,'9:23','9:41',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (35,2,'9:29','9:37',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (36,2,'9:19','9:51',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (37,2,'9:25','9:41',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (38,2,'9:16','9:34',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (39,2,'9:19','9:48',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (40,2,'9:14','9:39',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (41,2,'9:10','9:53',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (42,2,'9:07','9:51',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (43,2,'9:24','9:35',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (44,2,'9:11','9:45',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (45,2,'9:22','9:50',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (46,2,'9:03','9:45',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (47,2,'9:11','9:45',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (48,2,'9:29','9:31',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (49,2,'9:27','9:59',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (50,2,'9:00','9:48',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (26,2,'10:28','10:32',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (27,2,'10:02','10:57',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (28,2,'10:12','10:53',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (29,2,'10:07','10:35',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (30,2,'10:23','10:32',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (31,2,'10:03','10:36',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (32,2,'10:06','10:59',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (33,2,'10:19','10:35',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (34,2,'10:00','10:57',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (35,2,'10:06','10:38',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (36,2,'10:27','10:43',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (37,2,'10:02','10:52',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (38,2,'10:27','10:59',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (39,2,'10:29','10:40',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (40,2,'10:23','10:40',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (41,2,'10:02','10:44',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (42,2,'10:09','10:36',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (43,2,'10:09','10:51',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (44,2,'10:24','10:51',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (45,2,'10:05','10:54',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (46,2,'10:19','10:43',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (47,2,'10:02','10:42',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (48,2,'10:10','10:48',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (49,2,'10:01','10:53',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (50,2,'10:26','10:44',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (26,2,'11:23','11:31',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (27,2,'11:06','11:45',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (28,2,'11:08','11:49',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (29,2,'11:12','11:47',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (30,2,'11:01','11:48',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (31,2,'11:17','11:48',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (32,2,'11:19','11:48',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (33,2,'11:03','11:37',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (34,2,'11:16','11:30',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (35,2,'11:03','11:55',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (36,2,'11:06','11:42',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (37,2,'11:02','11:53',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (38,2,'11:29','11:51',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (39,2,'11:27','11:58',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (40,2,'11:10','11:53',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (41,2,'11:04','11:46',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (42,2,'11:08','11:54',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (43,2,'11:19','11:32',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (44,2,'11:07','11:53',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (45,2,'11:01','11:44',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (46,2,'11:01','11:33',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (47,2,'11:11','11:58',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (48,2,'11:10','11:42',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (49,2,'11:06','11:56',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (50,2,'11:00','11:52',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (26,2,'12:12','12:47',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (27,2,'12:23','12:35',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (28,2,'12:05','12:51',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (29,2,'12:17','12:31',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (30,2,'12:23','12:34',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (31,2,'12:02','12:43',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (32,2,'12:27','12:55',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (33,2,'12:21','12:36',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (34,2,'12:01','12:30',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (35,2,'12:01','12:35',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (36,2,'12:12','12:43',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (37,2,'12:21','12:58',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (38,2,'12:24','12:53',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (39,2,'12:04','12:30',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (40,2,'12:05','12:48',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (41,2,'12:25','12:41',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (42,2,'12:04','12:34',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (43,2,'12:16','12:56',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (44,2,'12:00','12:52',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (45,2,'12:23','12:38',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (46,2,'12:10','12:40',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (47,2,'12:29','12:33',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (48,2,'12:28','12:43',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (49,2,'12:17','12:54',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (50,2,'12:28','12:56',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (26,2,'13:24','13:52',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (27,2,'13:11','13:51',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (28,2,'13:16','13:55',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (29,2,'13:23','13:59',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (30,2,'13:24','13:48',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (31,2,'13:08','13:54',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (32,2,'13:17','13:58',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (33,2,'13:06','13:50',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (34,2,'13:15','13:55',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (35,2,'13:02','13:53',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (36,2,'13:24','13:48',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (37,2,'13:19','13:36',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (38,2,'13:10','13:42',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (39,2,'13:15','13:31',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (40,2,'13:15','13:39',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (41,2,'13:21','13:33',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (42,2,'13:06','13:58',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (43,2,'13:25','13:37',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (44,2,'13:13','13:30',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (45,2,'13:11','13:52',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (46,2,'13:14','13:49',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (47,2,'13:13','13:41',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (48,2,'13:27','13:36',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (49,2,'13:23','13:39',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (50,2,'13:01','13:33',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (26,2,'14:21','15:31',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (27,2,'14:23','15:45',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (28,2,'14:07','15:36',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (29,2,'14:04','15:49',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (30,2,'14:02','15:43',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (31,2,'14:17','15:50',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (32,2,'14:17','15:58',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (33,2,'14:26','15:37',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (34,2,'14:02','15:58',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (35,2,'14:21','15:40',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (36,2,'14:14','15:43',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (37,2,'14:25','15:33',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (38,2,'14:07','15:52',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (39,2,'14:26','15:52',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (40,2,'14:03','15:52',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (41,2,'14:21','15:30',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (42,2,'14:17','15:38',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (43,2,'14:27','15:49',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (44,2,'14:14','15:31',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (45,2,'14:07','15:41',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (46,2,'14:12','15:49',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (47,2,'14:06','15:38',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (48,2,'14:23','15:57',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (49,2,'14:18','15:32',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (50,2,'14:06','15:50',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (1,2,'9:15','9:36',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (2,2,'9:00','9:49',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (3,2,'9:29','9:36',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (4,2,'9:27','9:55',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (5,2,'9:10','9:44',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (6,2,'9:15','9:40',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (7,2,'9:01','9:52',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (8,2,'9:18','9:39',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (9,2,'9:23','9:41',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (10,2,'9:29','9:37',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (11,2,'9:19','9:51',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (12,2,'9:25','9:41',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (13,2,'9:16','9:34',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (14,2,'9:19','9:48',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (15,2,'9:14','9:39',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (1,2,'10:28','10:32',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (2,2,'10:02','10:57',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (3,2,'10:12','10:53',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (4,2,'10:07','10:35',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (5,2,'10:23','10:32',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (6,2,'10:03','10:36',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (7,2,'10:06','10:59',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (8,2,'10:19','10:35',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (9,2,'10:00','10:57',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (10,2,'10:06','10:38',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (11,2,'10:27','10:43',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (12,2,'10:02','10:52',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (13,2,'10:27','10:59',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (14,2,'10:29','10:40',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (15,2,'10:23','10:40',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (1,2,'11:23','11:31',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (2,2,'11:06','11:45',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (3,2,'11:08','11:49',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (4,2,'11:12','11:47',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (5,2,'11:01','11:48',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (6,2,'11:17','11:48',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (7,2,'11:19','11:48',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (8,2,'11:03','11:37',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (9,2,'11:16','11:30',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (10,2,'11:03','11:55',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (11,2,'11:06','11:42',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (12,2,'11:02','11:53',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (13,2,'11:29','11:51',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (14,2,'11:27','11:58',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (15,2,'11:10','11:53',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (1,2,'12:12','12:47',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (2,2,'12:23','12:35',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (3,2,'12:05','12:51',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (4,2,'12:17','12:31',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (5,2,'12:23','12:34',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (6,2,'12:02','12:43',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (7,2,'12:27','12:55',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (8,2,'12:21','12:36',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (9,2,'12:01','12:30',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (10,2,'12:01','12:35',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (11,2,'12:12','12:43',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (12,2,'12:21','12:58',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (13,2,'12:24','12:53',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (14,2,'12:04','12:30',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (15,2,'12:05','12:48',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (1,2,'13:24','13:52',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (2,2,'13:11','13:51',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (3,2,'13:16','13:55',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (4,2,'13:23','13:59',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (5,2,'13:24','13:48',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (6,2,'13:08','13:54',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (7,2,'13:17','13:58',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (8,2,'13:06','13:50',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (9,2,'13:15','13:55',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (10,2,'13:02','13:53',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (11,2,'13:24','13:48',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (12,2,'13:19','13:36',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (13,2,'13:10','13:42',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (14,2,'13:15','13:31',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (15,2,'13:15','13:39',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (1,2,'14:21','15:31',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (2,2,'14:23','15:45',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (3,2,'14:07','15:36',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (4,2,'14:04','15:49',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (5,2,'14:02','15:43',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (6,2,'14:17','15:50',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (7,2,'14:17','15:58',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (8,2,'14:26','15:37',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (9,2,'14:02','15:58',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (10,2,'14:21','15:40',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (11,2,'14:14','15:43',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (12,2,'14:25','15:33',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (13,2,'14:07','15:52',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (14,2,'14:26','15:52',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (15,2,'14:03','15:52',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (63,2,'09:00','09:54',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (64,2,'09:28','09:44',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (63,2,'10:11','10:43',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (64,2,'10:09','10:52',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (63,2,'11:12','11:50',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (64,2,'11:15','11:36',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (63,2,'12:19','12:44',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (64,2,'12:02','12:48',4);

-- kegiatan 3
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (26,3,'9:15','9:36',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (27,3,'9:00','9:49',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (28,3,'9:29','9:36',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (29,3,'9:27','9:55',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (30,3,'9:10','9:44',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (31,3,'9:15','9:40',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (32,3,'9:01','9:52',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (33,3,'9:18','9:39',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (34,3,'9:23','9:41',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (35,3,'9:29','9:37',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (36,3,'9:19','9:51',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (37,3,'9:25','9:41',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (38,3,'9:16','9:34',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (39,3,'9:19','9:48',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (40,3,'9:14','9:39',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (26,3,'10:28','10:32',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (27,3,'10:02','10:57',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (28,3,'10:12','10:53',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (29,3,'10:07','10:35',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (30,3,'10:23','10:32',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (31,3,'10:03','10:36',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (32,3,'10:06','10:59',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (33,3,'10:19','10:35',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (34,3,'10:00','10:57',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (35,3,'10:06','10:38',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (36,3,'10:27','10:43',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (37,3,'10:02','10:52',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (38,3,'10:27','10:59',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (39,3,'10:29','10:40',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (40,3,'10:23','10:40',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (26,3,'11:23','11:31',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (27,3,'11:06','11:45',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (28,3,'11:08','11:49',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (29,3,'11:12','11:47',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (30,3,'11:01','11:48',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (31,3,'11:17','11:48',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (32,3,'11:19','11:48',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (33,3,'11:03','11:37',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (34,3,'11:16','11:30',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (35,3,'11:03','11:55',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (36,3,'11:06','11:42',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (37,3,'11:02','11:53',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (38,3,'11:29','11:51',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (39,3,'11:27','11:58',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (40,3,'11:10','11:53',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (26,3,'12:12','12:47',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (27,3,'12:23','12:35',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (28,3,'12:05','12:51',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (29,3,'12:17','12:31',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (30,3,'12:23','12:34',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (31,3,'12:02','12:43',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (32,3,'12:27','12:55',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (33,3,'12:21','12:36',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (34,3,'12:01','12:30',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (35,3,'12:01','12:35',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (36,3,'12:12','12:43',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (37,3,'12:21','12:58',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (38,3,'12:24','12:53',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (39,3,'12:04','12:30',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (40,3,'12:05','12:48',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (26,3,'13:24','13:52',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (27,3,'13:11','13:51',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (28,3,'13:16','13:55',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (29,3,'13:23','13:59',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (30,3,'13:24','13:48',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (31,3,'13:08','13:54',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (32,3,'13:17','13:58',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (33,3,'13:06','13:50',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (34,3,'13:15','13:55',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (35,3,'13:02','13:53',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (36,3,'13:24','13:48',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (37,3,'13:19','13:36',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (38,3,'13:10','13:42',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (39,3,'13:15','13:31',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (40,3,'13:15','13:39',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (1,3,'9:15','9:36',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (2,3,'9:00','9:49',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (3,3,'9:29','9:36',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (4,3,'9:27','9:55',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (5,3,'9:10','9:44',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (1,3,'10:28','10:32',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (2,3,'10:02','10:57',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (3,3,'10:12','10:53',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (4,3,'10:07','10:35',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (5,3,'10:23','10:32',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (1,3,'11:23','11:31',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (2,3,'11:06','11:45',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (3,3,'11:08','11:49',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (4,3,'11:12','11:47',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (5,3,'11:01','11:48',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (1,3,'12:12','12:47',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (2,3,'12:23','12:35',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (3,3,'12:05','12:51',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (4,3,'12:17','12:31',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (5,3,'12:23','12:34',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (1,3,'13:24','13:52',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (2,3,'13:11','13:51',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (3,3,'13:16','13:55',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (4,3,'13:23','13:59',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (5,3,'13:24','13:48',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (65,3,'09:00','09:54',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (66,3,'09:28','09:44',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (65,3,'10:11','10:43',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (66,3,'10:09','10:52',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (65,3,'11:12','11:50',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (66,3,'11:15','11:36',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (65,3,'12:19','12:44',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (66,3,'12:02','12:48',4);

-- kegiatan 4
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (26,4,'9:15','9:36',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (27,4,'9:00','9:49',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (28,4,'9:29','9:36',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (29,4,'9:27','9:55',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (30,4,'9:10','9:44',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (26,4,'10:28','10:32',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (27,4,'10:02','10:57',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (28,4,'10:12','10:53',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (29,4,'10:07','10:35',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (30,4,'10:23','10:32',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (26,4,'11:23','11:31',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (27,4,'11:06','11:45',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (28,4,'11:08','11:49',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (29,4,'11:12','11:47',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (30,4,'11:01','11:48',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (26,4,'12:12','12:47',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (27,4,'12:23','12:35',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (28,4,'12:05','12:51',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (29,4,'12:17','12:31',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (30,4,'12:23','12:34',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (26,4,'13:24','13:52',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (27,4,'13:11','13:51',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (28,4,'13:16','13:55',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (29,4,'13:23','13:59',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (30,4,'13:24','13:48',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (26,4,'14:14','14:43',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (27,4,'14:25','14:33',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (28,4,'14:07','14:52',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (29,4,'14:26','14:52',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (30,4,'14:03','14:52',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (67,4,'09:00','09:54',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (68,4,'09:28','09:44',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (69,4,'09:00','09:54',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (70,4,'09:28','09:44',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (67,4,'10:11','10:43',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (68,4,'10:09','10:52',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (69,4,'10:11','10:43',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (70,4,'10:09','10:52',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (67,4,'11:12','11:50',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (68,4,'11:15','11:36',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (69,4,'11:12','11:50',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (70,4,'11:15','11:36',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (67,4,'12:19','12:44',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (68,4,'12:02','12:48',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (69,4,'12:19','12:44',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (70,4,'12:02','12:48',4);

-- kegiatan 5
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (51,5,'9:15','9:36',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (52,5,'9:00','9:49',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (53,5,'9:29','9:36',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (54,5,'9:27','9:55',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (55,5,'9:10','9:44',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (56,5,'9:15','9:36',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (57,5,'9:00','9:49',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (58,5,'9:29','9:36',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (59,5,'9:27','9:55',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (60,5,'9:10','9:44',1);

-- kesehatan

insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (1, 'Tidak', 37, '120/80', 1, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (2, 'Tidak', 36, '120/80', 2, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (3, 'Tidak', 36, '120/80', 3, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (4, 'Tidak', 36, '120/80', 4, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (5, 'Tidak', 35, '120/80', 5, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (6, 'Tidak', 36, '120/80', 6, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (7, 'Tidak', 37, '120/80', 7, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (8, 'Tidak', 36, '120/80', 8, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (9, 'Tidak', 37, '120/80', 9, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (10, 'Tidak', 35, '120/80', 10, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (11, 'Tidak', 35, '120/80', 11, '2020-11-01');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (12, 'Tidak', 36, '120/80', 12, '2020-12-22');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (13, 'Tidak', 35, '120/80', 13, '2020-10-18');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (14, 'Tidak', 35, '120/80', 14, '2020-09-06');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (15, 'Tidak', 35, '120/80', 15, '2020-12-14');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (16, 'Tidak', 37, '120/80', 16, '2020-10-17');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (17, 'Tidak', 37, '120/80', 17, '2020-11-15');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (18, 'Tidak', 36, '120/80', 18, '2020-11-08');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (19, 'Tidak', 37, '120/80', 19, '2020-07-14');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (20, 'Tidak', 35, '120/80', 20, '2020-12-17');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (21, 'Tidak', 37, '120/80', 21, '2020-07-19');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (22, 'Tidak', 36, '120/80', 22, '2020-11-11');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (23, 'Tidak', 36, '120/80', 23, '2020-08-13');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (24, 'Tidak', 37, '120/80', 24, '2020-12-24');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (25, 'Tidak', 37, '120/80', 25, '2020-07-13');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (26, 'Tidak', 35, '120/80', 26, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (27, 'Tidak', 35, '120/80', 27, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (28, 'Tidak', 37, '120/80', 28, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (29, 'Tidak', 35, '120/80', 29, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (30, 'Tidak', 37, '120/80', 30, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (31, 'Tidak', 37, '120/80', 31, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (32, 'Tidak', 36, '120/80', 32, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (33, 'Tidak', 35, '120/80', 33, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (34, 'Tidak', 35, '120/80', 34, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (35, 'Tidak', 37, '120/80', 35, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (36, 'Tidak', 35, '120/80', 36, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (37, 'Tidak', 37, '120/80', 37, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (38, 'Tidak', 36, '120/80', 38, '2020-09-25');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (39, 'Tidak', 35, '120/80', 39, '2020-09-30');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (40, 'Tidak', 37, '120/80', 40, '2020-06-06');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (41, 'Tidak', 35, '120/80', 41, '2020-12-03');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (42, 'Tidak', 37, '120/80', 42, '2020-08-29');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (43, 'Tidak', 35, '120/80', 43, '2020-09-05');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (44, 'Tidak', 37, '120/80', 44, '2020-09-20');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (45, 'Tidak', 37, '120/80', 45, '2020-06-06');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (46, 'Tidak', 35, '120/80', 46, '2020-12-21');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (47, 'Tidak', 36, '120/80', 47, '2020-08-15');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (48, 'Tidak', 36, '120/80', 48, '2020-10-24');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (49, 'Tidak', 36, '120/80', 49, '2020-07-17');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (50, 'Tidak', 37, '120/80', 50, '2020-06-22');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (51, 'Tidak', 37, '120/80', 1, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (52, 'Tidak', 36, '120/80', 2, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (53, 'Tidak', 36, '120/80', 3, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (54, 'Tidak', 36, '120/80', 4, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (55, 'Tidak', 35, '120/80', 5, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (56, 'Tidak', 36, '120/80', 6, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (57, 'Tidak', 37, '120/80', 7, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (58, 'Tidak', 36, '120/80', 8, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (59, 'Tidak', 37, '120/80', 9, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (60, 'Tidak', 35, '120/80', 10, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (61, 'Tidak', 35, '120/80', 11, '2020-11-01');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (62, 'Tidak', 36, '120/80', 12, '2020-12-22');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (63, 'Tidak', 35, '120/80', 13, '2020-10-18');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (64, 'Tidak', 35, '120/80', 14, '2020-09-06');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (65, 'Tidak', 35, '120/80', 15, '2020-12-14');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (66, 'Tidak', 37, '120/80', 1, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (67, 'Tidak', 36, '120/80', 2, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (68, 'Tidak', 36, '120/80', 3, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (69, 'Tidak', 36, '120/80', 4, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (70, 'Tidak', 35, '120/80', 5, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (71, 'Tidak', 35, '120/80', 26, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (72, 'Tidak', 35, '120/80', 27, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (73, 'Tidak', 37, '120/80', 28, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (74, 'Tidak', 35, '120/80', 29, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (75, 'Tidak', 37, '120/80', 30, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (76, 'Tidak', 37, '120/80', 31, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (77, 'Tidak', 36, '120/80', 32, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (78, 'Tidak', 35, '120/80', 33, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (79, 'Tidak', 35, '120/80', 34, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (80, 'Tidak', 37, '120/80', 35, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (81, 'Tidak', 35, '120/80', 36, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (87, 'Tidak', 37, '120/80', 37, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (88, 'Tidak', 36, '120/80', 38, '2020-09-25');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (89, 'Tidak', 35, '120/80', 39, '2020-09-30');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (90, 'Tidak', 37, '120/80', 40, '2020-06-06');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (91, 'Tidak', 35, '120/80', 26, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (92, 'Tidak', 35, '120/80', 27, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (93, 'Tidak', 37, '120/80', 28, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (94, 'Tidak', 35, '120/80', 29, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (95, 'Tidak', 37, '120/80', 30, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (96, 'Ya', 39, '190/160', 61, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (97, 'Ya', 39, '120/80', 62, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (98, 'Ya', 39, '120/80', 63, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (99, 'Ya', 39, '120/80', 64, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (100, 'Ya', 40, '120/80', 65, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (101, 'Ya', 39, '200/120', 66, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (102, 'Ya', 39, '120/80', 67, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (103, 'Ya', 41, '120/80', 68, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (104, 'Ya', 39, '120/80', 69, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (105, 'Ya', 39, '180/150', 70, null);