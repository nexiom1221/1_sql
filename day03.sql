-- SQL day 03
-- WHERE 조건절

-- * SQL SELECT 구문의 작동 원리 :
-- >> 테이블 (FROM 절에 나열된)의 한 행을 기본 단위로 실행한다.
-- >> 테이블 행의 개수만큼 반복 실행한다.
-- 만약 다음과 같은 구문을 실행한다면 결과는 어떻게 될까?
SELECT 'Hello,SQL~'   --고정된 값을 조회하면 어떻게 될까?
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

SELECT 'Hello,SQL~' AS greeting-- 컬럼명이 아닌 고정된 값을 조회하면 어떻게 될까?
        ,empno  --테이블에 존재하는 컬럼명을 섞어서 쓰면 어떻게 될까?
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

-- WHERE 조건절
-- 16) emp 테이블에서 empno 가 7900인 사원의
--      사번, 이름, 직무, 입사일, 급여 , 부서번호를 조회하시오.

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
 
 -- 17) emp 테이블에서 empno 가 7900 이거나 deptno 가 20인 직원의
 --     사번, 이름, 직무, 입사일, 급여, 부서번호 를 조회하시오.
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

