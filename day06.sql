--  day 06
--  2) �����Լ�
---------1. INITACP(str) : str �� ù ���ڸ� �빮��ȭ(����)
SELECT initcap('the watch ')
  FROM dual
;
SELECT initcap('�ȳ��ϼ���. ������') -- �ȳ��ϼ���. ������
  FROM dual
;

----------2. LOWER(str) : str �� ��� ���ڸ� �ҹ���ȭ(����)
SELECT lower('MR.SCOTT MCMILLAN') "�ҹ��ڷ� ����"
  FROm dual
;
-- mr. scott mcmillan

----------3. UPPER(str) : str �� ��� ���ڸ� �빮��ȭ(����)

SELECT upper('lee') "���� �빮�ڷ� ����"
  FROM dual
;

SELECT upper('sql is coooooooooooooooooooool~!!!') "��վ��!"
  FROm dual
;

--smith �� ã�µ� �Է��� �ҹ��ڷ� �� ��쿡
--SMITH �� �ٸ� ���ڷ� �νĵǹǷ� ã���� ����.
SELECT   e.empno
        ,e.ename
  FROM   emp e
 WHERE   e.ename = 'smith'
;
-- ����� ��� �� :0
SELECT   e.empno
        ,e.ename
  FROM   emp e
 WHERE   e.ename = 'SMITH'
;
--ename �� ���ϴ� ���� �빮�� �̹Ƿ� ������ ��ȸ ��.
SELECT   e.empno
        ,e.ename
  FROM   emp e
 WHERE   e.ename = upper('smith')
;
/*
EMPNO, ENAME
---------------
7369	SMITH
*/

-----------4.  LENGTH(str),LENGTHB(str) :
--             str�� ���ڱ���, ������ byte�� ����Ͽ� ���ڷ� ���
SELECT length('hello, sql') as "���� ����"
  FROM dual
;
-- 10 : Ư����ȣ, ���鵵 ���� ���̷� ���
SELECT 'hello, sql �� ���� ���̴�' || length('hello, sql') 
                                   || ' �Դϴ�' "���� ����"
  FROM dual
;
/*
���� ����
---------------------------------
hello, sql �� ���� ���̴� �Դϴ�
*/

----- oracle���� �ѱ��� 3byte�� ���
SELECT lengthb('hello, sql') "���� byte"
  FROM dual
;
-- 10 => �����ڴ� 1byte �Ҵ�
SELECT lengthb('����Ŭ') "���� byte"
  FROM dual
;
-- 9 => �ѱ��� 3byte �Ҵ�

--------5. CONCAT(str1, str2) : str1�� str2�� ���ڿ� ����
--                              || �����ڿ� ������ ���
SELECT concat('�ȳ��ϼ���.','SQL!') "�λ�"
  FROM dual
;
/*
�λ�
---------------
�ȳ��ϼ���.SQL!
*/
--concat('�ȳ��ϼ���.','SQL') �� ���� ����� ���� || ���� ���
SELECT '�ȳ��ϼ���.' || 'SQL!' "�λ�"
  FROM dual
;

----------6. SUBSTR(str, i, n) :
--           str ���� i��° ��ġ������ n���� ���ڸ� ����
--           SQL ���� ���ڿ��� �ε���(����)�� 1���� ����
SELECT substr('SQL is coooooooool~!!', 3, 4)
  FROM dual
;
/*
SUBSTR('SQLISCOOOOOOOOOL~!!',3,4)
L is
*/
------ SUBSTR(str, i) :
--     str ���� i��° ��ġ���� ������ ����
SELECT substr('SQL is coooooooool~!!', 3)
  FROM dual
;
/*
SUBSTR('SQLISCOOOOOOOOOL~!!',3)
L is coooooooool~!!
*/
-- ���� : SQL is coooooooool~~!! ���� SQL �� �����غ���
-- ���� : SQL is coooooooool~~!! ���� is �� �����غ���
-- ���� : SQL is coooooooool~~!! ���� ~~ �� �����غ���
SELECT substr('SQL is coooooooool~~!!',1,3)
  FROM dual
;
SELECT substr('SQL is coooooooool~~!!',5,2)
  FROM dual
;
SELECT substr('SQL is coooooooool~~!!',19,2)
  FROM dual
;

-- ���� : emp ���̺��� ������ �̸��� �� �α��ڱ����� �����Ͽ�
--        ����� �Բ� ��ȸ�Ͻÿ�.
SELECT  substr(ename,1,2)
        ,empno  
  FROM   emp 
;
/*
SUBSTR(ENAME,1,2), EMPNO
SM	7369
AL	7499
WA	7521
JO	7566
MA	7654
BL	7698
CL	7782
KI	7839
TU	7844
JA	7900
FO	7902
MI	7934
J_	9999
J%	8888
*/

