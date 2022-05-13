
/*****************************
* 그룹함수 
******************************/
select  first_name,
        sum(salary)
from employees;

-- 그룹함수 -sum()
select  count(*),
        count(first_name),
        sum(salary) --sum 은 숫자만 가능 
from employees;

--그룹함수 - count()
select  count(*),
        count(commission_pct), --commission_pct 칼럼의 null 카운트에서 제외 
        count(manager_id)
from employees;

select *  
from employees
where salary > 16000;

-- 그룹함수 -- avg() -- 평균내기 
select nvl(salary,0)
from employees;


select avg(salary), --급여가 null인사람은 계산 제외 
        avg(nvl(salary,0)), -- null인 사람까지 0으로 변경 후 포함계산 
        round(avg(salary),0),
        count(*),
        sum(salary)
from employees;

-- 그룹함수 max,min
select  max(salary),
        min(salary),
        count(*)
from employees;

--group by 절
--절
select first_name
from employees
where salary > 16000
order by salary desc;

select  department_id "부서", -- 여러개 
        count(salary) "카운트", -- 카운트 (group by 없을 시 칼럼전체평균/row 1개)
        avg(salary) "평균",-- 평균 (group by 없을 시 칼럼전체평균/row 1개)
        round(avg(salary),0) "소수점x",
        sum(salary) "합계"-- 합계 ((group by 없을 시 칼럼전체합계/row 1개)
from employees
group by department_id -- 부서 별 평균 구할 때 필요, (group by가 없으면 개별값 확인됨) 
order by department_id asc;

/*예제 연봉의 합계가 20000이상인 부서의
    부서번호와 인원수, 급여합계를 출력*/
    select department_id,
            count(*),
            sum(salary)
    from employees
    group by department_id
    --where sum(salary) >= 20000; 그룹함수에는 where절을 쓸 수 없음 
    having sum(salary) >= 20000 --having 절 
    and sum(salary) <=100000
    and department_id = 90
    --and hire_date >= '04/01/01'; having절에는 그룹함수와 group by에 참여한 컬럼만 사용가능 
    


