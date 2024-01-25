### 조인(join) ###

#! 조인
# : 두 개의 테이블을 서로 묶어서 하나의 결과를 만들어 내는 것

#! 내부 조인(inner join)
# : 두 개 이상의 테이블에서 특정 열(기준 열)의 값이 
# : , 일치하는 행만 가져오는 조인
# : >> 교집합을 반환

# 일대다 관계
# : 하나의 테이블의 한 행이 다른 테이블의 여러 행과 관련되는 경우
# : member 테이블 - buy 테이블
# : 각 회원은 여러 구매 기록을 가짐 (1회원 : 여러 개의 구매기록)

# 1명의 회사원 - 여러 번 급여
# 학생 테이블 - 학점 테이블

#! 내부 조인의 기본 형태
# select 열 목록
# from 첫 번째 테이블
# 		(inner) join 두 번째 테이블
#		on 조인될 조건
# [where 조건...]

#! 내부 조인 예제
# 구매 테이블에서 '1' member_id를 가진 사람이 
# 구매한 물건을 발송하기 위해 조인

use korea_db;

select
	*
from
	`buy`
inner join `member`
on `buy`.`member_id` = `member`.`member_id`
where `buy`.`member_id` = 1;

# 조인 시 두 개 이상의 테이블에서 동일한 열 이름이 존재할 경우
# 테이블명.열이름 형식으로 표기! 권장

# 금액이 특정 값 이상인 모든 구매 내역을 조회
select
	M.name, B.purchase_date, B.amount
from
	member M
inner join buy B
on M.member_id = B.member_id
where 
	B.amount >= 20000;

# 회원 이름 별로 구매 금액을 내림차순 정렬
select
	M.name, sum(B.amount) as total_purchase
from 
	member M
join
	buy B
on
	M.member_id = B.member_id
group by
	M.name
order by
	total_purchase desc;
    
# 한 번이라도 구매한 기록이 있는 회원들을 추출
select 
	distinct M.name, M.contact
from
	member M
inner join
	buy B
on 
	M.member_id = B.member_id;