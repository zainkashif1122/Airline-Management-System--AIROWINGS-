-- create the database
create database PROJECT;
use PROJECT;

-- create the AIRPORT table
create table AIRPORT(
AirportID varchar(10) primary key,
AirportName char(100),
Location char(100)
);

-- create the AIRCRAFT table
create table AIRCRAFT(
AircraftID varchar(10) primary key,
AircraftType char(50),
TotalSeats int,
LastMaintenanceDate date
);

-- create the PASSENGER table
create table PASSENGER(
PassengerID varchar(10) primary key,
FirstName char(50),
LastName char(50),
Gender char(1),
DOB date,
Age int,
Email varchar(100),
AircraftID varchar(10)
);

-- create the PHONENUMBER table
create table PHONENUMBER(
PrimaryPhone bigint,
SecondaryPhone bigint,
PassengerID varchar(10)
);

-- create the BAGGAGE table
create table BAGGAGE(
BaggageID varchar(10) primary key,
Weight float,
PassengerID varchar(10)
);

-- create the TICKET table
create table TICKET(
TicketID varchar(10) primary key,
SeatNumber varchar(10),
Class char(50),
PassengerID varchar(10),
FlightID varchar(10)
);

-- create the PAYMENT table
create table PAYMENT(
PaymentID varchar(10) primary key,
Amount float,
PaymentDate date,
PaymentMethod char(50),
TicketID varchar(10)
);

-- create the CREW table
create table CREW(
CrewID varchar(10) primary key,
FirstName char(50),
LastName char(50),
Position char(50)
);

-- create the FLIGHT table
create table FLIGHT(
FlightID varchar(10) primary key,
DepAirport char(50),
ArrAirport char(50),
DepDateTime datetime,
ArrDateTime datetime,
FlightDuration time,
Status char(50),
AircraftID varchar(10),
AirportID varchar(10)
);

-- create the FLIGHT_CREW table
create table FLIGHT_CREW(
CrewID varchar(10),
FlightID varchar(10),
primary key (CrewID, FlightID)
);

-- create the PASSENGER_FLIGHT table
create table PASSENGER_FLIGHT(
PassengerID varchar(10),
FlightID varchar(10),
primary key (PassengerID, FlightID)
);

-- create the MAINTENANCE_SCHEDULE table
create table MAINTENANCE_SCHEDULE(
ScheduleID varchar(10) primary key,
ScheduleDate date,
Description char(255),
AircraftID varchar(10)
);

-- create the MAINTENANCE_RECORD table
create table MAINTENANCE_RECORD(
RecordID varchar(10) primary key,
CompletionDate date,
ScheduleID varchar(10)
);

show tables;

-- add Foreign Keys in tables

alter table PASSENGER
add foreign key (AircraftID) references AIRCRAFT(AircraftID);

alter table PHONENUMBER
add foreign key (PassengerID) references PASSENGER(PassengerID);

alter table BAGGAGE
add foreign key (PassengerID) references PASSENGER(PassengerID);

alter table TICKET
add foreign key (PassengerID) references PASSENGER(PassengerID);

alter table TICKET
add foreign key (FlightID) references FLIGHT(FlightID);

alter table PAYMENT
add foreign key (TicketID) references TICKET(TicketID);

alter table FLIGHT
add foreign key (AircraftID) references AIRCRAFT(AircraftID);

alter table FLIGHT
add foreign key (AirportID) references AIRPORT(AirportID);

alter table FLIGHT_CREW
add foreign key (CrewID) references CREW(CrewID);

alter table FLIGHT_CREW
add foreign key (FlightID) references FLIGHT(FlightID);

alter table PASSENGER_FLIGHT
add foreign key (PassengerID) references PASSENGER(PassengerID);

alter table PASSENGER_FLIGHT
add foreign key (FlightID) references FLIGHT(FlightID);

alter table MAINTENANCE_SCHEDULE
add foreign key (AircraftID) references AIRCRAFT(AircraftID);

alter table MAINTENANCE_RECORD
add foreign key (ScheduleID) references MAINTENANCE_SCHEDULE(ScheduleID);

desc AIRPORT;

