CREATE TABLE opilane(
	opilaneID int primary key identity (1,1),
	eesnimi varchar(25) not null,
	perenimi varchar(25) not null,
	sunniaeg date,
	stip bit,
	aadress text,
	keskmine_hinne decimal(2,1)
	)
	select * from opilane;
INSERT INTO opilane (eesnimi, perenimi, sunniaeg, stip, keskmine_hinne)
VALUES ('Martin', 'Rossakov', '2006-10-16', 1, 4.5), ('Nikita', 'Goncharov', '2007-12-12', 0, 6.5), ('Mark', 'Jürgen', '2005-11-13', 1, 4.6),('Marek', 'Lukk', '2004-10-15', 1, 4.7), ('Roman', 'Zaitsev', '2004-10-16', 1, 4.8);

	CREATE TABLE Language(
ID int NOT NULL AUTO_INCREMENT,
Code char(3) NOT NULL,
Language varchar(50) NOT NULL,
IsOfficial bit,
Percentage smallint
);
select * from Language;

insert into Language(ID, Code, Language)
VALUES (2, 'RUS', 'vene'), (3, 'ENG', 'inglise'),
(4, 'DE', 'saksa');

create table keelevalik(
keelevalikid int primary key AUTO_INCREMENT,
valikunimetus varchar(10) not null,
opilaneid int,
foreign key (opilaneid) references opilane(opilaneid),
Language int,
foreign key (Language) references Language(id)
);
insert into keelevalik(valikunimetus, opilaneid, Language)
Values ('valik B', 1, 2)
---------------------------------------------------------------------------------Protseduur
	
---1. protseduur, mis lisab kasutaja koos kogu teabega
create procedure lisaopilane
@lnimi varchar(25),
@lperen varchar(25),
@sunn date,
@stip bit,
@adr text,
@kh decimal(2,1)
as
begin
insert into opilane(eesnimi, perenimi, sunniaeg, stip, aadress, keskmine_hinne)
values (@lnimi, @lperen, @sunn, @stip, @adr, @kh)

exec lisaopilane @lnimi='idk', @lperen='qwe', @sunn='2007-11-13', @stip=1, @adr='addresss here', @kh=4.6;

end;

---2. protseduur, mis kustutab opilane id järgi
create procedure kustutaopilane
@opilaneId int
as
begin
select * from linn;
delete from opilane where opilaneid=@opilaneId
select * from opilane;
end;

---kutse
exec kustutaopilane 6;

---3. Protseduur, mis otsib opilane esimese tähte järgi
create procedure opilaneOtsing
@taht char(1)
as
begin
select * from opilane
where eesnimi like @taht + '%';
end;
---kutse
exec opilaneOtsing M;

---4. andmete uuendamine, stip muudetakse
update opilane set stip=stip*1.1
select * from opilane
update opilane set stip=stip*1.1
where opilaneId=7;

create procedure stipuuendus
@opilaneid int,
@koef decimal(2,1)
as
begin
update opilane set stip=stip*@koef
where opilaneId=@opilaneId;
select * from opilane;
end;
exec stipuuendus 7, 0;
