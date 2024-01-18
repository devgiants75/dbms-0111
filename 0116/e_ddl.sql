### DDL 문법 정리 ###
# create, alter, drop, truncate

# 코리아 쇼핑 DB 구성
# 1. 회원(member) 테이블
# : 회원 테이블의 필수 값 지정

# *회원 ID(member_id): 기본키, 각 회원을 고유하게 식별하는 식별자
# *이름(name): 회원의 이름
# *성별(gender): 회원의 성별
# *지역코드(area_code): 회원의 거주 지역을 나타내는 코드
# 회원등급(grade): 회원의 등급
# *연락처(contact): 회원의 연락처
# 포인트(points): 회원의 포인트
# *가입일(join_date): 회원이 가입한 날짜 

-- GUI 환경에서 데이터베이스 & 테이블 생성
-- 1. 데이터 베이스 생성
-- 왼쪽 상단 아이콘 메뉴바 네 번째 스키마 아이콘 선택
-- 스키마명 입력 후 > 인코딩 설정 > 우측 하단의 Apply 클릭

# 인코딩(encoding): 정보의 형태나 형식을 변환하는 처리나 처리 방식
# utf-8: 전 세계에서 가장 많이 사용되는 유니코드 인코딩
# utf-8 / utf_general_ci

-- 2. 테이블 생성
-- 왼쪽 네비게이션 패널에서 생성하고자 하는 위치의 스키마 선택(더블 클릭)
-- :선택된 스키마 ▶클릭 시
-- :스키마 구성 목록에서 Tables 마우스 오른쪽 클릭
-- :Create Table 선택
-- :테이블 설정(테이블명, 컬럼명, 컬럼 조건 지정)
-- :반드시 Apply 버튼 클릭하여 생성

# PK(Primary Key) - 기본 키, NN(Not Null) - 필수 값

-- 3. 생성된 테이블 확인
-- 왼쪽 네비게이션 패널에서 확인하고자 하는 테이블에 마우스를 올림

-- 4. 생성된 데이터베이스 & 테이블 삭제
-- 삭제하고자 하는 데이터베이스 우클릭 > Drop Schema > Drop Now
-- 삭제하고자 하는 테이블 우클릭 > Drop Table

-- SQL 명령어로 데이터베이스 & 테이블 생성
-- 1. 스키마 생성 SQL문: create database 스키마(데이터베이스)명;
-- 1개의 SQL문 실행: ctrl + enter
-- 여러개(다중) SQL문 실행: (드래그) ctrl + shift + enter

-- SQL 명령문으로 데이터베이스 & 테이블 생성하는 경우
-- Navigator에서 새로고침을 해야 확인 가능
create database korea_db;

-- 2. 테이블 생성 SQL문: create table 스키마명.테이블 명 (
-- 	지정하고자하는컬럼 데이터타입 옵션,
--  컬럼2 데이터타입 옵션,
--  ...
-- )
-- default character set = utf8;

# 컬럼: 테이블에 포함될 열의 이름
# 데이터타입: 각 열의 데이터 유형을 정의
# 옵션: 제약조건
create table `korea_db`.`buy` (
	purchase_id int primary key,
    member_id char(8),
    product_code char(6),
    purchase_date date,
    amount int,
    quantity smallint
);

-- 3. 생성된 테이블 확인
-- 코리아 디비 데이터베이스 안의 buy테이블의 모든(*) 컬럼을 가지고 온다.
select * from `korea_db`.`buy`; 

-- 4. 생성된 데이터베이스 & 테이블 삭제
drop table `korea_db`.`buy`;
drop database `korea_db`;