show databases;

create database fingertips;

use fingertips;

create table Employee (
Emp_ID int(10),
First_Name varchar(10),
Last_Name varchar(10),
Dept_code int (3));

select * from employee;

insert into Employee (Emp_ID, First_Name, Last_Name, Dept_Code)
values
(248132604,"Shivam", "Deo",76),
(815242165,"Parijat", "Shankar",43),
(416122768,"rahul", "Srivastava", 66),
(960828909,"Kumar","Swamy",47),
(440361783,"Shankh","Khurana",23),
(851591490,"Swapnil", "Mehta", 43),
(668957687,"Arvind", "Chattejee",23),
(585068105,"Jalpesh", "Modi",33),
(379882096,"Kavita", "Yadav", 23),
(718929853,"Syed", "Zaheer", 66),
(873840890,"Sanjay", "Shukla",76),
(941877566,"Ragini", "Malhotra",33),
(998809976,"Javed","Khan", 23),
(669391133, "Vikram","Singh",43),
(861199021,"Ajay","Kumar",23),
(980140890,"Pankaj","Verma",43),
(750603819,"Roshan","Singh",47),
(558885983,"Sunaina","Yadav",76),
(392214056,"Bhavna","Sharma",66),
(164880802,"Pooja","Kumari",47);

select * from employee;


create table Department(
Dept_Code int (10),
Dept_Name varchar(25),
Dept_Budget int (12));

insert into Department (Dept_Code,Dept_Name,Dept_Budget)
values
(23,"Sales and Marketing",50000000),
(66,"Information Technology",100000000),
(43,"Customer Service",30000000),
(33, "Human Resources",20000000),
(76, "Finance and Accounting",40000000),
(47,"Operations",60000000);

select * from department;

#1. What are the unique Last_Names from the Employee Table?
select distinct last_name
from employee;

#2.What is the total number of employees in the company?
select count(*) 
from employee;

#3.What is the total budget for the company?
select sum(dept_budget) as total_budget
from department d;

#4.What is the department code and budget for the "Operations" department?
select dept_code,
       dept_budget
from department 
where Dept_Name = 'operations';

#5.What is the total budget for the "Information Technology" and "Finance and Accounting" departments?
select sum(dept_budget) as total_budget
from department 
where Dept_Name in ('Information Technology','Finance and Accounting');

#6.Who are the employees working in the "Sales and Marketing" department?
select e.first_name,
       e.last_name,
       d.Dept_Name
 from employee e
 inner join 
 department d 
 on e.dept_code = D.dept_code
 where d.dept_name = "sales and Marketing";



#7.What is the name of the employee with Emp_ID 718929853?
select first_name, 
       last_name 
from employee 
where emp_id = 718929853;


#8.What is the budget for the "Customer Service" department?
select dept_budget
from department 
where dept_name = "customer service";


#9.What is the total budget for all departments except "Operations"?
select sum(dept_budget) as Budget
from department
where dept_name <> 'operations';


#10.What is the Emp_ID, First_Name and department_code of the employee with the last name "Shukla"?
select emp_id,
       first_name,
       dept_code
from employee e 
where last_name = "shukla";


#11.What is the average budget for the departments with Dept_Code 23 and 43?
select avg(dept_budget) as avg
from department
where dept_code in (23 ,43);


#12.How many employees are there whose first name starts with the letter "S"?
select count(*) as total_count
from employee 
where first_name like 's%';


#13.List the name of Employees whose First_name starts with "S".
select first_name,
       last_name 
from employee 
where first_name like "s%";


#14.List the name of Employees whose First_name starts with "S" and ends with "A".
select  first_name,
        last_name 
from employee 
where first_name like "s%%a";



#15.Fetch Top 3 records of all the Departments in descending order based on the budget of the department.
select * from department
order by dept_budget desc
limit 3;



#16.Fetch data of all employees from the employee table whose dept_code is an odd number
select *
from department 
where dept_code %2 <> 0;


#17.Create a clone of the table employee with a name Clone_table and having two columns, 
#one with full name and the other with the department code with an alias D_Code
create table Clone_table as 
select concat (first_name, ' ', last_name) as fullname,
dept_code as d_code
from employee;

select * from clone_table;


#18.Delete employee details of "Ajay Kumar" from Clone_Table
delete from Clone_table
where Fullname = "ajay kumar";
select * from 
clone_table 
where fullname = "ajay kumar";


#19.The name of the employee "rahul Srivasatava" has a lower case 'r', make changes in the clone table 
#so that the full_name is written as "Rahul Srivastava" 
update  Clone_table
set fullname = "Rahul Srivastava"
where fullname = "rahul sirvasatav";

select * from clone_table;


#20.Convert Full_name from clone table into uppercase.
update clone_table
set fullname = Upper(fullname);

#21.Fetch second to fifth record from the department table based on the Highest Budget.
select *
from department
order by dept_budget desc 
limit 1,4;


#22.The employee with the name "Jalpesh Modi" has decided to move into another department, 
#delete the D_code value corresponding to "Jalpesh_Modi" from the clone_table
update clone_table 
set d_code = null
where fullname = "jalpesh_modi";

select * from clone_table
where fullname = "jalpesh_modi";


#23.Change the name of the column D_Code to Department_code in clone table.
alter table clone_table
rename column d_code to Department;

select * from Clone_table;


#24.Since no mathematical operation will be performed on emp_id in employee table, convert its data type from int to varchar
alter table employee
modify column emp_id varchar(10);


#25.The Company has decided to increase the budget of all the department by 10% , make changes accordingly to fetch old and new budget
select dept_code,
       dept_name,
       dept_budget as old_budget,
       dept_budget *1.10 as New_budget
  from department;


#26.What is the name of the department with the lowest budget?
select dept_name,
       dept_budget
 from department 
order by Dept_Budget 
limit 1;


#27.Who are the employees working in the departments with budgets greater than 40,000,000?
select e.first_name,
       e.last_name,
       d.Dept_Name  
from employee e 
join department d
on e.Dept_code = d.Dept_Code 
where dept_budget > 40000000;


#28.What is the name of the department with the second highest budget?
select dept_name
from department 
order by dept_budget desc 
limit 1,1;


#29.How many employees are there in each department?
select d.dept_name,
      count(e.emp_id) as Employees_count
from department d
join employee e
on e.dept_code = d.dept_code
group by d.dept_name;


#30.Create a view of Employees working in Sales and Marketing department only.
select e.emp_id,
       e.first_name,
       e.last_name,
       d.dept_name
from employee e
join department d
on e.dept_code = d.dept_code
where dept_name = "sales and marketing";
      
  select * from department;      
  select * from employee;
