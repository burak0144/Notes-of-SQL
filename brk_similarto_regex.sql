--SIMILAR TO'da aralik verildiginde [] kullanilir icerisinde - aralik kullaniir 
--farkli harfler soylendiginde () kullanilir icerisinde veya | kullanilir
--{} en az kac tane alacagini yansitir

--REGEX'te aralik yada veyali ifadelerin heppsinde [] kullanilir 
--veyali ifadelerde birsey konmaz aralikta - kullanilir
--similar to'da olan % ifadesi yerine * kullanilir
--similar to da olan _ ifadesi yerine . kullanilir
--similar to da olan | ifadesi yerine , yada | kullanilir
--^ ifadesi farkli karakterler icin olur
--$ son karakter oldugunu belirtir

--REGEX : Herhangi bir kod, metin içerisinde istenen yazı veya kod parçasının aranıp bulunmasını sağlayan
--kendine ait bir söz dizimi olan bir yapıdır.MySQL de(REGEXP_LİKE) olarak kullanılır
--PostgreSQL'de "~" karakteri ile kullanılır.Buyuk kucuk duyarsizligi '~*' kullanilir
--REGEX'de ikinci karakter icin koseli parantez kullanilir.  * hepsi anlaminda kullanilir
-- .(nokta) ise karakteri ifade eder 
CREATE TABLE kelimeler
(
id int,
kelime VARCHAR(50),
harf_sayisi int
);
INSERT INTO kelimeler VALUES (1001, 'hot', 3);
   INSERT INTO kelimeler VALUES (1002, 'hat', 3);
   INSERT INTO kelimeler VALUES (1003, 'hit', 3);
   INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
   INSERT INTO kelimeler VALUES (1005, 'hct', 3);
   INSERT INTO kelimeler VALUES (1006, 'adem', 4);
   INSERT INTO kelimeler VALUES (1007, 'selim', 5);
   INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
   INSERT INTO kelimeler VALUES (1009, 'hip', 3);
   INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
   INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
   INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
   INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
   INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
   INSERT INTO kelimeler VALUES (1015, 'hooooot', 5);
   INSERT INTO kelimeler VALUES (1016, 'booooot', 5);
   INSERT INTO kelimeler VALUES (1017, 'bolooot', 5);
   INSERT INTO kelimeler VALUES (1018, 'atlooot', 5);
   
   select*from kelimeler;
   
   --  İçerisinde 'ot' veya 'at' bulunan kelimeleri listeleyiniz
  --Veya islemi icin | karakteri kullanilir
  --SIMILAR TO ile
  select kelime from kelimeler where kelime similar to '%(ot|at)%'; --basina ve sonuna yuzde konulmali
 -- | veya ifadesi kullanilmalidir
  --REGEX ile
 select kelime from kelimeler where kelime ~ '[o,a]t';  
 
-- : 'ho' veya 'hi' ile başlayan kelimeleri listeleyeniz
--SIMILAR TO ile
  select kelime from kelimeler where kelime similar to 'h(o|i)%'
  --REGEX ile
 select kelime from kelimeler where kelime ~ '^h[oi]'

--Sonu 't' veya 'm' ile bitenleri listeleyeniz
--SIMILAR TO ile
  select kelime from kelimeler where kelime similar to '%(t|m)'; --sadece kucuk harfler t veya m
--regex ile
 select kelime from kelimeler where kelime ~ '^(.*)[t|m]$'
 
 -- h ile başlayıp t ile biten 3 harfli kelimeleri listeleyeniz
 --SIMILAR TO ile
  select kelime from kelimeler where kelime similar to 'h_t';
   select kelime from kelimeler where kelime similar to 'h(a-z,A-Z,0-9)t';  --yanlis 
   select*from kelimeler where kelime similar to 'h[a-z,A-Z,0-9]t';  --dogru kullanim kucuk,buyuk ve harfler 
  --araligi oldugundan koseli parantez kullanilir
 --regex ile
 select kelime from kelimeler where kelime ~ 'h[a-z,A-Z,0-9]t'
 
 --İlk karakteri 'h', son karakteri 't' ve ikinci karakteri
 --'a'dan 'e'ye herhangi bir karakter olan “kelime" değerlerini çağırın.
--SIMILAR TO ile
 select * from kelimeler where kelime similar to 'h[a-e]t'  --aralik oldugu icin [] kullanildi
 --regex ile
select * from kelimeler where kelime ~ '^h[a-e]t'

--İlk karakteri 's', 'a' veya 'y' olan "kelime" değerlerini çağırın.
--SIMILAR TO ile
 select *from kelimeler where kelime similar to '(s|a|y)%'
--regex ile
select*from kelimeler where kelime ~ '^[say]'

--Son karakteri 'm', 'a' veya 'f' olan "kelime" değerlerini çağırın.
--SIMILAR TO ile
select * from kelimeler where kelime similar to '%(m|a|f)'
--regex ile
 select*from kelimeler where kelime ~ '^(.*)[maf]$'
 
--İlk harfi h, son harfi t olup 2.harfi a veya i olan
--3 harfli kelimelerin tüm bilgilerini sorgulayalım.
--SIMILAR TO ile
select * from kelimeler where kelime similar to 'h[a-i]t'
--regex ile
select*from kelimeler where kelime ~ '^h[a-i]t'

--İlk harfi 'b' dan ‘s' ye bir karakter olan ve ikinci harfi herhangi bir karakter olup
--üçüncü harfi ‘l' olan “kelime" değerlerini çağırın.
--SIMILAR TO ile
select * from kelimeler where kelime similar to '[b-s]_l%'
--regex ile
select*from kelimeler where kelime ~ '^[b-s](.)l'
 
--içerisinde en az 2 adet o barıdıran kelimelerin tüm bilgilerini listeleyiniz
--SIMILAR TO ile
select * from kelimeler where kelime similar to '%(o%o)%'
--regex ile
select*from kelimeler where kelime ~ '[o]{2}'

--içerisinde en az 4 adet oooo barıdıran kelimelerin tüm bilgilerini listeleyiniz.
--SIMILAR TO ile
select * from kelimeler where kelime similar to '%(o){4}%'  --{} onundeki harfin kac tane olacagini yansitir
--regex ile
select*from kelimeler where kelime ~ '[o]{4}'

--'a', 's' yada 'y' ile başlayan VE 'm' yada 'f' ile biten "kelime" değerlerini çağırın.
--SIMILAR TO ile
select * from kelimeler where kelime similar to '(a|s|y)%(m|f)'
--regex ile
select*from kelimeler where kelime ~ '^[asy].*[mf]'