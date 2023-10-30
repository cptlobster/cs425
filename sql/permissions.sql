-- Create user roles and permissions for users

-- Roles:
-- - PUBLIC: Anyone can view package info if they have the ID, and we give access
--   to timetables for getting arrival data
-- - guarantors: Paying customers. They get permissions to access the customers,
--   transactions, and orders table in addition to public access
-- - employees: Employees have read-only access to all tables, but can insert/update
--   packages, customers, timetables, transactions, and orders, and update fleet status.
-- - administrators: Has full permissions for database.

CREATE ROLE employees;
CREATE ROLE administrators;
CREATE ROLE guarantors;

REVOKE ALL FROM PUBLIC;
GRANT SELECT ON package, timetable TO PUBLIC;
GRANT SELECT ON customers, transactions, orders TO guarantors;
GRANT SELECT ON package, fleet, depots, orders, customers, transactions, timetable, distances TO GROUP employees;
GRANT UPDATE ON package, fleet, orders, customers, timetable, transactions TO GROUP employees;
GRANT INSERT ON package, customers, timetable, transactions TO GROUP employees;
GRANT ALL TO administrators;