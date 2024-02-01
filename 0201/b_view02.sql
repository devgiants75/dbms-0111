# 뷰의 실제 작동 #

# 뷰의 실제 생성, 수정, 삭제

# 뷰를 생성할 경우, 별칭은 따옴표로 지정(', ")
use market_db;
create view v_viewtest1
as
	select B.mem_id 'Member Id', M.mem_name as 'Member Name'
		, B.prod_name 'Product Name'
        , concat(M.phone1, M.phone2) as 'Office Phone'
	from
		buy B
			join member M
            on B.mem_id = M.mem_id;
            
# 뷰를 조회할 때 열 이름에 공백이 있을 시, 백틱(`)으로 지정
select distinct `Member Id`, `Member Name` from v_viewtest1;

# 뷰의 수정
# alter view 구문으로 수정
alter view v_viewtest1
as
	select B.mem_id '회원 아이디', M.mem_name as '회원 이름'
		, B.prod_name '제품 이름'
        , concat(M.phone1, M.phone2) as '연락처'
	from
		buy B
			join member M
            on B.mem_id = M.mem_id;
            
select * from v_viewtest1;

# 뷰의 삭제
# drop view 뷰이름;
drop view v_viewtest1;

# select * from v_viewtest1;

# 데이터베이스 개체의 생성/수정/삭제
# >> DDL 문법을 사용하여 정의

# 뷰의 정보 확인
# : describe 문을 사용

# create or replace
# : 기존에 뷰가 있어도 덮어쓰는 효과를 냄
create or replace view v_viewtest2
as
	select mem_id, mem_name, addr from member;

describe v_viewtest2; # desc 키워드 사용 가능
# >> 뷰의 정보 확인에는 PK와 같은 제약 조건은 나타나지 않는다.

show create view v_viewtest2;
# >> 뷰의 소스 코드 확인 (Form Editor 창에서 확인 가능)

#! 뷰를 통한 데이터의 수정/삭제
# : v_member 뷰

# 데이터 수정
# : update 키워드 사용
update v_member set addr = '부산' where mem_id = 'BLK';

# 데이터의 입력
# : 전체 테이블에서 not null로 지정된 컬럼이 뷰에 없을 경우
# : 데이터 입력 불가!
-- insert into v_member (mem_id, mem_name, addr)
-- values ('BTS', '방탄소년단', '경기');

# not null로 지정된 mem_number 열을 추가로 작성할 경우 데이터 입력 가능!

# 지정된 범위의 뷰 생성
create view v_height167
as
	select * from member
    where height >= 167;

select * from v_height167;

# 뷰를 통한 데이터 삭제
# : delete 키워드 사용
delete from v_height167 where height < 167;

# 뷰를 통한 데이터 입력
# : insert into 키워드 사용
insert into v_height167
values ('TRA', '티아라', 6, '서울', null, null, 159, '2005-01-01');

select * from v_height167;

# >> 논리적 설계에 따라 설정된 값의 범위가 벗어나는 값은 입력되지 않도록 지정
# : with check option

alter view v_height167
as
	select * from member where height >= 167
		with check option;
        
insert into v_height167
values ('TOB', '텔레토비', 4, '영국', null, null, 140, '1995-01-01');

# 뷰가 참조하는 테이블 삭제
drop table if exists buy, member;

# 참조하는 테이블이 삭제된 경우 뷰 확인 또한 불가!
select * from v_height167;

# check table문으로 뷰 상태 확인 가능
check table v_height167;