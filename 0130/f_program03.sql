# 동적 SQL
# : 상황에 따라 내용 변경이 필요한 경우, 동적 SQL문 사용

# prepare & execute 
# prepare: SQL문을 실행하지 않고 미리 준비
# execute: 준비한 SQL문을 실행
# deallocate prepare: 문장을 해제

use market_db;
prepare myQuery
	from 'select *
			from member
				where mem_id = "BLK"';
execute myQuery;
deallocate prepare myQuery;

# 동적 SQL문의 활용
# : 보안이 중요한 출입문에서 출입한 내역을 테이블에 기록
# : 출입증을 태그하는 순간의 날짜와 시간이 insert문으로 만들어져서 입력

drop table if exists gate_table;
create table gate_table (
	id int auto_increment primary key,
    entry_time datetime
);

# current_timestamp(): 현재 시간과 날짜를 출력 기능
set @curDate = current_timestamp();

prepare myQuery 
from 'insert into gate_table values(null, ?)';

execute myQuery using @curDate;
deallocate prepare myQuery;

select * from gate_table;