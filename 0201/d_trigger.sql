# SQL 트리거(trigger) #
# : '방아쇠'
# : 자동 실행 / 자동으로 수행하여 사용자가 추가 작업을 잊어버리는 실수를 방지

# 트리거의 사용 목적
# : 수동으로 처리하는 일련 동작을
# : 자동으로 처리하여 데이터에 오류가 발생하는 것을 방지
# >> 데이터의 무결성 처리에 도움

# insert, update, delete (dml) 작업이 발생하면 실행되는 코드
# : 이벤트가 발생할 때 작동

# 트리거 종류
# after 트리거*, before 트리거

# 트리거의 문법
# : 스토어드 프로시저와 문법이 유사
# : 차이점(call문으로 직접 실행이 불가!)
# : >> 무조건 테이블에서 insert, update, delete 등의 이벤트가 
# :    , 발생하는 경우에만 자동으로 실행

use market_db;
create table if not exists 
trigger_table (id int, txt varchar(10));

insert into trigger_table values (1, '레드벨벳');
insert into trigger_table values (2, '잇지');
insert into trigger_table values (3, '블랙핑크');

drop trigger if exists myTrigger;
delimiter $$
create trigger myTrigger -- 트리거 이름 지정 후 create로 생성
	after delete -- delete문이 발생된 이후에 작동
    on trigger_table -- on 조건으로 트리거를 부착할 테이블 지정
    for each row -- 각 행마다 적용시킴 (모든 트리거에 작성)
begin -- 트리거에서 실제로 작동할 부분
	set @msg = '가수 그룹이 삭제됨';
end $$
delimiter ;

set @msg = '';
insert into trigger_table values(4, '마마무');

select @msg;
update trigger_table set txt = '블핑' where id = 3;
select @msg;

delete from trigger_table where id = 4;
select @msg;