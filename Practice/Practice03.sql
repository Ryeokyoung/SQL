/*************** JOIN ********************/

/* 문제 1 - 106건 - pass 
  사번, 이름(성포함), 부서명을 조회, 부서이름을 기준으로 오름차순, 사번기준으로 내림차순 정렬*/
  SELECT employee_id,
         first_name||' '||last_name,
         department_name,
         de.department_id
  FROM employees em, departments de
  where em.department_id = de.department_id
  order by department_name asc, employee_id desc;
  

/* 문제 2-1 -106건 
  사번, 이름, 급여, 부서명, 현재업무(title), 을 사번을 기준으로 오름차순 정렬 
  부서가 없는 kimberely는 (사번178)은 표시하지 않기 */
  SELECT employee_id,
        first_name,
        salary,
        job_title,
        department_name,
        nvl(department_name,0)
  FROM jobs jo, employees em, departments de
  where em.department_id = de.department_id
  and jo.job_id = em.job_id
  order by employee_id asc;
  
/* 문제 2-2 -107건 
  사번, 이름, 급여, 부서명, 현재업무(title), 을 사번을 기준으로 오름차순 정렬 
  부서가 없는 kimberely는 (사번178)포함 */
 SELECT employee_id,
        first_name,
        salary,
        job_title,
        department_name,
        nvl(department_name,0)
  FROM jobs jo, employees em, departments de
  where em.department_id = de.department_id
  and jo.job_id = em.job_id
  order by employee_id asc;



/* 문제 3-1 - 27건
  도시아이디, 도시명, 부서명, 부서아이디를 도시아이디 기준 오름차순 정렬
  부서가 없는 도시는 표시하지 않음 */
  SELECT employee_id,
        first_name,
        salary,
        job_title,
        department_name,
        nvl(department_name,0)
  FROM jobs jo, employees em, departments de
  where em.department_id = de.department_id
  and jo.job_id = em.job_id
  order by employee_id asc;
  
  
  
/* 문제 3-2 - 43건 
  도시아이디, 도시명, 부서명, 부서아이디를 도시아이디 기준 오름차순 정렬
  부서가 없는 도시 표시 */
  SELECT employee_id,
        first_name,
        salary,
        job_title,
        department_name,
        nvl(department_name,0)
  FROM jobs jo, employees em, departments de
  where em.department_id = de.department_id
  and jo.job_id = em.job_id
  order by employee_id asc;
  
  
  
  
  
  
  
  /* 문제 4 
 지역이름, 나라이름으로 출력, 지역이름기준 오름차순, 나라이름기준 내림차순 정렬*/
 SELECT re.region_name,
        co.country_name
 FROM regions re, countries co
 order by re.region_name asc, co.country_name desc;
  
  
  
  /* 문제 5 -37건(out)
  자신의 매니저보다 채용이 빠른 사원의 사번, 이름, 채용일, 매니저이름, 매니저입사일 조회 */






 /* 문제 6 -27건
  나라명, 나라아이디, 도시명, 도시아이디, 부서명, 부서아이디를 나라명기준 오름차순 
  값이 없는 경우 표시 안함 */
  SELECT co.country_name,
         co.country_id,
         lo.location_id,
         lo.city,
         de.department_name,
         de.department_id
  FROM country co, locations lo, department de
  order by co.country_name asc;
  
  
  
  
   /* 문제 7 -2건
  업무아이디가 'ac-account'로 근무한 사원의 사번, 이름(풀네임) 업무아이디, 시작일, 종료일 출력  */
  SELECT 
    * FROM
  
  
  
  
   /* 문제 8 -11건
  각부서의 부서번호, 부서이름, 매니저이름, 도시치, 나라이름, 지역이름까지 전부출력  */
SELECT
    * FROM




 /* 문제 9 -106건 (out) 
  사번,이름, 부서명, 매니저이름 조회, 부서가 없는 직원도 표시할 것  */