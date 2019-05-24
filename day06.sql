--  day 06
--  2) 문자함수
---------1. INITACP(str) : str 의 첫 글자를 대문자화(영문)
SELECT initcap('the watch ')
  FROM dual
;
SELECT initcap('안녕하세요. 하하하') -- 안녕하세요. 하하하
  FROM dual
;

----------2. LOWER(str) : str 의 모든 글자를 소문자화(영문)
SELECT lower('MR.SCOTT MCMILLAN') "소문자로 변경"
  FROm dual
;
-- mr. scott mcmillan

----------3. UPPER(str) : str 의 모든 글자를 대문자화(영문)

SELECT upper('lee') "성을 대문자로 변경"
  FROM dual
;

SELECT upper('sql is coooooooooooooooooooool~!!!') "재밌어요!"
  FROm dual
;

--smith 를 찾는데 입력이 소문자로 된 경우에
--SMITH 와 다른 글자로 인식되므로 찾을수 없다.
SELECT   e.empno
        ,e.ename
  FROM   emp e
 WHERE   e.ename = 'smith'
;
-- 인출된 모든 행 :0
SELECT   e.empno
        ,e.ename
  FROM   emp e
 WHERE   e.ename = 'SMITH'
;
--ename 과 비교하는 값이 대문자 이므로 정보가 조회 됨.
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
--             str의 글자길이, 글자의 byte를 계산하여 숫자로 출력
SELECT length('hello, sql') as "글자 길이"
  FROM dual
;
-- 10 : 특수기호, 공백도 글자 길이로 계산
SELECT 'hello, sql 의 글자 길이는' || length('hello, sql') 
                                   || ' 입니다' "글자 길이"
  FROM dual
;
/*
글자 길이
---------------------------------
hello, sql 의 글자 길이는 입니다
*/

----- oracle에서 한글을 3byte로 계산
SELECT lengthb('hello, sql') "글자 byte"
  FROM dual
;
-- 10 => 영문자는 1byte 할당
SELECT lengthb('오라클') "글자 byte"
  FROM dual
;
-- 9 => 한글은 3byte 할당

--------5. CONCAT(str1, str2) : str1과 str2를 문자열 접합
--                              || 연산자와 동일한 결과
SELECT concat('안녕하세요.','SQL!') "인사"
  FROM dual
;
/*
인사
---------------
안녕하세요.SQL!
*/
--concat('안녕하세요.','SQL') 과 같은 결과를 내는 || 연산 사용
SELECT '안녕하세요.' || 'SQL!' "인사"
  FROM dual
;

----------6. SUBSTR(str, i, n) :
--           str 에서 i번째 위치에부터 n개의 글자를 추출
--           SQL 에서 문자열의 인덱스(순서)는 1부터 시작
SELECT substr('SQL is coooooooool~!!', 3, 4)
  FROM dual
;
/*
SUBSTR('SQLISCOOOOOOOOOL~!!',3,4)
L is
*/
------ SUBSTR(str, i) :
--     str 에서 i번째 위치에서 끝까지 추출
SELECT substr('SQL is coooooooool~!!', 3)
  FROM dual
;
/*
SUBSTR('SQLISCOOOOOOOOOL~!!',3)
L is coooooooool~!!
*/
-- 문제 : SQL is coooooooool~~!! 에서 SQL 만 추출해보자
-- 문제 : SQL is coooooooool~~!! 에서 is 만 추출해보자
-- 문제 : SQL is coooooooool~~!! 에서 ~~ 만 추출해보자
SELECT substr('SQL is coooooooool~~!!',1,3)
  FROM dual
;
SELECT substr('SQL is coooooooool~~!!',5,2)
  FROM dual
;
SELECT substr('SQL is coooooooool~~!!',19,2)
  FROM dual
;

-- 문제 : emp 테이블에서 직원의 이름을 앞 두글자까지만 추출하여
--        사번과 함꼐 조회하시오.
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
--                              두번쨰 문자열인 str2가
--                              첫번째 문자열인 str1의 어디에 위치하는지
--                              등장하는 위치를 계산하여 숫자로 출력
SELECT instr('SQL is coooooooool~~!!','io') "io의 위치"
  FROM dual
;
/* 두번쨰 문자열이 첫번째 문자열에 없으면 0을 출력한다.
io의 위치
---------
0
*/

--------- 8. LPAD, RPAD(str, n, c)
--           입력된 str에 대해서 전체 글자가 차지할 자릿수를 n으로 잡고
--           전체 글자수 대비 왼쪽 / 오른쪽에 남는 자릿수에
--           c의 문자를 채워넣는다.
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

-------------9. LTRIM,RTRIM, TRIM : 입력된 문자열의
--               왼쪽 , 오른쪽 ,양쪽 공백을 제거
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
-- 인출된 모든 행:0 ==> ' SMITH' 공백이 들어간 값은 'SMITH'와 다르므로
--                          SMITH 직원이 조회되지 않음

SELECT   e.empno
        ,e.ename
  FROM   emp e
 WHERE   e.ename =trim( '  SMITH ')
