alter procedure MembuatPendaftaranBaru
	@email varchar(50),
	@noHP varchar(50),
	@nama varchar(50),
	@alamat varchar(50),
	@NIK varchar(50),
	@tglLahir date,
	@jenisKelamin varchar(50),
	@tanggalP date,
	@IdKegiatan int
as
	
	insert into Masyarakat values (@email,@noHP,@nama, @alamat, @NIK, @tglLahir, @jenisKelamin)

	declare @Idm int = 0
	set @Idm = (select max(IdM) from Masyarakat)
	insert into Pendaftaran values (@tanggalP,'Menunggu Konfirmasi',@Idm,@IdKegiatan)


	--exec MembuatPendaftaranBaru 'nganag2@gmail.com',1234567, 'nganga2', 'jalan nganga2', '1234567', '2000-10-11', 'Female','2022-06-10', 5





