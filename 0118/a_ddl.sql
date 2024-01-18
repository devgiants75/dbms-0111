# DDL
# 1. DDL의 기본 구성요소
# 데이터베이스: 관련 데이터의 모음
# 테이블: 데이터를 저장하는 기본 단위
# >> 행과 열로 구성 
# >> 각 행은 데이터 레코드(집합), 각 열은 특정 속성(필드)
# 필드 / 컬럼: 데이터의 특정 유형 지정, 각 필드는 고유한 이름과 데이터 타입
# 데이터 타입: 필드에 저장할 수 있는 데이터 종류를 정의

# ----- 데이터베이스 -----
# 2. 데이터베이스 생성(create)
# : 데이터를 저장하고 관리하는 첫 단계
# 기본 형태
# : create database database_name;
create database database_name;

# 3. 데이터베이스 선택(use)
# : 생성한 데이터베이스를 사용하기 위해서는 해당 데이터베이스를 선택하여야 함.
# : 선택하지 않을 경우 해당 데이터베이스 내의 구성요소를 사용할 수 X
# : 선택한 경우 모든 SQL 명령어는 선택된 데이터베이스 내에서 실행
# 기본형태
# : use database_name;
use database_name;
use world;

# 4. 데이터베이스 삭제(drop database)
# : 데이터베이스를 삭제하는 기능, 해당 작업은 실행 후 되돌릴 수 X
# 기본형태
# drop database database_name;
drop database database_name;

# 5. 데이터베이스 목록 조회(show databases)
# : 서버에 존재하는 모든 데이터베이스 목록을 확인
# 기본형태
# show databases;
show databases;

# ----- 테이블 -----
# 1. 테이블 생성(create table)
# : 새로운 테이블을 생성, 테이블에 저장될 데이터의 형태와 특성을 정의
# : >> 데이터타입, 제약조건, 기본값 등을 설정 가능
# 기본 형태
# create table table_name (
	# column1 datatype [optionals],
	# column2 datatype [optionals],
	# column3 datatype [optionals],
	# ...
# )
# optionals: 컬럼에 적용할 선택적 특성 - not null지정, 기본값 설정 등

create database example;
use example;
create table students (
	student_id int,
    name varchar(100) not null,
    age int not null,
	major varchar(100)
);

# 2. 테이블 구조 조회(describe, desc)
# : 테이블의 구조
# : 테이블에 정의된 컬럼, 데이터 타입, 키 정보(제약조건) 등을 조회하는데 사용
use example;
-- 왼쪽 Navigator의 Schemas 필드의 데이터베이스명을 더블 클릭
# 기본 형태
# describe table_name;
describe `students`;
# Field(각 컬럼의 이름), Type(각 컬럼의 데이터 타입), Null(Null 허용 여부)
# Key(각 컬럼의 제약사항-키), Default(기본값 지정), Extra(제약사항-추가옵션)
desc `students`;

# 3. 테이블 수정(alter table)
# : 이미 존재하는 테이블의 구조를 변경하는 데 사용
# : 컬럼을 추가, 수정, 삭제 또는 제약 조건을 추가, 수정, 삭제 

# a. 컬럼 추가(add column)
# 기본형태: alter table table_name 
#         add column_name column_definition;
# 기존의 학생 테이블에 email 컬럼을 추가
alter table `students`
add email varchar(255);

# b. 컬럼 수정(modify column)
# 기본 형태: alter table table_name
#          modify column_name new_column_definition;
alter table `students`
modify email varchar(100);

# c. 컬럼 삭제 (drop column)
# 기본 형태: alter table table_name drop column_name;
alter table `students` drop email;

desc `students`;

# d. 제약 조건 추가
# --------------

# 4. 테이블 삭제(drop table)
# : 데이터베이스에서 해당 테이블을 영구적으로 삭제
# 기본 형태
# : drop table [if exists] table_name;

# if exists
# : 선택적 키워드, 테이블이 존재하는 경우에만 삭제를 수행
# drop문은 해당 삭제하고자하는 형태가 존재하지 않을 경우 오류
# : if exists 사용 시 존재할 때만 삭제하기 때문에 오류 X

drop table if exists `lectures`; -- 오류 발생 시 해당 위치부터 그 아래의 코드 실행X
drop table if exists `students`;
drop table if exists `integer`;

# 5. 테이블 목록 조회(show tables)
# : 모든 데이터베이스에 있는 모든 테이블의 목록을 조회
# show tables [from database_name];
show tables from sys;

# 데이터베이스와 테이블을 동시 지정
# : 테이블의 위치를 명확하게 전달하기 위해 (.)기호를 사용하여 경로를 지정
# : 데이터베이스.테이블
use sys;
create database online_shop;
create table `online_shop`.`users` (
	username varchar(50),
    password varchar(50)
);

drop database `example`;
drop database `online_shop`;