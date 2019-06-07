-- day09 :

-- 2. ������ �Լ�(�׷� �Լ�)

-- 1) COUNT(*) : FROM ���� ������
--               Ư�� ���̺��� ���� ����(������ ����)�� �����ִ� �Լ�
--               NULL ���� ó���ϴ� "����"�� �׷��Լ�

--   COUNT(expr) : expr ���� ������ ���� NULL �����ϰ� �����ִ� �Լ�
--����) dept, saqlgrade ���̺��� ��ü ������ ���� ��ȸ
-- 1. dept ���̺� ��ȸ
SELECT d.*
  FROM dept d
;
/*  ������ �Լ��� ���� ����
----------------------------
DEPTNO, DNAME, LOC
10	ACCOUNTING	NEW YORK ====> SUBSTR(dname, 1, 5) ====> ACCOU
20	RESEARCH	DALLAS   ====> SUBSTR(dname, 1, 5) ====> RESEA
30	SALES	CHICAGO      ====> SUBSTR(dname, 1, 5) ====> SALES
40	OPERATIONS	BOSTON   ====> SUBSTR(dname, 1, 5) ====> OPERA
*/
/* �׷��Լ�(COUNT(*)) �� ���� ����
-------------------------------------
DEPTNO, DNAME, LOC
10	ACCOUNTING	NEW YORK ====> 
20	RESEARCH	DALLAS   ====> COUNT(*) ====> 4
30	SALES	CHICAGO      ====>
40	OPERATIONS	BOSTON   ====>
*/
-- 2. dept ���̺��� ������ ���� ��ȸ : COUNT(*) ���
SELECT COUNT(*) "�μ� ����"
  FROM dept d
;
/*
�μ� ����
----------
      4
*/

-- salgrade(�޿����) ���̺��� �޿� ��� ����
SELECT COUNT(*) "�޿� ��� ����"
  FROM salgrade
;
/*
�޿� ��� ����
-------------
5
*/
SELECT s.*
  FROM salgrade s
;
/*
GRADE, LOSAL, HISAL
-------------------
1	700	1200
2	1201	1400
3	1401	2000 ====> COUNT(*) ====> 5
4	2001	3000
5	3001	9999
*/

-- COUNT(expr) �� NULL �����͸� ó������ ���ϴ� �� Ȯ���� ���� ������ �߰�
INSERT INTO "SCOTT"."EMP" (EMPNO, ENAME) VALUES ('7777', 'JJ')
COMMIT ;

-- emp ���̺��� job �÷��� ������ ������ ī��Ʈ
SELECT COUNT(e.job) "���� ������ ������ ��"
  FROM emp e
;
/*
���� ������ ������ ��
---
14
*/

/*
7369	SMITH	CLERK
7499	ALLEN	SALESMAN=====>
7521	WARD	SALESMAN=====>
7566	JONES	MANAGER=====>
7654	MARTIN	SALESMAN=====>
7698	BLAKE	MANAGER=====>          ������ ���� ���� �÷��� job ��
7782	CLARK	MANAGER=====>          null �� �� ���� ó���� ���� �ʴ´�
7839	KING	PRESIDENT=====>        COUNT(e.job) ====> 14
7844	TURNER	SALESMAN=====>
7900	JAMES	CLERK   =====>
7902	FORD	ANALYST =====>
7934	MILLER	CLERK   =====>
9999	J_JAMES	CLERK   =====>
8888	J%JAMES	CLERK   =====>
7777	JJ      (NULL)  =====> 	
*/

-- ����) ȸ�翡 �Ŵ����� ������ ������ ����ΰ�
--       ��Ī : ��簡 �ִ� ������ ��
SELECT COUNT(e.mgr) as "��簡 �ִ� ������ ��"
  FROM emp e
;
/*
��簡 �ִ� ������ ��
                11
*/

