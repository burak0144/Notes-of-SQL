------foreign'i ve primary key'i sornadan ekleme---------------

CREATE TABLE ogrenci(
id int,
isim varchar(30),
	soyisimm varchar(30),
ders_ismi varchar(20)
);
Drop table ders_hocasi   --table i komple siler
delete from ogrenci where isim='Ahmet'; --Ahmet isimli variable i siler
select*from ogrenci;

Create Table ders_hocasi
AS
select ders_ismi from ogrenci
;
Alter table ders_hocasi add column hoca_ismi varchar(20);
select *from ders_hocasi

insert into ogrenci values(100,'Ali','Can','Kimya');
insert into ogrenci values(101,'Ahmet','Tan','Matematik');
insert into ogrenci values(100,'Ali','Can','Matematik');
insert into ogrenci values(101,'Ahmet','Tan','Fizik');

insert into ders_hocasi values('Kimya','Veli Efe');
insert into ders_hocasi values('Matematik','Tolga Kaan');
insert into ders_hocasi values('Fizik','Mete Kalkan');


alter table ogrenci
add constraint d_h primary key (ders_ismi);  --once primary key eklememiz gerekir

ALTER table ders_hocasi
add foreign key (ders_ismi) references ogrenci(ders_ismi); 
--tablolar olustuktan sonra foreign yapma,foreign yapabilmek icin o column'un primary 
--olmasi gerekir

select*from ogrenci,ders_hocasi where ogrenci.ders_ismi=ders_hocasi.ders_ismi;

---------Primary key ve Foreign key silme ---------------------

alter table ders_hocasi    --  once foreign key silinmeli
drop constraint ders_hocasi_ders_ismi_fkey;

alter table ogrenci   --daha sonra primary key silinebilir
DROP constraint d_h;


-------------foreign'i basta olusturmak

CREATE TABLE ogrenci2(
id int,
isim varchar(30),
	soyisimm varchar(30),
ders_ismi varchar(20)
);
ALTER TABLE ogrenci2
Add primary key (ders_ismi);

select*from ogrenci2;


Create Table ders_hocasi2(
ders_ismi varchar(20),
hoca_ismi varchar(20),
constraint f_k foreign key (ders_ismi) references ogrenci2(ders_ismi)
	); --tablo olusurken foreign yapma

select*from ders_hocasi2;

insert into ogrenci2 values(100,'Ali','Can','Kimya');
insert into ogrenci2 values(101,'Ahmet','Tan','Matematik');
insert into ogrenci2 values(101,'Ahmet','Tan','Fizik');

insert into ders_hocasi2 values('Fizik','Veli');
insert into ders_hocasi2 values('Kimya','Melih');
insert into ders_hocasi2 values('Matematik','Selin');

select*from ogrenci2,ders_hocasi2 where ogrenci2.ders_ismi=ders_hocasi2.ders_ismi

--child'da ekleme yapabilmek icin foreign yapilan parent'taki sutunda bulunan variable'dan olmali
insert into ders_hocasi values('Kimya','Ayse'); --Kimya parentta oldugundna ekleme yapildi
select*from ders_hocasi;
insert into ders_hocasi values('Muzik','Ayse'); --Muzik parentta olmadigindan ekleme olmaz
insert into ogrenci2 values(102,'Gul','Cicek','Beden'); --parent'ta ekleme bagimsizdir


delete from ogrenci2 where ders_ismi='Kimya';  --childi varken parenttan bilgi silemezsin
--once childdan silmen gerekir
delete from ders_hocasi2 where ders_ismi='Kimya'; --child'dan silince parent'tan silebildik

------veyahut parent'tan veriyi direkt silebilmek icin-------

--parentta ON DELETE CASCADE eklenmelidir
CREATE TABLE ogrenci3(
id int,
isim varchar(30),
	soyisimm varchar(30),
ders_ismi varchar(20) primary key

);
insert into ogrenci3 values(100,'Ali','Can','Kimya');
insert into ogrenci3 values(101,'Ahmet','Tan','Matematik');
insert into ogrenci3 values(101,'Ahmet','Tan','Fizik');

Create Table ders_hocasi3(
ders_ismi varchar(20),
hoca_ismi varchar(20),
	constraint f_k foreign key (ders_ismi) references ogrenci3(ders_ismi)
	ON DELETE CASCADE ---------------BU kod eklendiginde parent'tan direkt veriler silinebilinir
	);
