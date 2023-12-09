from fastapi import APIRouter

import queries as q

router = APIRouter(prefix="/tt", tags=["timetable"])


@router.get("/")
async def get_timetable():
    query = """
SELECT
    timetable.id,
    timetable.fleet_id,
    timetable.source,
    departs.city AS source_city,
    timetable.dest,
    arrives.city AS dest_city,
    timetable.departure,
    timetable.arrival,
    timetable.diff
FROM timetable
    JOIN depots AS departs ON departs.id = timetable.source
    JOIN depots AS arrives ON arrives.id = timetable.dest
"""
    return q.read(query)

@router.get("/{id}")
async def get_entry(id):
    query = f"""
SELECT
    timetable.id,
    timetable.fleet_id,
    timetable.source,
    departs.city AS source_city,
    timetable.dest,
    arrives.city AS dest_city,
    timetable.departure,
    timetable.arrival,
    timetable.diff
FROM timetable
    JOIN depots AS departs ON departs.id = timetable.source
    JOIN depots AS arrives ON arrives.id = timetable.dest
WHERE id = {id}
"""
    return q.read(query)
