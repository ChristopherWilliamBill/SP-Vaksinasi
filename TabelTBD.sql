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
    urutanTahapan VARCHAR(15)
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
    IdM INT FOREIGN KEY REFERENCES Masyarakat(IdM)
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

INSERT INTO `Kota` (`IdKota`,`namaKota`)
VALUES
  (1,"Bengkulu"),
  (2,"Bandung"),
  (3,"Jakarta"),
  (4,"Denpasar"),
  (5,"Surabaya");


insert into Lokasi (IdLokasi, namaLokasi, IdKota) values (1, '77576 Merchant Way', 1);
insert into Lokasi (IdLokasi, namaLokasi, IdKota) values (2, '8 Morning Junction', 2);
insert into Lokasi (IdLokasi, namaLokasi, IdKota) values (3, '485 Bartelt Way', 3);
insert into Lokasi (IdLokasi, namaLokasi, IdKota) values (4, '71927 Sloan Circle', 4);
insert into Lokasi (IdLokasi, namaLokasi, IdKota) values (5, '20584 Maywood Lane', 5);


insert into Lokasi (IdLokasi, namaLokasi, IdKota) values (6, '85253 Mccormick Hill', 1);
insert into Lokasi (IdLokasi, namaLokasi, IdKota) values (7, '1 Transport Drive', 2);
insert into Lokasi (IdLokasi, namaLokasi, IdKota) values (8, '812 Rowland Avenue', 3);
insert into Lokasi (IdLokasi, namaLokasi, IdKota) values (9, '1553 Petterle Road', 4);
insert into Lokasi (IdLokasi, namaLokasi, IdKota) values (10, '7 Oxford Road', 5);


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
INSERT INTO Masyarakat VALUES(76,'Bart_Duvall9623@naiker.biz','5-651-731-5241','Bart Duvall','Arundel   Way, 2457',399291800,'1997-12-31 11:13:02Z','Male');
INSERT INTO Masyarakat VALUES(77,'Eduardo_Watson61@womeona.net','2-460-016-0637','Eduardo Watson','Yoakley Road, 2127',2137787909,'1998-02-11 19:17:20Z','Male');
INSERT INTO Masyarakat VALUES(78,'Nicholas_Booth2294@gmail.com','7-705-854-5648','Nicholas Booth','Castile  Hill, 2981',1638632522,'1989-11-24 11:55:51Z','Male');
INSERT INTO Masyarakat VALUES(79,'Peter_Chadwick452@joiniaa.com','8-572-602-4613','Peter Chadwick','Victoria  Route, 7135',628555464,'1985-12-21 12:19:39Z','Male');
INSERT INTO Masyarakat VALUES(80,'Jaylene_Roberts1070@eirey.tech','3-331-537-8200','Jaylene Roberts','Blendon    Boulevard, 213',1000534934,'1994-03-13 01:49:05Z','Female');
INSERT INTO Masyarakat VALUES(81,'Carl_Boden1646@bauros.biz','1-138-055-6025','Carl Boden','Ensign   Tunnel, 847',280855830,'1992-10-22 15:08:42Z','Male');
INSERT INTO Masyarakat VALUES(82,'Maxwell_Thorpe1297@gmail.com','2-482-411-1431','Maxwell Thorpe','Union  Drive, 1712',1380357210,'1987-10-21 20:18:40Z','Male');
INSERT INTO Masyarakat VALUES(83,'Rosa_Bingham2258@gembat.biz','1-844-107-2571','Rosa Bingham','Ely  Avenue, 5734',1910567381,'1989-10-16 16:47:39Z','Female');
INSERT INTO Masyarakat VALUES(84,'Danny_Horton3550@bretoux.com','6-752-536-6022','Danny Horton','Mariner  Rue, 3296',1286887792,'1987-07-08 04:21:21Z','Male');
INSERT INTO Masyarakat VALUES(85,'Faith_Selby5809@elnee.tech','0-004-030-1131','Faith Selby','Chestnut Rise Road, 353',1365755359,'1988-11-30 01:24:14Z','Female');
INSERT INTO Masyarakat VALUES(86,'Lynn_Rixon2677@ubusive.com','8-351-621-0743','Lynn Rixon','Mariner  Vale, 469',177220658,'1984-08-02 11:32:55Z','Female');
INSERT INTO Masyarakat VALUES(87,'Crystal_Middleton63@sheye.org','4-046-505-7200','Crystal Middleton','Camelot   Drive, 4610',1975207565,'2000-02-10 04:12:29Z','Female');
INSERT INTO Masyarakat VALUES(88,'Carolyn_Jones3246@nickia.com','2-448-170-5312','Carolyn Jones','Liverpool  Boulevard, 1740',1039667153,'1997-05-09 19:53:00Z','Female');
INSERT INTO Masyarakat VALUES(89,'Rufus_Niles8596@twipet.com','8-870-055-1024','Rufus Niles','Dutton   Walk, 360',1620705305,'1981-08-16 19:36:17Z','Male');
INSERT INTO Masyarakat VALUES(90,'Holly_Yarlett9783@sveldo.biz','8-034-873-6627','Holly Yarlett','Waite  Hill, 3839',889990158,'1993-03-24 11:17:51Z','Female');
INSERT INTO Masyarakat VALUES(91,'Lynn_Radcliffe7690@naiker.biz','8-870-808-7804','Lynn Radcliffe','Beaumont  Rue, 1420',1088497048,'1983-05-18 08:06:47Z','Female');
INSERT INTO Masyarakat VALUES(92,'Mark_Plant7100@atink.com','7-410-281-5688','Mark Plant','Canning  Way, 7622',1855665070,'1997-02-20 07:35:18Z','Male');
INSERT INTO Masyarakat VALUES(93,'Hayden_Redwood3766@hourpy.biz','4-802-855-0804','Hayden Redwood','Apollo  Crossroad, 6454',1807132567,'1987-03-05 16:58:11Z','Female');
INSERT INTO Masyarakat VALUES(94,'Lily_White6636@vetan.org','4-685-703-7178','Lily White','Berriman  Tunnel, 7939',1494722821,'1985-07-07 12:39:39Z','Female');
INSERT INTO Masyarakat VALUES(95,'Peter_Wilkinson1576@brety.org','5-787-265-3638','Peter Wilkinson','Battis   Grove, 1168',2082140362,'1983-08-23 00:38:47Z','Male');
INSERT INTO Masyarakat VALUES(96,'Elise_Clifford8904@bretoux.com','0-060-506-6812','Elise Clifford','Blackheath   Drive, 9007',1863773857,'1988-07-28 16:32:26Z','Female');
INSERT INTO Masyarakat VALUES(97,'David_Cameron6356@elnee.tech','0-718-415-0425','David Cameron','Chester      Boulevard, 1317',1561696744,'1984-07-26 22:29:53Z','Male');
INSERT INTO Masyarakat VALUES(98,'Agnes_Riley6812@sheye.org','4-864-784-0542','Agnes Riley','Caroline  Walk, 4232',1974012551,'1993-11-21 08:29:36Z','Female');
INSERT INTO Masyarakat VALUES(99,'Domenic_Woods1728@atink.com','4-557-600-4201','Domenic Woods','Armory  Hill, 6670',1321905783,'1981-09-24 19:39:35Z','Male');
INSERT INTO Masyarakat VALUES(100,'Sonya_Lloyd8254@deons.tech','3-411-204-5322','Sonya Lloyd','Monroe Vale, 9683',1030110926,'1984-05-28 03:31:24Z','Female');
INSERT INTO Masyarakat VALUES(101,'Sienna_Whatson2356@kideod.biz','5-671-424-7724','Sienna Whatson','Littlebury  Boulevard, 9643',191881589,'1994-10-11 06:09:20Z','Female');
INSERT INTO Masyarakat VALUES(102,'Danny_Mooney756@typill.biz','4-658-256-8653','Danny Mooney','Victoria  Grove, 8469',2062275137,'1995-05-27 01:22:39Z','Male');
INSERT INTO Masyarakat VALUES(103,'Rocco_Saunders5026@atink.com','5-541-280-6305','Rocco Saunders','Blandford  Crossroad, 5334',595701243,'1996-08-27 00:35:19Z','Male');
INSERT INTO Masyarakat VALUES(104,'Melanie_Ellis3152@acrit.org','0-200-451-1768','Melanie Ellis','Hamilton  Walk, 4076',645096560,'1987-04-03 21:04:46Z','Female');
INSERT INTO Masyarakat VALUES(105,'Jocelyn_Thomson9455@gembat.biz','2-128-063-1715','Jocelyn Thomson','Kinglake  Rue, 8076',1263001818,'1989-10-10 16:03:49Z','Female');
INSERT INTO Masyarakat VALUES(106,'Sebastian_Patel6371@tonsy.org','1-647-474-0723','Sebastian Patel','Blandford  Street, 7073',96680972,'1992-01-15 00:57:12Z','Male');
INSERT INTO Masyarakat VALUES(107,'Barry_Wright3747@extex.org','1-181-500-5688','Barry Wright','Chancellor  Boulevard, 3115',1455993250,'1982-07-23 20:50:31Z','Male');
INSERT INTO Masyarakat VALUES(108,'Marjorie_Watt8923@gembat.biz','5-284-784-1726','Marjorie Watt','Gautrey  Lane, 2351',1622450765,'1988-07-28 06:25:43Z','Female');
INSERT INTO Masyarakat VALUES(109,'Boris_Jackson8872@extex.org','3-363-357-0806','Boris Jackson','Dutton   Alley, 9109',2053453916,'1990-03-27 15:25:58Z','Male');
INSERT INTO Masyarakat VALUES(110,'Grace_Fleming2970@gompie.com','2-058-475-0435','Grace Fleming','Battis   Pass, 4718',667941409,'1998-07-03 09:00:11Z','Female');
INSERT INTO Masyarakat VALUES(111,'Rihanna_Donnelly6997@corti.com','0-262-346-3704','Rihanna Donnelly','Birkbeck  Street, 4746',1708901979,'1983-07-20 21:31:28Z','Female');
INSERT INTO Masyarakat VALUES(112,'Celia_Exton3014@deavo.com','1-837-115-8334','Celia Exton','Ben   Walk, 1544',79038451,'1997-02-08 07:55:23Z','Female');
INSERT INTO Masyarakat VALUES(113,'Bristol_Leigh9929@ubusive.com','4-601-612-3514','Bristol Leigh','East Way, 6179',98974833,'1999-09-28 06:45:06Z','Female');
INSERT INTO Masyarakat VALUES(114,'Penelope_Gavin5264@muall.tech','3-851-003-3463','Penelope Gavin','Magnolia Rue, 6715',1722303942,'1984-09-05 12:14:58Z','Female');
INSERT INTO Masyarakat VALUES(115,'Cadence_Hamilton4448@tonsy.org','3-332-032-4521','Cadence Hamilton','Balfour    Street, 5760',1797530295,'1981-07-12 19:09:51Z','Female');
INSERT INTO Masyarakat VALUES(116,'Rick_Forth9073@kideod.biz','6-730-165-1855','Rick Forth','Linda Lane Alley, 3780',1303557459,'1983-04-15 00:06:20Z','Male');
INSERT INTO Masyarakat VALUES(117,'Carmen_Aldridge8206@joiniaa.com','5-448-663-4734','Carmen Aldridge','Ensign   Grove, 4638',879742296,'1991-05-18 14:15:56Z','Female');
INSERT INTO Masyarakat VALUES(118,'Abdul_Stone4816@gmail.com','3-468-831-5541','Abdul Stone','Camberwell  Street, 2087',353362942,'1984-12-08 11:13:57Z','Male');
INSERT INTO Masyarakat VALUES(119,'Naomi_Griffiths7552@kideod.biz','7-062-386-8532','Naomi Griffiths','Carnegie   Way, 8810',2073183289,'1986-04-09 07:47:00Z','Female');
INSERT INTO Masyarakat VALUES(120,'Chad_Brett1303@gmail.com','5-475-177-8412','Chad Brett','Gautrey  Boulevard, 2682',978604081,'1989-03-08 05:36:49Z','Male');
INSERT INTO Masyarakat VALUES(121,'Isabella_Watt9377@vetan.org','8-753-030-5773','Isabella Watt','Boleyn  Route, 4362',888236434,'1988-05-03 13:09:41Z','Female');
INSERT INTO Masyarakat VALUES(122,'Angela_Ryan4717@ovock.tech','1-715-661-7820','Angela Ryan','Central  Way, 3503',434315575,'1986-02-28 21:28:26Z','Female');
INSERT INTO Masyarakat VALUES(123,'Felicity_Butler2445@nanoff.biz','0-651-782-1384','Felicity Butler','Fairbairn  Road, 1242',1866453292,'1984-03-04 02:25:11Z','Female');
INSERT INTO Masyarakat VALUES(124,'Stella_Clarke9089@kideod.biz','7-402-425-8368','Stella Clarke','Magnolia Rue, 1508',1402601157,'1995-12-05 01:12:21Z','Female');
INSERT INTO Masyarakat VALUES(125,'Daniel_Jones3257@extex.org','3-386-008-6683','Daniel Jones','Camley   Crossroad, 9396',615994699,'1998-08-02 19:37:25Z','Male');
INSERT INTO Masyarakat VALUES(126,'Jack_Wright8483@naiker.biz','0-645-881-6207','Jack Wright','Mariner  Boulevard, 3634',800183908,'1981-05-27 18:52:12Z','Male');
INSERT INTO Masyarakat VALUES(127,'Wade_Skinner6491@ubusive.com','5-281-381-1782','Wade Skinner','Vintners  Alley, 8103',18869507,'1984-12-16 08:32:50Z','Male');
INSERT INTO Masyarakat VALUES(128,'Maya_Wilson7990@twace.org','7-407-174-7226','Maya Wilson','Chestnut Rise Way, 9750',1837724602,'1994-09-24 11:25:24Z','Female');
INSERT INTO Masyarakat VALUES(129,'Matthew_Pierce2142@brety.org','2-637-010-1043','Matthew Pierce','King Tunnel, 6981',1931040449,'1997-06-10 15:44:29Z','Male');
INSERT INTO Masyarakat VALUES(130,'Mike_Fox7068@twace.org','6-074-404-7181','Mike Fox','Caedmon  Road, 2394',1755839693,'1993-04-26 01:33:27Z','Male');
INSERT INTO Masyarakat VALUES(131,'Leroy_Roscoe3161@kideod.biz','8-858-641-6530','Leroy Roscoe','Sheffield Way, 4982',1271017666,'1998-10-03 05:06:45Z','Male');
INSERT INTO Masyarakat VALUES(132,'Mason_Payne3235@nickia.com','8-108-443-4050','Mason Payne','Fairholt   Drive, 4109',1115117994,'1981-04-22 07:20:52Z','Male');
INSERT INTO Masyarakat VALUES(133,'Leanne_Glass635@hourpy.biz','3-183-524-2172','Leanne Glass','Maple Walk, 1578',292004427,'1993-06-29 14:35:51Z','Female');
INSERT INTO Masyarakat VALUES(134,'Zara_Graham2824@guentu.biz','4-251-141-0103','Zara Graham','Argyle  Vale, 3925',1319370495,'1992-09-15 15:44:35Z','Female');
INSERT INTO Masyarakat VALUES(135,'George_Nicholls300@cispeto.com','7-716-713-6418','George Nicholls','Blandford  Alley, 31',1435954189,'1982-04-28 22:38:04Z','Male');
INSERT INTO Masyarakat VALUES(136,'Jamie_Johnson4857@nimogy.biz','3-400-781-5535','Jamie Johnson','Sherwood  Tunnel, 2974',196863879,'1998-05-27 16:39:13Z','Female');
INSERT INTO Masyarakat VALUES(137,'Ryan_Osman2700@atink.com','0-804-235-6045','Ryan Osman','Camdale  Way, 6105',1642643455,'1996-01-28 06:25:36Z','Male');
INSERT INTO Masyarakat VALUES(138,'Winnie_Stone 1741@iatim.tech','4-780-876-7870','Winnie Stone ','Dutton   Alley, 4046',2068858027,'1980-06-27 05:12:49Z','Female');
INSERT INTO Masyarakat VALUES(139,'Gil_Hewitt9954@nimogy.biz','4-115-825-8764','Gil Hewitt','Mariner  Rue, 1134',685132925,'1998-09-09 11:44:45Z','Male');
INSERT INTO Masyarakat VALUES(140,'Sharon_Wade5874@nimogy.biz','8-448-046-8245','Sharon Wade','Fawn Tunnel, 8999',1040200771,'1989-06-08 02:11:40Z','Female');
INSERT INTO Masyarakat VALUES(141,'Bob_Forth1508@ubusive.com','0-226-821-4707','Bob Forth','Endsleigh  Road, 8147',1642943089,'1995-12-21 15:21:36Z','Male');
INSERT INTO Masyarakat VALUES(142,'Sebastian_Hunt2582@sheye.org','5-020-333-3501','Sebastian Hunt','Norland  Street, 4022',1573465609,'1990-10-25 01:22:48Z','Male');
INSERT INTO Masyarakat VALUES(143,'Barney_Martin4599@brety.org','6-140-074-0022','Barney Martin','Angrave    Grove, 5416',656319809,'1988-08-30 15:23:47Z','Male');
INSERT INTO Masyarakat VALUES(144,'Rosalyn_Bishop3432@womeona.net','1-705-355-7351','Rosalyn Bishop','Littlebury  Tunnel, 5606',1731008810,'1994-03-18 09:11:07Z','Female');
INSERT INTO Masyarakat VALUES(145,'Benjamin_Wilcox1289@twipet.com','6-653-311-1578','Benjamin Wilcox','Thorndike   Grove, 6404',619102767,'1992-04-21 21:06:51Z','Male');
INSERT INTO Masyarakat VALUES(146,'Havana_Walton6155@supunk.biz','7-272-750-8257','Havana Walton','Blore  Avenue, 9349',1191338825,'2000-04-26 17:39:42Z','Female');
INSERT INTO Masyarakat VALUES(147,'Doug_Mcneill4171@kideod.biz','7-485-727-8848','Doug Mcneill','Anns  Crossroad, 7978',1579298056,'1998-05-19 12:11:58Z','Male');
INSERT INTO Masyarakat VALUES(148,'Jack_Dickson4342@corti.com','6-613-186-3780','Jack Dickson','Cavaye  Tunnel, 4837',1406246754,'1980-07-29 02:29:23Z','Male');
INSERT INTO Masyarakat VALUES(149,'Jolene_Addis4570@acrit.org','6-655-833-4104','Jolene Addis','Calverley  Way, 8550',842043227,'1985-08-02 22:58:47Z','Female');
INSERT INTO Masyarakat VALUES(150,'Adela_Hunter6528@hourpy.biz','4-868-778-5031','Adela Hunter','Queensberry  Crossroad, 9394',810707321,'1994-09-03 13:06:24Z','Female');
INSERT INTO Masyarakat VALUES(151,'Aiden_Collins7967@liret.org','5-802-430-8643','Aiden Collins','Castle Hill, 2747',1527247745,'1993-04-11 01:35:24Z','Male');
INSERT INTO Masyarakat VALUES(152,'Carl_Lindsay1869@corti.com','2-127-582-8627','Carl Lindsay','Chart   Route, 4567',2108738347,'1982-05-15 05:06:28Z','Male');
INSERT INTO Masyarakat VALUES(153,'Rosalee_Ring1200@nanoff.biz','1-813-047-7622','Rosalee Ring','Commercial  Alley, 1621',1070980012,'1982-08-14 13:50:02Z','Female');
INSERT INTO Masyarakat VALUES(154,'Mason_Briggs4028@acrit.org','8-058-323-1630','Mason Briggs','Sheringham   Way, 6098',618502245,'1999-12-12 22:38:09Z','Male');
INSERT INTO Masyarakat VALUES(155,'Chester_Jarrett9795@deons.tech','4-176-346-7814','Chester Jarrett','Tilloch   Lane, 3972',2023437765,'1997-10-25 13:22:45Z','Male');
INSERT INTO Masyarakat VALUES(156,'Eileen_Vangness3300@kideod.biz','7-085-060-5870','Eileen Vangness','Castle Avenue, 3209',290380364,'1986-07-11 06:37:23Z','Female');
INSERT INTO Masyarakat VALUES(157,'Rhea_Newton949@bulaffy.com','6-614-058-4244','Rhea Newton','Camden  Street, 9747',1155331041,'1989-04-06 16:58:34Z','Female');
INSERT INTO Masyarakat VALUES(158,'Rhea_Rowlands9140@twace.org','6-271-766-8628','Rhea Rowlands','Gathorne   Road, 8154',1605971723,'1984-09-26 02:16:47Z','Female');
INSERT INTO Masyarakat VALUES(159,'Aurelia_Aldridge9421@sheye.org','8-061-566-2332','Aurelia Aldridge','Catherine  Boulevard, 4412',535937078,'1995-07-12 20:29:43Z','Female');
INSERT INTO Masyarakat VALUES(160,'Owen_Shaw3267@brety.org','1-725-555-8376','Owen Shaw','Bolingbroke  Pass, 732',956731222,'1985-11-12 14:38:27Z','Male');
INSERT INTO Masyarakat VALUES(161,'Mike_Wilcox552@vetan.org','5-584-128-3348','Mike Wilcox','Thorndike   Rue, 8080',666494899,'1991-10-23 03:57:37Z','Male');
INSERT INTO Masyarakat VALUES(162,'Carl_Richards1745@gembat.biz','8-862-538-1880','Carl Richards','Aspen Grove, 1477',1121334905,'1995-12-23 16:19:37Z','Male');
INSERT INTO Masyarakat VALUES(163,'Nicole_Dempsey7842@kideod.biz','0-718-841-6223','Nicole Dempsey','Clarks  Road, 8437',2026647477,'1998-10-25 05:43:51Z','Female');
INSERT INTO Masyarakat VALUES(164,'Danny_Mitchell1557@twipet.com','8-774-381-8745','Danny Mitchell','Berry  Street, 374',1278947954,'1998-11-08 22:12:49Z','Male');
INSERT INTO Masyarakat VALUES(165,'Caydence_Palmer5718@bauros.biz','5-181-520-0686','Caydence Palmer','Gate   Tunnel, 8567',1421116802,'1984-02-22 06:10:17Z','Female');
INSERT INTO Masyarakat VALUES(166,'Kate_Connor4670@nimogy.biz','7-480-622-2676','Kate Connor','Elizabeth  Pass, 2559',1651438024,'1991-09-29 16:30:05Z','Female');
INSERT INTO Masyarakat VALUES(167,'Olivia_Stone 5026@ovock.tech','2-410-554-4467','Olivia Stone ','Heritage Road, 9851',765435143,'1989-04-07 02:28:04Z','Female');
INSERT INTO Masyarakat VALUES(168,'Caleb_Callan652@bungar.biz','3-457-111-4037','Caleb Callan','Railroad Vale, 1691',1710543965,'1986-03-13 15:16:30Z','Male');
INSERT INTO Masyarakat VALUES(169,'Johnathan_Andersson4485@liret.org','4-228-875-1110','Johnathan Andersson','Bennett  Rue, 3485',926808840,'1993-11-12 12:57:34Z','Male');
INSERT INTO Masyarakat VALUES(170,'Chuck_Talbot8674@jiman.org','3-235-368-1568','Chuck Talbot','Bennett  Hill, 1123',801165618,'1985-07-16 22:58:58Z','Male');
INSERT INTO Masyarakat VALUES(171,'Eileen_Walker9565@brety.org','8-685-748-3554','Eileen Walker','Oxford Avenue, 7825',1195021286,'1983-03-09 16:07:40Z','Female');
INSERT INTO Masyarakat VALUES(172,'Ronald_Norris9506@gompie.com','3-826-732-4830','Ronald Norris','Abbey   Hill, 7025',1748707552,'1981-02-12 10:51:29Z','Male');
INSERT INTO Masyarakat VALUES(173,'Melinda_Watson5546@infotech44.tech','6-722-887-0044','Melinda Watson','Hickory   Rue, 8095',1616646388,'1985-03-07 16:33:23Z','Female');
INSERT INTO Masyarakat VALUES(174,'Chester_Simmons4949@mafthy.com','3-137-477-6714','Chester Simmons','Catherine  Vale, 9798',1304810552,'1983-01-29 22:29:11Z','Male');
INSERT INTO Masyarakat VALUES(175,'Gladys_Milner2538@qater.org','3-871-753-6657','Gladys Milner','Cavendish Vale, 5756',802077189,'1994-08-25 18:51:39Z','Female');
INSERT INTO Masyarakat VALUES(176,'Harry_Cooper94@bretoux.com','1-517-140-0008','Harry Cooper','Wake  Rue, 9541',918194735,'1981-12-15 06:22:22Z','Male');
INSERT INTO Masyarakat VALUES(177,'Alexander_Ward5687@infotech44.tech','5-834-573-7758','Alexander Ward','Meadow Drive, 5912',2034173617,'1995-12-31 09:07:28Z','Male');
INSERT INTO Masyarakat VALUES(178,'Chester_Preston1006@muall.tech','8-114-626-5745','Chester Preston','Blue Anchor  Hill, 3611',1524927631,'1992-06-29 04:50:17Z','Male');
INSERT INTO Masyarakat VALUES(179,'Bryon_Veale3350@sheye.org','1-638-240-2765','Bryon Veale','Elystan  Boulevard, 1159',1429197376,'1983-12-19 12:07:05Z','Male');
INSERT INTO Masyarakat VALUES(180,'Alex_Stewart2009@dionrab.com','4-253-753-7645','Alex Stewart','Tilloch   Pass, 5767',2098936033,'1992-05-20 09:42:35Z','Female');
INSERT INTO Masyarakat VALUES(181,'Candace_Collingwood9574@corti.com','2-168-538-2761','Candace Collingwood','Anns  Crossroad, 664',1729766410,'1983-12-09 06:36:37Z','Female');
INSERT INTO Masyarakat VALUES(182,'Morgan_Cameron665@qater.org','6-014-565-6843','Morgan Cameron','Timothy  Drive, 435',1973460959,'1993-10-16 01:55:51Z','Female');
INSERT INTO Masyarakat VALUES(183,'Luna_Greenwood4079@womeona.net','1-202-545-5082','Luna Greenwood','Bethwin  Pass, 2020',2058201055,'1992-06-08 16:53:33Z','Female');
INSERT INTO Masyarakat VALUES(184,'Johnny_Stark5622@famism.biz','7-761-513-6843','Johnny Stark','Beechen  Grove, 3444',18307301,'1994-06-23 01:54:04Z','Male');
INSERT INTO Masyarakat VALUES(185,'Bryon_Thorne8236@eirey.tech','4-505-076-4175','Bryon Thorne','Bliss  Grove, 4162',430937899,'1997-06-02 00:44:43Z','Male');
INSERT INTO Masyarakat VALUES(186,'Jayden_Garner5827@twace.org','3-346-141-7814','Jayden Garner','Cheltenham  Street, 9174',787316355,'1995-01-31 21:14:32Z','Male');
INSERT INTO Masyarakat VALUES(187,'Catherine_Mccormick2825@bungar.biz','7-581-110-4353','Catherine Mccormick','Balham   Pass, 235',1464562727,'1990-07-06 02:26:17Z','Female');
INSERT INTO Masyarakat VALUES(188,'Ema_Hooper1048@guentu.biz','1-002-368-1728','Ema Hooper','Queensberry  Rue, 8396',196499725,'1989-03-11 19:43:15Z','Female');
INSERT INTO Masyarakat VALUES(189,'Celina_Durrant2309@qater.org','5-110-406-8281','Celina Durrant','Pine Tunnel, 386',226209359,'1990-12-12 22:54:41Z','Female');
INSERT INTO Masyarakat VALUES(190,'Isabel_Uttridge3796@hourpy.biz','5-058-387-6365','Isabel Uttridge','Bingham   Street, 3870',1483061377,'1983-10-21 05:21:52Z','Female');
INSERT INTO Masyarakat VALUES(191,'Logan_Knight3695@nimogy.biz','4-247-415-7178','Logan Knight','Oxford Drive, 9539',67167754,'1987-07-12 06:52:15Z','Male');
INSERT INTO Masyarakat VALUES(192,'Mike_Butler4003@eirey.tech','1-065-403-1176','Mike Butler','Sundown Drive, 8948',900207271,'1980-06-02 19:02:33Z','Male');
INSERT INTO Masyarakat VALUES(193,'Elisabeth_York9185@gmail.com','0-630-766-0530','Elisabeth York','Woodland Street, 6919',498775376,'1990-07-17 21:45:09Z','Female');
INSERT INTO Masyarakat VALUES(194,'Bryon_Owen6883@ubusive.com','0-688-276-7233','Bryon Owen','Timber   Vale, 3799',2081412780,'2000-01-21 04:23:32Z','Male');
INSERT INTO Masyarakat VALUES(195,'Esmeralda_Vince8040@bulaffy.com','0-425-366-6670','Esmeralda Vince','Berry  Alley, 3373',1136783041,'1988-12-19 00:53:16Z','Female');
INSERT INTO Masyarakat VALUES(196,'Mike_Antcliff1245@jiman.org','7-841-133-1013','Mike Antcliff','Camelot   Vale, 9418',674501762,'1993-12-15 04:25:32Z','Male');
INSERT INTO Masyarakat VALUES(197,'Maddison_Mccall725@famism.biz','1-603-320-1347','Maddison Mccall','Fieldstone Hill, 5574',1089505201,'1992-07-25 14:01:10Z','Female');
INSERT INTO Masyarakat VALUES(198,'Hannah_Cobb5945@brety.org','3-370-068-3105','Hannah Cobb','Gate   Pass, 7386',249797822,'1987-03-30 07:44:26Z','Female');
INSERT INTO Masyarakat VALUES(199,'Ivy_Eyres511@joiniaa.com','5-070-026-4608','Ivy Eyres','Meadow Road, 3344',519739256,'1998-03-05 19:21:30Z','Female');
INSERT INTO Masyarakat VALUES(200,'Ema_Emmott2883@deavo.com','6-146-264-7646','Ema Emmott','Linda Lane Route, 1170',439373744,'1996-12-03 20:05:42Z','Female');