-- Insert data into AIRPORT table
insert into AIRPORT (AirportID, AirportName, Location) 
values ('KHI', 'Jinnah International Airport', 'Karachi'),
('LHE', 'Allama Iqbal International Airport', 'Lahore'),
('ISB', 'Islamabad International Airport', 'Islamabad'),
('PEW', 'Bacha Khan International Airport', 'Peshawar'),
('MUX', 'Multan International Airport', 'Multan'),
('SKT', 'Sialkot International Airport', 'Sialkot'),
('UET', 'Quetta International Airport', 'Quetta'),
('LYP', 'Faisalabad International Airport', 'Faisalabad'),
('KDU', 'Skardu International Airport', 'Skardu'),
('GIL', 'Gilgit Airport', 'Gilgit'),
('SKZ', 'Sukkar Airport', 'Sukkar'),
('TUK', 'Turbat Airport', 'Turbat'),
('GWD', 'Gwadar International Airport', 'Gwadar'),
('RYK', 'Sheikh Zayed International Airport', 'Rahim Yar Khan'),
('BHV', 'Bahawalpur Airport', 'Bahawalpur');
 
-- Insert data into AIRCRAFT table
insert into AIRCRAFT (AircraftID, AircraftType, TotalSeats, LastMaintenanceDate) 
values ('001', 'Boeing 777', 314, '2024-01-01'),
('002', 'Airbus A320', 180, '2024-02-01'),
('030', 'Boeing 737', 162, '2024-03-01'),
('004', 'ATR 72', 70, '2024-04-01'),
('050', 'Airbus A380', 500, '2024-05-01'),
('006', 'Boeing 747', 1554, '2024-06-01'),
('070', 'Embraer 175', 80, '2024-07-01'),
('008', 'Bombardier Q400', 80, '2024-08-01'),
('090', 'Airbus Beluga XL', 800, '2024-09-01'),
('010', 'T45 Goshawk', 260, '2024-10-01'),
('000', 'VC-25A Air Force One', 320, '2024-11-01'),
('017', 'F-15E Strike Eagle', 40, '2024-12-01'),
('031', 'British Aerospace ATP', 480, '2025-01-01'),
('100', 'Diamond DA-50 Magnum', 110, '2025-02-01'),
('015', 'Eclipse 400 ECJ', 200, '2025-03-01');

-- Insert data into PASSENGER table
insert into PASSENGER (PassengerID, FirstName, LastName, Gender, DOB, Age, Email, AircraftID) 
values ('001', 'Ali', 'Khan', 'M', '1990-01-01', 34, 'ali.khan@example.com', '001'),
('002', 'Sara', 'Ahmed', 'F', '1985-05-05', 39, 'sara.ahmed@example.com', '002'),
('003', 'Usman', 'Saeed', 'M', '1982-03-15', 42, 'usman.saeed@example.com', '030'),
('004', 'Ayesha', 'Kamal', 'F', '1995-07-25', 29, 'ayesha.kamal@example.com', '004'),
('005', 'Bilal', 'Zafar', 'M', '1978-11-30', 46, 'bilal.zafar@example.com', '050'),
('006', 'Azam', 'Khan', 'M', '1990-01-01', 34, 'azam.khan@example.com', '006'),
('007', 'Sana', 'Sohail', 'F', '1985-05-05', 39, 'Sana.sohail@example.com', '070'),
('008', 'Saeed', 'Ghani', 'M', '1982-03-15', 42, 'saeed.ghani@example.com', '008'),
('009', 'Ayesha', 'Siddique', 'F', '1995-07-25', 29, 'ayesha.siddique@example.com', '090'),
('010', 'Bilal', 'Ahmed', 'M', '1978-11-30', 46, 'bilal.ahmed@example.com', '010'),
('011', 'Muhammad', 'Ali', 'M', '1990-01-01', 34, 'muhammad.ali@example.com', '000'),
('012', 'Sara', 'Ali', 'F', '1985-05-05', 39, 'sara.ali@example.com', '017'),
('013', 'Usman', 'Sohail', 'M', '1982-03-15', 42, 'usman.sohail@example.com', '031'),
('014', 'Ayesha', 'Khan', 'F', '1995-07-25', 29, 'ayesha.khan@example.com', '100'),
('015', 'Bilal', 'Ali', 'M', '1978-11-30', 46, 'bilal.ali@example.com', '015');

