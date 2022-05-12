/* 
전체직원의 정보조회 

문제 1 ) 입사일 올림차순으로 출력, 이름(성과 이름), 월급, 전화번호, 입사일 순서로 나오도록 
그리고 컬럼 이름 한글로 변경할 것 
*/
SELECT  FIRST_NAME ||'-'|| LAST_NAME "이름",
        SALARY "월급",
        PHONE_NUMBER "전화번호",
        to_char(hire_date,'yy"년"mm"월"dd"일"') "입사일"
FROM EMPLOYEES
order by hire_date asc;

/* 
전체직원의 정보조회 
문제 2 ) 업무별로 업무이름과 최고월급을 월급의 내림차순으로 정렬 
*/
select  job_id,
        salary
from employees
order by salary desc;


/* 
문제 3 ) 담당매니저가 배정되어있으나 커미션비율이 없고, 월급이 3000초과인 직원의 이름 
매니저아이디, 커미션 비율, 월급 출력 
*/
select  first_name||' '||last_name,
        employee_id,
        commission_pct,
        salary
from employees
where commission_pct is null
and salary > 3000;

/* 
문제 4 ) 월급이 10000이상인 업무의 이름을 작성하고 월급을 기준으로 내림차순으로 정렬 
*/
select  job_id,
        salary      
from employees
where salary >= 10000
order by salary desc;

/* 
문제 5 ) 월급이 14000 미만, 10000이상인 직원의 이름 
월급, 커미션퍼센트를 월급순(내림차순)으로 출력, 
단, 커미션퍼센트가 null인경우 0으로 나타내기 */

select salary,
        first_name,
        nvl(commission_pct,0)
from employees
order by salary desc;

/* 
문제 6 ) 부서번호가 10,90,100인 직원의 이름, 월급,입사일 부서번호 
단, 입사일은 yyyy-mm으로 나타내기*/

select employee_id,
        first_name ||'-'||last_name,
        salary,
        to_char(hire_date, 'yyyy-mm')
from employees
where employee_id IN ('10','90','100');

/* 
문제 7 ) first_name에 S또는 s가 들어가는 직원의 이름, 월급 나타내기 */
SELECT  first_name, 
        salary
from employees
where first_name LIKE '%S%'
or first_name like '%s%';




/* 문제 8) 부서이름이 긴순서대로 전체부서 출력 */
SELECT department_name,
        length(department_name)
FROM departments
order by length(department_name) desc;


/* 문제 9)  지사가 있을것이라 여겨지는 나라의 나라이름을 대문자로 출력, 올림차순으로 정렬 출력 */
SELECT country_name,
        upper(country_name)
FROM countries
order by country_name asc;


/* 문제 10) 입사일 03/12/31 일 이전 입사한 직원의 이름, 월급, 전화번호, 입사일 출력
전화번호는 000-000-000 형식으로 */ 
SELECT  first_name,
        salary,
        hire_date,
        to_char(phone_number,'999-999-9999')
FROM employees
where hire_date < '03/12/31';
        
        
 SELECT  first_name,
        salary,
         hire_date,
         to_char(salary*12,'9999999999')
FROM employees
where hire_date < '03/12/31';






