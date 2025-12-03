CREATE DATABASE platinumrx_assignment;
USE platinumrx_assignment;

USE platinumrx_assignment;

CREATE TABLE users (
    user_id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100),
    phone_number VARCHAR(20),
    mail_id VARCHAR(100),
    billing_address VARCHAR(255)
);


CREATE TABLE bookings (
    booking_id VARCHAR(50) PRIMARY KEY,
    booking_date DATETIME,
    room_no VARCHAR(50),
    user_id VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);


CREATE TABLE items (
    item_id VARCHAR(50) PRIMARY KEY,
    item_name VARCHAR(100),
    item_rate DECIMAL(10,2)
);



CREATE TABLE booking_commercials (
    id VARCHAR(50) PRIMARY KEY,
    booking_id VARCHAR(50),
    bill_id VARCHAR(50),
    bill_date DATETIME,
    item_id VARCHAR(50),
    item_quantity DECIMAL(10,2),
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id),
    FOREIGN KEY (item_id) REFERENCES items(item_id)
);


USE platinumrx_assignment;



INSERT INTO users (user_id, name, phone_number, mail_id, billing_address) VALUES
('21wrcxuy-67erfn', 'John Doe', '97XXXXXXXX', 'john.doe@example.com', '12 Baker Street, London'),
('98fjskww-12dkre', 'Emily Watson', '98XXXXXXXX', 'emily.watson@example.com', '45 Sunset Blvd, California'),
('55kslppw-76eiow', 'Rahul Sharma', '99XXXXXXXX', 'rahul.sharma@example.com', 'Hyderabad, India');


INSERT INTO bookings (booking_id, booking_date, room_no, user_id) VALUES
('bk-09f3e-95hj', '2021-09-23 07:36:48', 'rm-bhf9-aerjn', '21wrcxuy-67erfn'),
('bk-11kd9-88lpq', '2021-10-10 09:15:12', 'rm-pl92-kdke1', '21wrcxuy-67erfn'),
('bk-55kd1-19wke', '2021-11-12 18:25:33', 'rm-ae77-ksw02', '98fjskww-12dkre'),
('bk-98pl0-78dke', '2021-11-25 14:40:20', 'rm-ki11-pp02e', '55kslppw-76eiow');



INSERT INTO items (item_id, item_name, item_rate) VALUES
('itm-a9e8-q8fu', 'Tawa Paratha', 18),
('itm-a07vh-aer8', 'Mix Veg', 89),
('itm-pp92-kd91', 'Dal Tadka', 120),
('itm-kk19-zz28', 'Paneer Masala', 180);



INSERT INTO booking_commercials 
(id, booking_id, bill_id, bill_date, item_id, item_quantity) VALUES

('q34r-3q4o8-q34u', 'bk-09f3e-95hj', 'bl-0a87y-q340', '2021-09-23 12:03:22', 'itm-a9e8-q8fu', 3),
('q3o4-ahf32-o2u4', 'bk-09f3e-95hj', 'bl-0a87y-q340', '2021-09-23 12:03:22', 'itm-a07vh-aer8', 1),

('k91d-pp31-ee82', 'bk-11kd9-88lpq', 'bl-12ppw-3311', '2021-10-10 10:00:00', 'itm-pp92-kd91', 2),

('o88e-wk17-pp92', 'bk-55kd1-19wke', 'bl-77lee-3399', '2021-11-12 18:45:00', 'itm-a07vh-aer8', 2),
('w92l-qq91-mm02', 'bk-55kd1-19wke', 'bl-77lee-3399', '2021-11-12 18:45:00', 'itm-kk19-zz28', 1),

('p19s-al91-zz32', 'bk-98pl0-78dke', 'bl-aj18d-33p9', '2021-11-25 15:00:00', 'itm-kk19-zz28', 3);
