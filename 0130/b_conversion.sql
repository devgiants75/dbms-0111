# 데이터 형 변환
# : 문자형을 정수형으로 바꾸거나, 정수형을 실수형으로 바꾸는 등
# : 기본 데이터 타입 간의 명시를 달리하는 문법

#! 형 변환의 종류
# 1. 명시적인 변환
# : 직접 함수를 사용
# : cast(), convert() - 형식만 다름(동일한 기능)
# cast (값 as 데이터_형식)
# convert (값, 데이터_형식)

select
	avg(price) as '평균 가격'
from
	buy; # 실수
    
# 형 변환 시 정수 값은 signed, unsigned만 사용 가능
# signed: 부호가 있는 정수
# unsigned: 부호가 없는 정수
select 
	cast(avg(price) as signed) '평균 가격'
from
	buy;
    
# 날짜 형 변환 (포맷을 동일하게 맞춘다. YYYY-MM-DD)
select cast('2022$12$12' as Date);
select cast('2022/12/12' as Date);
select cast('2022!12!12' as Date);
    
# 가격과 수량을 곱한 실제 구매액을 조회
# concat(): 문자를 이어주는 역할
select
	num, concat(
		cast(price as char), 'X', cast(amount as char), '=')
		as '가격X수량', price*amount as '구매액'
from
	buy;

# 2. 암시적인 변환
# : 별도의 지시없이 자동 변환
# 문자로 작성된 숫자 끼리의 계산식
select '100' + '200';

# 100200
# : 문자를 이어작성하는 경우에는 concat()을 사용
select concat('100', '200');