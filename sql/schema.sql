CREATE TABLE IF NOT EXISTS packages (
    id INT PRIMARY KEY NOT NULL,
    dest VARCHAR(100) NOT NULL,
    status VARCHAR(10) NOT NULL,
    category VARCHAR(10) NOT NULL,
    declared_value INT NOT NULL,
    vehicle_id INT FOREIGN KEY REFERENCES fleet,
    depot_id INT FOREIGN KEY REFERENCES depots
)