;
/*
EMPNO, ENAME
7369	SMITH
*/

--  ' SMITH ' 값에 trim 함수를 적용하여 조회 성공

--  문제 : 비교값이 ' smith ' 일 때 SMITH 의 정보를 조회 하려면
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

--NVL(expr1, expr2) : 첫번쨰 식의 값이 NULL 이면
--                    두번째 식으로 대체 하여 출력
--매니져(mgr)가 배정되지 않은 직원의 경우
--매니져의 사번을 0으로 대체하여 출력
SELECT   e.empno
        ,e.ename
        ,e.mgr
        ,nvl(e.mgr,0) "매니저 사번"
  FROM   emp e
; 
/*
EMPNO, ENAME,   MGR,   매니저 사번
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

-- 매니저(gmr)이 배정되지 않은 직원은
-- '매니저 없음' 이라고 출력하시오.
SELECT   e.empno
        ,e.ename
        ,e.mgr
        ,nvl(e.mgr,'없음') "매니저 사번"
  FROM   emp e
;
/*
ORA-01722: 수치가 부적합합니다
01722. 00000 -  "invalid number"
*Cause:    The specified number was invalid.
*Action:   Specify a valid number.
==> nvl 처리 대상 컬럼인 e.mgr 은 숫자타입의 데이터인데
-- NULL 값을 대체하는 '매니저 없음'은 문자타입의 데이터 이므로
-- 변환시 mgr 컬럼의 타입과 불일치하기 떄문에
-- 실행시 구문 오류가 발생
*/
-- ==> 해결방법 e.mgr 을 문자타입으로 변경
SELECT   e.empno
        ,e.ename
        ,e.mgr
        ,nvl(e.mgr|| '','없음') "매니저 사번"
  FROM   emp e
;
-- || 결합연산자로 mgr 에 빈문자를 붙여서 문자타입으로 변경
/*
EMPNO, ENAME,   MGR,   매니저 사번
7369	SMITH	7902	7902
7499	ALLEN	7698	7698
7521	WARD	7698	7698
7566	JONES	7839	7839
7654	MARTIN	7698	7698
7698	BLAKE	7839	7839
7782	CLARK	7839	7839
7839	KING		없음
7844	TURNER	7698	7698
7900	JAMES	7698	7698
7902	FORD	7566	7566
7934	MILLER	7782	7782
9999	J_JAMES		없음
8888	J%JAMES		없음
*/

-- 문제 : || 연산자 대신 concat() 함수를 사용하여 결과를 내시오.
SELECT   e.empno
        ,e.ename
        ,e.mgr
        ,nvl(concat(e.mgr,''),'없음') "매니저 사번"
  FROM   emp e
;

-- 오라클 에서는 빈 문자열('') 를 NULL로 취급


-- NVL2(expr1, expr2, expr3) :
-- 첫번쨰 식의 값이 NOT NULL 이면 두번째 식의 값으로 출력
--                  NULL 이면 세번째 식의 값으로 출력

--매니저(mrg)가 배정된 경우에는 '매니져 있음' 으로
--매니저가 배정되지 않은 경우에는 '매니저 없음' 으로 출력
SELECT   e.empno
        ,e.ename
        ,e.mgr
        ,nvl2(e.mgr,'매니저 있음','매니저 없음') "매니저 유/무"
  FROM   emp e
;
/*
EMPNO, ENAME,   MGR,   매니저 유/무
7369	SMITH	7902	매니저 있음
7499	ALLEN	7698	매니저 있음
7521	WARD	7698	매니저 있음
7566	JONES	7839	매니저 있음
7654	MARTIN	7698	매니저 있음
7698	BLAKE	7839	매니저 있음
7782	CLARK	7839	매니저 있음
7839	KING		     매니저 없음
7844	TURNER	7698	매니저 있음
7900	JAMES	7698	매니저 있음
7902	FORD	7566	매니저 있음
7934	MILLER	7782	매니저 있음
9999	J_JAMES		   매니저 없음
8888	J%JAMES		    매니저 없음
*/

-- 오라클에서 빈 문자열('')을 NULL 로 취급하는 것을
-- 확인하기 위한 구문
-- 입력이 빈문자열
SELECT nvl2('','IS NOT NULL','IS NULL')
  FROM dual
;
/*
NVL2('','ISNOTNULL','ISNULL')
IS NULL
*/
--입력이 공백 1칸 짜리 문자
SELECT nvl2(' ','IS NOT NULL','IS NULL') "NULL 값 여부"
  FROM dual
;
/*
NULL 값 여부
IS NOT NULL
*/

--NULLIF(expr1,expr2) :
-- 첫번쨰 식 ,두번째 식의 값이 동일하면 NULL을 출력
-- 두 값이 다르면 첫번째 식의 값을 출력
SELECT nullif('AAA','bbb') as NULLIF결과 --AAA
FROM dual
;

SELECT nullif('AAA','AAA') as NULLIF결과
FROM dual
;
/*
NULLIF결과
-----------
(null)
*/
-- 조회된 결과 행이 1개가 존재하고 그 값이 NULL인 상태
-- 1행이라도 조회가 된 것은 "인출된 모든 행:0" 와 다르다는 것에 주의

