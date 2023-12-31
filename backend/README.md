# Backend API Documentation
This documentation explains how to utilize the REST API for the backend.

# Launching
First, install Python and setup a virtual environment:
```shell
python -m venv venv
source venv/bin/activate # for UNIX (i.e. Mac, Linux)
.\venv\Scripts\activate.bat # for Windows
```

To run within Docker (easier), use the following to build:
```shell
docker build -t backend .
```
Then the following to run:
```shell
docker run -d -p "9000:9000" backend
```
Using Docker-Compose is preferable because it handles ports automatically and will network the backend container with
the Postgres database.

```shell
# from base directory
docker compose up
```

# Request types
For any request to read resources, you use `GET` requests. For anything where you add or modify resources, use `POST`
requests, where the body contains the content as a JSON object.

# Tree
Rectangles are `GET` requests, rounded are `POST` requests.<br />
Any item that begins with `:` is a variable. For example, `:id` is the variable "id". These parameters will be
documented below.
```mermaid
flowchart LR
    ROOT["/"] --> SQL["/sql"] & PKGS["/packages"] & FLEET["/fleet"] & DEPOT["/depots"] & TT["/tt"]
    subgraph TTG[Timetable]
        TT --> TTID["/tt/:id"] & TTDATE["/tt/date/:date"] & TTFLT["/tt/fleet/:vehicle"] & TTDPT["/tt/depot/:depot"]  & TTADD(["/tt/new"])
        TTID --> TTDEL(["/tt/:id/delay"]) & TTRDR(["/tt/:id/redirect/:depot"]) & TTCHF(["/tt/:id/transfer/:vehicle"])
    end
    subgraph PKGG[Packages]
        PKGS --> PKGID["/packages/:id"] & PKGADD(["/packages/new"])
        PKGID --> PKGDEL(["/packages/:id/deliver"]) & PKGDPT(["/packages/:id/depot/:did"]) & PKGFLT(["/packages/:id/fleet/:did"])
    end
    subgraph FLTG[Fleet]
        FLEET --> FLTID["/fleet/:id"] & FLTADD(["/fleet/new"])
    end
    subgraph DPTG[Depots]
        DEPOT --> DPTID["/depots/:id"] & DPTADD(["/depots/new"])
    end
```

## Common Functionality
Base level `GET` requests (i.e. `/packages`, `/fleet`) will provide a list of entries in their proper JSON structure. <br />
Adding an ID number after the base request (i.e. `/packages/420`) will give you a single item.

`POST` requests require JSON in the request body, formatted as specified in the data structure.

## Responses
Successful queries will respond with OK (200) and the data requested.<br />
Depending on what went wrong during a query, a specific error code will throw:
- If an item is not found during a `GET` request, the server will respond with Not Found (404).
- If a list is empty during a `GET` request (i.e. a filter returns no results), the server will respond with No Content (301).
- If JSON syntax is malformed during a `POST` request, the server will respond with Bad Request (400).
- If a user is not properly authenticated, the server will respond with Unauthorized (401)
- If there is any other error, the server will respond with an Internal Server Error (500) whose content is the error
  message and stacktrace, if applicable.

## Data Structure
Each object structure is based on the case classes defined under `app/models`. In a case where multiple items are
requested, they will be returned as a list of JSON objects.

### Low-Level SQL API
You can use POST requests to `/sql` with the SQL query in the body to execute SQL queries directly. This is solely as a
fallback in case other functionality is not fully working.

Results are returned as a list of JSON objects, with the row names as keys. For example, with the table:

| a | b | c |
|---|---|---|
| 0 | 1 | 2 |
| 2 | 6 | 9 |

the query `SELECT * FROM table` would result in the following JSON:

```json
[
  {"a": 0, "b": 1, "c": 2},
  {"a": 2, "b": 6, "c": 9}
]
```

or `SELECT b, c FROM table WHERE b = 6` would result in the following JSON:

```json
[
  {"b": 6, "c": 9}
]
```

### Depots
The JSON structure of depots is as follows:
```json 
{
  "id": 0,
  "city": "Lynchburg, VA",
  "storage": {
    "used": 120.4,
    "capacity": 2300.0
  },
  "trucks": {
    "parked": 3,
    "capacity": 4
  },
  "planes": {
    "parked": 0,
    "capacity": 0
  },
  "trains": {
    "parked": 1,
    "capacity": 2
  }
}
```

### Fleet
The JSON structure of vehicles is as follows:
```json 
{
  "id": 0,
  "vehicle_type": "Truck",
  "range": 300,
  "storage": {
    "used": 140,
    "capacity": 200
  },
  "status": "In Transit"
}
```

### Packages
The JSON structure of packages is as follows:
```json 
{
  "id": 0,
  "dest": "Chicago, IL",
  "status": "In Transit",
  "category": "Electronics",
  "weight": 2.4,
  "value": 599.99,
  "vehicle": 0
}
```
`vehicle` is the ID number of the vehicle that the package is on. The key `depot` is used instead if the package is
stored in a depot.

### Timetable
The JSON structure of timetable entries is as follows:
```json 
{
  "id": 0,
  "vehicle": 1,
  "depot": {
    "source": 0,
    "dest": 4
  },
  "timestamps": {
    "departure": "2023-11-01T06:25:00Z",
    "arrival": "2023-11-01T12:40:00Z",
    "delay": 0
  }
}
```