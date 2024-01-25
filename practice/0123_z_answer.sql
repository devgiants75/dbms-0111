-- 1. teams 테이블에 데이터 삽입
INSERT INTO teams (team_id, name, city, founded_year) VALUES
(1, 'DUSAN', 'Seoul', 1999),
(2, 'LOTTE', 'Busan', 1982),
(3, 'SK', 'Incheon', 2000);

-- 2. players 테이블에 데이터 삽입
INSERT INTO players (player_id, name, position, birth_date) VALUES
(101, 'Kim Min', '타자', '1992-05-20'),
(102, 'Lee Joon', '투수', '1990-08-15'),
(103, 'Choi Hyeon', '내야수', '1988-03-05'),
(104, 'Park Seo', '외야수', '1994-11-22'),
(105, 'Jung Tae', '타자', '1993-07-30');

-- 3. 데이터 업데이트
-- teams 테이블에서 team_id가 3인 팀 이름 변경
UPDATE teams
SET name = 'SSG'
WHERE team_id = 3;

-- players 테이블에서 player_id가 105인 선수의 포지션 변경
UPDATE players
SET position = '내야수'
WHERE player_id = 105;

-- 4. 데이터 삭제
-- teams 테이블에서 founded_year가 2000년 이후인 모든 팀 삭제
DELETE FROM teams
WHERE founded_year > 2000;

-- players 테이블에서 1990년 1월 1일 이전에 태어난 선수들 삭제
DELETE FROM players
WHERE birth_date < '1990-01-01';

-- 5. 제약조건 추가
-- teams 테이블의 team_id 컬럼에 PRIMARY KEY 제약조건 추가
ALTER TABLE teams
ADD PRIMARY KEY (team_id);

-- players 테이블의 player_id 컬럼에 PRIMARY KEY 제약조건 추가
ALTER TABLE players
ADD PRIMARY KEY (player_id);

-- players 테이블의 birth_date 컬럼에 NOT NULL 제약조건 추가
ALTER TABLE players
MODIFY birth_date date NOT NULL;

-- teams 테이블의 name 컬럼에 UNIQUE 제약조건 추가
ALTER TABLE teams
ADD UNIQUE (name);
