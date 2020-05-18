
CREATE TABLE "departments" (
    "dept_no" varchar(5)   NOT NULL Primary Key,
    "dept_name"  varchar(30)  NOT NULL
    
     
);
select * from "departments";


CREATE TABLE "dept_emp" (
 
   --"pk_id" serial Primary Key, 
	"emp_no" int  NOT NULL,
    "dept_no" varchar(5) NOT NULL
    --Foreign Key ("dept_no") References "departments"("dept_no")
  
);
Select * from "dept_emp";

Alter Table "dept_emp"
	add "pk_id" serial Primary Key,
	add Foreign Key ("dept_no") References "departments"("dept_no");


CREATE TABLE "dept_manager" (
    "dept_no" varchar(5)   NOT NULL,
    "emp_no" int   NOT NULL Primary Key,
	Foreign Key ("dept_no") References "departments"("dept_no")
	
);

CREATE TABLE "employees" (
    "emp_no" int   NOT NULL Primary Key,
    "emp_title" varchar(50)   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(50)   NOT NULL,
    "last_name" varchar(50)   NOT NULL,
    "sex" varchar(1)   NOT NULL,
    "hire_date" date   NOT NULL
    
     
);

CREATE TABLE "salaries" (
    "emp_no" int   NOT NULL Primary Key,
    "salary" int   NOT NULL,
    Foreign Key ("emp_no") References "employees"("emp_no")
     
);

CREATE TABLE "titles" (
    "title_id" varchar(50)   NOT NULL primary key,
    "title" varchar(50)   NOT NULL
	
);

select * from "titles";
Alter table employees
add foreign key ("emp_title") References "titles"("title_id");


--Drop table "Departments", "dept_emp", "dept_manager", "employees", "salaries", "titles";
Select * from "dept_emp";
--1. List the following details of each employee: employee number, last name, first name, sex, and salary.

Select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
inner join salaries on salaries.emp_no=employees.emp_no;


--employee number, last name, first name, sex, and salary
Select  
	employees.emp_no, 
	employees.last_name, 
	employees.first_name,
	employees.sex,
	salaries.salary
From employees
Inner Join salaries on employees.emp_no=salaries.emp_no;

--first name, last name, and hire date for employees who were hired in 1986


Select first_name, last_name, hire_date from employees where hire_date >= '19850101' And hire_date < '19860101';

CREATE TABLE "dept_manager" (
    "dept_no" varchar(5)   NOT NULL,
    "emp_no" int   NOT NULL Primary Key,
	Foreign Key ("dept_no") References "Departments"("dept_no")
	
);

--employee number, last name, first name, sex, and salary
Select  
	employees.emp_no, 
	employees.last_name, 
	employees.first_name,
	employees.sex,
	salaries.salary
From employees
Inner Join salaries on employees.emp_no=salaries.emp_no;

--first name, last name, and hire date for employees who were hired in 1986


Select first_name, last_name, hire_date from employees where hire_date >= '19850101' And hire_date < '19860101';

--List the manager of each department with the following information: 
--department number, 
--department name, 
--the manager's employee number, 
--last name, 
--first name


Select
	dept_manager.dept_no,
	departments.dept_name,
	dept_manager.emp_no,
	employees.last_name,
	employees.first_name
From dept_manager
inner Join departments on dept_manager.dept_no=departments.dept_no
inner Join employees on dept_manager.emp_no= employees.emp_no;



Select * from "dept_manager";
Alter table "Departments"
add foreign key ("dept_no") References "dept_manager"("dept_no");

--4. List the department of each employee with the following information: 
--employee number, last name, first name, and department name.


Select
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
From employees
inner join dept_emp on employees.emp_no=dept_emp.emp_no
inner join departments on dept_emp.dept_no=departments.dept_no;


--5. List first name, last name, and sex for employees whose first name is "Hercules" 
--and last names begin with "B."

Select first_name, last_name, sex from employees where first_name = 'Hercules' and last_name like 'B%';



--6. List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.
Select
	employees.last_name,
	employees.first_name,
	departments.dept_name
From employees
inner join dept_emp on employees.emp_no=dept_emp.emp_no
inner join departments on dept_emp.dept_no=departments.dept_no
where dept_name = 'Sales'
;

--7. List all employees in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.
Select
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
From employees
inner join dept_emp on employees.emp_no=dept_emp.emp_no
inner join departments on dept_emp.dept_no=departments.dept_no
where dept_name = 'Sales' or dept_name = 'Development';

--8. In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
Select "last_name", count("last_name" )
from "employees"
Group By "last_name"
Order By count("last_name") DESC;

