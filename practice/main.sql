# 1. 데이터베이스 생성
# 야구 팀 관리 데이터를 저장하는 데이터베이스
# : baseball_league;
create database baseball_league;

# 2. 데이터베이스 선택
use baseball_league;

# 3. 테이블 생성
# >> a. 팀 테이블 생성
# : teams(team_id, name, city, founded_year)
create table teams (
	team_id int,
    name varchar(100),
    city varchar(100),
    founded_year year -- 날짜형 중 연도 데이터만 저장하는 타입 'YYYY'
);

# >> b. 선수 테이블 생성
# : players(player_id, name, position)
# position 열거형 (타자, 투수, 내야수, 외야수)
create table players (
	player_id int,
    name varchar(100),
    position enum('타자', '투수', '내야수', '외야수')
);

# 4. 각 테이블 구조 확인
describe teams;
desc players;
# 5. 테이블 구조 수정
# : players테이블에 birth_date 컬럼 추가
alter table players
add birth_date date; 

desc players;

# 6. 테이블 삭제
# : 테이블이 존재한다면 테이블 삭제
drop table if exists games;
drop table if exists players;

# 7. 데이터베이스 삭제
drop database baseball_league;