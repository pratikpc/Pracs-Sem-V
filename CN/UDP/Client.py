def ToStr(string):
    return str(string)[2:-1]

import socket

with socket.socket(socket.AF_INET, socket.SOCK_DGRAM) as client:
    client.connect(('localhost', 9000))
    string = 'ABCBA'
    client.sendall(bytes(string, 'utf-8'))
