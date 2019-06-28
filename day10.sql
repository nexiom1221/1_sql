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


-- OUTER JOIN ���� ����� ���� �μ���ȣ�� NULL �� ������ ����
/*
INSERT INTO "SCOTT"."EMP" (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL) VALUES ('7777', 'JJ', 'CLERK', '7902', TO_DATE('2019-06-27 13:09:13', 'YYYY-MM-DD HH24:MI:SS'), '900')
INSERT INTO "SCOTT"."EMP" (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM) VALUES ('8888', 'J_JAMES', 'SALESMAN', '7698', TO_DATE('2019-06-07 13:10:40', 'YYYY-MM-DD HH24:MI:SS'), '1250', '200')
COMMIT;
*/

-- 6) OUTER JOIN : ���� ��� ���̺��� ���� �÷��� NULL ���� �����͵�
--                 ����� ���� �� ����ϴ� ���� ���

-- ������ : (+), LEFT OUTER JOIN, RIGHT OUTER JOIN

------- 1.(+) : ����Ŭ������ ����ϴ� OUTER JOIN ������
--              EQUI-JOIN ���ǿ��� NULL �� ����� ���ϴ� �ʿ� �ٿ��� ���

-- ������ ������ �μ���� �Բ� ��ȸ
SELECT e.empno
      ,e.ename
      ,d.dname
  FROM emp e
      ,dept d
 WHERE e.deptno = d.deptno
;
-- JJ, J_JAMES �� e.deptno �� NULL �̹Ƿ� dept ���̺� ��ġ�ϴ� ���� �����Ƿ�
-- ���� ����� �� ������ ��ȸ���� �ʴ´�.

-- �μ� ��ġ�� ���� ���� ������ ��� ����� �ϰ� �ʹ�.
-- �׷����� dept ���̺����� �����Ͱ� NULL �̾ �߰� ����� �ʿ�.
-- �߰� ����� ���ϴ� �ʿ� (+) �����ڸ� ���δ�.
SELECT e.empno
      ,e.ename
      ,d.dname
  FROM emp e
      ,dept d
 WHERE e.deptno = d.deptno(+)
;
/*
EMPNO, ENAME,   DNAME
7782	CLARK	ACCOUNTING
7839	KING	ACCOUNTING
7934	MILLER	ACCOUNTING
7369	SMITH	RESEARCH
7566	JONES	RESEARCH
7902	FORD	RESEARCH
7499	ALLEN	SALES
7521	WARD	SALES
7654	MARTIN	SALES
7698	BLAKE	SALES
7844	TURNER	SALES
7900	JAMES	SALES
7777	JJ	
8888	J_JAMES	
*/

--(+) �����ڴ� �����ʿ� ���̴� NULL ���·� ��µ� �׿����� �������´�.
-- ��ü ������ ���ػ�� ���̺��� �����̱� ������
--LEFT OUTER JOIN �� �߻���.

-----2.  LEFT OUTER JOIN ~ON
SELECT e.empno
      ,e.ename
      ,d.dname
  FROM emp e LEFT OUTER JOIN dept d ON (e.deptno = d.deptno)
;
-- ON ���� ���� ���� ������ EQUI-JOIN �� ����������
-- LEFT OUTER JOIN �����ڿ� ����
-- �� ������ ���ʿ� ��ġ�� ���̺��� ��� �����ʹ� ����� ����޴´�.
-- ����� (+) �����ڸ� �����ʿ� ���� ����� ����


-- ����) ������ ���� �ƹ��� ��ġ���� ���� �μ��� �־ ��� �μ��� ��µǱ� �ٶ��
-- (+) �����ڷ� �ذ�
SELECT e.empno
      ,e.ename
      ,d.dname
  FROM emp e
      ,dept d
 WHERE e.deptno(+)=d.deptno
;

-- RIGHT JOIN ~ ON
SELECT e.empno
      ,e.ename
      ,d.dname
  FROM  emp e RIGHT OUTER JOIN dept d ON(e.deptno = d.deptno)
;
-- ON ������ EQUI-JOIN �� ������ ���� ������ ����
-- RIGHT OUTER JOIN ������ ������ ������ ���̺��� dept ���̺���
-- �����ʹ� ��� ����� ����޴´�.

---- 4. FULL OUTER JOIN :
-- ����) �μ� ��ġ�� �ȵ� ������ ��ȸ�ϰ� �Ͱ�
--       ������ �ƹ��� ���� �μ��� ��ȸ�ϰ� ������
--      ��,���� ��� ���� ���̺� �����ϴ� NULL ������
--      ��� �ѹ��� ��ȸ�Ϸ���?
SELECT e.empno
      ,e.ename
      ,d.dname
  FROM emp e
      ,dept d
 WHERE e.deptno(+)=d.deptno(+)
;
/*
ORA-01468: outer-join�� ���̺��� 1���� ������ �� �ֽ��ϴ�
01468. 00000 -  "a predicate may reference only one outer-joined table"
*Cause:    
*Action:
*/

