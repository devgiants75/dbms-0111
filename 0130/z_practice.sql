# 특정 메시지를 10번 출력
# : while문 사용

delimiter $$

create procedure PrintMessage()
begin
	declare counter int default 0;
    
    while counter < 10 do
		set counter = counter + 1;
        select concat('Message number', counter);
	end while;
end $$

delimiter ;
call PrintMessage();