----------3) 날짜함수 : 날짜와 관련된 출력/ 날짜의 더하기 빼기 등의 연산을
--                      할 수있는 기능을 제공

--현재의 시스템 시간을 얻는 sysdate 함수
SELECT sysdate
  FROM dual
;
/*
SYSDATE
-----------
19/05/24 ==> 오라클의 날짜 기본 형식 YY/MM/DD
*/

--TO_CHAR(arg) : arg는 숫자,날짜 타입의 데이터가 될 수 있다.
--              입력된 arg를 문자타입으로 변경해주는 함수
SELECT to_char(sysdate,'YYYY') "년"
  FROM dual
;
SELECT to_char(sysdate,'YY') "년"
  FROM dual
;
SELECT to_char(sysdate,'MONTH') "월"
  FROM dual
;
SELECT to_char(sysdate,'DD') "일"
  FROM dual
;
SELECT to_char(sysdate,'DAY') "요일"
  FROM dual
;
SELECT to_char(sysdate,'DY') "요일"
  FROM dual
;
SELECT to_char(sysdate,'YYYY-MM-DD') "오늘 날짜"
  FROM dual
;
SELECT to_char(sysdate,'FMYYYY-MM-DD') "오늘 날짜"
  FROM dual
;
SELECT to_char(sysdate,'YY-MON-DD DY') "오늘 날짜"
  FROM dual
;
SELECT to_char(sysdate,'YYYY-MM-DD DAY') "오늘 날짜"
  FROM dual
;

/* 시간 패턴 :
    HH : 시간을 두자리로 표기
    MI : 분을 두자리로 표기
    SS : 초를 두자리로 표기
    HH@4 : 시간을 24시간 체계로 표기
    AM : 오전인지 오후인지 표기
*/
SELECT to_char(sysdate,'YYYY--MM-DD HH24:MI:SS') "오늘 날짜 시분초"
  FROM dual
;
/*
오늘 날짜 시분초
2019--05-24 15:30:01
*/
SELECT to_char(sysdate,'YYYY--MM-DD AM HH:MI:SS') "오늘 날짜 시분초"
  FROM dual
;
-- 2019--05-24 오후 03:42:38 <== AM 패턴문자를 조합하면 오전/오후 구별됨

-- 날짜 값과 숫자의 연산 : +,- 연산자를 사용
-- 지금으로부터 10일 후
SELECT sysdate + 10
  FROM dual
;
--19/06/03 (현재 날짜 : 19/05/24 일 때)

--10일 전
SELECT sysdate - 10
  FROM dual
;
--19/05/14

--10시간 후
SELECT sysdate + 10/24
  FROM dual
;
-- 19/05/25
SELECT to_char(sysdate + 10/24, 'YYYY-MM-DD HH24:MI:SS')
  FROM dual
;
-- 2019-05-25 01:47:07

----------------1. MONTHS_BETWEEN(날짜1, 날짜2) :
--                  두 날짜 사이의 달의 차이
-- 각 직원이 입사한 날로부터 현재까지 몇개월을 근무했는지 조회하시오.
SELECT  e.empno
        ,e.ename
        ,MONTHS_BETWEEN(sysdate,e.hiredate) "근속 개월수"
  FROM emp e
;

-- 각 직원의 근속 개월수를 구하되
-- 소수점 1의 자리까지만 출력하시오.
SELECT e.empno
        ,e.ename
        ,ROUND(MONTHS_BETWEEN(sysdate,e.hiredate),1) "근속 개월 수"
  FROM emp e
;
/*
EMPNO, ENAME, 근속 개월 수
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

-------------2. ADD_MONTHS(날짜, 숫자) :
--              날짜에 숫자를 더한만큼 후의 날짜를 구함
SELECT add_months(sysdate,3)
  FROM dual
;
-- 날짜 + 숫자 : 숫자 만큼의 날 수를 더하여 날짜를 구함
-- 날짜 + 숫자/24 : 숫자 만큼의 시간을 더하여 날짜를 구함
-- ADD_MONTHS(날짜, 숫자) : 숫자 만큼의 달을 더하여 날짜를 구함


------- 3. NEXT_DAY, LAST_DAY
--          다음 요일에 해당하는 날짜를 구함
--          이달의 마지막 날짜를 구함
-- 현재 날짜에서 돌아오는 수(4) 요일의 날짜를 구함
SELECT next_day(sysdate,'수요일') "돌아오는 수요일" 
  FROM dual
;

SELECT last_day(sysdate) "이 달의 마지막 날"
  FROM dual
;

---------4. ROUND, TRUNC : 날짜에 대한 반올림,버림 연산
SELECT round(sysdate) "현재 시간"
  FROM dual
;
--문제 : 현재 시간에서 반올림 된 날짜를 시/분/초 까지 출력
SELECT round(to_char(sysdate,'YYYY-MM-DD HH24:MI:SS')) "현재 시간"
  FROM dual
;