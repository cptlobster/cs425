-- Create user groups and permissions for users

CREATE ROLE employees;
CREATE ROLE administrators;
CREATE ROLE guarantors;

REVOKE ALL FROM PUBLIC;
GRANT SELECT ON package, timetable TO PUBLIC;
GRANT SELECT ON customers, transactions, orders TO guarantors;
GRANT SELECT ON package, fleet, depots, orders, customers, transactions, timetable, distances TO GROUP employees;
GRANT UPDATE ON package, fleet, customers, timetable, transactions TO GROUP employees;
GRANT INSERT ON package, customers, timetable, transactions TO GROUP employees;
GRANT ALL TO administrators;