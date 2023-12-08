from fastapi import APIRouter

import queries as q

router = APIRouter(prefix="/depots", tags=["depots"])


@router.get("/")
async def get_depots():
    query = """"""
    return q.read(query)


@router.get("/{id}")
async def get_depot(id):
    query = """"""
    return q.read(query)


@router.get("/{id}/nearby")
async def get_nearby_depots(id):
    query = """"""
    return q.read(query)
