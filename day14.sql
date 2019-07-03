-- day14 : dml ���

-----------------------------------
-- 3) DELETE : ���̺��� �� ������ �����͸� ����

-- DELETE ���� ����
DELETE [FROM] ���̺��̸� ���̺�Ī
 WHERE ����
;

--- 1. WHERE ������ �ִ� DELETE ����
-- ���� �� Ŀ��
COMMIT;

-- member ���̺��� gender�� 'F'�� �����͸� ����
DELETE member m
WHERE m.gender = 'R' -- ��Ÿ�� R�� ���ߴٸ�
;
-- �� ����� ������ ������ ���⶧���� ��������� �ȴ�.
-- ������ ������ ���� 0���� ������ gender �÷��� R ���� �ִ� ���� ���⶧��


DELETE member m
 WHERE m.gender = 'F'
;


-- ���� 'M004' ���� �����ϴ� ���� �����̸� PK �� �����ؾ� ��.
DELETE member m
 WHERE m.member_id = 'M004'
;
COMMIT;

--- 2. WHERE ������ ���� DELTE ����
-- WHERE ������ �ƾ� ������ ��� ��ü ���� ����
DELETE member;

--- 3. DELETE �� WHERE �� �������� ����
-- ��) �ּҰ� 'õ�Ƚ�'�� ����� ��� ����
DELETE member m 
 WHERE m.address = 'õ�Ƚ�'
;
-- (1) �ּҰ� 'õ�Ƚ�'�� ����� ��ȸ
SELECT m.member_id
  FROM member m
 WHERE m.address = 'õ�Ƚ�'
;
-- (2) �����ϴ� ���� ���� �ۼ�
DELETE member m
 WHERE m.member_id IN (SELECT m.member_id
                         FROM member m
                        WHERE m.address = 'õ�Ƚ�')
;

--------------------------------------
-- DELETE vs. TRUNCATE
/*
1. TRUNCATE �� DDL �� ���ϴ� ��ɾ�
   ���� ROLLBACK ������ �������� ����
   �� �� ����� DDL�� �ǵ��� �� ����.
2. TRUNCATE �� DDL �̱� ������
   WHERE ������ ������ �Ұ����ϹǷ�
   Ư�� �����͸� �����Ͽ� �����ϴ� ���� �Ұ���.
   
   ���� ����
*/

-- new member �� TRUNCATE �� �߶󳻺���.
-- TRUNCATE ���� �Ŀ� �ǵ��ư� COMMIT ���� ����
COMMIT;
-- new_member �� �߶󳻱�
TRUNCATE TABLE new_member;

ROLLBACK;
-- �ѹ��� ������ �� ��������
-- TRUNCATE ����� ����� ���ÿ� Ŀ���� �̷�����Ƿ�
-- TRUNCATE �� �� ������ �ѹ� ������ Ŀ���������� ����.

-------------------------------------------------------
-- TCL : Transaction Control Language
-- 1) COMMIT
-- 2) ROLLBACK


-- 3) SAVEPOINT
--- 1. member ���̺� 1���� �߰�
----1.1 INSERT ���� Ŀ������ ����
COMMIT;
----1.2 DML : INSERT �۾� ����
INSERT INTO member m (m.member_id, m.member_name)
VALUES ('M010','ȫ�浿')
;

----1.3 1�� �߰����� �߰� ���� ����
SAVEPOINT do_insert;

----2 ȫ�浿�� �ּҸ� ������Ʈ
----2.1 DML : UPDATE �۾� ����
UPDATE member m
   SET m.address = '������'
 WHERE m.member_id = 'M010'
;
----2.2 �ּ� �������� �߰� ����
SAVEPOINT do_update_addr;

----3 ȫ�浿�� ��ȭ��ȣ ������Ʈ
----3.1 DML : UPDATE �۾� ����
UPDATE member m
   SET m.phone = '9999'
 WHERE m.member_id = 'M010'
;

