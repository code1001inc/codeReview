-- 생성자 Oracle SQL Developer Data Modeler 17.4.0.355.2121
--   위치:        2020-07-07 17:36:47 KST
--   사이트:      Oracle Database 11g
--   유형:      Oracle Database 11g



CREATE TABLE airport (
    serial_num   VARCHAR2(9 CHAR) NOT NULL,
    name         VARCHAR2(12 CHAR) NOT NULL,
    nation       VARCHAR2(12 CHAR) NOT NULL,
    city         VARCHAR2(12 CHAR) NOT NULL,
    phone_num    NUMBER(12) NOT NULL
);

ALTER TABLE airport ADD CONSTRAINT airport_pk PRIMARY KEY ( serial_num );

CREATE TABLE customer (
    id          NUMBER(4) NOT NULL,
    name        VARCHAR2(12 CHAR) NOT NULL,
    rrn         NUMBER(13) NOT NULL,
    passport    VARCHAR2(6 CHAR) NOT NULL,
    address     VARCHAR2(20 CHAR) NOT NULL,
    home_num    NUMBER(12),
    cell_num    NUMBER(12),
    birthdate   DATE NOT NULL
);

ALTER TABLE Customer ADD check ( birthdate &gt; date &apos;1900-01-01&apos;) 
;

ALTER TABLE customer ADD CONSTRAINT customer_pk PRIMARY KEY ( id );

CREATE TABLE employee (
    id             NUMBER(4) NOT NULL,
    name           VARCHAR2(12 CHAR) NOT NULL,
    rrn            NUMBER(13) NOT NULL,
    address        VARCHAR2(20 CHAR) NOT NULL,
    home_phone     NUMBER(12),
    cell_phone     NUMBER(12),
    office_phone   NUMBER(12),
    branch         VARCHAR2(10 CHAR),
    position       VARCHAR2(8 CHAR) NOT NULL
);

ALTER TABLE employee
    ADD CHECK ( position IN (
        '과장',
        '대리',
        '부장',
        '사원',
        '차장'
    ) );

ALTER TABLE employee ADD CONSTRAINT employee_pk PRIMARY KEY ( id );

CREATE TABLE flight (
    flight_num   VARCHAR2(5 CHAR) NOT NULL,
    model        VARCHAR2(12 CHAR) NOT NULL,
    "1st_seat"   NUMBER(3) NOT NULL,
    "2nd_seat"   NUMBER(3) NOT NULL,
    "3nd_seat"   NUMBER(3) NOT NULL
);

ALTER TABLE flight ADD CONSTRAINT flight_pk PRIMARY KEY ( flight_num );

CREATE TABLE leg (
    leg_num      NUMBER(4) NOT NULL,
    flight_num   VARCHAR2(5 CHAR) NOT NULL,
    dep_time     TIMESTAMP NOT NULL,
    arriv_time   TIMESTAMP NOT NULL,
    departure    VARCHAR2(9 CHAR) NOT NULL,
    via          VARCHAR2(12 CHAR),
    arrival      VARCHAR2(9 CHAR) NOT NULL
);

ALTER TABLE leg ADD CONSTRAINT leg_pk PRIMARY KEY ( leg_num );

CREATE TABLE price (
    ticket_id   NUMBER(4) NOT NULL,
    departure   VARCHAR2(9 CHAR) NOT NULL,
    arrival     VARCHAR2(9 CHAR) NOT NULL,
    price       NUMBER(9) NOT NULL,
    class       VARCHAR2(5 CHAR) NOT NULL,
    period      VARCHAR2(3 CHAR) NOT NULL
);

ALTER TABLE price ADD CHECK ( price BETWEEN 100 AND 100000000 );

ALTER TABLE price
    ADD CHECK ( class IN (
        '1st',
        '2nd',
        '3nd'
    ) );

ALTER TABLE price
    ADD CHECK ( period IN (
        '비수기',
        '성수기'
    ) );

ALTER TABLE price ADD CONSTRAINT price_pk PRIMARY KEY ( ticket_id );

CREATE TABLE reservation (
    reserv_num      NUMBER(4) NOT NULL,
    customer_id     NUMBER(4) NOT NULL,
    ticket_id       NUMBER(4) NOT NULL,
    reserv_date     DATE NOT NULL,
    customer_type   VARCHAR2(4) NOT NULL,
    ticket_type     VARCHAR2(2 CHAR) NOT NULL,
    emp_id          NUMBER(4) NOT NULL,
    trip_info       VARCHAR2(200 CHAR) NOT NULL,
    leg_num         NUMBER(4) NOT NULL
);

