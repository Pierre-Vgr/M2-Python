import psutil
import time
import os
import logging

logging.basicConfig(filename='check_bad_programs.log', level=logging.WARNING, format='%(asctime)s - %(levelname)s - %(message)s')

programs_to_kill = ['Teams.exe', 'chrome.exe', 'firefox.exe']

while True:
    disk_usage = psutil.disk_usage('/')

    for proc in psutil.process_iter():
        if proc.name in programs_to_kill:
            logging.warning(f"Killing {proc.name}")
            proc.kill()
        else :
            logging.info(f"Aucun processus interdit n'a été trouvé")

    if disk_usage.percent > 90:
        logging.error("Disk space is running low!")
    elif disk_usage.percent > 70:
        logging.warning("Disk space is getting low.")
    else:
        logging.info("Disk space is OK.")
    
    time.sleep(5)