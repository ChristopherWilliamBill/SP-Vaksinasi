alter procedure RekapDosisVaksin
	@dosis int
as
	select Masyarakat.IdM, nama
	from Sertifikat join Masyarakat on Sertifikat.IdM = Masyarakat.IdM
	where Sertifikat.noDosis = @dosis