INSERT INTO Tahapan VALUES(1, "pendaftaran");
INSERT INTO Tahapan VALUES(2, "konfirmasi penyelenggara");
INSERT INTO Tahapan VALUES(3, "pendaftaran ulang");
INSERT INTO Tahapan VALUES(4, "cek kesehatan");
INSERT INTO Tahapan VALUES(5, "pemberian vaksin");
INSERT INTO Tahapan VALUES(6, "cetak sertifikat");

INSERT INTO Vaksin VALUES(1, "Sinovac");
INSERT INTO Vaksin VALUES(2, "Pfizer");
INSERT INTO Vaksin VALUES(3, "Moderna");

insert into Penyelenggara (IdPenyelenggara, nama, urutanTahapan) values (1, 'Dabfeed', '123456');
insert into Penyelenggara (IdPenyelenggara, nama, urutanTahapan) values (2, 'Kazio', '123456');
insert into Penyelenggara (IdPenyelenggara, nama, urutanTahapan) values (3, 'Chatterbridge', '123456');
insert into Penyelenggara (IdPenyelenggara, nama, urutanTahapan) values (4, 'Dazzlesphere', '123456');
insert into Penyelenggara (IdPenyelenggara, nama, urutanTahapan) values (5, 'DabZ', '123456');
insert into Penyelenggara (IdPenyelenggara, nama, urutanTahapan) values (6, 'Devshare', '12345');
insert into Penyelenggara (IdPenyelenggara, nama, urutanTahapan) values (7, 'Twinte', '12345');
insert into Penyelenggara (IdPenyelenggara, nama, urutanTahapan) values (8, 'Teklist', '12345');
insert into Penyelenggara (IdPenyelenggara, nama, urutanTahapan) values (9, 'Zoomlounge', '12345');
insert into Penyelenggara (IdPenyelenggara, nama, urutanTahapan) values (10, 'Zoomzone', '12456');


