-- day04 : �ǽ� 4����

--(6) ������ 2. �񱳿�����
--      �񱳿����ڴ� SELECT ���� ����� �� ����
--      WHERE , HAVING ������ ����� �� ����.

-- 22) �޿��� 2000�� �Ѵ� ������ ���, �̸�, �޿��� ��ȸ
SELECT e.empno ���
      ,e.ename �̸�
      ,e.sal �޿�
  FROM emp e
 WHERE e.sal>2000
 ;
 /*
 ���, �̸�,    �޿�
 -----------------------
7566	JONES	2975
7698	BLAKE	2850
7782	CLARK	2450
7839	KING	5000
7902	FORD	3000
*/

--�޿��� 1000 �̻��� ������ ���, �̸� ,�޿��� ��ȸ
SELECT   e.empno
        ,e.ename
        ,e.sal
  FROM emp e
 WHERE e.sal >=1000
;
/*
EMPNO, ENAME,   SAL
---------------------
7499	ALLEN	1600
7521	WARD	1250
7566	JONES	2975
7654	MARTIN	1250
7698	BLAKE	2850
7782	CLARK	2450
7839	KING	5000
7844	TURNER	1500
7902	FORD	3000
7934	MILLER	1300
*/

-- �޿��� 1000 �̻��̸� 2000���� ���� ������
-- ���, �̸�, �޿��� ��ȸ
SELECT e.empno
      ,e.ename
      ,e.sal
  FROM emp e
 WHERE e.sal >= 1000
   AND e.sal < 2000
;
/*
EMPNO, ENAME,   SAL
----------------------
7499	ALLEN	1600
7521	WARD	1250
7654	MARTIN	1250
7844	TURNER	1500
7934	MILLER	1300
*/

--comm(����) ���� 0���� ū ������
-- ���, �̸�, �޿�, ������ ��ȸ
SELECT  e.empno
       ,e.ename
       ,e.sal
       ,e.comm
  FROM  emp e
 WHERE e.comm>0
;
/*
EMPNO, ENAME,   SAL,    COMM
------------------------------
7499	ALLEN	1600	300
7521	WARD	1250	500
7654	MARTIN	1250	1400
*/

/*
==> **���� comm > 0 ������ ���� ������� �� �� �ִ� ��
comm �÷��� ���� (null) �� ������� ����
ó������ �񱳴�� ���� ������ �����ؾ� �Ѵ�.
(null) ���� �񱳿�����, ��������ڷ� ������ �� ���� ���̴�.

��,���Ŀ����� null ���� ���� ū ������ ��޵ȴ�.
*/

-- 23) null ������ ���� ����
--     SALESMAN(�������) ������ ���� ����� ���� ���ɱ��� ����Ͽ�
--     ���,�̸�,����,�� ���ɱ��� ��ȸ
SELECT e.empno
      ,e.ename
      ,e.job
      ,e.sal+e.comm "�� ���ɱ�"
  FROM emp e
 WHERE e.job='SALESMAN'
;
/*
EMPNO, ENAME,   JOB,        �� ���ɱ�
7499	ALLEN	SALESMAN	1900
7521	WARD	SALESMAN	1750
7654	MARTIN	SALESMAN	2650
7844	TURNER	SALESMAN	1500
*/
-- ==> NULL �����ʹ� ��������ڷ� ���� �Ұ����� ��

-- (6) ������ 3. ��������
-- NOT ������

-- 24) �޿��� 2000 ���� ���� ���� ������
--      ��� �̸� �޿��� ��ȸ
SELECT   e.empno
        ,e.ename
        ,e.sal
  FROM   emp e
 WHERE NOT e.sal <2000
;

-- ���� ����� ���� �ٸ� ����
SELECT   e.empno
        ,e.ename
        ,e.sal
  FROM   emp e
 WHERE e.sal >=2000
;
/*
EMPNO,  ENAME,   SAL
7566	JONES	2975
7698	BLAKE	2850
7782	CLARK	2450
7839	KING	5000
7902	FORD	3000
*/

--(6) ������ 4. SQL ������
-- IN ������ : ���ϰ��� �ϴ� ���� ����
--             ���õ� ��Ͽ� �����ϸ� ������ �Ǵ�

-- 25) �޿��� 800, 3000, 5000 �߿� �ϳ��� ������
--     ���, �̸�, �޿� �� ��ȸ
SELECT   e.empno
        ,e.ename
        ,e.sal
  FROM emp e
 WHERE e.sal IN (800,3000,5000)