----3.2 ��ȭ��ȣ �������� �߰� ����
SAVEPOINT do_update_phone;

----4 ȫ�浿�� ���� ������Ʈ
----4.1 DML : UPDATE �۾� ����
UPDATE member m
   SET m.gender = 'F'
 WHERE m.member_id = 'M010'
;

----4.2 ���� �������� �߰� ����
SAVEPOINT do_update_gender;

-- ������� �ϳ��� Ʈ��������� 4���� DML ���� ���� �ִ� ��Ȳ
-- ���� COMMIT ���� �ʾ����Ƿ� Ʈ������� �������ᰡ �ƴ� ��Ȳ
------------------------------------------------------------
-- ȫ�浿�� ������ ROLLBACK �ó�����

-- 1. �ּ� ���������� �´µ�, ��ȭ��ȣ, ������ �߸������ߴٰ� ����

--    : �ǵ��ư� SAVEPOINT = do_update addr
ROLLBACK TO do_update_addr; --�ѹ� ���̺�����Ʈ�� �߸� �����Ѱ�

-- 2.  ����� ������ �߸�����
ROLLBACK TO do_update_phone;
/*
ORA-01086: 'DO_UPDATE_PHONE' �������� �� ���ǿ� �������� �ʾҰų� �������մϴ�.
01086. 00000 -  "savepoint '%s' never established in this session or is invalid"

SAVEPOINT ���� ������ �ִ�.
do_update_addr �� do_update_phone ���� �ռ� ������ �����̱⶧����
������� ROLLBACK TO �� �Ͼ��
�� �� ������ SAVEPOINT �� ��� ������.
*/

-- 3. 2���� ROLLBACK TO ���� �Ŀ� �ǵ��� �� �ִ� ����
ROLLBACK TO do_insert; -- insert �� ����
ROLLBACK; --���� ���� ����
---------------------------------------------------------------

-- ��Ÿ ��ü : SEQUENCE, INDEX, VIEW

-- SEQUENCE : �⺻ Ű(PK) ������ ���Ǵ� �Ϸù�ȣ ���� ��ü
-- 1. ���۹�ȣ : 1, �ִ� : 30, ����Ŭ�� ���� ������ ����
CREATE SEQUENCE seq_member_id
START WITH 1
MAXVALUE 30
NOCYCLE
;

-- �������� ��ü�̱⶧���� DDL �����Ѵ�.
-- �������� �����Ǹ� �ý��� īŻ�α׿� ����ȴ�.
-- user_sequences

SELECT s.sequence_name
      ,s.min_value
      ,s.max_value
      ,s.cycle_flag
      ,s.increment_by
  FROM user_sequences s
 WHERE s.sequence_name = 'SEQ_MEMBER_ID'
;

-- ���� ������ ������ �ѹ� �� �õ��ϸ�
/*
ORA-00955: ������ ��ü�� �̸��� ����ϰ� �ֽ��ϴ�.
00955. 00000 -  "name is already used by an existing object"
-----------------------------------------------------------
��Ÿ �����͸� �����ϴ� ���� ��ųʸ�
------------------------------------------------------------
���Ἲ �������� : user_constraints
������ �������� : user_sequences
���̺� �������� : user_tables
�ε��� �������� : user_indexes
��ü�� �������� : user_objects
*/


-- 2. ������ ���
--   :������ �������� SELECT �������� ��밡��

-- (1) NEXTVAL : �������� ���� ��ȣ�� ��
--               CREATE �ǰ� ���� �ݵ�� ���� 1��
--               NEXTVAL ȣ���� �Ǿ�� ������ ����

--      ���� : �������̸�.NEXTVAL
SELECT SEQ_MEMBER_ID.NEXTVAL
  FROM dual
;
-- MAXVALUE �̻� �����ϸ� ������ ������ �߻�
/*
ORA-08004: ������ SEQ_MEMBER_ID.NEXTVAL exceeds MAXVALUE�� ��ʷ� �� �� �����ϴ�
08004. 00000 -  "sequence %s.NEXTVAL %s %sVALUE and cannot be instantiated"
*/

