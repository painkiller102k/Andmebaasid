create database protseduurRossakov
use protseduurRossakov

create table linn(
linnId int primary key identity(1,1),
linnNimi varchar(30),
rahvaArt int);
select * from linn;
insert into linn(linnnimi,rahvaArt)
values ('Tallinn',60000), ('Narva',70000), ('Tartu',80000);

create procedure lisaLinn
@lnimi varchar(30),
@rArv int
as
begin

insert into linn(linnnimi,rahvaArt)
values (@lnimi, @rArv);
select * from linn;

end;
exec lisaLinn 'Pärnu', 90000

---uue veeru lisamine
alter table linn add test int;

---veeru kustutamine
alter table linn drop column test;

create procedure veeruLisaKustuta
@valik varchar(20),
@veerunimi varchar(20),
@tyyp varchar(20) =null


as
begin
declare @sqltegevus as varchar(max)
set @sqltegevus=case
when @valik='add' then concat('ALTER TABLE linn add ', @veerunimi, ' ', @tyyp)
when @valik='drop' then concat('ALTER TABLE linn DROP COLUMN ', @veerunimi)
end;
print @sqltegevus;
begin
exec (@sqltegevus);
end
end;

---kutse
exec veeruLisaKustuta @valik='drop', @veerunimi='test3';
select * from linn;
drop procedure veeruLisaKustuta

create procedure veeruLisaKustutaTabelis
@valik varchar(20),
@tabelinimi varchar(20),
@veerunimi varchar(20),
@tyyp varchar(20) =null


as
begin
declare @sqltegevus as varchar(max)
set @sqltegevus=case
when @valik='add' then concat('ALTER TABLE ', @tabelinimi, ' add ', @veerunimi, ' ', @tyyp)
when @valik='drop' then concat('ALTER TABLE ', @tabelinimi, ' drop column ', @veerunimi)
end;
print @sqltegevus;
begin
exec (@sqltegevus);
end
end;

exec veeruLisaKustutaTabelis @valik='add', @tabelinimi='linn', @veerunimi='test3', @tyyp='int';
select * from linn
exec veeruLisaKustutaTabelis @valik='drop', @tabelinimi='linn', @veerunimi='test3';
select * from linn

---protseduur tingimusega
create procedure rahvaHinnang
@piir int

as
begin
select linnNimi, iif(rahvaArt<@piir, 'väike linn', 'suur linn') as Hinnang
from linn;

end;
drop procedure rahvaHinnang
exec rahvaHinnang 80000

---agregaat funktsioonid = sum(), avg(), min(), max(), count()

create procedure kokkurahvaart


as
begin
select sum(rahvaArt) as 'kokku rahvaArv', avg(rahvaArt) as 'keskmine rahvaArv', count(*) as 'linnade arv'
from linn;
end;

exec kokkurahvaart
