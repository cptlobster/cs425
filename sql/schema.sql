CREATE TABLE IF NOT EXISTS packages (
    id INT PRIMARY KEY NOT NULL,                    -- ID
    dest VARCHAR(100) NOT NULL,                     -- Destination
    sta VARCHAR(10) NOT NULL,                       -- Status (stored, traveling, loading, missing, stopped)
    category VARCHAR(10) NOT NULL,                  -- Category
    declared_value INT NOT NULL,                    -- Declared value
    vehicle_id INT FOREIGN KEY REFERENCES fleet,    -- Vehical ID
    depot_id INT FOREIGN KEY REFERENCES depots      -- Depots ID
)

CREATE TABLE IF NOT EXISTS fleet (
    id INT PRIMARY KEY NOT NULL                     -- ID
    vehicle_type VARCHAR (10) NOT NULL,             -- Vehical type (semi truck, tandem semi truck, airplane, train)
    rng INT NOT NULL,                               -- Range
    capacity INT NOT NULL,                          -- Capacity
    sta VARCHAR (10) NOT NULL,                      -- Status (stored, traveling, loading, missing, stopped)
    dest_depot INT NOT NULL                         -- Destinatino depot
)

CREATE TABLE IF NOT EXISTS depots(
    id INT PRIMARY KEY NOT NULL                     -- ID
    city VARCHAR (30) NOT NULL,                     -- Location
    capacity INT NOT NULL                           -- Capacity
    truck_spaces INT,                               -- Vehical Support 
    plane_spaces INT,                               -- Vehical Support
    boat_splaces INT                                -- Vehical Support
)

CREATE TABLE IF NOT EXISTS orders(
    cost INT NOT NULL,                              -- Cost
    customer_ID INT (50) NOT NULL                   -- Customer ID
)

CREATE TABLE IF NOT EXISTS customer (
    nme VARCHAR (100) NOT NULL,                     -- Customer Name
    bill_address VARCHAR (200) NOT NULL,            -- Billing Address
    amt_due INT NOT NULL                            -- Amount Due
)

CREATE TABLE IF NOT EXISTS transactions (
    customer_ID INT NOT NULL,                       -- Customer ID
    order_ID INT NOT NULL,                          -- Order ID
    trans_type VARCHAR (100) NOT NULL,              -- Transactions Type (payment made, billng for services)
    amt_due INT NOT NULL                            -- Amount Due
)

CREATE TABLE IF NOT EXISTS timetable (
    fleet_ID INT NOT NULL,                          -- Fleet ID
    depots_ID INT NOT NULL,                         -- Depots ID
    dest_depots_ID INT NOT NULL,                    -- Destination Depots ID
    departure INT NOT NULL,                         -- Departure Time
    arrival INT NOT NULL,                           -- Arrival Time
    diff INT NOT NULL                               -- Difference Scheduled
)

