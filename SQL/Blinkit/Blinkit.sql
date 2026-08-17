create database blinkit;

use blinkit;

show tables;

select * from grocery_sales gs;

#2.Write an SQL query to show all Item_Identifier
select item_identifier 
from grocery_sales gs;

#3.Write an SQL query to show count of total Item_Identifier.
select count(item_identifier)
from grocery_sales gs;

#4. Write an SQL query to show maximum Item Weight.
select max(item_weight) 
from grocery_sales gs;

#5.Write an SQL query to show minimum Item Weight.
select min(item_weight)
from grocery_sales gs;

#6.Write an SQL query to show average Item_Weight.
select avg(item_weight)
from grocery_sales gs;

#7.Write an SQL query to show count of Item_Fat_Content WHERE Item_Fat_Content is Low Fat.
select count(item_fat_content)
from grocery_sales gs 
where gs.item_fat_content = 'Low Fat';

#8.Write an SQL query to show count of Item_Fat_Content WHERE Item_Fat_Content is Regular.
select count(item_fat_content)
from grocery_sales gs
where gs.item_fat_content = "Regular";

#9.Write an SQL query to show maximum Item_MRP 
select max(gs.item_mrp)
from grocery_sales gs;

#10.Write an SQL query to show minimum Item_MRP
select min(gs.item_mrp)
from grocery_sales gs;

#11.Write an SQL query to show Item_Identifier , Item_Fat_Content ,Item_Type, Item_MRP whose Item_MRP is greater than 200.
select item_identifier,
       item_fat_content,
       item_type,
       item_mrp
from grocery_sales gs
where gs.item_mrp > 200;

#12.Write an SQL query to show maximum Item_MRP WHERE Item_Fat_Content is Low Fat
select max(item_mrp)
from grocery_sales gs 
where gs.item_fat_content = 'low fat';

#13.Write an SQL query to show minimum Item_MRP whose Item_Fat_Content is Low Fat 
select min(item_mrp)
from grocery_sales gs 
where gs.item_fat_content = 'low fat';

#14. Write an SQL query to show ALL DATA WHERE item MRP is BETWEEN 50 to 100
select * from grocery_sales gs 
where gs.item_mrp between 50 and 100;

#15.Write an SQL query to show ALL UNIQUE value of Item_Fat_Content
select distinct item_fat_content
from grocery_sales;

#16.Write an SQL query to show ALL UNIQUE value of  Item_Type 
select distinct item_type 
from grocery_sales gs;

#17.Write an SQL query to show ALL DATA in descending ORDER by Item MRP
select * from grocery_sales gs 
order by gs.item_mrp desc;

#18.Write an SQL query to show ALL DATA in ascending ORDER by Item_Outlet_Sales
select * from grocery_sales gs 
order by gs.item_outlet_sales asc;

#19.Write an SQL query to show ALL DATA in ascending by Item_Type 
select * from grocery_sales gs 
order by gs.item_type asc;

#20.Write an SQL query to show DATA of item_type dairy & Meat
select * from grocery_sales gs 
where gs.item_type in('dairy','meat');

#21. Write an SQL query to show ALL UNIQUE value of Outlet_Size 
select distinct outlet_size
from grocery_sales gs;

#22. Write an SQL query to show ALL UNIQUE value of Outlet_Location_Type
select distinct outlet_location_type
from grocery_sales gs;

#23.Write an SQL query to show ALL UNIQUE value of Outlet_Type 
select distinct outlet_type
from grocery_sales gs;

#24.Write an SQL query to show count of number of items by Item_Type  and order it in descending order
select count(*),
       item_type
from grocery_sales gs 
group by gs.item_type 
order by gs.item_type desc;

#25.Write an SQL query to show count of number of items by Outlet_Size and ordered it in ascending order 
select count(*),
       outlet_size
from grocery_sales gs
group by gs.outlet_size
order by outlet_size asc;

#26.Write an SQL query to show count of number of items by Outlet_Type  and ordered it in descending order.
select count(*),
       outlet_type
from grocery_sales gs
group by gs.outlet_type
order by outlet_type desc;

#27.Write an SQL query to show count of items by Outlet_Location_Type and order it indescending order
select count(*),
       gs.outlet_location_type
from grocery_sales gs
group by gs.outlet_location_type
order by outlet_location_type desc;

#28.Write an SQL query to show maximum MRP by Item_Type 
select max(gs.item_mrp),
       item_type
from grocery_sales gs 
group by gs.item_type;

#29.Write an SQL query to show minimum MRP by Item_Type
select min(item_mrp),
       item_type
from grocery_sales gs
group by gs.item_type;

#30. Write an SQL query to show minimum MRP by Outlet_Establishment_Year and order it in descending order.
select min(item_mrp),
       outlet_establishment_year
