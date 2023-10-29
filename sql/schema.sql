CREATE TABLE IF NOT EXISTS packages (
    id INT PRIMARY KEY NOT NULL,                      -- ID
    dest INT NOT NULL REFERENCES depots(id),          -- Destination depot
    stat VARCHAR(10) NOT NULL,                        -- Status (stored, traveling, loading, missing, stopped)
    category VARCHAR(10) NOT NULL,                    -- Category
    wght NUMERIC(6, 2) NOT NULL,                      -- Package weight
    declared_value NUMERIC(6, 2) NOT NULL,            -- Declared value (USD)
    vehicle_id INT REFERENCES fleet(id),              -- Vehicle ID
    depot_id INT REFERENCES depots(id)                -- Depots ID
)

CREATE TABLE IF NOT EXISTS fleet (
    id INT PRIMARY KEY NOT NULL                       -- ID
    vehicle_type VARCHAR(10) NOT NULL,                -- Vehicle type (semi, tandem, airplane, train)
    rng INT NOT NULL,                                 -- Range
    capacity NUMERIC(6, 2) NOT NULL,                  -- Capacity
    stat VARCHAR(10) NOT NULL,                        -- Status (stored, traveling, loading, missing, stopped)
    destination INT NOT NULL REFERENCES depots(id)    -- Destination depot
)

CREATE TABLE IF NOT EXISTS depots(
    id INT PRIMARY KEY NOT NULL,                      -- ID
    city VARCHAR(30) NOT NULL,                        -- Location
    capacity NUMERIC(6, 2) NOT NULL,                  -- Capacity
    truck_spaces INT,                                 -- Vehical Support 
    plane_spaces INT,                                 -- Vehical Support
    train_spaces INT                                  -- Vehical Support
)

CREATE TABLE IF NOT EXISTS orders(
    id INT PRIMARY KEY NOT NULL,                      -- Order
    cost NUMERIC(6, 2) NOT NULL,                      -- Cost
    customer_id INT NOT NULL REFERENCES customers(id),-- Customer ID
    package_id INT NOT NULL REFERENCES packages(id)   -- Package ID
)

CREATE TABLE IF NOT EXISTS customers (
    id INT PRIMARY KEY NOT NULL,                      -- Customer ID
    nme VARCHAR(100) NOT NULL,                        -- Customer Name
    bill_address VARCHAR(200) NOT NULL,               -- Billing Address
    email VARCHAR(50) NOT NULL,                       -- Email address (primary point of contact)
    amt_due NUMERIC(6, 2) NOT NULL                    -- Amount Due
)

CREATE TABLE IF NOT EXISTS transactions (
    id INT PRIMARY KEY NOT NULL,
    customer_id INT NOT NULL REFERENCES customer(id), -- Customer ID
    order_id INT NOT NULL,                            -- Order ID
    pmt_method VARCHAR(10) NOT NULL,                  -- Payment method (card, check, direct)
    amount NUMERIC(6, 2) NOT NULL                     -- Amount Paid
)

CREATE TABLE IF NOT EXISTS timetable (
    id INT PRIMARY KEY NOT NULL,
    fleet_id INT NOT NULL REFERENCES fleet(id),       -- Fleet ID
    source INT NOT NULL REFERENCES depots(id),        -- Depots ID
    dest INT NOT NULL REFERENCES depots(id) 
      CHECK (dest != source),                         -- Destination Depots ID
    departure TIMESTAMP NOT NULL,                     -- Departure Time
    arrival TIMESTAMP NOT NULL,                       -- Arrival Time
    diff INTERVAL                                     -- Difference Scheduled
)

CREATE TABLE IF NOT EXISTS distances (
    source INT NOT NULL REFERENCES depots,
    dest INT NOT NULL REFERENCES depots
      CHECK (dest != source),
    distance INT NOT NULL
)