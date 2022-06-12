alter procedure InsertMengikuti
	@idM int,
	@idKegiatan int,
	@jamAwal time,
	@jamAkhir time,
	@idTahapan int
as
	insert into Mengikuti
	values (@idM, @idKegiatan, @jamAwal, @jamAkhir, @idTahapan)

	--exec InsertMengikuti 60,5,'09:15','09:35',1