ALTER TABLE Reservation ADD check ( reserv_date &gt; date &apos;1900-01-01&apos;);
ALTER TABLE reservation
    ADD CHECK ( customer_type IN (
        '성인남',
        '성인여',
        '어린이남',
        '어린이여',
        '유아남',
        '유아여',
        '청소년남',
        '청소년여'
    ) );

ALTER TABLE reservation
    ADD CHECK ( ticket_type IN (
        '왕복',
        '편도'
    ) );

ALTER TABLE reservation ADD CONSTRAINT reservation_pk PRIMARY KEY ( reserv_num );

ALTER TABLE leg
    ADD CONSTRAINT flight_leg FOREIGN KEY ( flight_num )
        REFERENCES flight ( flight_num );

ALTER TABLE leg
    ADD CONSTRAINT legs_arrival FOREIGN KEY ( arrival )
        REFERENCES airport ( serial_num );

ALTER TABLE leg
    ADD CONSTRAINT legs_departure FOREIGN KEY ( departure )
        REFERENCES airport ( serial_num );

ALTER TABLE price
    ADD CONSTRAINT prices_arrival FOREIGN KEY ( arrival )
        REFERENCES airport ( serial_num );

ALTER TABLE price
    ADD CONSTRAINT prices_departure FOREIGN KEY ( departure )
        REFERENCES airport ( serial_num );

ALTER TABLE reservation
    ADD CONSTRAINT reserv_price FOREIGN KEY ( ticket_id )
        REFERENCES price ( ticket_id );

ALTER TABLE reservation
    ADD CONSTRAINT reservation_customer FOREIGN KEY ( customer_id )
        REFERENCES customer ( id );

ALTER TABLE reservation
    ADD CONSTRAINT reservation_leg FOREIGN KEY ( leg_num )
        REFERENCES leg ( leg_num );

ALTER TABLE reservation
    ADD CONSTRAINT responsibility FOREIGN KEY ( emp_id )
        REFERENCES employee ( id );

CREATE OR REPLACE VIEW Airport_Info  AS
SELECT a.name  AS 공항명,
  l.departure  AS 출발지,
  l.via        AS 경유지,
  l.arriv_time AS 도착시간
FROM Airport a,
  Leg l
WHERE a.serial_num = l.arrival 
;

CREATE OR REPLACE VIEW Cust_Reservation ( "고객 이름", 출발지, 목적지, 출발시간, 도착시간, 항공편, 가격, 탑승객수, "예약 날짜", 담당직원 ) AS
SELECT c.name   AS "고객 이름",
  l.departure   AS 출발지,
  l.arrival     AS 목적지,
  l.dep_time    AS 출발시간,
  l.arriv_time  AS 도착시간,
  l.flight_num  AS 항공편,
  p.price       AS 가격,
  lc.c          AS 탑승객수,
  r.reserv_date AS "예약 날짜",
  e.name        AS 담당직원
FROM Customer c,
  Leg l,
  Price p,
  Employee e,
  Reservation r,
  (SELECT Reservation.leg_num,
    COUNT(*) c
  FROM Reservation
  GROUP BY Reservation.leg_num
  ) lc
WHERE c.id      = r.customer_id
AND r.leg_num   = l.leg_num
AND r.ticket_id = p.ticket_id
AND r.emp_id    = e.id
AND r.leg_num   = lc.leg_num 
;

CREATE OR REPLACE VIEW Emp_Manage  AS
SELECT e.name AS "직원 이름",
  c.name      AS 담당고객,
  l.departure AS 출발지,
  l.arrival   AS 목적지,
  c.name      AS "탑승객 이름",
  c.passport  AS "탑승객 여권번호",
  f.model     AS "항공기 기종"
FROM Customer c,
  Reservation r,
  Employee e,
  Leg l,
  Flight f
WHERE c.id       = r.customer_id
AND e.id         = r.emp_id
AND l.leg_num    = r.leg_num
AND f.flight_num = l.flight_num
ORDER BY "직원 이름" 
;

CREATE OR REPLACE VIEW Flight_Schedule  AS
SELECT LPAD(Leg.dep_time, 10) AS 날짜,
  Leg.departure               AS 출발지,
  Leg.arrival                 AS 목적지,
  Leg.flight_num              AS "항공기 번호",
  Leg.dep_time                AS 출발시간,
  Leg.arriv_time              AS 도착시간
FROM Leg
ORDER BY 출발시간 
;



-- Oracle SQL Developer Data Modeler 요약 보고서: 
-- 
-- CREATE TABLE                             7
-- CREATE INDEX                             0
-- ALTER TABLE                             24
-- CREATE VIEW                              4
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