-- (2) CURRVAL : ���������� ���� ������ ��ȣ�� Ȯ��
--               ������ ���� �� ���� 1���� NEXTVAL ȣ���� ������
--               ������ ��ȣ�� ���� �� ����.
--               ��, �������� ���� ��Ȱ��ȭ ����
--      ���� : �������̸�.CURRVAL
SELECT SEQ_MEMBER_ID.CURRVAL
  FROM dual
;

-- 3. ������ ���� : ALTER SEQUENCE
-- ������ SEQ_MEMBER_ID �� MAXVALUE ������ NOMAXVALUE �� ����
ALTER SEQUENCE SEQ_MEMBER_ID
NOMAXVALUE
;

-- SEQ_MEMBER_ID �� INCREMENT �� 10���� �����Ϸ���
ALTER SEQUENCE SEQ_MEMBER_ID
INCREMENT BY 10
;

ALTER SEQUENCE SEQ_MEMBER_ID
CYCLE
;

-- 4. ������ ����
DROP SEQUENCE seq_member_id;

---------------------------------
-- new_member ���̺� ������ �Է½� ������ Ȱ��

-- new_member�� id �÷��� ����� ������ �ű� ����
/*
 ������ �̸� : seq_new_member_id
 ���� ��ȣ : 1
 ���� �� : INCREMENT BY 1
 �ִ� ��ȣ : NOMAXVALUE
 ����Ŭ���� : NOCYCLE
 
*/
CREATE SEQUENCE seq_new_member_id
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCYCLE
;

-- new_member �� member_id �� M001, M002... �����ϴ� ���·� ����
SELECT ('M' || LPAD(SEQ_NEW_MEMBER_ID.NEXTVAL,3,0)) as member_id
  FROM dual
;

INSERT INTO new_member (member_id, member_name)
VALUES ('M' || LPAD(SEQ_NEW_MEMBER_ID.NEXTVAL,3,0)
          ,'ȫ�浿')
;
INSERT INTO new_member (member_id, member_name)
VALUES ('M' || LPAD(SEQ_NEW_MEMBER_ID.NEXTVAL,3,0)
          ,'���')
;
COMMIT;

-------------------------------------------------------------------
-- INDEX : �������� �˻�(��ȸ)�� ������ �˻� �ӵ� ������ ����
--         DBMS �� �����ϴ� ��ü

-- 1. user_indexes ���̺��� �̹� �����ϴ� INDEX ��ȸ
SELECT i.index_name
      ,i.index_type
      ,i.table_name
      ,i.include_column
  FROM user_indexes i
  ;
  -- 2. ���̺��� ��Ű(PRIMARY KEY) �÷��� ���ؼ��� DBMS��
  --    �ڵ����� �ε��� �������� �� �� ����.
  --    UNIQUE �� ���ؼ��� �ε����� �ڵ����� ������.
  --    �� �� �ε����� ������ �÷��� ���ؼ��� �ߺ� ���� �Ұ���
  
  -- ��) MEMBER ���̺��� MEMBER_ID �÷��� ���� �ε��� ���� �õ�
  CREATE INDEX idx_member_id
  ON member (member_id)
  ;
  
  -- ==> PK_MEMBER ��� �̸��� �ٸ� IDX_MEMBER_ID �� ���� �õ��ص�
  --  ���� �÷��� ���ؼ��� �ε����� �ΰ� �������� ����.
 
-- 3. ���� ���̺� new_member ���� PK �� ���⋚���� �ε����� ���� ����
-- (1) new_member �� member_id �÷��� �ε��� ����
CREATE INDEX idx_new_member_id
  ON new_member (member_id)
  ;
  
  -- �ε��� ���� Ȯ�� �� DROP
DROP INDEX idx_new_member_id;

