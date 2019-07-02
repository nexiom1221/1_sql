-- day 12 : DDL (Data Definition Language)
--         ������ ���Ǿ�

-- 1. ���̺��� �����ϴ� ��ɾ� => ���̺��� DBMS�� OBJECT�� �ϳ�
-- 2. DBMS �� OBJECT(��ü) �� ����/�ν� �ϴ� �����
--    ����, ����, ���� �ϴ� ��ɾ�

-- ���� : CREATE
-- ���� : ALTER
-- ���� : DROP

-- vs. DML (Data Manipulation Language) ������ ���۾�
-- ���� : INSERT
-- ���� : UPDATE
-- ���� : DELETE

-------------------------------------------------------------
/* DDL ������ ����

   CREATE | ALTER | DROP {������ ��ü�� Ÿ�Ը�}
  
  DBMS�� OBJECT(��ü)�� ����
  SCHEMA, DOMAIN, TABLE, VIEW, INDEX, SEQUENCE, USER, DATABASE
*/

CREATE TABLE ���̺��̸�
( �÷�1�̸� ������Ÿ��[(����) [DEFAULT �⺻��] [�÷��� �������] 
 [�÷�2�̸� ������Ÿ��[(����) [DEFAULT �⺻��] [�÷��� �������]]
  .....
 [�÷�n�̸� ������Ÿ��[(����) [DEFAULT �⺻��] [�÷��� �������]]
);

/* ------------------
  �÷��� �������
  -------------------
  1.PRIMARY KEY : �� �÷��� �ԷµǴ� ���� �ߺ����� �ʰ�
                  �� ���� �ĺ��� �� �ִ� ������ �����ؾ� �ϸ�
                  NULL �����Ͱ� �Է��� �Ұ����� ���̾�� �Ѵ�.
  2.FOREIGN KEY : �ַ� JOIN�� ���Ǵ� ������������
                  �ٸ� ���̺��� PRIMARY KEY �� ���Ǿ��� ����
                  �����ؾ߸� �Ѵ�.
  3.UNIQUE      : �� �÷��� �ԷµǴ� ���� �ߺ����� ������ �����ؾ� �Ѵ�.
                  NULL ������ �Է��� �����ϴ�.
                  ==> �����Ͱ� NULL(���ų�) �̰ų�
                      NULL�� �ƴϸ� �ݵ�� ������ ���̾�� ��.
  4.NOT NULL    : �� �÷��� �ԷµǴ� ���� �ߺ��� ���������
                  NULL ���´� ���� �ʵ��� �����Ѵ�.
                  
 ==> PK : UNIQUE + NOT NULL ���յ� ������ ���� �� �� �ִ�.
 */
 
 -- ��) û���� ���� �����ο� ������ ������ ���̺��� ����
 /* 
   ���̺��̸� : member
   1. ������̵�       : member_id     : ���� : VARCHAR2
   2. ����̸�         : member_name   : ���� : VARCHAR2
   3. ��ȭ��ȣ ���ڸ�  : phone         : ���� : VARCHAR2
   4. �ý��۵����     : reg_date      : ��¥ : DATE
   5. ��� ��(���̸�)  : address       : ���� : VARCHAR2
   6. �����ϴ� ����    : like_number   : ���� : NUMBER
   7. ����             : major         : ���� : VARCHAR2
*/

-- 1. ���̺� ���� ���� : member
CREATE TABLE member
( member_id        VARCHAR2(4)  PRIMARY KEY
 ,member_name      VARCHAR2(15) NOT NULL
 ,phone            VARCHAR2(4)  -- NULL ����Ϸ��� ���������� �Ⱦ��� �ȴ�.
 ,reg_date         DATE         DEFAULT sysdate
 ,address          VARCHAR2(30)
 ,like_number      NUMBER       
 ,major            VARCHAR2(50)
);
-- Table MEMBER��(��) �����Ǿ����ϴ�.

-- 2. ���̺� ���� ����
DROP TABLE member;

-- 3. ���̺� ���� ����
/* ------------------
   ������ ����
   ------------------
   1. �÷��� �߰� : ADD
   2. �÷��� ���� : MODIFY
   3. �÷��� ���� : DROP COLUMN
   ------------------
*/
ALTER TABLE ���̺��̸� {ADD | MODIFY | DROP COLUMN} ..... ;
-- ��) ������ member ���̺� �÷� 2���� �߰�
-- ��� �� : birth_month : NUMBER
-- ����    : gender      : VARCHAR2(1)

-- 1) ADD
ALTER TABLE member ADD
( birth_month NUMBER
 ,gender      VARCHAR2(1) CHECK (gender IN ('F','M'))
);
-- Table MEMBER��(��) ����Ǿ����ϴ�.