-- Insert data into PHONENUMBER table
insert into PHONENUMBER (PrimaryPhone, SecondaryPhone, PassengerID) 
values (3001234567, 3007654321, '001'),
(3009876543, 3005678901, '002'),
(3002345678, 3008765432, '003'),
(3003456789, 3009876543, '004'),
(300451890, 3000987354, '005'),
(3001324667, 3007634021, '006'),
(3009876543, 3005678901, '007'),
(3002345678, 3008765432, '008'),
(3003456789, 3009876543, '009'),
(3004517190, 3000982104, '010'),
(3001222517, 3007456312, '011'),
(3001871543, 3005608901, '012'),
(3002305608, 3008723543, '013'),
(3003436189, 3009871503, '014'),
(3004765809, 3000967854, '015');

-- Insert data into BAGGAGE table
insert into BAGGAGE (BaggageID, Weight, PassengerID) 
values ('001', 23.5, '001'),
('020', 20.0, '002'),
('003', 25.0, '003'),
('040', 18.0, '004'),
('005', 30.0, '005'),
('060', 23.5, '006'),
('007', 20.0, '007'),
('080', 25.0, '008'),
('009', 18.0, '009'),
('010', 30.0, '010'),
('011', 23.5, '011'),
('012', 20.0, '012'),
('013', 25.0, '013'),
('014', 18.0, '014'),
('015', 30.0, '015');

-- Insert data into FLIGHT table
insert into FLIGHT (FlightID, DepAirport, ArrAirport, DepDateTime, ArrDateTime, FlightDuration, Status, AircraftID, AirportID) 
values ('010', 'KHI', 'LHE', '2024-06-10 10:00:00', '2024-06-10 12:00:00', '02:00:00', 'On Time', '001', 'KHI'),
('002', 'LHE', 'ISB', '2024-06-11 15:00:00', '2024-06-11 16:00:00', '01:00:00', 'Delayed', '002', 'LHE'),
('030', 'ISB', 'KHI', '2024-06-12 18:00:00', '2024-06-12 20:00:00', '02:00:00', 'On Time', '030', 'ISB'),
('004', 'KHI', 'PEW', '2024-06-13 08:00:00', '2024-06-13 09:30:00', '01:30:00', 'Cancelled', '004', 'KHI'),
('050', 'PEW', 'SKT', '2024-06-14 11:00:00', '2024-06-14 12:00:00', '01:00:00', 'On Time', '050', 'PEW'),
('006', 'KHI', 'LHE', '2024-06-10 10:00:00', '2024-06-10 12:00:00', '02:00:00', 'On Time', '006', 'KHI'),
('070', 'LHE', 'ISB', '2024-06-11 15:00:00', '2024-06-11 16:00:00', '01:00:00', 'Delayed', '070', 'LHE'),
('008', 'ISB', 'KHI', '2024-06-12 18:00:00', '2024-06-12 20:00:00', '02:00:00', 'On Time', '008', 'ISB'),
('090', 'KHI', 'PEW', '2024-06-13 08:00:00', '2024-06-13 09:30:00', '01:30:00', 'Cancelled', '090', 'KHI'),
('000', 'PEW', 'SKT', '2024-06-14 11:00:00', '2024-06-14 12:00:00', '01:00:00', 'On Time', '010', 'PEW'),
('011', 'KHI', 'LHE', '2024-06-10 10:00:00', '2024-06-10 12:00:00', '02:00:00', 'On Time', '000', 'KHI'),
('012', 'LHE', 'ISB', '2024-06-11 15:00:00', '2024-06-11 16:00:00', '01:00:00', 'Delayed', '017', 'LHE'),
('013', 'ISB', 'KHI', '2024-06-12 18:00:00', '2024-06-12 20:00:00', '02:00:00', 'On Time', '031', 'ISB'),
('014', 'KHI', 'PEW', '2024-06-13 08:00:00', '2024-06-13 09:30:00', '01:30:00', 'Cancelled', '100', 'KHI'),
('015', 'PEW', 'SKT', '2024-06-14 11:00:00', '2024-06-14 12:00:00', '01:00:00', 'On Time', '015', 'PEW');

