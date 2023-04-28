from flask import Flask, request

app = Flask(__name__)

with open('web/blocked_ip.txt', 'r') as f:
    blocked_ips = [line.strip() for line in f]

@app.route('/')
def check_ip():
    if request.remote_addr in blocked_ips:
        return 'Accès refusé'
    else:
        return f'Connecté avec l\'adresse {request.remote_addr}'

app.run()
