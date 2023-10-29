CREATE TABLE IF NOT EXISTS packages (
    id INT PRIMARY KEY NOT NULL,
    dest VARCHAR(100) NOT NULL,
    sta VARCHAR(10) NOT NULL,
    category VARCHAR(10) NOT NULL,
    declared_value INT NOT NULL,
    vehicle_id INT FOREIGN KEY REFERENCES fleet,
    depot_id INT FOREIGN KEY REFERENCES depots
)

CREATE TABLE fleet (
    vehicle_type VARCHAR (100) NOT NULL,
    rng INT NOT NULL,
    capacity INT NOT NULL,
    sta VARCHAR (10) NOT NULL,
    dest_depot VARCHAR (100) NOT NULL 
)

CREATE TABLE depots(
    loc VARCHAR (200) NOT NULL,
    vehical_sup INT (100) NOT NULL,
    capacity_str INT NOT NULL
)