-- Insert data into TICKET table
insert into TICKET (TicketID, SeatNumber, Class, PassengerID, FlightID) 
values ('001', '12A', 'Economy', '001', '010'),
('002', '14C', 'Economy', '002', '002'),
('003', '16B', 'Business', '003', '030'),
('004', '18D', 'First', '004', '004'),
('005', '20E', 'Economy', '005', '050'),
('006', '22A', 'Economy', '006', '006'),
('007', '24C', 'Economy', '007', '070'),
('008', '26B', 'Business', '008', '008'),
('009', '28D', 'First', '009', '090'),
('010', '30E', 'Economy', '010', '000'),
('011', '32A', 'Economy', '011', '011'),
('012', '34C', 'Economy', '012', '012'),
('013', '36B', 'Business', '013', '013'),
('014', '38D', 'First', '014', '014'),
('015', '40E', 'Economy', '015', '015');

-- Insert data into PAYMENT table
insert into PAYMENT (PaymentID, Amount, PaymentDate, PaymentMethod, TicketID) 
values ('001', 15000.0, '2024-06-01', 'Credit Card', '001'),
('002', 16000.0, '2024-06-02', 'Debit Card', '002'),
('003', 25000.0, '2024-06-03', 'Credit Card', '003'),
('004', 35000.0, '2024-06-04', 'Cash', '004'),
('005', 10000.0, '2024-06-05', 'Debit Card', '005'),
('006', 15000.0, '2024-06-01', 'Credit Card', '006'),
('007', 16000.0, '2024-06-02', 'Debit Card', '007'),
('008', 25000.0, '2024-06-03', 'Credit Card', '008'),
('009', 35000.0, '2024-06-04', 'Cash', '009'),
('010', 10000.0, '2024-06-05', 'Debit Card', '010'),
('011', 15000.0, '2024-06-01', 'Credit Card', '011'),
('012', 16000.0, '2024-06-02', 'Debit Card', '012'),
('013', 25000.0, '2024-06-03', 'Credit Card', '013'),
('014', 35000.0, '2024-06-04', 'Cash', '014'),
('015', 10000.0, '2024-06-05', 'Debit Card', '015');

-- Insert data into CREW table
insert into CREW (CrewID, FirstName, LastName, Position) 
values ('001', 'Asad', 'Ali', 'Pilot'),
('002', 'Nida', 'Hussain', 'Flight Attendant'),
('003', 'Raza', 'Khan', 'Co-Pilot'),
('004', 'Sana', 'Zafar', 'Flight Attendant'),
('005', 'Kamran', 'Sheikh', 'Pilot'),
('006', 'Ali', 'Asad', 'Pilot'),
('007', 'Nidia', 'Nadeem', 'Flight Attendant'),
('008', 'Ahir', 'Khaan', 'Co-Pilot'),
('009', 'Sania', 'Zafar', 'Flight Attendant'),
('010', 'Kamran', 'Akmal', 'Pilot'),
('011', 'Muhammad', 'Ali', 'Pilot'),
('012', 'Sheeza', 'Hussain', 'Flight Attendant'),
('013', 'Rehmaan', 'Khan', 'Co-Pilot'),
('014', 'Ashfa', 'Burhan', 'Flight Attendant'),
('015', 'Umar', 'Sheikh', 'Pilot');

-- Insert data into FLIGHT_CREW table
insert into FLIGHT_CREW (CrewID, FlightID) 
values ('001', '010'),
('002', '002'),
('003', '030'),
('004', '004'),
('005', '050'),
('006', '006'),
('007', '070'),
('008', '008'),
('009', '090'),
('010', '000'),
('011', '011'),
('012', '012'),
('013', '013'),
('014', '014'),
('015', '015');

-- Insert data into PASSENGER_FLIGHT table
insert into PASSENGER_FLIGHT (PassengerID, FlightID) 
values ('001', '010'),
('002', '002'),
('003', '030'),
('004', '004'),
('005', '050'),
('006', '006'),
('007', '070'),
('008', '008'),
('009', '090'),
('010', '000'),
('011', '011'),
('012', '012'),
('013', '013'),
('014', '014'),
('015', '015');

