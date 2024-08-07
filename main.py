import websockets
import asyncio

all_clients = []

async def send_message(message, user):
    for client in all_clients:
        await client.send(f"{user} sent: {message}")

async def new_client_connected(client_socket, path):
    try:
        print("New client connected.")
        all_clients.append(client_socket)
        await send_message(f"{str(name)} joined.", client_socket)

        while True:
            new_message = await client_socket.recv()
            print(f"{name} sent: {new_message}")
            await send_message(new_message, client_socket)

    except:
        print("Disconnected.")
        index = all_clients.index(client_socket)
        all_clients.remove(client_socket)

async def start_server():
    print("Server starting...")
    await websockets.serve(new_client_connected, "", 443)
    print("Server started")

loop = asyncio.new_event_loop()
asyncio.set_event_loop(loop)
asyncio.run(start_server())
loop.run_forever()