-- ����) �Ŵ��� ���� �ð� �ִ� ������ ����ΰ�?
-- 1.emp ���̺��� mgr �÷��� ������ ���¸� �ľ�
-- 2.mrg �÷��� �ߺ� �����͸� ����
SELECT DISTINCT e.mgr 
  FROM emp e
;
/*
MGR
---
7782
7698
7902
7566
null
7839
*/
-- 3. �ߺ� �����Ͱ� ���ŵ� ����� ī��Ʈ
SELECT COUNT(DISTINCT e.mgr) as "�Ŵ��� ��"
  FROM emp e
;
/*
�Ŵ��� ��
     5
*/

-- ����) �μ��� ������ ������ ����̳� �ִ°�?
SELECT COUNT(e.deptno) as "�μ� ���� �ο�"
  FROM emp e
;
/*
�μ� ���� �ο�
  12
*/

-- COUNT(*) �� �ƴ� COUNT(expr)�� ����� ��쿡��
SELECT e.deptno
  FROM emp e
 WHERE e.deptno IS NOT NULL
;

-- �� ������ ����� ī��Ʈ �� ������ ������ �� ����.

-- ����) ��ü�ο�, �μ� ���� �ο�, �μ� �̹��� �ο��� ���Ͻÿ�.
SELECT COUNT(*) as ��ü�ο�
      ,COUNT(e.deptno) as "�μ� ���� �ο�"
      ,COUNT(*) - COUNT(e.deptno) "�μ� �̹��� �ο�"
  FROM emp e
;

-- SUM(expr) : NULL �׸� �����ϰ�
--             �ջ� ������ ���� ��� ���� ����� ���

-- SALESMAN ���� ���� ������ ���غ���.
SELECT SUM(e.comm) "���� ����"
  FROM emp e
;
/*
(null)    =====>
300        =====>
500        =====>
(null)      =====>
1400        =====>
(null)      =====>
(null)      =====> SUM(e.comm) =====> 2200 : �ڵ����� NULL �÷� ����
(null)      =====>
0           =====>
(null)      =====>
(null)      =====>
(null)      =====>
(null)      =====>
(null)      =====>
*/


SELECT SUM(e.comm) "���� ����"
  FROM emp e
 WHERE e.job = 'SALESMAN'
;
/*
 COMM
 -----
  300 ====>
  500 ====> SUM(e.comm) =====> 2200
 1400 ====>
 0=====>
 */
-- ���� ���� ����� ���� ��� ������ ���� $, ���ڸ� ���� �б� ����
SELECT TO_CHAR(SUM(e.comm),'$9,999') "���� ����"
 FROM emp e
 WHERE e.job = 'SALESMAN'
;
/*
���� ����
---------
$2,200
*/

-- 3) AVG(expr) : NULL �� �����ϰ� ���� ������ �׸��� ��� ����� ����

-- SALESMAN �� ���� ����� ���غ���.

-- ���� ��� ����� ���� ��� ���� $, ���ڸ� ���� �б� ����

SELECT TO_CHAR(AVG(e.comm),'$9,999') as "���� ���"
  FROM emp e
 WHERE e.job = 'SALESMAN'
;
/*
���� ���
--------
$550
*/

--44)MAX(expr) : expr�� ������ �� �� �ִ��� ����
--               expr�� ������ ���� ���ĺ��� ���ʿ� ��ġ�� ���ڸ�
--               �ִ밪���� ���

-- �̸��� ���� ������ ����
SELECT MAX(e.ename) "�̸��� ���� ������ ����"
  FROM emp e
;
/*
�̸��� ���� ������ ����
------------------------
WARD
*/

--44)MAX(expr) : expr�� ������ �� �� �ּڰ��� ����
--               expr�� ������ ���� ���ĺ��� ���ʿ� ��ġ�� ���ڸ�
--               �ּҰ����� ���
SELECT MIN(e.ename) "�̸��� ���� ���� ����"
  FROM emp e
;
/*
�̸��� ���� ���� ����
---------------------
ALLEN
*/

