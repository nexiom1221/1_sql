-- HR ���� Ȱ��ȭ
ALTER SESSION
 SET "_ORACLE_SCRIPT"=true
;
@C:\app\Administrator\product\18.0.0\dbhomeXE\demo\schema\human_resources\hr_main.sql;


-- 1�� �Է� : HR
-- 2�� �Է� : HR
-- 3�� �Է� : HR
-- 4�� �Է� : $ORACLE_HOME/demo/schema/log/


--HR �� �۾�

-- 1. DISTINCT

-- 1) employees �� �ִ� job_id �� ��� (�ߺ� ����)
SELECT DISTINCT e.job_id
  FROM employees e
;
-- 2) employees �� �ִ� MANAGER_ID �� ���(�ߺ�����)
SELECT DISTINCT e.manager_id
  FROM employees e
;
-- 3) employees �� �ִ� job_id,DEPARTMENT_ID �� ���(�ߺ�����)
SELECT DISTINCT e.job_id
               ,e.department_id
  FROM employees e
;

-- 2. ORDER BY

-- 1) employees �� �ִ� PHONE_NUMBER �� ������������ ����
SELECT e.phone_number
  FROM employees e
ORDER BY e.phone_number DESC
;
-- 2) employees �� �ִ� HIRE_DATE(�Ի���)�� ���������� ����
SELECT e.hire_date
  FROM employees e
ORDER BY e.hire_date
;
-- 3) employees �� �ִ� FIRST_NAME , PHONE_NUMBER �� ������������ ����
SELECT e.first_name
      ,e.phone_number
  FROM employees e
ORDER BY e.first_name, e.phone_number DESC
;

-- 3. ALIAS

-- 1) employees �� �ִ� EMPLOYEE_ID �Ӽ��� "" �� �ٿ� alias �� �����Ͻÿ�.
SELECT e.employee_id "���̵�"
  FROM employees e
;
-- 2) employees �� �ִ� JOB_ID �Ӽ��� �۾����̵�!! �� �����Ͻÿ�.
SELECT e.employee_id "�۾����̵�!!"
  FROM employees e
;
-- 3) employees �� �ִ� FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER �� ���� ������� alias�� �����ϰ� ������������ ����.
SELECT e.first_name "��"
      ,e.last_name "�̸�"
      ,e.email "�̸���"
      ,e.phone_number "��ȭ��ȣ"
  FROM employees e
 ORDER BY e.first_name
         ,e.last_name
         ,e.email
         ,e.phone_number
;

-- 4,5 .  WHERE + ������

-- 1) JOBS ���̺��� JOB_TITLE �� President �� ��ȸ
SELECT j.job_title
  FROM jobs j
 WHERE job_title = 'President'
;
-- 2) employees ���̺��� JOB_ID �� ST_CLERK�� FI_ACCOUNT �� ��ȸ
SELECT e.job_id
  FROM employees e
 WHERE job_id = 'ST_CLERK' OR job_id = 'FI_ACCOUNT'
;
-- 3) employees ���̺��� JOB_ID �� ST_CLERK �̰� SALARY �� 5000 ������ ����� EMPLOYEE_ID, FIRST_NAME, LAST_NAME,SALARY �� ���Ͻÿ�.
SELECT e.employee_id
      ,e.first_name
      ,e.last_name
      ,e.salary
  FROM employees e
 WHERE e.job_id = 'ST_CLERK' AND e.salary < 5000
;

-- 4) employees ���̺��� employee_id, first_name, last_name, salary�� ��õ¡����(3.3%)��  ��ȸ�Ͻÿ�.
SELECT e.employee_id
      ,e.first_name
      ,e.last_name
      ,e.salary * 0.033 "��õ¡����"
  FROM employees e
;

-- 5) DEPARTMENTS ���̺��� LOCATION_ID �� 1700 �ΰ��� ��ȸ�ϰ� NULL�� �ƴѰ͸� ��ȸ�Ͻÿ�.
SELECT d.location_id
  FROM departments d
 WHERE d.location_id = 1700 AND d.location_id is NOT NULL
;

-- 6) DEPARTMENTS ���̺��� DEPARTMENT_NAME �� C �� �����ϴ� �͵��� ��ȸ�Ͻÿ�.
SELECT d.department_name
  FROM departments d
 WHERE d.department_name LIKE 'C%'
;

-- 6. ������ �Լ�

-- 1) DEPARTMENTS ���̺��� DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID �� ��ȸ�ϰ� manager_id ���� null �̸� 0���� ��ü�Ͽ� ����Ͻÿ�.
SELECT d.department_id
      ,d.department_name
      ,NVL(d.manager_id,0)
      ,d.location_id
  FROM departments d
;

-- 2) employees ���̺��� job_id �� ���� salary�� �߰����� �Ѵٰ� �Ѵ�(�ؿ� ��޵� job_id��). ���� ������ ������ ������ �� ������ EMPLOYEE_ID, FIRST_NAME, LAST_NAME,�߰����޺� ���Ͻÿ�.
--    (DECODE ���)
/*
AD_PRES
AD_VP
IT_PROG
FI_MGR
FI_ACCOUNT
PU_MAN
PU_CLERK
ST_MAN
------------------------ ���� 3.5%
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
                      ,'ST_MAN',e.salary*0.035) ������
  FROM employees e
;

-- 3) ���� 2)�� case�� �����Ͻÿ�.
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
                     END AS ������
  FROM employees e
;

-- 7. ������ �Լ�

-- 1) employees ���̺��� ��ü ���� ���� ��ȸ
SELECT COUNT(*)
 FROM employees e
;

-- 2) employees ���̺��� SALARY �� ����,���,�ִ�,�ּҸ� ����Ͽ� �ڿ� $99,999 �߰��Ͽ� ��ȸ
SELECT TO_CHAR(COUNT(salary),'$99,999') ����
      ,TO_CHAR(AVG(salary),'$99,999') ���
      ,TO_CHAR(MAX(salary),'$99,999.') �ִ�
      ,TO_CHAR(MIN(salary),'$99,999') �ּ�
  FROM employees e
;

-- 3) employees ���̺��� salary �� 4000 �̻��� employee_id �� ���Ͻÿ�.
SELECT e.employee_id
  FROM employees e
 WHERE e.salary > 4000
GROUP BY e.employee_id
;

-- 8. ����