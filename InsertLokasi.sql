alter procedure InsertLokasi
	@nama varchar(50),
	@idKota int
as
	insert into Lokasi(namaLokasi, IdKota)
	values (@nama, @idKota)

	--exec InsertLokasi 'Jalan Dago', 1