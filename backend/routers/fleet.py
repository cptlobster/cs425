from fastapi import APIRouter

import queries as q

router = APIRouter(prefix="/fleet", tags=["fleet", "vehicles"])


@router.get("/")
async def get_fleet():
    query = """"""
    return q.read(query)


@router.get("/{id}")
async def get_vehicle(id):
    query = """"""
    return q.read(query)
