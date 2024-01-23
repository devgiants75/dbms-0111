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
	purchase_id int auto_increment primary key,
    member_id int NOT NULL,
    product_code char(6) NOT NULL,
    purchase_date date NOT NULL,
    amount int NOT NULL,
    quantity smallint NOT NULL,
    foreign key (member_id) references `member`(member_id)
);

# 제약조건 추가
# member 테이블의 member_id와 (기본 테이블)
# buy 테이블의 member_id를 외래 키 지정 (참조 테이블)

INSERT INTO `korea_db`.`member` (name, gender, area_code, grade, contact, points, join_date)
VALUES
('Jin', 'Male', 'SEOUL', 'Bronze', '010-1234-5678', 100, '2023-01-01'),
('Hana', 'Female', 'BUSAN', 'Silver', '010-2345-6789', 200, '2022-01-02'),
('Sung', 'Male', 'DAEJEON', 'Gold', '010-3456-7890', 300, '2020-01-03'),
('Minji', 'Female', 'BUSAN', 'Platinum', '010-4567-8901', 400, '2022-01-04'),
('Joon', 'Male', 'DAEJEON', 'Diamond', '010-5678-9012', 500, '2019-01-05'),
('Yuna', 'Female', 'BUSAN', 'Bronze', '010-6789-0123', null, '2024-01-06'),
('Hyun', 'Male', 'SEOUL', 'Silver', '010-7890-1234', 150, '2024-01-07'),
('Eunji', 'Female', 'BUSAN', 'Gold', '010-8901-2345', null, '2024-01-08'),
('Kyung', 'Male', 'JEJU', 'Platinum', '010-9012-3456', 350, '2022-01-09'),
('Sooyoung', 'Female', 'JEJU', 'Diamond', '010-0123-4567', 600, '2018-01-10');

INSERT INTO `korea_db`.`buy` (member_id, product_code, purchase_date, amount, quantity)
VALUES
(1, 'P0001', '2024-01-15', 10000, 1),
(2, 'P0002', '2024-01-16', 35000, 2),
(3, 'P0003', '2024-01-17', 20000, 1),
(4, 'P0004', '2024-01-18', 15000, 3),
(5, 'P0005', '2024-01-19', 40000, 1),
(6, 'P0006', '2024-01-20', 35000, 5),
(7, 'P0007', '2024-01-21', 12000, 1),
(8, 'P0008', '2024-01-22', 13000, 2);

drop database `korea_db`;