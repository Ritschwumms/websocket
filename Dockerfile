#setup and copy
FROM ubuntu:latest AS linux
RUN mkdir -p -- /app/server/ /app/frontend/
WORKDIR /app

COPY /server/* /app/server/
COPY /frontend/* /app/frontend/

RUN ls -R /app/

#python app
FROM python:3.12 AS py
WORKDIR /server/

RUN pip install asyncio
RUN pip install websockets
EXPOSE 443
CMD ["python", "main.py"]

#frontend build



