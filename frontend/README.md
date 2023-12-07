# Frontend

## Usage
Building:
```sh
cd frontend
docker build -t frontend .
```
Running:
```sh
docker run -p 8080:80 frontend
```
A very very quick way to test without building the entire container:
```sh
cd frontend
docker run -v "$(pwd)/src:/usr/local/apache2/htdocs" -p 8080:80 httpd
```