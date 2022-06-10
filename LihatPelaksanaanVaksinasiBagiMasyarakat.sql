alter procedure LihatPelaksanaanVaksinasiBagiMasyarakat2
    @namaKota varchar (50),
    @tanggalKegiatanMin date,
    @tanggalKegiatanMax date
as

    declare @sql nvarchar(1000)

    set @sql = 'select penyelenggara.nama, kegiatanvaksinasi.idkegiatan, kegiatanvaksinasi.tanggal, kegiatanvaksinasi.waktu, lokasi.namalokasi, penyelenggara.urutantahapan, kegiatanvaksinasi.kuota, count(pendaftaran.idp) as [Kuota Terisi]
    from kegiatanvaksinasi join penyelenggara on penyelenggara.idpenyelenggara = kegiatanvaksinasi.idpenyelenggara
    join lokasi on kegiatanvaksinasi.idlokasi = lokasi.idlokasi join kota on kota.idkota = lokasi.idkota join pendaftaran on kegiatanvaksinasi.idkegiatan = pendaftaran.idkegiatan where '

    if( @tanggalKegiatanMin is null)
    begin
        set @sql = concat(@sql, ' kegiatanvaksinasi.tanggal >= ', '''' ,cast(getdate() as date),'''',' and ')
    end
    

	if(@namaKota is not null)
    begin
        set @sql = concat(@sql, ' kota.namakota = ','''',@namaKota,'''',' and ')
    end

	if(@tanggalKegiatanMin is not null)
    begin
        set @sql = concat(@sql, ' kegiatanvaksinasi.tanggal >= ', '''' ,@tanggalKegiatanMin,'''',' and ')
    end

	if(@tanggalKegiatanMax is not null)
    begin
        set @sql = concat(@sql, ' kegiatanvaksinasi.tanggal <= ', '''' ,@tanggalKegiatanMax,'''',' and ')
    end


	set @sql = concat(@sql, ' statusp != ','''Ditolak''',' group by penyelenggara.nama, kegiatanvaksinasi.idkegiatan, kegiatanvaksinasi.tanggal, kegiatanvaksinasi.waktu, lokasi.namalokasi, penyelenggara.urutantahapan, kegiatanvaksinasi.kuota')
    exec sp_executesql @sql

    --exec LihatPelaksanaanVaksinasiBagiMasyarakat2 null, '2010-01-01', '2021-12-31'