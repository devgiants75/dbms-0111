# 서브 쿼리(subquery)
# : 메인 쿼리 내부에서 실행되는 내부 쿼리
# : 메인 쿼리에 데이터를 제공

# 2023년 이후에 가입한 회원의 지역 코드를 조회

select 
	name, area_code
from
	`member`
where join_date > 
	(select 
		join_date
	from 
		`member`
	where year(join_date) = 2023);

# member 테이블에서 Bronze 등급이 아닌 
# 모든 회원의 이름과 등급을 조회하는 쿼리를 작성
# not in(): 해당 데이터를 포함하지 않은 데이터를 조회

select name, grade
from `member`
where grade 
	not in (
		select grade
        from `member`
        where grade = 'Bronze'
    );
    
# member 테이블에서 각 회원의 점수(points)가 
# 해당 회원의 등급(grade)에 해당하는 평균 점수보다 
# 높은 회원의 이름과 점수를 조회