-- 2) MODIFY
-- ��) ��� �� �÷��� ����2 �ڸ������� �����ϵ��� ����
ALTER TABLE member MODIFY birth_month NUMBER(2);

-- 3) DROP COLUMN
-- ��) ������ ���̺� member���� like_number �÷��� ����
ALTER TABLE member DROP COLUMN like_number;

-------------------------------------------------------
-- ���� ����� member ���̺��� ��������
CREATE TABLE member
( member_id        VARCHAR2(4)  PRIMARY KEY
 ,member_name      VARCHAR2(15) NOT NULL
 ,phone            VARCHAR2(4)  -- NULL ����Ϸ��� ���������� �Ⱦ��� �ȴ�.
 ,reg_date         DATE         DEFAULT sysdate
 ,address          VARCHAR2(30)   
 ,major            VARCHAR2(50)
 ,birth_month      NUMBER(2)
 ,gender           VARCHAR2(1)  CHECK (gender IN ('F','M'))
);

-- ���� �ܼ�ȭ�� ���̺� ���� ����
-- ���������� �� �÷� �ڿ� �ٷ� �������� �̸� ���� ����

-- �������ǿ� �̸��� �ο��ؼ� ���� :
-- �÷��� ���ǰ� ���� �� �������� ���Ǹ� ���Ƽ� �ۼ�

DROP TABLE member;
-- �������� �̸��� �־� member ���̺� ����
CREATE TABLE member
( member_id        VARCHAR2(4)  
 ,member_name      VARCHAR2(15) NOT NULL
 ,phone            VARCHAR2(4)  -- NULL ����Ϸ��� ���������� �Ⱦ��� �ȴ�.
 ,reg_date         DATE         DEFAULT sysdate
 ,address          VARCHAR2(30)   
 ,major            VARCHAR2(50)
 ,birth_month      NUMBER(2)
 ,gender           VARCHAR2(1)  
--,CONSTRAINT (���������̸� ��������Ÿ�� (�������� ������ �÷�)
 ,CONSTRAINT pk_member          PRIMARY KEY (member_id)
 ,CONSTRAINT ck_member_gender   CHECK       (gender IN('M','F'))
);

-- ���̺� ������ DDL������ ������ �ý��� īŻ�α׿� �����.
-- user_tables, user_constraints
-- �� ���� �ý��� īŻ�α� ���̺��� ��ȸ

-- 1) �� ���̺��� ����(�÷� �̸�) ��ȸ
DESC user_tables;
DESC user_constraints;

-- ���� ����(SCOTT)�� ������ �ִ� ���̺� ����� ��ȸ
SELECT t.table_name
  FROM user_tables t
;
/*
TABLE_NAME
----------
DEPT
EMP
BONUS
SALGRADE
MEMBER
*/


-- MEMBER ���̺��� �������Ǹ� Ȯ��
SELECT  c.constraint_name
       ,c.constraint_type
       ,c.table_name
  FROM user_constraints c
 WHERE c.table_name = 'MEMBER'
;
/*
CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
--------------------------------------------
SYS_C007614	C	MEMBER
CK_MEMBER_GENDER	C	MEMBER
PK_MEMBER	P	MEMBER
*/

-- user_objects : ���� ����ڰ� ������ �ִ� object���� ������ ����Ǵ�
--                �ý��� īŻ�α� ���̺�
DESC user_objects;

