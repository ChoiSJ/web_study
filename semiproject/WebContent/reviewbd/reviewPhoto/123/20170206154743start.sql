-- 소속된 사원이 1명 이상인 부서찾기
-- 1
select DEPARTMENT_id, count(*)
from employees
group by department_id
having count(*) > 0;
-- 2 exists
select DEPARTMENT_id, DEPARTMENT_name
from departments A
where exists (select 1
				from employees B
				where B.department_id = A.department_id);

--
select DEPARTMENT_id, DEPARTMENT_name
from DEPARTMENTS
where DEPARTMENT_ID = 10
and EXISTS (select 1
			from employees A
			where A.department_id = 10);
-- 부서별 평균을 조회하기
select department_id, avg(salary)
from employees
group by department_id;

-- 모든 사원들의 급여를 그 부서의 평균급여로 설정하기
-- update employees A
-- set salary = (select avg(salary)
--				 from employees B
--				 where B.department_id = A.department_id);
-- 100번 사원의 급여를 전체 사원의 평균급여보다 10000달러 많게 변경하기
-- update employees
-- set salary = (select avg(salary) + 10000
--				from employees)
-- where employee_id = 100;

-- Curtis Davies 사원과 같은 급여를 받는 사원 조회하기
select employee_id, first_name, salary, department_id
from employees
where salary = (select salary
				from employees
				where first_name = 'Curtis' and last_name = 'Davies')
and department_id = (select department_id
						from employees
						where first_name = 'Curtis' and last_name = 'Davies');
						
select employee_id, first_name, salary, department_id
from employees
where (department_id, salary)= (select department_id, salary
								from employees
								where first_name = 'Curtis' and last_name = 'Davies');
								
select lpad(employee_id, level*3, '-'),employee_id, first_name, manager_id
from employees
start with employee_id = 100
connect by prior employee_id = manager_id;
-- 부모키 employee_id
-- 자식키 manager_id
-- 부모행의 employee_id값이 자식행의 manager_id 값과 같은 계층 관계를 검색한다.

-- ismael 의 상사를 조회
select employee_id, first_name, manager_id
from employees
start with employee_id = (select employee_id
							from employees
							where first_name = 'Ismael')
connect by prior manager_id = employee_id;

-- 101번 사원의 자식행 조회하기
select lpad(employee_id, level*5, '-'),employee_id, first_name, manager_id
from employees
start with employee_id = 101
connect by prior employee_id = manager_id
and employee_id != 108;

-- Steven King의 부하직원 검색하기
select employee_id, first_name, manager_id
from employees
start with employee_id = 100
connect by prior employee_id = manager_id;