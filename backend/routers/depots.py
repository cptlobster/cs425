from fastapi import APIRouter

import queries as q

router = APIRouter(prefix="/depots", tags=["depots"])


@router.get("/")
async def get_depots():
    query = """
WITH pkg_wts AS (
    SELECT
        depot_id,
        SUM(wght) AS usage
    FROM packages
    WHERE depot_id IS NOT NULL
    GROUP BY depot_id
),
consolidated_fleet AS (
    SELECT
        destination,
        CASE
            WHEN vehicle_type = 'tandem' THEN 'truck'
            ELSE vehicle_type
        END AS vehicle_type
    FROM fleet
),
veh_counts AS (
    SELECT
        destination,
        SUM(
            CASE
                WHEN vehicle_type = 'truck' THEN 1
                ELSE 0
            END
        ) AS trucks,
        SUM(
            CASE
                WHEN vehicle_type = 'train' THEN 1
                ELSE 0
            END
        ) AS trains,
        SUM(
            CASE
                WHEN vehicle_type = 'plane' THEN 1
                ELSE 0
            END
        ) AS planes
    FROM consolidated_fleet
    GROUP BY destination
)
SELECT
    depots.id,
    depots.city,
    COALESCE(pkg_wts.usage, 0) AS usage,
    depots.capacity,
    COALESCE(veh_counts.trucks, 0) AS trucks,
    truck_spaces,
    COALESCE(veh_counts.trains, 0) AS trains,
    plane_spaces,
    COALESCE(veh_counts.planes, 0) AS planes,
    train_spaces
FROM depots
    LEFT OUTER JOIN pkg_wts ON depots.id = pkg_wts.depot_id
    LEFT OUTER JOIN veh_counts ON depots.id = veh_counts.destination
"""
    return q.read(query)


@router.get("/{id}")
async def get_depot(id):
    query = f"""
WITH pkg_wts AS (
    SELECT
        depot_id,
        SUM(wght) AS usage
    FROM packages
    WHERE depot_id IS NOT NULL
    GROUP BY depot_id
),
consolidated_fleet AS (
    SELECT
        destination,
        CASE
            WHEN vehicle_type = 'tandem' THEN 'truck'
            ELSE vehicle_type
        END AS vehicle_type
    FROM fleet
),
veh_counts AS (
    SELECT
        destination,
        SUM(
            CASE
                WHEN vehicle_type = 'truck' THEN 1
                ELSE 0
            END
        ) AS trucks,
        SUM(
            CASE
                WHEN vehicle_type = 'train' THEN 1
                ELSE 0
            END
        ) AS trains,
        SUM(
            CASE
                WHEN vehicle_type = 'plane' THEN 1
                ELSE 0
            END
        ) AS planes
    FROM consolidated_fleet
    GROUP BY destination
)
SELECT
    depots.id,
    depots.city,
    COALESCE(pkg_wts.usage, 0) AS usage,
    depots.capacity,
    COALESCE(veh_counts.trucks, 0) AS trucks,
    truck_spaces,
    COALESCE(veh_counts.trains, 0) AS trains,
    plane_spaces,
    COALESCE(veh_counts.planes, 0) AS planes,
    train_spaces
FROM depots
    LEFT OUTER JOIN pkg_wts ON depots.id = pkg_wts.depot_id
    LEFT OUTER JOIN veh_counts ON depots.id = veh_counts.destination
    WHERE depots.id = {id}
"""
    return q.read(query)


@router.get("/{id}/packages")
async def get_packages():
    query = f"""
SELECT
    packages.id,
    packages.dest, 
    depots.city,
    packages.stat,
    packages.wght,
    packages.declared_value,
    packages.vehicle_id,
    packages.depot_id
FROM packages
    JOIN depots ON packages.dest = depots.id
    WHERE depot_id = {id}
"""
    return q.read(query)

@router.get("/{id}/vehicles")
async def get_fleet():
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
    WHERE fleet.destination = {id}
"""
    return q.read(query)


@router.get("/{id}/nearby")
async def get_nearby_depots(id):
    query = """"""
    return q.read(query)
