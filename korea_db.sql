create database korea_db;

# 1. 회원(member) 테이블
# : 회원 테이블의 필수 값 지정

# *회원 ID(member_id): 기본키, 각 회원을 고유하게 식별하는 식별자
# *이름(name): 회원의 이름
# *성별(gender): 회원의 성별
# *지역코드(area_code): 회원의 거주 지역을 나타내는 코드
# 회원등급(grade): 회원의 등급
# *연락처(contact): 회원의 연락처
# 포인트(points): 회원의 포인트
# *가입일(join_date): 회원이 가입한 날짜 

create table `korea_db`.`member` (
    member_id int auto_increment primary key,
    name varchar(255) not null,
    gender enum('Male', 'Female', 'Other') not null,
    area_code varchar(10) not null,
    grade enum('Bronze', 'Silver', 'Gold', 'Platinum', 'Diamond') default 'Bronze',
    contact varchar(20) not null,
    points smallint default 0,
    join_date date not null
);

create table `korea_db`.`buy` (
	purchase_id int primary key NOT NULL,
    member_id char(8) NOT NULL,
    product_code char(6) NOT NULL,
    purchase_date date NOT NULL,
    amount int NOT NULL,
    quantity smallint NOT NULL
);

INSERT INTO `korea_db`.`member` (name, gender, area_code, grade, contact, points, join_date)
VALUES
('Kim Yuna', 'Female', '부산', 'Gold', '010-1234-5678', 500, '2024-01-01'),
('Lee Minho', 'Male', '서울', 'Silver', '010-2345-6789', 300, '2024-01-02'),
('Park Jisung', 'Male', '서울', 'Bronze', '010-3456-7890', null, '2024-01-03'),
('Choi Siwon', 'Male', '경기', 'Platinum', '010-4567-8901', 700, '2024-01-04'),
('Yoo Jae Suk', 'Male', '부산', 'Bronze', '010-5678-9012', null, '2024-01-05'),
('Kang Hodong', 'Male', '부산', 'Bronze', '010-6789-0123', 200, '2024-01-06'),
('Song Hye Kyo', 'Female', '경기', 'Gold', '010-7890-1234', 500, '2024-01-07'),
('Bae Suzy', 'Female', '대전', 'Silver', '010-8901-2345', 300, '2024-01-08'),
('Kim Soo Hyun', 'Male', '대전', 'Platinum', '010-9012-3456', 800, '2024-01-09'),
('Jun Ji Hyun', 'Female', '울산', 'Diamond', '010-0123-4567', 1200, '2024-01-10');

INSERT INTO `korea_db`.`buy` (purchase_id, member_id, product_code, purchase_date, amount, quantity)
VALUES
(1, '1', 'P001', '2024-01-15', 10000, 2),
(2, '1', 'P002', '2024-01-16', 20000, 1),
(3, '4', 'P003', '2024-01-15', 15000, 2),
(4, '4', 'P004', '2024-01-16', 25000, 1),
(5, '4', 'P005', '2024-01-17', 30000, 3),
(6, '7', 'P006', '2024-01-15', 5000, 1),
(7, '8', 'P007', '2024-01-16', 8000, 1),
(8, '10', 'P008', '2024-01-17', 12000, 1);

drop database `korea_db`;