
CREATE TABLE clinics (
    cid VARCHAR(50) PRIMARY KEY,
    clinic_name VARCHAR(150),
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(100)
);

CREATE TABLE customer (
    uid VARCHAR(50) PRIMARY KEY,
    name VARCHAR(150),
    mobile VARCHAR(20)
);

CREATE TABLE clinic_sales (
    oid VARCHAR(50) PRIMARY KEY,
    uid VARCHAR(50),
    cid VARCHAR(50),
    amount DECIMAL(10,2),
    datetime DATETIME,
    sales_channel VARCHAR(100),
    FOREIGN KEY (uid) REFERENCES customer(uid),
    FOREIGN KEY (cid) REFERENCES clinics(cid)
);

CREATE TABLE expenses (
    eid VARCHAR(50) PRIMARY KEY,
    cid VARCHAR(50),
    description VARCHAR(255),
    amount DECIMAL(10,2),
    datetime DATETIME,
    FOREIGN KEY (cid) REFERENCES clinics(cid)
);


INSERT INTO clinics (cid, clinic_name, city, state, country) VALUES
('cnc-0100001', 'XYZ Clinic', 'Hyderabad', 'Telangana', 'India'),
('cnc-0100002', 'Sunrise Health', 'Hyderabad', 'Telangana', 'India'),
('cnc-0200001', 'CarePlus Clinic', 'Mumbai', 'Maharashtra', 'India');



-- USE platinumrx_assignment;

INSERT INTO clinics (cid, clinic_name, city, state, country) VALUES
('cnc-0100001', 'XYZ Clinic', 'Hyderabad', 'Telangana', 'India'),
('cnc-0100002', 'Sunrise Health Care', 'Hyderabad', 'Telangana', 'India'),
('cnc-0200001', 'CarePlus Medical Center', 'Mumbai', 'Maharashtra', 'India');


INSERT INTO customer (uid, name, mobile) VALUES
('bk-09f3e-95hj', 'Jon Doe', '97XXXXXXXX'),
('cu-9283-kkd8', 'Anita Iyer', '98XXXXXXXX'),
('cu-5582-mmn2', 'Rohit Verma', '99XXXXXXXX');


INSERT INTO clinic_sales 
(oid, uid, cid, amount, datetime, sales_channel) VALUES

('ord-00100-00100', 'bk-09f3e-95hj', 'cnc-0100001', 24999, '2021-09-23 12:03:22', 'sodexo'),
('ord-00100-00101', 'cu-9283-kkd8', 'cnc-0100001', 18000, '2021-09-23 14:10:50', 'cash'),
('ord-00200-00100', 'cu-5582-mmn2', 'cnc-0100002', 32000, '2021-09-25 10:45:10', 'upi'),
('ord-00300-00220', 'cu-5582-mmn2', 'cnc-0200001', 15000, '2021-10-02 11:20:15', 'sodexo');


INSERT INTO expenses (eid, cid, description, amount, datetime) VALUES
('exp-0100-00100', 'cnc-0100001', 'first-aid supplies', 557, '2021-09-23 07:36:48'),
('exp-0100-00101', 'cnc-0100001', 'rent', 12000, '2021-09-01 10:00:00'),

('exp-0200-00100', 'cnc-0100002', 'utilities', 8000, '2021-09-05 11:00:00'),
('exp-0200-00101', 'cnc-0100002', 'equipment', 5000, '2021-10-05 14:00:00'),

('exp-0300-00100', 'cnc-0200001', 'maintenance', 9000, '2021-09-10 09:00:00');