-------- 7. INSTR(str1,str2) : 
--                              �ι��� ���ڿ��� str2��
--                              ù��° ���ڿ��� str1�� ��� ��ġ�ϴ���
--                              �����ϴ� ��ġ�� ����Ͽ� ���ڷ� ���
SELECT instr('SQL is coooooooool~~!!','io') "io�� ��ġ"
  FROM dual
;
/* �ι��� ���ڿ��� ù��° ���ڿ��� ������ 0�� ����Ѵ�.
io�� ��ġ
---------
0
*/

--------- 8. LPAD, RPAD(str, n, c)
--           �Էµ� str�� ���ؼ� ��ü ���ڰ� ������ �ڸ����� n���� ���
--           ��ü ���ڼ� ��� ���� / �����ʿ� ���� �ڸ�����
--           c�� ���ڸ� ä���ִ´�.
SELECT lpad('SQL is cooll', 20, '*')
  FROM dual
;
/* ********SQL is cooll */

SELECT rpad('SQL is cooll', 20, '*')
  FROM dual
;
/*
SQL is cooll********
*/

-------------9. LTRIM,RTRIM, TRIM : �Էµ� ���ڿ���
--               ���� , ������ ,���� ������ ����
SELECT '>' || ltrim('     sql is cool      ') || '<'
  FROM dual
;
/*
>sql is cool      <
*/
SELECT '>' || rtrim('     sql is cool      ') || '<'
  FROM dual
;
/*
>     sql is cool<
*/
SELECT '>' || trim('     sql is cool      ') || '<'
  FROM dual
;
/*
>sql is cool<
*/

--
SELECT   e.empno
        ,e.ename
  FROM   emp e
 WHERE   e.ename = '  SMITH '
;
-- ����� ��� ��:0 ==> ' SMITH' ������ �� ���� 'SMITH'�� �ٸ��Ƿ�
--                          SMITH ������ ��ȸ���� ����

SELECT   e.empno
        ,e.ename
  FROM   emp e
 WHERE   e.ename =trim( '  SMITH ')
;
/*
EMPNO, ENAME
7369	SMITH
*/

--  ' SMITH ' ���� trim �Լ��� �����Ͽ� ��ȸ ����

--  ���� : �񱳰��� ' smith ' �� �� SMITH �� ������ ��ȸ �Ϸ���
SELECT   e.empno
        ,e.ename
  FROM   emp e
 WHERE   e.ename =UPPER(trim( '  smith '))
; 
/*
7369	SMITH
*/

-------- 10. NVL(expr1, expr2)
--           NVL2(expr1, expr2, expr3)
--           NULLIF(expr1, expr2)

--NVL(expr1, expr2) : ù���� ���� ���� NULL �̸�
--                    �ι�° ������ ��ü �Ͽ� ���
--�Ŵ���(mgr)�� �������� ���� ������ ���
--�Ŵ����� ����� 0���� ��ü�Ͽ� ���
SELECT   e.empno
        ,e.ename
        ,e.mgr
        ,nvl(e.mgr,0) "�Ŵ��� ���"
  FROM   emp e
; 
/*
EMPNO, ENAME,   MGR,   �Ŵ��� ���
7369	SMITH	7902	7902
7499	ALLEN	7698	7698
7521	WARD	7698	7698
7566	JONES	7839	7839
7654	MARTIN	7698	7698
7698	BLAKE	7839	7839
7782	CLARK	7839	7839
7839	KING		0
7844	TURNER	7698	7698
7900	JAMES	7698	7698
7902	FORD	7566	7566
7934	MILLER	7782	7782
9999	J_JAMES		0
8888	J%JAMES		0
*/

-- �Ŵ���(gmr)�� �������� ���� ������
-- '�Ŵ��� ����' �̶�� ����Ͻÿ�.
SELECT   e.empno
        ,e.ename
        ,e.mgr
        ,nvl(e.mgr,'����') "�Ŵ��� ���"
  FROM   emp e
;
/*
ORA-01722: ��ġ�� �������մϴ�
01722. 00000 -  "invalid number"
*Cause:    The specified number was invalid.
*Action:   Specify a valid number.
==> nvl ó�� ��� �÷��� e.mgr �� ����Ÿ���� �������ε�
-- NULL ���� ��ü�ϴ� '�Ŵ��� ����'�� ����Ÿ���� ������ �̹Ƿ�
-- ��ȯ�� mgr �÷��� Ÿ�԰� ����ġ�ϱ� ������
-- ����� ���� ������ �߻�
*/
-- ==> �ذ��� e.mgr �� ����Ÿ������ ����
SELECT   e.empno
        ,e.ename
        ,e.mgr
        ,nvl(e.mgr|| '','����') "�Ŵ��� ���"
  FROM   emp e
