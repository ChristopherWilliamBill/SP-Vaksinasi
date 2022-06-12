alter procedure InsertSertifikat
	@dosis int,
	@idM int,
	@idKegiatan int
as
	insert into Sertifikat
	values (@dosis, @idM, @idKegiatan)

	--exec InsertSertifikat 1,60,5