create database croma;

show databases;

use croma;

create table Products(
   Product_code int(5),
   Prodcut_name varchar(50),
   Product_price int(7),
   Manufacturer_code int(5)
);

select * from Products;

insert into Products values 
(1, "1 TB Hard Disk Drive", 2500, 1),
(2, "Printer", 6500, 3),
(3, "64 GB Pen Drive", 700, 6),
(4, "6 GB Graphic Card", 12800, 5),
(5, "22 Inches Monitor", 10600, 2),
(6, "512 GB Solid State Drive", 4200, 1),
(7, "Mouse", 400, 6),
(8, "450 Watt Power Supply Unit", 3600, 4),
(9, "Printer Cartridge", 2500, 3),
(10, "Membrane Keyboard", 900, 4),
(11,"Bluetooth Speakers", 2000, 10),
(12, "42 Inches Television", 24600, 2),
(13, "CPU  Cabinet", 1900, 6),
(14, "Laptop Adjustable Stand", 1250, 7),
(15, "8 GB RAM", 2600, 4),
(16, "Motherboard", 6500, 8),
(17, "Ergonomic Chair", 9700, 6),
(18, "Monitor Arm Stand", 2600, 7),
(19, "Wifi Adapter", 300, 9),
(20, "HD Webcam", 1000, 8);

select * from products p;

create table Manufacturers(
	Manufacturer_code int(5),
	Manufacturer_name varchar(50)
);

insert into Manufacturers values 
(1, "Western Digital"),
(2, "Samsung"),
(3, "Hewlett Packard"),
(4, "Corsair"),
(5, "Asus"),
(6, "Ant esports"),
(7, "Cosmic Byte"),
(8, "Zebronics"),
(9, "TP-Link"),
(10, "BoAt");

select * from Manufacturers;

#1.Select the names of all the products in the inventory.
 
select prodcut_name from products p;

drop  table products;

create table Products(
   Product_code int(5),
   Product_name varchar(50),
   Product_price int(7),
   Manufacturer_code int(5)
);

insert into Products values 
(1, "1 TB Hard Disk Drive", 2500, 1),
(2, "Printer", 6500, 3),
(3, "64 GB Pen Drive", 700, 6),
(4, "6 GB Graphic Card", 12800, 5),
(5, "22 Inches Monitor", 10600, 2),
(6, "512 GB Solid State Drive", 4200, 1),
(7, "Mouse", 400, 6),
(8, "450 Watt Power Supply Unit", 3600, 4),
(9, "Printer Cartridge", 2500, 3),
(10, "Membrane Keyboard", 900, 4),
(11,"Bluetooth Speakers", 2000, 10),
(12, "42 Inches Television", 24600, 2),
(13, "CPU  Cabinet", 1900, 6),
(14, "Laptop Adjustable Stand", 1250, 7),
(15, "8 GB RAM", 2600, 4),
(16, "Motherboard", 6500, 8),
(17, "Ergonomic Chair", 9700, 6),
(18, "Monitor Arm Stand", 2600, 7),
(19, "Wifi Adapter", 300, 9),
(20, "HD Webcam", 1000, 8);

#1.Select the names of all the products in the inventory.
 
select product_name from products p;

#2.Select the names and the prices of all the products in the inventory.

select product_name, product_price from products p;

#3.Use an Alias "Name" and print all the product names

select product_name as Name 
from products p;

#4.Select the name of the products with a price less than or equal to 8000 Indian Rupees.

select product_name, product_price 
from products p 
where Product_price <= 800;

#5.Select all the products with a price between 2000 and 10000 Indian Rupees.

select * from products p
where Product_price between 2000 and 10000;

#6.List the details of all such products whose manufacturer_code is 6.
select * from products p
where p.Manufacturer_code = 6;

#7.List the details of all such products whose manufacturer_code is 6 as well as their price is greater than 5000.
select * from products 
where Manufacturer_code = 6 
and Product_price >5000;

#8.List the details of all such products other than whose manufacturer_code is 6.
select * from products p 
where Manufacturer_code not in(6);

