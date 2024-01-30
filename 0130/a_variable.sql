# SQL: 프로그래밍 언어

# 1. SQL 변수
# 변수?
# : 데이터를 담는 그릇
# : 데이터를 저장하기 위한 저장 공간

# 변수 선언 규칙
# : set @변수이름 = 변수의 값;

# 변수의 값 출력
# : select @ 변수이름;

#! SQL의 변수의 특징
# : MySQL 워크벤치를 시작할 때까지는 유지되지만, 종료할 경우 사라짐 (임시 저장 공간)

use market_db;

# 변수 선언 (정수 / 실수 대입)
set @myVar1 = 5;
set @myVar2 = 4.25;

# 변수 출력
select @myVar1;
select @myVar1 + @myVar2;

# 테이블을 조회하면서 변수 사용
set @txt = "가수 이름 >>> ";
set @height = 166;

select
	@txt, mem_name
from
	member
where
	height > @height;
    
# limit 키워드에 변수 사용
# : 변수 사용 불가!

# prepare, execute를 사용한 변수 사용
# prepare: sql문을 실행하지 않고 준비
# >> prepare문에서 사용하는 ?: '현재는 모르지만 실행 시 채워짐'

# execute 키워드를 만나야 실행

set @count = 3;

prepare mySQL
	from 'select mem_name, height
			from `member` order by `height` limit ?';

# execute의 using문의 경우 prepare의 ?위치에 변수를 채움
execute mySQL using @count;