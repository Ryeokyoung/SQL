/*****************
select 문 '뭘 내놔라'라는 의미 
    select 절 
    from 절  
******************/

--모든 컬럼 조회하기  *'모든'이라는 의미 
select *
from employees;

select * 
from departments;

-- 원하는 칼럼만 조회하기 
select employee_id, first_name, last_name 
from employees;

-- 예제) 
-- 사원의 이름(성)과 전화번호 입사일 연봉을 출력하세요 
select first_name, phone_number, salary
from employees;

--사원의 이름과 성,급여, 전화번호, 이메일, 입사일 출력 
select  FIRST_name, 
        salary, 
        phone_number, 
        email, 
        hire_date
from employees;

--출력할 때 컬럼명 별명 사용하기 
-- 사원의 이름과 전화번호 입사일 급여로 표시되도록 출력 
SELECT  first_name "이름", 
        phone_number "전화번호", 
        hire_date "입사일",
        salary "급여"
FROM empolyees;

-- 사원의 사원번호 이름 성 급여 전화번호 이메일 입사일로 표시 
select  first_name, 
        last_name,
        salary, 
        phone_number,
        email, 
        hire_date
from employees;

--연결연산자 (컬럼을 붙이기)
from employees;



select first name ||  ''  || last_name 
from employees;

select job_id
from employees;


select job_id*12
from employees;



select first_name || '-' ||last_name, 
salary,
salary*12,
salary*12+5000,
phone_number
from employees;

select *
from employees
where department_id = 10;

--연봉이 15000인 사원들의 이름과 월급
select salary, last_name
from employees
where salary >= 15000;

-- 07/01/01일 이후에 입사한 사원들의 이름과 입사일 
select *
from employees
where hire_date >= '07/01/01';

-- 이름이 Lex인 직원의 연봉 출력 
select salary,first_name 
from employees
where first_name = 'Lex';

-- 조건 2개이상일 때 한꺼번에 조회 
-- 연봉 14000이상 17000이하 이름과 연봉 

select first_name,salary
from employees
where salary >= 14000
and salary <=17000;


--between 사용 (느린연산자) 
select  first_name,
        salary
from employees
where salary between 14000 and 17000;


-- 연봉 14000이하이거나 17000이상인 사원의 이름 
select first_name, salary
from employees
where salary <= 14000
or salary >=17000;


-- 입사일 04/01/01~05/12/31 사이 사원 이름과 입사일 
select first_name, hire_date
from employees
where hire_date >= '04/01/01'
and hire_date <= '05/12/31';


--in연산자 이용 
select  first_name, 
        last_name, 
        salary
from employees
where first_name in ('Lex','Neena','John');
-- where first_name = 'Neena'; / 한명일때 출력 

-- 연봉이 2100, 3100, 4100, 5100 인 사원의 이름과 연봉을 구하시오
select first_name, salary 
from employees
where salary = 2100
or salary = 3100
or salary = 4100
or salary = 5100;

--Like 연산자(~가 포함된)로 비슷한 것들 모두 찾기 
select first_name, last_name, salary
from employees
where first_name like 'L%';
-- L이라는 글자가 포함된 ! '%'맨 앞이 L이여야 하고 뒤에 뭐가 오든 상관없음 

select first_name, last_name, salary
from employees
where first_name like 'L____';

select first_name, last_name, salary
from employees
where first_name like '%S%';
--'S'가 포함된 모든 사람 

--이름에 AM을 포함한 사원의 이름과 연봉 
SELECT  FIRST_NAME, 
        SALARY 
FROM employees
where first_name like '%am%';


-- 이름의 두번째 글짜가 a인 사원의 이름과 연봉 
SELECT  FIRST_NAME, 
        SALARY 
FROM employees
where first_name like '_a%';

--이름의 네번째 글짜인 사원 중 끝에서 두번째글짜가 a인사람 
select first_name
from employees
where first_name like '__a_';

select * from employees;

select  first_name,
        salary, 
        commission_pct,
        salary*commission_pct
from employees
where salary between 13000 and 15000;

select first_name,
salary,
commission_pct,
salary*commission_pct
from employees
where commission_pct is null;
--where commission_pct is not null;

-- 커미션비율이 있는 사원의 이름과 연봉 커미션 비율을 출력 
select  first_name,
        salary*commission_pct
from employees
where commission_pct is not null;

-- 담당매니저가 없고 커미션비율이 없는 직원의 이름 
select  first_name,
        commission_pct