-- 3. GROUP BY ���� ���
-- ����) �� �μ����� �޿��� ����, ���, �ִ�, �ּҸ� ��ȸ

-- ����
-- ����: SUM() �� ���
-- �׷�ȭ ������ �μ���ȣ�� ���
-- GROUP BY ���� �����ؾ� ��

-- a) ���� emp ���̺��� �޿� ������ ���ϴ� ���� �ۼ�
SELECT SUM(e.sal)
  FROM emp e
;
-- b) �μ� ��ȣ�� �������� �׷�ȭ ����
--     SUM()�� �׷��Լ���.
--     GROUP BY ���� �����ϸ� �׷�ȭ �����ϴ�.
--     �׷�ȭ�� �Ϸ��� �����÷��� GROUP BY ���� �����ؾ� ��.
SELECT   e.deptno �μ���ȣ --�׷�ȭ �����÷�
        ,e.job --�׷�ȭ �����÷��� �ƴѵ� SELECT ���� ���� => ����
        ,SUM(e.sal) "�μ� �޿� ����" --�׷��Լ��� ���� �÷�
  FROM emp e 
 GROUP BY e.deptno  --�׷�ȭ �����÷����� GROUP BY ���� ����
 ORDER BY e.deptno  --�μ���ȣ ����
;
/*
ORA-00979: GROUP BY ǥ������ �ƴմϴ�.
00979. 00000 -  "not a GROUP BY expression"
*Cause:    
*Action:
262��, 17������ ���� �߻�
*/
-- GROUP BY ���� �׷�ȭ ���� �÷����� ������ �÷��� �ƴ� ����
-- SELECT ���� �����ϸ� ����,����Ұ�

-- ����) �μ��� �޿��� ����, ���, �ִ�, �ּ�
SELECT   e.deptno �μ���ȣ --�׷�ȭ �����÷�> ����
        ,e.job ����
        ,SUM(e.sal) "�μ� �޿� ����" --�׷��Լ��� ���� �÷�
        ,AVG(e.sal) "�μ� �޿� ���"
        ,MAX(e.sal) "�μ� �޿� �ִ�"
        ,MIN(e.sal) "�μ� �޿� �ּ�"
  FROM emp e 
 GROUP BY e.deptno, e.job --�׷�ȭ �����÷����� GROUP BY ���� ����
 ORDER BY e.deptno  --�μ���ȣ ����
;
/*
�μ���ȣ, �μ� �޿� ����, �μ� �޿� ���, �μ� �޿� �ִ�, �μ� �޿� �ּ�
10	    1300	1300	1300	1300
10	    2450	2450	2450	2450
10	    5000	5000	5000	5000
20	    3000	3000	3000	3000
20    	800	     800	800  	800
20   	2975	2975	2975	2975
30	     950	 950	950	     950
30	     2850	 2850	2850	2850
30	    5600	1400	1600	1250
	*/			
--������Ȳ
-- a) GROUP BY ���� �׷�ȭ ������ ������ ���

--���� ���� ����
SELECT   e.deptno �μ���ȣ --�׷�ȭ �����÷�> ����
        ,TO_CHAR(SUM(e.sal),'$9,999') "�μ� �޿� ����" --�׷��Լ��� ���� �÷�
        ,TO_CHAR(AVG(e.sal),'$9,999') "�μ� �޿� ���"
        ,TO_CHAR(MAX(e.sal),'$9,999') "�μ� �޿� �ִ�"
        ,TO_CHAR(MIN(e.sal),'$9,999') "�μ� �޿� �ּ�"
  FROM emp e 
 GROUP BY e.deptno  --�׷�ȭ �����÷����� GROUP BY ���� ����
 ORDER BY e.deptno  --�μ���ȣ ����
;
/*
�μ���ȣ,      �μ� �޿� ����, �μ� �޿� ���, �μ� �޿� �ִ�, �μ� �޿� �ּ�
10	 $8,750	    $2,917	 $5,000	 $1,300
20	 $6,775	    $2,258	 $3,000	   $800
30	 $9,400	    $1,567	 $2,850	   $950
*/