#9.Select the name of the products whose name starts with 'M'.
select product_name from products p 
where p.Product_name like 'M%';

#10.List the name of products whose name starts with "M" and ends with "D".
select product_name from products 
where product_name like "M%D";

#11.List the name of products which starts from "M" ends with "D" but also has ONLY 9 characters in between.
select product_name from products
where product_name like "M_________D";

#12.Concatenate name of the product with its price in a single column.
select concat(product_name,' - ₹', Product_price)
as product_details 
from products;

#13.Select the name and price in dollars (i.e. the price must be divided by 80.)
select product_name,
       product_price / 80 as price_$
from products;

#14.Compute the average price of all the products in Indian Rupees.
select avg(product_price)
from products;

#15.Compute the average price of all products with manufacturer code equal to 3.
select avg(product_price) 
from products where Manufacturer_code = 3;

#16.What is the total cost of products where manufacturer_code is 2?
select sum(product_price)
from products 
where Manufacturer_code = 2;

#17. Compute the number of products with a price greater than or equal to 5000.
select count(*) total_products
from products 
where Product_price >=5000;

#18. Select the name and price of all products with a price larger than or equal to 5000 Indian Rupees and sort them by price (in descending order), and then by their name (in ascending order).
select product_name,
       product_price 
from products 
where Product_price >= 5000 
order by Product_price desc,
         Product_name asc;

#19. Select all the data from the inventory, including all the data for each product's manufacturer.
select * from products p 
join manufacturers m 
on p.Manufacturer_code = m.Manufacturer_code;

#20.Select the product name, price, and manufacturer name of all the products.
select p.product_name,
       p.product_price,
       m.Manufacturer_name 
from products p 
inner join manufacturers m 
on p.Manufacturer_code = m.Manufacturer_code;

#21.Select the average price of each manufacturer's products, showing only the manufacturer's code.
select manufacturer_code,
       avg(product_price)
from products p 
group by manufacturer_code;

#22.Select the average price of each manufacturer's products, showing the manufacturer's name.
select m.manufacturer_name,
       avg(p.product_price)
from products p
join manufacturers m 
on p.Manufacturer_code = m.Manufacturer_code 
group by m.Manufacturer_name;

#23.Select the names of manufacturer whose products have an average price greater than or equal to 5000 Indian Rupees.

select m.manufacturer_name,
       avg(p.product_price)
from products p 
join manufacturers m 
on p.Manufacturer_code = m.Manufacturer_code 
group by m.Manufacturer_name 
having avg(p.product_price) >= 5000;

#24.Select the name and price of the cheapest product.
select product_name,
       product_price 
from products p 
order by p.Product_price asc 
limit 1;

#25.Select the name of each manufacturer along with the name and price of its most expensive product.
select m.manufacturer_name,
       p.product_name,
       p.product_price
from products p
join manufacturers m
on p.manufacturer_code = m.manufacturer_code
where p.product_price = (
    select max(p2.product_price)
    from products p2
    where p2.manufacturer_code = p.manufacturer_code
);

#26. Add a new product: Speaker with a price 1000 INR and manufacturer code 10
insert into products value
(21,"Speaker", 1000, 10);

#27.Update the name of the product "Speakers" to "Wired Speakers".
update products 
set product_name = 'Wired Speakers'
where product_name = 'Speaker';

select *from products p;

#28.Apply a 10% discount to all products. 
select product_name,
       product_price as price,
       product_price * 0.90 as discounted_price
from products p;

#29.Apply a 10% discount to all products with a price greater than or equal to 5000 Indian Rupees.
select product_name,
       product_price as price,
       product_price * 0.90 as discounted_price
from products p 
where p.Product_price >= 5000;

#30. List the name of the products along with their manufacturer name and price and arrange them as per their price.
select p.product_name,
       p.product_price,
       m.manufacturer_name
from products p 
join manufacturers m 
on p.Manufacturer_code = m.Manufacturer_code 
order by p.Product_price desc;
      















