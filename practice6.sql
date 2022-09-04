CREATE TABLE sirketler
(
	sirket_id int,                               -- sirket id ler ortak oldugu icin bu field lardan baglanti kuruldu
	sirket_isim VARCHAR(20)                      --sirketler           siparisler
);                                               --100                   101 ++
INSERT INTO sirketler VALUES(100, 'Toyota');     --101 ++                102 ++
INSERT INTO sirketler VALUES(101, 'Honda');      --102 ++                103 ++ 
INSERT INTO sirketler VALUES(102, 'Ford');       --103 ++               104
INSERT INTO sirketler VALUES(103, 'Hyundai');    --                     105

CREATE TABLE siparisler
(
	siparis_id int,
	sirket_id int,
	siparis_tarihi DATE
);
INSERT INTO siparisler VALUES(11, 101, '2022-04-17');
INSERT INTO siparisler VALUES(22, 102, '2022-04-18');
INSERT INTO siparisler VALUES(33, 103, '2022-04-19');
INSERT INTO siparisler VALUES(44, 104, '2022-04-20');
INSERT INTO siparisler VALUES(55, 105, '2022-04-21');

select * from sirketler;
select * from siparisler;

 -- SORU1: Iki Tabloda sirket_id’si ayni olanlarin; sirket_ismi, siparis_id ve
 -- siparis_tarihleri listeleyen bir sorgu yaziniz.
  select B.sirket_isim,A.siparis_id,A.siparis_tarihi
  from siparisler AS A inner join sirketler AS B
  on A.sirket_id=B.sirket_id
  
  
 -- SORU2: sirketler tablosundaki tum sirketleri ve bu sirketlere ait olan
 -- siparis_id ve siparis_tarihleri listeleyen bir sorgu yaziniz.
  select A.sirket_id,A.sirket_isim,B.siparis_id,B.siparis_tarihi
  from sirketler as A left join siparisler as B
  on A.sirket_id=B.sirket_id
  
  
  select A.sirket_id,A.sirket_isim,B.siparis_id,B.siparis_tarihi
  from siparisler as B RIGHT join sirketler as A
  on A.sirket_id=B.sirket_id;

   ---------------full join ile cozum
    select A.sirket_id,A.sirket_isim,B.siparis_id,B.siparis_tarihi
  from sirketler as A left join siparisler as B
  on A.sirket_id=B.sirket_id
  union
  select A.sirket_id,A.sirket_isim,B.siparis_id,B.siparis_tarihi
  from siparisler as B RIGHT join sirketler as A
  on A.sirket_id=B.sirket_id;
  
 --SORU3: siparisler tablosundaki tum siparis_id ve siparis_tarihleri ile
 --bunlara karşılık gelen sirket_isimlerini listeleyen bir sorgu yaziniz.
  select B.sirket_id,B.sirket_isim,A.siparis_id,A.siparis_tarihi
  from siparisler as A 
  full join sirketler as B
  on A.sirket_id=B.sirket_id