insert into Kegiatan (IDKegiatan, kuota, waktu, tanggal, IdLokasi, IdPenyelenggara) values (1, 50, '9:00', '2021-10-25', 1, 1);
insert into Kegiatan (IDKegiatan, kuota, waktu, tanggal, IdLokasi, IdPenyelenggara) values (2, 50, '9:00', '2021-11-27', 1, 1);
insert into Kegiatan (IDKegiatan, kuota, waktu, tanggal, IdLokasi, IdPenyelenggara) values (3, 50, '9:00', '2021-10-02', 2, 2);
insert into Kegiatan (IDKegiatan, kuota, waktu, tanggal, IdLokasi, IdPenyelenggara) values (4, 50, '9:00', '2021-11-18', 2, 2);
insert into Kegiatan (IDKegiatan, kuota, waktu, tanggal, IdLokasi, IdPenyelenggara) values (5, 50, '9:00', '2021-10-12', 3, 3);
insert into Kegiatan (IDKegiatan, kuota, waktu, tanggal, IdLokasi, IdPenyelenggara) values (6, 50, '9:00', '2021-11-11', 3, 3);
insert into Kegiatan (IDKegiatan, kuota, waktu, tanggal, IdLokasi, IdPenyelenggara) values (7, 50, '9:00', '2021-10-25', 4, 4);
insert into Kegiatan (IDKegiatan, kuota, waktu, tanggal, IdLokasi, IdPenyelenggara) values (8, 50, '9:00', '2021-11-27', 4, 4);
insert into Kegiatan (IDKegiatan, kuota, waktu, tanggal, IdLokasi, IdPenyelenggara) values (9, 50, '9:00', '2021-10-30', 5, 5);
insert into Kegiatan (IDKegiatan, kuota, waktu, tanggal, IdLokasi, IdPenyelenggara) values (10, 50, '9:00', '2021-11-29', 5, 5);
insert into Kegiatan (IDKegiatan, kuota, waktu, tanggal, IdLokasi, IdPenyelenggara) values (11, 50, '9:00', '2021-10-18', 6, 6);
insert into Kegiatan (IDKegiatan, kuota, waktu, tanggal, IdLokasi, IdPenyelenggara) values (12, 50, '9:00', '2021-11-30', 6, 6);
insert into Kegiatan (IDKegiatan, kuota, waktu, tanggal, IdLokasi, IdPenyelenggara) values (13, 50, '9:00', '2021-10-28', 7, 7);
insert into Kegiatan (IDKegiatan, kuota, waktu, tanggal, IdLokasi, IdPenyelenggara) values (14, 50, '9:00', '2021-11-24', 7, 7);
insert into Kegiatan (IDKegiatan, kuota, waktu, tanggal, IdLokasi, IdPenyelenggara) values (15, 50, '9:00', '2021-10-30', 8, 8);
insert into Kegiatan (IDKegiatan, kuota, waktu, tanggal, IdLokasi, IdPenyelenggara) values (16, 50, '9:00', '2021-11-03', 8, 8);
insert into Kegiatan (IDKegiatan, kuota, waktu, tanggal, IdLokasi, IdPenyelenggara) values (17, 50, '9:00', '2021-10-27', 9, 9);
insert into Kegiatan (IDKegiatan, kuota, waktu, tanggal, IdLokasi, IdPenyelenggara) values (18, 50, '9:00', '2021-11-01', 9, 9);
insert into Kegiatan (IDKegiatan, kuota, waktu, tanggal, IdLokasi, IdPenyelenggara) values (19, 50, '9:00', '2021-10-25', 10, 10);
insert into Kegiatan (IDKegiatan, kuota, waktu, tanggal, IdLokasi, IdPenyelenggara) values (20, 50, '9:00', '2021-11-18', 10, 10);

