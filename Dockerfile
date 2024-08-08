FROM ubuntu:latest
RUN mkdir -p -- /app/server/ /app/frontend/
WORKDIR /app

COPY docker-compose.yml /app/
COPY /server/* /app/server/
COPY /frontend/* /app/frontend/

RUN ls -R /app/
RUN docker build -f /server/py.Dockerfile
RUN docker build -f /frontend/frontend.Dockerfile
