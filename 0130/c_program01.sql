# SQL 프로그래밍 

# 1. 스토어드 프로시저
# : MySQL에서 프로그래밍 기능이 필요로 할 때 사용하는 데이터베이스 개체

# 2. 스토어드 프로시저의 구조

# 구분 문자: delimiter
# 스토어드 프로시저의 코딩 부분을 일반 SQL문 종료와 구분하기 위해
# (스토어드 프로시저의) 구분 문자를 변경

-- delimiter $$ 

-- create procedure `proc01`
-- begin
-- 	# SQL 프로그래밍 코딩
-- end $$ # 스토어드 프로시저 종료

-- delimiter ; # 종료 문자를 다시 세미콜론으로 변경

-- # 스토어드 프로시저 실행
-- call `proc01`;

# 1. if문
# : 조건에 따라 실행할 로직을 구현하는 기능
# : 조건식이 참이라면 'SQL문장들'을 실행, 그렇지 않으면 그냥 넘어감

# 기본 형식
# if 조건식 then
#	sql문장들
# end if;

# : 두 문장 이상일 경우에는 begin ~ end 구문으로 반드시 묶어야 함

drop procedure if exists ifProc1;

delimiter $$
create procedure ifProc1()
begin
	if 100 = 100 then # SQL은 '같다'의 의미로 =하나를 사용
		select '100은 100과 같습니다.';
	end if;
end $$
delimiter ;

call ifProc1();

# if-else문
# : 조건에 따라 다른 부분을 실행
# : 조건식이 참이라면 'SQL문장들1'을 실행
# : 그렇지 않으면 'SQL문장들2'를 실행

drop procedure if exists ifProc2;

delimiter $$
create procedure ifProc2()
begin
	declare myNum int; # 변수 선언식 
    set myNum = 200;
    if myNum = 100 then
		select '100입니다.';
	else
		select '100이 아닙니다.';
	end if;
end $$

delimiter ;
call ifProc2;

# 3. case 문
# : 여러 가지 조건 중에서 선택해야 하는 경우

# 기본 형식
# case
#   when 조건1 then
	# sql 문장들1
# 	when 조건2 then
	# sql 문장들2
#   when 조건3 then
	# sql 문장들3
#   else
	# sql 문장들4
# end case;

# case문을 활용한 학점 계산기
# 90점 이상 A, 80점 이상 B, 70점 이상 C, 70점 미만 F

drop procedure if exists caseProc;
delimiter $$
create procedure caseProc()
begin
	
    declare point int;
    declare credit char(1);
    set point = 88;
    
    case
		when point >= 90 then
			set credit = 'A';
		when point >= 80 then
			set credit = 'B';
		when point >= 70 then
			set credit = 'C';
		else
			set credit = 'F';
		end case;
        select concat('취득 점수 >>', point)
			, concat('학점 >> ', credit);
end $$
delimiter ;
call caseProc();

# while 문
# : 반복문(조건식이 참인 동안에 SQL문장들을 계속 반복)

# 기본 구조
# while 조건식 do
	# sql문장들
# end while;

# 1에서 100까지 더하는 while문
drop procedure if exists whileProc;
delimiter $$
create procedure whileProc()
begin
	declare i int; -- 1에서 100까지 증가할 변수
	declare hap int; -- 더한 값을 누적할 변수
	set i = 1;
    set hap = 0;
    
    while (i <= 100) do
		set hap = hap + i; -- hap의 원래 값에 i를 더해 다시 hap에 할당
        set i = i + 1; -- i의 원래 값에 1을 더해 다시 i에 할당
	end while;
    select '1부터 100까지의 합 >>>', hap;
end $$
delimiter ;

call whileProc();
    
    

