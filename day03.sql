-- SQL day 03
-- WHERE ������

-- * SQL SELECT ������ �۵� ���� :
-- >> ���̺� (FROM ���� ������)�� �� ���� �⺻ ������ �����Ѵ�.
-- >> ���̺� ���� ������ŭ �ݺ� �����Ѵ�.
-- ���� ������ ���� ������ �����Ѵٸ� ����� ��� �ɱ�?
SELECT 'Hello,SQL~'   --������ ���� ��ȸ�ϸ� ��� �ɱ�?
  FROM emp
;
/*
'HELLO,SQL~'
-------------
Hello,SQL~
Hello,SQL~
Hello,SQL~
Hello,SQL~
Hello,SQL~
Hello,SQL~
Hello,SQL~
Hello,SQL~
Hello,SQL~
Hello,SQL~
Hello,SQL~
Hello,SQL~
*/

SELECT 'Hello,SQL~' AS greeting-- �÷����� �ƴ� ������ ���� ��ȸ�ϸ� ��� �ɱ�?
        ,empno  --���̺� �����ϴ� �÷����� ��� ���� ��� �ɱ�?
        ,ename
  FROM emp
;
/*
GREETING,  EMPNO,   ENAME
Hello,SQL~	7369	SMITH
Hello,SQL~	7499	ALLEN
Hello,SQL~	7521	WARD
Hello,SQL~	7566	JONES
Hello,SQL~	7654	MARTIN
Hello,SQL~	7698	BLAKE
Hello,SQL~	7782	CLARK
Hello,SQL~	7839	KING
Hello,SQL~	7844	TURNER
Hello,SQL~	7900	JAMES
Hello,SQL~	7902	FORD
Hello,SQL~	7934	MILLER
*/

-- WHERE ������
-- 16) emp ���̺��� empno �� 7900�� �����
--      ���, �̸�, ����, �Ի���, �޿� , �μ���ȣ�� ��ȸ�Ͻÿ�.

SELECT e.empno
      ,e.ename
      ,e.job
      ,e.hiredate
      ,e.sal
      ,e.deptno
 FROM emp e
 WHERE e.empno=7900
 ;
 /*
 EMPNO, ENAME,  JOB,    HIREDATE,   SAL, DEPTNO
 -----------------------------------------------
 7900	JAMES	CLERK	81/12/03	950	  30
 */
 
 -- 17) emp ���̺��� empno �� 7900 �̰ų� deptno �� 20�� ������
 --     ���, �̸�, ����, �Ի���, �޿�, �μ���ȣ �� ��ȸ�Ͻÿ�.
 SELECT  e.empno
        ,e.ename
        ,e.job
        ,e.hiredate
        ,e.sal
        ,e.deptno
   FROM emp e
  WHERE e.empno=7900 OR e.deptno=20
  ;
/*
EMPNO,  ENAME,   JOB,   HIREDATE,   SAL,  DEPTNO
7369	SMITH	CLERK	80/12/17	800	    20
7566	JONES	MANAGER	81/04/02	2975	20
7900	JAMES	CLERK	81/12/03	950	    30
7902	FORD	ANALYST	81/12/03	3000	20
*/

