from fastapi import FastAPI, HTTPException, Body

import database as db
import queries as q

app = FastAPI()


@app.get("/")
async def root():
    return {"message": "Hello World"}


@app.post("/sql")
async def select(query: str = Body(...)):
    return q.read(query)


@app.post("/sql/write")
async def update(query: str = Body(...)):
    return q.write(query)
