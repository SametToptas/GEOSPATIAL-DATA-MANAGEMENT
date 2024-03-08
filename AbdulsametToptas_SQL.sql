create table public.virtualmarketing
(
	id integer primary key not null,
	name varchar(100) not null,
	telnumber integer not null,
	website varchar(100) not null,
	adress text not null
);

create table public.employees
(
	id integer primary key not null,
	name varchar(100) not null,
	surname varchar(100) not null,
	telnumber integer not null,
	adress text not null,
	salary integer not null,
	hiredate date not null,
	virtualmarketid integer not null,
	Constraint fk_virtualmarketing
        FOREIGN KEY(virtualmarketid) 
            REFERENCES virtualmarketing(id)
                on delete cascade
                on update cascade
);

create table public.categories
(
	id integer primary key not null,
	name varchar(100) not null,
	employeeid integer not null,
	Constraint fk_employees
        FOREIGN KEY(employeeid) 
            REFERENCES employees(id)
                on delete cascade
                on update cascade
);

create table public.products
(
	id integer primary key not null,
	name varchar(100) not null,
	listprice integer not null,
	expirationdate date,
	categoryid integer not null,
	virtualmarketid integer not null,
	Constraint fk_categories
        FOREIGN KEY(categoryid) 
            REFERENCES categories(id)
                on delete cascade
                on update cascade,
	Constraint fk_virtualmarketing
        FOREIGN KEY(virtualmarketid) 
            REFERENCES virtualmarketing(id)
                on delete cascade
                on update cascade
);

create table public.customers
(
	id integer primary key not null,
	name varchar(100) not null,
	surname varchar(100) not null,
	telnumber integer,
	adress text,
	productid integer not null,
	Constraint fk_products
        FOREIGN KEY(productid) 
            REFERENCES products(id)
                on delete cascade
                on update cascade
);

create table public.campaigns
(
	id integer not null,
	name varchar(100) not null,
	startingdate date not null,
	endingdate date not null,
	PRIMARY KEY (id),
	CONSTRAINT fk_products_id FOREIGN KEY (id) REFERENCES products (id)
);

insert into virtualmarketing (id,name,telnumber,website,adress) values
(50,'Teknosa',3692853,'www.technology.com','Ankara'),
(100,'Getir',3692854,'www.getir.com','İstanbul'),
(150,'Decathlon',3692855,'www.decathlon.com','İzmir'),
(200,'Network',3692856,'www.network.com','Konya'),
(250,'Watsons',3692857,'www.watsons.com','Kocaeli'),
(300,'Mavi',3692858,'www.beymen.com','Antalya'),
(350,'Letgo',3692859,'www.letgo.com','Muğla'),
(400,'Migros',3692860,'www.migros.com','Eskişehir'),
(450,'Modalife',3692861,'www.modalife.com','Bolu'),
(500,'Ikea',3692861,'www.ikea.com','Nevşehir')

insert into employees (id,name,surname,telnumber,adress,salary,hiredate,virtualmarketid) values
(1,'İhsan','Kahriman',123456,'Ankara',8000,'20.11.2021',50),
(2,'Berke','Aygören',123123,'Ankara',8000,'21.11.2021',100),
(3,'Turgay','Daş',123654,'İstanbul',7500,'22.11.2021',150),
(4,'Yasin','Gedik',123564,'İstanbul',7500,'23.11.2021',200),
(5,'Ömer','Tetik',789456,'İzmir',7000,'24.11.2021',250),
(6,'Mevlüt','Akbayır',123412,'İzmir',7000,'25.11.2021',300),
(7,'Furkan','Gül',582147,'Konya',6500,'26.11.2021',350),
(8,'Hakan','Yurduseven',631479,'Konya',6500,'27.11.2021',400),
(9,'Mahmut','Rüzgar',361254,'Muğla',6000,'28.11.2021',450),
(10,'Veli','Çınar',563214,'Muğla',6000,'29.11.2021',500)

insert into categories (id,name,employeeid) values
(111,'Personal Care Products',1),
(222,'Hauseware and Outdoor',2),
(333,'Delicatessen',3),
(444,'Electronic',4),
(555,'Baby and Child',5),
(666,'Sport and Fun',6),
(777,'Clothing',7),
(888,'Food',8),
(998,'Pet',9),
(999,'Culture',10)


