--실행 : ctrl + enter
SELECT * FROM EMPLOYEE;

--테이블 블럭치고 f4누르면 속성 볼 수 있음

--데이터 기본 사항 처리 로직
--데이터베이스에서 실행하고자 하는 명령 종류
--[CRUD]
--CREATE : 데이터 추가 / INSERT
--READ : 데이터 조회 / SELECT
--UPDATE : 데이터 수정 / UPDATE
--DELETE : 데이터 삭제 / DELETE

--SELECT : 조회용 SQL 명령어
--SELECT 조회용 컬럼 	: 조회하고자 하는 내용
--FROM 테이블명 		: 조회하고자 하는 테이블명
--WHERE 조건			: 특정 조건
--ORDER BY 컬럼		: 정렬(예:오름차순 내림차순 같은거)
--;

--부서코드가 'D6'인 부서의 모든 직원 정보를 모두 조회하자
SELECT * FROM EMPLOYEE WHERE DEPT_CODE = 'D6';


--DAY 2
--컬럼 명에 별칭 달기


--1. AS 표현  (조회될때 정해준 별칭의 이름으로 출력된다.)
SELECT EMP_ID AS "사원번호", EMP_NAME AS "사원명" FROM EMPLOYEE;


--2. AS 생략   //별칭 정할떄는 쌍따옴표로.  //따옴표 생략해도 된다.
SELECT "EMP_ID" 사원번호, EMP_NAME 사원명 FROM EMPLOYEE;
--단, 
--별칭에 공백이 들어갈 경우 따옴표 생략 불가.
--SELECT EMP_ID 사원 번호, EMP_NAME 사원명 FROM EMPLOYEE;


--EMPLOYEE테이블에서 부서가 D2이거나 D1인 사원들의 사원명 입사일 연락처를 조회,
--단 조회하는 컬럼명에 별칭을 부여하면서

SELECT EMP_NAME 사원명, HIRE_DATE 입사일, PHONE 연락처 
FROM EMPLOYEE 
WHERE DEPT_CODE = 'D2' 
   OR DEPT_CODE = 'D2';


--SELECT에 연산이 들어갈 수 있다.
--컬럼값이 NULL이라면 어떤 연산 처리가 되어도
--결과값은 무조건 NULL
SELECT EMP_NAME, SALARY, (SALARY*12) 연봉,BONUS 보너스., (SALARY + (SALARY*BONUS))*12 연봉총합 FROM EMPLOYEE;


--NULL값 처리를 위한 함수 
--NVL() : 현재 조회한 값이 NULL인 경우 별도로 지정한 값을 변경.
SELECT BONUS ,NVL(BONUS, 0) FROM EMPLOYEE; --NULL일 경우 0으로 바꾼다.

SELECT EMP_NAME, SALARY, (SALARY*12) 연봉,BONUS 보너스, (SALARY + (SALARY*NVL(BONUS,0)))*12 연봉총합 FROM EMPLOYEE;

--DISTINCT
--해당하는 값이 컬럼에 여러 개 존재할 경우 제거하고 한개만 조회.(중복제거)(NULL도 포함.)
SELECT DEPT_CODE FROM EMPLOYEE;

SELECT DISTINCT DEPT_CODE FROM EMPLOYEE;


--DEPARTMENT 테이블을 참고하여 부서가 해외영업2부 인 부서의 부서코드를 찾고 EMPLOYEE테이블에서 해당 부서의 사원들 중 급여가 200만원보다 많이 받는 직원의 사번, 사원명, 급여 조회
SELECT DEPT_ID FROM DEPARTMENT WHERE DEPT_TITLE = '해외영업2부';
SELECT EMP_ID 사번, EMP_NAME 사원명, SALARY 급여 FROM EMPLOYEE WHERE DEPT_CODE = (SELECT DEPT_ID FROM DEPARTMENT WHERE DEPT_TITLE = '해외영업2부') AND SALARY > 2000000;

--연산자
--연결연산자 '||'
--여러 컬럼의 결과나 리터럴(값)을 하나의 컬럼으로 묶을 때 사용하는 연산자
SELECT EMP_ID||'을 가진 사원의 이름은 '||EMP_NAME||'입니다.' 아이디 FROM EMPLOYEE;

--비교연산자
-- <, >, <=, >= 
-- = : 같다
-- != 같지않다.

