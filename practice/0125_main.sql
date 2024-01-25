# 1. 데이터베이스 생성
# 야구 팀 관리 데이터를 저장하는 데이터베이스
# : baseball_league;
create database baseball_league;

# 2. 데이터베이스 선택
use baseball_league;

# 3. 테이블 생성
# >> a. 팀 테이블 생성
# : teams(team_id, name, city, founded_year)
CREATE TABLE teams (
    team_id INT PRIMARY KEY,
    name VARCHAR(100) UNIQUE,
    city VARCHAR(100),
    founded_year YEAR -- 날짜형 중 연도 데이터만 저장하는 타입 'YYYY'
);

# >> b. 선수 테이블 생성
# : players(player_id, name, position)
# position 열거형 (타자, 투수, 내야수, 외야수)
CREATE TABLE players (
    player_id INT PRIMARY KEY,
    name VARCHAR(100),
    position ENUM('타자', '투수', '내야수', '외야수'),
    birth_date DATE NOT NULL,
    team_id INT,
    FOREIGN KEY (team_id) REFERENCES teams(team_id)
);

-- 1. teams 테이블에 데이터 삽입
INSERT INTO teams (team_id, name, city, founded_year) VALUES
(1, 'DUSAN', 'Seoul', 1999),
(2, 'LOTTE', 'Busan', 1982),
(3, 'SSG', 'Incheon', 2000);

-- 2. players 테이블에 데이터 삽입
INSERT INTO players (player_id, name, position, birth_date, team_id) VALUES
(101, 'Kim Min', '타자', '1992-05-20', 1),
(102, 'Lee Joon', '투수', '1990-08-15', 2),
(103, 'Choi Hyeon', '내야수', '1988-03-05', 3),
(104, 'Park Seo', '외야수', '1994-11-22', 1),
(105, 'Jung Tae', '타자', '1993-07-30', 2);


# 4. 각 테이블 구조 확인
describe teams;
desc players;

# 6. 테이블 삭제
# : 테이블이 존재한다면 테이블 삭제
drop table if exists teams;
drop table if exists players;

# 7. 데이터베이스 삭제
drop database baseball_league;