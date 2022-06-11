alter procedure InsertMengikuti
	@idM int,
	@idKegiatan int,
	@jamAwal time,
	@jamAkhir time,
	@idTahapan int
as
	insert into Mengikuti
	values (@idM, @idKegiatan, @jamAwal, @jamAkhir, @idTahapan)