SELECT * FROM EMPLOYEE 
--WHERE DEPT_CODE = 'D9';
--WHERE DEPT_CODE != 'D9';
--WHERE DEPT_CODE ^= 'D9';
WHERE DEPT_CODE <> 'D9'; --모두 같지 않다.

--EMPLOYEE 테이블에서 급여가 350이상, 550이하인 직원의 사번, 사원명, 부서코드, 직급코드, 급여를 조회
SELECT EMP_ID, EMP_NAME, DEPT_CODE, JOB_CODE, SALARY FROM EMPLOYEE WHERE SALARY >=3500000 AND SALARY <= 5500000;

--방금 작성한 코드를 
--BETWEEN A AND B
SELECT EMP_ID, EMP_NAME, DEPT_CODE, JOB_CODE, SALARY FROM EMPLOYEE WHERE SALARY BETWEEN 3500000 AND 5500000;

--350 미만, 550 초과인 직원 정보 조회할 경우
SELECT EMP_ID, EMP_NAME, DEPT_CODE, JOB_CODE, SALARY FROM EMPLOYEE WHERE SALARY NOT BETWEEN 3500000 AND 5500000;

--LIKE
--입력한 숫자,문자 포함된 정보를 조회할때
--'_' : 임의의 한 문자
--'%' : 몇자리의 문자건 관계없이

--EMPLOYEE 에서 사원의 이름 가운데 '중'이 들어가는 사람 찾기
SELECT * FROM EMPLOYEE WHERE EMP_NAME LIKE '_중_';

--EMPLOYEE에서 주민번호 기준 여성인 사원정보만 조회
SELECT * FROM EMPLOYEE WHERE EMP_NO LIKE '%-2%';

--사원의 이메일 아이디가 다섯글자를 초과하는 사원의 사원명, 사번, 이메일 정보 조회
SELECT EMP_NAME, EMP_ID, EMAIL FROM EMPLOYEE WHERE EMAIL LIKE '______%@%';

--사원 중 이메일 4째자리가 '_'인 사원의 정보 조회하기(_언더바 넣기)
--ESCAPE 문자를 선언
--특수문자가 아닌 일반문자로 선언하여 사용할 수 있다. 지정한 문자 뒤에 오는 문자는  일반문자이다.
SELECT EMP_NAME, EMP_ID, EMAIL FROM EMPLOYEE WHERE EMAIL LIKE '___\_%@%' ESCAPE '\'; --#$`\ 사용해도 가능.

--EMPLOYEE 테이블에서 성이 '이'인 사원의 정보 조회
SELECT * FROM EMPLOYEE WHERE EMP_NAME LIKE '이%';

--IN 연산자
--IN (값1, 값2, 값3, ...)
--괄호 안의 있는 값들 중에 하나라도 일치하는 경우 해당 값 조회하는 연산자.

--부서 코드가 D1이거나 D6인 직원 정보 조회
SELECT * FROM EMPLOYEE WHERE DEPT_CODE IN('D1','D6');
--SELECT * FROM EMPLOYEE WHERE DEPT_CODE = 'D1' OR DEPT_CODE = 'D6';

--D1도 D6도 아닌 부서의 직원 조회
SELECT * FROM EMPLOYEE WHERE DEPT_CODE NOT IN('D1','D6');


--함수(FUNCTION)
--LENGTH(), LENGTHB()
--문자열의 길이를 계산하는 함수 //한글은 한글자당 3바이트
SELECT LENGTH('HELLO'), LENGTHB('HELLO'), LENGTH('박태욱'), LENGTHB('박태욱') FROM DUAL;

--DUAL : 임시테이블, 가상테이블, 테스트용, 더비테이블
--		 리터럴을 활용한 계산식등을 테스트하고자 할때 사용되는 임시 테이블

--오라클에서 한글은 3바이트
--LENGTHB()를 통해 해당 문자열의 바이트 크기를 확인

SELECT EMP_NAME, EMAIL, LENGTH(EMAIL) FROM EMPLOYEE;

--INSTR : 주어진 ㄱ밧에서 원하는 문자가 몇 번째인지 찾아 반환. (INSTRING)
SELECT INSTR('ABCDE','A'), INSTR('ABCDE','C'), INSTR('ABCDE','BC'), INSTR('ABCDE','Z') FROM DUAL; --못찾을때는 0

SELECT EMAIL, INSTR(EMAIL,'_') FROM EMPLOYEE;

