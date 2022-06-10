alter procedure EvaluasiAntrian
	@idKegiatan int
as
	declare @result table (
		idTahapan int,
		[Rata-rata Durasi (dalam menit)] int
	)
	declare @jamAwal time
	declare @jamAkhir time
	declare @selisihJam int = 0
	declare @i int = 0
	declare @jumlahTahap int = 0
	declare @urutanTahapan varchar(6)

	select @urutanTahapan = urutanTahapan
	from Penyelenggara join KegiatanVaksinasi on Penyelenggara.IdPenyelenggara = KegiatanVaksinasi.IdPenyelenggara
	where IdKegiatan = @idKegiatan

	while @urutanTahapan != ''
	begin
		declare @currTahap int = cast((select left(@urutanTahapan, 1)) as int)
		set @urutanTahapan = SUBSTRING(@urutanTahapan, 2, len(@urutanTahapan))

		declare curs CURSOR FOR
		select jamAwal, jamAkhir
		from Mengikuti
		where IdKegiatan = @idKegiatan and IdTahapan = @currTahap

		open curs
		fetch next from curs into @jamAwal, @jamAkhir
		while @@FETCH_STATUS = 0
		begin
			set @selisihJam = @selisihJam + datediff(minute,@jamAwal,@jamAkhir)
			set @i += 1

			fetch next from curs into @jamAwal, @jamAkhir
		end

		close curs
		deallocate curs

		if @i != 0
		begin
			set @selisihJam /= @i
		end
		else
		begin
			set @selisihJam = 0
		end

		insert into @result
		select @currTahap, @selisihJam

		set @i = 0
	end

	select *
	from @result