-- belum ada yang Astra, buat booster saja
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (1, 1, 1, 1);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (2, 1, 2, 2);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (3, 1, 3, 3);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (4, 1, 4, 4);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (5, 1, 5, 5);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (6, 1, 6, 6);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (7, 1, 7, 7);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (8, 1, 8, 8);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (9, 1, 9, 9);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (10, 1, 10, 10);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (11, 1, 11, 11);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (12, 1, 12, 12);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (13, 1, 13, 13);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (14, 1, 14, 14);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (15, 1, 15, 15);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (16, 1, 16, 16);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (17, 1, 17, 17);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (18, 1, 18, 18);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (19, 1, 19, 19);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (20, 1, 20, 20);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (21, 1, 21, 1);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (22, 1, 22, 2);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (23, 1, 23, 3);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (24, 1, 24, 4);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (25, 1, 25, 5);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (26, 1, 26, 6);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (27, 1, 27, 7);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (28, 1, 28, 8);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (29, 1, 29, 9);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (30, 1, 30, 10);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (31, 1, 31, 11);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (32, 1, 32, 12);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (33, 1, 33, 13);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (34, 1, 34, 14);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (35, 1, 35, 15);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (36, 1, 36, 16);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (37, 1, 37, 17);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (38, 1, 38, 18);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (39, 1, 39, 19);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (40, 1, 40, 20);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (41, 1, 41, 1);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (42, 1, 42, 2);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (43, 1, 43, 3);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (44, 1, 44, 4);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (45, 1, 45, 5);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (46, 1, 46, 6);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (47, 1, 47, 7);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (48, 1, 48, 8);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (49, 1, 49, 9);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (50, 1, 50, 10);


