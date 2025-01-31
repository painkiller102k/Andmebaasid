CREATE TABLE opilane(
	opilaneID int AUTO_INCREMENT,
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
	'Martin',
	'Martin',
	'2006-16-10',
	2,
	4.5),
	(
	'Roman',
	'Roman',
	'2007-31-12',
	1,
	4.5);
(
	'Marek',
	'Marek',
	'2004-21-10',
	2,
	4.5);
(
	'Mark',
	'Mark',
	'2005-21-11',
	1,
	4.5);

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

