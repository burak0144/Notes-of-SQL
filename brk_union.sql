--UNION Operator:
--1) İki sorgu(query) sonucunu birleştirmek için kullanılır.
--2) Tekrarsız(unique) recordları verir.
--3) Tek bir sütuna çok sütun koyabiliriz.
--4) Tek bir sütuna çok sütun koyarken mevcut data durumuna dikkat etmek gerekir.

CREATE TABLE workers
(
  id CHAR(9),
  name VARCHAR(50),
  state VARCHAR(50),
  salary SMALLINT,
  company VARCHAR(20)
);
INSERT INTO workers VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO workers VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO workers VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO workers VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO workers VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO workers VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO workers VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');
SELECT * FROM workers;

-----------------UNION
--salary değeri 3000'den yüksek olan state değerlerini ve 2000'den küçük olan name değerlerini tekrarsız olarak bulun
select state AS name_state  -->hem name olacak hemde state
from workers
where salary>3000

UNION  -->TEKRARSIZ BIRLESTIRIP GETIRIR ve farkli tablolarida birlestirir

select name
from workers
where salary<2000

---------------UNION ALL
--salary değeri 3000'den yüksek olan state değerlerini ve 2000'den küçük olan name değerlerini tekrarlı olarak bulun.
select state as name_state
from workers
where salary>3000

UNION ALL -->tekrarli birlestirip getir 

select name
from workers
where salary<2000


-----------------INTERSECT  (ORTAK ELEMAN)
 --salary değeri 1000'den yüksek, 2000'den az olan "ortak" name değerlerini bulun.
select name
from workers 
where salary>1000

intersect    --->ortak elemanlari tekrarsiz getirir

select name
from workers
where salary <2000

--salary değeri 2000'den az olan ve company değeri  IBM, APPLE yada MICROSOFT olan ortak "name" değerlerini bulun.
select name
from workers
where salary>2000

intersect

select name
from workers
where company in('IBM','APPLE','MICROSOFT'); --bakilacak soru

--------------------------EXCEPT
 --EXCEPT Operator : Bir sorgu sonucundan başka bir sorgu sonucunu çıkarmak için kullanılır.
 --Unique(tekrarsız) recordları verir.
 
--salary değeri 3000'den az ve GOOGLE'da çalışmayan  name değerlerini bulun.
SELECT NAME 
FROM workers
where salary<3000

EXCEPT    ---->ikinci table'da olanlari cikarir

select name
from workers
where company='GOOGLE'
