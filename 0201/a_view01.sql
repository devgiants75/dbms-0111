# 데이터베이스 - 뷰 

# 뷰(View)
# : 데이터베이스 개체 중 하나

# 뷰(View)와 테이블의 차이점
# : 테이블은 데이터를 가짐, create 키워드를 사용하여 생성
# : 뷰는 데이터 가지지 X, select 키워드로 생성

# 뷰의 종류
# 단순 뷰: 하나의 테이블과 연관된 뷰
# 복합 뷰: 2개 이상의 테이블과 연관된 뷰

use market_db;
select mem_id, mem_name, addr from member;

# 뷰 생성 방법
# create view 뷰_이름
# as
# 	select문;

# 뷰 접근 방법
# : select문을 사용 (전체 접근 | 테이블 조회 처럼 조건식 사용도 가능)

# select 열이름 from 뷰이름
	# [where 조건];

create view v_member
as
	select mem_id, mem_name, addr from member;

select * from v_member;

select * from v_member
	where addr in ('서울', '경기');

# 뷰의 작동 방식
# 1. 사용자가 뷰를 테이블로 생각하고 접근
# 2. 해당 뷰가 관계된 테이블을 찾아 데이터를 가져옴
# 3. 정제된 뷰로써 사용자에게 결과를 출력

# 뷰를 사용하는 이유
# 1. 보안(security)에 도움
# : 중요한 개인 정보 유출을 방지
# : 외부에 공개해야 할 데이터가 있는 경우
# : , 해당 데이터만 따로 뷰로 생성하여 공개
# : >> 권한을 제한하는 용도 사용

# 2. 복잡한 SQL을 단순하게 작업
# 물건을 구매한 회원에 대한 정보 출력

create view v_memberbuy
as
	select 
		B.mem_id, M.mem_name, B.prod_name, M.addr
		, concat(M.phone1, M.phone2) '연락처'
	from 
		buy B
			inner join member M
			on B.mem_id = M.mem_id;

select * from v_memberbuy
	where mem_name = '블랙핑크';