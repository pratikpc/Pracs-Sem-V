import socket
def ToStr(string):
    return str(string)[2:-1]

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as server:
    server.bind(('localhost', 9000))
    server.listen()

    while True:
        conn, addr = server.accept()
        with conn:
            string = ToStr(conn.recv(1024))
            reversed = string[::-1]

            print(string, reversed)
            if reversed == string:
                conn.send(b'true')
            else:
                conn.send(b'false')
