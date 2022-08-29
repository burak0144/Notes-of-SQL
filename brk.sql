
create table calisan( --1.DDL tablo --DDL'de komutun yanina TABLE yazilir
id char(3),
isim varchar(10),
soyisim varchar(10),
telefon char(11),
maas int);
select *from calisan; --DQL tablo
select telefon from calisan; --DQL --tabloda istedigin veriyi yansitir
INSERT into calisan values ('100','Ali','Can','06547652352',10000);--DML veri
insert into calisan values ('101','Mehmet','Kaan',32875623,15000);  --DML veri
delete from calisan where id=101; --DML veri--tabloda istedigin veriyi siler 

ALTER table calisan add cinsiyet char(1); --2.DDL  tabloya column(sutun )ekler
Alter table calisan rename cinsiyet to cins; --DDL colomnn'in adi degisir
DROP table calisan; --3.DDL tum tabloyu siler

Insert into calisan(cinsiyet) values ('E'); --***
delete from calisan where cinsiyet='E'; 
update calisan set  cinsiyet='K'; --tekrar bakilacak
Update calisan set id='101', cinsiyet='E';--DML veri

CREATE TABLE isciler(
id_no varchar(10) primary key,
isim varchar(10) not null,
soyisim varchar(10) not null,
tel int unique);

Insert into isciler values (10,'Ali','Han',43445634);
INSERT into isciler values (20,'mehmet','kaan',43445634);  --tel unique olmali
insert into isciler values ('20','can','kan',3434545);
insert into isciler values (20,'canan','man',545234); --id_no primary unique olmali
insert into isciler values (null,'tanan','san',5435234);--primary null alamaz
insert into isciler values (43,'tanan','san',null);--unique null alir
insert into isciler values ('53','ranan','sen','');--ikinci hiclik olmaz null atandi diye
insert into isciler values ('','qanan','uen',43534)--primary hiclik olabilir 
insert into isciler values (34,'','wen',41534);

select *from isciler;

CREATE TABLE adresler(
adres_id char(5),
sokak varchar(20),
cadde varchar(30),
sehir varchar(20)
CONSTRAINT sira FOREIGN KEY (adres_id) REFERENCES calisan(telefon)
);

INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');
select*from adresler;


