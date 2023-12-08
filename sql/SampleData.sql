-- Table for depots
insert into Depots
value (1,'chicago', 100000, 15, 1, 2)

insert into Depots
value (2, 'new york city', 200000, 15, 0, 3)

insert into Depots
value (3, 'richmond',  250000, 10, 2, 5)

insert into Depots
value (4, 'san diego', 430000, 20, 1, 2)

insert into Depots
value (5, 'dayton', 560000, 10, 0, 0)

-- Table for fleet
insert into fleet
value (1, 'semi', 1100, 25000, 'travel', 2)

insert into fleet
value (2, 'tandem', 2400, 23000, 'stored', 3)

insert into fleet
value (3, 'airplane', 160000, 78000, 'loading', 1)

insert into fleet
value (4, 'train', 260000, 9000000, 'rest', 5)

insert into fleet
value (5. 'train', 200000, 8500000, 'travel', 4)

-- Table for packages
insert into packages
value (1, 4, 'travel', 'food', 10, 100, 5, NULL)

insert into packages
value (2, 3, 'stored', 'electronic', 2, 1000, 2, 3)

insert into packages
value (3, 2, 'travel', 'clothing', 5, 550, 1, NULL)

insert into packages
value (4, 5, 'rest', 'furniture', 80, 3000, 4, 2)

insert into packages
value (5, 1, 'loading', 'skincare', 5, 350, 3, 5)

-- Table for customers
insert into customers
value (1, 'James Charles', '807 3rd St Chicago IL 60912', 'jcharles@gmail.com', 350)

insert into customers
value (2, 'Sam Cortland', '72334 Colerain Rd Dayton OH 43912', 'scortland@yahoo.com', 3000)

insert into customers
value (3, 'Jasmine Ababwa', '112 E 35 St New York NY 10016', 'jababwa@outlook.com', 550)

insert into customers
value (4, 'Rapunzel Rider', '2525 Alexander Ave Richmond VA 23234', 'rrider@gmail.com', 1000)

insert into customers
value (5, 'Waseem Khan', '7056 Fulton St San Diego CA 92111', 'wkhan@yahoo.com', 100)

-- Table for orders
insert into orders
value (1, 350, 1, 5)

insert into orders
value (2, 3000, 2, 4)

insert into orders
value (3, 550, 3, 3)

insert into orders
value (4, 1000, 4, 2)

insert into orders
value (5, 100, 4, 1)


-- Table for transactions
insert into transactions
value (1, 350, 1, 'debitcard', 5)

insert into transactions
value (2, 3000, 2, 'debitcard', 4)

insert into transactions
value (3, 550, 3, 'creditcard', 3)

insert into transactions
value (4, 1000, 4,  'cash', 2)

insert into transactions
value (5, 100, 4, 'creditcard', 1)


insert into timetable
value (1, 1, 5, 2, 3:00)

insert into timetable
value (2, 2, 1, 3, 6:00)

insert into timetable
value (3, 3, 4, 1, 4:00)

insert into timetable
value (4, 4, 3, 5, 5:00)

insert into timetable
value (5, 5, 2, 4, 2:00)


insert into distances
value (5, 2, 1052)

insert into distances
value (1, 3, 1286 )

insert into distances
value (4, 1, 3341 )

insert into distances
value (3, 5, 819 )

insert into distances
value (2, 4, 4443 )