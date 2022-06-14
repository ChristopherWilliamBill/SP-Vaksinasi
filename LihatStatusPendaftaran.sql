alter procedure LihatStatusPendaftaran
	@email varchar(50)
as
	select tanggalP, statusP
	from Pendaftaran JOIN Masyarakat on Pendaftaran.IdM = Masyarakat.IdM
	where Masyarakat.email = @email

	exec LihatStatusPendaftaran 'Hazel_Clarkson7218@naiker.biz'

	select * from Masyarakat