/* 문제 1 
매니저가 있는 직원은 몇명 ? */
SELECT count (manager_id)
from departments de,job_history jh
where manager_id > 0
and jh.department_id = de.department_id;


/* 문제 2
직원 중 최고임금과 최저임금을 
"최고임금,최저임금"프로젝션 타이틀로 함께 출력!  두 임금의 차이는 얼마? 
'최고임금 - 최저임금 타이틀로 출력 ' */
select max(salary) "최고임금",
        min(salary) "최저임금",
        max(salary)-min(salary)
from employees;

/* 문제 3
마지막으로 신입사원이 들어온 날은 언제? 
형식 0000년 0월 0일 */
SELECT to_char(max(hire_date),'yyyy"년"mm"월"dd"일"')
FROM employees
order by hire_date desc;


/* 문제 4 
부서별로 평균임금, 최고임금, 최저임금을 부서아이디와 함께 출력 
정렬은 부서번호 기준 내림차순(desc) */
SELECT  department_id "부서ID",
        AVG(salary)"평균",
        max(salary)"최고",
        min(salary)"최저"        
FROM employees
group by department_id
order by department_id desc;

/* 문제 5
업무별로 평균임금, 최고임금, 최저임금, 업무아이디와함께 출력 
정렬순서는 최저임금 내림차순, 평균임금(소수점반올림) 오름차순 */
SELECT  round(AVG(salary),0)"평균임금",
        MIN(SALARY)"최저임금",
        MAX(SALARY),
        job_id
FROM employees
group by job_id
order by max(salary) desc, AVG(salary) asc;

/* 문제 6 
가장 오래 근속한 직원의 입사일은 언제? 0000-00-00 0요일로 출력  */
SELECT to_char(min(hire_date),'yyyy"-"mm"-"dd day')
FROM employees
order by hire_date asc;



/* 문제 7
평균임금과 최저임금의 차이가 2000미만인 부서, 평균임금, 최저임금, 그리고(평균-최저임금)을 출력하고 
(평균-최저임금)기준으로 내림차순 출력  */
SELECT  de.department_id,
        em.min(salary) "최저",
        em.avg(salary) "평균",
        em.round(avg(salary)-min(salary),0) "격차"
FROM employees em,department de
where avg(salary)-min(salary) < 2000
and de.department_id = em.department_id
group by department_id
order by avg(salary)-min(salary) desc;


/* 문제 8
업무별로 최고임금과 최저임금의 차이를 출력 , 내림차순 정렬   */
SELECT  max(max_salary),
        min(min_salary),
        job_id,
        max(max_salary)-min(min_salary)
FROM jobs
group by job_id
order by max(max_salary)-min(min_salary) desc;



/* 문제 9
2005년 이후 입사자 중 관리자별로 평균급여, 최소급여 최대급여 알아보기 
출력 : 평균급여가 5000이상 직원을 대상으로 출력하며 평균급여의 기준으로 내림차순, 
소수점첫째자리에서 round반영  */
SELECT  em.employee_id,
        em.AVG(salary),
        jo.max_salary,
        jo.min_salary,
        em.hire_date
FROM jobs jo,employees em
where  em.avg(salary) => '5000'
and hire_date > '2005/01/01'
group by employee_id
order by AVG(salary) desc;

/* 문제 10
직원을 입사일 기준으로 나누기 
1. 입사일 02/12/31 이전 '창립멤버'
2. 입사년 03 '03년입사'
3. 입사년 04 '04년입사'
4. 이후는 '상장이후 입사' 로 "optDate"로 칼럼명을 변경하여 출력 
정렬은 입사일기준 오름차순으로 할 것 */
SELECT employee_id,
        hire_date 
        case when hire_date < '02/12/31' then '창립멤버' 
             when hire_date >= '02/12/31' and hire_date < '04/1/1' then '03년입사'
             when hire_date >= '04/1/1' and hire_date < '05/1/1' then '04년입사' 
        else '상장이후입사' 
    end optDate
FROM employees
order by hire_date asc;
