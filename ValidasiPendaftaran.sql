alter procedure ValidasiPendaftaran
    @Idm int
as
    declare 
        @komorbid varchar (50),
        @suhuTubuh int,
        @tensi varchar(10),
        @tanggalTerkena date,
		@selisihTanggalTerkena int,
		@tekananAtas int,
		@tekananBawah int

        select top 1 @komorbid = komorbid, @suhuTubuh=suhuTubuh, @tensi=tensi, @tanggalTerkena=tanggalTerkenaCovid from kesehatan where idm = @Idm order by idkesehatan desc

		set @selisihTanggalTerkena = datediff(mm, @tanggalTerkena, cast(GETDATE() as date))

		set @tekananAtas = cast(substring(@tensi,1,CHARINDEX('/',@tensi)-1) as int)
		set @tekananBawah = cast(SUBSTRING(@tensi,charindex('/',@tensi)+1,len(@tensi))as int)

		if @komorbid='Ya' or @suhuTubuh >=37.5 or @selisihTanggalTerkena<3 or @tekananAtas>=180 or @tekananBawah>=110 
		begin
			update pendaftaran set statusP = 'Ditolak' where pendaftaran.idm = @Idm and tanggalp = (select max(tanggalP)from pendaftaran where Pendaftaran.IdM = @Idm)
		end
		exec ValidasiPendaftaran 51
		select * from Pendaftaran join kesehatan on Pendaftaran.IdM = Kesehatan.IdM where pendaftaran.IdM = 51
		

