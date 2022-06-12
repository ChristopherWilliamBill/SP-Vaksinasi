alter procedure InsertKegiatan
	@kuota int,
	@waktu time,
	@tanggal date,
	@idLokasi int,
	@idPenyelenggara int,
	@idVaksin int
as
	insert into KegiatanVaksinasi(kuota, waktu, tanggal, IdLokasi, IdPenyelenggara)
	values (@kuota, @waktu, @tanggal, @idLokasi,@idPenyelenggara)

	insert into Memberikan
	values ((select max(IdKegiatan) from KegiatanVaksinasi), @idVaksin)

	--exec InsertKegiatan 50,'09:00','2022-10-10',1,1,1