;
-- OR �����ڿ� 3���� �������� ������ ����� ���� ����
SELECT   e.empno
        ,e.ename
        ,e.sal
  FROM emp e
 WHERE e.sal=800
    OR e.sal=3000
    OR e.sal=5000
;
/*
EMPNO,  ENAME,  SAL
7369	SMITH	800
7839	KING	5000
7902	FORD	3000
*/
---------------------
-- LIKE ������ : ���� ���� �˻��� �� ���.
--               ��Ȯ�� ���� ���� ���� �� ���.
-- LIKE �������� ���� ���� : ���� �� �˻��� ����
--                          �����ڿ� �Բ� ����ϴ� ��ȣ
-- % : �� ��ȣ�� �ڸ��� 0�ڸ��� �̻��� ��� ���ڰ� �� �� ����
-- _ : �� ��ȣ�� �ڸ��� 1�ڸ��� ��� ���ڰ� �� �� ����

-- 26) �̸��� J �� �����ϴ� ������
--     ���, �̸� ��ȸ
SELECT   e.empno
        ,e.ename
  FROM   emp e
 WHERE   e.ename LIKE 'J%'
;
/*
EMPNO, ENAME
-------------
7566	JONES
7900	JAMES
*/
-- �̸��� M ���� �����ϴ� ������ �ù�, �̸� ��ȸ
SELECT   e.empno
        ,e.ename
  FROM   emp e
 WHERE e.ename LIKE 'M%'
;
/*
EMPNO,   ENAME
---------------
7654	MARTIN
7934	MILLER
*/

-- �̸��� M�� ���� ������ ���, �̸� ��ȸ
SELECT   e.empno
        ,e.ename
  FROM   emp e
 WHERE   e.ename LIKE '%M%'
;
/*
EMPNO, ENAME
-----------
7369	SMITH
7654	MARTIN
7900	JAMES
7934	MILLER
*/

-- �̸��� ����° �ڸ��� M �� ���� ������ ���,�̸� ��ȸ
SELECT   e.empno
        ,e.ename
  FROM   emp e
 WHERE   e.ename LIKE '__M%' -- �����νĹ��� _�� �ι� ����Ͽ�
;                            -- M ���ڸ��� 2���ڷ� ����
/*
EMPNO, ENAME
----------------
7900   JAMES
*/

-- �̸��� ��°�ڸ����� LA�� ���� �̸��� ���� ������
-- ���, �̸� ��ȸ
SELECT   e.empno
        ,e.ename
  FROM   emp e
 WHERE   e.ename LIKE '_LA%'
;
/*
EMPNO, ENAME
------------
7698	BLAKE
7782	CLARK
*/

-- ������ ����� ����
INSERT INTO "SCOTT"."EMP" (EMPNO, ENAME, JOB) 
VALUES ('9999', 'J_JAMES', 'CLERK')
;
INSERT INTO "SCOTT"."EMP" (EMPNO, ENAME, JOB) 
VALUES ('8888', 'J%JAMES', 'CLERK')
;
COMMIT;

-- �̸��� J_�� �����ϴ� ������ ���,�̸��� ��ȸ
-- : ��ȸ �Ϸ��� ���� �����νĹ���(%,_)�� ����ִ� �����ʹ�
--  ��� ��ȸ �� ���ΰ�?
SELECT   e.empno
        ,e.ename
  FROM   emp e
 WHERE   e.ename LIKE 'J\_%' ESCAPE '\'
;
-- ==> ��ó�� LIKE ������ �ۼ��ϸ� J �ڿ� ��� 1���ڰ� �ִ�
--     �̸��� ���� ������ ��� �˻���
--     ���� �ν� ���ڸ� ��ȸ�Ϸ��� ESCAPE �� ����ؾ� �Ѵ�.
--   =>���� �ν� ���ڸ� ��ȿȭ�Ϸ��� ESCPAE �� ����ؾ� �Ѵ�.

-- 9999 J_JAMES

-- �̸��� J%�� �����ϴ� ������ ���,�̸� ��ȸ
SELECT   e.empno
        ,e.ename
  FROM   emp e
 WHERE   e.ename LIKE 'J\%%' ESCAPE '\'
;
-- 8888 J%JAMES

----------------------------------
-- NULL �� ���õ� ������ 
--: IS NULL, IN NOT NULL

-- IS NULL : ���Ϸ� �ϴ� �÷��� ���� NULL �� �� true(��)
--  ���Ϸ� �ϴ� �÷��� ���� NULL �� �ƴϸ� false(����)
-- IN NOT NULL : ���Ϸ� �ϴ� �÷��� ���� NULL �� �ƴϸ� true(��)
--              ���Ϸ� �ϴ� �÷��� ���� NULL �� �� false(����)

