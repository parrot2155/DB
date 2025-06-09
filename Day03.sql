--DAY03 0609 월요일

--숫자 데이터 함수


--ABS() : 절댓값 표현
SELECT ABS(10), ABS(-10) FROM DUAL;


--MOD() : 주어진 컬럼이나 값을 나눈 나머지를 반환. 나머지.
SELECT MOD(10,3), MOD(10,6) ,(10/6) --몫을 알고 싶을 때 그냥 나누기 하면 됨. %는 사용 못함.
FROM DUAL;


--CEIL() : 소수점 첫째자리에서 올림
--FLOOR() : 소수점 버림
SELECT CEIL(123.456) , CEIL(123.678), CEIL(123),
	   FLOOR(123.456), FLOOR(123.678), FLOOR(123)
FROM DUAL;


--TRUNC() : 지정한 소수점 자리부터 버림.
SELECT TRUNC(123.456,0), TRUNC(123.456,1), TRUNC(123.456,2), TRUNC(123.456,-2)
FROM DUAL;


--EMPLOYEE 테이블에서 입사한 달이 홀수달인 사원들의 사번, 사원명, 입사일 조회
SELECT EMP_NO , EMP_NAME, HIRE_DATE FROM EMPLOYEE WHERE MOD(SUBSTR(HIRE_DATE,5,1),2) = 1;


--MONTHS_BETWEEN() : 두 날짜 사이의 개월 수
SELECT EMP_NAME, HIRE_DATE, TRUNC(MONTHS_BETWEEN(SYSDATE, HIRE_DATE),0) FROM EMPLOYEE;


--NEXT_DAY
--앞으로 다가올 가장 가까운 요일을 반환
SELECT NEXT_DAY(SYSDATE, '토요일'),  NEXT_DAY(SYSDATE,'일'), NEXT_DAY(SYSDATE,6) --, NEXT_DAY(SYSDATE, 'SATURDAY') 언어설정이 한글이라 영어는 안먹힘,.;;
FROM DUAL;


SELECT * FROM V$NLS_PARAMETERS;
--현재 설정도니 정보를 테이블 형태로 보관 -> 이러한 테이블을 '데이터 사전(데이터 딕셔너리)'

SELECT * FROM TABS;


--LAST_DAY() : 해당 달의 마지막 날짜.
SELECT LAST_DAY(SYSDATE)
FROM DUAL;

--날짜값 끼리 +,- 연산 가능.
SELECT (SYSDATE - 10), (SYSDATE - TO_DATE('2022/03/01','RR/MM/DD')), (SYSDATE + 10)
FROM DUAL;

SELECT HIRE_DATE, (HIRE_DATE + 10)
FROM EMPLOYEE;