-- FULL OUTER JOIN ~ ON �����ڸ� ����
SELECT e.empno
      ,e.ename
      ,d.dname
  FROM emp e FULL OUTER JOIN dept d ON e.deptno=d.deptno
;
/*
EMPNO,  ENAME,   DNAME
7369	SMITH	RESEARCH
7499	ALLEN	SALES
7521	WARD	SALES
7566	JONES	RESEARCH
7654	MARTIN	SALES
7698	BLAKE	SALES
7782	CLARK	ACCOUNTING
7839	KING	ACCOUNTING
7844	TURNER	SALES
7900	JAMES	SALES
7902	FORD	RESEARCH
7934	MILLER	ACCOUNTING
7777	JJ	
8888	J_JAMES	
		OPERATIONS
*/

-- ����) ������ �ƹ��� ���� �μ��� ��� ��ȸ�ϰ� �ʹ�.
-- dept ���̺��� ������ ��ġ�ؼ� ������ �Ŵ� ���
-- LEFT OUTER JOIN ���� �ذ�.
SELECT e.empno
      ,e.ename
  FROm dept d
       ,emp e
WHERE d.deptno = e.deptno(+)
;
/*
EMPNO, ENAME
7369	SMITH
7499	ALLEN
7521	WARD
7566	JONES
7654	MARTIN
7698	BLAKE
7782	CLARK
7839	KING
7844	TURNER
7900	JAMES
7902	FORD
7934	MILLER
*/

------ 5. SELF JOIN
--        :�� ���̺� ������ �ڱ� �ڽ��� �÷����� �����Ͽ�
--        :������ �� ���� ����� ���
-- ����) emp ���̺� ���� ������ ��ȸ�ҋ�
-- �� ������ ��� �̸��� ���� ��ȸ�ϰ� �ʹ�.
SELECT e.empno ���
      ,e.ename �̸�
      ,e.mgr "��� ���"
      ,e1.ename "��� �̸�"
  FROM emp e
      ,emp e1
 WHERE e.mgr = e1.empno
;

/*
���, �̸�, ��� ���, ��� �̸�
7902	FORD	7566	JONES
7499	ALLEN	7698	BLAKE
7521	WARD	7698	BLAKE
7654	MARTIN	7698	BLAKE
7844	TURNER	7698	BLAKE
7900	JAMES	7698	BLAKE
8888	J_JAMES	7698	BLAKE
7934	MILLER	7782	CLARK
7566	JONES	7839	KING
7698	BLAKE	7839	KING
7782	CLARK	7839	KING
7369	SMITH	7902	FORD
7777	JJ	    7902	FORD
*/

-- ���� ����� SELF-JOIN �̸鼭 EQUI-JOIN �̱� ������
-- ��簡 ���� ������ ��ȸ���� �ʴ´�.
-- KING �� ��ȸ���� ����.

-- ��簡 ���� ������ ��ȸ�ϰ� ������
-- a) e���̺� �������� ��� �����Ͱ� ��ȸ�Ǿ�� ��
-- b) (+) ��ȣ�� �����ʿ� ���̰ų�
SELECT e.empno ���
      ,e.ename �̸�
      ,e.mgr "��� ���"
      ,e1.ename "��� �̸�"
  FROM emp e
      ,emp e1
 WHERE e.mgr = e1.empno(+)
;
-- c) LEFT OUTER JOIN ~ ON �� ���
SELECT e.empno ���
      ,e.ename �̸�
      ,e.mgr "��� ���"
      ,e1.ename "��� �̸�"
  FROM emp e LEFT OUTER JOIN emp e1 ON e.mgr = e1.empno
;

-- ���� ������ ���� ������ ��ȸ
SELECT e.empno ���
      ,e.ename �̸�
      ,e.mgr "��� ���"
      ,e1.ename "��� �̸�"
  FROM emp e
      ,emp e1
 WHERE e.mgr(+) = e1.empno
ORDER BY "���" DESC
;
/*
���, �̸�, ��� ���, ��� �̸�
			            MARTIN
			            MILLER
			            SMITH
			            JAMES
			            TURNER
                        WARD
                        JJ
                        J_JAMES
			            ALLEN
8888	J_JAMES	7698	BLAKE
7934	MILLER	7782	CLARK
7902	FORD	7566	JONES
7900	JAMES	7698	BLAKE
7844	TURNER	7698	BLAKE
7782	CLARK	7839	KING
7777	JJ	    7902	FORD
7698	BLAKE	7839	KING
7654	MARTIN	7698	BLAKE
7566	JONES	7839	KING
7521	WARD	7698	BLAKE
7499	ALLEN	7698	BLAKE
7369	SMITH	7902	FORD
*/
-- RIGHT OUTER JOIN ~ ON ���� ����
SELECT e.empno ���
      ,e.ename �̸�
      ,e.mgr "��� ���"
      ,e1.ename "��� �̸�"
  FROM emp e RIGHT OUTER JOIN emp e1 ON e.mgr = e1.empno