--SUBSTR : 주어진 문자열에서 특정 부분만 꺼내오는 함수
--SUBSTR(컬럼명|값, 시작위치[, 갯수])
SELECT 'HELLO ORACLE', 
		SUBSTR('HELLO ORACLE',1,5), 
		SUBSTR('HELLO ORACLE',3,5),
		SUBSTR('HELLO ORACLE',7)
FROM DUAL;

--문제2
--EMPLOYEE테이브렝서 사원들의 이름, 이메일, 조회하는데, 이메일은 아이디 부분만 조회하기
SELECT EMP_NAME 이름, SUBSTR(EMAIL,1,INSTR(EMAIL,'@')-1) 아이디 FROM EMPLOYEE;

--LPAD/RPAD (LEFT PADDING, RIGHT PADDING)
--빈칸을 지정한 문자로 채우는 함수
SELECT LPAD(EMAIL,20,'#'), RPAD(EMAIL,20,'*') FROM EMPLOYEE;

--LTROM/RTRIM : 공백지워주는 친구
--현재 부여된 컬럼 값이나 특정 값으로부터 특정 문자를 찾아 지워준다.
SELECT '        HELLO', LTRIM('        HELLO') FROM DUAL;
SELECT 'HELLO          ', RTRIM('HELLO          ') FROM DUAL;

SELECT LTRIM('012345','0'), 
	   LTRIM('111123','1'),	--지우려는 문자가 아닌 문자가 나올 떄까지 지운다.
	   LTRIM('012345','5'),--맨 왼쪽 문자가 아니면 그냥 끝낸다.
	   RTRIM('012345','5')
FROM DUAL; --0을 찾아서 지워버린다.

--TRIM
--주어진 문자열에서 양쪽 끝을 기준으로 특정 문자를 지워주는 함수
SELECT TRIM('     HELL O           ') FROM DUAL; --가운데 공백은 못지운다.

SELECT TRIM('0' FROM '00001230000'),
	   TRIM(LEADING '0' FROM '00001230000'),
	   TRIM(TRAILING '0' FROM '00001230000'),
	   TRIM(BOTH '0' FROM '00001230000')
FROM DUAL; --문자 앞뒤를 자르는건 좀 이상하다.다름.두개 넣어도 안됨.

--LOWER/UPPER/INITCAP
--주어진 문자열을 소문자, 대문자, 앞글자만 대문자로 변경해주는 함수
SELECT LOWER('NICE TO MEET YOU'),
	   UPPER('nice to meet you'),
	   INITCAP('nice to meet you') --띄어쓰기 뒤에 글자는 모두 대문자.
FROM DUAL;

--CONCAT : 여러 문자열을 하나의 문자열로 합치는 함수
SELECT CONCAT('오라클','재밌어요') FROM DUAL;

SELECT CONCAT(EMP_NAME,'님') 성함 FROM EMPLOYEE;
SELECT EMP_NAME||'님' FROM EMPLOYEE; --연결연산자 || 를 사용해도 동일한 결과를 볼 수 있다.

--REPLACE : 주어진 문자열에서 특정 문자를 변경해준다.
SELECT REPLACE('HELLO ORACLE','HELLO','BYE') AS "HELLO TO BYE" FROM DUAL;

--[문제3]
--EMPLOYEE에서 사원의 주민번호를 확인.
--생년 생월 생일 각각 조회
--예시 : 
--이름 	| 생년 	| 생월 	| 생일
--박태욱	| 00년	| 생월	| 생일
SELECT 	EMP_NAME 이름,
		EMP_NO,
		CONCAT(SUBSTR(EMP_NO,1,2),'년') 생년,
		CONCAT(SUBSTR(EMP_NO,3,2),'월') 생월,
		CONCAT(SUBSTR(EMP_NO,5,2),'일') 생일 
FROM EMPLOYEE;

--SUBSTR 이용하면 날짜 데이터도 쪼갤 수 있다.
--'25/06/02' -> 25 / 06 / 02 날짜를 자동으로 쪼갠다.
SELECT EMP_NAME, 
HIRE_DATE, 
SUBSTR(HIRE_DATE,1,2),
SUBSTR(HIRE_DATE,4,2)
FROM EMPLOYEE;

--문제4
--EMPLOYEE에서 현재 근무하는 여성사원의 사번, 사원명, 직급코드를 조회
--ENT_YN : 퇴사 여부

--단일행 함수(Singlt Row Function)--
SELECT 	EMP_NO 사번, 
		EMP_NAME 이름, 
		JOB_CODE 직급코드, 
		ENT_YN 퇴사여부 
