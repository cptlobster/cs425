from fastapi import APIRouter

import queries as q

router = APIRouter(prefix="/fleet", tags=["fleet", "vehicles"])


@router.get("/")
async def get_fleet():
    query = """
WITH weights AS (
    SELECT vehicle_id, SUM(wght) AS usage FROM packages GROUP BY vehicle_id
)

SELECT
    fleet.id,
    fleet.vehicle_type,
    fleet.rng,
    COALESCE(weights.usage, 0) AS usage,
    fleet.capacity,
    fleet.stat,
    fleet.destination,
    depots.city
FROM fleet
    JOIN depots ON fleet.destination = depots.id
    LEFT OUTER JOIN weights ON fleet.id = weights.vehicle_id
"""
    return q.read(query)


@router.get("/{id}")
async def get_vehicle(id):
    query = f"""
WITH weights AS (
    SELECT vehicle_id, SUM(wght) AS usage FROM packages GROUP BY vehicle_id
)

SELECT
    fleet.id,
    fleet.vehicle_type,
    fleet.rng,
    COALESCE(weights.usage, 0) AS usage,
    fleet.capacity,
    fleet.stat,
    fleet.destination,
    depots.city
FROM fleet
    JOIN depots ON fleet.destination = depots.id
    LEFT OUTER JOIN weights ON fleet.id = weights.vehicle_id
    WHERE fleet.id = {id}    
"""
    return q.read(query)