--dosis 2

insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (51, 2, 51, 11);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (52, 2, 52, 12);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (53, 2, 53, 13);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (54, 2, 54, 14);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (55, 2, 55, 15);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (56, 2, 56, 16);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (57, 2, 57, 17);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (58, 2, 58, 18);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (59, 2, 59, 19);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (60, 2, 60, 20);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (61, 2, 61, 1);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (62, 2, 62, 2);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (63, 2, 63, 3);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (64, 2, 64, 4);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (65, 2, 65, 5);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (66, 2, 66, 6);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (67, 2, 67, 7);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (68, 2, 68, 8);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (69, 2, 69, 9);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (70, 2, 70, 10);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (71, 2, 71, 11);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (72, 2, 72, 12);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (73, 2, 73, 13);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (74, 2, 74, 14);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (75, 2, 75, 15);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (76, 2, 76, 16);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (77, 2, 77, 17);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (78, 2, 78, 18);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (79, 2, 79, 19);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (80, 2, 80, 20);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (81, 2, 81, 1);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (82, 2, 82, 2);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (83, 2, 83, 3);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (84, 2, 84, 4);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (85, 2, 85, 5);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (86, 2, 86, 6);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (87, 2, 87, 7);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (88, 2, 88, 8);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (89, 2, 89, 9);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (90, 2, 90, 10);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (91, 2, 91, 11);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (92, 2, 92, 12);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (93, 2, 93, 13);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (94, 2, 94, 14);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (95, 2, 95, 15);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (96, 2, 96, 16);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (97, 2, 97, 17);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (98, 2, 98, 18);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (99, 2, 99, 19);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (100, 2, 100, 20);


--dosis 3
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (101, 3, 101, 1);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (102, 3, 102, 2);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (103, 3, 103, 3);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (104, 3, 104, 4);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (105, 3, 105, 5);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (106, 3, 106, 6);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (107, 3, 107, 7);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (108, 3, 108, 8);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (109, 3, 109, 9);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (110, 3, 110, 10);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (111, 3, 111, 11);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (112, 3, 112, 12);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (113, 3, 113, 13);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (114, 3, 114, 14);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (115, 3, 115, 15);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (116, 3, 116, 16);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (117, 3, 117, 17);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (118, 3, 118, 18);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (119, 3, 119, 19);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (120, 3, 120, 20);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (121, 3, 121, 1);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (122, 3, 122, 2);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (123, 3, 123, 3);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (124, 3, 124, 4);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (125, 3, 125, 5);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (126, 3, 126, 6);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (127, 3, 127, 7);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (128, 3, 128, 8);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (129, 3, 129, 9);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (130, 3, 130, 10);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (131, 3, 131, 11);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (132, 3, 132, 12);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (133, 3, 133, 13);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (134, 3, 134, 14);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (135, 3, 135, 15);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (136, 3, 136, 16);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (137, 3, 137, 17);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (138, 3, 138, 18);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (139, 3, 139, 19);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (140, 3, 140, 20);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (141, 3, 141, 1);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (142, 3, 142, 2);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (143, 3, 143, 3);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (144, 3, 144, 4);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (145, 3, 145, 5);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (146, 3, 146, 6);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (147, 3, 147, 7);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (148, 3, 148, 8);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (149, 3, 149, 9);
insert into Sertifikat (IdSertifikat, noDosis, IdM, IdKegiatan) values (150, 3, 150, 10);

-- yang akan datang belum dibuat

insert into Memberikan (IdKegiatan, IdVaksin) values (1,  1);
insert into Memberikan (IdKegiatan, IdVaksin) values (2,  3);
insert into Memberikan (IdKegiatan, IdVaksin) values (3,  3);
insert into Memberikan (IdKegiatan, IdVaksin) values (4,  2);
insert into Memberikan (IdKegiatan, IdVaksin) values (5,  1);
insert into Memberikan (IdKegiatan, IdVaksin) values (6,  2);
insert into Memberikan (IdKegiatan, IdVaksin) values (7,  2);
insert into Memberikan (IdKegiatan, IdVaksin) values (8,  2);
insert into Memberikan (IdKegiatan, IdVaksin) values (9,  2);
insert into Memberikan (IdKegiatan, IdVaksin) values (10, 2);
insert into Memberikan (IdKegiatan, IdVaksin) values (11, 2);
insert into Memberikan (IdKegiatan, IdVaksin) values (12, 3);
insert into Memberikan (IdKegiatan, IdVaksin) values (13, 1);
insert into Memberikan (IdKegiatan, IdVaksin) values (14, 2);
insert into Memberikan (IdKegiatan, IdVaksin) values (15, 2);
insert into Memberikan (IdKegiatan, IdVaksin) values (16, 2);
insert into Memberikan (IdKegiatan, IdVaksin) values (17, 3);
insert into Memberikan (IdKegiatan, IdVaksin) values (18, 3);
insert into Memberikan (IdKegiatan, IdVaksin) values (19, 3);
insert into Memberikan (IdKegiatan, IdVaksin) values (20, 1);

-- pendaftaran, kesehatan, mengikuti belum ada recordnya

--pendaftaran
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (1, 'Diterima', 1, 1, '8/26/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (2, 'Diterima', 2, 2, '7/22/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (3, 'Diterima', 3, 3, '10/24/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (4, 'Diterima', 4, 4, '1/30/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (5, 'Diterima', 5, 5, '4/15/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (6, 'Diterima', 6, 6, '3/2/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (7, 'Diterima', 7, 7, '8/13/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (8, 'Diterima', 8, 8, '8/1/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (9, 'Diterima', 9, 9, '7/1/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (10, 'Diterima', 10, 10, '9/26/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (11, 'Diterima', 11, 11, '1/15/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (12, 'Diterima', 12, 12, '1/21/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (13, 'Diterima', 13, 13, '3/8/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (14, 'Diterima', 14, 14, '1/16/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (15, 'Diterima', 15, 15, '4/6/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (16, 'Diterima', 16, 16, '1/21/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (17, 'Diterima', 17, 17, '11/27/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (18, 'Diterima', 18, 18, '9/19/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (19, 'Diterima', 19, 19, '11/2/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (20, 'Diterima', 20, 20, '5/7/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (21, 'Diterima', 21, 1, '10/29/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (22, 'Diterima', 22, 2, '12/31/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (23, 'Diterima', 23, 3, '6/26/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (24, 'Diterima', 24, 4, '2/28/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (25, 'Diterima', 25, 5, '9/1/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (26, 'Diterima', 26, 6, '2/27/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (27, 'Diterima', 27, 7, '4/4/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (28, 'Diterima', 28, 8, '5/15/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (29, 'Diterima', 29, 9, '12/25/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (30, 'Diterima', 30, 10, '9/4/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (31, 'Diterima', 31, 11, '8/17/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (32, 'Diterima', 32, 12, '2/19/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (33, 'Diterima', 33, 13, '3/4/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (34, 'Diterima', 34, 14, '12/23/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (35, 'Diterima', 35, 15, '3/12/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (36, 'Diterima', 36, 16, '10/8/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (37, 'Diterima', 37, 17, '4/2/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (38, 'Diterima', 38, 18, '5/20/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (39, 'Diterima', 39, 19, '4/10/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (40, 'Diterima', 40, 20, '6/6/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (41, 'Diterima', 41, 1, '9/12/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (42, 'Diterima', 42, 2, '7/24/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (43, 'Diterima', 43, 3, '12/7/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (44, 'Diterima', 44, 4, '7/11/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (45, 'Diterima', 45, 5, '6/27/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (46, 'Diterima', 46, 6, '6/7/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (47, 'Diterima', 47, 7, '2/15/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (48, 'Diterima', 48, 8, '3/11/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (49, 'Diterima', 49, 9, '2/20/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (50, 'Diterima', 50, 10, '8/11/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (51, 'Diterima', 51, 11, '8/26/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (52, 'Diterima', 52, 12, '12/8/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (53, 'Diterima', 53, 13, '12/22/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (54, 'Diterima', 54, 14, '6/7/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (55, 'Diterima', 55, 15, '5/11/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (56, 'Diterima', 56, 16, '10/3/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (57, 'Diterima', 57, 17, '7/4/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (58, 'Diterima', 58, 18, '5/28/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (59, 'Diterima', 59, 19, '8/12/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (60, 'Diterima', 60, 20, '10/9/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (61, 'Diterima', 61, 1, '4/21/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (62, 'Diterima', 62, 2, '12/18/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (63, 'Diterima', 63, 3, '8/27/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (64, 'Diterima', 64, 4, '9/6/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (65, 'Diterima', 65, 5, '1/22/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (66, 'Diterima', 66, 6, '11/24/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (67, 'Diterima', 67, 7, '12/5/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (68, 'Diterima', 68, 8, '10/31/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (69, 'Diterima', 69, 9, '12/11/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (70, 'Diterima', 70, 10, '2/11/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (71, 'Diterima', 71, 11, '5/28/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (72, 'Diterima', 72, 12, '5/29/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (73, 'Diterima', 73, 13, '12/13/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (74, 'Diterima', 74, 14, '1/5/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (75, 'Diterima', 75, 15, '6/12/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (76, 'Diterima', 76, 16, '10/8/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (77, 'Diterima', 77, 17, '9/16/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (78, 'Diterima', 78, 18, '9/4/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (79, 'Diterima', 79, 19, '10/6/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (80, 'Diterima', 80, 20, '11/2/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (81, 'Diterima', 81, 1, '12/6/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (82, 'Diterima', 82, 2, '10/30/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (83, 'Diterima', 83, 3, '12/3/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (84, 'Diterima', 84, 4, '6/24/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (85, 'Diterima', 85, 5, '6/17/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (86, 'Diterima', 86, 6, '5/31/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (87, 'Diterima', 87, 7, '10/30/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (88, 'Diterima', 88, 8, '7/15/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (89, 'Diterima', 89, 9, '3/8/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (90, 'Diterima', 90, 10, '3/29/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (91, 'Diterima', 91, 11, '8/4/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (92, 'Diterima', 92, 12, '8/28/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (93, 'Diterima', 93, 13, '6/21/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (94, 'Diterima', 94, 14, '3/22/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (95, 'Diterima', 95, 15, '5/16/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (96, 'Diterima', 96, 16, '3/17/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (97, 'Diterima', 97, 17, '3/3/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (98, 'Diterima', 98, 18, '10/6/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (99, 'Diterima', 99, 19, '4/11/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (100, 'Diterima', 100, 20, '1/13/2022');

insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (101, 'Diterima', 101, 1, '8/26/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (102, 'Diterima', 102, 2, '7/22/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (103, 'Diterima', 103, 3, '10/24/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (104, 'Diterima', 104, 4, '1/30/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (105, 'Diterima', 105, 5, '4/15/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (106, 'Diterima', 106, 6, '3/2/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (107, 'Diterima', 107, 7, '8/13/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (108, 'Diterima', 108, 8, '8/1/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (109, 'Diterima', 109, 9, '7/1/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (110, 'Diterima', 110, 10, '9/26/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (111, 'Diterima', 111, 11, '1/15/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (112, 'Diterima', 112, 12, '1/21/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (113, 'Diterima', 113, 13, '3/8/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (114, 'Diterima', 114, 14, '1/16/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (115, 'Diterima', 115, 15, '4/6/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (116, 'Diterima', 116, 16, '1/21/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (117, 'Diterima', 117, 17, '11/27/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (118, 'Diterima', 118, 18, '9/19/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (119, 'Diterima', 119, 19, '11/2/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (120, 'Diterima', 120, 20, '5/7/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (121, 'Diterima', 121, 1, '10/29/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (122, 'Diterima', 122, 2, '12/31/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (123, 'Diterima', 123, 3, '6/26/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (124, 'Diterima', 124, 4, '2/28/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (125, 'Diterima', 125, 5, '9/1/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (126, 'Diterima', 126, 6, '2/27/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (127, 'Diterima', 127, 7, '4/4/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (128, 'Diterima', 128, 8, '5/15/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (129, 'Diterima', 129, 9, '12/25/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (130, 'Diterima', 130, 10, '9/4/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (131, 'Diterima', 131, 11, '8/17/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (132, 'Diterima', 132, 12, '2/19/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (133, 'Diterima', 133, 13, '3/4/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (134, 'Diterima', 134, 14, '12/23/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (135, 'Diterima', 135, 15, '3/12/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (136, 'Diterima', 136, 16, '10/8/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (137, 'Diterima', 137, 17, '4/2/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (138, 'Diterima', 138, 18, '5/20/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (139, 'Diterima', 139, 19, '4/10/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (140, 'Diterima', 140, 20, '6/6/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (141, 'Diterima', 141, 1, '9/12/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (142, 'Diterima', 142, 2, '7/24/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (143, 'Diterima', 143, 3, '12/7/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (144, 'Diterima', 144, 4, '7/11/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (145, 'Diterima', 145, 5, '6/27/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (146, 'Diterima', 146, 6, '6/7/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (147, 'Diterima', 147, 7, '2/15/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (148, 'Diterima', 148, 8, '3/11/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (149, 'Diterima', 149, 9, '2/20/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (150, 'Diterima', 150, 10, '8/11/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (151, 'Ditolak', 151, 11, '8/26/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (152, 'Ditolak', 152, 12, '12/8/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (153, 'Ditolak', 153, 13, '12/22/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (154, 'Ditolak', 154, 14, '6/7/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (155, 'Ditolak', 155, 15, '5/11/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (156, 'Ditolak', 156, 16, '10/3/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (157, 'Ditolak', 157, 17, '7/4/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (158, 'Ditolak', 158, 18, '5/28/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (159, 'Ditolak', 159, 19, '8/12/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (160, 'Ditolak', 160, 20, '10/9/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (161, 'Ditolak', 161, 1, '4/21/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (162, 'Ditolak', 162, 2, '12/18/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (163, 'Ditolak', 163, 3, '8/27/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (164, 'Ditolak', 164, 4, '9/6/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (165, 'Ditolak', 165, 5, '1/22/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (166, 'Ditolak', 166, 6, '11/24/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (167, 'Ditolak', 167, 7, '12/5/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (168, 'Ditolak', 168, 8, '10/31/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (169, 'Ditolak', 169, 9, '12/11/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (170, 'Ditolak', 170, 10, '2/11/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (171, 'Ditolak', 171, 11, '5/28/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (172, 'Ditolak', 172, 12, '5/29/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (173, 'Ditolak', 173, 13, '12/13/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (174, 'Ditolak', 174, 14, '1/5/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (175, 'Ditolak', 175, 15, '6/12/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (176, 'Ditolak', 176, 16, '10/8/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (177, 'Ditolak', 177, 17, '9/16/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (178, 'Ditolak', 178, 18, '9/4/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (179, 'Ditolak', 179, 19, '10/6/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (180, 'Ditolak', 180, 20, '11/2/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (181, 'Konfirmasi Penyelenggara', 181, 1, '12/6/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (182, 'Konfirmasi Penyelenggara', 182, 2, '10/30/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (183, 'Konfirmasi Penyelenggara', 183, 3, '12/3/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (184, 'Konfirmasi Penyelenggara', 184, 4, '6/24/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (185, 'Konfirmasi Penyelenggara', 185, 5, '6/17/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (186, 'Konfirmasi Penyelenggara', 186, 6, '5/31/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (187, 'Konfirmasi Penyelenggara', 187, 7, '10/30/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (188, 'Konfirmasi Penyelenggara', 188, 8, '7/15/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (189, 'Konfirmasi Penyelenggara', 189, 9, '3/8/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (190, 'Konfirmasi Penyelenggara', 190, 10, '3/29/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (191, 'Konfirmasi Penyelenggara', 191, 11, '8/4/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (192, 'Konfirmasi Penyelenggara', 192, 12, '8/28/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (193, 'Konfirmasi Penyelenggara', 193, 13, '6/21/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (194, 'Konfirmasi Penyelenggara', 194, 14, '3/22/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (195, 'Konfirmasi Penyelenggara', 195, 15, '5/16/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (196, 'Konfirmasi Penyelenggara', 196, 16, '3/17/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (197, 'Konfirmasi Penyelenggara', 197, 17, '3/3/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (198, 'Konfirmasi Penyelenggara', 198, 18, '10/6/2021');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (199, 'Konfirmasi Penyelenggara', 199, 19, '4/11/2022');
insert into Pendaftaran (IdP, statusP, IdM, IdKegiatan, tanggalP) values (200, 'Konfirmasi Penyelenggara', 200, 20, '1/13/2022');

--mengikuti


-- kesehatan

insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (1, 'Tidak ', 37, '120/80', 1, '2020-06-07');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (2, 'Tidak ', 36, '120/80', 2, '2020-12-06');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (3, 'Tidak ', 36, '120/80', 3, '2020-12-17');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (4, 'Tidak ', 36, '120/80', 4, '2020-12-03');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (5, 'Tidak ', 35, '120/80', 5, '2020-08-01');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (6, 'Tidak ', 36, '120/80', 6, '2020-10-08');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (7, 'Tidak ', 37, '120/80', 7, '2020-07-10');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (8, 'Tidak ', 36, '120/80', 8, '2020-09-30');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (9, 'Tidak ', 37, '120/80', 9, '2020-09-16');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (10, 'Tidak ', 35, '120/80', 10, '2020-09-16');
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
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (26, 'Tidak ', 35, '120/80', 26, '2020-06-13');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (27, 'Tidak ', 35, '120/80', 27, '2020-08-10');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (28, 'Tidak ', 37, '120/80', 28, '2020-10-29');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (29, 'Tidak ', 35, '120/80', 29, '2020-12-26');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (30, 'Tidak ', 37, '120/80', 30, '2020-06-08');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (31, 'Tidak ', 37, '120/80', 31, '2020-07-03');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (32, 'Tidak ', 36, '120/80', 32, '2020-12-30');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (33, 'Tidak ', 35, '120/80', 33, '2020-10-28');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (34, 'Tidak ', 35, '120/80', 34, '2020-07-07');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (35, 'Tidak ', 37, '120/80', 35, '2020-10-03');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (36, 'Tidak ', 35, '120/80', 36, '2020-11-22');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (37, 'Tidak ', 37, '120/80', 37, '2020-11-01');
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
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (53, 'Tidak ', 37, '120/80', 53, '2020-11-06');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (54, 'Tidak ', 36, '120/80', 54, '2020-12-03');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (55, 'Tidak ', 36, '120/80', 55, '2020-09-06');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (56, 'Tidak ', 36, '120/80', 56, '2020-06-12');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (57, 'Tidak ', 37, '120/80', 57, '2020-07-19');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (58, 'Tidak ', 37, '120/80', 58, '2020-10-12');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (59, 'Tidak ', 36, '120/80', 59, '2020-10-23');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (60, 'Tidak ', 37, '120/80', 60, '2020-08-28');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (61, 'Tidak ', 35, '120/80', 61, '2020-11-08');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (62, 'Tidak ', 37, '120/80', 62, '2020-08-20');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (63, 'Tidak ', 35, '120/80', 63, '2020-09-24');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (64, 'Tidak ', 35, '120/80', 64, '2020-07-23');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (65, 'Tidak ', 35, '120/80', 65, '2020-10-29');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (66, 'Tidak ', 36, '120/80', 66, '2020-09-06');
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
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (84, 'Tidak ', 35, '120/80', 84, '2020-06-17');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (85, 'Tidak ', 37, '120/80', 85, '2020-06-27');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (86, 'Tidak ', 35, '120/80', 86, '2020-07-13');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (87, 'Tidak ', 35, '120/80', 87, '2020-07-02');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (88, 'Tidak ', 36, '120/80', 88, '2020-10-04');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (89, 'Tidak ', 35, '120/80', 89, '2020-09-08');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (90, 'Tidak ', 37, '120/80', 90, '2020-10-05');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (91, 'Tidak ', 36, '120/80', 91, '2020-11-17');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (92, 'Tidak ', 37, '120/80', 92, '2020-09-22');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (93, 'Tidak ', 35, '120/80', 93, '2020-09-24');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (94, 'Tidak ', 35, '120/80', 94, '2020-06-30');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (95, 'Tidak ', 35, '120/80', 95, '2020-07-20');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (96, 'Tidak ', 37, '120/80', 96, '2020-12-11');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (97, 'Tidak ', 37, '120/80', 97, '2020-08-08');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (98, 'Tidak ', 37, '120/80', 98, '2020-10-04');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (99, 'Tidak ', 36, '120/80', 99, '2020-06-30');
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
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (112, 'Tidak ', 36, '120/80', 112, '2020-12-09');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (113, 'Tidak ', 36, '120/80', 113, '2020-12-06');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (114, 'Tidak ', 35, '120/80', 114, '2020-10-24');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (115, 'Tidak ', 37, '120/80', 115, '2020-10-11');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (116, 'Tidak ', 36, '120/80', 116, '2020-10-24');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (117, 'Tidak ', 36, '120/80', 117, '2020-07-01');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (118, 'Tidak ', 37, '120/80', 118, '2020-08-10');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (119, 'Tidak ', 36, '120/80', 119, '2020-08-30');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (120, 'Tidak ', 37, '120/80', 120, '2020-09-09');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (121, 'Tidak ', 36, '120/80', 121, '2020-07-03');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (122, 'Tidak ', 36, '120/80', 122, '2020-07-26');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (123, 'Tidak ', 35, '120/80', 123, '2020-08-05');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (124, 'Tidak ', 36, '120/80', 124, '2020-12-10');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (125, 'Tidak ', 35, '120/80', 125, '2020-09-26');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (126, 'Tidak ', 36, '120/80', 126, '2020-06-05');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (127, 'Tidak ', 37, '120/80', 127, '2020-12-31');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (128, 'Tidak ', 37, '120/80', 128, '2020-07-07');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (129, 'Tidak ', 36, '120/80', 129, '2020-08-20');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (130, 'Tidak ', 37, '120/80', 130, '2020-10-03');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (131, 'Tidak ', 36, '120/80', 131, '2020-11-01');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (132, 'Tidak ', 36, '120/80', 132, '2020-09-21');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (133, 'Tidak ', 35, '120/80', 133, '2020-07-09');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (134, 'Tidak ', 37, '120/80', 134, '2020-09-24');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (135, 'Tidak ', 37, '120/80', 135, '2020-07-19');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (136, 'Tidak ', 37, '120/80', 136, '2020-11-03');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (137, 'Tidak ', 35, '120/80', 137, '2020-12-06');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (138, 'Tidak ', 36, '120/80', 138, '2020-12-04');
insert into Kesehatan (IdKesehatan, komorbid, suhuTubuh, tensi, IdM, tanggalTerkenaCovid) values (139, 'Tidak ', 36, '120/80', 139, '2020-11-20');
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


