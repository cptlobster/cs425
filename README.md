# cs425
class project for CS425

## Intended Functionality within Webapp

- Packages
  - [ ] List all packages
  - [ ] Search for a package by ID
  - [ ] Update package status
    - [ ] Mark as delivered
    - [ ] Assign to vehicle
    - [ ] Assign to depot
  - [ ] Create new package
- Fleet
  - [ ] List all vehicles
  - [ ] Update vehicle status
  - [ ] Update vehicle destination
  - [ ] Related Queries
    - [ ] List nearby depots within range
    - [ ] List packages assigned to vehicle
  - [ ] Create new vehicle
- Depots
  - [ ] List all depots
  - [ ] Related Queries
    - [ ] List vehicles at depot
    - [ ] List packages at depot
    - [ ] List nearby depots
    - [ ] List vehicles with destination of this depot
- Timetable
  - [ ] List entries
  - [ ] List entries by association
    - [ ] By vehicle
    - [ ] By depot
  - [ ] Create timetable entry
  - [ ] Update timetable entry
    - [ ] Reschedule
    - [ ] Reassign vehicle
    - [ ] Update destination
- Trip planner (optional)
  - [ ] Input source/destination depots
  - [ ] Return path defined in timetable

## Tasks

- Frontend
  - [ ] Create project (basic HTML/CSS/JS? Node? Any frameworks?)
  - [ ] Setup interface
  - [ ] Connect backend API
- Backend
  - [x] Setup project (Play)
  - [x] Define REST API routes
  - [x] Define data structures
  - [ ] Low-level SQL API
    - [ ] Connect Postgres database
    - [ ] Read SQL query from POST request
    - [ ] Return results
  - [ ] High level REST API
    - [ ] Define SQL queries
    - [ ] Apply queries to API functions
    - [ ] Add error handling
- Database
  - [x] Database Schema
  - [ ] Connect backend to database
- Integration
  - [x] Get Postgres working within Docker
  - [ ] Setup backend Docker image
    - [ ] Get Scala + SBT image working
    - [ ] Ensure backend docker can connect with Postgres
  - [ ] Setup frontend Docker image
    - [ ] Ensure frontend can access backend API
  - [ ] Docker Compose everything