from fastapi import APIRouter

import queries as q

router = APIRouter(prefix="/packages", tags=["packages"])


@router.get("/")
async def get_packages():
    query = """
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
"""
    return q.read(query)


@router.get("/{id}")
async def get_package(id):
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
WHERE packages.id = {id}
"""
    return q.read(query)