# select
# : dml 문법 / 데이터베이스에서 데이터를 조회

# select문의 기본 구조(작성 순서)
-- select 컬럼명(열 목록): 원하는 열(컬럼)을 지정
-- from 테이블명: 어떤 테이블에서 데이터를 가져올 지 지정
-- where 조건: 특정 조건에 맞는 데이터만 선택
-- group by 그룹화 할 열 이름: 특정 열을 기준으로 그룹화
-- having 그룹 조건: 그룹화 한 이후의 조건을 지정
-- order by 정렬 열이름: 결과를 특정 열의 순서로 정렬
-- limit 행 수 제한: 반환할 행의 수를 제한

use korea_db;

# 기본 조회
# : select 컬럼명 from 데이터베이스명.테이블명
select `name` from `korea_db`.`member`;

# 해당 테이블의 전체 컬럼을 조회할 때
# : * 기호를 사용하여 전체 컬럼을 지정
select * from `korea_db`.`member`; 

# 2개 이상의 여러 컬럼 조회를 위해서는
# 해당 컬럼명을 ,로 구분하여 나열
select 
	`member_id`, `name`, `grade` 
from 
	`korea_db`.`member`;
    
# 열 이름에 별칭(alias)을 지정하는 방법
# : 열 이름 다음에 지정하고자 하는 별칭 입력
# : 별칭에 공백이 있을 경우 따옴표로 묶음

select 
	`member_id` "멤버 아이디", `name` as 멤버
from
	`korea_db`.`member`;

# 특정 조건을 부합하는 데이터 조회
# : select ~ from ~ where

select
	`member_id`, `name`, `points`
from
    `korea_db`.`member`
where
	points > 200;

# where 조건절 사용 시 주로 사용되는 연산자

# 1. 관계 연산자
# > 크다, < 작다, >= 크거나 같다, <= 작거나 같다
# = 같다, != 같지 않다
select
	`member_id`, `name`, `points`
from
    `korea_db`.`member`
where
	`name` != "Minji";

# 2. 논리 연산자
# : 여러 조건을 조합하여 데이터를 조회

# and: 모든 조건이 참(두 조건 모두 참)
# member 테이블 
# : area_code가 BUSAN 이면서 grade이 "Silver"
select
	*
from 
	`korea_db`.`member`
where
	area_code = 'BUSAN' and grade = 'Silver';

# or: 두 조건 중 하나라도 참(조건 중에 하나라도 참이면 참)
# 지역코드(area_code)가 SEOUL 이거나 BUSAN인 회원을 조회
select
	*
from 
	`korea_db`.`member`
where
	area_code = 'SEOUL' or area_code = 'BUSAN';
    
# not: 조건이 거짓일 때(조건의 결과를 반대)
# 포인트가 null이 아닌 회원을 조회
select
	*
from 
	`korea_db`.`member`
where
	not `grade` = "Bronze";

# null 값을 확인하는 경우 연산자 사용이 불가
# : null이 '값이 없음'을 나타내며, 그 어떤 값과도 비교할 수 x
# : null 여부를 확인하는 키워드
#   is null, is not null
# is null
# : null인 경우 true 반환, null이 아닌 경우 false 반환
-- null값이 데이터 반환
select
	*
from 
	`korea_db`.`member`
where
	points is null;

-- null 값이 아닌 데이터 반환
select
	*
from 
	`korea_db`.`member`
where
	points is not null;

#! between A and B
# : A와 B 사이에

# points가 200 이상 이면서 400 이하인 데이터 추출
# where (points >= 200) and (points <= 400);
select 
	member_id, name, points
from
	`member`
where
	points between 200 and 400;

#! in(지정할 범위의 문자 데이터를 나열)
# : 지정된 리스트 중 하나와 일치하면 참
# : 문자로 표기된 데이터에 범위를 추가할 때
select 
	member_id, name, area_code
from
	`member`
where
	area_code in('SEOUL', 'BUSAN', 'JEJU');

#! like
# : 문자열의 일부를 검색
# %, _ 와일드 카드 문자
# %: 무엇이든 허용(0개 이상의 임의의 문자를 나타냄)
# _: 한 글자만 허용(정확히 하나의 임의의 문자를 나타냄)

# 이름이 J로 시작하는 모든 회원 조회
select 
	*
from 
	`member`
where 
	name like 'J%';

# 이름에 un이 포함된 모든 회원 조회
select 
	*
from 
	`member`
where
	name like '%un%';
    
# 이름의 두 번째 글자가 'u'인 모든 회원 조회
select 
	*
from 
	`member`
where
	name like '_u%';
    
# 이름이 네글자인 모든 회원 조회
select
	*
from
	`member`
where
	name like '____';
    
#! 날짜, 시간 조회
select
	*
from 
	`member`
where
	join_date = "2022-01-02";

# 특정 시간 기준 그 이후의 데이터 조회 (컬럼명 > 특정시간)
select
	*
from
	`member`
where
	join_date > "2022-01-02";

# 특정 시간 사이의 데이터 조회: betwen and
select 
	*
from
	`member`
where
	join_date between "2023-01-01" and "2024-01-23";

# 날짜나 시간의 특정 부분과 일치하는 데이터 조회

# 연도 일치: year(컬럼명)
# 월 일치: month(컬럼명)
# 일 일치: day(컬럼명)

# 2023년에 회원가입한 모든 데이터를 조회
select
	*
from
	`member`
where
	year(join_date) = 2024;
    
# 시간 일치: hour()

# 현재 날짜나 현재 시간을 기준으로 조회
# curdate()
# now()

# 현재 이전의 가입자를 조회
select *
from `member`
where join_date < curdate();