-- Insert data into MAINTENANCE_SCHEDULE table
insert into MAINTENANCE_SCHEDULE (ScheduleID, ScheduleDate, Description, AircraftID) 
values ('001', '2024-07-01', 'Routine Maintenance', '001'),
('002', '2024-08-01', 'Engine Check', '002'),
('003', '2024-09-01', 'Avionics Update', '030'),
('004', '2024-10-01', 'Cabin Refurbishment', '004'),
('005', '2024-11-01', 'Complete Overhaul', '050'),
('006', '2024-07-01', 'Routine Maintenance', '006'),
('007', '2024-08-01', 'Engine Check', '070'),
('008', '2024-09-01', 'Avionics Update', '008'),
('009', '2024-10-01', 'Cabin Refurbishment', '090'),
('010', '2024-11-01', 'Complete Overhaul', '010'),
('011', '2024-07-01', 'Routine Maintenance', '000'),
('012', '2024-08-01', 'Engine Check', '017'),
('013', '2024-09-01', 'Avionics Update', '031'),
('014', '2024-10-01', 'Cabin Refurbishment', '100'),
('015', '2024-11-01', 'Complete Overhaul', '015');

-- Insert data into MAINTENANCE_RECORD table
insert into MAINTENANCE_RECORD (RecordID, CompletionDate, ScheduleID) 
values ('001', '2024-07-02', '001'),
('002', '2024-08-02', '002'),
('003', '2024-09-02', '003'),
('004', '2024-10-02', '004'),
('005', '2024-11-02', '005'),
('006', '2024-07-02', '006'),
('007', '2024-08-02', '007'),
('008', '2024-09-02', '008'),
('009', '2024-10-02', '009'),
('010', '2024-11-02', '010'),
('011', '2024-07-02', '011'),
('012', '2025-08-02', '012'),
('013', '2025-09-02', '013'),
('014', '2025-10-02', '014'),
('015', '2025-11-02', '015');

-- find airports located in Karachi
select * from AIRPORT 
where location = 'Karachi';

-- find aircraft with more than 200 seats
select * from AIRCRAFT 
where totalseats > 200;

-- find all male passengers
select * from PASSENGER 
where gender = 'M';

-- find baggage with weight greater than 25 kg
select * from BAGGAGE 
where weight > 25.0;

-- find payments made by credit card and amount greater than 20000
select * from PAYMENT 
where paymentmethod = 'Credit Card' and amount > 20000;

-- find all crew members who are pilots
select * from CREW 
where position = 'Pilot';

-- find flights operated by crew C001
select * from FLIGHT_CREW
where crewid = 'C001';

-- find maintenance schedules after '2024-08-01'
select * from MAINTENANCE_SCHEDULE  
where scheduledate > '2024-08-01';

-- find maintenance records completed after '2024'
select * from MAINTENANCE_RECORD 
where completiondate like '2024%';

-- find all baggage items with weight greater than 20 and less than 30 kg
select * from BAGGAGE 
where weight > 20.0 and weight < 30.0;

-- find all passengers older than 40 years
select * from PASSENGER 
where age > 40;

-- find all passengers with primary phone numbers
select * from PHONENUMBER 
where primaryphone is not null;

-- find passengers who are not male, aged between 30 and 50, and have an email ending with '.com'
select * from PASSENGER
where gender != 'M' and age between 30 and 50 and email like '%.com';

-- find flights that are cancelled
select * from FLIGHT
where status = 'cancelled';

-- find flights arriving at airports ending with 'E'?
select * from FLIGHT
where ArrAirport like '%E';

-- PHASE 4

-- JOINS
-- Inner Joins

select a.AirportID ,a.AirportName, f.FlightID, ac.AircraftID
from AIRPORT as a
inner join FLIGHT as f
on a.AirportID = f.FlightID
inner join AIRCRAFT as ac
on f.AircraftID = ac.AircraftID;

select f.FlightID ,a.AircraftID ,a.AircraftType, ap.AirportID
from FLIGHT as f
inner join AIRCRAFT as a
on f.FlightID = a.AircraftID
inner join AIRPORT as ap
on f.FlightID = ap.AirportID;

