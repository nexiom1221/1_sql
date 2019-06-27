-- day 10
----- 7. ���ΰ� ��������
-- (1) ���� : JOIN
--      �ϳ� �̻��� ���̺��� �������� ��� �ϳ��� ���̺��� �� ó�� �ٷ�� ���
--      ������ �߻���Ű���� FROM ���� ���ο� ����� ���̺��� ����

-- ����) ������ �Ҽ� �μ� ��ȣ�� �ƴ� �μ� ���� ���� ��ȸ�ϰ� �ʹ�.
-- a) FROM ���� ���̺��� ����
--    emp, dept �� ���̺��� ���� ==> ������ �߻� ==> �� ���̺��� ��� ����
/* 7777, 8888, 9999 �������� ����
DELETE FROM "SCOTT"."EMP" WHERE ROWID = 'AAAR9ZAAHAAAACXAAA' AND ORA_ROWSCN = '4770176' and ( "EMPNO" is null or "EMPNO" is not null )

*/

-- a) FROM ���� ���̺� ������ ���� �߻�
SELECT  e.empno
      , e.ename
      , e.deptno
      , '|' "������"
      , d.deptno
      , d.dname
  FROM  emp e
      , dept d
;

-- ==> (emp)12 x (dept)4 = 48 ���� �����Ͱ� �������� ����

-- b) ���� ������ �߰��Ǿ�� ������ �ҼӺμ��� ��Ȯ�� ������ �� �ִ�.
SELECT  e.empno
      , e.ename
      , e.deptno
      , '|' "������"
      , d.deptno
      , d.dname
  FROM  emp e
      , dept d
 WHERE e.deptno = d.deptno -- ����Ŭ�� �������� ���� ���� �ۼ� ���
 ORDER BY d.deptno
;

-- ���, �̸�, �μ��� �� �����
SELECT  e.empno
      , e.ename
      , d.dname
  FROM  emp e
      , dept d
 WHERE e.deptno = d.deptno -- ����Ŭ�� �������� ���� ���� �ۼ� ���
 ORDER BY d.deptno
;

-- ���� �����ڸ� ����Ͽ� ����(�ٸ� DBMS ���� �ַ� ���)
SELECT  e.empno
      , e.ename
      , d.dname
  FROM  emp e JOIN dept d ON (e.deptno = d.deptno)
 ORDER BY d.deptno
;

-- ���� ������� ACCOUNTING �μ� ������ �˰� �ʹ�.
-- 10�μ� ������ ��ȸ�Ͽ���
SELECT e.empno
      ,e.ename
  FROM emp e
 WHERE e.deptno = 10
;

SELECT  e.empno
      , e.ename
      , d.dname
  FROM  emp e
      , dept d
 WHERE e.deptno = d.deptno -- ���� ���� 
   AND d.dname = 'ACCOUNTING' -- �Ϲ� ����
;

-- ACCOUNTING �μ� �Ҽ��� ���� ��ȸ��
-- ���� �����ڸ� ����� ������ �����غ�����.

SELECT  e.empno
       ,e.ename
       ,d.dname
  FROM emp e JOIN dept d ON (e.deptno = d.deptno) AND d.dname = 'ACCOUNTING'
;

-- 2) ���� : īƼ�� ��(īƼ�� ����)
--           ���� ��� ���̺��� �����͸� ������ ��� �������� ���� ��
--           WHERE ���� ���� ���� ������ �߻�
--           CROSS JOIN �����ڷ� �߻���Ŵ(����Ŭ 9i ���� ���ķ� ��밡��)

-- emp, dept, salgrade �� ���� ���̺�� īƼ�� �� �߻�
SELECT e.ename
      ,d.dname
      ,s.grade
  FROM emp e
      ,dept d
      ,salgrade s
;

-- ==> 12 x 4 x 5 = 240 ���� ��� �߻�

-- CROSS JOIN �����ڸ� ����ϸ�
SELECT e.ename
      ,d.dname
      ,s.grade
  FROM emp e CROSS JOIN dept d
             CROSS JOIN salgrade s
