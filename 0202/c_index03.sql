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




