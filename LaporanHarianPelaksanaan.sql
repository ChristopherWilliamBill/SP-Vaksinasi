create procedure LaporanHarianPelaksanaan
	@tanggal date,
	@idPenyelenggara int
as
	create table #temp(
		IdKegiatan int
	)

	create table #result(
		sudahDivaksin int,
		ditolak int
	)

	insert into #temp
	select IdKegiatan
	from KegiatanVaksinasi
	where IdPenyelenggara = @idPenyelenggara and tanggal = @tanggal

	declare curs CURSOR FOR
	select *
	from #temp

	open curs
	declare @currKegiatan int
	fetch next from curs into @currKegiatan
	while @@FETCH_STATUS = 0
	begin
		declare @tahapanKegiatan varchar(6)
		select @tahapanKegiatan = urutanTahapan from Penyelenggara where IdPenyelenggara = @idPenyelenggara

		declare @urutanTerakhir int = cast(right(@tahapanKegiatan,1) as int)

		insert into #result values 
		((select count(IdM)
		from Mengikuti
		where IdKegiatan = @currKegiatan and IdTahapan = @urutanTerakhir)
		,
		(select count(IdM)
		from Pendaftaran
		where IdKegiatan = @currKegiatan and statusP = 'Ditolak'))

		fetch next from curs into @currKegiatan
		
	end

	close curs
	deallocate curs

	select *
	from #result

	exec LaporanHarianPelaksanaan '2021-12-18',2