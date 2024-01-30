# case문 활용

# 총 구매액
# 1500 이상 > 최우수고객
# 1000 ~ 1499 > 우수고객
# 1 ~ 999 > 일반고객
# 0 이하(구매한적X) > 유령고객

select M.mem_id, M.mem_name, sum(price*amount) "총 구매액",
	case
		when (sum(price*amount) >= 1500) then '최우수고객'
		when (sum(price*amount) >= 1000) then '우수고객'
		when (sum(price*amount) >= 1) then '일반고객'
        else '유령고객'
	end "회원등급" # case문을 회원등급의 열로 생성
from buy B
	right outer join member M
    on B.mem_id = M.mem_id
group by M.mem_id
order by sum(price*amount) desc;