from grocery_sales gs 
group by gs.outlet_establishment_year 
order by gs.outlet_establishment_year desc;

#31. Write an SQL query to show maximum MRP by Outlet_Establishment_Year and order it in descending order.
select max(item_mrp),
       outlet_establishment_year
from grocery_sales gs 
group by gs.outlet_establishment_year 
order by gs.outlet_establishment_year desc;

#32. Write an SQL query to show average MRP by Outlet_Size and order it in descending order.
select avg(item_mrp),
       outlet_size
from grocery_sales gs 
group by gs.outlet_size 
order by gs.outlet_size desc;

#33. Write an SQL query to Average MRP by Outlet_Type and ordered in ascending order.
select avg(item_mrp),
       outlet_type
from grocery_sales gs
group by gs.outlet_type
order by gs.outlet_type asc;

#34. Write an SQL query to show maximum MRP by Outlet_Type
select max(item_mrp),
       outlet_type
from grocery_sales gs
group by gs.outlet_type;

#35 .Write an SQL query to show maximum Item_Weight by Item_Type 
select max(item_weight),
       item_type
from grocery_sales gs
group by gs.item_type;

#36. Write an SQL query to show maximum Item_Weight by Outlet_Establishment_Year 
select max(item_weight),
       outlet_establishment_year
from grocery_sales gs
group by gs.outlet_establishment_year;

#37. Write an SQL query to show minimum Item_Weight by Outlet_Type 
select min(item_weight),
       gs.outlet_type
from grocery_sales gs
group by gs.outlet_type;

#38. Write an SQL query to show average Item_Weight by Outlet_Location_Type and arrange it by descending order
select avg(item_weight),
       outlet_location_type
from grocery_sales gs 
group by gs.outlet_location_type 
order by gs.outlet_location_type desc;

#39. Write an SQL query to show maximum Item_Outlet_Sales by Item_Type
select MAX(item_outlet_sales),
       item_type
from grocery_sales gs 
group by gs.item_type;

#40. Write an SQL query to show minimum Item_Outlet_Sales by Item_Type 
select min(item_outlet_sales),
       item_type
from grocery_sales gs 
group by gs.item_type;

#41. Write an SQL query to show minimum Item_Outlet_Sales by Outlet_Establishment_Year
select min(item_outlet_sales),
       outlet_establishment_year
from grocery_sales gs 
group by gs.outlet_establishment_year;

#42. Write an SQL query to show maximum Item_Outlet_Sales by Outlet_Establishment_Year and order it by descending order
select max(item_outlet_sales),
       outlet_establishment_year
from grocery_sales gs 
group by gs.outlet_establishment_year
order by gs.outlet_establishment_year desc;

#43. Write an SQL query to show average Item_Outlet_Sales by Outlet_Size and order it it descending order
select avg(item_outlet_sales),
       outlet_size
from grocery_sales gs
group by gs.outlet_size 
order by gs.outlet_size desc;

#44. Write an SQL query to show average Item_Outlet_Sales by Outlet_Type
select avg(item_outlet_sales),
       gs.outlet_type 
from grocery_sales gs
group by gs.outlet_type;

#45. Write an SQL query to show maximum Item_Outlet_Sales by Outlet_Type 
select max(item_outlet_sales),
       outlet_type
from grocery_sales gs 
group by gs.outlet_type;

#46. Write an SQL query to show total Item_Outlet_Sales by Item_Type
select sum(item_outlet_sales),
       item_type
from grocery_sales gs 
group by gs.item_type;

#47. Write an SQL query to show total Item_Outlet_Sales by Item_Fat_Content 
select sum(item_outlet_sales),
       item_fat_content
from grocery_sales gs
group by gs.item_fat_content;

#48. Write an SQL query to show maximum Item_Visibility by Item_Type
select max(item_visibility),
       item_type
from grocery_sales gs 
group by gs.item_type;

#49. Write an SQL query to show Minimum Item_Visibility by Item_Type
select min(item_visibility),
       item_type
from grocery_sales gs
group by gs.item_type;

#50. Write an SQL query to show total Item_Outlet_Sales by Item_Type but only WHERE Outlet_Location_Type is Tier 1 
select sum(item_outlet_sales),
       item_type
from grocery_sales gs 
where gs.outlet_location_type = 'Tier 1'
group by gs.item_type;

#51. Write an SQL query to show total Item_Outlet_Sales by Item_Type WHERE Item_Fat_Content is ONLY Low Fat & LF
select sum(item_outlet_sales),
       item_type,
       gs.item_fat_content
from grocery_sales gs 
where gs.item_fat_content in('low fat','lf')
group by item_type, gs.item_fat_content;