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
drop table Masyarakat

create table Masyarakat (
	IdM INT PRIMARY KEY,
	email VARCHAR(50),
	noHP VARCHAR(50),
	nama VARCHAR(50),
	alamat VARCHAR(50),
	NIK VARCHAR(50),
	tglLahir DATE,
	jenisKelamin VARCHAR(50)
);

CREATE TABLE Provinsi(
    IdProvinsi INT PRIMARY KEY,
    namaProvinsi VARCHAR(50)
)

CREATE TABLE Kota(
    IdKota INT PRIMARY KEY,
    namaKota VARCHAR(50),
    IdProvinsi INT FOREIGN KEY REFERENCES Provinsi(IdProvinsi)
)

CREATE TABLE Lokasi(
    IdLokasi INT PRIMARY KEY,
    namaLokasi VARCHAR(50),
    IdKota INT FOREIGN KEY REFERENCES Kota(IdKota)
)



CREATE TABLE Penyelenggara(
    IdPenyelenggara INT PRIMARY KEY,
    nama VARCHAR(50),
    urutanTahapan VARCHAR(15)
)

CREATE TABLE KegiatanVaksinasi(
    IdKegiatan INT PRIMARY KEY,
    kuota INT,
    waktu TIME,
    tanggal DATE,
    IdLokasi INT FOREIGN KEY REFERENCES Lokasi(IdLokasi),
    IdPenyelenggara INT FOREIGN KEY REFERENCES Penyelenggara(IdPenyelenggara)
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
    IdM INT FOREIGN KEY REFERENCES Masyarakat(IdM),
	IdKegiatan INT FOREIGN KEY REFERENCES KegiatanVaksinasi(IdKegiatan)
)

CREATE TABLE Pendaftaran(
    IdP INT PRIMARY KEY,
    tanggalP DATE,
    statusP VARCHAR(100),
    IdM INT FOREIGN KEY REFERENCES Masyarakat(IdM),
    IdKegiatan INT FOREIGN KEY REFERENCES KegiatanVaksinasi(IdKegiatan)
)

