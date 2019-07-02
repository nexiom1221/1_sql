-- day13

-------------------------------------
-- ����Ŭ�� Ư���� �÷� 2����
-- : ����ڰ� ���� �� ��� �ڵ����� �����Ǵ� �÷�

-- 1. ROWID : ���������� ���ũ�� ����� ��ġ�� ����Ű�� ��
--            ������ ��ġ�̹Ƿ� �� ��� �ݵ�� ������ ���� �� �ۿ� ����
--            ORDER BY ���� ���� ������� �ʴ� ��
-- 2. ROWNUM : ��ȸ�� ����� ù��° ����� 1�� �����ϴ� ��
--------------------------------------------------------

-- ��) emp ���̺��� 'SMITH' �� ��ȸ
SELECT e.empno
      ,e.ename
  FROM emp e
 WHERE e.ename = 'SMITH'
;

-- ROWID �� ���� ��ȸ
SELECT e.rowid
      ,e.empno
      ,e.ename
  FROM emp e
 WHERE e.ename = 'SMITH'
;

-- ROWNUM �� ���� ��ȸ
SELECT rownum
      ,e.empno
      ,e.ename
  FROM emp e
 WHERE e.ename = 'SMITH'
;


-- ORDER BY ���� ���� ROWNUM �� ����Ǵ� ��� Ȯ��
-- (1) ORDER BY �� ���� ���� ROWNUM
SELECT rownum
      ,e.empno
      ,e.ename
  FROM emp e
;

-- (2) ename ������ �������� ���� �� ROWNUM �� Ȯ��
SELECT rownum
      ,e.empno
      ,e.ename
  FROM emp e
ORDER BY e.ename
;

-- rownum�� ORDER BY ����� ������ ���� �ʴ� ��ó�� ���� �� ����.
-- sub-query �� ����� �� ������ ����.

-- (3) SUB-QUERY �� ���� �� ROWNUM �� �� Ȯ��
SELECT rownum 
      ,a.empno
      ,a.ename
      ,a.numrow
  FROM (SELECT rownum as numrow 
      ,e.empno
      ,e.ename
      FROM emp e
      ORDER BY e.ename) a
;

-- �̸��� A�� ���� ������� ��ȸ (ORDER BY ����)
SELECT ROWNUM
      ,e.ename
  FROM emp e
 WHERE e.ename LIKE '%A%'
;

-- �̸��� S �� ���� ������� ��ȸ
--SUB-QUERY �� ������ ���� ROWNUM,ROWID Ȯ��
SELECT ROWNUM
      ,a.rowid
      ,a.ename
  FROM (SELECT 
       e.rowid
      ,e.ename
  FROM emp e
 WHERE e.ename LIKE '%S%'
ORDER BY e.ename) a
;

-- ROWNUM ���� �� �� �ִ� ����
-- emp ���� �޿��� ���� �޴� ���� 5���� ��ȸ�Ͻÿ�.

-- 1. �޿��� ���� ���� ����
SELECT e.empno
      ,e.ename
      ,e.sal
  FROM emp e
ORDER BY e.sal DESC
;
-- 2. 1�� ����� SUB-QUERY �� FROM ���� ����Ͽ�
--    ROWNUM �� ���� ��ȸ
SELECT ROWNUM
      ,a.*
FROM (SELECT e.empno
      ,e.ename
      ,e.sal
      FROM emp e
      ORDER BY e.sal DESC) a
;
-- 3. �� ��, ROWNUM <= 5 ������ �߰�
SELECT ROWNUM
      ,a.*
FROM (SELECT e.empno
      ,e.ename
      ,e.sal
      FROM emp e
      ORDER BY e.sal DESC) a
 WHERE ROWNUM <= 5
;

--------------------------------
-- DML : ������ ���۾�
--------------------------------

-- 1) INSERT : ���̺� ������ ��(row)�� �߰��ϴ� ���
DROP TABLE member;
CREATE TABLE member
( member_id        VARCHAR2(4)  
 ,member_name      VARCHAR2(15) NOT NULL
 ,phone            VARCHAR2(4)  -- NULL ����Ϸ��� ���������� �Ⱦ��� �ȴ�.
 ,reg_date         DATE         DEFAULT sysdate
 ,address          VARCHAR2(30)   
 ,major            VARCHAR2(50)
 ,birth_month      NUMBER(2)
 ,gender           VARCHAR2(1)
 ,CONSTRAINT pk_member   PRIMARY KEY (member_id)
 ,CONSTRAINT ck_gender   CHECK (gender IN('M','F'))
 ,CONSTRAINT ck_birth    CHECK (birth_month BETWEEN 1 AND 12)
);