insert into products (id,name,listprice,expirationdate,categoryid,virtualmarketid) values
(11,'Suntan cream',77,'10.10.2025',111,250),
(12,'Shampoo',32,'10.11.2025',111,250),
(13,'Tooth paste',18,'26.10.2030',111,400),
(14,'Computer',8500,NULL,444,50),
(15,'TV',9000,NULL,444,50),
(16,'Camping Tent',2500,'08.04.2050',222,150),
(17,'Bacon',150,'20.11.2021',333,100),
(18,'Sausage',100,'20.11.2021',333,400),
(19,'Diaper',100,'14.11.2022',555,350),
(20,'Suit',2500,NULL,777,200),
(21,'Trousers',150,NULL,777,300),
(22,'Shirt',100,NULL,777,300),
(23,'Couch',3000,NULL,222,450),
(24,'Cutlery Set',1235,NULL,222,500),
(25,'Book',30,NULL,999,500),
(26,'Wet Cat Food',275,NULL,998,350),
(27,'Pizza',82,NULL,888,400),
(28,'Hamburger',35,NULL,888,100),
(29,'Energy Drink',12,'26.11.2021',888,400),
(30,'Rice',67,'05.04.2022',888,100),
(31,'Belt',12,NULL,777,200),
(32,'Dried Cat Food',300,'21.09.2024',998,350)

insert into campaigns (id,name,startingdate,endingdate) values
(12,'If you buy one, get the second free','02.03.2022','22.03.2022'),
(14,'10 percent discount','05/07/2022','05.12.2022'),
(15,'500 TL gift card when you buy a TV','13.10.2022','20.11.2022'),
(22,'20 TL Discount','05.08.2022','22.08.2022'),
(30,'17 TL Discount','10.09.2022','11.09.2022'),
(26,'Belt gift next to it','20.10.2022','20.10.2023'),
(32,'wet cat food gift','11.09.2022','18.09.2022'),
(16,'25 percent discount','20.05.2022','25.05.2022'),
(21,'30 TL Discount','10.10.2022','20.10.2022'),
(28,'18 TL Discount','08.06.2022','09.06.2022')

insert into customers (id,name,surname,telnumber,adress,productid) values
(1001,'Sena','Keskin',0212036,'Ankara',11),
(1002,'Hacer','Kule',0212034,'İstanbul',12),
(1003,'Burak','Lider',0212038,'İzmir',13),
(1004,'Kaan','Durak',0213201,'Konya',14),
(1005,'Ahmet','Kaplan',0214708,'Muğla',15),
(1006,'Yusuf','İzgi',0289630,'Antalya',16),
(1007,'Ömer','Tekin',0213478,'Ankara',17),
(1008,'Sergen','Hastürk',0212412,'Bolu',26),
(1009,'Kubilay','Yüzücü',0312456,'Çanakkale',32),
(1010,'Cemre','Uslu',0312456,'İstanbul',27)

-- A Primary Key Constraint
insert into customers (id,name,surname,telnumber,adress,productid) values
(1001,'Sena','Keskin',0212036,'Ankara',11),
(1001,'Ahmet','Tekkin',0214215,'İstanbul',12)

-- A Foreign Key Constraint
insert into customers (id,name,surname,telnumber,adress,productid) values
(1011,'İskender','Tokkat',02142131,'İstanbul',35)

-- One query involving a single table 
select * from employees where salary>7500 or salary<=6500

-- Two queries involving two tables (First)
select virtualmarketing.id as marketid,virtualmarketing.name as marketname,employees.id as employeeid,
employees.name as employeename,employees.surname as employeesurname,employees.salary as employeesalary
from virtualmarketing inner join employees on employees.virtualmarketid=virtualmarketing.id order by salary

-- Two queries involving two tables (Second)
select employees.id as employeeid,employees.name as employeename,employees.surname as employeesurname,
categories.id as categoryid,categories.name as categoryname from employees inner join categories 
on categories.employeeid=employees.id

-- One query involving three tables 
select products.id as productsbarcode,products.name as productname ,products.listprice,customers.id 
as customersid,customers.name as customersname,customers.surname as customerssurname,
campaigns.id as campaignsno,campaigns.name as campaignsname  from products inner join campaigns on products.id=campaigns.id
inner join customers on customers.productid=products.id order by listprice
