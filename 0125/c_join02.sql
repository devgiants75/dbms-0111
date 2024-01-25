### 외부 조인 ###

#! 외부 조인(outer join)
# : 두 테이블을 조인할 때 필요한 내용이 한쪽 테이블에만 있어도
# : , 결과를 추출할 수 있는 조인
# : 조인 조건(on)이 맞지 않는 행도 결과에 포함

#! 외부 조인에는 
# left outer join, right outer join, full outer join

#! 기본 형태
# select 열 목록
# from 첫 번째 테이블
#		<left | right | full>outer join (기본-left)
#		on 조인될 조건
# [where 검색 조건];

# left outer join
# : 왼쪽 테이블의 모든 레코드와 
# : , 오른쪽 테이블의 매칭되는 레코드만 포함

#! 외부 조인 예제
# 전체 회원의 구매 기록(구매 기록이 없는 회원의 정보도 함께) 출력

select 
	M.member_id, M.name, B.product_code, M.area_code
from
	member M
left outer join	
	buy B
on M.member_id = B.member_id
order by M.member_id;

# left (outer) join: 왼쪽 테이블의 내용은 모두 출력되어야 함

#! right outer join 예제
select
	M.member_id, M.name, B.product_code, M.area_code
from
	buy B
right outer join
	member M -- 오른쪽에 있는 회원 테이블을 기준으로 외부 조인
on M.member_id = B.member_id
order by M.member_id;
    
# 구매 이력이 없는 회원의 목록을 추출
select 
	M.member_id, B.product_code, M.name, M.contact
from
	member M
		left outer join buy B
		on M.member_id = B.member_id
where
	B.product_code is null
order by 
	M.member_id;

# full outer join
# : 왼쪽 외부 조인과 오른쪽 외부 조인을 합친 것
# : 왼쪽이든 오른쪽이든 들어있는 내용이면 모두 출력