CREATE TABLE Kesehatan(
    IdKesehatan INT PRIMARY KEY,
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
    IdKegiatan INT PRIMARY KEY,
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
INSERT INTO Masyarakat VALUES(71,'Rufus_Swan6671@hourpy.biz','0-517-076-0771','Rufus Swan','Aberavon  Crossroad, 8178',250585457,'1998-03-30 05:13:55Z','Male');
INSERT INTO Masyarakat VALUES(72,'Lynn_Redwood9703@acrit.org','2-863-480-5246','Lynn Redwood','Ely  Avenue, 7177',383159668,'1986-01-16 14:04:12Z','Female');
INSERT INTO Masyarakat VALUES(73,'Jaylene_Fields5897@sveldo.biz','1-232-704-1478','Jaylene Fields','Jackson Rue, 3544',254887669,'1981-03-22 08:32:21Z','Female');
INSERT INTO Masyarakat VALUES(74,'Olivia_Freeburn1202@atink.com','3-885-684-0225','Olivia Freeburn','Thrale   Boulevard, 4847',1276513120,'1986-11-09 12:00:53Z','Female');
INSERT INTO Masyarakat VALUES(75,'Tom_Thompson3262@bretoux.com','2-684-846-2030','Tom Thompson','Bolton  Way, 7970',229826103,'1988-01-29 21:27:02Z','Male');

--10 vaksin 3, 20 vaksin 2, 20 vaksin 1, 15 ditolak, 10 baru daftar


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


insert into KegiatanVaksinasi(IdKegiatan, kuota, waktu, tanggal, IdLokasi, IdPenyelenggara) values (1, 50, '9:00', '2021-06-01', 1, 1);
insert into KegiatanVaksinasi (IdKegiatan, kuota, waktu, tanggal, IdLokasi, IdPenyelenggara) values (2, 50, '9:00', '2021-08-15', 2, 1);
insert into KegiatanVaksinasi (IdKegiatan, kuota, waktu, tanggal, IdLokasi, IdPenyelenggara) values (3, 50, '9:00', '2021-10-02', 3, 2);
insert into KegiatanVaksinasi (IdKegiatan, kuota, waktu, tanggal, IdLokasi, IdPenyelenggara) values (4, 50, '9:00', '2021-12-18', 4, 2);
insert into KegiatanVaksinasi (IdKegiatan, kuota, waktu, tanggal, IdLokasi, IdPenyelenggara) values (5, 50, '9:00', '2022-02-10', 4, 1);


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
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (14, 'Diterima', 14, 2, '09/16/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (15, 'Diterima', 15, 2, '09/6/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (16, 'Diterima', 16, 2, '09/21/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (17, 'Diterima', 17, 2, '09/27/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (18, 'Diterima', 18, 2, '09/19/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (19, 'Diterima', 19, 2, '09/2/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (20, 'Diterima', 20, 2, '09/7/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (21, 'Diterima', 21, 2, '09/29/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (22, 'Diterima', 22, 2, '09/30/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (23, 'Diterima', 23, 2, '09/26/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (24, 'Diterima', 24, 2, '09/28/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (25, 'Diterima', 25, 2, '09/1/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (26, 'Diterima', 26, 3, '09/27/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (27, 'Diterima', 27, 3, '09/4/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (28, 'Diterima', 28, 3, '09/15/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (29, 'Diterima', 29, 3, '09/25/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (30, 'Diterima', 30, 3, '09/4/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (31, 'Diterima', 31, 3, '09/17/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (32, 'Diterima', 32, 3, '09/19/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (33, 'Diterima', 33, 3, '09/4/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (34, 'Diterima', 34, 3, '09/23/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (35, 'Diterima', 35, 3, '09/12/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (36, 'Diterima', 36, 3, '09/8/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (37, 'Diterima', 37, 3, '09/2/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (38, 'Diterima', 38, 3, '09/20/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (39, 'Diterima', 39, 4, '09/10/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (40, 'Diterima', 40, 4, '09/6/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (41, 'Diterima', 41, 4, '09/12/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (42, 'Diterima', 42, 4, '09/24/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (43, 'Diterima', 43, 4, '09/7/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (44, 'Diterima', 44, 4, '09/11/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (45, 'Diterima', 45, 4, '09/27/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (46, 'Diterima', 46, 4, '09/7/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (47, 'Diterima', 47, 4, '09/15/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (48, 'Diterima', 48, 4, '09/11/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (49, 'Diterima', 49, 4, '09/20/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (50, 'Diterima', 50, 4, '09/11/2021');

--dosis2

insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (51, 'Diterima', 1, 1, '09/26/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (52, 'Diterima', 2, 1, '09/8/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (53, 'Diterima', 3, 1, '09/22/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (54, 'Diterima', 4, 1, '09/7/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (55, 'Diterima', 5, 1, '09/11/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (56, 'Diterima', 6, 1, '09/3/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (57, 'Diterima', 7, 1, '09/4/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (58, 'Diterima', 8, 2, '09/28/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (59, 'Diterima', 9, 2, '09/12/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (60, 'Diterima', 10, 2, '09/9/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (61, 'Diterima', 11, 2, '09/21/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (62, 'Diterima', 12, 2, '09/18/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (63, 'Diterima', 13, 2, '09/27/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (64, 'Diterima', 14, 2, '09/6/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (65, 'Diterima', 15, 3, '09/22/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (66, 'Diterima', 16, 3, '09/24/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (67, 'Diterima', 17, 3, '09/5/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (68, 'Diterima', 18, 3, '09/30/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (69, 'Diterima', 19, 3, '09/11/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (70, 'Diterima', 20, 3, '09/11/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (71, 'Diterima', 21, 3, '09/28/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (72, 'Diterima', 22, 4, '09/29/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (73, 'Diterima', 23, 4, '09/13/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (74, 'Diterima', 24, 4, '09/5/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (75, 'Diterima', 25, 4, '09/12/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (76, 'Diterima', 26, 4, '09/8/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (77, 'Diterima', 27, 4, '09/16/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (78, 'Diterima', 28, 4, '09/4/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (79, 'Diterima', 29, 4, '09/6/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (80, 'Diterima', 30, 4, '09/2/2021');

--dosis 3

insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (81, 'Diterima', 1, 1, '09/6/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (82, 'Diterima', 2, 1, '09/30/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (83, 'Diterima', 3, 2, '09/3/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (84, 'Diterima', 4, 2, '09/24/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (85, 'Diterima', 5, 3, '09/17/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (86, 'Diterima', 6, 3, '09/30/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (87, 'Diterima', 7, 3, '09/30/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (88, 'Diterima', 8, 4, '09/15/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (89, 'Diterima', 9, 4, '09/8/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (90, 'Diterima', 10, 4, '09/29/2021');

--baru daftar
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (91, 'Menunggu Konfirmasi', 91, 1, '09/4/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (92, 'Menunggu Konfirmasi', 92, 1, '09/28/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (93, 'Menunggu Konfirmasi', 93, 2, '09/21/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (94, 'Menunggu Konfirmasi', 94, 2, '09/22/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (95, 'Menunggu Konfirmasi', 95, 2, '09/16/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (96, 'Menunggu Konfirmasi', 96, 3, '09/17/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (97, 'Menunggu Konfirmasi', 97, 3, '09/3/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (98, 'Menunggu Konfirmasi', 98, 4, '09/6/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (99, 'Menunggu Konfirmasi', 99, 4, '09/11/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (100, 'Menunggu Konfirmasi', 100, 4, '09/13/2021');

--ditolak
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (101, 'Ditolak', 101, 1, '09/26/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (102, 'Ditolak', 102, 1, '09/22/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (103, 'Ditolak', 103, 1, '09/24/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (104, 'Ditolak', 104, 1, '09/30/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (105, 'Ditolak', 105, 2, '09/15/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (106, 'Ditolak', 106, 2, '09/2/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (107, 'Ditolak', 107, 2, '09/13/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (108, 'Ditolak', 108, 3, '09/1/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (109, 'Ditolak', 109, 3, '09/1/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (110, 'Ditolak', 110, 3, '09/26/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (111, 'Ditolak', 111, 4, '09/15/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (112, 'Ditolak', 112, 4, '09/21/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (113, 'Ditolak', 113, 4, '09/8/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (114, 'Ditolak', 114, 4, '09/16/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (115, 'Ditolak', 115, 4, '09/6/2021');


--mengikuti

INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (1,1,'09:25','09:32',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (21,1,'09:22','09:36',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (41,1,'09:16','09:57',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (61,1,'09:14','09:49',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (81,1,'09:29','09:37',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (101,1,'09:28','09:44',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (121,1,'09:00','09:54',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (141,1,'09:04','09:31',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (161,1,'09:12','09:50',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (181,1,'09:02','09:50',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (1,1,'10:11','10:43',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (21,1,'10:12','10:50',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (41,1,'10:28','10:48',2);


INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (61,1,'10:09','10:52',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (81,1,'10:24','10:39',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (101,1,'10:01','10:47',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (121,1,'10:06','10:30',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (141,1,'10:10','10:50',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (161,1,'10:03','10:52',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (181,1,'10:26','10:54',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (1,1,'11:22','11:50',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (21,1,'11:15','11:36',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (41,1,'11:08','11:57',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (61,1,'11:19','11:50',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (81,1,'11:01','11:42',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (101,1,'11:26','11:40',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (121,1,'11:05','11:58',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (141,1,'11:19','11:39',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (161,1,'11:06','11:55',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (181,1,'11:26','11:51',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (1,1,'12:19','12:44',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (21,1,'12:17','12:58',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (41,1,'12:15','12:45',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (61,1,'12:01','12:49',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (81,1,'12:00','12:47',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (101,1,'12:00','12:32',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (121,1,'12:00','12:44',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (141,1,'12:03','12:39',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (161,1,'12:02','12:48',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (181,1,'12:26','12:55',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (1,1,'13:01','13:57',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (21,1,'13:01','13:48',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (41,1,'13:10','13:53',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (61,1,'13:16','13:53',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (81,1,'13:27','13:50',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (101,1,'13:21','13:31',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (121,1,'13:10','13:50',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (141,1,'13:17','13:33',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (161,1,'13:00','13:40',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (181,1,'13:28','13:57',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (1,1,'14:16','14:57',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (21,1,'14:28','14:47',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (41,1,'14:22','14:49',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (61,1,'14:14','14:44',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (81,1,'14:19','14:53',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (101,1,'14:29','14:55',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (121,1,'14:27','14:50',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (141,1,'14:11','14:38',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (161,1,'14:04','14:45',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (181,1,'14:09','14:30',6);

--kegiatan 2

INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (2,2,'09:25','09:32',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (22,2,'09:22','09:36',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (42,2,'09:16','09:57',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (62,2,'09:14','09:49',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (82,2,'09:29','09:37',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (102,2,'09:28','09:44',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (122,2,'09:00','09:54',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (142,2,'09:04','09:31',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (162,2,'09:12','09:50',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (182,2,'09:02','09:50',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (2,2,'10:11','10:43',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (22,2,'10:12','10:50',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (42,2,'10:28','10:48',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (62,2,'10:09','10:52',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (82,2,'10:24','10:39',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (102,2,'10:01','10:47',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (122,2,'10:06','10:30',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (142,2,'10:10','10:50',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (162,2,'10:03','10:52',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (182,2,'10:26','10:54',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (2,2,'11:22','11:50',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (22,2,'11:15','11:36',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (42,2,'11:08','11:57',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (62,2,'11:19','11:50',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (82,2,'11:01','11:42',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (102,2,'11:26','11:40',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (122,2,'11:05','11:58',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (142,2,'11:19','11:39',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (162,2,'11:06','11:55',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (182,2,'11:26','11:51',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (2,2,'12:19','12:44',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (22,2,'12:17','12:58',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (42,2,'12:15','12:45',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (62,2,'12:01','12:49',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (82,2,'12:00','12:47',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (102,2,'12:00','12:32',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (122,2,'12:00','12:44',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (142,2,'12:03','12:39',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (162,2,'12:02','12:48',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (182,2,'12:26','12:55',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (2,2,'13:01','13:57',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (22,2,'13:01','13:48',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (42,2,'13:10','13:53',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (62,2,'13:16','13:53',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (82,2,'13:27','13:50',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (102,2,'13:21','13:31',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (122,2,'13:10','13:50',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (142,2,'13:17','13:33',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (162,2,'13:00','13:40',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (182,2,'13:28','13:57',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (2,2,'14:16','14:57',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (22,2,'14:28','14:47',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (42,2,'14:22','14:49',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (62,2,'14:14','14:44',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (82,2,'14:19','14:53',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (102,2,'14:29','14:55',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (122,2,'14:27','14:50',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (142,2,'14:11','14:38',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (162,2,'14:04','14:45',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (182,2,'14:09','14:30',6);

--kegiatan 3

INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (3,3,'09:25','09:32',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (23,3,'09:22','09:36',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (43,3,'09:16','09:57',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (63,3,'09:14','09:49',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (83,3,'09:29','09:37',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (103,3,'09:28','09:44',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (123,3,'09:00','09:54',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (143,3,'09:04','09:31',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (163,3,'09:12','09:50',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (183,3,'09:02','09:50',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (3,3,'10:11','10:43',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (23,3,'10:12','10:50',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (43,3,'10:28','10:48',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (63,3,'10:09','10:52',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (83,3,'10:24','10:39',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (103,3,'10:01','10:47',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (123,3,'10:06','10:30',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (143,3,'10:10','10:50',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (163,3,'10:03','10:52',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (183,3,'10:26','10:54',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (3,3,'11:22','11:50',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (23,3,'11:15','11:36',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (43,3,'11:08','11:57',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (63,3,'11:19','11:50',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (83,3,'11:01','11:42',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (103,3,'11:26','11:40',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (123,3,'11:05','11:58',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (143,3,'11:19','11:39',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (163,3,'11:06','11:55',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (183,3,'11:26','11:51',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (3,3,'12:19','12:44',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (23,3,'12:17','12:58',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (43,3,'12:15','12:45',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (63,3,'12:01','12:49',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (83,3,'12:00','12:47',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (103,3,'12:00','12:32',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (123,3,'12:00','12:44',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (143,3,'12:03','12:39',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (163,3,'12:02','12:48',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (183,3,'12:26','12:55',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (3,3,'13:01','13:57',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (23,3,'13:01','13:48',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (43,3,'13:10','13:53',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (63,3,'13:16','13:53',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (83,3,'13:27','13:50',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (103,3,'13:21','13:31',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (123,3,'13:10','13:50',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (143,3,'13:17','13:33',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (163,3,'13:00','13:40',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (183,3,'13:28','13:57',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (3,3,'14:16','14:57',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (23,3,'14:28','14:47',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (43,3,'14:22','14:49',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (63,3,'14:14','14:44',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (83,3,'14:19','14:53',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (103,3,'14:29','14:55',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (123,3,'14:27','14:50',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (143,3,'14:11','14:38',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (163,3,'14:04','14:45',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (183,3,'14:09','14:30',6);

--kegiatan 4

INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (4,4,'09:25','09:32',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (24,4,'09:22','09:36',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (44,4,'09:16','09:57',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (64,4,'09:14','09:49',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (84,4,'09:29','09:37',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (104,4,'09:28','09:44',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (124,4,'09:00','09:54',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (144,4,'09:04','09:31',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (164,4,'09:12','09:50',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (184,4,'09:02','09:50',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (4,4,'10:11','10:43',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (24,4,'10:12','10:50',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (44,4,'10:28','10:48',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (64,4,'10:09','10:52',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (84,4,'10:24','10:39',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (104,4,'10:01','10:47',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (124,4,'10:06','10:30',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (144,4,'10:10','10:50',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (164,4,'10:03','10:52',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (184,4,'10:26','10:54',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (4,4,'11:22','11:50',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (24,4,'11:15','11:36',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (44,4,'11:08','11:57',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (64,4,'11:19','11:50',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (84,4,'11:01','11:42',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (104,4,'11:26','11:40',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (124,4,'11:05','11:58',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (144,4,'11:19','11:39',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (164,4,'11:06','11:55',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (184,4,'11:26','11:51',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (4,4,'12:19','12:44',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (24,4,'12:17','12:58',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (44,4,'12:15','12:45',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (64,4,'12:01','12:49',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (84,4,'12:00','12:47',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (104,4,'12:00','12:32',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (124,4,'12:00','12:44',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (144,4,'12:03','12:39',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (164,4,'12:02','12:48',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (184,4,'12:26','12:55',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (4,4,'13:01','13:57',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (24,4,'13:01','13:48',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (44,4,'13:10','13:53',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (64,4,'13:16','13:53',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (84,4,'13:27','13:50',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (104,4,'13:21','13:31',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (124,4,'13:10','13:50',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (144,4,'13:17','13:33',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (164,4,'13:00','13:40',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (184,4,'13:28','13:57',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (4,4,'14:16','14:57',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (24,4,'14:28','14:47',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (44,4,'14:22','14:49',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (64,4,'14:14','14:44',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (84,4,'14:19','14:53',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (104,4,'14:29','14:55',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (124,4,'14:27','14:50',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (144,4,'14:11','14:38',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (164,4,'14:04','14:45',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (184,4,'14:09','14:30',6);


--kegiatan 5

INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (5,5,'09:25','09:32',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (25,5,'09:22','09:36',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (45,5,'09:16','09:57',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (65,5,'09:14','09:49',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (85,5,'09:29','09:37',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (105,5,'09:28','09:44',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (125,5,'09:00','09:54',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (145,5,'09:04','09:31',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (165,5,'09:12','09:50',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (185,5,'09:02','09:50',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (5,5,'10:11','10:43',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (25,5,'10:12','10:50',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (45,5,'10:28','10:48',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (65,5,'10:09','10:52',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (85,5,'10:24','10:39',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (105,5,'10:01','10:47',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (125,5,'10:06','10:30',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (145,5,'10:10','10:50',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (165,5,'10:03','10:52',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (185,5,'10:26','10:54',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (5,5,'11:22','11:50',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (25,5,'11:15','11:36',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (45,5,'11:08','11:57',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (65,5,'11:19','11:50',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (85,5,'11:01','11:42',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (105,5,'11:26','11:40',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (125,5,'11:05','11:58',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (145,5,'11:19','11:39',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (165,5,'11:06','11:55',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (185,5,'11:26','11:51',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (5,5,'12:19','12:44',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (25,5,'12:17','12:58',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (45,5,'12:15','12:45',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (65,5,'12:01','12:49',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (85,5,'12:00','12:47',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (105,5,'12:00','12:32',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (125,5,'12:00','12:44',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (145,5,'12:03','12:39',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (165,5,'12:02','12:48',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (185,5,'12:26','12:55',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (5,5,'13:01','13:57',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (25,5,'13:01','13:48',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (45,5,'13:10','13:53',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (65,5,'13:16','13:53',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (85,5,'13:27','13:50',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (105,5,'13:21','13:31',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (125,5,'13:10','13:50',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (145,5,'13:17','13:33',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (165,5,'13:00','13:40',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (185,5,'13:28','13:57',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (5,5,'14:16','14:57',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (25,5,'14:28','14:47',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (45,5,'14:22','14:49',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (65,5,'14:14','14:44',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (85,5,'14:19','14:53',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (105,5,'14:29','14:55',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (125,5,'14:27','14:50',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (145,5,'14:11','14:38',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (165,5,'14:04','14:45',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (185,5,'14:09','14:30',6);

--kegiatan 6

INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (6,6,'09:25','09:32',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (26,6,'09:22','09:36',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (46,6,'09:16','09:57',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (66,6,'09:14','09:49',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (86,6,'09:29','09:37',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (106,6,'09:28','09:44',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (126,6,'09:00','09:54',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (146,6,'09:04','09:31',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (166,6,'09:12','09:50',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (186,6,'09:02','09:50',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (6,6,'10:11','10:43',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (26,6,'10:12','10:50',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (46,6,'10:28','10:48',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (66,6,'10:09','10:52',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (86,6,'10:24','10:39',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (106,6,'10:01','10:47',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (126,6,'10:06','10:30',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (146,6,'10:10','10:50',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (166,6,'10:03','10:52',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (186,6,'10:26','10:54',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (6,6,'11:22','11:50',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (26,6,'11:15','11:36',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (46,6,'11:08','11:57',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (66,6,'11:19','11:50',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (86,6,'11:01','11:42',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (106,6,'11:26','11:40',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (126,6,'11:05','11:58',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (146,6,'11:19','11:39',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (166,6,'11:06','11:55',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (186,6,'11:26','11:51',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (6,6,'12:19','12:44',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (26,6,'12:17','12:58',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (46,6,'12:15','12:45',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (66,6,'12:01','12:49',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (86,6,'12:00','12:47',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (106,6,'12:00','12:32',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (126,6,'12:00','12:44',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (146,6,'12:03','12:39',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (166,6,'12:02','12:48',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (186,6,'12:26','12:55',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (6,6,'13:01','13:57',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (26,6,'13:01','13:48',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (46,6,'13:10','13:53',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (66,6,'13:16','13:53',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (86,6,'13:27','13:50',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (106,6,'13:21','13:31',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (126,6,'13:10','13:50',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (146,6,'13:17','13:33',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (166,6,'13:00','13:40',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (186,6,'13:28','13:57',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (6,6,'14:16','14:57',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (26,6,'14:28','14:47',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (46,6,'14:22','14:49',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (66,6,'14:14','14:44',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (86,6,'14:19','14:53',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (106,6,'14:29','14:55',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (126,6,'14:27','14:50',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (146,6,'14:11','14:38',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (166,6,'14:04','14:45',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (186,6,'14:09','14:30',6);

--kegiatan 7

INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (7,7,'09:25','09:32',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (27,7,'09:22','09:36',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (47,7,'09:16','09:57',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (67,7,'09:14','09:49',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (87,7,'09:29','09:37',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (107,7,'09:28','09:44',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (127,7,'09:00','09:54',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (147,7,'09:04','09:31',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (167,7,'09:12','09:50',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (187,7,'09:02','09:50',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (7,7,'10:11','10:43',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (27,7,'10:12','10:50',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (47,7,'10:28','10:48',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (67,7,'10:09','10:52',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (87,7,'10:24','10:39',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (107,7,'10:01','10:47',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (127,7,'10:06','10:30',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (147,7,'10:10','10:50',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (167,7,'10:03','10:52',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (187,7,'10:26','10:54',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (7,7,'11:22','11:50',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (27,7,'11:15','11:36',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (47,7,'11:08','11:57',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (67,7,'11:19','11:50',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (87,7,'11:01','11:42',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (107,7,'11:26','11:40',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (127,7,'11:05','11:58',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (147,7,'11:19','11:39',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (167,7,'11:06','11:55',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (187,7,'11:26','11:51',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (7,7,'12:19','12:44',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (27,7,'12:17','12:58',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (47,7,'12:15','12:45',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (67,7,'12:01','12:49',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (87,7,'12:00','12:47',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (107,7,'12:00','12:32',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (127,7,'12:00','12:44',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (147,7,'12:03','12:39',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (167,7,'12:02','12:48',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (187,7,'12:26','12:55',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (7,7,'13:01','13:57',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (27,7,'13:01','13:48',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (47,7,'13:10','13:53',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (67,7,'13:16','13:53',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (87,7,'13:27','13:50',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (107,7,'13:21','13:31',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (127,7,'13:10','13:50',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (147,7,'13:17','13:33',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (167,7,'13:00','13:40',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (187,7,'13:28','13:57',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (7,7,'14:16','14:57',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (27,7,'14:28','14:47',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (47,7,'14:22','14:49',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (67,7,'14:14','14:44',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (87,7,'14:19','14:53',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (107,7,'14:29','14:55',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (127,7,'14:27','14:50',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (147,7,'14:11','14:38',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (167,7,'14:04','14:45',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (187,7,'14:09','14:30',6);

--kegiatan 8

INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (8,8,'09:25','09:32',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (28,8,'09:22','09:36',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (48,8,'09:16','09:57',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (68,8,'09:14','09:49',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (88,8,'09:29','09:37',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (108,8,'09:28','09:44',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (128,8,'09:00','09:54',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (148,8,'09:04','09:31',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (168,8,'09:12','09:50',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (188,8,'09:02','09:50',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (8,8,'10:11','10:43',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (28,8,'10:12','10:50',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (48,8,'10:28','10:48',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (68,8,'10:09','10:52',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (88,8,'10:24','10:39',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (108,8,'10:01','10:47',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (128,8,'10:06','10:30',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (148,8,'10:10','10:50',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (168,8,'10:03','10:52',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (188,8,'10:26','10:54',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (8,8,'11:22','11:50',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (28,8,'11:15','11:36',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (48,8,'11:08','11:57',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (68,8,'11:19','11:50',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (88,8,'11:01','11:42',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (108,8,'11:26','11:40',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (128,8,'11:05','11:58',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (148,8,'11:19','11:39',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (168,8,'11:06','11:55',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (188,8,'11:26','11:51',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (8,8,'12:19','12:44',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (28,8,'12:17','12:58',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (48,8,'12:15','12:45',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (68,8,'12:01','12:49',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (88,8,'12:00','12:47',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (108,8,'12:00','12:32',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (128,8,'12:00','12:44',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (148,8,'12:03','12:39',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (168,8,'12:02','12:48',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (188,8,'12:26','12:55',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (8,8,'13:01','13:57',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (28,8,'13:01','13:48',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (48,8,'13:10','13:53',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (68,8,'13:16','13:53',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (88,8,'13:27','13:50',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (108,8,'13:21','13:31',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (128,8,'13:10','13:50',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (148,8,'13:17','13:33',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (168,8,'13:00','13:40',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (188,8,'13:28','13:57',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (8,8,'14:16','14:57',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (28,8,'14:28','14:47',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (48,8,'14:22','14:49',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (68,8,'14:14','14:44',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (88,8,'14:19','14:53',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (108,8,'14:29','14:55',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (128,8,'14:27','14:50',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (148,8,'14:11','14:38',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (168,8,'14:04','14:45',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (188,8,'14:09','14:30',6);

--kegiatan 9

INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (9,9,'09:25','09:32',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (29,9,'09:22','09:36',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (49,9,'09:16','09:57',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (69,9,'09:14','09:49',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (89,9,'09:29','09:37',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (109,9,'09:28','09:44',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (129,9,'09:00','09:54',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (149,9,'09:04','09:31',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (169,9,'09:12','09:50',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (189,9,'09:02','09:50',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (9,9,'10:11','10:43',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (29,9,'10:12','10:50',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (49,9,'10:28','10:48',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (69,9,'10:09','10:52',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (89,9,'10:24','10:39',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (109,9,'10:01','10:47',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (129,9,'10:06','10:30',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (149,9,'10:10','10:50',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (169,9,'10:03','10:52',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (189,9,'10:26','10:54',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (9,9,'11:22','11:50',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (29,9,'11:15','11:36',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (49,9,'11:08','11:57',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (69,9,'11:19','11:50',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (89,9,'11:01','11:42',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (109,9,'11:26','11:40',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (129,9,'11:05','11:58',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (149,9,'11:19','11:39',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (169,9,'11:06','11:55',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (189,9,'11:26','11:51',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (9,9,'12:19','12:44',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (29,9,'12:17','12:58',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (49,9,'12:15','12:45',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (69,9,'12:01','12:49',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (89,9,'12:00','12:47',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (109,9,'12:00','12:32',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (129,9,'12:00','12:44',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (149,9,'12:03','12:39',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (169,9,'12:02','12:48',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (189,9,'12:26','12:55',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (9,9,'13:01','13:57',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (29,9,'13:01','13:48',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (49,9,'13:10','13:53',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (69,9,'13:16','13:53',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (89,9,'13:27','13:50',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (109,9,'13:21','13:31',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (129,9,'13:10','13:50',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (149,9,'13:17','13:33',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (169,9,'13:00','13:40',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (189,9,'13:28','13:57',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (9,9,'14:16','14:57',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (29,9,'14:28','14:47',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (49,9,'14:22','14:49',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (69,9,'14:14','14:44',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (89,9,'14:19','14:53',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (109,9,'14:29','14:55',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (129,9,'14:27','14:50',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (149,9,'14:11','14:38',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (169,9,'14:04','14:45',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (189,9,'14:09','14:30',6);

--kegiatan 10

INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (10,10,'09:25','09:32',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (30,10,'09:22','09:36',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (50,10,'09:16','09:57',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (70,10,'09:14','09:49',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (90,10,'09:29','09:37',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (110,10,'09:28','09:44',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (130,10,'09:00','09:54',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (150,10,'09:04','09:31',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (170,10,'09:12','09:50',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (190,10,'09:02','09:50',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (10,10,'10:11','10:43',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (30,10,'10:12','10:50',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (50,10,'10:28','10:48',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (70,10,'10:09','10:52',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (90,10,'10:24','10:39',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (110,10,'10:01','10:47',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (130,10,'10:06','10:30',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (150,10,'10:10','10:50',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (170,10,'10:03','10:52',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (190,10,'10:26','10:54',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (10,10,'11:22','11:50',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (30,10,'11:15','11:36',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (50,10,'11:08','11:57',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (70,10,'11:19','11:50',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (90,10,'11:01','11:42',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (110,10,'11:26','11:40',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (130,10,'11:05','11:58',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (150,10,'11:19','11:39',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (170,10,'11:06','11:55',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (190,10,'11:26','11:51',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (10,10,'12:19','12:44',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (30,10,'12:17','12:58',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (50,10,'12:15','12:45',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (70,10,'12:01','12:49',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (90,10,'12:00','12:47',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (110,10,'12:00','12:32',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (130,10,'12:00','12:44',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (150,10,'12:03','12:39',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (170,10,'12:02','12:48',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (190,10,'12:26','12:55',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (10,10,'13:01','13:57',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (30,10,'13:01','13:48',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (50,10,'13:10','13:53',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (70,10,'13:16','13:53',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (90,10,'13:27','13:50',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (110,10,'13:21','13:31',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (130,10,'13:10','13:50',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (150,10,'13:17','13:33',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (170,10,'13:00','13:40',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (190,10,'13:28','13:57',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (10,10,'14:16','14:57',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (30,10,'14:28','14:47',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (50,10,'14:22','14:49',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (70,10,'14:14','14:44',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (90,10,'14:19','14:53',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (110,10,'14:29','14:55',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (130,10,'14:27','14:50',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (150,10,'14:11','14:38',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (170,10,'14:04','14:45',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (190,10,'14:09','14:30',6);

--kegiatan 11

INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (11,11,'09:25','09:32',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (31,11,'09:22','09:36',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (51,11,'09:16','09:57',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (71,11,'09:14','09:49',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (91,11,'09:29','09:37',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (111,11,'09:28','09:44',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (131,11,'09:00','09:54',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (151,11,'09:04','09:31',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (171,11,'09:12','09:50',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (191,11,'09:02','09:50',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (11,11,'10:11','10:43',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (31,11,'10:12','10:50',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (51,11,'10:28','10:48',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (71,11,'10:09','10:52',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (91,11,'10:24','10:39',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (111,11,'10:01','10:47',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (131,11,'10:06','10:30',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (151,11,'10:10','10:50',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (171,11,'10:03','10:52',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (191,11,'10:26','10:54',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (11,11,'11:22','11:50',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (31,11,'11:15','11:36',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (51,11,'11:08','11:57',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (71,11,'11:19','11:50',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (91,11,'11:01','11:42',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (111,11,'11:26','11:40',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (131,11,'11:05','11:58',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (151,11,'11:19','11:39',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (171,11,'11:06','11:55',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (191,11,'11:26','11:51',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (11,11,'12:19','12:44',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (31,11,'12:17','12:58',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (51,11,'12:15','12:45',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (71,11,'12:01','12:49',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (91,11,'12:00','12:47',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (111,11,'12:00','12:32',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (131,11,'12:00','12:44',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (151,11,'12:03','12:39',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (171,11,'12:02','12:48',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (191,11,'12:26','12:55',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (11,11,'13:01','13:57',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (31,11,'13:01','13:48',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (51,11,'13:10','13:53',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (71,11,'13:16','13:53',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (91,11,'13:27','13:50',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (111,11,'13:21','13:31',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (131,11,'13:10','13:50',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (151,11,'13:17','13:33',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (171,11,'13:00','13:40',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (191,11,'13:28','13:57',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (11,11,'14:16','14:57',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (31,11,'14:28','14:47',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (51,11,'14:22','14:49',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (71,11,'14:14','14:44',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (91,11,'14:19','14:53',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (111,11,'14:29','14:55',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (131,11,'14:27','14:50',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (151,11,'14:11','14:38',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (171,11,'14:04','14:45',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (191,11,'14:09','14:30',6);

--kegiatan 12

INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (12,12,'09:25','09:32',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (32,12,'09:22','09:36',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (52,12,'09:16','09:57',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (72,12,'09:14','09:49',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (92,12,'09:29','09:37',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (112,12,'09:28','09:44',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (132,12,'09:00','09:54',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (152,12,'09:04','09:31',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (172,12,'09:12','09:50',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (192,12,'09:02','09:50',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (12,12,'10:11','10:43',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (32,12,'10:12','10:50',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (52,12,'10:28','10:48',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (72,12,'10:09','10:52',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (92,12,'10:24','10:39',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (112,12,'10:01','10:47',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (132,12,'10:06','10:30',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (152,12,'10:10','10:50',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (172,12,'10:03','10:52',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (192,12,'10:26','10:54',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (12,12,'11:22','11:50',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (32,12,'11:15','11:36',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (52,12,'11:08','11:57',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (72,12,'11:19','11:50',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (92,12,'11:01','11:42',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (112,12,'11:26','11:40',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (132,12,'11:05','11:58',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (152,12,'11:19','11:39',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (172,12,'11:06','11:55',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (192,12,'11:26','11:51',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (12,12,'12:19','12:44',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (32,12,'12:17','12:58',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (52,12,'12:15','12:45',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (72,12,'12:01','12:49',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (92,12,'12:00','12:47',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (112,12,'12:00','12:32',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (132,12,'12:00','12:44',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (152,12,'12:03','12:39',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (172,12,'12:02','12:48',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (192,12,'12:26','12:55',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (12,12,'13:01','13:57',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (32,12,'13:01','13:48',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (52,12,'13:10','13:53',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (72,12,'13:16','13:53',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (92,12,'13:27','13:50',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (112,12,'13:21','13:31',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (132,12,'13:10','13:50',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (152,12,'13:17','13:33',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (172,12,'13:00','13:40',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (192,12,'13:28','13:57',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (12,12,'14:16','14:57',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (32,12,'14:28','14:47',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (52,12,'14:22','14:49',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (72,12,'14:14','14:44',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (92,12,'14:19','14:53',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (112,12,'14:29','14:55',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (132,12,'14:27','14:50',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (152,12,'14:11','14:38',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (172,12,'14:04','14:45',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (192,12,'14:09','14:30',6);

INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (13,13 ,'09:25','09:32',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (33,13 ,'09:22','09:36',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (53,13 ,'09:16','09:57',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (73,13 ,'09:14','09:49',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (93,13 ,'09:29','09:37',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (113,13,'09:28','09:44',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (133,13,'09:00','09:54',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (153,13,'09:04','09:31',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (173,13,'09:12','09:50',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (193,13,'09:02','09:50',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (13,13 ,'10:11','10:43',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (33,13 ,'10:12','10:50',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (53,13 ,'10:28','10:48',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (73,13 ,'10:09','10:52',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (93,13 ,'10:24','10:39',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (113,13,'10:01','10:47',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (133,13,'10:06','10:30',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (153,13,'10:10','10:50',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (173,13,'10:03','10:52',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (193,13,'10:26','10:54',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (13,13 ,'11:22','11:50',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (33,13 ,'11:15','11:36',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (53,13 ,'11:08','11:57',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (73,13 ,'11:19','11:50',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (93,13 ,'11:01','11:42',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (113,13,'11:26','11:40',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (133,13,'11:05','11:58',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (153,13,'11:19','11:39',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (173,13,'11:06','11:55',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (193,13,'11:26','11:51',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (13,13 ,'12:19','12:44',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (33,13 ,'12:17','12:58',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (53,13 ,'12:15','12:45',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (73,13 ,'12:01','12:49',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (93,13 ,'12:00','12:47',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (113,13,'12:00','12:32',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (133,13,'12:00','12:44',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (153,13,'12:03','12:39',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (173,13,'12:02','12:48',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (193,13,'12:26','12:55',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (13,13 ,'13:01','13:57',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (33,13 ,'13:01','13:48',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (53,13 ,'13:10','13:53',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (73,13 ,'13:16','13:53',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (93,13 ,'13:27','13:50',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (113,13,'13:21','13:31',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (133,13,'13:10','13:50',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (153,13,'13:17','13:33',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (173,13,'13:00','13:40',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (193,13,'13:28','13:57',5);

INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (14 ,14 ,'09:25','09:32',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (34 ,14 ,'09:22','09:36',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (54 ,14 ,'09:16','09:57',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (74 ,14 ,'09:14','09:49',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (94 ,14 ,'09:29','09:37',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (114,14,'09:28','09:44',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (134,14,'09:00','09:54',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (154,14,'09:04','09:31',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (174,14,'09:12','09:50',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (194,14,'09:02','09:50',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (14 ,14 ,'10:11','10:43',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (34 ,14 ,'10:12','10:50',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (54 ,14 ,'10:28','10:48',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (74 ,14 ,'10:09','10:52',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (94 ,14 ,'10:24','10:39',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (114,14,'10:01','10:47',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (134,14,'10:06','10:30',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (154,14,'10:10','10:50',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (174,14,'10:03','10:52',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (194,14,'10:26','10:54',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (14 ,14 ,'11:22','11:50',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (34 ,14 ,'11:15','11:36',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (54 ,14 ,'11:08','11:57',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (74 ,14 ,'11:19','11:50',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (94 ,14 ,'11:01','11:42',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (114,14,'11:26','11:40',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (134,14,'11:05','11:58',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (154,14,'11:19','11:39',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (174,14,'11:06','11:55',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (194,14,'11:26','11:51',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (14 ,14 ,'12:19','12:44',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (34 ,14 ,'12:17','12:58',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (54 ,14 ,'12:15','12:45',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (74 ,14 ,'12:01','12:49',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (94 ,14 ,'12:00','12:47',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (114,14,'12:00','12:32',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (134,14,'12:00','12:44',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (154,14,'12:03','12:39',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (174,14,'12:02','12:48',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (194,14,'12:26','12:55',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (14 ,14 ,'13:01','13:57',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (34 ,14 ,'13:01','13:48',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (54 ,14 ,'13:10','13:53',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (74 ,14 ,'13:16','13:53',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (94 ,14 ,'13:27','13:50',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (114,14,'13:21','13:31',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (134,14,'13:10','13:50',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (154,14,'13:17','13:33',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (174,14,'13:00','13:40',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (194,14,'13:28','13:57',5);

INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (15 ,15 ,'09:25','09:32',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (35 ,15 ,'09:22','09:36',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (55 ,15 ,'09:16','09:57',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (75 ,15 ,'09:14','09:49',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (95 ,15 ,'09:29','09:37',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (115,15,'09:28','09:44',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (135,15,'09:00','09:54',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (155,15,'09:04','09:31',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (175,15,'09:12','09:50',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (195,15,'09:02','09:50',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (15 ,15 ,'10:11','10:43',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (35 ,15 ,'10:12','10:50',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (55 ,15 ,'10:28','10:48',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (75 ,15 ,'10:09','10:52',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (95 ,15 ,'10:24','10:39',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (115,15,'10:01','10:47',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (135,15,'10:06','10:30',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (155,15,'10:10','10:50',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (175,15,'10:03','10:52',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (195,15,'10:26','10:54',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (15 ,15 ,'11:22','11:50',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (35 ,15 ,'11:15','11:36',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (55 ,15 ,'11:08','11:57',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (75 ,15 ,'11:19','11:50',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (95 ,15 ,'11:01','11:42',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (115,15,'11:26','11:40',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (135,15,'11:05','11:58',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (155,15,'11:19','11:39',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (175,15,'11:06','11:55',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (195,15,'11:26','11:51',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (15 ,15 ,'12:19','12:44',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (35 ,15 ,'12:17','12:58',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (55 ,15 ,'12:15','12:45',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (75 ,15 ,'12:01','12:49',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (95 ,15 ,'12:00','12:47',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (115,15,'12:00','12:32',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (135,15,'12:00','12:44',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (155,15,'12:03','12:39',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (175,15,'12:02','12:48',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (195,15,'12:26','12:55',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (15 ,15 ,'13:01','13:57',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (35 ,15 ,'13:01','13:48',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (55 ,15 ,'13:10','13:53',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (75 ,15 ,'13:16','13:53',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (95 ,15 ,'13:27','13:50',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (115,15,'13:21','13:31',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (135,15,'13:10','13:50',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (155,15,'13:17','13:33',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (175,15,'13:00','13:40',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (195,15,'13:28','13:57',5);

INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (16 ,16 ,'09:25','09:32',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (36 ,16 ,'09:22','09:36',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (56 ,16 ,'09:16','09:57',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (76 ,16 ,'09:14','09:49',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (96 ,16 ,'09:29','09:37',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (116,16,'09:28','09:44',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (136,16,'09:00','09:54',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (156,16,'09:04','09:31',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (176,16,'09:12','09:50',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (196,16,'09:02','09:50',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (16 ,16 ,'10:11','10:43',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (36 ,16 ,'10:12','10:50',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (56 ,16 ,'10:28','10:48',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (76 ,16 ,'10:09','10:52',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (96 ,16 ,'10:24','10:39',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (116,16,'10:01','10:47',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (136,16,'10:06','10:30',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (156,16,'10:10','10:50',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (176,16,'10:03','10:52',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (196,16,'10:26','10:54',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (16 ,16 ,'11:22','11:50',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (36 ,16 ,'11:15','11:36',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (56 ,16 ,'11:08','11:57',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (76 ,16 ,'11:19','11:50',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (96 ,16 ,'11:01','11:42',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (116,16,'11:26','11:40',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (136,16,'11:05','11:58',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (156,16,'11:19','11:39',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (176,16,'11:06','11:55',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (196,16,'11:26','11:51',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (16 ,16 ,'12:19','12:44',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (36 ,16 ,'12:17','12:58',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (56 ,16 ,'12:15','12:45',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (76 ,16 ,'12:01','12:49',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (96 ,16 ,'12:00','12:47',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (116,16,'12:00','12:32',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (136,16,'12:00','12:44',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (156,16,'12:03','12:39',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (176,16,'12:02','12:48',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (196,16,'12:26','12:55',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (16 ,16 ,'13:01','13:57',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (36 ,16 ,'13:01','13:48',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (56 ,16 ,'13:10','13:53',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (76 ,16 ,'13:16','13:53',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (96 ,16 ,'13:27','13:50',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (116,16,'13:21','13:31',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (136,16,'13:10','13:50',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (156,16,'13:17','13:33',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (176,16,'13:00','13:40',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (196,16,'13:28','13:57',5);

INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (17 ,17 ,'09:25','09:32',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (37 ,17 ,'09:22','09:36',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (57 ,17 ,'09:16','09:57',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (77 ,17 ,'09:14','09:49',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (97 ,17 ,'09:29','09:37',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (117,17,'09:28','09:44',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (137,17,'09:00','09:54',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (157,17,'09:04','09:31',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (177,17,'09:12','09:50',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (197,17,'09:02','09:50',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (17 ,17 ,'10:11','10:43',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (37 ,17 ,'10:12','10:50',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (57 ,17 ,'10:28','10:48',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (77 ,17 ,'10:09','10:52',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (97 ,17 ,'10:24','10:39',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (117,17,'10:01','10:47',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (137,17,'10:06','10:30',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (157,17,'10:10','10:50',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (177,17,'10:03','10:52',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (197,17,'10:26','10:54',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (17 ,17 ,'11:22','11:50',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (37 ,17 ,'11:15','11:36',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (57 ,17 ,'11:08','11:57',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (77 ,17 ,'11:19','11:50',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (97 ,17 ,'11:01','11:42',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (117,17,'11:26','11:40',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (137,17,'11:05','11:58',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (157,17,'11:19','11:39',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (177,17,'11:06','11:55',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (197,17,'11:26','11:51',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (17 ,17 ,'12:19','12:44',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (37 ,17 ,'12:17','12:58',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (57 ,17 ,'12:15','12:45',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (77 ,17 ,'12:01','12:49',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (97 ,17 ,'12:00','12:47',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (117,17,'12:00','12:32',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (137,17,'12:00','12:44',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (157,17,'12:03','12:39',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (177,17,'12:02','12:48',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (197,17,'12:26','12:55',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (17 ,17 ,'13:01','13:57',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (37 ,17 ,'13:01','13:48',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (57 ,17 ,'13:10','13:53',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (77 ,17 ,'13:16','13:53',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (97 ,17 ,'13:27','13:50',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (117,17,'13:21','13:31',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (137,17,'13:10','13:50',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (157,17,'13:17','13:33',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (177,17,'13:00','13:40',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (197,17,'13:28','13:57',5);

INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (18 ,18 ,'09:25','09:32',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (38 ,18 ,'09:22','09:36',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (58 ,18 ,'09:16','09:57',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (78 ,18 ,'09:14','09:49',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (98 ,18 ,'09:29','09:37',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (118,18,'09:28','09:44',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (138,18,'09:00','09:54',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (158,18,'09:04','09:31',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (178,18,'09:12','09:50',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (198,18,'09:02','09:50',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (18 ,18 ,'10:11','10:43',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (38 ,18 ,'10:12','10:50',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (58 ,18 ,'10:28','10:48',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (78 ,18 ,'10:09','10:52',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (98 ,18 ,'10:24','10:39',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (118,18,'10:01','10:47',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (138,18,'10:06','10:30',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (158,18,'10:10','10:50',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (178,18,'10:03','10:52',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (198,18,'10:26','10:54',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (18 ,18 ,'11:22','11:50',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (38 ,18 ,'11:15','11:36',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (58 ,18 ,'11:08','11:57',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (78 ,18 ,'11:19','11:50',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (98 ,18 ,'11:01','11:42',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (118,18,'11:26','11:40',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (138,18,'11:05','11:58',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (158,18,'11:19','11:39',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (178,18,'11:06','11:55',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (198,18,'11:26','11:51',3);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (18 ,18 ,'12:19','12:44',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (38 ,18 ,'12:17','12:58',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (58 ,18 ,'12:15','12:45',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (78 ,18 ,'12:01','12:49',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (98 ,18 ,'12:00','12:47',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (118,18,'12:00','12:32',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (138,18,'12:00','12:44',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (158,18,'12:03','12:39',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (178,18,'12:02','12:48',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (198,18,'12:26','12:55',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (18 ,18 ,'13:01','13:57',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (38 ,18 ,'13:01','13:48',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (58 ,18 ,'13:10','13:53',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (78 ,18 ,'13:16','13:53',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (98 ,18 ,'13:27','13:50',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (118,18,'13:21','13:31',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (138,18,'13:10','13:50',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (158,18,'13:17','13:33',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (178,18,'13:00','13:40',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (198,18,'13:28','13:57',5);


--kegiatan 19

INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (19,19,'09:25','09:32',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (39,19,'09:22','09:36',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (59,19,'09:16','09:57',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (79,19,'09:14','09:49',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (99,19,'09:29','09:37',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (119,19,'09:28','09:44',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (139,19,'09:00','09:54',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (159,19,'09:04','09:31',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (179,19,'09:12','09:50',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (199,19,'09:02','09:50',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (19,19,'10:11','10:43',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (39,19,'10:12','10:50',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (59,19,'10:28','10:48',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (79,19,'10:09','10:52',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (99,19,'10:24','10:39',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (119,19,'10:01','10:47',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (139,19,'10:06','10:30',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (159,19,'10:10','10:50',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (179,19,'10:03','10:52',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (199,19,'10:26','10:54',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (19,19,'12:19','12:44',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (39,19,'12:17','12:58',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (59,19,'12:15','12:45',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (79,19,'12:01','12:49',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (99,19,'12:00','12:47',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (119,19,'12:00','12:32',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (139,19,'12:00','12:44',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (159,19,'12:03','12:39',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (179,19,'12:02','12:48',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (199,19,'12:26','12:55',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (19,19,'13:01','13:57',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (39,19,'13:01','13:48',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (59,19,'13:10','13:53',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (79,19,'13:16','13:53',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (99,19,'13:27','13:50',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (119,19,'13:21','13:31',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (139,19,'13:10','13:50',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (159,19,'13:17','13:33',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (179,19,'13:00','13:40',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (199,19,'13:28','13:57',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (19,19,'14:16','16:57',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (39,19,'14:28','16:47',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (59,19,'14:22','16:49',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (79,19,'14:14','16:44',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (99,19,'14:19','16:53',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (119,19,'14:29','16:55',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (139,19,'14:27','16:50',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (159,19,'14:11','16:38',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (179,19,'14:04','16:45',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (199,19,'14:09','16:30',6);

--kegiatan 20

INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (20,20,'09:25','09:32',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (40,20,'09:22','09:36',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (60,20,'09:16','09:57',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (80,20,'09:14','09:49',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (100,20,'09:29','09:37',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (120,20,'09:28','09:44',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (140,20,'09:00','09:54',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (160,20,'09:04','09:31',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (180,20,'09:12','09:50',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (200,20,'09:02','09:50',1);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (20,20,'10:11','10:43',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (40,20,'10:12','10:50',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (60,20,'10:28','10:48',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (80,20,'10:09','10:52',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (100,20,'10:24','10:39',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (120,20,'10:01','10:47',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (140,20,'10:06','10:30',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (160,20,'10:10','10:50',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (180,20,'10:03','10:52',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (200,20,'10:26','10:54',2);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (20,20,'12:19','12:44',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (40,20,'12:17','12:58',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (60,20,'12:15','12:45',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (80,20,'12:01','12:49',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (100,20,'12:00','12:47',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (120,20,'12:00','12:32',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (140,20,'12:00','12:44',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (160,20,'12:03','12:39',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (180,20,'12:02','12:48',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (200,20,'12:26','12:55',4);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (20,20,'13:01','15:57',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (40,20,'13:01','15:48',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (60,20,'13:10','15:53',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (80,20,'13:16','15:53',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (100,20,'13:27','15:50',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (120,20,'13:21','15:31',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (140,20,'13:10','15:50',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (160,20,'13:17','15:33',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (180,20,'13:00','15:40',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (200,20,'13:28','15:57',5);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (20,20,'16:16','17:57',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (40,20,'16:28','17:47',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (60,20,'16:22','17:49',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (80,20,'16:14','17:44',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (100,20,'16:19','17:53',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (120,20,'16:29','17:55',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (140,20,'16:27','17:50',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (160,20,'16:11','17:38',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (180,20,'16:04','17:45',6);
INSERT INTO [Mengikuti] (IdM,IdKegiatan,jamAwal,jamAkhir,IdTahapan) VALUES (200,20,'16:09','17:30',6);

-- kesehatan

insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (1, 'Tidak ', 37, '120/80', 1, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (2, 'Tidak ', 36, '120/80', 2, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (3, 'Tidak ', 36, '120/80', 3, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (4, 'Tidak ', 36, '120/80', 4, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (5, 'Tidak ', 35, '120/80', 5, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (6, 'Tidak ', 36, '120/80', 6, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (7, 'Tidak ', 37, '120/80', 7, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (8, 'Tidak ', 36, '120/80', 8, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (9, 'Tidak ', 37, '120/80', 9, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (10, 'Tidak ', 35, '120/80', 10, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (11, 'Tidak ', 35, '120/80', 11, '2020-11-01');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (12, 'Tidak ', 36, '120/80', 12, '2020-12-22');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (13, 'Tidak ', 35, '120/80', 13, '2020-10-18');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (14, 'Tidak ', 35, '120/80', 14, '2020-09-06');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (15, 'Tidak ', 35, '120/80', 15, '2020-12-14');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (16, 'Tidak ', 37, '120/80', 16, '2020-10-17');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (17, 'Tidak ', 37, '120/80', 17, '2020-11-15');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (18, 'Tidak ', 36, '120/80', 18, '2020-11-08');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (19, 'Tidak ', 37, '120/80', 19, '2020-07-14');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (20, 'Tidak ', 35, '120/80', 20, '2020-12-17');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (21, 'Tidak ', 37, '120/80', 21, '2020-07-19');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (22, 'Tidak ', 36, '120/80', 22, '2020-11-11');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (23, 'Tidak ', 36, '120/80', 23, '2020-08-13');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (24, 'Tidak ', 37, '120/80', 24, '2020-12-24');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (25, 'Tidak ', 37, '120/80', 25, '2020-07-13');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (26, 'Tidak ', 35, '120/80', 26, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (27, 'Tidak ', 35, '120/80', 27, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (28, 'Tidak ', 37, '120/80', 28, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (29, 'Tidak ', 35, '120/80', 29, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (30, 'Tidak ', 37, '120/80', 30, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (31, 'Tidak ', 37, '120/80', 31, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (32, 'Tidak ', 36, '120/80', 32, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (33, 'Tidak ', 35, '120/80', 33, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (34, 'Tidak ', 35, '120/80', 34, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (35, 'Tidak ', 37, '120/80', 35, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (36, 'Tidak ', 35, '120/80', 36, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (37, 'Tidak ', 37, '120/80', 37, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (38, 'Tidak ', 36, '120/80', 38, '2020-09-25');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (39, 'Tidak ', 35, '120/80', 39, '2020-09-30');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (40, 'Tidak ', 37, '120/80', 40, '2020-06-06');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (41, 'Tidak ', 35, '120/80', 41, '2020-12-03');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (42, 'Tidak ', 37, '120/80', 42, '2020-08-29');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (43, 'Tidak ', 35, '120/80', 43, '2020-09-05');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (44, 'Tidak ', 37, '120/80', 44, '2020-09-20');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (45, 'Tidak ', 37, '120/80', 45, '2020-06-06');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (46, 'Tidak ', 35, '120/80', 46, '2020-12-21');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (47, 'Tidak ', 36, '120/80', 47, '2020-08-15');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (48, 'Tidak ', 36, '120/80', 48, '2020-10-24');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (49, 'Tidak ', 36, '120/80', 49, '2020-07-17');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (50, 'Tidak ', 37, '120/80', 50, '2020-06-22');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (51, 'Tidak ', 36, '120/80', 51, '2020-10-18');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (52, 'Tidak ', 37, '120/80', 52, '2020-07-02');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (53, 'Tidak ', 37, '120/80', 53, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (54, 'Tidak ', 36, '120/80', 54, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (55, 'Tidak ', 36, '120/80', 55, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (56, 'Tidak ', 36, '120/80', 56, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (57, 'Tidak ', 37, '120/80', 57, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (58, 'Tidak ', 37, '120/80', 58, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (59, 'Tidak ', 36, '120/80', 59, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (60, 'Tidak ', 37, '120/80', 60, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (61, 'Tidak ', 35, '120/80', 61, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (62, 'Tidak ', 37, '120/80', 62, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (63, 'Tidak ', 35, '120/80', 63, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (64, 'Tidak ', 35, '120/80', 64, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (65, 'Tidak ', 35, '120/80', 65, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (66, 'Tidak ', 36, '120/80', 66, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (67, 'Tidak ', 37, '120/80', 67, '2020-06-08');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (68, 'Tidak ', 36, '120/80', 68, '2020-07-13');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (69, 'Tidak ', 36, '120/80', 69, '2020-07-20');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (70, 'Tidak ', 37, '120/80', 70, '2020-09-19');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (71, 'Tidak ', 35, '120/80', 71, '2020-08-21');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (72, 'Tidak ', 37, '120/80', 72, '2020-07-04');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (73, 'Tidak ', 37, '120/80', 73, '2020-11-11');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (74, 'Tidak ', 35, '120/80', 74, '2020-09-12');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (75, 'Tidak ', 35, '120/80', 75, '2020-08-23');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (76, 'Tidak ', 37, '120/80', 76, '2020-09-28');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (77, 'Tidak ', 35, '120/80', 77, '2020-12-09');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (78, 'Tidak ', 37, '120/80', 78, '2020-06-19');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (79, 'Tidak ', 36, '120/80', 79, '2020-07-21');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (80, 'Tidak ', 35, '120/80', 80, '2020-11-21');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (81, 'Tidak ', 37, '120/80', 81, '2020-10-08');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (82, 'Tidak ', 36, '120/80', 82, '2020-11-11');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (83, 'Tidak ', 37, '120/80', 83, '2020-08-13');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (84, 'Tidak ', 35, '120/80', 84, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (85, 'Tidak ', 37, '120/80', 85, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (86, 'Tidak ', 35, '120/80', 86, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (87, 'Tidak ', 35, '120/80', 87, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (88, 'Tidak ', 36, '120/80', 88, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (89, 'Tidak ', 35, '120/80', 89, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (90, 'Tidak ', 37, '120/80', 90, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (91, 'Tidak ', 36, '120/80', 91, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (92, 'Tidak ', 37, '120/80', 92, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (93, 'Tidak ', 35, '120/80', 93, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (94, 'Tidak ', 35, '120/80', 94, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (95, 'Tidak ', 35, '120/80', 95, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (96, 'Tidak ', 37, '120/80', 96, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (97, 'Tidak ', 37, '120/80', 97, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (98, 'Tidak ', 37, '120/80', 98, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (99, 'Tidak ', 36, '120/80', 99, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (100, 'Tidak ', 36, '120/80', 100, '2020-10-28');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (101, 'Tidak ', 37, '120/80', 101, '2020-12-25');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (102, 'Tidak ', 37, '120/80', 102, '2020-08-29');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (103, 'Tidak ', 37, '120/80', 103, '2020-11-30');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (104, 'Tidak ', 37, '120/80', 104, '2020-06-08');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (105, 'Tidak ', 35, '120/80', 105, '2020-09-24');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (106, 'Tidak ', 36, '120/80', 106, '2020-06-21');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (107, 'Tidak ', 37, '120/80', 107, '2020-10-26');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (108, 'Tidak ', 37, '120/80', 108, '2020-08-20');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (109, 'Tidak ', 37, '120/80', 109, '2020-07-08');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (110, 'Tidak ', 36, '120/80', 110, '2020-11-11');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (111, 'Tidak ', 37, '120/80', 111, '2020-07-18');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (112, 'Tidak ', 36, '120/80', 112, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (113, 'Tidak ', 36, '120/80', 113, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (114, 'Tidak ', 35, '120/80', 114, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (115, 'Tidak ', 37, '120/80', 115, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (116, 'Tidak ', 36, '120/80', 116, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (117, 'Tidak ', 36, '120/80', 117, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (118, 'Tidak ', 37, '120/80', 118, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (119, 'Tidak ', 36, '120/80', 119, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (120, 'Tidak ', 37, '120/80', 120, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (121, 'Tidak ', 36, '120/80', 121, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (122, 'Tidak ', 36, '120/80', 122, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (123, 'Tidak ', 35, '120/80', 123, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (124, 'Tidak ', 36, '120/80', 124, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (125, 'Tidak ', 35, '120/80', 125, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (126, 'Tidak ', 36, '120/80', 126, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (127, 'Tidak ', 37, '120/80', 127, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (128, 'Tidak ', 37, '120/80', 128, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (129, 'Tidak ', 36, '120/80', 129, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (130, 'Tidak ', 37, '120/80', 130, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (131, 'Tidak ', 36, '120/80', 131, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (132, 'Tidak ', 36, '120/80', 132, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (133, 'Tidak ', 35, '120/80', 133, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (134, 'Tidak ', 37, '120/80', 134, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (135, 'Tidak ', 37, '120/80', 135, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (136, 'Tidak ', 37, '120/80', 136, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (137, 'Tidak ', 35, '120/80', 137, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (138, 'Tidak ', 36, '120/80', 138, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (139, 'Tidak ', 36, '120/80', 139, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (140, 'Tidak ', 37, '120/80', 140, '2020-08-21');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (141, 'Tidak ', 35, '120/80', 141, '2020-09-23');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (142, 'Tidak ', 36, '120/80', 142, '2020-10-06');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (143, 'Tidak ', 36, '120/80', 143, '2020-09-01');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (144, 'Tidak ', 35, '120/80', 144, '2020-12-10');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (145, 'Tidak ', 37, '120/80', 145, '2020-07-11');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (146, 'Tidak ', 37, '120/80', 146, '2020-06-13');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (147, 'Tidak ', 35, '120/80', 147, '2020-06-22');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (148, 'Tidak ', 35, '120/80', 148, '2020-09-05');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (149, 'Tidak ', 37, '120/80', 149, '2020-12-12');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (150, 'Tidak ', 37, '120/80', 150, '2020-08-06');

insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (151, 'Tidak ', 35, '120/80', 101, '2020-12-25');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (152, 'Tidak ', 35, '120/80', 102, '2020-08-29');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (153, 'Tidak ', 36, '120/80', 103, '2020-11-30');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (154, 'Tidak ', 36, '120/80', 104, '2020-06-08');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (155, 'Tidak ', 36, '120/80', 105, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (156, 'Tidak ', 36, '120/80', 106, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (157, 'Tidak ', 37, '120/80', 107, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (158, 'Tidak ', 37, '120/80', 108, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (159, 'Tidak ', 37, '120/80', 109, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (160, 'Tidak ', 37, '120/80', 110, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (161, 'Tidak ', 37, '120/80', 111, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (162, 'Tidak ', 37, '120/80', 112, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (163, 'Tidak ', 37, '120/80', 113, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (164, 'Tidak ', 37, '120/80', 114, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (165, 'Tidak ', 37, '120/80', 115, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (166, 'Tidak ', 37, '120/80', 116, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (167, 'Tidak ', 35, '120/80', 117, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (168, 'Tidak ', 35, '120/80', 118, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (169, 'Tidak ', 35, '120/80', 119, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (170, 'Tidak ', 36, '120/80', 120, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (171, 'Tidak ', 36, '120/80', 121, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (172, 'Tidak ', 36, '120/80', 122, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (173, 'Tidak ', 36, '120/80', 123, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (174, 'Tidak ', 37, '120/80', 124, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (175, 'Tidak ', 37, '120/80', 125, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (176, 'Tidak ', 37, '120/80', 126, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (177, 'Tidak ', 37, '120/80', 127, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (178, 'Tidak ', 35, '120/80', 128, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (179, 'Tidak ', 35, '120/80', 129, null);
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (180, 'Tidak ', 35, '120/80', 130, '2020-10-03');

insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (181, 'Tidak ', 36, '120/80', 131, '2020-11-01');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (182, 'Tidak ', 36, '120/80', 132, '2020-09-21');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (183, 'Tidak ', 35, '120/80', 133, '2020-07-09');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (184, 'Tidak ', 37, '120/80', 134, '2020-09-24');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (185, 'Tidak ', 37, '120/80', 135, '2020-07-19');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (186, 'Tidak ', 37, '120/80', 136, '2020-11-03');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (187, 'Tidak ', 35, '120/80', 137, '2020-12-06');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (188, 'Tidak ', 36, '120/80', 138, '2020-12-04');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (189, 'Tidak ', 36, '120/80', 139, '2020-11-20');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (190, 'Tidak ', 37, '120/80', 140, '2020-08-21');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (191, 'Tidak ', 35, '120/80', 141, '2020-09-23');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (192, 'Tidak ', 36, '120/80', 142, '2020-10-06');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (193, 'Tidak ', 36, '120/80', 143, '2020-09-01');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (194, 'Tidak ', 35, '120/80', 144, '2020-12-10');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (195, 'Tidak ', 37, '120/80', 145, '2020-07-11');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (196, 'Tidak ', 37, '120/80', 146, '2020-06-13');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (197, 'Tidak ', 35, '120/80', 147, '2020-06-22');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (198, 'Tidak ', 35, '120/80', 148, '2020-09-05');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (199, 'Tidak ', 37, '120/80', 149, '2020-12-12');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (200, 'Tidak ', 37, '120/80', 150, '2020-08-06');