select p.PassengerID,p.FirstName,p.LastName,t.TicketID,t.SeatNumber,t.FlightID
from PASSENGER as p
inner join TICKET as t
on p.PassengerID = t.TicketID;

select a.AircraftID,a.AircraftType,a.LastMaintenanceDate,m.ScheduleID,m.ScheduleDate,f.flightID
from AIRCRAFT as a
inner join MAINTENANCE_SCHEDULE as m
on a.AircraftID = m.ScheduleID
inner join FLIGHT as f
on a.AircraftID = f.AircraftID;

select p.PassengerID,p.FirstName,p.LastName,b.BaggageID,b.Weight
from PASSENGER as p
inner join BAGGAGE as b
on p.PassengerID = b.BaggageID;

-- Left Joins

select a.AirportID ,a.AirportName, f.FlightID, ac.AircraftID
from AIRPORT as a
left join FLIGHT as f
on a.AirportID = f.FlightID
left join AIRCRAFT as ac
on f.AircraftID = ac.AircraftID;

select f.FlightID ,a.AircraftID ,a.AircraftType, ap.AirportID
from FLIGHT as f
left join AIRCRAFT as a
on f.FlightID = a.AircraftID
left join AIRPORT as ap
on f.FlightID = ap.AirportID;

select p.PassengerID,p.FirstName,p.LastName,t.TicketID,t.SeatNumber,t.FlightID
from PASSENGER as p
left join TICKET as t
on p.PassengerID = t.TicketID;

select a.AircraftID,a.AircraftType,a.LastMaintenanceDate,m.ScheduleID,m.ScheduleDate,f.flightID
from AIRCRAFT as a
left join MAINTENANCE_SCHEDULE as m
on a.AircraftID = m.ScheduleID
left join FLIGHT as f
on a.AircraftID = f.AircraftID;

select p.PassengerID,p.FirstName,p.LastName,b.BaggageID,b.Weight
from PASSENGER as p
left join BAGGAGE as b
on p.PassengerID = b.BaggageID;

-- Right Join

select a.AirportID ,a.AirportName, f.FlightID, ac.AircraftID
from AIRPORT as a
right join FLIGHT as f
on a.AirportID = f.FlightID
right join AIRCRAFT as ac
on f.AircraftID = ac.AircraftID;

select f.FlightID ,a.AircraftID ,a.AircraftType, ap.AirportID
from FLIGHT as f
right join AIRCRAFT as a
on f.FlightID = a.AircraftID
right join AIRPORT as ap
on f.FlightID = ap.AirportID;

select p.PassengerID,p.FirstName,p.LastName,t.TicketID,t.SeatNumber,t.FlightID
from PASSENGER as p
right join TICKET as t
on p.PassengerID = t.TicketID;

select a.AircraftID,a.AircraftType,a.LastMaintenanceDate,m.ScheduleID,m.ScheduleDate,f.flightID
from AIRCRAFT as a
right join MAINTENANCE_SCHEDULE as m
on a.AircraftID = m.ScheduleID
right join FLIGHT as f
on a.AircraftID = f.AircraftID;

select p.PassengerID,p.FirstName,p.LastName,b.BaggageID,b.Weight
from PASSENGER as p
right join BAGGAGE as b
on p.PassengerID = b.BaggageID;

-- Cross Join

select a.AirportID ,a.AirportName, f.FlightID, ac.AircraftID
from AIRPORT as a
cross join FLIGHT as f
on a.AirportID = f.FlightID
cross join AIRCRAFT as ac
on f.AircraftID = ac.AircraftID;

select f.FlightID ,a.AircraftID ,a.AircraftType, ap.AirportID
from FLIGHT as f
cross join AIRCRAFT as a
on f.FlightID = a.AircraftID
cross join AIRPORT as ap
on f.FlightID = ap.AirportID;

select p.PassengerID,p.FirstName,p.LastName,t.TicketID,t.SeatNumber,t.FlightID
from PASSENGER as p
cross join TICKET as t
on p.PassengerID = t.TicketID;

