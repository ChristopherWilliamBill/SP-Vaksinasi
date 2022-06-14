create procedure LihatStatusPendaftaran
	@email varchar(50)
as
	select statusP
	from Pendaftaran JOIN Masyarakat on Pendaftaran.IdM = Masyarakat.IdM
	where Masyarakat.email = @email

	exec LihatStatusPendaftaran 'Alexander_Coleman4308@cispeto.com'