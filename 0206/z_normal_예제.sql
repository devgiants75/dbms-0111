-- 데이터베이스 생성
CREATE DATABASE CoffeeShop;

-- 데이터베이스 사용
USE CoffeeShop;

-- 주문 테이블 생성
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    OrderDate DATE,
    PaymentMethod VARCHAR(50)
);

-- 주문 항목 테이블 생성
CREATE TABLE OrderItems (
    OrderID INT,
    MenuID INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (MenuID) REFERENCES Menu(MenuID)
);

-- 메뉴 테이블 생성
CREATE TABLE Menu (
    MenuID INT PRIMARY KEY,
    MenuName VARCHAR(100),
    Price INT
);