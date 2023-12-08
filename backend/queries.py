from fastapi import HTTPException

import database as db


def read(query: str):
    try:
        q = db.read(query)
        return q
    except Exception as e:
        return HTTPException(status_code=500, detail=str(e))


def write(query: str):
    try:
        q = db.write(query)
        return q
    except Exception as e:
        return HTTPException(status_code=500, detail=str(e))
