use baseball_league;

# 1. 변수 사용
# 팀 ID를 변수에 저장 > 저장된 팀 ID를 사용하여 선수 조회

set @team_id = 1;

select
	*
from
	players
where
	team_id = @team_id;
    
# 2. 제어문
# : if-else문
# 스토어드 프로시저명: CheckPosition
# 프로시저 내에 position 변수를 선언
# 해당 포지션에 players 테이블에서 player_id를 가져옴
# if 조건문으로 포지션이 '타자'인 경우 출력문A
# 그렇지 않은 경우 출력문B

drop procedure if exists CheckPosition;

delimiter $$
# 소괄호 내에 해당 프로시저에 전달할 데이터를 작성
create procedure CheckPosition(in p_player_id int)
begin
	declare v_player_position varchar(100);
    select 
		position into v_player_position
	from
		players
	where
		player_id = p_player_id;
	
    if v_player_position = '타자' then
		select 'This player is a hitter';
	else 
		select 'This player is not a hitter';
	end if;
end $$

delimiter ;

call CheckPosition(101);

