create table personel
(
id char(4),
isim varchar(50),
maas int
);
insert into personel values('1001', 'Ali Can', 70000);
insert into personel values('1002', 'Veli Mert', 85000);
insert into personel values('1003', 'Ayşe Tan', 65000);
insert into personel values('1004', 'Derya Soylu', 95000);
insert into personel values('1005', 'Yavuz Bal', 80000);
insert into personel values('1006', 'Sena Beyaz', 100000);
insert into personel values('1007', 'Eena Beyaz', 100000);
insert into personel values('1008', 'Bana Bayar', 100000);
insert into personel values('1009', 'Yalcin Bakar', 100000);
insert into personel values('1010', 'Ali Ten', 70000);
/*
SELECT - LIKE koşulu
LIKE : Sorgulama yaparken belirli (pattern) kalıp ifadeleri kullanabilmemizi sağlar
ILIKE : Sorgulama yaparken büyük/küçük harfe duyarsız olarak eşleştirir
LIKE : ~~
ILIKE : ~~*
NOT LIKE : !~~
NOT ILIKE :!~~*
% --> 0 veya daha fazla karakteri belirtir.
_ --> Tek bir karakteri belirtir
Similar to --> buyuk kucuk harf hassasiyeti vardir
*/
-- Ismi A harfi ile baslayan personeli listele
--select like ile
select isim from personel where isim ~~ 'A%';
--similar to ile
select isim from personel where isim similar to 'A%';


-- Ismi t harfi ile biten personeli listele
--select like ile
select isim from personel where isim ~~'%t';
--similar to ile
select isim from personel where isim similar to '%t';

-- Isminin 2. harfi e olan personeli listeleyiniz
--select like ile
select isim from personel where isim ~~'_e%';
--similar to ile
select isim from personel where isim similar to '_e%'


-- 'a' ile başlayıp 'n' ile biten personel isimlerini listeleyiniz
--select like ile
select isim from personel where isim ~~* 'a%n';
--similar to ile
select isim from personel where isim similar to 'A%n';  --buyuk kucuk harf duyarli


-- ikinci karakteri 'a' ve dördüncü karakteri 'u' olan personel isimlerini listeleyiniz
--select like ile
select isim from personel where isim ~~ '_a_u%';
--similar to ile
select isim from personel where isim similar to '_a_u%';


-- İçinde 'e' ve 'r' bulunan personel isimlerini listeleyiniz
--select like ile
select isim from personel where isim ~~* '%e%r%' or isim ~~*'e%' or isim ~~*'r%' or 
isim ~~* '%r' or isim ~~* '%e';
--similar to ile
select isim from personel where isim similar to '%e%r%' or isim similar to 'E%'
 or isim similar to 'R%'  or isim similar to '%e'  or isim similar to '%r'

-- 2. harfi e olup diğer harflerinde y olan personeli listeleyiniz
--select like ile
select isim from personel where isim ~~* '_e%y%' or isim ~~*'ye%';
--similar to ile
select isim from personel where isim similar to '_e%y%' or isim similar to 'Ye%';


-- a harfi olmayan personeli listeleyin
--select like ile
select isim from personel where isim !~~* '%a%'
--similar to ile olmaz



-- 1. harfi A ve 7. harfi a olan personeli listeleyin
--select like ile
select isim from personel where isim ~~* 'a_____a%';
--similar to ile
select isim from personel where isim similar to 'A_____a%'


--Sondan ikinci karakteri 'r' olan "isim" değerlerini listeleyiniz.
--select like ile
select isim from personel where isim ~~* '%r_';   --bozuk calismiyo 
--similar to ile
select isim from personel where isim similar to '%r_'; --bozuk calismiyo 

update personel set isim='Yeliz Bakar' where isim='Yalcin Bakar';
select *from personel;

