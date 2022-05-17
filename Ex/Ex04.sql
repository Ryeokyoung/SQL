--subquery

select first_name, salary, employee_id
from employees
where salary = (select min(salary)
				from employees);

select first_name, salary
from employees
where salary > (select avg(salary)
				from employees));

--in
select first_name, salary
from employees
where salary in (select max(salary)
				 from employees
				 group by(department_id));

-- 부서번호가 110인 직원의 급여와 같은 모든직원의 사번, 이름, 급여 출력
select  employee_id, 
        first_name, 
        salary
from employees
where department_id = 10 ;

select  employee_id, 
        first_name, 
        salary
from employees
where salary in (select salary 
                 from employees
                 where department_id = 10);


-- 예제 각 부서별로 최고급여를 받는 사원은?

select  max(salary),
        em.employee_id,
        de.department_id
from departments de, employees em 
where em.department_id = de.department_id;

-- 부서별 최고급여 / 이름은 표현 불가 
select max(salary),
        department_id,
        first_name
from employees
group by department_id;

select employee_id,
        first_name,
        salary,
        department_id
from employees
where (department_id, salary) in (select department_id, max(salary)
                                    from employees
                                    group by department_id)
order by department_id desc;



select employee_id,
        first_name,
        salary,
        department_id
from employees
where (department_id, salary) in ((10, 4400),(20,13000),(90,24000))
order by department_id desc;


-- any
-- 부서번호가 110인 직원의 급여보다 큰 모든직원의 사번, 이름, 급여 출력
-- 부서번호가 110인 직원의 급여  --> 12008,8300
select salary,              
        first_name,
        department_id 
from employees
where department_id = 110;

--(2-1) or 
select salary,              
        first_name,
        department_id 
from employees
where salary > 12008
or salary > 8300;


--(2-2) any 사용 
select first_name,
        salary
from employees
where salary > any (select salary
                    from employees
                    where department_id = 110);
                    
-- all / any 비교
-- 부서번호가 110인 직원의 급여보다 큰 모든직원의 사번, 이름, 급여 출력
-- 부서번호가 110인 직원의 급여
select first_name,
        department_id,
        salary
from employees
where department_id = 110;

-- and 
select first_name,
        department_id,
        salary
from employees
where salary > 8300
and salary > 12008;

-- all 
select first_name,
        department_id,
        salary
from employees
where salary > all(select salary
                    from employees
                    where department_id = 110);
                    
                    
select * 
from employees 
where (department_id, salary) in ( select department_id, 
                                          max(salary) 
                                   from employees
                                   group by department_id);
                                   
                                   


