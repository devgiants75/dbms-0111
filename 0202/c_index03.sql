# 인덱스의 실제 사용 #

# 1. 인덱스 생성 문법
# 제약조건(pk, unique) 외에 직접 인덱스 생성
# : create index문 사용

# create [unique] index 인덱스_이름
# 	on 테이블_이름 (열_이름) [asc | desc]

# unique: 중복이 안되는 고유 인덱스 생성
# >> 생략 시 중복이 허용

# asc | desc: 오름차순 | 내림차순으로 인덱스 정렬

# 2. 인덱스 제거 문법
# : create index로 생성한 인덱스는
# : , drop index로 제거

# drop index 인덱스_이름 on 테이블_이름
# >> 기본 키, 고유 키로 자동 생성된 인덱스는 
#    drop index로 제거 X

# >> alter table 문으로 기본 키나 고유 키를 제거하면
#    : 자동으로 생성된 인덱스도 제거 가능

use market_db;
select * from member;

show index from member;
show table status;
# >> Data_length: 클러스터형 인덱스의 크기를 Byte로 표기
# MySQL의 1페이지 크기는 기본적으로 16KB(16384)

# >> Index_length: 보조 인덱스의 크기
# member 테이블은 보조 인덱스가 없기 때문에 표기 X

show table status like 'member';

# member 테이블에 보조 인덱스 추가 생성
# idx_member_addr

# 보조 인덱스의 종류
# 단순 보조 인덱스: 중복을 허용하는 인덱스 ex) 이름 
# 고유 보조 인덱스: 중복을 허용하지 않는 인덱스 ex) 전화번호, 이메일

# 단순 보조 인덱스
create index idx_member_addr
	on member (addr);

show index from member;
# Key_name: 새로 생성된 인덱스명
# Column_name: 인덱스로 지정된 열 이름
# Non_unique: 1 - 고유하지 않다(중복 가능하다)

show table status like 'member';
# Index_length: 보조 인덱스의 크기 - 0

# 생성된 인덱스를 실제로 적용 시키는 방법
# : 테이블을 분석/처리 
# analyze table문 사용
analyze table member;
show table status like 'member';
# Index_length: 보조 인덱스의 크기 - 16384

#! 고유 보조 인덱스 생성 - mem_number (인원수)
select * from member;

-- create unique index idx_member_mem_number
-- 	on member (mem_number);

create unique index idx_mem_name
	on member (mem_name);
show index from member;
# Non_unique: 0으로 설정 - 중복되어있지 않다.

-- insert into member
-- values 
-- ('BLACKPINK', '블랙핑크', 4, '서울', '001', '12341234',
-- 	155, '2020-10-10');

# unique 옵션을 통해 인덱스 생성 시
# : 업무상 절대로 중복되지 않는 열
# : 주민등록번호, 학번, 이메일 등에만 사용!!

analyze table member; -- 지금까지 만든 인덱스 적용
show index from member;

select * from member; 
# 인덱스를 사용했는지 여부 확인을 위해서는
# 결과 창 중 [Execution Plan] 창을 확인
# >> 전체 테이블에서의 검색의 경우: Full Table Scan

#! 인덱스가 있는 열 조회
select mem_id, mem_name, addr from member;
# >> Full Table Scan

#! 인덱스가 있는 열의 특정 데이터 조회
select mem_id, mem_name, addr
from member
where mem_name = '에이핑크';
# Single Row (constant): 인덱스를 사용해서 결과를 얻었다.
# >> Execution Plan 창에서 Full Table Scan을 제외한 결과는
#    , 모두 인덱스를 사용했다는 의미

#! 숫자 범위 조회
# 숫자로 구성된 인원수로 단순 보조 인덱스
create index idx_member_mem_number
	on member (mem_number);
analyze table member; -- 인덱스 적용

select mem_name, mem_number
from member
where mem_number >= 7;
# Index Range Scan: 인덱스를 사용한 조회

# >>> where 조건절에 인덱스로 생성된 열 이름이 포함되어 있어야
#     인덱스를 사용 할 수 있다.

#! 인덱스를 사용하지 않을 때
# : 인원 수가 1명 이상인 회원을 조회
select mem_name, mem_number
from member
where mem_number >= 1;
# Full Table Scan
# : 인덱스가 있더라도 MySQL이 인덱스 검색보다는
# : 전체 테이블 검색이 더 낫다고 판단

#! 인원 수의 2배를 하면 14명 이상이 되는 회원의 이름과 인원수 검색
select mem_name, mem_number
from member
where mem_number * 2 >= 14;
# Full Table Scan
# where문에서 열에 연산을 가하는 경우 인덱스 사용 X

select mem_name, mem_number
from member
where mem_number >= 14 / 2;
# Index Range Scan
# >> where 절에서는 열이름에 연산을 가하지 X

#! 인덱스 제거 
show index from member;
# idx_mem_name, idx_member_addr, idx_member_mem_number

# 인덱스 제거 시
# : 클러스터형 인덱스와 보조 인덱스가 섞여 있을 경우 
# : 보조 인덱스를 먼저 제거하는 것을 권장
# (보조 인덱스 사이의 순서는 상관 X)

# drop index 인덱스명 on 테이블명;
drop index idx_mem_name on member;
drop index idx_member_addr on member;
drop index idx_member_mem_number on member;

# > 클러스터형 인덱스를 먼저 제거해도 가능
#   , 클러스터형의 경우 데이터를 재구성하기 때문에 시간 소요 증가

# 기본 키 지정으로 자동 생성된 클러스터형 인덱스 제거
# >> drop index문으로 제거 X / alter table문으로만 제거 가능

alter table member
	drop primary key;
# member의 mem_id 열을 buy 참조
# >> 기본키 제거 시 반드시 외래 키와의 관계를 제거

# 외래키 제거 방법
# : 외래키의 명을 확인
# >> information_schema 데이터베이스의 
# >> , referential_constraints 테이블을 조회하면 외래키 명 확인

select table_name, constraint_name
	from information_schema.referential_constraints
    where constraint_schema = 'market_db';

# 외래키 제거 방법
alter table buy
	drop foreign key buy_ibfk_1;

alter table member
	drop primary key;

show index from member;