--NULL ���� ���� �÷��� �񱳿�����(=,!=,<>) �� ������ �Ұ����ϹǷ�
--NULL �� �񱳸� ���� �����ڰ� ���� �����Կ� ����

--col = NULL ==> NULL �� ���ؼ��� ���Ϻ� ������(=)�� ��� ����.
--col != NULL
--col <> NULL ==> NULL �� ���ؼ��� 
--                �ٸ��� ���ϴ� ������(!=, <>)�� ��� ����

-- 27) ���(mgr)�� �������� ���� ������ ��� �̸� ��ȸ
SELECT   e.ename
         ,e.empno
         ,e.mgr
  FROM emp e
 WHERE e.mgr=NULL --NULL �����ʹ� �񱳿����ڷ�
;                  --������ �� ���� ��

SELECT   e.ename
        ,e.empno
        ,e.mgr
  FROM emp e
 WHERE MGR IS NULL
;
/*
ENAME, EMPNO, MGR
------------------
KING	7839	
J_JAMES	9999	
J%JAMES	8888	
*/

SELECT   e.ename
        ,e.empno
        ,e.mgr
  FROM emp e
 WHERE MGR IS NOT NULL
; --e.mgr !=NULL / e.mgr <> NULL
--��� �� �� ���� ! �ᵵ ���� ������ ���� �����̵Ǵ°Ϳ� ����!
--�� ������ !=,<> ���� ���� �����
--����� ����� :0
--�̷� ��� ������ �Ǳ⋚���� ������ ã�� �����Ƿ�
--NULL �����͸� �ٷ� �� �׻� �����ؾ� �Ѵ�.
/*
ENAME, EMPNO, MGR
--------------------
SMITH	7369	7902
ALLEN	7499	7698
WARD	7521	7698
JONES	7566	7839
MARTIN	7654	7698
BLAKE	7698	7839
CLARK	7782	7839
TURNER	7844	7698
JAMES	7900	7698
FORD	7902	7566
MILLER	7934	7782
*/
-----------------------------------
-- BETWEEN a AND b : ���� ���� �� ������
-- a <= sal <=b : �̷��� ���� ����� ������ ���

-- 28) �޿��� 500 ~1200 ������ ������
--     ���, �̸� ,�޿� ��ȸ
SELECT   e.empno
        ,e.ename
        ,e.sal
  FROM   emp e
 WHERE e.sal BETWEEN 500 AND 1200
;
/*
EMPNO, ENAME, SAL
7369	SMITH	800
7900	JAMES	950
*/

--BETWEEN 500 AND 1200 ���� ����� ���� �񱳿����ڷ� ����
SELECT   e.empno
        ,e.ename
        ,e.sal
  FROM   emp e
 WHERE sal>=500 AND sal<=1200
;

----------------------------------
--EXISTS ������ : � ����(SELECT����) �� ������ �����
--                1�� �̻��ϋ� ������ �Ǵ�
--                ����� ��� �� :0 �ΰ�� �������� �Ǵ�
--                ���� ���������� �Բ� ����.

-- 29)
--  (1) �޿��� 3000�� �Ѵ� ������ ��ȸ
SELECT e.empno
      ,e.ename
      ,e.sal
  FROM emp e
 WHERE e.sal > 3000
;
-- EMPNO, ENAME, SAL
--7839	KING	5000
-- 29-(1) ������ ����� 1���� ����(EXISTS)

--  (2) �޿��� 3000�� �Ѵ� ������ 1���̶� ������
--      ȭ�鿡 "�޿��� 3000�� �Ѵ� ������ ������"
--      �̶�� �޽����� ����ϰ� �ʹ�.

SELECT '�޿��� 3000�� �Ѵ� ������ ������' as "�ý��� �޽���"
  FROM dual --1�ุ ������ �ִ� �������̺�
 WHERE EXISTS (SELECT e.empno
      ,e.ename
      ,e.sal
  FROM emp e
 WHERE e.sal > 3000)
;
/*
�ý��� �޽���
�޿��� 3000�� �Ѵ� ������ ������
*/

--oracle ���� �����ϴ� dual ���̺�
-- :1�� 1���� �����Ͱ� ����ִ� ���� ���̺�
-- 1) dual ���̺��� ���̺� ������ Ȯ��
DESC dual;
-- ���� DESC �� ������ Ű���尡 �ƴ� ����Ŭ�� ��ɾ�
-- ���̺��� ������ Ȯ���ϴ� ���
-Describe �� ����
/*
�̸�    ��? ����          
----- -- ----------- 
DUMMY    VARCHAR2(1) 
*/
SELECT dummy
  FROM dual
