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


@router.get("/{id}/nearby")
async def get_nearby_depots(id):
    query = """"""
    return q.read(query)
