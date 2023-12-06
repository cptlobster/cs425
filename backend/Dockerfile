# syntax=docker/dockerfile:1
FROM python:3.11-slim

COPY . .
# create virtual environment
RUN pip install -r requirements.txt

CMD python -m uvicorn main:app --reload