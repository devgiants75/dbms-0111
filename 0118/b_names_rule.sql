# MySQL 명명규칙 
# 데이터베이스, 테이블, 컬럼 이름 명명규칙

# 1. 대소문자를 구분하지 X (Windows 한정)
# : 일관성 있는 작성을 권장 (소문자 사용을 권장)
# 2. 길이 제한: 최대 64자 사용 가능
# 3. 문자 제한: 문자, 숫자, 밑줄(_)만 사용 가능
# : 공백X, 특수문자X
# 4. 숫자로는 시작할 수 X
# 5. mySQL 예약어는 사용X 권장
# 예약어: 컴퓨터 프로그래밍의 문법 체계명
# >> 예약어를 사용해야 하는 경우 백틱(``)으로 묶어서 사용

# sql내에 올바른 이름 사용을 위해서는 의미있는 이름 사용
# : 그 내용을 명확하게 식별할 수 있도록 명명

# 테이블 명명규칙: 명사 사용 권장 (복수형 명사를 사용)
# user >> users(members), product >> products

# lower_snake_case
# : 모든 문자가 소문자로 작성, 공백 대신 밑줄(_)을 사용하여 단어 구분
# ex) student_name, course_id 등

# MySQL의 백틱(`)과 따옴표의 사용
# 백틱(`)
# - 키워드 충돌 방지: 예약어로 설정되어 있는 단어를 명명하기 위한 목적
# - 이름에 공백이나 특수 문자가 포함된 경우 식별을 위한 목적

# 따옴표
# 문자열을 저장하는데 사용
# : 테이블명이나 컬럼명으로 사용하는 것을 권장 X