select a.AircraftID,a.AircraftType,a.LastMaintenanceDate,m.ScheduleID,m.ScheduleDate,f.flightID
from AIRCRAFT as a
cross join MAINTENANCE_SCHEDULE as m
on a.AircraftID = m.ScheduleID
cross join FLIGHT as f
on a.AircraftID = f.AircraftID;

select p.PassengerID,p.FirstName,p.LastName,b.BaggageID,b.Weight
from PASSENGER as p
cross join BAGGAGE as b
on p.PassengerID = b.BaggageID;

-- Full Join

select p.PassengerID,p.FirstName,p.LastName,b.BaggageID,b.Weight
from PASSENGER as p
left join BAGGAGE as b
on p.PassengerID = b.BaggageID
UNION
select p.PassengerID,p.FirstName,p.LastName,b.BaggageID,b.Weight
from PASSENGER as p
right join BAGGAGE as b
on p.PassengerID = b.BaggageID;

select p.PassengerID,p.FirstName,p.LastName,t.TicketID,t.SeatNumber,t.FlightID
from PASSENGER as p
left join TICKET as t
on p.PassengerID = t.TicketID
UNION
select p.PassengerID,p.FirstName,p.LastName,t.TicketID,t.SeatNumber,t.FlightID
from PASSENGER as p
right join TICKET as t
on p.PassengerID = t.TicketID;

select a.AircraftID,a.AircraftType,a.LastMaintenanceDate,m.ScheduleID,m.ScheduleDate
from AIRCRAFT as a
left join MAINTENANCE_SCHEDULE as m
on a.AircraftID = m.ScheduleID
UNION
select a.AircraftID,a.AircraftType,a.LastMaintenanceDate,m.ScheduleID,m.ScheduleDate
from AIRCRAFT as a
right join MAINTENANCE_SCHEDULE as m
on a.AircraftID = m.ScheduleID;

select f.FlightID ,a.AircraftID ,a.AircraftType
from FLIGHT as f
left join AIRCRAFT as a
on f.FlightID = a.AircraftID
UNION
select f.FlightID ,a.AircraftID ,a.AircraftType
from FLIGHT as f
right join AIRCRAFT as a
on f.FlightID = a.AircraftID;

select a.AirportID ,a.AirportName, f.FlightID
from AIRPORT as a
left join FLIGHT as f
on a.AirportID = f.FlightID
UNION
select a.AirportID ,a.AirportName, f.FlightID
from AIRPORT as a
left join FLIGHT as f
on a.AirportID = f.FlightID;

-- AGGREGATE FUNCIONS

select count(*)
from AIRPORT;

select max(Amount)
from PAYMENT;

select sum(Amount)
from PAYMENT;

select avg(Amount)
from PAYMENT;

select count(AircraftID)
from AIRCRAFT
where AircraftID > 001;

-- NESTED QUERIES

select FirstName, LastName
from PASSENGER
where PassengerID = ( select PassengerID
						 from PASSENGER
                         where Email = 'sara.ahmed@example.com');
                         
select PaymentID,PaymentDate,PaymentMethod
from Payment
where amount > ( select avg(Amount)
				 from PAYMENT);
                 
select PaymentID,PaymentDate,PaymentMethod
from Payment
where amount = ( select min(Amount)
				 from PAYMENT);
                 
select PaymentID,PaymentDate,PaymentMethod
from Payment
where PaymentID = ( select count(TicketID)
				    from PAYMENT);
                    
select PaymentID,PaymentDate,PaymentMethod
from Payment
where amount = ( select max(Amount)
				 from PAYMENT);
                 
-- Correlated Queries

select FirstName,LastName
from PASSENGER
where exists( select Gender
			  where PassengerID = AircraftID);
              
select AircraftID,AircraftType
from Aircraft
where not exists( select AircraftID
			      where TotalSeats > 100);
                  
select AircraftID,AircraftType
from Aircraft
where exists( select AircraftID
			  where TotalSeats < 100);
              
select PaymentID
from PAYMENT
where amount > ( select avg(Amount)
				 from PAYMENT
                 where PaymentID=TicketID);
                 
select FirstName,LastName
from Crew 
where 10 > ( select count(CrewID)
			 from CREW
			 where Position = 'Co-Pilot');