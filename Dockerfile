FROM ubuntu:latest
RUN mkdir -p -- /app/server/ /app/frontend/
WORKDIR /app

COPY docker-compose.yml /app/
COPY /server/* /app/server/
COPY /frontend/* /app/frontend/

RUN ls -R /app/
RUN docker-compose up