insert into ders_hocasi3 values('Fizik','Veli');
insert into ders_hocasi3 values('Kimya','Melih');
insert into ders_hocasi3 values('Matematik','Selin');

select*from ogrenci3;
select*from ders_hocasi3;

---on cascade kodu child'a eklendikten sonra
delete from ogrenci3 where ders_ismi='Kimya'; --direkt silindi
DROP TABLE ogrenci3; --buda direkt silinmedi 
DROP TABLE ogrenci3 CASCADE; --direkt silindi

--veri turunun uzunlugunu degistirme  TYPE
Alter table ders_hocasi3
alter ders_ismi type varchar(10); --uzunlugunu degistirdik

Alter table ders_hocasi3
alter ders_ismi type char(9); --alterle tablonun sutunundaki datayi guncellemek icin
--once alter komutu sonra type ile verinin data turunu degistirdik

--veri turune NOT NULL atama    SET
Alter table ders_hocasi3
alter ders_ismi SET NOT NULL;  --set ile not null atamasi yapildi

insert into ders_hocasi3 values(null,'Veli'); --ders ismi null alamaz
insert into ders_hocasi3 values('Fen',NULL); --ders hocasina null atanir
select*from ders_hocasi3;

--veri eklemeyi kontrollu yapmak  ADD   ---    CHECK
Create Table ders_hocasi4(
ders_ismi varchar(20),
hoca_ismi varchar(20)
	);
Alter table ders_hocasi4 add column ders_saati int;  --ADD ile sutun eklendi

insert into ders_hocasi4 values('Fizik','Veli',15);
insert into ders_hocasi4 values('Kimya','Melih',18);
insert into ders_hocasi4 values('Matematik','Selin',20);

select*from ders_hocasi4;

Alter table ders_hocasi4
add constraint sinir check (ders_saati<21);  --CHECK ile eklicegim veriyi sinirlandirdim
insert into ders_hocasi4 values('Biyoloji','Ahmet',21); --sinir 20'ye kadar oldugundan eklemedi

Alter table ders_hocasi4 
add constraint sinir2 check (hoca_ismi<'Z');
insert into ders_hocasi4 values('Biyoloji','Zeynep',15);--sinir Z harfi oldugundan eklemez

-----OR ile AND kullanimi-------------
--AND kullaniminda iki sarti saglamasi lazim
select*from ders_hocasi4 where ders_saati>=15 and hoca_ismi='Veli'; --ikisart saglanmali
--OR kullaniminda iki sartin biri saglanmasi lazim
select * from ders_hocasi4 where ders_saati>15 or hoca_ismi='Veli';

-----BETWEEN KOMUTU-----iki deger arasini getirir,sinirlar dahildir
--ders_hocasi4'ten ders saati 18'den buyuk olanlari getir
select*from ders_hocasi4 where ders_saati>18;
--ders saati 18 ile 20 arasindaki degerleri getir(sinirlar dahil)
select*from ders_hocasi4 where ders_saati>=18 and ders_saati<=20;
---2.yol between ile
select*from ders_hocasi4 where ders_saati between 18 and 20;

select *from ders_hocasi4 where hoca_ismi between 'M' and 'Salin';
select *from ders_hocasi4 where hoca_ismi between 'Melih' and 'Selin';

select*from ders_hocasi4;
------IN KOMUTU--------
--ayni sutundaki farkli degerleri bir komutta yansitmaya yarar
select*from ders_hocasi4 where ders_saati IN(15,18); 

----SELECT - LIKE KOMUTU -----
--LIKE (~~)  : Belirli kaliplari kullanabiliriz
--ILIKE(~~*) : Buyuk-Kucuk harf duyarsizdir
--NOT LIKE:!~~
--NOT ILIKE:!~~*
--%-->0 veya daha fazla karakter yansitir
--_-->Tek karakter yansitir

--ismi A harfi ile baslayan ders_hocasi4'u listele
select*from ders_hocasi4 where hoca_ismi like 'A%'; --A ile baslar sonrasi onemli degil
--bransi a ile biten dersleri yansit
select*from ders_hocasi4 where ders_ismi like '%a'; --t ile biter oncesi onemli degil
--ikinci harfi i olan dersleri listele
select*from ders_hocasi4 where ders_ismi like '_i%';  --2.harfi i sonrasi onemli degil