;
-- || ���տ����ڷ� mgr �� ���ڸ� �ٿ��� ����Ÿ������ ����
/*
EMPNO, ENAME,   MGR,   �Ŵ��� ���
7369	SMITH	7902	7902
7499	ALLEN	7698	7698
7521	WARD	7698	7698
7566	JONES	7839	7839
7654	MARTIN	7698	7698
7698	BLAKE	7839	7839
7782	CLARK	7839	7839
7839	KING		����
7844	TURNER	7698	7698
7900	JAMES	7698	7698
7902	FORD	7566	7566
7934	MILLER	7782	7782
9999	J_JAMES		����
8888	J%JAMES		����
*/

-- ���� : || ������ ��� concat() �Լ��� ����Ͽ� ����� ���ÿ�.
SELECT   e.empno
        ,e.ename
        ,e.mgr
        ,nvl(concat(e.mgr,''),'����') "�Ŵ��� ���"
  FROM   emp e
;

-- ����Ŭ ������ �� ���ڿ�('') �� NULL�� ���


-- NVL2(expr1, expr2, expr3) :
-- ù���� ���� ���� NOT NULL �̸� �ι�° ���� ������ ���
--                  NULL �̸� ����° ���� ������ ���

--�Ŵ���(mrg)�� ������ ��쿡�� '�Ŵ��� ����' ����
--�Ŵ����� �������� ���� ��쿡�� '�Ŵ��� ����' ���� ���
SELECT   e.empno
        ,e.ename
        ,e.mgr
        ,nvl2(e.mgr,'�Ŵ��� ����','�Ŵ��� ����') "�Ŵ��� ��/��"
  FROM   emp e
;
/*
EMPNO, ENAME,   MGR,   �Ŵ��� ��/��
7369	SMITH	7902	�Ŵ��� ����
7499	ALLEN	7698	�Ŵ��� ����
7521	WARD	7698	�Ŵ��� ����
7566	JONES	7839	�Ŵ��� ����
7654	MARTIN	7698	�Ŵ��� ����
7698	BLAKE	7839	�Ŵ��� ����
7782	CLARK	7839	�Ŵ��� ����
7839	KING		     �Ŵ��� ����
7844	TURNER	7698	�Ŵ��� ����
7900	JAMES	7698	�Ŵ��� ����
7902	FORD	7566	�Ŵ��� ����
7934	MILLER	7782	�Ŵ��� ����
9999	J_JAMES		   �Ŵ��� ����
8888	J%JAMES		    �Ŵ��� ����
*/

-- ����Ŭ���� �� ���ڿ�('')�� NULL �� ����ϴ� ����
-- Ȯ���ϱ� ���� ����
-- �Է��� ���ڿ�
SELECT nvl2('','IS NOT NULL','IS NULL')
  FROM dual
;
/*
NVL2('','ISNOTNULL','ISNULL')
IS NULL
*/
--�Է��� ���� 1ĭ ¥�� ����
SELECT nvl2(' ','IS NOT NULL','IS NULL') "NULL �� ����"
  FROM dual
;
/*
NULL �� ����
IS NOT NULL
*/

--NULLIF(expr1,expr2) :
-- ù���� �� ,�ι�° ���� ���� �����ϸ� NULL�� ���
-- �� ���� �ٸ��� ù��° ���� ���� ���
SELECT nullif('AAA','bbb') as NULLIF��� --AAA
FROM dual
;

SELECT nullif('AAA','AAA') as NULLIF���
FROM dual
;
/*
NULLIF���
-----------
(null)
*/
-- ��ȸ�� ��� ���� 1���� �����ϰ� �� ���� NULL�� ����
-- 1���̶� ��ȸ�� �� ���� "����� ��� ��:0" �� �ٸ��ٴ� �Ϳ� ����

----------3) ��¥�Լ� : ��¥�� ���õ� ���/ ��¥�� ���ϱ� ���� ���� ������
--                      �� ���ִ� ����� ����

--������ �ý��� �ð��� ��� sysdate �Լ�
SELECT sysdate
  FROM dual
;
/*
SYSDATE
-----------
19/05/24 ==> ����Ŭ�� ��¥ �⺻ ���� YY/MM/DD
*/

--TO_CHAR(arg) : arg�� ����,��¥ Ÿ���� �����Ͱ� �� �� �ִ�.
--              �Էµ� arg�� ����Ÿ������ �������ִ� �Լ�
SELECT to_char(sysdate,'YYYY') "��"
  FROM dual
;
SELECT to_char(sysdate,'YY') "��"
  FROM dual
;
SELECT to_char(sysdate,'MONTH') "��"
  FROM dual
