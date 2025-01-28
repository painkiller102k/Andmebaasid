--AB loomine
Create database MartinRossakovBaas;

use MartinRossakovBaas;
CREATE TABLE opilane(
opilaneID int primary key identity(1,1),
eesnimi varchar(25) not null,
perenimi varchar(25) not null,
sunniaeg date,
stip bit,
aadress text,
keskmine_hinne decimal(2,1)
)
select * from opilane;
--andmete lisamine tabelisse
INSERT INTO opilane(
eesnimi,
perenimi,
sunniaeg,
stip,	
keskmine_hinne)
VALUES(
'Nikita',
'Nikita',
'2000-12-12',
1,
4.5),
(
'Nikita2',
'Nikita2',
'2000-12-12',
1,
4.5),
(
'Nikita3',
'Nikita3',
'2000-12-12',
1,
4.5);

--tabeli kustutamine 
drop table opilane;
--rida kustutamine,kus on opiladeID=2
delete from opilane where opilaneID=2;
select * from opilane;

--andmete uuendamine
update opilane set aadress='Tallinn'
where opilaneID=3
