# baseball_league
use baseball_league;

# 트리거 생성
# 선수가 새로 등록될 때 마다 해당 선수의 팀에 속한 선수의 수를
# 자동으로 업데이트하는 트리거 생성
select * from players;
select * from teams;

# 트리거 이름: after_player_insert
# 실행 시점: 선수(players) 테이블에 INSERT 작업이 발생한 후
# 트리거 기능: (team_id, log_message, log_time)

create table player_insert_logs (
	log_id int auto_increment primary key,
    team_id int,
    log_msg varchar(255),
    log_time datetime
);

drop trigger if exists after_player_insert;

delimiter $$
create trigger after_player_insert
	after insert 
		on players
		for each row
begin
	insert into 
		player_insert_logs (team_id, log_msg, log_time)
	values
		(new.team_id, concat('team', new.team_id), now());
	
end $$
    
delimiter ;

insert into players 
(player_id, name, position, birth_date, team_id)
values
(106, 'New Player', '타자', '2000-01-01', 1);

select * from player_insert_logs;

# 뷰 생성 예제
# : 팀별 선수 수 요약 뷰 생성

# 뷰 이름: team_player_counts
# 포함 정보
# : 팀이름(team_name)
# : 해당 팀에 속한 선수 수(player_count) >> 그룹화 & 집계함수

# left outer join 활용, group by, count()

create view team_player_counts
as
	select 
		t.name as team_name,
        count(p.player_id) as player_count
    from teams t
	left join players p
		on t.team_id = p.team_id
group by
	t.team_id;

select * from team_player_counts;