---- 1. INRO ������ �÷��̸� ������ ������ �߰�
--      : VALUES ���� �ݵ�� ��ü Į���� �����͸� ������� ��� ����

INSERT INTO MEMBER VALUES ('M001', '�ڼ���', '9155',sysdate, '������', '����', '3', 'M');
INSERT INTO MEMBER VALUES ('M002', '������', '1418',sysdate, '������', NULL, NULL, 'M');
INSERT INTO MEMBER VALUES ('M003', '�̺���', '0186',sysdate, NULL, NULL, '3', 'M');
INSERT INTO MEMBER VALUES ('M004', '�蹮��', NULL,sysdate, 'û�ֽ�', '�Ͼ�', '3', 'F');
INSERT INTO MEMBER VALUES ('M005', '����ȯ', '0322',sysdate, '�Ⱦ��', '����', '3', NULL);
COMMIT;

-- PK �������ǿ� ����Ǵ� ������ �߰� �õ�
INSERT INTO MEMBER
VALUES ('M005','ȫ�浿','0001',sysdate,'������','����',3,'M');
--���� ���� -
--ORA-00001: ���Ἲ ���� ����(SCOTT.PK_MEMBER)�� ����˴ϴ�

-- GENDER �÷��� CHECK ���������� �����ϴ� ������ �߰� �õ�
-- GENDER �÷��� 'F','M',NULL ���� ���� �߰��ϸ�
INSERT INTO MEMBER
VALUES ('M006','ȫ�浿','0001',sysdate,'������','����',3,'G')
;
--���� ���� -
--ORA-02290: üũ ��������(SCOTT.CK_GENDER)�� ����Ǿ����ϴ�

-- BIRTH_MONHT �÷��� 1~12���� ���ڰ� �Է� �õ�
INSERT INTO MEMBER
VALUES ('M006','ȫ�浿','0001',sysdate,'������','����',-1,'G');
--���� ���� -
--ORA-02290: üũ ��������(SCOTT.CK_GENDER)�� ����Ǿ����ϴ�

INSERT INTO MEMBER
VALUES ('M006','ȫ�浿','0001',sysdate,'������','����',5,'M');

--MEMBER_NAME�� NULL �Է½õ�
INSERT INTO MEMBER
VALUES ('M006',NULL,'0001',sysdate,'������','����',5,'M');
--���� ���� -
--ORA-01400: NULL�� ("SCOTT"."MEMBER"."MEMBER_NAME") �ȿ� ������ �� �����ϴ�

COMMIT;

--2. INTO ���� �÷� �̸��� ����� ����� ������ �߰�
--   :VALUES ���� INTO �� �������
--   ���� Ÿ��, ������ ���߾ �ۼ�
INSERT INTO MEMBER (member_id, member_name)
VALUES ('M007', '������')
;
COMMIT;

INSERT INTO MEMBER (member_id, member_name, gender)
VALUES ('M008', '������', 'M')
;
COMMIT;


--���̺� ���� ������ �������
--INTO ���� �÷��� ������ �� �ִ�.
INSERT INTO MEMBER (birth_month, member_name, member_id)
VALUES (7, '������', 'M009')
;
COMMIT;

-- INTO ���� �÷� ������ VALUES ���� ���� ���� ����ġ
INSERT INTO MEMBER (member_id, member_name)
VALUES ('M010', '���', 'M')
;
COMMIT;
/*
SQL ����: ORA-00913: ���� ���� �ʹ� �����ϴ�
00913. 00000 -  "too many values"
*/

INSERT INTO MEMBER (member_id, member_name, gender)
VALUES ('M010', '���')
;
COMMIT;
/*
SQL ����: ORA-00947: ���� ���� ������� �ʽ��ϴ�
00947. 00000 -  "not enough values"
*/

INSERT INTO MEMBER (member_id, member_name, gender)
VALUES ('M010', '���',7)
;
COMMIT;
/*
���� ���� -
ORA-02290: üũ ��������(SCOTT.CK_GENDER)�� ����Ǿ����ϴ�
*/

INSERT INTO MEMBER (member_id, member_name, birth_month)
VALUES ('M010', '���','�Ѿ�')
;
/*���� ���� -
ORA-01722: ��ġ�� �������մϴ�
*/

-- �ʼ� �Է� �÷��� �������� ���� ��
-- member_id : PK, member_name : NOT NULL
INSERT INTO MEMBER (birth_month, address, gender)
VALUES (12, '��������', 'F')
;
/*
���� ���� -
ORA-01400: NULL�� ("SCOTT"."MEMBER"."MEMBER_ID") �ȿ� ������ �� �����ϴ�
*/