;

-- 3) EQUI JOIN : ������ ���� �⺻ ����
--                ���� ��� ���̺� ������ ���� �÷��� '='�� ����
--                ���� �÷��� (join-attribute)��� �θ�
-- a) ����Ŭ ���������� WHERE �� ù��° �ٿ� ���� ������ �ִ� ���
SELECT e.ename
      ,d.dname
      ,s.grade
  FROM emp e
      ,dept d
 WHERE e.deptno = d.deptno
;

-- b) JOIN ~ ON
SELECT  e.empno
       ,e.ename
       ,d.dname
  FROM emp e JOIN dept d ON (e.deptno = d.deptno)
;

-- c) NATURAL JOIN Ű����� �ڵ� ����
--   : ON ���� ����
--   join-attribute �� ����Ŭ DBMS�� �ڵ����� �Ǵ�
SELECT  e.empno
       ,e.ename
       ,d.dname
  FROM emp e NATURAL JOIN dept d
;

-- d) JOIN ~ USING
SELECT  e.empno
       ,e.ename
       ,d.dname
  FROM emp e JOIN dept d USING(deptno)
;
-- USING �ڿ� ���� �÷��� ��Ī ���� ���

-- 4) �� ���� EQUI-JOIN ���� �ۼ� ��
-- a) ����Ŭ ���� ���� ����
SELECT [��Ī1.]�÷���1, [��Ī2.]�÷���2 [, .....]
  FROM ���̺�1 ��Ī1, ���̺�2 ��Ī2 [, ...]
 WHERE ��Ī1.�����÷�1 = ��Ī2.�����÷�1 --�������� WHERE ����
 [AND ��Ī1.�����÷�2 = ��Īn.�����÷�2] --���� ��� ���̺��� �������� ���
 [AND ...] --WHERE ���� �����Ǵ� �������ǵ� �þ
;
-- b) JOIN ~ ON
SELECT [��Ī1.]�÷���1, [��Ī2.]�÷���2 [, .....]
  FROM ���̺�1 ��Ī1 JOIN ���̺�2 ��Ī2 ON (��Ī1.�����÷�1 = ��Ī2.�����÷�1)
                    [JOIN ���̺�3 ��Ī3 ON (��Ī1.�����÷�2 = ��Ī3.�����÷�2)]
                    [JOIN ���̺�3 ��Ī3 ON (��Īn-1.�����÷�n-1 = ��Īn.�����÷�n)]
    [WHERE �Ϲ�����]
    [AND �Ϲ�����]
;
-- c) NATURAL JOIN
SELECT [��Ī1.]�÷���1, [��Ī2.]�÷���2 [, .....]
  FROM ���̺�1 ��Ī1 NATURAL JOIN ���̺�2 ��Ī2
                    [NATURAL JOIN ���̺�n ��Īn]
;
-- d) JOIN ~ USING
SELECT [��Ī1.]�÷���1, [��Ī2.]�÷���2 [, .....]
  FROM ���̺�1 ��Ī1 JOIN ���̺�2 ��Ī2 USING (�����÷�)
                    [JOIN ���̺�n ��Īn USING (�����÷�)] --��Ī ������
;

--------------------------------------------------
-- 5) NON-EQUI JOIN : WHERE �������� join-attribute ����ϴ� ���
--                    �ٸ� �� �����ڸ� ����Ͽ� ���� ���̺��� ���� ���
-- ����) emp, salgrade ���̺��� ����ؼ� ������ �޿���
SELECT e.empno
      ,e.ename
      ,e.sal
      ,s.grade
  FROM emp e
      ,salgrade s
 WHERE e.sal BETWEEN s.losal AND s.hisal
 ;
 -- emp ���̺��� salgrade ���̺�� ���Ϻ� �ؼ�
 -- ������ �� �ִ� ���� ����. ���� EQUI-JOIN �Ұ���
 SELECT e.empno
      ,e.ename
      ,e.sal
      ,s.grade
  FROM emp e JOIN salgrade s ON (e.sal BETWEEN s.losal AND s.hisal)
;