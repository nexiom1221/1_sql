-- HR 계정 활성화
ALTER SESSION
 SET "_ORACLE_SCRIPT"=true
;
@C:\app\Administrator\product\18.0.0\dbhomeXE\demo\schema\human_resources\hr_main.sql;


-- 1번 입력 : HR
-- 2번 입력 : HR
-- 3번 입력 : HR
-- 4번 입력 : $ORACLE_HOME/demo/schema/log/


--HR 로 작업

-- 1. DISTINCT

-- 1) employees 에 있는 job_id 를 출력 (중복 제거)
SELECT DISTINCT e.job_id
  FROM employees e
;
-- 2) employees 에 있는 MANAGER_ID 를 출력(중복제거)
SELECT DISTINCT e.manager_id
  FROM employees e
;
-- 3) employees 에 있는 job_id,DEPARTMENT_ID 를 출력(중복제거)
SELECT DISTINCT e.job_id
               ,e.department_id
  FROM employees e
;

-- 2. ORDER BY

-- 1) employees 에 있는 PHONE_NUMBER 를 내림차순으로 정렬
SELECT e.phone_number
  FROM employees e
ORDER BY e.phone_number DESC
;
-- 2) employees 에 있는 HIRE_DATE(입사일)을 빠른순서로 정렬
SELECT e.hire_date
  FROM employees e
ORDER BY e.hire_date
;
-- 3) employees 에 있는 FIRST_NAME , PHONE_NUMBER 을 내림차순으로 정렬
SELECT e.first_name
      ,e.phone_number
  FROM employees e
ORDER BY e.first_name, e.phone_number DESC
;

-- 3. ALIAS

-- 1) employees 에 있는 EMPLOYEE_ID 속성을 "" 를 붙여 alias 를 설정하시오.
SELECT e.employee_id "아이디"
  FROM employees e
;
-- 2) employees 에 있는 JOB_ID 속성을 작업아이디!! 로 설정하시오.
SELECT e.employee_id "작업아이디!!"
  FROM employees e
;
-- 3) employees 에 있는 FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER 을 각각 마음대로 alias를 설정하고 오름차순으로 정렬.
SELECT e.first_name "성"
      ,e.last_name "이름"
      ,e.email "이메일"
      ,e.phone_number "전화번호"
  FROM employees e
 ORDER BY e.first_name
         ,e.last_name
         ,e.email
         ,e.phone_number
;

-- 4,5 .  WHERE + 연산자

-- 1) JOBS 테이블에서 JOB_TITLE 에 President 를 조회
SELECT j.job_title
  FROM jobs j
 WHERE job_title = 'President'
;
-- 2) employees 테이블에서 JOB_ID 에 ST_CLERK와 FI_ACCOUNT 를 조회
SELECT e.job_id
  FROM employees e
 WHERE job_id = 'ST_CLERK' OR job_id = 'FI_ACCOUNT'
;
-- 3) employees 테이블에서 JOB_ID 가 ST_CLERK 이고 SALARY 가 5000 이하인 사람의 EMPLOYEE_ID, FIRST_NAME, LAST_NAME,SALARY 를 구하시오.
SELECT e.employee_id
      ,e.first_name
      ,e.last_name
      ,e.salary
  FROM employees e
 WHERE e.job_id = 'ST_CLERK' AND e.salary < 5000
;

-- 4) employees 테이블에서 employee_id, first_name, last_name, salary의 원천징수액(3.3%)를  조회하시오.
SELECT e.employee_id
      ,e.first_name
      ,e.last_name
      ,e.salary * 0.033 "원천징수액"
  FROM employees e
;

-- 5) DEPARTMENTS 테이블에서 LOCATION_ID 가 1700 인것을 조회하고 NULL이 아닌것만 조회하시오.
SELECT d.location_id
  FROM departments d
 WHERE d.location_id = 1700 AND d.location_id is NOT NULL
;

-- 6) DEPARTMENTS 테이블에서 DEPARTMENT_NAME 이 C 로 시작하는 것들을 조회하시오.
SELECT d.department_name
  FROM departments d
 WHERE d.department_name LIKE 'C%'
;

-- 6. 단일행 함수

-- 1) DEPARTMENTS 테이블에서 DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID 를 조회하고 manager_id 값이 null 이면 0으로 대체하여 출력하시오.
SELECT d.department_id
      ,d.department_name
      ,NVL(d.manager_id,0)
      ,d.location_id
  FROM departments d
;

-- 2) employees 테이블에서 job_id 에 따라 salary를 추가지급 한다고 한다(밑에 언급된 job_id만). 지급 비율이 다음과 같을때 각 직원의 EMPLOYEE_ID, FIRST_NAME, LAST_NAME,추가지급비를 구하시오.
--    (DECODE 사용)
/*
AD_PRES
AD_VP
IT_PROG
FI_MGR
FI_ACCOUNT
PU_MAN
PU_CLERK
ST_MAN
------------------------ 까지 3.5%
*/

SELECT e.EMPLOYEE_ID
      ,e.FIRST_NAME
      ,e.LAST_NAME
      ,e.salary
      ,DECODE(e.job_id,'AD_PRES',e.salary * 0.035
                      ,'AD_VP',e.salary*0.035
                      ,'IT_PROG',e.salary*0.035
                      ,'FI_MGR',e.salary*0.035
                      ,'FI_ACCOUNT',e.salary*0.035
                      ,'PU_MAN',e.salary*0.035
                      ,'PU_CLERK',e.salary*0.035
                      ,'ST_MAN',e.salary*0.035) 지원금
  FROM employees e
;

-- 3) 위의 2)를 case로 변경하시오.
SELECT e.EMPLOYEE_ID
      ,e.FIRST_NAME
      ,e.LAST_NAME
      ,e.salary
      ,CASE e.job_id WHEN 'AD_PRES' THEN e.salary * 0.035
                     WHEN ' AD_VP' THEN e.salary*0.035
                     WHEN 'IT_PROG' THEN e.salary*0.035
                     WHEN 'FI_MGR' THEN e.salary*0.035
                     WHEN 'FI_ACCOUNT' THEN e.salary*0.035
                     WHEN 'PU_MAN' THEN e.salary*0.035
                     WHEN 'PU_CLERK' THEN e.salary*0.035
                     WHEN 'ST_MAN' THEN e.salary*0.035 
                     END AS 지원금
  FROM employees e
;

-- 7. 복수행 함수

-- 1) employees 테이블의 전체 행의 개수 조회
SELECT COUNT(*)
 FROM employees e
;

-- 2) employees 테이블에서 SALARY 의 총합,평균,최대,최소를 계산하여 뒤에 $99,999 추가하여 조회
SELECT TO_CHAR(COUNT(salary),'$99,999') 총합
      ,TO_CHAR(AVG(salary),'$99,999') 평균
      ,TO_CHAR(MAX(salary),'$99,999.') 최대
      ,TO_CHAR(MIN(salary),'$99,999') 최소
  FROM employees e
;

-- 3) employees 테이블에서 salary 의 4000 이상의 employee_id 를 구하시오.
SELECT e.employee_id
  FROM employees e
 WHERE e.salary > 4000
GROUP BY e.employee_id
;

-- 8. 조인