;

--�޿��� 10000�� �Ѵ� ������ ������
--ȭ�鿡 "�޿��� 10000�� �Ѵ� ������ �������� ����" �̶�� ���
-- (1) �޿��� 10000�� �Ѵ� ������ ���� ��ȸ
SELECT e.empno
      ,e.ename
      ,e.sal
  FROM emp e
 WHERE e.sal > 10000
;

-- (2) �ý��� �޽����� ����� �� �ֵ��� ���� ����
SELECT '�޿��� 10000�� �Ѵ� ������ �������� ����' AS "�ý��� �޽���"
  FROM dual
 WHERE NOT EXISTS (SELECT e.empno
                     ,e.ename
                     ,e.sal
                 FROM emp e
                 WHERE e.sal>10000)
;            
/*
�ý��� �޽���
-------------------------------
�޿��� 10000�� �Ѵ� ������ ������������
*/

--------------------------------------
-- (6) ������ : ���տ����� (||)
--     ����Ŭ���� ����,���ڿ� ����(����)
--     �ٸ� ���α׷��� ���(JAVA,C,C++ ��) ������
--     OR �����ڷ� ���ǹǷ� ȥ���ϸ� �ȵ�!

SELECT 'Hello~, SQL' AS greeting
  FROM dual
;

SELECT 'Hello~, SQL'|| 'In Oracle' AS greeting
  FROM dual
;
-- �ȳ��ϼ���~,SQL ����Ŭ���� ���� �־�� !

-- dual ���̺� Ȱ��, ������ ��¥�� �˷��ִ� ����
-- "������ ��¥�� 0000 �Դϴ�."�� ���
SELECT '������ ��¥��' || sysdate || '�Դϴ�.' AS "������ ��¥"
  FROM dual
;

-- ��¥ ��� ������ �ٲپ� ���
SELECT '������ ��¥��'
      || TO_CHAR(sysdate, 'YYYY-MM-D')
      || '�Դϴ�.' AS "������ ��¥"
  FROM dual
;
--������ ��¥��2019-05-6�Դϴ�.

-- ������ ��� �˸��̸� ����� �ʹ�.
-- ������ ����� �˷��ִ� ������ || �� ����Ͽ� �ۼ�
SELECT '�ȳ��ϼ���.' || e.ename || '��, ����� �����'
                     || e.empno || '�Դϴ�.' AS "��� �˸���"
  FROM emp e
;
/*
��� �˸���
�ȳ��ϼ���.SMITH��, ����� �����7369�Դϴ�.
�ȳ��ϼ���.ALLEN��, ����� �����7499�Դϴ�.
�ȳ��ϼ���.WARD��, ����� �����7521�Դϴ�.
�ȳ��ϼ���.JONES��, ����� �����7566�Դϴ�.
�ȳ��ϼ���.MARTIN��, ����� �����7654�Դϴ�.
�ȳ��ϼ���.BLAKE��, ����� �����7698�Դϴ�.
�ȳ��ϼ���.CLARK��, ����� �����7782�Դϴ�.
�ȳ��ϼ���.KING��, ����� �����7839�Դϴ�.
�ȳ��ϼ���.TURNER��, ����� �����7844�Դϴ�.
�ȳ��ϼ���.JAMES��, ����� �����7900�Դϴ�.
�ȳ��ϼ���.FORD��, ����� �����7902�Դϴ�.
�ȳ��ϼ���.MILLER��, ����� �����7934�Դϴ�.
�ȳ��ϼ���.J_JAMES��, ����� �����9999�Դϴ�.
�ȳ��ϼ���.J%JAMES��, ����� �����8888�Դϴ�.
*/
----------------------------------
-- (6) ������ 6. ���տ�����
-- 1) �ߺ��� ����� ������
SELECT d.deptno
      ,d.dname
      ,d.loc
  FROM dept d
UNION ALL
SELECT d.deptno
      ,d.dname
      ,d.loc
  FROM dept d
 WHERE d.deptno=10
;
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
10	ACCOUNTING	NEW YORK
*/
-- 2) UNION : �ߺ��� ������ ������
SELECT d.deptno
      ,d.dname
      ,d.loc
  FROM dept d
UNION
SELECT d.deptno
      ,d.dname
      ,d.loc
  FROM dept d
 WHERE d.deptno=10
;
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
*/
-- 3)INTERSECT : �ߺ��� ������
SELECT d.deptno
      ,d.dname
      ,d.loc
  FROM dept d