FROM EMPLOYEE 
WHERE ENT_YN = 'N' 
  AND SUBSTR(EMP_NO,8,1) = '2';	--AND EMP_NO LIKE '%-2%'; <- 이렇게 써도 된다.


--그룹함수(GROUP FUNCTION) : 다수의 ROW를 모아서 계산하는 친구
--다중행 함수
--SUM(), AVG(), MAX(), MIN(), COUNT()
--SUM(숫자가 기록된 컬럼) : 해당 컬럼들의 합계
 SELECT SUM(SALARY), 
		AVG(SALARY), --평균
		MAX(SALARY), --최댓값
		MIN(SALARY), --최솟값
		COUNT(SALARY) --개수
FROM EMPLOYEE;

--EMPLOYEE에서 '해외영업1부'에 근무하는 모든 사원의 평균급여, 가장 높은 급여, 가장 낮은 급여, 급여 합계 조회하기
SELECT SUM(SALARY) "급여 합계", 
		AVG(SALARY) "평균 급여",
		MAX(SALARY) "가장 높은 급여",
		MIN(SALARY) "가장 낮은 코드"
FROM EMPLOYEE
WHERE DEPT_CODE = (SELECT DEPT_ID FROM DEPARTMENT WHERE DEPT_TITLE = '해외영업1부');


--COUNT(컬럼명) : 행의 개수
SELECT COUNT(EMP_ID) FROM EMPLOYEE;
SELECT COUNT(DEPT_CODE) FROM EMPLOYEE; --NULL값은 COUNT에서 제외된다.
SELECT COUNT(*), COUNT(DEPT_CODE), COUNT(DISTINCT DEPT_CODE) FROM EMPLOYEE;

SELECT DISTINCT DEPT_CODE FROM EMPLOYEE;--COUNT에서 NULL값은 제외된다.

--날짜함수 중에서 현재 날짜, 시간 확인
SELECT 
	SYSDATE, --내컴퓨터, 시스템설정 시간
	SYSTIMESTAMP, --DATE보다 정밀한 시간
	CURRENT_DATE, --현재 세션(ORACLE)시간 (예시, 해외서버 사용할 때.)
	CURRENT_TIMESTAMP
FROM DUAL; --DATE타입

SELECT 	HIRE_DATE "입사일",
		MONTHS_BETWEEN(SYSDATE, HIRE_DATE) "입사 후 개월 수"
FROM EMPLOYEE;

--ADD_MONTHS(날짜, 개월 수)
SELECT ADD_MONTHS(SYSDATE,3) FROM DUAL;

--EXTRACT(YEAR|MONTH|DAY FROM 날짜데이터) : 지정한 날 부터 날짜값을 추출하는 함수

SELECT EXTRACT(YEAR FROM SYSDATE),EXTRACT(MONTH FROM SYSDATE),EXTRACT(DAY FROM SYSDATE) FROM DUAL;

SELECT EXTRACT(MONTH FROM HIRE_DATE) FROM EMPLOYEE;


--
SELECT HIRE_DATE, TO_CHAR(HIRE_DATE,'YYYY-MM-DD'), TO_CHAR(HIRE_DATE,'YY-MM/DD') FROM EMPLOYEE; --함수의 결과값이 문자다. // '*','-','/' 이런거 다 잘 된다.\

--TO_CHAR() : 날짜나 숫자 값을 문자 형태로 변환
-- 0 : 남은 자리 0으로 표시
-- 9 : 남은 자리는 표시하지 않는다.
 SELECT SALARY,
 		TO_CHAR(SALARY,'000,000,000'),
 		TO_CHAR(SALARY,'999,999,999'),
 		TO_CHAR(SALARY,'L000,000,000'),
 		TO_CHAR(SALARY,'L999,999,999') --L붙이면 원화 붙는다. 달러 붙이려면 $.
 FROM EMPLOYEE;

--20250603 숫자값을 날짜값으로 바꾸려면? 
--'2025-06-03' => TO_DATE()
SELECT 20250603,
	   TO_DATE(20250603,'YYYY/MM/DD'), -- / 나 - 나 다 똑같이 출력된다.(의미없다.)
	   '20250603',
	   TO_DATE('20250603','YYYYMMDD')
FROM DUAL;