-- DESC ���ķ� ����
CREATE INDEX idx_new_member_id
  ON new_member (member_id DESC)
  ;
  
-- �ε��� ��� �÷��� ���� UNIQUE ���� Ȯ���ϴٸ�
-- UNIQUE INDEX �� ��������
CREATE UNIQUE INDEX idx_new_member_id
ON new_member (member_id)
;

-- INDEX �� SELECT �� ���� ��
-- ���� �˻��� ���ؼ� ��������� SELECT �� ����ϴ� ��� ����
-- HINT ���� SELECT �� ����Ѵ�.

--------------------------------------------------------------

-- VIEW : �������θ� �����ϴ� ���� ���̺�

-- 1. SYS ����
CONN sys as sysdba;
-- 2. SCOTT ������ VIEW ���� ���� ����
--- (1) ���� ��
--- (2) sys ������ �ٸ� �����
--- (3) SCOTT ���� ������ Ŭ��
--- (4) ����� ����
--- (5) �ý��� ���� ��
--- (6) CREATE VIEW ������ �ο��� üũ

GRANT CREATE VIEW TO SCOTT;

-- 3. SCOTT
CONN SCOTT/TIGER;

-----------------------------------------

-- 1. emp, dept ���̺� ����
DROP TABLE new_emp;
CREATE TABLE new_emp
AS
SELECT e.*
  FROM emp e
 WHERE 1 = 1
;
DROP TABLE new_dept;
CREATE TABLE new_dept
AS
SELECT d.*
  FROM dept d
 WHERE 1 = 1
;


-- 2. ���� ���̺��� PK ������ �����Ǿ� �����Ƿ� PK ������ ALTER�� �߰�
/*
new_dept : PK_NEW_DEPT, deptno �÷��� PRIMARY KEY �� ����
new_emp : PK_NEW_EMP , empno �÷��� PRIMARY KEY �� ����
          FK_NEW_DEPTNO, deptno �÷��� FOREIGN KEY �� ���� 
                         new_dept ���̺��� deptno �÷��� REFERENCES �ϵ��� ����
          FK_MGR       , mgr �÷��� FOREIGN KEY �� ����
                        new_emp ���̺��� empno �÷��� REFERENCES �ϵ��� ����
*/

-- 3. ���� ���̺��� �⺻ ���̺�� �ϴ� VIEW �� ����
--   :������ �⺻ ���� + ����� �̸� + �μ��̸� + �μ���ġ ���� ��ȸ������ ��
CREATE OR REPLACE VIEW v_emp_dept
AS
SELECT e.empno
      ,e.ename
      ,e1.ename as mgr_name
      ,e.deptno
      ,d.dname
      ,d.loc
  FROM new_emp e
      ,new_dept d
      ,new_emp e1
 WHERE e.deptno = d.deptno(+)
   AND e.mgr = e1.empno(+)
 WITH READ ONLY
;

-- ������ �ɸ� ����� �Ϲ� ���̺� ��ȸ�ϵ� �並 ���� ��ȸ����
SELECT v.empno
      ,v.ename
      ,v.dname
      ,v.loc
  FROM v_emp_dept v
;

-- 4. VIEW �� �����Ǹ� user_views ��� �ý��� ���̺� ������ �߰��� Ȯ��
DESC user_views

SELECT v.view_name
      ,v.read_only
  FROM user_views v
;

-- 5. ������ �信�� DQL ��ȸ
--- 1) �μ����� SALES �� �μ� �Ҽ� ������ ��ȸ
SELECT v.*
  FROM v_emp_dept v
 WHERE v.dname = 'SALES'
;
--- 2) �μ����� NULL �� ������ ��ȸ
SELECT v.*
  FROM v_emp_dept v
 WHERE v.dname IS NULL
;
--- 3) ���(�Ŵ���,mgr)�� NULL �� ������ ��ȸ
SELECT v.*
  FROM v_emp_dept v
 WHERE v.mgr_name IS NULL
;