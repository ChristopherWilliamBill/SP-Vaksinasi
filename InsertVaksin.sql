alter procedure InsertVaksin
	@id int,
	@nama varchar(50)
as
	insert into Vaksin
	values (@id, @nama)