from employees
where manager_id is null
and commission_pct is null;

-- order by절을 사용해 보기 좋게 정렬
select  first_name, 
        salary
from employees
order by salary desc;
--desc 내림차순 asc 오름차순 

select  first_name, 
        salary
from employees
where salary >=9000
order by salary asc;

select * 
from employees 
order by first_name asc;

-- 급여가 10000이상인 직원의 이름, 급여를 알아보고 급여가 많은 직원 순 나열 
select  first_name, 
        salary
from employees
where salary >= 10000
order by salary desc;


-- 부서번호를 오름차순으로 정렬 , 부서번호가 같으면 급여가 높은사람부터 급여이름 출력 
select *
from employees
order by first_name asc, department_id asc, salary desc;

/*
단일행함수
*/
--문자함수 INITCAP(컬럼명)
-- 부서번호 100인 직원의 이메일과 부서번호 출력 
select  email, 
        INITCAP(email) "email-2",
        department_id
from employees
where department_id = 100;

-- 문자함수 - LOWER(컬럼명-소문자) / UPPER(컬럼명-대문자)
SELECT  first_name, 
        upper(first_name) upper,
        lower(first_name) lower,
        department_id
from employees
where department_id = 100;

--문자함수 - SUBSTR (컬럼명, 시작위치, 글자수)
SELECT  FIRST_NAME,
        substr (first_name,-4,2),
        substr (first_name,-7,3)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 100;

--문자함수 - LPAD(컬럼명, 자리수, '채울문자') / RPAD(컬럼명, 자리수, '채울문자')
SELECT  FIRST_NAME,
        LPAD(FIRST_NAME, 10, '*'),
        RPAD(FIRST_NAME, 10, '*'),
       -- RPAD(LPAD(FIRST_NAME, 10, '*'),15,'*')
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 100;

--문자함수 - REPLACE (컬럼명, 문자1, 문자2)
SELECT  FIRST_NAME,
        REPLACE(FIRST_NAME,'A','*'),--대소문자를 가림 각각 따로따로 써줘야함 -
        REPLACE(FIRST_NAME,'a','*'),  
        substr (first_name,2,3),
        replace(first_name, (substr (first_name,2,3)),'***')
FROM EMPLOYEES
WHERE DEPARTMENT_ID=100;

select replace('abcdefg', 'bc', '*****')
from employees;

select replace('abcdefg', 'bc', '*****')
from dual;

select substr('900214-1234234',8,1) 
from dual;

select  round(123.346, 2) r2,
        round(123.346, 1) r1, 
        round(123.346, 0) r0,
        round(123.346,-1) rr1,
from dual;

--숫자함수 - TRUNC(숫자, 출력을 원하는 자리수)
select  trunc(123.346,2)r2,
        trunc(123.456,0)r0,
        trunc(123.346,-1) "r-2"
from dual;

--날짜함수 -SYSDATE()
SELECT SYSDATE
FROM DUAL; --오늘 날짜 


SELECT * 
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 110;

SELECT  MONTHS_BETWEEN(SYSDATE, HIRE_DATE),
        DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 110;

--TO CHAR(숫자, '출력모양') 숫자형> 문자형으로 변환
select first_name, 
        to_char(salary*12, '$0999999')
from employees
where department_id = 110;

select to_char(9876, '99999'),
        to_char(9876,'099999'),
        to_char(9876,'$99999'),
        to_char(9876,'9999.99'),
        to_char(9486433113876,'$999999999999999999999999'),
        to_char(95133531351313876,'999999999999999999999999999.99')
from dual;


--변환함수>TO_CHAR(날짜, '출력모양') 날짜>문자형으로 변환하기
select sysdate,
        to_char(sysdate,'YYYY:MM:DD'),
        to_char(sysdate,'YYYY"년"MM"월"DD"일"'),
        to_char(sysdate,'YYYY-MM-DD'),
        to_char(sysdate,'YYYY/MM/DD'),
        to_char(sysdate,'YYYY.MM.DD'),
        to_char(sysdate,'yyyy'),
        to_char(sysdate,'yy'),
        to_char(sysdate,'MM'),
        to_char(sysdate,'MONTH'),
        to_char(sysdate,'DD'),
        to_char(sysdate,'DAY'),
        to_char(sysdate,'HH'),
        to_char(sysdate,'HH24'),
        to_char(sysdate,'MI'),
        to_char(sysdate,'SS')
from dual;