---------------------------------------------------------------------------------
-- ���� �� �Է� : SUB-QUERY �� ����Ͽ� ����

-- ��������
INSERT INTO ���̺��̸�
--SELECT ����; -- ��������

/*
CREATE TABLE ���̺��̸�
AS
SELECT ....

 : ���������� �����͸� �����ϸ鼭 �� ���̺��� ����
 
 vs.

 INSERT INTO ���̺��̸�
 SELECT ����;
  : �̹� ������� ���̺� �����͸� �����ؼ� �߰�
  
  */
  
-- new_member ����
DROP TABLE new_member;

-- member �����ؼ� ���̺� ����
CREATE TABLE new_member
AS
SELECT m.*
  FROM member m
 WHERE 1 = 2
 ;
 -- Table new_member�� �����Ǿ����ϴ�.
 
 -- ���� �� �Է� ���������� new_member ���̺� ������ �߰�
INSERT INTO new_member
SELECT m.*
  FROM member m
 WHERE m.member_name LIKE '_��_'
;

-- �÷��� ����� ������ �Է�
INSERT INTO new_member (member_id, member_name, phone)
SELECT m.member_id
      ,m.member-name
      ,m.member_name
  FROM member m 
 WHERE m.member<6 'M004' ;
 
 -- new_member �� �߰��� �� ��� ����
 DELETE new_member;
 COMMIT;
 
 -- �ɹ����� ��� �������� ����
 UPDATE "SCOTT"."MEMBER"
 SET BIRTH_MONTH = '2'
 WHERE MEMBER_ID ='M002'
 ;
UPDATE "SCOTT"."MEMBER"
 SET BIRTH_MONTH = '2'
 WHERE MEMBER_ID ='M007'
 ;
  UPDATE "SCOTT"."MEMBER"
 SET BIRTH_MONTH = '2'
 WHERE MEMBER_ID ='M008'
 ;
 COMMIT;
 -- ����) new_member ���̺�
 --       member ���̺�κ��� �����͸� �����Ͽ� ������ �Է��� �Ͻÿ�.
 --       ��, member ���̺��� �����Ϳ��� birth_month ��
 --       Ȧ������ ����鸸 ��ȸ�Ͽ� �Է��Ͻÿ�.
INSERT INTO new_member
SELECT m.*
  FROM member m
 WHERE mod(m.birth_month,2) = 1
;

---------------------------------------------------------
-- 2) UPDATE : ���̺��� ��(���ڵ�)�� ����
--             WHERE �������� ���տ� ����
--             1�ุ �����ϰų� ���� �� ������ ����
--             ���� ���� �����Ǵ� ���� �ſ� ���ǰ� �ʿ�

-- UPDATE ���� ����
UPDATE ���̺��̸�
   SET �÷�1= ��1
     [ �÷�2= ��2]
     [ �÷�n= ��n]
[WHERE ����];


-- ��) ȫ�浿�� �̸��� �����õ�
UPDATE member m
   SET m.member_name = '�浿��'
 WHERE m.member_id = 'M006'
;
COMMIT;


-- ��) �蹮�� ����� ��ȭ��ȣ ���ڸ� ������Ʈ
--     �ʱ⿡ INSERT �� NULL �� �����͸� ���� �ʴ� ���
--     �Ŀ� ������ ������ �߻��� �� �ִ�.
--     �̷� ��� UPDATE �������� ó��.

UPDATE member m
   SET m.phone = '1392'
 WHERE m.member_id = 'M004'
;
COMMIT;

-- ��) ������(M009) ����� ������ ����
-- ������
UPDATE member m
   SET m.major = '������'
-- WHERE m.member_id = 'M009'
;
COMMIT;
/*
 WHERE ������ �������� ���� ��� �����̵ǹ���.
 ==> DML �۾� �Ǽ�, ���� ��: �׷��� UPDATE ���� ������ �ƴ϶�� ��.
 */
 
 -- COMMIT �۾� ���� �ǵ����� ROLLBACK �������
 -- �߸��� ������Ʈ �ǵ�����
 ROLLBACK;
 -- �ѹ� �Ϸ�.
 -- M004 ����� ��ȭ��ȣ�� ������Ʈ �� ���� ������ Ŀ���̹Ƿ�
 -- �� ������ �����ͷ� ����
 
 
 UPDATE member m
   SET m.major = '������'
 WHERE m.member_id = 'M009';
 COMMIT;
 
 -- ���� �÷� ������Ʈ(2�� �̻��� �÷� �ѹ��� ������Ʈ)
 -- ��) ������(M008) ����� ��ȭ��ȣ, �ּ�, ������ �ѹ��� ������Ʈ
 UPDATE member m
    SET m.phone = '4119'
       ,m.address = '�ƻ��'
       ,m.major = '�Ͼ�'
 WHERE m.member_id = 'M008'
