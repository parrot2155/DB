--주석
--실행
SELECT * FROM TEST;

SELECT * FROM TEST2;

--EMPLOYEE SCRIPT 실행 후 (테이블 생성 및 데이터 추가 후)
SELECT * FROM EMPLOYEE;

SELECT * FROM TABS;

--SELECT문
--특정 테이블의 특정 데이터들을 조회하는 명령어
--SELECT 컬럼명[,(컬럼명),(계산식)..] FROM 테이블명

--모든 행, 모든 컬럼 조회
--모든 행 : 조건 딱히 없다.
--모든 컬럼 : *
SELECT * FROM EMPLOYEE;

--사원ID와(EMP_ID) 사원명(EMP_NAME), 연락처(PHONE) 조회
--EMPLOYEE테이블에서
SELECT EMP_ID, EMP_NAME, PHONE FROM EMPLOYEE;

--WHERE절
--테이블에서 조건을 만족하는 값을 가진 행을 
--따로 선택하여 조회하는 조건 절

--부서 코드가 'D6'인 사원 정보 모두 조회
SELECT * FROM EMPLOYEE WHERE DEPT_CODE = 'D6';

SELECT EMP_NAME, EMP_NO FROM EMPLOYEE WHERE DEPT_CODE = 'D6';

--직급(JOB_CODE)이 'J1'인 사원의 
--사번, 사원명, 직급코드, 부서코드를 조회하자.
SELECT EMP_ID, EMP_NAME,JOB_CODE, DEPT_CODE FROM EMPLOYEE WHERE JOB_CODE = 'J1';


--EMPLOYEE테이블에서
--급여가 300이상인 사원의 아이디 이름 직급 급여 조회
SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY FROM EMPLOYEE WHERE SALARY >= 3000000;

-- +조건이 급여가 300만 이상이고 직급이 'J3'인 사원
SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY FROM EMPLOYEE WHERE SALARY >= 3000000 AND JOB_CODE = 'J3';


