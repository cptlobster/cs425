-- Table for depots
INSERT INTO Depots
VALUES (1,'Chicago', 100000, 15, 1, 2);

INSERT INTO Depots
VALUES (2, 'New York City', 200000, 15, 0, 3);

INSERT INTO Depots
VALUES (3, 'Richmond',  250000, 10, 2, 5);

INSERT INTO Depots
VALUES (4, 'San Diego', 430000, 20, 1, 2);

INSERT INTO Depots
VALUES (5, 'Dayton', 560000, 10, 0, 0);

-- Table for fleet
INSERT INTO fleet
VALUES (1, 'semi', 1100, 25000, 'travel', 2);

INSERT INTO fleet
VALUES (2, 'tandem', 2400, 23000, 'stored', 3);

INSERT INTO fleet
VALUES (3, 'airplane', 160000, 78000, 'loading', 1);

INSERT INTO fleet
VALUES (4, 'train', 260000, 9000000, 'rest', 5);

INSERT INTO fleet
VALUES (5, 'train', 200000, 8500000, 'travel', 4);

-- Table for packages
INSERT INTO packages
VALUES (1, 4, 'travel', 'food', 10, 100, 5, NULL);

INSERT INTO packages
VALUES (2, 3, 'stored', 'electronic', 2, 1000, 2, 3);

INSERT INTO packages
VALUES (3, 2, 'travel', 'clothing', 5, 550, 1, NULL);

INSERT INTO packages
VALUES (4, 5, 'rest', 'furniture', 80, 3000, 4, 2);

INSERT INTO packages
VALUES (5, 1, 'loading', 'skincare', 5, 350, 3, 5);

-- Table for customers
INSERT INTO customers
VALUES (1, 'James Charles', '807 3rd St Chicago IL 60912', 'jcharles@gmail.com', 350);

INSERT INTO customers
VALUES (2, 'Sam Cortland', '72334 Colerain Rd Dayton OH 43912', 'scortland@yahoo.com', 3000);

INSERT INTO customers
VALUES (3, 'Jasmine Ababwa', '112 E 35 St New York NY 10016', 'jababwa@outlook.com', 550);

INSERT INTO customers
VALUES (4, 'Rapunzel Rider', '2525 Alexander Ave Richmond VA 23234', 'rrider@gmail.com', 1000);

INSERT INTO customers
VALUES (5, 'Waseem Khan', '7056 Fulton St San Diego CA 92111', 'wkhan@yahoo.com', 100);

-- Table for orders
INSERT INTO orders
VALUES (1, 350, 1, 5);

INSERT INTO orders
VALUES (2, 3000, 2, 4);

INSERT INTO orders
VALUES (3, 550, 3, 3);

INSERT INTO orders
VALUES (4, 1000, 4, 2);

INSERT INTO orders
VALUES (5, 100, 4, 1);


-- Table for transactions
INSERT INTO transactions
VALUES (1, 1, 5, 'debitcard', 350);

INSERT INTO transactions
VALUES (2, 2, 4, 'debitcard', 3000);

INSERT INTO transactions
VALUES (3, 3, 3, 'creditcard', 550);

INSERT INTO transactions
VALUES (4, 2, 4,  'cash', 1000);

INSERT INTO transactions
VALUES (5, 1, 4, 'creditcard', 100);


INSERT INTO timetable
VALUES (1, 1, 5, 2, TIMESTAMP '2023-12-08 03:00:00', TIMESTAMP '2023-12-08 18:00:00', INTERVAL '0');

INSERT INTO timetable
VALUES (2, 2, 1, 3, TIMESTAMP '2023-12-08 15:30:00', TIMESTAMP '2023-12-09 02:15:00', INTERVAL '0');

INSERT INTO timetable
VALUES (3, 3, 4, 1, TIMESTAMP '2023-12-08 16:05:00', TIMESTAMP '2023-12-08 22:40:00', INTERVAL '0');

INSERT INTO timetable
VALUES (4, 4, 3, 5, TIMESTAMP '2023-12-08 17:00:00', TIMESTAMP '2023-12-09 04:20:00', INTERVAL '0');

INSERT INTO timetable
VALUES (5, 5, 2, 4, TIMESTAMP '2023-12-09 08:00:00', TIMESTAMP '2023-12-09 20:25:00', INTERVAL '0');


INSERT INTO distances
VALUES (5, 2, 1052);

INSERT INTO distances
VALUES (1, 3, 1286 );

INSERT INTO distances
VALUES (4, 1, 3341 );

INSERT INTO distances
VALUES (3, 5, 819 );

INSERT INTO distances
VALUES (2, 4, 4443 );