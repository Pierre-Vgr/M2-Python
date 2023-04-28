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

    if disk_usage.percent > 70 :
        logging.warning("L'espace maximal est presque atteint")
    elif disk_usage.percent > 80:
        logging.critical("L'espace maximal est atteint.")
    else:
        logging.info("Espace disque OK.")
    
    time.sleep(5)