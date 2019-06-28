--day 11
---------7. ���ΰ� ��������
-- (2) �������� : Sub-Query

--   SELECT, FROM, WHERE ���� ���� �� �ִ�.

-- ����) BLAKE �� ������ ������ ������ ������ ��ȸ
-- 1. BLAKE �� ������ ��ȸ(��������)
SELECT   e.job
  FROM emp e
 WHERE e.ename = 'BLAKE'
;
-- 2. 1�� ����� ����(��������)
-- ==> ������ MANAGER �� ����� ��ȸ�Ͽ���.
SELECT e.empno
      ,e.ename
  FROM emp e
 WHERE e.job = 'MANAGER'
;
-- ���������� WHERE ���� ������
-- MANAGER �ڸ��� 1�� ������ ������ ����.
SELECT e.empno
      ,e.ename
  FROM emp e
 WHERE e.job = (SELECT e.job
                  FROM emp e
                 WHERE e.ename = 'BLAKE')
;

-- => ���������� WHERE �� () ��ȣ �ȿ� ���޵Ǵ� ����
--    1�� ������ ����� MANAGER ��� ���̴�.

-----------------------------------------
-- �������� ������ �ǽ�
-- 1. �� ȸ���� ��� �޿����� �޿��� ���� �޴� ������ ��� ��ȸ�Ͽ���.
--    ���, �̸�, �޿��� ��ȸ
-- a) ȸ���� �޿� ��հ��� ���ϴ� ����
SELECT AVG(e.sal) "�޿� ���"
  FROM emp e 
;
-- b) �� ��� ���� ���� �����Ͽ� �� ������ �޿��� ���� ������ ���ϴ� ����
SELECT AVG(e.sal) "�޿� ���"
  FROM emp e
;
-- c) b �� �������� ��� �� �ڸ��� (a)�� ������ ��ü
SELECT   e.empno
        ,e.ename
        ,e.sal
  FROM emp e
 WHERE e.sal > (SELECT AVG(e.sal)
                   FROM emp e)
;
-- 2. �޿��� ��� �޿����� ũ�鼭
--    ����� 7700�� ���� ���� ������ ��ȸ�Ͻÿ�.
SELECT   e.empno
        ,e.ename
        ,e.sal
  FROM emp e
 WHERE e.sal > (SELECT AVG(e.sal)
                   FROM emp e) AND e.empno > 7700
;
-- 3. �� �������� �ִ� �޿��� �޴� ���� ����� ��ȸ�Ͽ���.
--    ���, �̸�, ����, �޿��� ��ȸ
-- a) �������� �ִ� �޿��� ���ϴ� ���� : �׷��Լ�(max), �׷�ȭ�����÷�(job)
SELECT TO_CHAR(MAX(e.sal)) "�������ִ밪"
      ,e.job ����
  FROM emp e
GROUP BY e.job
;
-- b) (a)���� ������ �ִ� �޿��� job �� ��ġ�ϴ��� �����ϴ� ����.
SELECT  e.empno
       ,e.ename
       ,e.job
       ,e.sal
  FROM emp e
WHERE (e.job = 'CLERK' AND e.sal = 1300)
   OR (e.job = 'SALESMAN' AND e.sal = 1600)
   OR (e.job = 'ANALYST' AND e.sal = 3000)
   OR (e.job = 'MANAGER' AND e.sal = 2975)
   OR (e.job = 'PRESIDENT' AND e.sal = 5000)
;
-- c) b ���� ���� ���� a�� ������ ��ü

SELECT  e.empno
       ,e.ename
       ,e.job
       ,e.sal
  FROM emp e
WHERE (e.job,e.sal) IN (SELECT e.job
                      , MAX(e.sal)
                  FROM emp e
                  GROUP BY e.job)
;
/*
==> ���ϴ� ���� �÷��� ������ ��ġ���� ������ �߻��ϴ� ��������
ORA-00913: ���� ���� �ʹ� �����ϴ�
00913. 00000 -  "too many values"
*/



-- 4. �� ���� �Ի��ο��� ���η� ����Ͻÿ�.
--    ��� ���� (����)
--   "�Ի��","�ο�(��)"
----------------------
--    1�� 3
--    2�� 2
--   ....
--   12�� 2
----------------------

SELECT TO_NUMBER(TO_CHAR(e.hiredate,'FMMM')) "�Ի��"
      ,COUNT(*) "�ο�(��)" 
  FROM emp e
 GROUP BY TO_NUMBER(TO_CHAR(e.hiredate,'FMMM'))
 ORDER BY "�Ի��"
;

-- ���� ����� FROM ���� ������ �� �� '��'�� �ٿ��� ��.
SELECT a."�Ի��"
      ,a."�ο�(��)"
  FROM (SELECT TO_NUMBER(TO_CHAR(e.hiredate,'FMMM')) "�Ի��"
      ,COUNT(*) "�ο�(��)" 
  FROM emp e
 GROUP BY TO_NUMBER(TO_CHAR(e.hiredate,'FMMM'))
 ORDER BY "�Ի��") a
;