Server name - (localdb)\mssqllocaldb

--- SQL salvestatud protseduur - Хранимая процедура SQL
funktsioon, mis käivitab serveris mitu SQL tegevust järjest

Kasutame SQL Server

create database protseduurRossakov;
use protseduurRossakov;
create table linn(
linnId int primary key identity(1,1),
linnNimi varchar(30),
rahvaArt int);
select * from linn;
insert into linn(linnnimi,rahvaArt)
values ('Tallinn',60000), ('Narva',70000), ('Tartu',80000);

--- Protseduuri loomine
--- Protseduur, mis lisab uus linn ja kohe näitab tabelis

create procedure lisaLinn
@lnimi varchar(30),
@rArv int
as
begin

insert into linn(linnnimi,rahvaArt)
values (@lnimi, @rArv);
select * from linn;

end;

---protseduuri kutse !
exec lisaLinn @lnimi='Rarvere', @rArv=123
--- lihtsam
exec lisaLinn 'Rakvere', 789

---kirje kustutamine !
delete from linn where linnID=6

---protseduur, mis kustutab linn id järgi
create procedure kustutaLinn
@deleteID int
as
begin
select * from linn;
delete from linn where linnID=@deleteID;
select * from linn;
end;

---kutse
exec kustutaLinn 5;
---protseduur kustutamine
drop Procedure kustutaLinn;

---Protseduur, mis otsib linn esimese tähte järgi
create procedure linnaOtsing
@taht char(1)
as
begin
select * from linn
where linnNimi like @taht + '%';
---% - kõik teised tähed 
end;
---kutse
exec linnaOtsing P;

---tabeli eeundamine - rahvaarv kasvab 10% võrra
update linn set rahvaArt=rahvaArt*1.1
select * from linn
update linn set rahvaArt=rahvaArt*1.1
where linnId=7;

create procedure rahvaArvuUuendus
@linnId int,
@koef decimal(2,1)
as
begin
update linn set rahvaArt=rahvaArt*@koef
where linnId=@linnId;
select * from linn;
end;

exec rahvaArvuUuendus 7, 1.1;

drop procedure rahvaArvuUuendus ---kustumine

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Kasutame XAMPP / localhost

create table linn(
linnId int primary key auto_increment,
linnNimi varchar(30),
rahvaArt int);
select * from linn;
insert into linn(linnnimi,rahvaArt)
values ('Tallinn',60000), ('Narva',70000), ('Tartu',80000);
