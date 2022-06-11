alter procedure InsertPenyelenggara
	@nama varchar(50),
	@urutan varchar(6)
as
	insert into Penyelenggara
	values (@nama, @urutan)