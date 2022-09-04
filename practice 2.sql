CREATE TABLE workers
(
  id int,
  name varchar(20),
  title varchar(60),
  manager_id int
);
INSERT INTO workers VALUES(1, 'Ali Can', 'Dev', 2);
INSERT INTO workers VALUES(2, 'John Davis', 'QA', 3);
INSERT INTO workers VALUES(3, 'Angie Star', 'Dev Lead', 4);
INSERT INTO workers VALUES(4, 'Amy Sky', 'CEO', 5);
select * from workers;

-- Tabloya company_industry isminde sütun ekleyiniz
alter table workers 
add column company_industry varchar(20);

-- TABLOYA worker_address sütunu ve defaullt olarakta 'Miami, FL, USA' adresini ekleyiniz.
alter table workers
add column worker_adress varchar(20) default 'miami,Fl,USA'

-- tablodaki worker_address sütununu siliniz
alter table workers drop column  worker_adress;

-- Tablodaki company_industry sütununu, company_profession olarak değiştiriniz.
alter table workers rename column company_industry to company_profession


-- Tablonun ismini employees olarak değişitiriniz.
alter table workers rename  to employes;
select*from employes

-- Tablodaki title sütununa data tipini VARCHAR(50) olarak değiştiriniz.
alter table employes 
alter column title type VARCHAR(50)

alter table employes  
add constraint titlem unique(title)    --unique de parantez icine yazmaliyiz 





