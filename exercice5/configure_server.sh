#! /bin/bash

sudo apt update
sudo apt install python3 python3-pip python3-venv 

pip3 install Flask

mkdir web
touch web/app_flask.py web/blocked_ip.txt web/blocked_ip.json

echo "from flask import Flask, request

app = Flask(__name__)

with open('blocked_ip.txt', 'r') as f:
    blocked_ips = [line.strip() for line in f]

@app.route('/')
def check_ip():
    if request.remote_addr in blocked_ips:
        return 'Accès refusé'
    else:
        return f'Connecté avec l\'adresse {request.remote_addr}'

if __name__ == '__main__':
    app.run()" > web/app_flask.py

