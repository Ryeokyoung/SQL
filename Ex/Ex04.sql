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
                                   
--각 부서별로 최고급여를 받는 사원이름을 출력하세요
--where절로 구하기
select  department_id,
        max(salary)
from employees
group by department_id;


select  first_name,
        salary,
        department_id,
        email
from employees
where (department_id, salary) in ( select  department_id,
                                           max(salary)
                                   from employees
                                   group by department_id  );

--각 부서별로 최고급여를 받는 사원이름을 출력하세요
--테이블로 구하기

select  e.first_name,
        e.salary,
        e.department_id,
        s.department_id,
        s.maxSalary
from employees e, (select department_id, 
                          max(salary) maxSalary
                   from employees
                   group by department_id) s  
where e.department_id = s.department_id
and e.salary = s.maxSalary;

-------------------------------------------------
--rownum

--급여를 가장 많이 받는 5명의 직원의 이름을 출력하시오.
--정렬을 하면 rownum이 섞인다 -->정렬을 하고 rownum 을 준다
select  rownum,
        employee_id,
        first_name,
        salary
from employees   -- 미리 정렬되어 있는 테이블이면 rownum이 섞이지 않는다
order by salary desc;

-->정렬(정렬된 테이블 사용)하고 rownum을 준다
select  rownum,
        ot.employee_id,
        ot.first_name,
        ot.salary
from (select  employee_id,
              first_name,
              salary
      from employees
      order by salary desc) ot ;


--rownum을 이용해서 원하는 순위의 값을 선택한다(where절)
--where절이 2번 부터이면 데이터가 없다 (rownum이 항상 1이다)
select  rownum ,
        ot.employee_id,
        ot.first_name,
        ot.salary
from (select  employee_id,
              first_name,
              salary
      from employees
      order by salary desc) ot  --정렬도 되어 있고  rownum로 있는 테이블이면?
where rownum >= 2
and rownum <= 5;

-->(1)정렬하고 (2)rownum이 있는 테이블을 사용하고 (3)where절을 쓴다
select  ort.rn,
        ort.first_name,
        ort.salary
from (select  rownum rn,
              ot.employee_id,
              ot.first_name,
              ot.salary
      from (select  employee_id,
                    first_name,
                    salary
            from employees
            order by salary desc) ot   --(1)
      )ort  --(2)
where rn >= 2
and rn<=5;  --(3)



SELECT ROWNUM,
        first_name,
        salary
FROM (select first_name, 
                        salary
                from employees
                order by salary desc)
where rownum >= 1 
and rownum <= 5;


--> 데이터가 없음 / 첫자리가 1이 아니면 못 구함 
--> 이유 : 1에 데이터가 없는 경우 1이후 데이터들이 1의 자리에 들어감
--> 따라서 계속 1의 데이터로 채워지고 조건은 1의 데이터가 아닌 
--> 2부터의 데이터를 원하기 때문에 값이 없음 
SELECT ROWNUM,
        first_name,
        salary
FROM (select first_name, 
                        salary
                from employees
                order by salary desc)
where rownum >= 2 
and rownum <= 3


