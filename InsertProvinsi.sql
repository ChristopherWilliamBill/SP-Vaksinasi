alter procedure InsertProvinsi
	@nama varchar(50)
as
	insert into Provinsi(namaProvinsi)
	values (@nama)