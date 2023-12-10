# cs425
class project for CS425

## Overview
The application is setup to be deployed easily using Docker Compose. To test it, use:
```shell
docker compose up
```
from the main folder and the entire application will be setup.

The webpage can then be accessed at `http://localhost:8000`. The backend API can be accessed at `http://localhost:9000`.

## Intended Functionality within Webapp

- Packages
  - [x] List all packages
  - [x] Search for a package by ID
  - [ ] Update package status
    - [ ] Mark as delivered
    - [ ] Assign to vehicle
    - [ ] Assign to depot
  - [ ] Create new package
- Fleet
  - [x] List all vehicles
  - [ ] Update vehicle status
  - [ ] Update vehicle destination
  - [ ] Related Queries
    - [ ] List nearby depots within range
    - [ ] List packages assigned to vehicle
  - [ ] Create new vehicle
- Depots
  - [x] List all depots
  - [ ] Related Queries
    - [ ] List vehicles at depot
    - [ ] List packages at depot
    - [ ] List nearby depots
    - [ ] List vehicles with destination of this depot
- Timetable
  - [x] List entries
  - [ ] List entries by association
    - [ ] By vehicle
    - [ ] By depot
  - [ ] Create timetable entry
  - [ ] Update timetable entry
    - [ ] Reschedule
    - [ ] Reassign vehicle
    - [ ] Update destination


## Tasks

- Frontend
  - [x] Create project (basic HTML/CSS/JS? Node? Any frameworks?)
  - [x] Setup interface
  - [x] Connect backend API
- Backend
  - [x] Setup project (Python/FastAPI)
  - [x] Define REST API routes
  - [x] Define data structures
  - [x] Low-level SQL API
    - [x] Connect Postgres database
    - [x] Read SQL query from POST request
    - [x] Return results
  - [x] High level REST API
    - [x] Define SQL queries
    - [x] Apply queries to API functions
    - [ ] Add error handling
- Database
  - [x] Database Schema
  - [x] Connect backend to database
- Integration
  - [x] Get Postgres working within Docker
  - [x] Setup backend Docker image
    - [x] Python
    - [x] Ensure backend docker can connect with Postgres
  - [x] Setup frontend Docker image
    - [x] Ensure frontend can access backend API
  - [x] Docker Compose everything
