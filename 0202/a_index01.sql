# 인덱스(Index)
# : select를 사용해서 테이블을 조회할 때 결과를 빠르게 추출하는 도구

#! 인덱스 종류
# 클러스터형 인덱스
# : 기본 키로 지정하면 자동 생성, 테이블 당 1개만 생성 가능
# : 기본 키로 지정한 열을 기준으로 자동 정렬

# 보조 인덱스
# : 고유 키로 지정하면 자동 생성, 테이블 당 여러 개 생성 가능
# : 자동 정렬 X

#! 인덱스 장점
# 1. 장점
# : select문으로 검색하는 속도가 매우 빨라짐
# : 속도 향상 시 > 컴퓨터의 처리 속도가 빨라짐 
	# (전체 시스템 성능 향상)
    
# 2. 단점
# : 인덱스도 공간을 차지하기 때문에 
#   데이터베이스 안에 추가적인 공간이 필요 (테이블 크기의 10%)
# : 처음에 인덱스를 만드는 데 시간이 소요

#! 인덱스의 종류
# 1. 클러스터형 인덱스 (ex. 영어사전, 국어사전)
# : 책의 내용이 이미 정렬되어 책 자체가 찾아보기

# 2. 보조 인덱스 (ex. 일반 책의 찾아보기)
# : 원하고자하는 내용을 찾기 위해서 표시된 페이지를 열어야 확인 가능

#! 자동으로 생성되는 인덱스
# 테이블의 열(컬럼) 단위에 생성
# , 하나의 열에는 하나의 인덱스를 생성 가능

use market_db;
select * from member;

# market_db의 회원 테이블(member)로 인덱스를 정리하는 경우
# member테이블은 8개의 서로 다른 인덱스 생성 가능

# member 테이블은 회원 아이디(mem_id)가 기본 키로 설정
# : 자동으로 mem_id열에 클러스터형 인덱스가 생성
# : >> 클러스터형 인덱스의 경우 테이블에 한 개만 생성 가능

create table table1 (
	col1 int primary key,
    col2 int,
    col3 int
);

# 인덱스 정보 확인: show index from 테이블명;
show index from table1;

# show index의 결과 확인
# >> Key_name: Primary (기본 키 설정으로 자동 생성된 인덱스)
#    : 클러스터형 인덱스 = Primary

# >> Column_name: col1 (col1 열에 인덱스가 생성되어 있다.)
# >> Non_unique: 고유하지 않다 (중복이 허용되는지의 여부)
#    0(False), 1(True)를 의미 >> 중복이 허용되지 않는 인덱스

create table table2 (
	col1 int primary key,
    col2 int unique,
    col3 int unique
);

show index from table2;

# show index의 결과 확인
# >> Key_name: col2, col3 (열 이름 지정 시 - 보조 인덱스)
# >> Non_unique: 고유 키도 중복 허용하지 X 
# >> 고유 키는 한 테이블에 여러 개 지정 가능 (보조 인덱스 여러 개 가능)

#! 자동으로 정렬되는 클러스터형 인덱스
# : 기본 키 설정 시 자동 생성 / 테이블 당 1개 / 자동 정렬
select * from member;

drop table if exists buy, member;
create table member (
	mem_id char(8),
    mem_name varchar(10),
    mem_number int,
    addr char(2)
);

insert into member values ('TWC', '트와이스', 9, '서울');
insert into member values ('BLK', '블랙핑크', 4, '경남');
insert into member values ('WMN', '여자친구', 6, '경기');
insert into member values ('OMY', '오마이걸', 7, '서울');

select * from member;

alter table member
	add constraint primary key (mem_id);

select * from member;

# 제약 조건 수정
alter table member drop primary key; -- 기본 키 제거

alter table member
	add constraint primary key (mem_name);

select * from member;

# 인덱스 지정 후 (pk 지정 후) 추가로 데이터 입력 시
# : 해당 정렬 기준에 따라 자동 정렬

insert into member values ('GRL', '소녀시대', 8, '서울');
select * from member;

#! 정렬 되지 않는 보조 인덱스
# 고유 키 지정 시 생성 / 테이블 당 여러 개 가능 / 정렬 X

drop table if exists member;
create table member (
	mem_id char(8),
    mem_name varchar(10),
    mem_number int,
    addr char(2)
);

insert into member values ('TWC', '트와이스', 9, '서울');
insert into member values ('BLK', '블랙핑크', 4, '경남');
insert into member values ('WMN', '여자친구', 6, '경기');
insert into member values ('OMY', '오마이걸', 7, '서울');

alter table member
	add constraint unique (mem_id);

# 보조 인덱스 생성 후에도 테이블 내의 데이터 내용이나 순서 변경 X
select * from member;

alter table member
	add constraint unique (mem_name);

select * from member;

insert into member values ('GRL', '소녀시대', 8, '서울');
select * from member;


#! 클러스터형 인덱스 (영어, 국어 사전)
-- 기본 키(PK)
-- 테이블 당 1개
-- 지정한 열로 정렬

#! 보조 인덱스 (일반 책의 찾아보기)
-- 고유 키(UNIQUE)alter
-- 테이블 당 여러개
-- 정렬되지 않음