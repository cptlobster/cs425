from fastapi import FastAPI, HTTPException, Body
from fastapi.middleware.cors import CORSMiddleware

import database as db
import queries as q

from routers import depots, fleet, packages, timetable

app = FastAPI()

origins = ["*"]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(depots.router)
app.include_router(fleet.router)
app.include_router(packages.router)
app.include_router(timetable.router)


@app.get("/")
async def root():
    return {"message": "Hello World"}


@app.post("/sql")
async def select(query: str = Body(...)):
    return q.read(query)


@app.post("/sql/write")
async def update(query: str = Body(...)):
    return q.write(query)
