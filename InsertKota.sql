alter procedure InsertKota
	@nama varchar(50),
	@idProvinsi int
as
	insert into Kota(namaKota, IdProvinsi)
	values (@nama, @idProvinsi)

	--exec InsertKota 'Cimahi',1