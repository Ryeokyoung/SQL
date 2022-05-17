-- subquery 
-- 1 평균급여보다 적은 급여를 받는 직원은 몇명 
	select avg(salary)
	from employees;
	
	select count(salary)
	from employees
	where salary > 6461.8;

-- 2 평균 급여 이상 최대급여 이하의 월급을 받는 사원의 
-- 직원번호, 이름, 급여, 평균급여, 최대급여를 급여의 오름차순으로 정렬 출력 
	select employee_id,
	        first_name||' '||last_name,
	        salary
	from employees 
	where salary > 6461.8
	or salary < 24000
	order by salary asc;    

-- 3 직원중 Steven king 이 소속된 부서가 있는 주소 확인 
-- > 도시아이디, 거리명, 우편번호, 도시명, 주소, 나라아이디 출력 
	select first_name||' '||last_name,
	        department_id
	from employees 
	order by first_name desc;	

	select  department_id,
	        lo.location_id,
	        street_address,
	        postal_code,
	        city,
	        state_province,
	        country_id
	from locations lo, departments de 
	where de.location_id = lo.location_id
	and department_id = 90;
	
	
-- 4 job id가 st_man인 직원의 급여보다 작은 직원의
-- 사번, 이름, 급여를 급여의 내림차순으로 출력 
	 select job_id,
	 employee_id,
	 first_name,
	 salary
	 from employees
	 where salary > ANY (select salary 
	                     from employees
	                     where job_id = 'ST_MAN')
	 order by salary desc;
			
    
    
    
    
-- 5  각 부서별로 최고의 급여를 받는 사원의 직원번호, 이름과 급여, 부서번호를 조회 
-- 급여의 내림차순으로 정렬 
-- 조건절 비교, 테이블 조인 2가지 방법으로 작성 

-- 조건절에서 비교 in 
	select  em.department_id, 
	        em.employee_id,
	        em.first_name,
	        em.salary
	from employees em
	where (department_id, salary) in(select department_id, max(salary)
	                                from employees
	                                group by department_id);
                                
                                
-- 테이블에서 조인 
	select  em.department_id, 
	        em.employee_id,
	        em.first_name,
	        em.salary
	from employees em, (select department_id,
                        max(salary)salary  --salary 그룹 내 maxsalary 
	                    from employees     --salary.max(salary)와 같음 
	                    group by department_id) de
	where em.department_id = de.department_id
    and em.salary = de.salary
	order by salary desc;       
          
	                                

-- 6 각 업무(job)별로 연봉의 총합 구하기 
-- 연봉총합이 가장 높은 업무순(title)으로 조회 
	select  jo.job_title,
	        count(*),
	        sum(salary)
	from jobs jo, employees em 
	where jo.job_id = em.job_id
	group by jo.job_title
	order by sum(em.salary) desc;




-- 7 자신의 부서 평균 급여보다 연봉이 많은 직원의 직원번호, 이름과 급여 조회 
	select em.employee_id,
	        em.salary,
	        first_name
	from employees em,(select department_id, avg(salary) salary
	                from employees
	                group by department_id) s
	where em.department_id = s.department_id 
	and em.salary > s.salary


-- 8 직원 입사일이 11번째에서 15번째의 직원의 사번, 이름, 급여, 입사일을 입사일 순서로 출력 

	select rn,
        hire_date,
        employee_id,
        first_name,
        salary
from (select rownum rn, hire_date,
                        salary,
                        first_name,
                        employee_id
                   from (select hire_date,
                        salary,
                        first_name,
                        employee_id
                        from employees
                order by hire_date desc))
where rn >=11
and rn <16 ;
    