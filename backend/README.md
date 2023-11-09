# Backend API Documentation
This documentation explains how to utilize the REST API for the backend.

# Launching
To run locally, install some flavor of Java 11, as well as SBT. You can launch the API using:
```shell
sbt run
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

# Request types
For any request to read resources, you use `GET` requests. For anything where you add or modify resources, use `POST`
requests, where the body contains the content as a JSON object.

# Tree
Rectangles are `GET` requests, rounded are `POST` requests.<br />
Any item that begins with `:` is a variable. For example, `:id` is the variable "id". These parameters will be
documented below.
```mermaid
flowchart LR
    ROOT["/"] --> PKGS["/packages"] & FLEET["/fleet"] & DEPOT["/depots"] & TT["/tt"]
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
- If JSON syntax is malformed during a `POST` request, the server will respond with Bad Request (400).
- If a user is not properly authenticated, the server will respond with Unauthorized (401)
- If there is any other error, the server will respond with an Internal Server Error (500) whose content is the error
  message and stacktrace, if applicable.

## Data Structure

### Depots
The JSON structure of depots is as follows:
```json 
{}
```

### Fleet
The JSON structure of vehicles is as follows:
```json 
{}
```

### Packages
The JSON structure of packages is as follows:
```json 
{}
```

### Timetable
The JSON structure of timetable entries is as follows:
```json 
{}
```