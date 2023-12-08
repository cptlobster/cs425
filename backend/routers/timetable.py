from fastapi import APIRouter

import queries as q

router = APIRouter(prefix="/tt", tags=["timetable"])


@router.get("/")
async def get_timetable():
    query = """SELECT * FROM timetable"""
    return q.read(query)


@router.get("/{id}")
async def get_entry(id):
    query = f"""SELECT * FROM timetable WHERE id = {id}"""
    return q.read(query)
