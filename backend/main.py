from fastapi import FastAPI, HTTPException, Body

import database as db

app = FastAPI()


@app.get("/")
async def root():
    return {"message": "Hello World"}


@app.post("/sql")
async def select(query: str = Body(...)):
    try:
        q = db.read(query)
        return q
    except Exception as e:
        return HTTPException(status_code=500, detail=str(e))


@app.post("/sql/write")
async def update(query: str = Body(...)):
    try:
        q = db.write(query)
        return q
    except Exception as e:
        return HTTPException(status_code=500, detail=str(e))
