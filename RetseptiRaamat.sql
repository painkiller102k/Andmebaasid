create database RetseptiRaamatRossakov;
use RetseptiRaamatRossakov

create table kasutaja(
kasutaja_id int primary key identity (1,1),
eesnimi varchar(50),
perenimi varchar (50) not null,
email varchar(150)
);
insert into kasutaja(eesnimi,perenimi,email)
values ('Martin','Rossakov','martin@gmail.com'), ('Mark','Jürgen','mark@gmail.com'), ('Marek','Lukk','marek@gmail.com'), ('Illia','Blahun','illia@gmail.com'), ('Roman','Zaitsev','roman@gmail.com');
select * from kasutaja

create table kategooria(
kategooria_id int primary key identity (1,1),
kategooria_nimi varchar(50)
);
insert into kategooria(kategooria_nimi)
values ('supid'), ('magusad'), ('joogid'), ('suupisted'), ('liha');
select * from kategooria
select * from kasutaja

create table toiduaine(
toiduaine_id int primary key identity (1,1),
toiduaine_nimi varchar(100)
);
insert into toiduaine(toiduaine_nimi)
values ('hakkliha'), ('makaronid'), ('kaste'), ('sibul'), ('porgand');
select * from toiduaine

create table yhik(
yhik_id int primary key identity (1,1),
yhik_nimi varchar(100)
);
insert into yhik(yhik_nimi)
values ('ml'), ('kg'), ('g'), ('tl'), ('sl');

create table retsept(
retsept_id int primary key identity (1,1),
retsepti_nimi varchar(100),
kirjeldus varchar(200),
juhend varchar(500),
sisestatud_kp date,
kasutaja_id int,
foreign key (kasutaja_id) references kasutaja(kasutaja_id),
kategooria_id int,
foreign key (kategooria_id) references kategooria(kategooria_id)
);
insert into retsept(retsepti_nimi,kirjeldus,juhend,sisestatud_kp,kasutaja_id,kategooria_id)
values ('Limonad','Kerge limonad','Slice lemon','2025-02-15',1,2), ('Supp','Kerge supp','Röstitud köögiviljad','2025-03-16',2,4), ('Kana','Kerge kana','Pane kana ahju','2025-04-17',3,5), ('Shashlyk','Kerge Shashlyk','Pane liha grillile','2025-05-18',4,4), ('Salat','Kerge salat','Tükeldage köögiviljad','2025-06-19',5,2);


create table koostis(
koostis_id int primary key identity (1,1),
kogus int,
retsept_retsept_id int,
foreign key (retsept_retsept_id) references retsept(retsept_id),
toiduaine_id int,
foreign key (toiduaine_id) references toiduaine(toiduaine_id),
yhik_id int,
foreign key (yhik_id) references yhik(yhik_id)
);
insert into koostis(kogus,retsept_retsept_id,toiduaine_id,yhik_id)
values (3,5,5,4), (2,4,3,1), (1,6,4,2), (4,7,1,5), (5,8,2,3);
select * from koostis
select * from retsept
select * from toiduaine
select * from yhik
select * from tehtud

create table tehtud(
tehtud_id int primary key identity (1,1),
tehtud_kp date,
retsept_id int,
foreign key (retsept_id) references retsept(retsept_id)
);
insert into tehtud(tehtud_kp,retsept_id)
values ('2025-02-19',4), ('2025-03-20',5), ('2025-06-21',6), ('2025-07-16',7), ('2025-08-01',8);

--- добавление процедуры на добавление строки в таблицу retsept
create procedure additem
@lretsepti_nimi varchar(100),
@lkirjeldus varchar(200),
@ljuhend varchar(500),
@lsisestatud_kp date,
@lkasutaja_id int,
@lkategooria_id int

as
begin

insert into retsept(retsepti_nimi,kirjeldus,juhend,sisestatud_kp,kasutaja_id,kategooria_id)
values (@lretsepti_nimi,@lkirjeldus,@ljuhend,@lsisestatud_kp,@lkasutaja_id,@lkategooria_id)

end;
exec additem 'Kartul', 'Kerge limonad', 'koorida kartulid', '2025-06-17',5,2

--- добавление процедуры на добавление строки в таблицу koostis
create procedure addkoostis
@lkogus int,
@lretsept_retsept_id int,
@ltoiduaine_id int,
@lyhik_id int

as
begin

insert into koostis(kogus,retsept_retsept_id,toiduaine_id,yhik_id)
values (@lkogus,@lretsept_retsept_id,@ltoiduaine_id,@lyhik_id)

end;
exec addkoostis 11,8,2,3
  
--- добавление процедуры на добавление строки в таблицу tehtud
create procedure addtehtud
@ltehtud_kp date,
@lretsept_id int

as
begin

insert into tehtud(tehtud_kp,retsept_id)
values (@ltehtud_kp,@lretsept_id)

end;
exec addtehtud '2025-06-13',8
  
--- добавление процедуры на изменение в определенных строках
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

exec veeruLisaKustutaTabelis @valik='add', @tabelinimi='retsept', @veerunimi='5', @tyyp='int';
select * from retsept
exec veeruLisaKustutaTabelis @valik='drop', @tabelinimi='retsept', @veerunimi='6';
select * from retsept

--- собственная таблица с оценками на блюда
create table review(
reviewid int primary key identity (1,1),
retsept_id int,
foreign key (retsept_id) references retsept(retsept_id),
ülevaate_kirjeldus varchar(100)
);
insert into review(retsept_id,ülevaate_kirjeldus)
values (4,'See oli maitsev!'), (5,'Toit on kõrbenud'), (6,'Toit pole valmis!'), (7,'Toit on halvasti lõigatud!'), (8,'Toit on väga maitsev!');

--- процедура на заполение нового отзыва 
create procedure addreview
@lretsept_id int,
@lülevaate_kirjeldus varchar(100)

as
begin

insert into review(retsept_id,ülevaate_kirjeldus)
values (@lretsept_id,@lülevaate_kirjeldus)

end;
exec addreview 11,'test :)'

--- процедура на удаление отзыва по его id
create procedure kustutareview
@deleteID int
as
begin
select * from review;
delete from review where reviewID=@deleteID;
select * from review;
end;

exec kustutareview 1;
