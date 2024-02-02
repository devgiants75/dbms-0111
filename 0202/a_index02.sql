# 인덱스의 내부 작동 #

# 1. 균형 트리
# : 클러스터형과 보조 인덱스 모두 내부적으로 균형 트리를 생성

# 균형 트리
# : 자료 구조에 나오는 데이터 구조 중 하나
# : 나무를 거꾸로 표현한 자료 구조
# : >> 제일 상단의 뿌리를 루트, 줄기를 중간, 끝에 달린 잎을 리프

# 노드(node)
# : 균형 트리 구조에서 데이터가 저장되는 공간

# 루트 노드(root node)
# : 노드의 가장 상위 노드, 모든 출발은 루트 노드에서 시작

# 리프 노드(leaf node)
# : 제일 마지막에 존재하는 노드

# 노드 구조의 경우 데이터의 양에 따라 2단계, 3단계
# , 그 이상의 구조로 나뉠 수 있음

# 중간 노드: 루트 노드와 리프 노드 중간에 끼인 노드
# >> 여러 개로 표현 가능

# 노드(node)는 데이터 공간의 개념적 설명
# mySQL에서는 페이지(page)라고 불림

# 페이지(mySQL의 노드)
# : 최소한의 저장 단위
# 16Kbyte(16383byte) 크기를 가짐
# ex) 데이터를 1건만 입력 > 1개 페이지(16Kbyte)가 필요

#! 모두 리프 페이지만 있는 경우
# 데이터를 처음부터 끝까지 검색
# : 전체 테이블 검색

# 데이터를 읽을 때: 데이터의 건수는 의미X
# 몇 개의 페이지를 읽었느냐로 효율성을 판단 O

# 균형 트리의 페이지 분할
# 인덱스 구성 시 데이터 변경 작업
# : insert, update, delete 사용 시
# : 성능 저하 >> 페이지 분할 작업 수행

#! 인덱스 구조
# : 인덱스를 생성하면 왜 데이터가 정렬되는지
# : , 어떤 인덱스가 더 효율적인지

# 클러스터형 인덱스 구성
use market_db;
create table cluster(
	mem_id char(8),
    mem_name varchar(10)
);

insert into cluster values ('TWC', 'a');
insert into cluster values ('BLK', 'b');
insert into cluster values ('WMN', 'c');
insert into cluster values ('OMY', 'd');
insert into cluster values ('GRL', 'e');
insert into cluster values ('ITZ', 'f');
insert into cluster values ('RED', 'g');
insert into cluster values ('APN', 'h');
insert into cluster values ('SPC', 'i');
insert into cluster values ('MMU', 'j');

select * from cluster;

alter table cluster
	add constraint
		primary key (mem_id);

select * from cluster;

# 위의 cluster 테이블은
# 1개의 루트 페이지
# 3개의 리프(데이터) 페이지

#! 보조 인덱스 구성
create table second(
	mem_id char(8),
    mem_name varchar(10)
);

insert into second values ('TWC', 'a');
insert into second values ('BLK', 'b');
insert into second values ('WMN', 'c');
insert into second values ('OMY', 'd');
insert into second values ('GRL', 'e');
insert into second values ('ITZ', 'f');
insert into second values ('RED', 'g');
insert into second values ('APN', 'h');
insert into second values ('SPC', 'i');
insert into second values ('MMU', 'j');

alter table second
	add constraint unique (mem_id);
select * from second;

# 보조 인덱스의 경우 데이터 페이지가 바뀌지 X
# >> 별도의 공간에 인덱스 페이지를 생성 

# 보조 인덱스의 데이터 위치: 페이지 번호 + #위치
# 클러스터형 인덱스가 보조 인덱스 보다 속도가 조금 더 빠름