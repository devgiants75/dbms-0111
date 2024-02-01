# 트리거 활용 #

# market_db 고객 테이블(member)에
# , 입력된 회원의 정보가 변경될 때 
# - 변경한 사용자, 시간, 변경 전의 데이터를 기록하는 트리거

use market_db;

create table singer (
	select mem_id, mem_name, mem_number, addr from member
);

