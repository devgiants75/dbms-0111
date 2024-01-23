# select문 정렬
use `korea_db`;

# order by: 결과를 정렬
# limit: 결과의 개수를 제한
# distinct: 중복된 데이터를 제거
# group by: 지정한 열의 데이터들을 같은 데이터끼리 묶어서 추출
# having: 그룹화된 데이터에 조건을 추가

#! order by
# : 데이터를 정렬하는 절
# : 결과의 값이나 개수에 대해서는 영향 X
# : 결과가 출력되는 순서를 조절
# 기본값(asc-오름차순), desc(내림차순)
# : 오름차순 키워드는 생략 가능하지만 내림차순은 반드시 기입

# 가입일(join_date)를 기준으로 최신 회원부터 보기
select
	*
from
	`member`
order by
	`join_date` desc;

# 등급별(grade)로 정렬, 같은 등급 내에서 
# ,포인트(points)가 높은 순으로 정렬
select
	*
from
	`member`
order by
	grade asc, points desc;

#! limit 
# : 출력하는 개수를 제한
# : 반환되는 행의 수를 제한
# limit 행수 
# limit 행수 offset 시작
# : 시작하는 행으로 부터의 개수 제한
# (생략할 경우 기본값 0 - 시작 번호가 0)

select * from `member` limit 5 offset 3;

#! distinct 절
# : 중복된 결과를 제거
# : 조회된 결과에서 중복된 데이터가 존재할 경우 1개만 남기고 생략
# : 조회할 열 이름 앞에 distinct 키워드를 작성
select distinct area_code from `member`;
select distinct grade from `member`;

#! group by절
# : 그룹으로 묶어주는 역할
# : 여러 행을 그룹화하여 집계함수를 적용할 때 사용

# 집계 함수
# : 그룹화 된 데이터에 대한 계산 
# sum(계산할 열을 나열): 합계
# avg(): 평균
# min(): 최소값
# max(): 최대값
# count(): 행의 개수
# count(distinct ): 행의 개수(중복은 1개만 인정)

# 등급별(grade) 회원 수 계산
select 
	grade, count(*) as member_count
from 
	`member`
group by grade;

# 지역별(area_code) 평균 포인트 계산
select 
	area_code, avg(points) as member_count
from
	`member`
group by 
	area_code;

#! having 절
# : group by와 함께 사용
# : 그룹화된 결과에 대한 조건을 지정
# >> where절과 유사, 하지만 그룹화된 데이터에 대한 조건에 사용

# 2명 이상의 회원이 있는 등급만 조회
select
	grade, count(*) as member_count
from 
	`member`
group by
	grade
having 
	count(*) >= 2;
    
# 지역별 평균 포인트 계산 > 평균 포인트가 200이상인 지역만 조회
select
	area_code, avg(points) as avg_points
from
	`member`
group by area_code
having
	avg(points) > 200;
  
# 이름(name)으로 알파벳 순 정렬 - order by
select * from `member` order by name asc;

# 3번째 부터 2개의 행 조회 - limit
select * from `member` limit 2, 2;
select * from `member` limit 2 offset 2;

# 포인트(points)가 가장 높은 상위 3명의 회원 조회 - limit
select * from `member` order by points desc limit 3; 

# 서로 다른 등급(grade) 목록 조회 - distinct
select distinct grade from `member`;

# 지역별(area_code) 최대 포인트 조회 - group by
select 
	area_code, max(points) as max_points
from 
	`member`
group by
	area_code;

# 성별(gender)에 따른 평균 포인트 조회 - group by
select 
	gender, avg(points) as avg_points
from
	`member`
group by
	gender;

# 평균 포인트가 250 이상인 등급만 조회 - having
select grade, avg(points) as avg_points
from `member`
group by
	grade
having avg(points) >= 250;

# 등급별 최소 포인트가 100이상인 그룹 조회 - having
select
	grade, min(points)
from
	`member`
group by
	grade
having min(points) >= 100;