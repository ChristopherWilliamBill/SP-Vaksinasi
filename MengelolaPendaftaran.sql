alter procedure MengelolaPendaftaran
	@query varchar(50),
	@statusAkhir varchar(50),
	@idPendaftaran int,
	@statusP varchar(50),
	@idKegiatan int
as
	if @query = 'Melihat'
	begin
		if @idKegiatan is null
		begin
			if @statusP is null
			begin
				select *
				from Pendaftaran
			end
			else
			begin
				select *
				from Pendaftaran
				where statusP = @statusP
			end
		end
		else
		begin
			if @statusP is null
			begin
				select *
				from Pendaftaran
				where IdKegiatan = @idKegiatan
			end
			else
			begin
				select *
				from Pendaftaran
				where IdKegiatan = @idKegiatan and statusP = @statusP
			end
		end
	end
	else if @query = 'Mengelola'
	begin
		if (select statusP from Pendaftaran where IdP = @idPendaftaran) = 'Menunggu Konfirmasi'
		begin
			update Pendaftaran set statusP = @statusAkhir where IdP = @idPendaftaran
		end
	end

	--exec MengelolaPendaftaran 'Melihat',null, null, 'Diterima',1
	--exec MengelolaPendaftaran 'Mengelola', 'Diterima', 60, null, null 