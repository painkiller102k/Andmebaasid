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