;
SELECT to_char(sysdate,'DD') "��"
  FROM dual
;
SELECT to_char(sysdate,'DAY') "����"
  FROM dual
;
SELECT to_char(sysdate,'DY') "����"
  FROM dual
;
SELECT to_char(sysdate,'YYYY-MM-DD') "���� ��¥"
  FROM dual
;
SELECT to_char(sysdate,'FMYYYY-MM-DD') "���� ��¥"
  FROM dual
;
SELECT to_char(sysdate,'YY-MON-DD DY') "���� ��¥"
  FROM dual
;
SELECT to_char(sysdate,'YYYY-MM-DD DAY') "���� ��¥"
  FROM dual
;

/* �ð� ���� :
    HH : �ð��� ���ڸ��� ǥ��
    MI : ���� ���ڸ��� ǥ��
    SS : �ʸ� ���ڸ��� ǥ��
    HH@4 : �ð��� 24�ð� ü��� ǥ��
    AM : �������� �������� ǥ��
*/
SELECT to_char(sysdate,'YYYY--MM-DD HH24:MI:SS') "���� ��¥ �ú���"
  FROM dual
;
/*
���� ��¥ �ú���
2019--05-24 15:30:01
*/
SELECT to_char(sysdate,'YYYY--MM-DD AM HH:MI:SS') "���� ��¥ �ú���"
  FROM dual
;
-- 2019--05-24 ���� 03:42:38 <== AM ���Ϲ��ڸ� �����ϸ� ����/���� ������

-- ��¥ ���� ������ ���� : +,- �����ڸ� ���
-- �������κ��� 10�� ��
SELECT sysdate + 10
  FROM dual
;
--19/06/03 (���� ��¥ : 19/05/24 �� ��)

--10�� ��
SELECT sysdate - 10
  FROM dual
;
--19/05/14

--10�ð� ��
SELECT sysdate + 10/24
  FROM dual
;
-- 19/05/25
SELECT to_char(sysdate + 10/24, 'YYYY-MM-DD HH24:MI:SS')
  FROM dual
;
-- 2019-05-25 01:47:07

----------------1. MONTHS_BETWEEN(��¥1, ��¥2) :
--                  �� ��¥ ������ ���� ����
-- �� ������ �Ի��� ���κ��� ������� ����� �ٹ��ߴ��� ��ȸ�Ͻÿ�.
SELECT  e.empno
        ,e.ename
        ,MONTHS_BETWEEN(sysdate,e.hiredate) "�ټ� ������"
  FROM emp e
;

-- �� ������ �ټ� �������� ���ϵ�
-- �Ҽ��� 1�� �ڸ������� ����Ͻÿ�.
SELECT e.empno
        ,e.ename
        ,ROUND(MONTHS_BETWEEN(sysdate,e.hiredate),1) "�ټ� ���� ��"
  FROM emp e
;
/*
EMPNO, ENAME, �ټ� ���� ��
7369	SMITH	461.2
7499	ALLEN	459.2
7521	WARD	459.1
7566	JONES	457.7
7654	MARTIN	451.9
7698	BLAKE	456.8
7782	CLARK	455.5
7839	KING	450.2
7844	TURNER	452.5
7900	JAMES	449.7
7902	FORD	449.7
7934	MILLER	448.1
9999	J_JAMES	
8888	J%JAMES	
*/

-------------2. ADD_MONTHS(��¥, ����) :
--              ��¥�� ���ڸ� ���Ѹ�ŭ ���� ��¥�� ����
SELECT add_months(sysdate,3)
  FROM dual
;
-- ��¥ + ���� : ���� ��ŭ�� �� ���� ���Ͽ� ��¥�� ����
-- ��¥ + ����/24 : ���� ��ŭ�� �ð��� ���Ͽ� ��¥�� ����
-- ADD_MONTHS(��¥, ����) : ���� ��ŭ�� ���� ���Ͽ� ��¥�� ����


------- 3. NEXT_DAY, LAST_DAY
--          ���� ���Ͽ� �ش��ϴ� ��¥�� ����
--          �̴��� ������ ��¥�� ����
-- ���� ��¥���� ���ƿ��� ��(4) ������ ��¥�� ����
SELECT next_day(sysdate,'������') "���ƿ��� ������" 
  FROM dual
;

SELECT last_day(sysdate) "�� ���� ������ ��"
  FROM dual
;

---------4. ROUND, TRUNC : ��¥�� ���� �ݿø�,���� ����
SELECT round(sysdate) "���� �ð�"
  FROM dual
;
--���� : ���� �ð����� �ݿø� �� ��¥�� ��/��/�� ���� ���
SELECT round(to_char(sysdate,'YYYY-MM-DD HH24:MI:SS')) "���� �ð�"
  FROM dual
;