INTERSECT
SELECT d.deptno
      ,d.dname
      ,d.loc
  FROM dept d
 WHERE d.deptno=10
;
--10	ACCOUNTING	NEW YORK

--4)MINUS : ù���� ���� ���������� �ι�° ���� �������� �A ������
SELECT d.deptno
      ,d.dname
      ,d.loc
  FROM dept d
MINUS
SELECT d.deptno
      ,d.dname
      ,d.loc
  FROM dept d
 WHERE d.deptno=10
;
/*
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
*/

-- ����! : �� ������ ��ȸ ����� �÷��� ����, ������ Ÿ���� ������ ��ġ
-- 1) ������Ȳ : ù���� �÷� �� : 3
--               �Ѥ����� �÷� �� : 2
SELECT d.deptno
      ,d.dname
      ,d.loc
  FROM dept d
UNION ALL
SELECT d.deptno
      ,d.dname
      
  FROM dept d
 WHERE d.deptno=10
;
/*
ORA-01789: ���� ����� ����Ȯ�� ���� ��� ���� ������ �ֽ��ϴ�.
01789. 00000 -  "query block has incorrect number of result columns"
*Cause:    
*Action:
*/

-- 2) ������Ȳ : ù ������ �÷��� ����,���� ����
--               ��° ������ �÷��� ����,���� ����
SELECT d.dname
      ,d.deptno 
  FROM dept d
UNION ALL
SELECT d.deptno
      ,d.dname
  FROM dept d
 WHERE d.deptno=10
;
/*
ORA-01790: �����ϴ� �İ� ���� ������ �����̾�� �մϴ�
01790. 00000 -  "expression must have same datatype as corresponding expression"
*Cause:    
*Action:
585��, 8������ ���� �߻�
*/

-- ���� �����ڴ� ���� �ٸ� ���̺��� ��ȸ �����
-- ������ �����ϴ�.
-- ù���� ���� : emp ���̺��� ��ȸ
SELECT   e.empno --����
        ,e.ename --����
        ,e.job   --����
  FROM emp e
;

-- �ι�° ���� : dept ���̺��� ��ȸ
SELECT   d.deptno --����
        ,d.dname  --����
        ,d.loc    --����
  FROM   dept d
;

-- ���� �ٸ� ���̺���
-- (1) UNION
SELECT   e.empno --����
        ,e.ename --����
        ,e.job   --����
  FROM emp e
UNION
SELECT   d.deptno --����
        ,d.dname  --����
        ,d.loc    --����
  FROM   dept d
;
/* �������� �÷����� ù��° ������ �÷� �̸��� ���õ�
EMPNO, ENAME,      JOB
10	 ACCOUNTING	   NEW YORK
20	 RESEARCH	   DALLAS
30	  SALES	      CHICAGO
40	  OPERATIONS	BOSTON
7369	SMITH	CLERK
7499	ALLEN	SALESMAN
7521	WARD	SALESMAN
7566	JONES	MANAGER
7654	MARTIN	SALESMAN
7698	BLAKE	MANAGER
7782	CLARK	MANAGER
7839	KING	PRESIDENT
7844	TURNER	SALESMAN
7900	JAMES	CLERK
7902	FORD	ANALYST
7934	MILLER	CLERK
8888	J%JAMES	CLERK
9999	J_JAMES	CLERK
*/

--(2) MINUS ������
SELECT   e.empno --����
        ,e.ename --����
        ,e.job   --����
  FROM emp e
MINUS
SELECT   d.deptno --����
        ,d.dname  --����
        ,d.loc    --����
  FROM   dept d
;
/*
EMPNO, ENAME, JOB
-------------------
7369	SMITH	CLERK
7499	ALLEN	SALESMAN
7521	WARD	SALESMAN
7566	JONES	MANAGER
7654	MARTIN	SALESMAN
7698	BLAKE	MANAGER
7782	CLARK	MANAGER
7839	KING	PRESIDENT
7844	TURNER	SALESMAN
7900	JAMES	CLERK
7902	FORD	ANALYST
7934	MILLER	CLERK
8888	J%JAMES	CLERK
9999	J_JAMES	CLERK
*/
-- (3) INTERSECT
SELECT   e.empno --����
        ,e.ename --����
        ,e.job   --����
  FROM emp e
INTERSECT
SELECT   d.deptno --����
        ,d.dname  --����
        ,d.loc    --����
  FROM   dept d
--> ����� ��� ��:0
--  ���� �ٸ� ���̺��� ������ ��ȸ ������� ���� �����̹Ƿ�
--  �ߺ��� �����Ͱ� �����Ƿ� ������ ����� 1�൵����

