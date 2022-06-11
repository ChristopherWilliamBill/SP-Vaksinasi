alter procedure InsertKesehatan
	@komorbid varchar (30),
	@suhuTubuh INT,
	@tanggalTerkenaCovid DATE,
	@tensi varchar(10),
	@NIK varchar(50)

as
	declare @Idm int = (select IdM from masyarakat where nik = @NIK)
	insert into Kesehatan VALUES (@komorbid, @suhuTubuh,@tanggalTerkenaCovid,@tensi,@Idm)

	--exec InsertKesehatan 'Ya',45,'2022-02-05','200/150','1234567'


	


	