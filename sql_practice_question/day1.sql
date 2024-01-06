-- Q.1 Retrieve the top 5 highest-paid employees with their first name, last name, and salary.
select
    first_name,
    last_name,
    salary
from
    (
        select
            first_name,
            last_name,
            salary,
            row_number() over (
                order by
                    salary desc
            ) as salary_rank
        from
            employees
    ) ranked_salary
where
    salary_rank <= 5



-- Q2.Find the department with the highest average salary.

select department, avg_salary from (select department,
avg(salary) over(partition by department) as avg_salary,
rank() over (order by salary desc) salary_rank
from employees) department_rank
where salary_rank = 1


-- Q3.Retrieve the employees who have the same salary as the employee with the highest salary.

select first_name, last_name, salary from employees where salary = (select max(salary) from employees)

-- Q4. Calculate the salary range for each department (the difference between the highest and lowest salary).

select department,
max(salary) - min(salary) as salary_range
from employees
group by 1


-- Retrieve the employee(s) with the second-highest salary.

SELECT first_name, salary
FROM (
    SELECT 
        first_name, 
        salary,
        DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
    FROM employees
) ranked_salary
WHERE rnk = 2;


-- Find the department(s) where the average salary is above 60000.

select department , avg(salary) as dept_avg_salary
from employees
group by department
having dept_avg_salary > 60000

-- Retrieve the employees who have a salary greater than the average salary for their department.



-- Calculate the total salary for each department and display the results in descending order.

-- Identify the employees with a salary within 10% of the highest salary in the company.

-- Retrieve the employees with the highest salary in each department.