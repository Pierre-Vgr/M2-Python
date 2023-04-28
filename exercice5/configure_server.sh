#! /bin/bash

sudo apt update
sudo apt install python3 python3-pip python3-venv 

pip3 install Flask

mkdir web
touch web/app_flask.py web/blocked_ip.txt web/blocked_ip.json

echo "from flask import Flask, request
import json

app = Flask(__name__)

with open('web/blocked_ip.txt', 'r') as f:
    blocked_ips = [line.strip() for line in f]

with open('web/blocked_ip.json', 'r') as f:
    blocked_ips_json = json.load(f)

@app.route('/')
def check_ip():
    if request.remote_addr in blocked_ips:
        return 'Accès refusé'
    elif request.remote_addr in blocked_ips_json:
        return blocked_ips_json[request.remote_addr]
    else:
        return f'Connecté avec l\'adresse {request.remote_addr}'

if __name__ == '__main__':
    app.run()
" > web/app_flask.py