--JAVA의 3항 연산자
--DECODE
--현재 근무하는 직원들의 성별을 남,여로 출력해보자.
--DECODE(컬럼|데이터, 비교값1,결과1,비교값2,결과2,...,기본값)  //짝수개씩 묶어 생각하면 편함.
SELECT 
	EMP_NAME 이름, 
	EMP_NO 주민번호, 
	DECODE(SUBSTR(EMP_NO,8,1),'2','여','남') 성별
FROM EMPLOYEE
--ORDER BY EMP_NAME; --이름 기준으로 오름차순
--ORDER BY EMP_NO;  --ORDER BY로 정렬이 가능하다.
--ORDER BY EMP_NAME DESC; -- 내림차순. (오름차순은 생략되어있다.)
--ORDER BY 2; --숫자 : SELECT문에 작성된 순서
--ORDER BY 3 DESC;
--ORDER BY 성별; --별칭 기준으로 정렬가능
ORDER BY 이름 DESC;


--문제5
--EMPLOYEE에서 모든 직원의 사번, 사원명, 부서코드, 직급코드(JOB_CODE),근무여부, 관리자 여부(MANAGER_ID)를 조회
--만약 근무여부가 Y이면 퇴사자, N이면 근무자
--관리자 사번(MANAGER_ID)있으면 사원,
--없으면 관리자.
SELECT * FROM EMPLOYEE;

SELECT 
	EMP_ID 사번, 
	EMP_NAME 사원명, 
	DEPT_CODE 부서코드, 
	JOB_CODE 직급코드, 
	ENT_YN 근무여부, 
	MANAGER_ID 관리자여부,
	DECODE(ENT_YN,'Y','퇴사자','N','근무자') 근무여부,
	DECODE(MANAGER_ID,NULL,'관리자','사원') 관리자여부
FROM EMPLOYEE;

--MANAGER_ID가 NULL이라면 NVL을 통해 0으로 값을 변경하여 확인
SELECT DECODE(NVL(MANAGER_ID,0),0,'관리자','사원') FROM EMPLOYEE;

--NVL2(컬럼|데이터,NULL이 아닐 경우 값, NULL일 경우 값)
SELECT 
	EMP_ID 사번,
	EMP_NAME 사원명, 
	BONUS 보너스,
	NVL(TO_CHAR(BONUS),'X') NVL함수,
	NVL2(BONUS, 'O','X') NVL2함수
FROM EMPLOYEE;


--CASE문
--자바에서 SWITCH문과 흡사.

--사용법
--CASE
--	WHEN 조건1 THEN 결과1
--	WHEN 조건2 THEN 결과2
--	ELSE 결과3
--END

SELECT 
	EMP_ID 사번, 
	EMP_NAME 사원명, 
	CASE 
		WHEN ENT_YN = 'Y' THEN '퇴사자'
		ELSE '근무자'
	END 근무여부,
	CASE
		WHEN MANAGER_ID IS NOT NULL THEN '사원'  --NULL은 =(같다)연산을 못함 //그래서 IS로 비교함.
		ELSE '관리자'
	END 관리자여부
FROM EMPLOYEE;



--DAY 2 연습문제

--연산자 우선순위
--0. ()
--1. 산술
--2. 연결
--3. 비교
--4. IS NULL, IN NOT NULL, LIKE, IN NOT IN
--5. BETWEEN A AND B
--6. NOT
--7. AND
--8. OR

--1.  직급이 'J2'이면서 200만원 이상 받는 직원 이거나,
--  직급이 'J7' 인 사원의 사번, 사원명, 직급코드, 급여
--  정보 조회하기
SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY FROM EMPLOYEE WHERE (JOB_CODE = 'J2' AND SALARY >= 2000000) OR JOB_CODE = 'J7';



--2.  직급이 'J7' 이거나 'J2'이면서 급여를 200만원 이상
--  받는 직원의 사번, 사원명, 직급코드, 급여, 연봉을
--  조회하시오.

SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY, (SALARY*12) 연봉 FROM EMPLOYEE 
WHERE (JOB_CODE = 'J2' AND SALARY >= 2000000) OR JOB_CODE = 'J7';



-- 3. EMPLOYEE 테이블에서
-- 모든 사원의 사번, 사원명, 이메일, 주민번호를
-- 조회하여 사원 목록표를 만들고자 한다.
-- 이 때, 이메일은 '@' 전 까지, 
-- 주민번호는 7번째 자리 이후 '*' 처리를 하여
-- 조회 하시오.
SELECT EMP_ID, EMP_NAME, SUBSTR(EMAIL,1,INSTR(EMAIL,'@')-1) 아이디, RPAD(SUBSTR(EMP_NO,1,7),14,'*') 생년월일 FROM EMPLOYEE;


