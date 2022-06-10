alter procedure LihatSemuaVaksinasiBagiPemprov
	@IdProvinsi int
as
	select provinsi.namaprovinsi, kota.namakota, lokasi.namalokasi, penyelenggara.nama as [Nama Penyelenggara], kuota, kegiatanvaksinasi.idkegiatan, waktu, tanggal
	from provinsi join kota on provinsi.idprovinsi = kota.idprovinsi join lokasi on lokasi.idkota = kota.idkota
	join kegiatanvaksinasi on kegiatanvaksinasi.idlokasi = lokasi.idlokasi join penyelenggara on penyelenggara.idpenyelenggara = kegiatanvaksinasi.idpenyelenggara
	where provinsi.idprovinsi = @IdProvinsi

	--exec LihatSemuaVaksinasiBagiPemprov 1
