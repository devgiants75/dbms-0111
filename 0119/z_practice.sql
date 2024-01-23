# DML 예제 문제

# 1. 데이터 삽입(insert)
# teams 테이블에 아래와 같은 정보를 가진 3개의 팀을 추가
-- team_id: 1, name: "DUSAN", city: "Seoul", founded_year: 1999
-- team_id: 2, name: "LOTTE", city: "Busan", founded_year: 1982
-- team_id: 3, name: "SK", city: "Incheon", founded_year: 2000

# players 테이블에 다음과 같은 정보를 가진 5명의 선수를 추가
-- player_id: 101, name: "Kim Min", position: "타자", birth_date: "1992-05-20"
-- player_id: 102, name: "Lee Joon", position: "투수", birth_date: "1990-08-15"
-- player_id: 103, name: "Choi Hyeon", position: "내야수", birth_date: "1988-03-05"
-- player_id: 104, name: "Park Seo", position: "외야수", birth_date: "1994-11-22"
-- player_id: 105, name: "Jung Tae", position: "타자", birth_date: "1993-07-30"

# 데이터 업데이트 (UPDATE)
-- teams 테이블에서 team_id가 3인 팀의 이름을 "SSG"로 변경
-- players 테이블에서 player_id가 105인 선수의 포지션을 "내야수"로 변경

# 데이터 삭제 (DELETE)
-- teams 테이블에서 founded_year가 2000년 이후인 모든 팀을 삭제하세요.
-- players 테이블에서 1990년 1월 1일 이전에 태어난 선수들을 모두 삭제하세요.

# 제약조건 추가
-- teams 테이블에 team_id 컬럼에 대해 PRIMARY KEY 제약조건을 추가
-- players 테이블에 player_id 컬럼에 대해 PRIMARY KEY 제약조건을 추가
-- players 테이블의 birth_date 컬럼에 NOT NULL 제약조건을 추가
-- teams 테이블의 name 컬럼에 UNIQUE 제약조건을 추가하여 모든 팀의 이름이 고유하도록 지정
