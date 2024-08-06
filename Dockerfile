FROM python:3.12
WORKDIR /
COPY . /
RUN pip install asyncio
RUN pip install websockets
CMD ["python", "main.py"]