ORDER BY "���" DESC
;

-- ������ �ǽ� ����)
--1. ���, �̸�, ����, ����̸�, �μ���, �μ���ġ
-- emp e, emp e1, dept d
SELECT   e.empno ���
        ,e.ename �̸�
        ,e.job ����
        ,e1.ename ����̸�
        ,d.dname �μ��̸�
        ,d.loc �μ���ġ
  FROM emp e
      ,emp e1
      ,dept d
 WHERE e.ename = e1.ename AND e.deptno=d.deptno
 ORDER BY d.deptno
;
-- ���� ������ JOIN ~ ON ���� ����
SELECT   e.empno ���
        ,e.ename �̸�
        ,e.job ����
        ,e1.ename ����̸�
        ,d.dname �μ��̸�
        ,d.loc �μ���ġ
  FROM emp e JOIN emp e1 ON (e.mgr = e1.empno) 
             JOIN dept d ON (e.deptno = d.deptno)
 ORDER BY d.deptno
;
-- ��簡 ���ų�, �μ��� �������� �ʴ� ������ ��� ����Ͻÿ�.
-- (+) �����ڷ� �ذ�
SELECT   e.empno ���
        ,NVL(e1.ename,'-') �̸�
        ,NVL(e.job,'-') ����
        ,NVL(e1.ename,'-') ����̸�
        ,NVL(d.dname,'-') �μ��̸�
        ,NVL(d.loc,'-') �μ���ġ
        
        
  FROM emp e
      ,emp e1
      ,dept d
 WHERE e.ename(+) = e1.ename AND e.deptno(+) = d.deptno
 ORDER BY d.deptno
;
-- LEFT OUTER JOIN ~ ON ���� �ذ�
SELECT   e.empno ���
        ,e.ename �̸�
        ,e.job ����
        ,NVL(e1.ename,'-') ����̸�
        ,NVL(d.dname,'-') �μ��̸�
        ,NVL(d.loc,'-') �μ���ġ
  FROM emp e LEFT OUTER JOIN emp e1 ON (e.mgr = e1.empno) 
             LEFT OUTER JOIN dept d ON (e.deptno = d.deptno)
 ORDER BY d.deptno
;
-- ��簡 ���ų�, �μ��� �������� ���� ������ ��� ����ϸ�
-- ��簡 ���� �� ����̸� ��� '-' ��
-- �μ��� �������� �ʾ��� �� �μ���, �μ���ġ ���
-- '-' �� ��µǵ��� �Ͻÿ�


-- 2. ���, �̸�, �޿�, �޿����, �μ���, �μ���ġ �� ��ȸ�Ͻÿ�.
-- emp e, dept d, salgrade s
SELECT   e.empno ���
        ,e.ename �̸�
        ,e.sal �޿�
        ,s.grade �޿����
        ,d.dname �μ���
        ,d.loc �μ���ġ
  FROM emp e
      ,dept d
      ,salgrade s
 WHERE e.sal BETWEEN s.losal AND s.hisal
;

-- JOIN ~ ON ���� ����
SELECT   e.empno ���
        ,e.ename �̸�
        ,e.sal �޿�
        ,s.grade �޿����
        ,d.dname �μ���
        ,d.loc �μ���ġ
  FROM emp e JOIN dept d ON (e.deptno = d.deptno)
             JOIN salgrade s ON (e.sal BETWEEN s.losal AND s.hisal)
;

-- �μ��� �������� ���� ������ ��� ����Ͻÿ�.
-- (+) �����ڷ� �ذ�
SELECT   e.empno ���
        ,e.ename �̸�
        ,e.sal �޿�
        ,s.grade �޿����
        ,d.dname �μ���
        ,d.loc �μ���ġ
  FROM emp e
      ,dept d
      ,salgrade s
 WHERE e.sal BETWEEN s.losal AND s.hisal
;
-- lEFT OUTER JOIN ~ ON ���� �ذ�
SELECT   e.empno ���
        ,e.ename �̸�
        ,e.sal �޿�
        ,s.grade �޿����
        ,NVL(d.dname,'-') �μ���
        ,NVL(d.loc,'-') �μ���ġ
  FROM emp e LEFT OUTER JOIN dept d ON (e.deptno = d.deptno)
             LEFT OUTER JOIN salgrade s ON (e.sal BETWEEN s.losal AND s.hisal)
;
-- �μ��� �������� ���� ������
-- �μ���, �μ���ġ ��� '-' �� ��µǵ��� �Ͻÿ�.

-- 2.4) �μ��� �Ҽ� �ο��� ����Ͻÿ�.
--      �̶� �μ� ������ ����Ͻÿ�.
--      ���� ������ ���� �μ��� ����Ͻÿ�.
SELECT   NVL(d.dname,'�μ� �̹���') "�μ� ��"
        ,count(e.empno) "�ο� ��"           
  FROM emp e FULL OUTER JOIN dept d ON (e.deptno = d.deptno)
  GROUP BY d.dname
  ORDER BY d.dname
;   