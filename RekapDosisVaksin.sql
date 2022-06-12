alter procedure RekapDosisVaksin
	@dosis1 bit,
	@dosis2 bit,
	@dosis3 bit
as
	declare @sql nvarchar(1000)

	set @sql = 'select Masyarakat.IdM, nama, noDosis
		from Sertifikat join Masyarakat on Sertifikat.IdM = Masyarakat.IdM where'

	if @dosis1 = 0 and @dosis2 = 0 and @dosis3 = 0
	begin
		set @sql = left(@sql, len(@sql)-5)
	end
	else
	begin
		if @dosis1 = 1
		begin
			set @sql = CONCAT(@sql, ' noDosis = 1', ' or ')
		end
		if @dosis2 = 1
		begin
			set @sql = CONCAT(@sql, ' noDosis = 2', ' or ')
		end
		if @dosis3 = 1
		begin
			set @sql = CONCAT(@sql, ' noDosis = 3', ' or ')
		end
		set @sql = left(@sql, len(@sql)-3)
	end

	EXEC sp_executesql @sql

--exec RekapDosisVaksin 1,0,1