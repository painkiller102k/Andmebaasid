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

	CREATE TABLE Language
(
ID int NOT NULL PRIMARY KEY,
Code char(3) NOT NULL,
Language varchar(50) NOT NULL,
IsOfficial bit,
Percentage smallint
);
select * from Language;

insert into Language(ID, Code, Language)
VALUES (2, 'RUS', 'vene'), (3, 'ENG', 'inglise'),
(4, 'G', 'saksa')

create table keelevalik(
keelevalikid int primary key identity(1,1),
valikunimetus varchar(10) not null,
opilaneid int,
foreign key (opilaneid) references opilane(opilaneid),
Language int,
foreign key (Language) references Language(id)
)
select * from keelevalik;
select * from Language;
select * from opilane;

insert into keelevalik(valikunimetus, opilaneid, Language)
Values ('valik B', 1, 2)

select *  
from opilane, Language, keelevalik
where opilane.opilaneid=keelevalik.opilaneid
and Language.ID=keelevalik.Language

create table oppimine2(
oppimineid int primary key identity(1,1),
aine varchar(10),
aasta int,
opetaja varchar(10),
opelaneid int,
 foreign key (opelaneid) references opelane(id),
opilanehinne int
);

insert into oppimine2(aine,aasta,opetaja,opelaneid,opilanehinne)
values ('Andmebaasid',5,'opetaja1',2);


select * from oppimine2

create table opelane(
    id int primary key identity(1,1),
    nimi varchar(255)
)

create table oppimine2(
    oppimineid int primary key identity(1,1),
    aine varchar(255),
    aasta int,
    opetaja varchar(10),
    opelaneid int,
    opilanehinne int,
    foreign key (opelaneid) references opelane(id)
);

insert into oppimine1(aine, aasta, opetaja, opelaneid, opilanehinne)
values ('Andmebaasid', 5, 'opetaja1', 2, 4);

select * from oppimine1;
