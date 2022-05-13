/**************************
join
****************************/

select  employee_id,
        first_name||' '||last_name,
        salary,
        department_name,
        em.department_id "e_did",
        de.department_id "d_did"
from employees em, departments de
where em.department_id = de.department_id;

--모든 직원이름, 부서이름, 업무명 출력 
select  first_name,
        em.department_id, -- de/em check
        de.department_id,
        department_name,
        em.job_id, -- jo/em check
        jo.job_id,
        job_title
        salary
from    employees em, 
        jobs jo, 
        departments de -- from까지 진행시 '카디젼 프로덕트'
where   em.job_id = jo.job_id
and     de.department_id = em.department_id --총 106개 
and     em.salary >= 7000      -- 46개   
order by em.salary desc;






select count(*)
from employees, departments, jobs; --54891 , 107*27*19(54891 - 중복값 포함) 

select count(*)
from employees; --107 

select count(*)
from departments; --27 

select count(*)
from jobs; -- 19 