--4. 직원명과 주민번호를 조회함
--  단, 주민번호 9번째 자리부터 끝까지는 '*'문자로 채움
--  예 : 홍길동 771120-1******
SELECT 
	EMP_NAME 직원명, 
	RPAD(SUBSTR(EMP_NO,1,10),14,'*') 주민번호 
FROM EMPLOYEE;


--5. 직원명, 직급코드, 연봉(원) 조회
--  단, 연봉은 ￦57,000,000 으로 표시되게 함
--     연봉은 보너스포인트가 적용된 1년치 급여임
SELECT 
	EMP_NAME, 
	JOB_CODE, 
	TO_CHAR((SALARY*12)+(SALARY*(NVL(BONUS,0))),'L00,000,000') 연봉 
FROM EMPLOYEE;


--6. 부서코드가 D5, D9인 직원들 중에서 2004년도에 입사한 직원의 정보 조회함.
--   사번 사원명 부서코드 입사일
SELECT EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE FROM EMPLOYEE WHERE DEPT_CODE IN('D5','D9') AND SUBSTR(TO_CHAR(HIRE_DATE,'YYYY-MM-DD'),1,4) = 2004;



--7. 직원명, 부서코드, 생년월일, 나이(만) 조회
--   단, 생년월일은 주민번호에서 추출해서, 
--   ㅇㅇ년 ㅇㅇ월 ㅇㅇ일로 출력되게 함.
--   나이는 주민번호에서 추출해서 날짜데이터로 변환한 다음, 계산함
--  (이상한 날짜 값이 들어간 사원들은 WHERE 조건절을 이용하여 제외)
--SELECT EMP_NAME 직원명, DEPT_CODE 부서코드, CONCAT(SUBSTR(EMP_NO,1,2),'년',SUBSTR(EMP_NO,3,2),'월',SUBSTR(EMP_NO,5,2),'일') FROM EMPLOYEE;

SELECT * FROM EMPLOYEE;
SELECT EMP_NAME 직원명, DEPT_CODE 부서코드,
	   SUBSTR(EMP_NO,1,2)||'년 ' ||
	   SUBSTR(EMP_NO,3,2)||'월 ' ||
	   SUBSTR(EMP_NO,5,2)||'일 ' 생년월일,
	   EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM TO_DATE(SUBSTR(EMP_NO,1,6), 'YYMMDD')) 나이
FROM EMPLOYEE; --날짜 이상하게 들어있는 데이터가 있어서 제대로 출력 안됨. 조건 넣어주면 될거임.




--8. 직원들의 입사일로 부터 년도만 가지고, 각 년도별 입사인원수를 구하시오.
--  아래의 년도에 입사한 인원수를 조회하시오.
--  => to_char, decode, sum 사용
--
--	-------------------------------------------------------------
--	전체직원수   2001년   2002년   2003년   2004년
--	-------------------------------------------------------------
SELECT 
	COUNT(*) 전체,
	COUNT(DECODE(TO_CHAR(EXTRACT(YEAR FROM HIRE_DATE)),'2001',1)) "2001년",
	COUNT(DECODE(TO_CHAR(EXTRACT(YEAR FROM HIRE_DATE)),'2002',1)) "2002년",
	COUNT(DECODE(TO_CHAR(EXTRACT(YEAR FROM HIRE_DATE)),'2003',1)) "2003년",
	COUNT(DECODE(TO_CHAR(EXTRACT(YEAR FROM HIRE_DATE)),'2004',1)) "2004년"
FROM EMPLOYEE;


--9.  부서코드가 D5이면 총무부, D6이면 기획부, D9이면 영업부로 처리하시오.
--   단, 부서코드가 D5, D6, D9 인 직원의 정보만 조회함
--  => case 사용
--   부서코드 기준 오름차순 정렬함.
SELECT EMP_NAME, DEPT_CODE, 
	CASE 
		WHEN DEPT_CODE = 'D5' THEN '총무부' 
		WHEN DEPT_CODE = 'D6' THEN '기획부' 
		WHEN DEPT_CODE = 'D9' THEN '영업부' 
	END "부서명"
FROM EMPLOYEE
WHERE DEPT_CODE IN('D5','D6','D9')
ORDER BY 2 ; --두번째 컬럼을 기준으로.








