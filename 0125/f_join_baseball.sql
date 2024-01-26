### baseball_league를 사용한 조인 예제 ###
use baseball_league;

# 1. 내부 조인
# 타자인 선수와 해당 선수가 속한 팀 이름 가져오기
select
	players.name as player_name, teams.name as team_name
from
	players
inner join 
	teams
	on players.team_id = teams.team_id
where players.position = "타자";

# 1990년 이후 창단된 팀의 선수 목록 가져오기
select
	T.name as team_name, P.name as player_name
from 
	players P
		inner join teams T
		on P.team_id = T.team_id
where T.founded_year >= 1990;

# 2. 외부 조인
# 모든 팀과 그 팀에 속한 선수 목록 가져오기

select 
	T.name as team_name, P.name as player_name
from
	teams T
		left join players P
        on T.team_id = P.team_id;

# 모든 선수와 해당 선수가 속한 팀 이름 가져오기
select
	P.name as player_name, T.name as team_name
from
	players P
		left join teams T
        on P.team_id = T.team_id;

# 모든 팀과 해당 팀에 속한 타자 목록 가져오기
select
	T.name team_name, P.name player_name
from
	teams T
		left join players P
        on T.team_id = P.team_id and P.position = "타자";
        
# 내부 쿼리 문제
# 가장 많은 선수를 보유한 팀의 정보를 출력
# : 선수의 수를 계산 >> 그 중에서 가장 많은 선수를 보유한 팀의 정보 출력

# 문제의 로직이 잘못되었습니다.
# 선수의 수가 많은 팀이 2팀(두산, 롯데) 존재하여 limit을 사용해 제일 상단의 레코드만 출력하였습니다.

SELECT *
FROM teams
WHERE team_id = (
  SELECT team_id
  FROM players
  GROUP BY team_id
  ORDER BY COUNT(*) DESC
  LIMIT 1
);


# 평균 생년월일이 가장 어린 팀의 정보를 출력
# inner join, 내부 쿼리, avg(), year()
# group by, having 

SELECT 
  T.team_id, 
  T.name, 
  T.city, 
  T.founded_year, 
  -- 평균 출생 연도 (선수들의 출생 연도의 평균을 계산)
  AVG(YEAR(P.birth_date)) AS avg_birth_year
FROM 
  teams T
INNER JOIN 
  players P ON T.team_id = P.team_id  -- players 테이블을 teams 테이블과 내부 조인
GROUP BY 
  T.team_id -- 팀 ID 별로 그룹화
HAVING 
  avg_birth_year = ( -- 가장 최근 평균 출생 연도를 가진 팀을 찾기 위한 서브쿼리
    SELECT 
      MAX(avg_birth_year) -- 내부 서브쿼리의 결과 중 최대값(가장 어린 평균 연도)을 선택
    FROM (
      SELECT -- 각 팀별 평균 출생 연도를 계산하는 내부 서브쿼리
        AVG(YEAR(birth_date)) AS avg_birth_year -- 선수들의 출생 연도에서 연도 부분만 추출하여 평균을 계산
      FROM 
        players -- players 테이블에서
      GROUP BY 
        team_id -- 팀 ID 별로 그룹화
    ) AS subquery -- 내부 서브쿼리에 대한 별칭을 subquery로 설정
  );
