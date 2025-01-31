create database ePoodRossakov;
use ePoodRossakov;

create table category (
idCategory int primary key identity(1,1),
CategoryName varchar(25) unique
);
select * from category;
insert into category (CategoryName)
values ('jook'), ('söök');

--tabeli struktuuri muutmine -- uue veergu lisamine

alter table category add test int;

--tabeli struktuuri muutmine -- uue veergu kustutamine

alter table category drop column test;

create table product (
idproduct int primary key identity(1,1),
productname varchar(25) unique,
idcategory int,
foreign key (idcategory) references category(idcategory),
price decimal(5,2)
);
select * from product;
insert into product (productname, idcategory, price)
values ('Sprite',1,2.0), ('Fanta',1,3.0), ('Nestea',1,2.5), ('CocaCola',1,1.5), ('Water',1,1.0)

create table sale (
idsale int primary key identity (1,1),
idproduct int,
foreign key (idproduct) references product(idproduct), 
idcustomer int,
count int,
dateofsale date
);

--kustutab kõik kirjed
delete from sale

create table customer (
idcustomer int primary key identity (1,1),
name varchar (25),
contact text)

--tabeli muutmine foreign key lisamine
alter table sale add foreign key (idcustomer)
references customer(idcustomer)

insert into customer(name, contact)
values ('Martin','messenger'), ('Mark','messenger'), ('Marek','messenger'), ('Roma','messenger'), ('Nikita','messenger')

insert into sale (idproduct, idcustomer, count, dateofsale)
values (2,3,150,'2006-10-16'), (1,2,250,'2007-11-17'), (4,2,350,'2008-12-18'), (5,1,450,'2009-01-19'), (1,1,550,'2010-02-20')


select * from category
select * from product
select * from sale
select * from customer