-- �μ���ȣ�� ������ ����
SELECT   TO_CHAR(SUM(e.sal),'$9,999') "�μ� �޿� ����" --�׷��Լ��� ���� �÷�
        ,TO_CHAR(AVG(e.sal),'$9,999') "�μ� �޿� ���"
        ,TO_CHAR(MAX(e.sal),'$9,999') "�μ� �޿� �ִ�"
        ,TO_CHAR(MIN(e.sal),'$9,999') "�μ� �޿� �ּ�"
  FROM emp e 
 GROUP BY e.deptno  --�׷�ȭ �����÷����� GROUP BY ���� ����
 ORDER BY e.deptno  --�μ���ȣ ����
;

/*
���� ������ ��������� ��Ȯ�ϰ� ��� �μ��� ������� �� �� ���ٴ� ������ ����
�׷���, GROUP BY ���� �����ϴ� �����÷��� SELECT ���� �Ȱ��� �����ϴ� ����
��� �ؼ��� ���ϴ�.
SELECT ���� ������ �÷��߿��� �׷��Լ��� ������ �ʴ� �÷��� ���⶧����
���� ������ ����Ǵ� ���̴�.
*/

--b) SELECT ���� �׷��Լ��� �Ϲ� �÷��� ���� ����
--   GROUP BY �� ��ü�� ������ ���
SELECT   e.deptno �μ���ȣ --�׷�ȭ �����÷�> ����
        ,e.job ����
        ,SUM(e.sal) "�μ� �޿� ����" --�׷��Լ��� ���� �÷�
        ,AVG(e.sal) "�μ� �޿� ���"
        ,MAX(e.sal) "�μ� �޿� �ִ�"
        ,MIN(e.sal) "�μ� �޿� �ּ�"
  FROM emp e 
 --GROUP BY e.deptno, e.job --�׷�ȭ �����÷����� GROUP BY ���� ����
 ORDER BY e.deptno  --�μ���ȣ ����
;
/*
ORA-00937: ���� �׷��� �׷� �Լ��� �ƴմϴ�
00937. 00000 -  "not a single-group group function"
*Cause:    
*Action:
340��, 10������ ���� �߻�
*/

-- ����) ����(job) �� �޿��� ����, ���, �ִ�, �ּ� �� ���غ���
--  ��Ī : ����, �޿�����, �޿����, �ִ�޿�, �ּұ޿�
SELECT   e.job ����
        ,TO_CHAR(SUM(e.sal),'$9,999') "�޿�����"
        ,TO_CHAR(AVG(e.sal),'$9,000') "�޿����"
        ,MAX(e.sal) "�޿��ִ�"
        ,MIN(e.sal) "�޿��ּ�"
  FROM emp e 
 GROUP BY e.job 
 ORDER BY e.job  
;


-- ������ �̹����� ������� ������ ��� '���� �̹���'���� ���
SELECT   NVL(e.job,'�����̹���') 
        ,e.job ����
        ,TO_CHAR(SUM(e.sal),'$9,999') "�޿�����"
        ,TO_CHAR(AVG(e.sal),'$9,000') "�޿����"
        ,MAX(e.sal) "�޿��ִ�"
        ,MIN(e.sal) "�޿��ּ�"
        
  FROM emp e 
 GROUP BY e.job 
 ORDER BY e.job  
;

-- �μ��� ����, ���, �ִ�, �ּ�
-- �μ���ȣ�� null �ΰ�� '�μ� �̹���'
SELECT   NVL(TO_CHAR(e.deptno),'�μ� �̹���') �μ���ȣ
        ,TO_CHAR(SUM(e.sal),'$9,999') "�μ� �޿� ����"
        ,TO_CHAR(AVG(e.sal),'$9,999') "�μ� �޿� ���"
        ,TO_CHAR(MAX(e.sal),'$9,999') "�μ� �޿� �ִ�"
        ,TO_CHAR(MIN(e.sal),'$9,999') "�μ� �޿� �ּ�"
  FROM emp e 
 GROUP BY e.deptno  --�׷�ȭ �����÷����� GROUP BY ���� ����
 ORDER BY e.deptno  --�μ���ȣ ����
;
SELECT   NVL(e.deptno || '','�μ� �̹���') �μ���ȣ
        ,TO_CHAR(SUM(e.sal),'$9,999') "�μ� �޿� ����"
        ,TO_CHAR(AVG(e.sal),'$9,999') "�μ� �޿� ���"
        ,TO_CHAR(MAX(e.sal),'$9,999') "�μ� �޿� �ִ�"
        ,TO_CHAR(MIN(e.sal),'$9,999') "�μ� �޿� �ּ�"
  FROM emp e 
 GROUP BY e.deptno  --�׷�ȭ �����÷����� GROUP BY ���� ����
 ORDER BY e.deptno  --�μ���ȣ ����
;

-- NVL, DECODE, TO_CHAR �������� �ذ�
SELECT   DECODE(NVL(e.deptno,0),e.deptno, TO_CHAR(e.deptno)
                               ,0       ,'�μ� �̹���') "�μ���ȣ"
        ,TO_CHAR(SUM(e.sal),'$9,999') "�μ� �޿� ����"
        ,TO_CHAR(AVG(e.sal),'$9,999') "�μ� �޿� ���"
        ,TO_CHAR(MAX(e.sal),'$9,999') "�μ� �޿� �ִ�"
        ,TO_CHAR(MIN(e.sal),'$9,999') "�μ� �޿� �ּ�"
  FROM emp e 
 GROUP BY e.deptno  --�׷�ȭ �����÷����� GROUP BY ���� ����
 ORDER BY e.deptno  --�μ���ȣ ����
;
/*
ORA-01722: ��ġ�� �������մϴ�
01722. 00000 -  "invalid number"
*Cause:    The specified number was invalid.
*Action:   Specify a valid number.
*/

--�ذ��� : deptno �� ���� ����ȭ

-------- 4. HAVING ���� ���

-- GROUP BY ����� ������ �ɾ
-- �� ����� ������ �������� ���Ǵ� ��.

--HAVING ���� WHERE ���� ���������
--SELECT ������ ���� ����������
--GROUP BY �� ���ٸ��� ����Ǵ� WHERE ���δ�
--GROUP BY ����� ������ �� ����.

-- ���� GROUP BY ���� ��������� ������
-- HAVING ���� �����Ѵ�.

-- ����) �μ��� �޿� ����� 2000 �̻��� �μ��� ��ȸ�Ͽ���.

-- a) �켱 �μ��� �޿� ����� ���Ѵ�.
SELECT e.deptno �μ���ȣ
      ,AVG(e.sal) �޿����
  FROM emp e
 GROUP BY e.deptno
;

-- b) a�� ������� �޿������ 2000�̻��� ���� �����.
--    HAVING ���� ��� ����
SELECT e.deptno �μ���ȣ
      ,TO_CHAR(AVG(e.sal),'$9,999.99') �޿����
  FROM emp e
 GROUP BY e.deptno
 HAVING AVG(e.sal) >= 2000
;
/*
�μ���ȣ, �޿����
10	 $2,916.67
20	 $2,258.33
*/

-- ���� : HAVING ���� ��Ī�� ����� �� ����.
/*
1. FROM ���� ���̺� �� �� ��θ� �������
2. WHERE ���� ���ǿ� �´� �ุ �����ϰ�
3. GROUP BY ���� ���� �÷�, ��(�Լ���) ���� �׷�ȭ ����
4. HAVING ���� ������ ������Ű�� �׷��ุ ����
5. SELECT 4���� ���õ� �׷� ������ ���� �࿡ ���ؼ� 
   SELECT ���� ��õ� �÷�, ��(�Լ���)�� ���
6. ORDER BY �� �ִٸ� ���� ���ǿ� ���߾� ���� �����Ͽ� ��� ���
*/

