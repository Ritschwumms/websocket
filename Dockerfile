FROM ubuntu:latest AS linux
RUN mkdir -p -- /app/server/ /app/frontend/
WORKDIR /app

COPY /server/* /app/server/
COPY /frontend/* /app/frontend/

RUN ls -R /app/