SELECT o.object_name
      ,o.object_id
      ,o.object_type
  FROM user_objects o
;

-- ���̺� ���� ����� �̹� �����ϴ� ���̺�κ��� ���� ����
-- ���̺� ���� ���� ���� ����
CREATE TABLE ���̺��̸�
AS 
SELECT �÷��̸�
  FROM ���������̺�
 WHERE �׻� ������ �Ǵ� ����
;

-- ��) �ռ� ������ member ���̺��� ���� : new_member
CREATE TABLE new_member
AS
SELECT m.*
  FROM member m
 WHERE 1 = 2 -- �׻� ������ �Ǵ� ����
;
-- PK ������ ������� �ʰ� ���̺� ����(��ȸ�� �÷���) �����

-- new_member ���̺��� ������ ��ȸ
DESC new_member;
/*
INSERT INTO "SCOTT"."MEMBER" (MEMBER_ID, MEMBER_NAME, PHONE, ADDRESS, MAJOR, BIRTH_MONTH, GENDER) VALUES ('M001', '�ڼ���', '9155', '������', '����', '3', 'M')
INSERT INTO "SCOTT"."MEMBER" (MEMBER_ID, MEMBER_NAME, PHONE, ADDRESS, MAJOR, BIRTH_MONTH, GENDER) VALUES ('M002', '������', '1418', '������', '�Ͼ�', '1', 'M')
INSERT INTO "SCOTT"."MEMBER" (MEMBER_ID, MEMBER_NAME, PHONE, ADDRESS, MAJOR, BIRTH_MONTH, GENDER) VALUES ('M003', '�̺���', '0186', 'õ�Ƚ�', '�İ�', '3', 'M')
INSERT INTO "SCOTT"."MEMBER" (MEMBER_ID, MEMBER_NAME, PHONE, ADDRESS, MAJOR, BIRTH_MONTH, GENDER) VALUES ('M004', '�蹮��', '1392', 'û�ֽ�', '�Ͼ�', '3', 'F')
INSERT INTO "SCOTT"."MEMBER" (MEMBER_ID, MEMBER_NAME, PHONE, ADDRESS, MAJOR, BIRTH_MONTH, GENDER) VALUES ('M005', '����ȯ', '0322', '�Ⱦ��', '����', '3', 'M')
commit;
*/

-- 3������ ������ �����ؼ� �� ���̺��� ����
CREATE TABLE march_member
AS
SELECT m.*
  FROM member m
 WHERE m.birth_month = 3
;

-- �����Ͽ� ���̺� ������ ���� �� �� �ִ� ������ �ָ�
-- �ش� ������ �����ϴ� ���� �����ͱ��� ����Ǹ鼭 ���̺� ����

-- �׻� ���� �Ǵ� ������ �ָ� ��� �����͸� �����ϸ鼭 ���̺� ����
CREATE TABLE full_member
AS
SELECT m.*
  FROM member m
 WHERE 1 = 1
;

-- full_member ����
DROP TABLE full_member;

CREATE TABLE full_member
AS
SELECT m.*
  FROM member m
;
-- WHERE �������� �����ϸ�
-- �׻� ���� ����� �����ϹǷ� ��� �����Ͱ� ����Ǹ� �� ���̺� ����

----------------------------------------------------------------
-- ���̺� ����(ALTER) ���ǻ���

-- 1) �÷��� ���� �� : ��� ���濡 �����ο�
--   :��� ���濡 �����ο�
--    ������ Ÿ�Ժ���, ������ ũ�⺯�濡 ��� �����ο�

-- 2) �÷��� �����Ͱ� ���� ��
--   :�����Ͱ� �ҽǵǸ� �ȵǹǷ� ���濡 ������ ����.
--    Ÿ�� ������ ���� Ÿ�Գ������� ����
--    ���� Ÿ�԰��� CHAR -> VARCHAR2 ���� ����

--    ũ�� ������ ���� Ȥ�� Ŀ���� �������θ� ����
--    ���� Ÿ���� ũ�⺯���� ���е��� Ŀ���� �������θ� ����

-- ��) MARCH_MEMBER ���̺��� BIRTH_MONTH �÷���
--     ������ Ÿ���� ũ�⸦ NUMBER(1) �� ���̸�
ALTER TABLE MARCH_MEMBER MODIFY (BIRTH_MONTH NUMBER(1));
--ORA-01440: ���� �Ǵ� �ڸ����� ����� ���� ��� �־�� �մϴ�
--01440. 00000 -  "column to be modified must be empty to decrease precision or scale"

-- ���� �������� ���е��� �����ϴ� ������ �����ϸ�
-- 2 -> 10�ڸ�, ���� �Ҽ��� 2�ڸ�
ALTER TABLE MARCH_MEMBER MODIFY (BIRTH_MONTH NUMBER(10,2));

-- ���� �������� BIRTH_MONTH �÷��� ���� �����ͷ� ����
ALTER TABLE MARCH_MEMBER MODIFY (BIRTH_MONTH VARCHAR2(1));
/*
ORA-01439: ������ ������ ������ ���� ��� �־�� �մϴ�
01439. 00000 -  "column to be modified must be empty to change datatype"
*/
-- MARCH_MEMBER ���̺��� ��� ���� ���ؼ�
-- BIRTH_MONTH �÷��� ���� NULL �����ͷ� �����ϴ� ���
UPDATE "SCOTT"."MARCH_MEMBER"
   SET BIRTH_MONTH = ''
;
commit;
-- �����Ͱ� ���� �÷����� ���� ��
-- VARCHAR2(2) �����÷����� ����
ALTER TABLE MARCH_MEMBER MODIFY (BIRTH_MONTH VARCHAR(2));

-- NUMBER(1) ���� 1�ڸ� �÷����� ����
ALTER TABLE MARCH_MEMBER MODIFY (BIRTH_MONTH NUMBER(1));
-------------------------------------------------------------------------


-- 3) �⺻ ��(DEFAULT) ������ ���� ���� ������ ���� ��.

-- ��) 3�� ���� �ɹ��� ������ MARCH_MEMBER ���̺��� �����غ���.
--   : BIRTH_MONTH �÷��� ���� �׻� 3���� �����Ǿ �� �� ����.

-- MARCH_MEMBER ���̺�
-- BIRTH_MONTH �÷��� ���� ���� �ɹ� ���� 1�� �߰�
INSERT INTO "SCOTT"."MARCH_MEMBER" (MEMBER_ID, MEMBER_NAME, PHONE, ADDRESS, MAJOR, GENDER) 
VALUES ('M006', '�Կ���', '0437', '������', '�İ�', 'F');
commit;
-- b) a�� �ɹ� ���� �߰� �� DEFAULT ���� �߰�
ALTER TABLE march_member MODIFY (BIRTH_MONTH DEFAULT 3);

-- c) MARCH_MEMBER ���̺� DEFAULT ���� �߰� ��
-- �� �ɹ��� �߰�
INSERT INTO "SCOTT"."MARCH_MEMBER" (MEMBER_ID, MEMBER_NAME, ADDRESS, MAJOR, GENDER) 
VALUES ('M007', 'ȫ�浿', '������', '����', 'M');
commit;

-----------------------------------------------------------------
-- ���̺� ���Ἲ ���� ���� ó����� 4����
/*
MAIN_TABLE
ID           VARCHAR2(10) PK
NICKNAME     VARCHAR2(30) UNIQUE
REG_DATE     DATE         DEFAULT SYSDATE
GENDER       VARCHAR2(1)  CHECK (GENDER IN('M','F'))
MESSAGE      VARCHAR2(300) 
*/
------------------------------------------------------------
/*
SUB_TABLE
----------------------------------------------
ID      VARCHAR2(10)       REFERENCES MAIN_TABLE(ID)
                            (FK FROM MAIN_TABLE.ID)
HOBBY   VARCHAR2(200)
BIRTH_YEAR NUMBER(4)
*/
------1. �÷� ������ ��, ���� ���� �̸� ���� �ٷ� ����

DROP TABLE main_table1;
CREATE TABLE main_table1
( ID           VARCHAR2(10) PRIMARY KEY
 ,NICKNAME     VARCHAR2(30) UNIQUE
 ,REG_DATE     DATE         DEFAULT SYSDATE
 ,GENDER       VARCHAR2(1)  CHECK (GENDER IN('M','F'))
 ,MESSAGE      VARCHAR2(300) 
);

DROP TABLE SUB_TABLE1;
CREATE TABLE SUB_TABLE1
( ID       VARCHAR2(10) REFERENCES MAIN_TABLE1(ID)
 ,HOBBY    VARCHAR2(200)
 ,BIRTH_YEAR  NUMBER(4)
);

------ 2. �÷� ������ ��, ���� ���� �̸��� �ָ� ����
CREATE TABLE main_table2
( ID           VARCHAR2(10) CONSTRAINT PK_MAIN PRIMARY KEY
 ,NICKNAME     VARCHAR2(30) CONSTRAINT UQ_NICKNAME UNIQUE
 ,REG_DATE     DATE         DEFAULT SYSDATE
 ,GENDER       VARCHAR2(1)  CONSTRAINT CK_GENDER CHECK (GENDER IN('M','F'))
 ,MESSAGE      VARCHAR2(300) 
);

DROP TABLE SUB_TABLE2;
CREATE TABLE SUB_TABLE2
( ID       VARCHAR2(10) REFERENCES MAIN_TABLE2(ID)
 ,HOBBY    VARCHAR2(200)
 ,BIRTH_YEAR  NUMBER(4)
);

------ 3. �÷� ���� �� ���� ���� ���� ����
DROP TABLE main_tabel3;
CREATE TABLE main_table3
( ID           VARCHAR2(10) 
 ,NICKNAME     VARCHAR2(30) 
 ,REG_DATE     DATE         DEFAULT SYSDATE
 ,GENDER       VARCHAR2(1)  
 ,MESSAGE      VARCHAR2(300)
 ,CONSTRAINT   PK_MAIN3   PRIMARY KEY(ID)
 ,CONSTRAINT   UQ_NICKNAME3 UNIQUE (NICKNAME)
 ,CONSTRAINT   CK_GENDER3   CHECK (GENDER IN('M','F'))
);

DROP TABLE SUB_TABLE3;
CREATE TABLE SUB_TABLE3
( ID       VARCHAR2(10)
 ,HOBBY    VARCHAR2(200)
 ,BIRTH_YEAR  NUMBER(4)
 ,CONSTRAINT FK_SUB3 FOREIGN KEY(ID) REFERENCES MAIN_TABLE3(ID)
 -- SUB_TABLE3 �� ��� PRIMARY KEY �� ID, BIRTH_YEAR �� ����Ű�� ����
 -- ����Ű�� PK�� �������� ���� �ݵ�� �������� �߰��θ� ��������
 ,CONSTRAINT PK_SUB3 PRIMARY KEY (ID, BIRTH_YEAR)
);



--- 4. ���̺� ���� �� ���̺� ����(ALTER TABLE)�� �������� �߰�
DROP TABLE MAIN_TABLE4;
-- 1) MAIN_TABLE4 ���� ����
CREATE TABLE MAIN_TABLE4
( ID           VARCHAR2(10) 
 ,NICKNAME     VARCHAR2(30) 
 ,REG_DATE     DATE         DEFAULT SYSDATE
 ,GENDER       VARCHAR2(1)  
 ,MESSAGE      VARCHAR2(300) 
);
-- 2) �������� �߰� ����
ALTER TABLE MAIN_TABLE4 ADD 
( CONSTRAINT PK_MAIN4     PRIMARY KEY (ID)
 ,CONSTRAINT UQ_NICKNAME4 UNIQUE (NICKNAME)
 ,CONSTRAINT CK_GENDER4   CHECK (GENDER IN('M','F'))
);

-- SUB_TABLE4 �� �����ϸ� ����
DROP TABLE SUB_TABLE4;