;
COMMIT;

-- ��) '�Ⱦ��' �� ��� '����ȯ' ����� GENDER ���� ����
--     WHERE ���ǿ� �ּҸ� ���ϴ� ������ ���� ���
UPDATE member m
   SET m.gender = 'M'
 WHERE m.address = '�Ⱦ��'
-- WHERE ������ ����X WHERE ������ ���� ����X
;

ROLLBACK;
-- ���� ���� ����� ���� �����۵��� �� ó�� �������� 
-- �����Ͱ� �پ������� ���۵� ���ɼ�
-- ���� UPDATE �ۼ��ÿ��� WHERE ������ �ۼ���
-- ���Ǹ� ��￩�� ��.

-- 1���� �����ϴ� �����̶�� �ݵ�� PK �÷��� ���ؾ� �Ѵ�.
-- PK �÷��� ��ü �࿡�� �����ϰ�
--    NO NULL �� ����Ǵ� �÷��̹Ƿ�
--    �ݵ�� �� ���� ã�� �� �ִ� ��


-- UPDATE ������ SELECT ���������� ���
-- ��) ������(M008) ����� major ��
--     ������(M002) ����� major �� ����

-- 1) M008 �� major �� ���ϴ� SELECT
SELECT m.major
  FROM member m
 WHERE m.member_id = 'M008'
;

-- 2) (1) �� ����� UPDATE ������ ����
--    M002 ����� major �� �����ϴ� UPDATE ���� ����
UPDATE member m
   SET m.major = ?
 WHERE m.member_id = 'M002'
;

-- 3) (1) �� ����� (2) UPDATE ������ ����
UPDATE member m
   SET m.major =(SELECT m.major
                 FROM member m )
 WHERE m.member_id = 'M002'
;
/*
���� ���� -
ORA-01427: ���� �� ���� ���ǿ� 2�� �̻��� ���� ���ϵǾ����ϴ�.
*/

UPDATE member m
   SET m.major =(SELECT m.member_id
                       ,m.major
                 FROM member m 
                 WHERE m.member_id = 'M008')
 WHERE m.member_id = 'M002'
;
/*
SQL ����: ORA-00913: ���� ���� �ʹ� �����ϴ�
00913. 00000 -  "too many values"
*/
-- ���� SET ���� ����ϴ� ���������� �����
-- ��Ȯ�ϰ� 1�� 1���� 1���� ���� �ƴѰ�� ���� ����


-- UPDATE �� ������� �����ϴ� ���
-- ��) M001 �� member_id ������ �õ�
--    :PK �÷����� �ߺ� ������ �����ϴ� ���
UPDATE member m
   SET m.member_id = 'M002'
 WHERE m.member_id = 'M001'
;
/*
���� ���� -
ORA-00001: ���Ἲ ���� ����(SCOTT.PK_MEMBER)�� ����˴ϴ�
*/

UPDATE member m
   SET m.member_id = NULL
 WHERE m.member_id = 'M001'
;
/*
���� ���� -
ORA-01407: NULL�� ("SCOTT"."MEMBER"."MEMBER_ID")�� ������Ʈ�� �� �����ϴ�
*/

-- ������ �ǽ�

-- 1) PHONE �÷��� NULL �� �����
--    �ϰ������� '0000' ���� ������Ʈ
--    : PK �� �� �ʿ� ���� ����
UPDATE member m
   SET m.phone = '0000'
 WHERE m.phone IS NULL
;
-- 2) M001 ����� ������
--    NULL ������ ������Ʈ
--   : PK �� �ɾ �����ؾ� �ϴ� ����
UPDATE member m
   SET m.major = NULL
 WHERE m.member_id = 'M001'
;

-- 3) ADDRESS �÷��� NULL �� �������
--    �ϰ������� '�ƻ��'�� ������Ʈ
--    PK : �� ���ʿ���� ����
UPDATE member m
   SET m.address = '�ƻ��'
;
-- 4) M009 ����� NULL �����͸�
--   ��� ������Ʈ
--   PHONE : 3581
--   ADDRESS : õ�Ƚ�
--   GENDER : M

UPDATE member m
   SET m.phone = '3581'
      ,m.address = 'õ�Ƚ�'
      ,m.gender = 'M'
;