alter procedure RekapPelaksanaanVaksin
	@idPenyelenggara int,
	@idProvinsi int,
	@idKota int,
	@idLokasi int
as
	declare @sql nvarchar(1000)

	set @sql = 
	'select Penyelenggara.IdPenyelenggara, Penyelenggara.nama as "Nama Penyelenggara", KegiatanVaksinasi.IdKegiatan, Provinsi.namaProvinsi, Kota.namaKota, Lokasi.namaLokasi, count(Mengikuti.IdM) as jumlahPeserta from Penyelenggara join KegiatanVaksinasi on Penyelenggara.IdPenyelenggara = KegiatanVaksinasi.IdPenyelenggara join Lokasi on KegiatanVaksinasi.IdLokasi = Lokasi.IdLokasi join Kota on Lokasi.IdKota = Kota.IdKota join Mengikuti on Mengikuti.IdKegiatan = KegiatanVaksinasi.IdKegiatan join Provinsi on Kota.IdProvinsi = Provinsi.IdProvinsi where IdTahapan = 5 and'

	if @idPenyelenggara is null and @idProvinsi is null and @idKota is null and @idLokasi is null
	begin
		set @sql = left(@sql, len(@sql)-3)
	end
	else
	begin
		if @idPenyelenggara is not null
		begin
			set @sql = CONCAT(@sql, ' Penyelenggara.IdPenyelenggara = ', @idPenyelenggara, ' and ')
		end
		if @idProvinsi is not null
		begin
			set @sql = CONCAT(@sql, ' Provinsi.IdProvinsi = ', @idProvinsi, ' and ')
		end
		if @idKota is not null
		begin
			set @sql = CONCAT(@sql, ' Kota.IdKota = ', @idKota, ' and ')
		end
		if @idLokasi is not null
		begin
			set @sql = CONCAT(@sql, ' Lokasi.IdLokasi = ', @idLokasi, ' and ')
		end
		set @sql = left(@sql, len(@sql)-4)
	end

	set @sql = CONCAT(@sql, ' group by Penyelenggara.IdPenyelenggara, Penyelenggara.nama, KegiatanVaksinasi.IdKegiatan, Provinsi.namaProvinsi, Kota.namaKota, Lokasi.namaLokasi')

	EXEC sp_executesql @sql

exec RekapPelaksanaanVaksin 1,null,null,null