----------------------------------------------------------------------
-- ������ �ǽ�

-- 1. �Ŵ�����, ���������� ���� ���ϰ�, ���� ������ ����
--   : mgr �÷��� �׷�ȭ ���� �÷�
SELECT e.mgr �Ŵ�����
      ,COUNT(e.mgr) "���������� ��"
  FROM emp e
 GROUP BY e.mgr
 ORDER BY COUNT(e.mgr) desc
;
-- 2.1 �μ��� �ο��� ���ϰ�, �ο��� ���� ������ ����
--    : deptno �÷��� �׷�ȭ ���� �÷�
SELECT e.deptno �μ���
      ,COUNT(e.deptno) "���������� ��"
  FROM emp e
 GROUP BY e.deptno
 ORDER BY COUNT(e.deptno) desc
;
-- 2.2 �μ� ��ġ �̹��� �ο� ó��
SELECT NVL(e.deptno,0) �μ���
      ,COUNT(e.deptno) "���������� ��"
  FROM emp e
 GROUP BY e.deptno
 ORDER BY COUNT(e.deptno) desc
;

-- 3.1 ������ �޿� ��� ���ϰ�, �޿���� ���� ������ ����
--   : job �� �׷�ȭ ���� �÷�
SELECT e.job ����
      ,TO_CHAR(AVG(e.sal),'$9,999.99') �޿����
  FROM emp e
 GROUP BY e.job,e.sal
 ORDER BY e.sal desc
;

-- 3.2 job �� null �� ������ ó��
SELECT NVL(e.job,'���� �̹���') ����
      ,TO_CHAR(AVG(e.sal),'$9,999.99') �޿����
  FROM emp e
 GROUP BY e.job,e.sal
 ORDER BY e.sal desc
;

-- 4. ������ �޿� ���� ���ϰ�, ���� ���� ������ ����
--   : job �� �׷�ȭ ���� �÷�
SELECT  e.job ����
       ,SUM(e.sal) "�޿� ����"
  FROM emp e
 GROUP BY e.job,e.sal
 ORDER BY e.sal desc
;

-- 5. �޿��� �մ����� 1000�̸�, 1000, 2000, 3000, 5000 ���� �ο����� ���Ͻÿ�
--    �޿� ���� ������������ ����
SELECT   WIDTH_BUCKET(e.sal, 0, 5000, 4)||'õ�޷�'  AS "�޿�(õ�޷�)"
        ,count(*) as �ο���
  FROM emp e
 GROUP BY WIDTH_BUCKET(e.sal, 0, 5000, 4)
 ORDER BY WIDTH_BUCKET(e.sal, 0, 5000, 4) desc
;
-- 6. ������ �޿� ���� ������ ���ϰ�, �޿� ���� ������ ū ������ ����
SELECT   e.sal
        ,TO_CHAR(SUM(e.sal),'$9,999.99')
  FROM emp e
 GROUP BY e.sal
 ORDER BY e.sal desc
;

-- 7. ������ �޿� ����� 2000������ ��츦 ���ϰ� ����� ���� ������ ����
SELECT
         e.job ����
        ,TO_CHAR(AVG(e.sal),'$9,999.99') "�޿� ���"
  FROM emp e
 GROUP BY e.job,e.sal
 HAVING e.sal<=2000
 ORDER BY e.sal desc
;


-- 8. �⵵�� �Ի� �ο��� ���Ͻÿ�
SELECT   TO_CHAR(e.hiredate,'YY') AS �⵵
        ,COUNT(*) "�Ի�⵵ �ο�"
  FROM emp e
 GROUP BY TO_CHAR(e.hiredate,'YY')
 ORDER BY TO_CHAR(e.hiredate,'YY')
;