-- 3) SUB_TABLE4 ���� ����
CREATE TABLE SUB_TABLE4
( ID          VARCHAR2(10)
 ,HOBBY       VARCHAR2(200)
 ,BIRTH_YEAR  NUMBER(4)
);

-- 4) SUB_TABLE4 �� �������� �߰�
ALTER TABLE SUB_TABLE4 ADD
( CONSTRAINT FK_SUB4 FOREIGN KEY(ID) REFERENCES MAIN_TABLE4(ID)
 ,CONSTRAINT PK_SUB4 PRIMARY KEY (ID, BIRTH_YEAR)
);

-- �ý��� īŻ�α� : user_constraints ����
-- ������ �������� Ȯ��

SELECT c.table_name
      ,c.constraint_name
      ,c.constraint_type
  FROM user_constraints c
 WHERE c.table_name LIKE 'MAIN_TABLE%'
    OR c.table_name LIKE 'SUB_TABLE%'
 ORDER BY c.table_name
;

-- ���̺� �̸��� ���� : RENAME 
-- ��) MARCH_MEMBER ====> MEMBER_OF_MARCH
RENAME MARCH_MEMBER TO MEMBER_OF_MARCH;

RENAME MEMBER_OF_MARCH TO MARCH_MEMBER;

-- ���̺� ���� : DROP
-- �� ���̺� ���̿� REFERENCE (FOREIGN KEY) ���谡 ���� ���� ����

-- ��) MAIN_TABLE1 �� ��� SUB_TABLE1 �� ���� ID �÷��� �����ǰ� �ִ� ����

-- 1) MAIN_TABLE1 ���� ����
DROP TABLE MAIN_TABLE1;
/*
DROP TABLE MAIN_TABLE1
���� ���� -
ORA-02449: �ܷ� Ű�� ���� �����Ǵ� ����/�⺻ Ű�� ���̺� �ֽ��ϴ�
02449. 00000 -  "unique/primary keys in table referenced by foreign keys"
*Cause:    An attempt was made to drop a table with unique or
           primary keys referenced by foreign keys in another table.
*Action:   Before performing the above operations the table, drop the
           foreign key constraints in other tables. You can see what
           constraints are referencing a table by issuing the following
           command:
           SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = "tabnam";
*/
-- SUB_TABLE1 �� MAIN_TABLE1 �� ID �÷��� �����ϰ� �ֱ� ������
-- ���̺� ������ ������ �ʿ��ϴ�.

-- 2) SUB_TABLE1 ���� ���� �� MAIN_TABLE1 ����
DROP TABLE SUB_TABLE1;
DROP TABLE MAIN_TABLE1;


-- 3) ���� ���迡 ������� ���踦 �����鼭 ����
DROP TABLE MAIN_TABLE2 CASCADE CONSTRAINT;

SELECT c.table_name
      ,c.constraint_name
      ,c.constraint_type
  FROM user_constraints c
 WHERE c.table_name LIKE 'MAIN_TABLE2'
    OR c.table_name LIKE 'SUB_TABLE2'
 ORDER BY c.table_name
;
-- CASCADE �ɼ����� ���̺� �����ϸ�
-- ���� ���� ��� : ����� ��� �� : 0 �� �ȴ�.
-- ��, ���������� ��� �����ϸ� ���̺��� DROP ��
-- Ư�� �� ������� SUB_TABLE2 �� �ִ� R ���������� ���� ��������� Ȯ��.

-- SUB_TABLE3 �� DROP �� ��, user_constraints ���� ���� ���� ������� Ȯ��.
DROP TABLE SUB_TABLE3;

SELECT c.table_name
      ,c.constraint_name
      ,c.constraint_type
  FROM user_constraints c
 WHERE c.table_name LIKE 'MAIN_TABLE3'
    OR c.table_name LIKE 'SUB_TABLE3'
 ORDER BY c.table_name
;

-- SUB_TABLE3 �� DROP �ص� MAIN_TABLE3 �� �������ǿ���
-- ������ ��ġ�� ������ Ȯ��.
