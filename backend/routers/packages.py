from fastapi import APIRouter

import queries as q

router = APIRouter(prefix="/packages", tags=["packages"])


@router.get("/")
async def get_packages():
    query = """"""
    return q.read(query)


@router.get("/{id}")
async def get_package(id):
    query = """"""
    return q.read(query)