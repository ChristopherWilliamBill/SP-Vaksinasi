alter procedure InsertKegiatan
	@kuota int,
	@waktu time,
	@tanggal date,
	@idLokasi int,
	@idPenyelenggara int
as
	insert into KegiatanVaksinasi(kuota, waktu, tanggal, IdLokasi, IdPenyelenggara)
	values (@kuota, @waktu, @tanggal, @idLokasi,@idPenyelenggara)