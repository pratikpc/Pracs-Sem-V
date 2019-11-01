import socket
def ToStr(string):
    return str(string)[2:-1]

with socket.socket(socket.AF_INET, socket.SOCK_DGRAM) as server:
    server.bind(('localhost', 9000))

    while True:
        string = ToStr(server.recv(1024))
        reversed = string[::-1]

        print(string, reversed)
        if reversed == string:
            print(string, "is palindrome")
        else:
            print(string, "is not palindrome")
